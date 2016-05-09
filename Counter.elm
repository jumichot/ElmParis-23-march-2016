import Html exposing(..)
import Html.Events exposing(..)
import Time exposing(..)
import StartApp.Simple as StartApp

type alias Model = Int

initialModel : Model
initialModel = 0

type Action = Decrement | Increment | NoOp 

view address model =
  div [] [
    button [ onClick address Decrement ] [ text "Decrement"]
    , text (toString model)
    , button [ onClick address Increment ] [ text "Increment"]
    ]


update action model =
  case action of
    Decrement -> model - 1
    Increment -> model + 1
    NoOp -> model

main : Signal Html
main =
  StartApp.start { view = view, update = update, model = initialModel }

