module Examples.Github.Object.CweConnection where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__CweEdge, Scope__CweConnection, Scope__Cwe, Scope__PageInfo)
import Data.Maybe (Maybe)

edges
  :: forall r
   . SelectionSet Scope__CweEdge r
  -> SelectionSet Scope__CweConnection (Maybe (Array (Maybe r)))
edges = selectionForCompositeField
        "edges"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

nodes
  :: forall r
   . SelectionSet Scope__Cwe r
  -> SelectionSet Scope__CweConnection (Maybe (Array (Maybe r)))
nodes = selectionForCompositeField
        "nodes"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pageInfo
  :: forall r
   . SelectionSet Scope__PageInfo r
  -> SelectionSet Scope__CweConnection r
pageInfo = selectionForCompositeField
           "pageInfo"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

totalCount :: SelectionSet Scope__CweConnection Int
totalCount = selectionForField
             "totalCount"
             []
             graphqlDefaultResponseScalarDecoder
