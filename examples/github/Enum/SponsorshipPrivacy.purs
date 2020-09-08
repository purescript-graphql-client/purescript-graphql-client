module Examples.Github.Enum.SponsorshipPrivacy where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - SponsorshipPrivacy
data SponsorshipPrivacy = Public | Private

derive instance eqSponsorshipPrivacy :: Eq SponsorshipPrivacy

derive instance ordSponsorshipPrivacy :: Ord SponsorshipPrivacy

fromToMap :: Array (Tuple String SponsorshipPrivacy)
fromToMap = [ Tuple "PUBLIC" Public, Tuple "PRIVATE" Private ]

instance sponsorshipPrivacyGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                  SponsorshipPrivacy where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "SponsorshipPrivacy"
                                        fromToMap

instance sponsorshipPrivacyToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                     SponsorshipPrivacy where
  toGraphQLArgumentValue =
    case _ of
      Public -> ArgumentValueEnum "PUBLIC"
      Private -> ArgumentValueEnum "PRIVATE"
