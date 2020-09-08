module Examples.Github.Object.SecurityAdvisoryPackageVersion where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__SecurityAdvisoryPackageVersion)

identifier :: SelectionSet Scope__SecurityAdvisoryPackageVersion String
identifier = selectionForField
             "identifier"
             []
             graphqlDefaultResponseScalarDecoder
