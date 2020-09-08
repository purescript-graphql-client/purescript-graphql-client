module Examples.Github.Enum.ProjectColumnPurpose where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - ProjectColumnPurpose
data ProjectColumnPurpose = Todo | InProgress | Done

derive instance eqProjectColumnPurpose :: Eq ProjectColumnPurpose

derive instance ordProjectColumnPurpose :: Ord ProjectColumnPurpose

fromToMap :: Array (Tuple String ProjectColumnPurpose)
fromToMap = [ Tuple "TODO" Todo
            , Tuple "IN_PROGRESS" InProgress
            , Tuple "DONE" Done
            ]

instance projectColumnPurposeGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                    ProjectColumnPurpose where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "ProjectColumnPurpose"
                                        fromToMap

instance projectColumnPurposeToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                       ProjectColumnPurpose where
  toGraphQLArgumentValue =
    case _ of
      Todo -> ArgumentValueEnum "TODO"
      InProgress -> ArgumentValueEnum "IN_PROGRESS"
      Done -> ArgumentValueEnum "DONE"
