module Examples.Github.Enum.SecurityAdvisorySeverity where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - SecurityAdvisorySeverity
data SecurityAdvisorySeverity = Low | Moderate | High | Critical

derive instance eqSecurityAdvisorySeverity :: Eq SecurityAdvisorySeverity

derive instance ordSecurityAdvisorySeverity :: Ord SecurityAdvisorySeverity

fromToMap :: Array (Tuple String SecurityAdvisorySeverity)
fromToMap = [ Tuple "LOW" Low
            , Tuple "MODERATE" Moderate
            , Tuple "HIGH" High
            , Tuple "CRITICAL" Critical
            ]

instance securityAdvisorySeverityGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                        SecurityAdvisorySeverity where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "SecurityAdvisorySeverity"
                                        fromToMap

instance securityAdvisorySeverityToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                           SecurityAdvisorySeverity where
  toGraphQLArgumentValue =
    case _ of
      Low -> ArgumentValueEnum "LOW"
      Moderate -> ArgumentValueEnum "MODERATE"
      High -> ArgumentValueEnum "HIGH"
      Critical -> ArgumentValueEnum "CRITICAL"
