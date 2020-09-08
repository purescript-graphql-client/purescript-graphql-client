module Examples.Github.Object.JoinedGitHubContribution where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__JoinedGitHubContribution, Scope__User)
import Examples.Github.Scalars (DateTime, Uri)

isRestricted :: SelectionSet Scope__JoinedGitHubContribution Boolean
isRestricted = selectionForField
               "isRestricted"
               []
               graphqlDefaultResponseScalarDecoder

occurredAt :: SelectionSet Scope__JoinedGitHubContribution DateTime
occurredAt = selectionForField
             "occurredAt"
             []
             graphqlDefaultResponseScalarDecoder

resourcePath :: SelectionSet Scope__JoinedGitHubContribution Uri
resourcePath = selectionForField
               "resourcePath"
               []
               graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__JoinedGitHubContribution Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

user :: forall r . SelectionSet
                   Scope__User
                   r -> SelectionSet
                        Scope__JoinedGitHubContribution
                        r
user = selectionForCompositeField
       "user"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
