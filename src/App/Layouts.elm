module App.Layouts exposing (..)

import Fangorn.Routing exposing (..)
import Html exposing (..)

import App.Routes exposing (..)
import App.Pages exposing (..)

import Layouts.Default.Views exposing (..)
import Layouts.Alternate.Views exposing (..)


-- VIEWS

render : Model -> Html Msg
render model =
  case model.route of
    NotFoundRoute ->
      Layouts.Alternate.Views.render model

    _ ->
      Layouts.Default.Views.render model
