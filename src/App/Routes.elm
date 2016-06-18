module App.Routes exposing (..)

import Dict
import Navigation
import Hop.Types exposing (Config, Query, Location, PathMatcher, Router)
import Hop.Matchers exposing (..)

routerConfig : Config Route
routerConfig =
  { hash = False
  , basePath = ""
  , matchers = matchers
  , notFound = NotFoundRoute
  }

{-|
Define a Union Type outlining each of the possible routes within the application.
-}

type Route
  = AboutRoute
  | HomeRoute
  | NotFoundRoute


{-|
Outline the URLs that can represent the Route Union Types.
-}

matchers : List (PathMatcher Route)
matchers =
  [ match1 HomeRoute ""
  , match1 AboutRoute "/about"
  ]
