module MyGeneratorTests.IntrospectionSpec where

import Affjax as Affjax
import Data.Argonaut.Core (Json)
import Data.Argonaut.Decode (JsonDecodeError, printJsonDecodeError)
import Data.Argonaut.Encode (encodeJson) as ArgonautCodecs.Encode
import Effect.Exception.Unsafe (unsafeThrow)
import GraphQLClient as GraphQLClient
import GraphQLClient.Implementation as GraphQLClient.Implementation
import GraphQLClientGenerator.IntrospectionSchema as GraphQLClientGenerator.IntrospectionSchema
import MyGeneratorTestUtils.GraphQLRequest (request)
import MyGeneratorTestUtils.IntrospectionQuery as MyGeneratorTestUtils.IntrospectionQuery
import Protolude
import Test.Spec as Test.Spec
import Test.Spec.Assertions (shouldEqual)

urls :: Array String
urls =
  [ "http://elm-graphql-normalize.herokuapp.com/"
  , "https://countries.trevorblades.com/"
  -- | , "https://swapi.graph.cool/"
  , "https://swapi-graphql.netlify.app/.netlify/functions/index" -- https://graphql.org/swapi-graphql/
  ]

includeDeprecated :: Boolean
includeDeprecated = false

introspectionQueryString = GraphQLClient.writeGraphQL (GraphQLClientGenerator.IntrospectionSchema.introspectionQuery (\_ _ -> unsafeThrow "I don’t care about decoder") includeDeprecated)

introspectionQueryDecoderForExternalJson :: Json -> Either JsonDecodeError GraphQLClientGenerator.IntrospectionSchema.InstorpectionQueryResult
introspectionQueryDecoderForExternalJson = GraphQLClient.getSelectionSetDecoder (GraphQLClientGenerator.IntrospectionSchema.introspectionQuery GraphQLClient.Implementation.fieldNameWithoutHash includeDeprecated)

introspectionQueryDecoderForJsonFromOurLibGeneratedQuery :: Json -> Either JsonDecodeError GraphQLClientGenerator.IntrospectionSchema.InstorpectionQueryResult
introspectionQueryDecoderForJsonFromOurLibGeneratedQuery = GraphQLClient.getSelectionSetDecoder (GraphQLClientGenerator.IntrospectionSchema.introspectionQuery GraphQLClient.Implementation.fieldNameWithHash includeDeprecated)

spec :: Test.Spec.Spec Unit
spec = Test.Spec.describe "Introspection spec" $ Test.Spec.parallel $ for_ urls (\url -> Test.Spec.it url do
  (expectedJson :: Json) <- request MyGeneratorTestUtils.IntrospectionQuery.introspectionQuery url { }
  (expectedParsed :: GraphQLClientGenerator.IntrospectionSchema.InstorpectionQueryResult) <- introspectionQueryDecoderForExternalJson expectedJson # (throwError <<< error <<< printJsonDecodeError) \/ pure

  (actualJson :: Json) <- GraphQLClient.post url GraphQLClient.defaultRequestOptions (ArgonautCodecs.Encode.encodeJson { query: introspectionQueryString })
    >>= (throwError <<< error <<< Affjax.printError) \/ (\response -> pure response.body)
    >>= (GraphQLClient.tryDecodeGraphQLResponse Right >>> pure)
    >>= (throwError <<< error <<< GraphQLClient.printGraphQLError) \/ pure

  (actualParsed :: GraphQLClientGenerator.IntrospectionSchema.InstorpectionQueryResult) <- introspectionQueryDecoderForJsonFromOurLibGeneratedQuery actualJson # (throwError <<< error <<< printJsonDecodeError) \/ pure

  actualParsed `shouldEqual` expectedParsed
)
