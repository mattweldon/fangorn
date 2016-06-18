module Fangorn.Routing exposing (..)

import Dict
import Navigation
import Hop exposing (makeUrl, makeUrlFromLocation, matchUrl, setQuery)
import Hop.Types exposing (Config, Query, Location, PathMatcher, Router)
import Hop.Matchers exposing (..)

import App.Routes exposing (..)

{-|
Add messages for navigation and changing the query
-}
type Msg
  = NavigateTo String
  | SetQuery Query



-- MODEL


{-|
Add route and location to your model.
- `Location` is a `Hop.Types.Location` record (not Navigation.Location)
- `Route` is your Route union type
This is needed because:
- Some navigation functions in Hop need this information to rebuild the current location.
- Your views will need information about the current route.
- Your views might need information about the current query string.
-}
type alias Model =
  { location : Location
  , route : Route
  }


{-|
Respond to navigation messages in update i.e. NavigateTo and SetQuery
-}
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case (Debug.log "msg" msg) of
    NavigateTo path ->
      let
        command =
          -- First generate the URL using your router config
          -- Then generate a command using Navigation.modifyUrl
          makeUrl App.Routes.routerConfig path
              |> Navigation.modifyUrl
      in
          ( model, command )

    SetQuery query ->
        let
          command =
            -- First modify the current stored location record (setting the query)
            -- Then generate a URL using makeUrlFromLocation
            -- Finally, create a command using Navigation.modifyUrl
            model.location
              |> setQuery query
              |> makeUrlFromLocation App.Routes.routerConfig
              |> Navigation.modifyUrl
        in
          ( model, command )


{-|
Create a URL Parser for Navigation
Here we take `.href` from `Navigation.location` and send this to `Hop.matchUrl`.
`matchUrl` returns a tuple: (matched route, Hop location record). e.g.
    (User 1, { path = ["users", "1"], query = Dict.empty })
-}
urlParser : Navigation.Parser ( Route, Hop.Types.Location )
urlParser =
  Navigation.makeParser (.href >> matchUrl App.Routes.routerConfig)


{-|
Navigation will call urlUpdate when the location changes.
This function gets the result from `urlParser`, which is a tuple with (Route, Hop.Types.Location)
Location is a record that has:
```elm
{
  path: List String,
  query: Hop.Types.Query
}
```
- `path` is an array of string that has the current path e.g. `["users", "1"]` for `"/users/1"`
- `query` Is dictionary of String String. You can access this information in your views to show the content.
Store these two things in the model. We store location because it is needed for matching a query string.
-}
urlUpdate : ( Route, Hop.Types.Location ) -> Model -> ( Model, Cmd Msg )
urlUpdate ( route, location ) model =
  ( { model | route = route, location = location }, Cmd.none )
