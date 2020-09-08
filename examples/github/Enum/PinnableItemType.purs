module Examples.Github.Enum.PinnableItemType where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - PinnableItemType
data PinnableItemType
  = Repository
  | Gist
  | Issue
  | Project
  | PullRequest
  | User
  | Organization
  | Team

derive instance eqPinnableItemType :: Eq PinnableItemType

derive instance ordPinnableItemType :: Ord PinnableItemType

fromToMap :: Array (Tuple String PinnableItemType)
fromToMap = [ Tuple "REPOSITORY" Repository
            , Tuple "GIST" Gist
            , Tuple "ISSUE" Issue
            , Tuple "PROJECT" Project
            , Tuple "PULL_REQUEST" PullRequest
            , Tuple "USER" User
            , Tuple "ORGANIZATION" Organization
            , Tuple "TEAM" Team
            ]

instance pinnableItemTypeGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                PinnableItemType where
  graphqlDefaultResponseScalarDecoder = enumDecoder "PinnableItemType" fromToMap

instance pinnableItemTypeToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                   PinnableItemType where
  toGraphQLArgumentValue =
    case _ of
      Repository -> ArgumentValueEnum "REPOSITORY"
      Gist -> ArgumentValueEnum "GIST"
      Issue -> ArgumentValueEnum "ISSUE"
      Project -> ArgumentValueEnum "PROJECT"
      PullRequest -> ArgumentValueEnum "PULL_REQUEST"
      User -> ArgumentValueEnum "USER"
      Organization -> ArgumentValueEnum "ORGANIZATION"
      Team -> ArgumentValueEnum "TEAM"
