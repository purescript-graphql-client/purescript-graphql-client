module Examples.Github.Enum.OauthApplicationCreateAuditEntryState where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - OauthApplicationCreateAuditEntryState
data OauthApplicationCreateAuditEntryState
  = Active | Suspended | PendingDeletion

derive instance eqOauthApplicationCreateAuditEntryState :: Eq OauthApplicationCreateAuditEntryState

derive instance ordOauthApplicationCreateAuditEntryState :: Ord OauthApplicationCreateAuditEntryState

fromToMap :: Array (Tuple String OauthApplicationCreateAuditEntryState)
fromToMap = [ Tuple "ACTIVE" Active
            , Tuple "SUSPENDED" Suspended
            , Tuple "PENDING_DELETION" PendingDeletion
            ]

instance oauthApplicationCreateAuditEntryStateGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                                     OauthApplicationCreateAuditEntryState where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "OauthApplicationCreateAuditEntryState"
                                        fromToMap

instance oauthApplicationCreateAuditEntryStateToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                        OauthApplicationCreateAuditEntryState where
  toGraphQLArgumentValue =
    case _ of
      Active -> ArgumentValueEnum "ACTIVE"
      Suspended -> ArgumentValueEnum "SUSPENDED"
      PendingDeletion -> ArgumentValueEnum "PENDING_DELETION"
