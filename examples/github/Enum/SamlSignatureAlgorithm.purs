module Examples.Github.Enum.SamlSignatureAlgorithm where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - SamlSignatureAlgorithm
data SamlSignatureAlgorithm = RsaSha1 | RsaSha256 | RsaSha384 | RsaSha512

derive instance eqSamlSignatureAlgorithm :: Eq SamlSignatureAlgorithm

derive instance ordSamlSignatureAlgorithm :: Ord SamlSignatureAlgorithm

fromToMap :: Array (Tuple String SamlSignatureAlgorithm)
fromToMap = [ Tuple "RSA_SHA1" RsaSha1
            , Tuple "RSA_SHA256" RsaSha256
            , Tuple "RSA_SHA384" RsaSha384
            , Tuple "RSA_SHA512" RsaSha512
            ]

instance samlSignatureAlgorithmGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                      SamlSignatureAlgorithm where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "SamlSignatureAlgorithm"
                                        fromToMap

instance samlSignatureAlgorithmToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                         SamlSignatureAlgorithm where
  toGraphQLArgumentValue =
    case _ of
      RsaSha1 -> ArgumentValueEnum "RSA_SHA1"
      RsaSha256 -> ArgumentValueEnum "RSA_SHA256"
      RsaSha384 -> ArgumentValueEnum "RSA_SHA384"
      RsaSha512 -> ArgumentValueEnum "RSA_SHA512"
