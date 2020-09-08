module Examples.Github.Object.CommentDeletedEvent where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes (Scope__Actor, Scope__CommentDeletedEvent)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime, Id)

actor :: forall r . SelectionSet
                    Scope__Actor
                    r -> SelectionSet
                         Scope__CommentDeletedEvent
                         (Maybe
                          r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__CommentDeletedEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__CommentDeletedEvent (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__CommentDeletedEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder
