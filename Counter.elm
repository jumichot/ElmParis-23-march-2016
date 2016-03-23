import Html exposing(..)
import Html.Attributes exposing(..)

-- Spec du projet : faire un compteur
-- [Decrement] 0 [Increment]

-- ELM ARCHITECTURE
-- MODEL : Modélise l'état de notra application
type alias Model = Int

initialModel : Model
initialModel = 10

-- VIEW : prend un model, et assure le rendu 
view  model =
  div [ class "container" ] [
    button [] [ text "Decrement" ]
    , text (toString model)
    , button [] [ text "Increment" ]
  ]

-- UPDATE : prend un model, le met à jour, et retourne un nouveau modèle
inputsSignal =
  every second

update model =
  model + 20



main : Html
main =
  view (update initialModel)
