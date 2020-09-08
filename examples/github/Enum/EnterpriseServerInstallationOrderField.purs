module Examples.Github.Enum.EnterpriseServerInstallationOrderField where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - EnterpriseServerInstallationOrderField
data EnterpriseServerInstallationOrderField
  = HostName | CustomerName | CreatedAt

derive instance eqEnterpriseServerInstallationOrderField :: Eq EnterpriseServerInstallationOrderField

derive instance ordEnterpriseServerInstallationOrderField :: Ord EnterpriseServerInstallationOrderField

fromToMap :: Array (Tuple String EnterpriseServerInstallationOrderField)
fromToMap = [ Tuple "HOST_NAME" HostName
            , Tuple "CUSTOMER_NAME" CustomerName
            , Tuple "CREATED_AT" CreatedAt
            ]

instance enterpriseServerInstallationOrderFieldGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                                      EnterpriseServerInstallationOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "EnterpriseServerInstallationOrderField"
                                        fromToMap

instance enterpriseServerInstallationOrderFieldToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                         EnterpriseServerInstallationOrderField where
  toGraphQLArgumentValue =
    case _ of
      HostName -> ArgumentValueEnum "HOST_NAME"
      CustomerName -> ArgumentValueEnum "CUSTOMER_NAME"
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
