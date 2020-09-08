module Examples.Github.Enum.OrganizationOrderField where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - OrganizationOrderField
data OrganizationOrderField = CreatedAt | Login

derive instance eqOrganizationOrderField :: Eq OrganizationOrderField

derive instance ordOrganizationOrderField :: Ord OrganizationOrderField

fromToMap :: Array (Tuple String OrganizationOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt, Tuple "LOGIN" Login ]

instance organizationOrderFieldGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                      OrganizationOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "OrganizationOrderField"
                                        fromToMap

instance organizationOrderFieldToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                         OrganizationOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
      Login -> ArgumentValueEnum "LOGIN"
