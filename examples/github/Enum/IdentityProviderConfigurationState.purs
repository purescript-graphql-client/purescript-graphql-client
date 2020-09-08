module Examples.Github.Enum.IdentityProviderConfigurationState where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - IdentityProviderConfigurationState
data IdentityProviderConfigurationState = Enforced | Configured | Unconfigured

derive instance eqIdentityProviderConfigurationState :: Eq IdentityProviderConfigurationState

derive instance ordIdentityProviderConfigurationState :: Ord IdentityProviderConfigurationState

fromToMap :: Array (Tuple String IdentityProviderConfigurationState)
fromToMap = [ Tuple "ENFORCED" Enforced
            , Tuple "CONFIGURED" Configured
            , Tuple "UNCONFIGURED" Unconfigured
            ]

instance identityProviderConfigurationStateGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                                  IdentityProviderConfigurationState where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "IdentityProviderConfigurationState"
                                        fromToMap

instance identityProviderConfigurationStateToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                     IdentityProviderConfigurationState where
  toGraphQLArgumentValue =
    case _ of
      Enforced -> ArgumentValueEnum "ENFORCED"
      Configured -> ArgumentValueEnum "CONFIGURED"
      Unconfigured -> ArgumentValueEnum "UNCONFIGURED"
