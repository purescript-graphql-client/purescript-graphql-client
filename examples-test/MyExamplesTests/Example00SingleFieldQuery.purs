module MyExamplesTests.Example00SingleFieldQuery where

import Control.Monad.Error.Class (throwError)
import Effect.Exception (error)
import MyExamplesTests.Util (inlineAndTrim)
import Prelude
import Data.Either (Either, either)
import Data.Maybe (Maybe(..))
import Examples.Swapi.Object.Human (id)
import Examples.Swapi.Query (human)
import Examples.SwapiCustomScalars (Id(..))
import GraphQLClient (GraphQLError, Scope__RootQuery, SelectionSet, defaultRequestOptions, graphqlQueryRequest, printGraphQLError, writeGraphQL)
import Test.Spec (Spec, it) as Test.Spec
import Test.Spec.Assertions (shouldEqual) as Test.Spec

type Response
  = Maybe Id

query :: SelectionSet Scope__RootQuery Response
query = human { id: Id 1001 } id

expectedQuery :: String
expectedQuery =
  inlineAndTrim
    """
query {
  human6079143653279091: human(id: "1001") {
    id
  }
}
"""

spec :: Test.Spec.Spec Unit
spec =
  Test.Spec.it "Example00SingleFieldQuery" do
    writeGraphQL query `Test.Spec.shouldEqual` expectedQuery
    (response :: Either (GraphQLError Response) Response) <- graphqlQueryRequest "https://elm-graphql.herokuapp.com" defaultRequestOptions query
    (response' :: Response) <- either (throwError <<< error <<< printGraphQLError) pure $ response
    response' `Test.Spec.shouldEqual` Just (Id 1001)
