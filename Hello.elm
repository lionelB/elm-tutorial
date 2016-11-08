module Hello exposing (..)

import Html exposing (Html, div, text)
import Html.App

-- Model
type alias Model =
  String

init: (Model, Cmd Msg)
init =
  ("Hello Georges", Cmd.none)

-- Message
type Msg
  = NoOp

-- View
view : Model -> Html Msg
view model =
  div []
      [text model]

-- Update
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    NoOp ->
      ( model, Cmd.none )

-- Subscription
subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

main: Program Never
main =
  Html.App.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
