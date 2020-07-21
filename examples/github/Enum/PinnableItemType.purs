module Examples.Github.Enum.PinnableItemType where

import Prelude
import GraphqlClient
import Data.Tuple

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

fromToMap :: Array (Tuple String PinnableItemType)
fromToMap = [Tuple "REPOSITORY" Repository, Tuple "GIST" Gist, Tuple "ISSUE" Issue, Tuple "PROJECT" Project, Tuple "PULL_REQUEST" PullRequest, Tuple "USER" User, Tuple "ORGANIZATION" Organization, Tuple "TEAM" Team]

instance pinnableItemTypeGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder PinnableItemType where
  graphqlDefaultResponseScalarDecoder = enumDecoder "PinnableItemType" fromToMap

instance pinnableItemTypeToGraphqlArgumentValue :: ToGraphqlArgumentValue PinnableItemType where
  toGraphqlArgumentValue =
    case _ of
      Repository -> ArgumentValueEnum "REPOSITORY"
      Gist -> ArgumentValueEnum "GIST"
      Issue -> ArgumentValueEnum "ISSUE"
      Project -> ArgumentValueEnum "PROJECT"
      PullRequest -> ArgumentValueEnum "PULL_REQUEST"
      User -> ArgumentValueEnum "USER"
      Organization -> ArgumentValueEnum "ORGANIZATION"
      Team -> ArgumentValueEnum "TEAM"
