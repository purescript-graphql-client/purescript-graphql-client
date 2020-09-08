module Examples.Github.Enum.OrgRemoveBillingManagerAuditEntryReason where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - OrgRemoveBillingManagerAuditEntryReason
data OrgRemoveBillingManagerAuditEntryReason
  = TwoFactorRequirementNonCompliance
  | SamlExternalIdentityMissing
  | SamlSsoEnforcementRequiresExternalIdentity

derive instance eqOrgRemoveBillingManagerAuditEntryReason :: Eq OrgRemoveBillingManagerAuditEntryReason

derive instance ordOrgRemoveBillingManagerAuditEntryReason :: Ord OrgRemoveBillingManagerAuditEntryReason

fromToMap :: Array (Tuple String OrgRemoveBillingManagerAuditEntryReason)
fromToMap = [ Tuple
              "TWO_FACTOR_REQUIREMENT_NON_COMPLIANCE"
              TwoFactorRequirementNonCompliance
            , Tuple "SAML_EXTERNAL_IDENTITY_MISSING" SamlExternalIdentityMissing
            , Tuple
              "SAML_SSO_ENFORCEMENT_REQUIRES_EXTERNAL_IDENTITY"
              SamlSsoEnforcementRequiresExternalIdentity
            ]

instance orgRemoveBillingManagerAuditEntryReasonGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                                       OrgRemoveBillingManagerAuditEntryReason where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "OrgRemoveBillingManagerAuditEntryReason"
                                        fromToMap

instance orgRemoveBillingManagerAuditEntryReasonToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                          OrgRemoveBillingManagerAuditEntryReason where
  toGraphQLArgumentValue =
    case _ of
      TwoFactorRequirementNonCompliance -> ArgumentValueEnum
                                           "TWO_FACTOR_REQUIREMENT_NON_COMPLIANCE"
      SamlExternalIdentityMissing -> ArgumentValueEnum
                                     "SAML_EXTERNAL_IDENTITY_MISSING"
      SamlSsoEnforcementRequiresExternalIdentity -> ArgumentValueEnum
                                                    "SAML_SSO_ENFORCEMENT_REQUIRES_EXTERNAL_IDENTITY"
