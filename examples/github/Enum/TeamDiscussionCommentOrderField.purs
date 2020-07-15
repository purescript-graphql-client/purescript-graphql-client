module Examples.Github.Enum.TeamDiscussionCommentOrderField where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - TeamDiscussionCommentOrderField
data TeamDiscussionCommentOrderField
  = Number

fromToMap :: Array (Tuple String TeamDiscussionCommentOrderField)
fromToMap = [Tuple "NUMBER" Number]

instance teamDiscussionCommentOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder TeamDiscussionCommentOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "TeamDiscussionCommentOrderField" fromToMap

instance teamDiscussionCommentOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue TeamDiscussionCommentOrderField where
  toGraphqlArgumentValue =
    case _ of
      Number -> ArgumentValueString "NUMBER"