module MyExamplesTests.Example12Mutation where

import MyExamplesTests.Util (inlineAndTrim)

import Examples.Swapi.Mutation as Mutation
import GraphQLClient (GraphQLError, Scope__RootMutation, SelectionSet, defaultRequestOptions, graphqlMutationRequest, printGraphQLError, writeGraphQL)
import Protolude
import Test.Spec (Spec, it) as Test.Spec
import Test.Spec.Assertions (shouldEqual) as Test.Spec

type Response = Int

mutation :: SelectionSet Scope__RootMutation Response
mutation = Mutation.increment

expectedMutation :: String
expectedMutation = inlineAndTrim """
mutation {
  increment
}
"""

spec :: Test.Spec.Spec Unit
spec = Test.Spec.it "Example12Mutation" do
  writeGraphQL mutation `Test.Spec.shouldEqual` expectedMutation

  (response :: Either (GraphQLError Response) Response) <- graphqlMutationRequest "https://elm-graphql.herokuapp.com" defaultRequestOptions mutation

  void $ (throwError <<< error <<< printGraphQLError) \/ pure $ response
