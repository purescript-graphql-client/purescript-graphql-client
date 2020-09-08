module Examples.Github.Enum.OrganizationInvitationRole where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - OrganizationInvitationRole
data OrganizationInvitationRole
  = DirectMember | Admin | BillingManager | Reinstate

derive instance eqOrganizationInvitationRole :: Eq OrganizationInvitationRole

derive instance ordOrganizationInvitationRole :: Ord OrganizationInvitationRole

fromToMap :: Array (Tuple String OrganizationInvitationRole)
fromToMap = [ Tuple "DIRECT_MEMBER" DirectMember
            , Tuple "ADMIN" Admin
            , Tuple "BILLING_MANAGER" BillingManager
            , Tuple "REINSTATE" Reinstate
            ]

instance organizationInvitationRoleGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                          OrganizationInvitationRole where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "OrganizationInvitationRole"
                                        fromToMap

instance organizationInvitationRoleToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                             OrganizationInvitationRole where
  toGraphQLArgumentValue =
    case _ of
      DirectMember -> ArgumentValueEnum "DIRECT_MEMBER"
      Admin -> ArgumentValueEnum "ADMIN"
      BillingManager -> ArgumentValueEnum "BILLING_MANAGER"
      Reinstate -> ArgumentValueEnum "REINSTATE"
