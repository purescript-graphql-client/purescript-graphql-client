module Examples.Github.Enum.OrgAddMemberAuditEntryPermission where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - OrgAddMemberAuditEntryPermission
data OrgAddMemberAuditEntryPermission = Read | Admin

derive instance eqOrgAddMemberAuditEntryPermission :: Eq OrgAddMemberAuditEntryPermission

derive instance ordOrgAddMemberAuditEntryPermission :: Ord OrgAddMemberAuditEntryPermission

fromToMap :: Array (Tuple String OrgAddMemberAuditEntryPermission)
fromToMap = [ Tuple "READ" Read, Tuple "ADMIN" Admin ]

instance orgAddMemberAuditEntryPermissionGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                                OrgAddMemberAuditEntryPermission where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "OrgAddMemberAuditEntryPermission"
                                        fromToMap

instance orgAddMemberAuditEntryPermissionToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                   OrgAddMemberAuditEntryPermission where
  toGraphQLArgumentValue =
    case _ of
      Read -> ArgumentValueEnum "READ"
      Admin -> ArgumentValueEnum "ADMIN"
