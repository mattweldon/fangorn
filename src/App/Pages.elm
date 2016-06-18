module App.Pages exposing (..)

import Fangorn.Routing exposing (..)
import Html exposing (..)

import App.Routes exposing (..)

import Pages.Home.Views exposing (..)
import Pages.About.Views exposing (..)
import Pages.NotFound.Views exposing (..)

{-|
Views can decide what to show using `model.route`.
-}
render : Model -> Html Msg
render model =
  case model.route of
    HomeRoute ->
      Pages.Home.Views.render model

    AboutRoute ->
      Pages.About.Views.render model

    NotFoundRoute ->
      Pages.NotFound.Views.render model
