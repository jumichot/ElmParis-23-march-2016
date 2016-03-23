import Html exposing(..)
import Html.Attributes exposing(..)
import Time exposing(..)

-- Spec du projet : faire un compteur
-- [Decrement] 0 [Increment]

-- ELM ARCHITECTURE
-- MODEL : Modélise l'état de notra application
type alias Model = Int

initialModel : Model
initialModel = 0

-- VIEW : prend un model, et assure le rendu 
view  model =
  div [ class "container" ] [
    button [] [ text "Decrement" ]
    , text (toString model)
    , button [] [ text "Increment" ]
  ]

-- UPDATE : prend un model, le met à jour, et retourne un nouveau modèle
inputsSignal : Signal Time
inputsSignal =
  every second

modelsSignal : Signal Model
modelsSignal =
  Signal.map inputToModel inputsSignal

inputToModel input =
  initialModel

update model =
  model



main : Signal Html
main =
  Signal.map view modelsSignal
