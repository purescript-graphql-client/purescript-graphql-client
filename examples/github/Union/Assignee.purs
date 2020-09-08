module Examples.Github.Union.Assignee where

import GraphQLClient (SelectionSet, exhaustiveFragmentSelection, buildFragment)
import Examples.Github.Scopes
  ( Scope__Bot
  , Scope__Mannequin
  , Scope__Organization
  , Scope__User
  , Scope__Assignee
  )
import Data.Maybe (Maybe(..))
import Prelude (pure)

type Fragments decodesTo = { onBot :: SelectionSet Scope__Bot decodesTo
                           , onMannequin :: SelectionSet
                                            Scope__Mannequin
                                            decodesTo
                           , onOrganization :: SelectionSet
                                               Scope__Organization
                                               decodesTo
                           , onUser :: SelectionSet Scope__User decodesTo
                           }

fragments :: forall decodesTo . Fragments
                                decodesTo -> SelectionSet
                                             Scope__Assignee
                                             decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Bot" selections.onBot
                       , buildFragment "Mannequin" selections.onMannequin
                       , buildFragment "Organization" selections.onOrganization
                       , buildFragment "User" selections.onUser
                       ]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onBot: pure
                          Nothing
                 , onMannequin: pure
                                Nothing
                 , onOrganization: pure
                                   Nothing
                 , onUser: pure
                           Nothing
                 }
