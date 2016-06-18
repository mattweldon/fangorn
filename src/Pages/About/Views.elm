module Pages.About.Views exposing (..)

import Fangorn.Routing exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- VIEWS

render : Model -> Html Msg
render model =
  div [ class "starter-template"]
    [ h1 [ class "title" ] [ text "About Page View" ]
    , p [ class "lead" ] [ text "The About page is loaded because /about has been matched to the AboutRoute in the router." ]
    ]
