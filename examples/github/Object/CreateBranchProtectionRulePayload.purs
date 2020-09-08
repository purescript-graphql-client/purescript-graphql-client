module Examples.Github.Object.CreateBranchProtectionRulePayload where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__BranchProtectionRule, Scope__CreateBranchProtectionRulePayload)
import Data.Maybe (Maybe)

branchProtectionRule :: forall r . SelectionSet
                                   Scope__BranchProtectionRule
                                   r -> SelectionSet
                                        Scope__CreateBranchProtectionRulePayload
                                        (Maybe
                                         r)
branchProtectionRule = selectionForCompositeField
                       "branchProtectionRule"
                       []
                       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

clientMutationId :: SelectionSet
                    Scope__CreateBranchProtectionRulePayload
                    (Maybe
                     String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder
