module Examples.Swapi.Union.CharacterUnion where

import GraphQLClient (SelectionSet, exhaustiveFragmentSelection, buildFragment)
import Examples.Swapi.Scopes (Scope__Droid, Scope__Human, Scope__CharacterUnion)
import Data.Maybe (Maybe(..))
import Prelude (pure)

type Fragments decodesTo = { onDroid :: SelectionSet Scope__Droid decodesTo
                           , onHuman :: SelectionSet Scope__Human decodesTo
                           }

fragments :: forall decodesTo . Fragments
                                decodesTo -> SelectionSet
                                             Scope__CharacterUnion
                                             decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Droid" selections.onDroid
                       , buildFragment "Human" selections.onHuman
                       ]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onDroid: pure Nothing, onHuman: pure Nothing }
