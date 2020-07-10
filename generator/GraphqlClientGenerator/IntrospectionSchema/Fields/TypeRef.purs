module GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef where

import Protolude
import Data.Identity
import GraphqlClient.Implementation

data InstorpectionQueryResult_TypeRef

kind :: SelectionSet InstorpectionQueryResult_TypeRef String
kind = selectionForField "kind" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet InstorpectionQueryResult_TypeRef (Maybe String)
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

ofType :: ∀ r . SelectionSet InstorpectionQueryResult_TypeRef r -> SelectionSet InstorpectionQueryResult_TypeRef (Maybe r)
ofType = selectionForCompositeField "ofType" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer