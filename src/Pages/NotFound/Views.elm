module Pages.NotFound.Views exposing (..)

import Fangorn.Routing exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- VIEWS

render : Model -> Html Msg
render model =
  div [ class "starter-template"]
    [ h1 [ class "title" ] [ text "404 Page View" ]
    , p [ class "lead" ] [ text "A route for this URL doesn't exist, so Fangorn falls back to the NotFound page." ]
    , p [ class "lead" ] [ text "It's also worth noting that this page is rendered into the Alternate layout - notice the menu at the top has changed?" ]
    ]
