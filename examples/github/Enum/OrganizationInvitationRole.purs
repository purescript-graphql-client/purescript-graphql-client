module Examples.Github.Enum.OrganizationInvitationRole where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - OrganizationInvitationRole
data OrganizationInvitationRole
  = DirectMember
  | Admin
  | BillingManager
  | Reinstate

fromToMap :: Array (Tuple String OrganizationInvitationRole)
fromToMap = [Tuple "DIRECT_MEMBER" DirectMember, Tuple "ADMIN" Admin, Tuple "BILLING_MANAGER" BillingManager, Tuple "REINSTATE" Reinstate]

instance organizationInvitationRoleGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder OrganizationInvitationRole where
  graphqlDefaultResponseScalarDecoder = enumDecoder "OrganizationInvitationRole" fromToMap

instance organizationInvitationRoleToGraphqlArgumentValue :: ToGraphqlArgumentValue OrganizationInvitationRole where
  toGraphqlArgumentValue =
    case _ of
      DirectMember -> ArgumentValueEnum "DIRECT_MEMBER"
      Admin -> ArgumentValueEnum "ADMIN"
      BillingManager -> ArgumentValueEnum "BILLING_MANAGER"
      Reinstate -> ArgumentValueEnum "REINSTATE"
