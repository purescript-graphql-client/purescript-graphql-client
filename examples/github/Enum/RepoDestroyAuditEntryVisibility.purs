module Examples.Github.Enum.RepoDestroyAuditEntryVisibility where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - RepoDestroyAuditEntryVisibility
data RepoDestroyAuditEntryVisibility = Internal | Private | Public

derive instance eqRepoDestroyAuditEntryVisibility :: Eq RepoDestroyAuditEntryVisibility

derive instance ordRepoDestroyAuditEntryVisibility :: Ord RepoDestroyAuditEntryVisibility

fromToMap :: Array (Tuple String RepoDestroyAuditEntryVisibility)
fromToMap = [ Tuple "INTERNAL" Internal
            , Tuple "PRIVATE" Private
            , Tuple "PUBLIC" Public
            ]

instance repoDestroyAuditEntryVisibilityGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                               RepoDestroyAuditEntryVisibility where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "RepoDestroyAuditEntryVisibility"
                                        fromToMap

instance repoDestroyAuditEntryVisibilityToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                  RepoDestroyAuditEntryVisibility where
  toGraphQLArgumentValue =
    case _ of
      Internal -> ArgumentValueEnum "INTERNAL"
      Private -> ArgumentValueEnum "PRIVATE"
      Public -> ArgumentValueEnum "PUBLIC"
