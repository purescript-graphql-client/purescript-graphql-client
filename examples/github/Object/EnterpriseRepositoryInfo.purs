module Examples.Github.Object.EnterpriseRepositoryInfo where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__EnterpriseRepositoryInfo)
import Examples.Github.Scalars (Id)

id :: SelectionSet Scope__EnterpriseRepositoryInfo Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isPrivate :: SelectionSet Scope__EnterpriseRepositoryInfo Boolean
isPrivate = selectionForField "isPrivate" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__EnterpriseRepositoryInfo String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

nameWithOwner :: SelectionSet Scope__EnterpriseRepositoryInfo String
nameWithOwner = selectionForField
                "nameWithOwner"
                []
                graphqlDefaultResponseScalarDecoder
