module GraphqlClientGenerator.Main where

import Protolude
import Protolude.Node

import Control.Monad.Reader.Trans (ReaderT(..), runReaderT)
import Control.Parallel (parTraverse)
import Data.Argonaut.Core as ArgonautCore
import Data.Argonaut.Decode (JsonDecodeError)
import Data.Argonaut.Decode as ArgonautDecoders
import Data.Argonaut.Parser as ArgonautCore
import Data.Array (filter)
import Data.Array (fromFoldable) as Array
import Data.Array (replicate)
import Data.Array.NonEmpty (NonEmptyArray)
import Data.Array.NonEmpty as NonEmptyArray
import Data.Either (Either(..))
import Data.Foldable (null, sequence_)
import Data.FunctorWithIndex (mapWithIndex)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Map (Map)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.NonEmpty (NonEmpty(..), (:|))
import Data.String (joinWith, take)
import Data.Symbol (SProxy(..))
import Data.TraversableWithIndex (forWithIndex)
import Effect.Aff (launchAff_)
import Effect.Class.Console (logShow, log)
import Effect.Exception (error)
import GraphqlClient as GraphqlClient
import GraphqlClientGenerator.IntrospectionSchema as GraphqlClientGenerator.IntrospectionSchema
import GraphqlClientGenerator.IntrospectionSchema.TypeKind as GraphqlClientGenerator.IntrospectionSchema
import GraphqlClientGenerator.GraphqlJs as GraphqlJs
import GraphqlClientGenerator.Options as GraphqlClientGenerator.Options
import GraphqlClientGenerator.PsAst as GraphqlClientGenerator.PsAst
import Foreign.Object (Object)
import Language.PS.AST (ModuleName(..))
import Node.Encoding (Encoding(..))
import Node.FS.Aff as Node.FS.Aff
import Node.FS.Aff.Mkdirp as Node.FS.Aff.Mkdirp
import Node.Path (FilePath)
import Node.Path (concat, resolve) as Node.FS
import Options.Applicative (execParser)
import Protolude.Url (Url)
import Protolude.Url as Url
import Record.Homogeneous (foldMapValuesWithIndexL)

greet :: GraphqlClientGenerator.Options.AppOptions -> Effect Unit
greet (GraphqlClientGenerator.Options.AppOptions { input, output, api }) = log $ "Hello, " <> show input <> show output <> show api

type App a = ReaderT GraphqlClientGenerator.Options.AppOptions Aff a

includeDeprecated :: Boolean
includeDeprecated = true

introspectionQuery :: GraphqlClient.SelectionSet GraphqlClient.RootQuery GraphqlClientGenerator.IntrospectionSchema.InstorpectionQueryResult
introspectionQuery = GraphqlClientGenerator.IntrospectionSchema.introspectionQuery includeDeprecated

introspectionQueryString :: String
introspectionQueryString = GraphqlClient.writeGraphql introspectionQuery

introspectionQueryDecoder :: ArgonautCore.Json -> Either JsonDecodeError GraphqlClientGenerator.IntrospectionSchema.InstorpectionQueryResult
introspectionQueryDecoder = GraphqlClient.getSelectionSetDecoder introspectionQuery

dirIsEmpty :: FilePath -> Aff Boolean
dirIsEmpty filepath = Node.FS.Aff.readdir filepath <#> null

