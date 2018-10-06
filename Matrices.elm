module Main exposing (main)

import Html
import State exposing (init, update, subscriptions)
import View exposing (view)


main =
  Html.program
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }


{-
-mostrar letras              -- No me gusta demasiado. Lo haría porque se usa mucho
-mostrar sostenidos o bemoles

-introducción de serie con comas o todo seguido (a,b)
-introducción de serie con letras

-highlight serie al pasar ratón por encima
-poner pentagrama con serie al pasar ratón por encima
-}
