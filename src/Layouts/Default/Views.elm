module Layouts.Default.Views exposing (..)

import Dict

import Fangorn.Routing exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import App.Pages exposing (..)


-- VIEWS

render : Model -> Html Msg
render model =
  span []
    [ menu model
    , div [ class "container container--layout" ]
        [ App.Pages.render model ]
    ]


menu : Model -> Html Msg
menu model =
  nav [ class "navbar navbar-inverse navbar-fixed-top" ]
    [ div [ class "container" ]
      [ div [ class "navbar-header" ] [ a [ class "navbar-brand" ] [ text "Project Name" ]]
      , div [ class "collapse navbar-collapse" ]
        [ ul [ class "nav navbar-nav" ]
          [ menuItem model "" "Home"
          , menuItem model "about" "About"
          , menuItem model "this-page-doesnt-exist" "404"
          ]
        ]
      ]
    ]


menuItem model location textString =
  let
    itemAttrs =
      case isPageActive model location of
        True ->
          [ class "active" ]
        False ->
          [ ]
  in
    li itemAttrs [
      a [ class "cursor-pointer", onClick (NavigateTo location) ]
        [ text textString ]
    ]


isPageActive model location =
  case List.head(model.location.path) of
    Just value ->
      location == value
    Nothing ->
      location == ""


currentQuery : Model -> Html msg
currentQuery model =
  let
    query =
      toString model.location.query
  in
    span [ class "labelQuery" ]
      [ text query ]
