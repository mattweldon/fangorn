module Pages.Home.Views exposing (..)

import Fangorn.Routing exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- VIEWS

render : Model -> Html Msg
render model =
  div [ class "starter-template"]
    [ h1 [ class "title" ] [ text "Home Page View" ]
    , p [ class "lead" ] [ text "The Home page is loaded because the root URL has been matched to the HomeRoute in the router." ]
    ]
