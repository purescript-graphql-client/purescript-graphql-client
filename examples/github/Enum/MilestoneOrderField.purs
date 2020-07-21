module Examples.Github.Enum.MilestoneOrderField where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - MilestoneOrderField
data MilestoneOrderField
  = DueDate
  | CreatedAt
  | UpdatedAt
  | Number

fromToMap :: Array (Tuple String MilestoneOrderField)
fromToMap = [Tuple "DUE_DATE" DueDate, Tuple "CREATED_AT" CreatedAt, Tuple "UPDATED_AT" UpdatedAt, Tuple "NUMBER" Number]

instance milestoneOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder MilestoneOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "MilestoneOrderField" fromToMap

instance milestoneOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue MilestoneOrderField where
  toGraphqlArgumentValue =
    case _ of
      DueDate -> ArgumentValueEnum "DUE_DATE"
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
      UpdatedAt -> ArgumentValueEnum "UPDATED_AT"
      Number -> ArgumentValueEnum "NUMBER"
