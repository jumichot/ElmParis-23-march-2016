import Html exposing(..)
import Html.Attributes exposing(..)
import Html.Events exposing(..)
import StartApp.Simple as StartApp

type alias Model = Int

initialModel : Model
initialModel = 0

view address model =
  div [ class "container" ] [
    button [onClick address Decrement ] [ text "Decrement" ]
    , text (toString model)
    , button [onClick address Increment ] [ text "Increment" ]
  ]

type Action = Decrement | Increment | NoOp

update action model =
  case action of
    Increment -> model + 1
    Decrement -> model - 1
    NoOp -> model

main : Signal Html
main =
  StartApp.start { view = view, update = update, model = initialModel }
