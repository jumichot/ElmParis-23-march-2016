import Html exposing(..)
import Html.Attributes exposing(..)

-- Spec du projet : faire un compteur
-- [Decrement] 0 [Increment]

main =
  div [ class "container" ] [
    button [] [ text "Decrement" ]
    , text "0"
    , button [] [ text "Increment" ]
  ]
