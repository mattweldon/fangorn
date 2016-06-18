module Main exposing (..)

import Dict
import Navigation
import Hop.Types exposing (Config, Query, Location, PathMatcher, Router)

import Fangorn.Routing exposing (urlUpdate, update, Model)

import App.Routes exposing (..)
import App.Layouts exposing (..)


{-|
Your init function will receive an initial payload from Navigation, this payload is the initial matched location.
Here we store the `route` and `location` in our model.
-}
init : ( Route, Hop.Types.Location ) -> ( Model, Cmd Fangorn.Routing.Msg )
init ( route, location ) =
  ( Model location route, Cmd.none )


{-|
Wire everything using Navigation.
-}
main : Program Never
main =
  Navigation.program Fangorn.Routing.urlParser
    { init = init
    , view = App.Layouts.render
    , update = update
    , urlUpdate = urlUpdate
    , subscriptions = (always Sub.none)
    }
