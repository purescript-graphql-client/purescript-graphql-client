module Examples.Github.Enum.ProjectState where

import Prelude
  ( class Eq
  , class Ord
  )
import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - ProjectState
data ProjectState
  = Open
  | Closed

derive instance eqProjectState :: Eq ProjectState

derive instance ordProjectState :: Ord ProjectState

fromToMap :: Array (Tuple String ProjectState)
fromToMap = [Tuple "OPEN" Open, Tuple "CLOSED" Closed]

instance projectStateGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder ProjectState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "ProjectState" fromToMap

instance projectStateToGraphqlArgumentValue :: ToGraphqlArgumentValue ProjectState where
  toGraphqlArgumentValue =
    case _ of
      Open -> ArgumentValueEnum "OPEN"
      Closed -> ArgumentValueEnum "CLOSED"