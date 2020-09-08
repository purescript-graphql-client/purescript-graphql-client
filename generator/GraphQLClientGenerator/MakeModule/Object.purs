module GraphQLClientGenerator.MakeModule.Object where

import Data.Array.NonEmpty (NonEmptyArray)
import GraphQLClientGenerator.IntrospectionSchema (InstorpectionQueryResult__FullType)
import GraphQLClientGenerator.MakeModule.Lib.DeclarationsForFields as DeclarationsForFields

import Language.PS.SmartCST (Module(..), ModuleName)
import Protolude

makeModule
  :: (String -> String)
  -> ModuleName
  -> NonEmptyArray String
  -> Array String
  -> Array String
  -> ModuleName
  -> InstorpectionQueryResult__FullType
  -> Module
makeModule nameToScope scalarModule apiModuleName instorpectionQueryResult__FullType__enum_names instorpectionQueryResult__FullType__interface_names moduleName fullType =
  Module
  { moduleName
  , exports: []
  , declarations: DeclarationsForFields.declarationsForFields { apiModuleName, scalarModule } nameToScope fullType.name (fromMaybe [] fullType.fields)
  }
