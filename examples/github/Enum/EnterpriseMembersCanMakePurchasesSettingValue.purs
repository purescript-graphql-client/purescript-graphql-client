module Examples.Github.Enum.EnterpriseMembersCanMakePurchasesSettingValue where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - EnterpriseMembersCanMakePurchasesSettingValue
data EnterpriseMembersCanMakePurchasesSettingValue = Enabled | Disabled

derive instance eqEnterpriseMembersCanMakePurchasesSettingValue :: Eq EnterpriseMembersCanMakePurchasesSettingValue

derive instance ordEnterpriseMembersCanMakePurchasesSettingValue :: Ord EnterpriseMembersCanMakePurchasesSettingValue

fromToMap :: Array (Tuple String EnterpriseMembersCanMakePurchasesSettingValue)
fromToMap = [ Tuple "ENABLED" Enabled, Tuple "DISABLED" Disabled ]

instance enterpriseMembersCanMakePurchasesSettingValueGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                                             EnterpriseMembersCanMakePurchasesSettingValue where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "EnterpriseMembersCanMakePurchasesSettingValue"
                                        fromToMap

instance enterpriseMembersCanMakePurchasesSettingValueToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                                EnterpriseMembersCanMakePurchasesSettingValue where
  toGraphQLArgumentValue =
    case _ of
      Enabled -> ArgumentValueEnum "ENABLED"
      Disabled -> ArgumentValueEnum "DISABLED"