main :: Effect Unit
main = do
  (GraphqlClientGenerator.Options.AppOptions appOptions) <- execParser GraphqlClientGenerator.Options.opts

  launchAff_ do
    (instorpectionQueryResult :: GraphqlClientGenerator.IntrospectionSchema.InstorpectionQueryResult) <-
      case appOptions.input of
        (GraphqlClientGenerator.Options.AppOptionsInputSchemaOrJsonUrl url) -> do
          let
            urlString = unwrap url

          resp <- GraphqlClient.gqlRequest urlString introspectionQuery
            >>= (throwError <<< error <<< GraphqlClient.printGraphqlError) \/ pure

          pure resp
        (GraphqlClientGenerator.Options.AppOptionsInputSchemaPath filepath) -> do
          text <- Node.FS.Aff.readTextFile UTF8 filepath

          json <- GraphqlJs.generateIntrospectionJsonFromSchema text # throwError \/ pure

          introspectionQueryDecoder json # (throwError <<< error <<< ArgonautDecoders.printJsonDecodeError) \/ pure
        (GraphqlClientGenerator.Options.AppOptionsInputJsonPath filepath) -> do
          text <- Node.FS.Aff.readTextFile UTF8 filepath
          json <- ArgonautCore.jsonParser text # (throwError <<< error) \/ pure

          GraphqlClient.tryDecodeGraphqlResponse introspectionQueryDecoder json # (throwError <<< error <<< GraphqlClient.printGraphqlError) \/ pure

    outputDirAbs <- liftEffect $ Node.FS.resolve [] appOptions.output -- like realpath, but doesnt throw errors

    whenM (Node.FS.Aff.exists outputDirAbs) do
      isEmpty <- dirIsEmpty outputDirAbs
      unless isEmpty (exitWith 1 $ "Output dir " <> (show outputDirAbs) <> " is non empty. Cannot write files to it.")

    let
      filesMap = GraphqlClientGenerator.PsAst.mkFilesMap appOptions.api instorpectionQueryResult

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

    foldMapValuesWithIndexL printModuleForDirs filesMap.dirs
    foldMapValuesWithIndexL printModuleForFiles filesMap.files

        -- let dir = "examples/countries"
        -- void $ Node.FS.Aff.Mkdirp.mkdirp dir
        -- writePurescriptFiles dir $ onlyObjects >>> (filter (not <<< isSchemaObject)) $ queryResult.data
  -- where
  --   writePurescriptFiles :: String -> Array GraphqlClientGenerator.IntrospectionSchema.TypeResult -> Aff Unit
  --   writePurescriptFiles dir objectTypes = do
  --     _ <- parTraverse (writePurescriptFile dir) objectTypes
  --     pure unit

  --   writePurescriptFile :: String -> GraphqlClientGenerator.IntrospectionSchema.TypeResult -> Aff Unit
  --   writePurescriptFile dir object = do
  --     case object.name of
  --       Just name -> writeTextFile UTF8 (dir <> "/" <> name <> ".purs") $ generateForObject object
  --       Nothing -> pure unit

  --   generateForObject :: GraphqlClientGenerator.IntrospectionSchema.TypeResult -> String
  --   generateForObject object = case object.name of
  --     Just name ->
  --       "module Text."
  --         <> name
  --         <> generateForFields name object.fields
  --     Nothing -> ""

  --   generateForFields :: String -> Maybe (Array GraphqlClientGenerator.IntrospectionSchema.FieldResult) -> String
  --   generateForFields onObject = case _ of
  --     Just fields -> joinWith "\n" ((generateForField onObject) <$> fields)
  --     Nothing -> ""

  --   generateForField :: String -> GraphqlClientGenerator.IntrospectionSchema.FieldResult -> String
  --   generateForField onObject field =
  --     field.name
  --       <> " :: SelectionSet ("
  --       <> field.name
  --       <> " :: ?) "
  --       <> onObject

  --   onlyObjects :: (Record GraphqlClientGenerator.IntrospectionSchema.Result) -> Array GraphqlClientGenerator.IntrospectionSchema.TypeResult
  --   onlyObjects result = filter (\t -> t.kind == GraphqlClientGenerator.IntrospectionSchema.TypeKind.Object) result.__schema.types

  --   objectNames :: Array GraphqlClientGenerator.IntrospectionSchema.TypeResult -> Array (Maybe String)
  --   objectNames = map _.name

  --   isSchemaObject :: forall a. { name :: Maybe String | a } -> Boolean
  --   isSchemaObject object = case object.name of
  --     Just name -> (take 2 name) == "__"
  --     Nothing -> false