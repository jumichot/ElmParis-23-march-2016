import Html exposing(..)
import Html.Attributes exposing(..)
import Html.Events exposing(..)
import Time exposing(..)

-- Spec du projet : faire un compteur
-- [Decrement] 0 [Increment]

-- ELM ARCHITECTURE
-- MODEL : Modélise l'état de notra application
type alias Model = Int

initialModel : Model
initialModel = 0

-- VIEW : prend un model, et assure le rendu 
view address  model =
  div [ class "container" ] [
    button [onClick address Decrement ] [ text "Decrement" ]
    , text (toString model)
    , button [onClick address Increment ] [ text "Increment" ]
  ]

-- UPDATE : prend un model, le met à jour, et retourne un nouveau modèle
type Action = Decrement | Increment | NoOp

-- { address : Signal.Address Action, signal: Signal Action }
mailbox = Signal.mailbox NoOp

actionsSignal : Signal Action
actionsSignal =
  mailbox.signal

modelsSignal : Signal Model
modelsSignal =
  Signal.foldp update initialModel actionsSignal

update input model =
  model + 1

main : Signal Html
main =
  Signal.map (view mailbox.address) modelsSignal
