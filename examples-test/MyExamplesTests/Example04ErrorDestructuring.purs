module MyExamplesTests.Example04ErrorDestructuring where

import GraphQLClient (GraphQLError(..), GraphQLUserErrorDetail(..), PossiblyParsedData(..), Scope__RootQuery, SelectionSet, defaultRequestOptions, graphqlQueryRequest, writeGraphQL)
import Protolude
import Data.Array.NonEmpty as NonEmptyArray

import Examples.Swapi.Query as Query
import Test.Spec (Spec, it) as Test.Spec
import Test.Spec.Assertions (fail, shouldEqual) as Test.Spec
import MyExamplesTests.Util

type Response = Maybe String

query :: SelectionSet Scope__RootQuery Response
query = Query.forcedError

expectedQuery :: String
expectedQuery = inlineAndTrim """
query {
  forcedError
}
"""

spec :: Test.Spec.Spec Unit
spec = Test.Spec.it "Example04ErrorDestructuring" do
  writeGraphQL query `Test.Spec.shouldEqual` expectedQuery

  (response :: Either (GraphQLError Response) Response) <- graphqlQueryRequest "https://elm-graphql.herokuapp.com" defaultRequestOptions query

  case response of
       Left (GraphQLUserError detail (ParsedData Nothing)) ->
         case NonEmptyArray.uncons detail of
              { head: GraphQLUserErrorDetail { message }, tail: [] } -> message `Test.Spec.shouldEqual` "Artificial error..."
              _ -> Test.Spec.fail "should be only 1"
       Left _ -> Test.Spec.fail "should be GraphQLUserError"
       Right _ -> Test.Spec.fail "should fail"
