module Types exposing (..)


type Numeracion
    = Tradicional
    | TonosAbsolutos


type Sintaxis
    = Simple
    | Matematica


type alias Model =
    { serie : List Int
    , numeracion : Numeracion
    , sintaxis : Sintaxis
    , longitud : Int
    }


type Msg
  = Introducir String
  | KeepLong String
  | Aleatorio
  | Permutar (List Int)
  | SwitchNum Numeracion
  | SwitchSin Sintaxis
