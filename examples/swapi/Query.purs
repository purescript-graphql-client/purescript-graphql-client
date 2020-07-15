module Examples.Swapi.Query where

import Prelude
import GraphqlClient
import Data.Maybe
import Examples.Swapi.InputObject
import Examples.Swapi.Enum.Episode
import Examples.Swapi.Enum.Language
import Examples.Swapi.Enum.Phrase
import Examples.Swapi.Scopes
import Examples.SwapiCustomScalars

type DroidInput = { id :: Id
                  }

droid :: forall r . DroidInput -> SelectionSet Scope__Droid r -> SelectionSet Scope__RootQuery (Maybe r)
droid input = selectionForCompositeField "droid" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

forcedError :: SelectionSet Scope__RootQuery (Maybe String)
forcedError = selectionForField "forcedError" [] graphqlDefaultResponseScalarDecoder

type GreetInput = { input :: Greeting
                  }

greet :: GreetInput -> SelectionSet Scope__RootQuery String
greet input = selectionForField "greet" (toGraphqlArguments input) graphqlDefaultResponseScalarDecoder

hello :: SelectionSet Scope__RootQuery String
hello = selectionForField "hello" [] graphqlDefaultResponseScalarDecoder

type HeroInput = { episode :: Optional Episode
                 }

hero :: forall r . HeroInput -> SelectionSet Scope__Character r -> SelectionSet Scope__RootQuery r
hero input = selectionForCompositeField "hero" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type HeroUnionInput = { episode :: Optional Episode
                      }

heroUnion :: forall r . HeroUnionInput -> SelectionSet Scope__CharacterUnion r -> SelectionSet Scope__RootQuery r
heroUnion input = selectionForCompositeField "heroUnion" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type HumanInput = { id :: Id
                  }

human :: forall r . HumanInput -> SelectionSet Scope__Human r -> SelectionSet Scope__RootQuery (Maybe r)
human input = selectionForCompositeField "human" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

now :: SelectionSet Scope__RootQuery PosixTime
now = selectionForField "now" [] graphqlDefaultResponseScalarDecoder

today :: SelectionSet Scope__RootQuery String
today = selectionForField "today" [] graphqlDefaultResponseScalarDecoder
