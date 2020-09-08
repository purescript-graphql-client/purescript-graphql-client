module Examples.Github.Enum.ProjectState where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - ProjectState
data ProjectState = Open | Closed

derive instance eqProjectState :: Eq ProjectState

derive instance ordProjectState :: Ord ProjectState

fromToMap :: Array (Tuple String ProjectState)
fromToMap = [ Tuple "OPEN" Open, Tuple "CLOSED" Closed ]

instance projectStateGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                            ProjectState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "ProjectState" fromToMap

instance projectStateToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                               ProjectState where
  toGraphQLArgumentValue =
    case _ of
      Open -> ArgumentValueEnum "OPEN"
      Closed -> ArgumentValueEnum "CLOSED"
