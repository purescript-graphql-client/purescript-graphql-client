module Examples.Github.Enum.SponsorsTierOrderField where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - SponsorsTierOrderField
data SponsorsTierOrderField = CreatedAt | MonthlyPriceInCents

derive instance eqSponsorsTierOrderField :: Eq SponsorsTierOrderField

derive instance ordSponsorsTierOrderField :: Ord SponsorsTierOrderField

fromToMap :: Array (Tuple String SponsorsTierOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt
            , Tuple "MONTHLY_PRICE_IN_CENTS" MonthlyPriceInCents
            ]

instance sponsorsTierOrderFieldGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                      SponsorsTierOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "SponsorsTierOrderField"
                                        fromToMap

instance sponsorsTierOrderFieldToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                         SponsorsTierOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
      MonthlyPriceInCents -> ArgumentValueEnum "MONTHLY_PRICE_IN_CENTS"
