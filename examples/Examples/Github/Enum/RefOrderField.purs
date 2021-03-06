module Examples.Github.Enum.RefOrderField where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - RefOrderField
data RefOrderField = TagCommitDate | Alphabetical

derive instance genericRefOrderField :: Generic RefOrderField _

instance showRefOrderField :: Show RefOrderField where
  show = genericShow

derive instance eqRefOrderField :: Eq RefOrderField

derive instance ordRefOrderField :: Ord RefOrderField

fromToMap :: Array (Tuple String RefOrderField)
fromToMap = [ Tuple "TAG_COMMIT_DATE" TagCommitDate
            , Tuple "ALPHABETICAL" Alphabetical
            ]

instance refOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder RefOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "RefOrderField" fromToMap

instance refOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue RefOrderField where
  toGraphQLArgumentValue =
    case _ of
      TagCommitDate -> ArgumentValueEnum "TAG_COMMIT_DATE"
      Alphabetical -> ArgumentValueEnum "ALPHABETICAL"
