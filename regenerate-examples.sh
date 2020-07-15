#!/usr/bin/env bash

set -euxo pipefail

rm -fdR examples/swapi

# the code of this server is here https://github.com/dillonkearns/graphqelm-demo/blob/master/lib/star_wars_web/schema.ex

spago run --main GraphqlClientGenerator.Main --node-args "--input-url https://elm-graphql.herokuapp.com/ --output examples/swapi --api Examples.Swapi --custom-scalars-module Examples.SwapiCustomScalars"
