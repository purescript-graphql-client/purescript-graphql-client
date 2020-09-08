module GraphQLClientGenerator.Main where

import Protolude

import Control.Monad.Reader.Trans (ReaderT)
import Data.Argonaut.Core (Json) as ArgonautCore
import Data.Argonaut.Decode (JsonDecodeError)
import Data.Argonaut.Decode as ArgonautDecoders
import Data.Argonaut.Parser (jsonParser) as ArgonautCore
import Data.Foldable (null)
import Data.Map (Map)
import Data.TraversableWithIndex (forWithIndex)
import Effect.Exception.Unsafe (unsafeThrow)
import GraphQLClient as GraphQLClient
import GraphQLClient.Implementation as GraphQLClient.Implementation
import GraphQLClientGenerator.GraphQLJs as GraphQLJs
import GraphQLClientGenerator.IntrospectionSchema as GraphQLClientGenerator.IntrospectionSchema
import GraphQLClientGenerator.Options as GraphQLClientGenerator.Options
import GraphQLClientGenerator.PsCst as GraphQLClientGenerator.PsCst
import Node.Encoding (Encoding(..))
import Node.FS.Aff as Node.FS.Aff
import Node.FS.Aff.Mkdirp as Node.FS.Aff.Mkdirp
import Node.Path (FilePath)
import Node.Path (concat, resolve) as Node.FS
import Options.Applicative (execParser)
import Protolude.Node (exitWith)
import Record.Homogeneous (foldMapValuesWithIndexL)

type App a = ReaderT GraphQLClientGenerator.Options.AppOptions Aff a

includeDeprecated :: Boolean
includeDeprecated = true

introspectionQueryString :: String
introspectionQueryString = GraphQLClient.writeGraphQL (GraphQLClientGenerator.IntrospectionSchema.introspectionQuery (\_ _ -> unsafeThrow "I don’t care about decoder") includeDeprecated)

introspectionQueryDecoderForExternalJson :: ArgonautCore.Json -> Either JsonDecodeError GraphQLClientGenerator.IntrospectionSchema.InstorpectionQueryResult
introspectionQueryDecoderForExternalJson = GraphQLClient.getSelectionSetDecoder (GraphQLClientGenerator.IntrospectionSchema.introspectionQuery GraphQLClient.Implementation.fieldNameWithoutHash includeDeprecated)

dirIsEmpty :: FilePath -> Aff Boolean
dirIsEmpty filepath = Node.FS.Aff.readdir filepath <#> null

main :: Effect Unit
main = do
  (GraphQLClientGenerator.Options.AppOptions appOptions) <- execParser GraphQLClientGenerator.Options.opts

  launchAff_ do
    (instorpectionQueryResult :: GraphQLClientGenerator.IntrospectionSchema.InstorpectionQueryResult) <-
      case appOptions.input of
        (GraphQLClientGenerator.Options.AppOptionsInputSchemaOrJsonUrl url) -> do
          let
            urlString = unwrap url
            opts = GraphQLClient.defaultRequestOptions { headers = appOptions.headers }

          resp <- GraphQLClient.graphqlQueryRequest urlString opts (GraphQLClientGenerator.IntrospectionSchema.introspectionQuery GraphQLClient.Implementation.fieldNameWithHash includeDeprecated)
            >>= (throwError <<< error <<< GraphQLClient.printGraphQLError) \/ pure

          pure resp
        (GraphQLClientGenerator.Options.AppOptionsInputSchemaPath filepath) -> do
          text <- Node.FS.Aff.readTextFile UTF8 filepath

          json <- GraphQLJs.generateIntrospectionJsonFromSchema text # throwError \/ pure

          introspectionQueryDecoderForExternalJson json # (throwError <<< error <<< ArgonautDecoders.printJsonDecodeError) \/ pure
        (GraphQLClientGenerator.Options.AppOptionsInputJsonPath filepath) -> do
          text <- Node.FS.Aff.readTextFile UTF8 filepath
          json <- ArgonautCore.jsonParser text # (throwError <<< error) \/ pure

          GraphQLClient.tryDecodeGraphQLResponse introspectionQueryDecoderForExternalJson json # (throwError <<< error <<< GraphQLClient.printGraphQLError) \/ pure

    outputDirAbs <- liftEffect $ Node.FS.resolve [] appOptions.output -- like realpath, but doesn’t throw errors

    whenM (Node.FS.Aff.exists outputDirAbs) do
      isEmpty <- dirIsEmpty outputDirAbs
      unless isEmpty (exitWith 1 $ "Output dir " <> (show outputDirAbs) <> " is non empty. Cannot write files to it.")

    let
      filesMap = GraphQLClientGenerator.PsCst.mkFilesMap appOptions.customScalarsModule appOptions.api instorpectionQueryResult

      printModule :: FilePath -> String -> String -> Aff Unit
      printModule outputDir fileName content = do
        let
          outputFile :: FilePath
          outputFile = fileName <> ".purs"

          outputPath :: FilePath
          outputPath = Node.FS.concat [outputDir, outputFile]
        void $ Node.FS.Aff.Mkdirp.mkdirp outputDir
        Node.FS.Aff.writeTextFile UTF8 outputPath content
        pure unit

      printModuleForDirs :: String -> Map String String -> Aff Unit
      printModuleForDirs dirName mapOfFilenameAndContent =
        let
          outputDir :: FilePath
          outputDir = (Node.FS.concat $ [outputDirAbs, dirName])
        in
          void (forWithIndex mapOfFilenameAndContent (printModule outputDir))

      printModuleForFiles :: String -> String -> Aff Unit
      printModuleForFiles fileName content =
        let
          outputDir :: FilePath
          outputDir = outputDirAbs
        in
          void (printModule outputDir fileName content)

      printModuleForMaybeFiles :: String -> Maybe String -> Aff Unit
      printModuleForMaybeFiles fileName = maybe (pure unit) \content ->
        let
          outputDir :: FilePath
          outputDir = outputDirAbs
        in
          void (printModule outputDir fileName content)

    foldMapValuesWithIndexL printModuleForDirs filesMap.dirs
    foldMapValuesWithIndexL printModuleForFiles filesMap.files
    foldMapValuesWithIndexL printModuleForMaybeFiles filesMap.maybeFiles
