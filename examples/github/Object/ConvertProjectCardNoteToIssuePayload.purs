module Examples.Github.Object.ConvertProjectCardNoteToIssuePayload where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__ConvertProjectCardNoteToIssuePayload, Scope__ProjectCard)
import Data.Maybe (Maybe)

clientMutationId :: SelectionSet
                    Scope__ConvertProjectCardNoteToIssuePayload
                    (Maybe
                     String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder

projectCard :: forall r . SelectionSet
                          Scope__ProjectCard
                          r -> SelectionSet
                               Scope__ConvertProjectCardNoteToIssuePayload
                               (Maybe
                                r)
projectCard = selectionForCompositeField
              "projectCard"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer
