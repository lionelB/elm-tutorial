module Subscription exposing (..)

import Html exposing (Html, div, text)
import Mouse
import Keyboard


-- MODEL


type alias Model =
  { keyPressCount: Int
  , clickCount: Int
  }


init : ( Model, Cmd Msg )
init =
  ({ keyPressCount = 0
  , clickCount = 0
  }
  , Cmd.none)


-- MESSAGES


type Msg
    = MouseMsg Mouse.Position
    | KeyMsg Keyboard.KeyCode



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ text <| "keypress " ++  (toString <| .keyPressCount model)
        , text <| "click " ++ (toString <| .clickCount model)
        ]


-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MouseMsg position ->
            ( { model |
                clickCount =  model.clickCount + 1
              }, Cmd.none )

        KeyMsg code ->
            ( { model |
                keyPressCount =  model.keyPressCount + 1
              }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Mouse.clicks MouseMsg
        , Keyboard.presses KeyMsg
        ]



-- MAIN


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
