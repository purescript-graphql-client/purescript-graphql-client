module Examples.Swapi.Interface.Character where

import Prelude
import GraphqlClient
import Data.Maybe
import Examples.Swapi.InputObject
import Type.Row
import Examples.Swapi.Scopes
import Examples.SwapiCustomScalars
import Examples.Swapi.Enum.Episode
import Examples.Swapi.Enum.Language
import Examples.Swapi.Enum.Phrase

appearsIn :: SelectionSet Scope__Character (Array Episode)
appearsIn = selectionForField "appearsIn" [] graphqlDefaultResponseScalarDecoder

avatarUrl :: SelectionSet Scope__Character String
avatarUrl = selectionForField "avatarUrl" [] graphqlDefaultResponseScalarDecoder

friends :: forall r . SelectionSet Scope__Character r -> SelectionSet Scope__Character (Array r)
friends = selectionForCompositeField "friends" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__Character Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__Character String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

type Fragments decodesTo = { onHuman :: SelectionSet Scope__Human decodesTo
                           , onDroid :: SelectionSet Scope__Droid decodesTo
                           }

fragments :: forall decodesTo . Fragments decodesTo -> SelectionSet Scope__Character decodesTo
fragments selections = exhaustiveFragmentSelection [buildFragment "Human" selections.onHuman, buildFragment "Droid" selections.onDroid]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onHuman: pure Nothing, onDroid: pure Nothing }
