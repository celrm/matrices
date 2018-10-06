module State exposing (init, update, subscriptions)

import Random
import Random.List
import String

import Types exposing (..)


init : ( Model, Cmd Msg )
init =
  ( { serie = [4,5,7,1,6,3,8,2,11,0,9,10]
    , numeracion = Tradicional
    , sintaxis = Simple
    , longitud = 12
    }
  , Cmd.none)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Introducir str ->
      let x = str
                |> String.words
                |> List.map (String.toInt >> Result.withDefault 0)
      in
      ( { model
        | serie = if List.length x > 100
                then model.serie
                else x
        }
      , Cmd.none)

    KeepLong str ->
      let n = Result.withDefault 12 (String.toInt str)
      in
      ( { model
        | longitud =
          clamp 1 100 n
        }
      , Cmd.none)

    Aleatorio ->
      ( model
      , Random.generate Permutar (Random.List.shuffle (List.range 0 (model.longitud - 1)))
      )

    Permutar x ->
      ( { model
        | serie = x
        }
      , Cmd.none)

    SwitchNum num ->
      ( { model
        | numeracion = num
        }
      , Cmd.none)

    SwitchSin sin ->
      ( { model
        | sintaxis = sin
        }
      , Cmd.none)


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
