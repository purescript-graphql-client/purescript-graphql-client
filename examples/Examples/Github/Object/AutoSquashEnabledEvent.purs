module Examples.Github.Object.AutoSquashEnabledEvent where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__Actor, Scope__AutoSquashEnabledEvent, Scope__User, Scope__PullRequest)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime, Id)

actor
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__AutoSquashEnabledEvent (Maybe r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__AutoSquashEnabledEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

enabler
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__AutoSquashEnabledEvent (Maybe r)
enabler = selectionForCompositeField
          "enabler"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__AutoSquashEnabledEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

pullRequest
  :: forall r
   . SelectionSet Scope__PullRequest r
  -> SelectionSet Scope__AutoSquashEnabledEvent (Maybe r)
pullRequest = selectionForCompositeField
              "pullRequest"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer
