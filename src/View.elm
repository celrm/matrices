module View exposing (view)

import Html exposing (..)
import Html.Events exposing (on, onCheck, onClick, onInput, onMouseOver, keyCode, targetValue)
import Html.Attributes exposing (href, style, defaultValue, name, type_, checked)
import Json.Decode

import Info exposing (informacion)
import Functions exposing (tablear)
import Types exposing (..)
import Styles exposing (..)


doblecolumna : String -> List (Html Msg) -> List (Html Msg) -> Html Msg
doblecolumna s a b =
  div
    [ style [ ("padding",
              ( s ++ "px 0px "
              ++ (toString <| (\x->3*x) <| Result.withDefault 0 <| String.toInt s)
              ++ "px 0px")
              )
            ]
    ]
    [ div [ style [ ("float", "left"), ("width", "50%") ] ]
      [ div [ style [ ("float", "right"), ("width", "400px") ] ]
        a
      ]
    , div [ style [ ("float", "right"), ("width", "50%") ] ]
      [ div [ style [ ("float", "left"), ("width", "400px") ] ]
        b
      ]
    ]


header : Html Msg
header =
    h1
      [ textStyle "2em" ]
      [ text "MATRIZ DODECAFÓNICA" ]


selectors : Html Msg
selectors =
  doblecolumna "60"
    [ a
      [ textStyle "30px"
      , href "#Numeración"
      , style [("color","#5757FF")]
      ]
      [ text "Numeración" ]
    , br [] [], br [] []
    , label
      [ textStyle "20px" ]
      [ input
        [ type_ "radio"
        , name "Numeración"
        , checked True
        , onClick (SwitchNum Tradicional)
        ] []
      , text " Tradicional"
      ]
    , br [] [], br [] []
    , label
      [ textStyle "20px" ]
      [ input
        [ type_ "radio"
        , name "Numeración"
        , onClick (SwitchNum TonosAbsolutos)
        ] []
      , text " Tonos Absolutos"
      ]
    ]
    [ a
      [ textStyle "30px"
      , href "#Sintaxis"
      , style [("color","#5757FF")]
      ]
      [ text "Sintaxis" ]
      , br [] [], br [] []
      , label
        [ textStyle "20px" ]
        [ input
          [ type_ "radio"
          , name "Sintaxis"
          , checked True
          , onClick (SwitchSin Simple)
          ] []
        , text " Simple"
        ]
      , br [] [], br [] []
      , label
        [ textStyle "20px" ]
        [ input
          [ type_ "radio"
          , name "Sintaxis"
          , onClick (SwitchSin Matematica)
          ] []
        , text " Matemática"
        ]
      ]


originalrow : List Int -> Html Msg
originalrow r =
  div [style [("overflow", "auto")]]
    [ table
      [ tableStyle ]
      [ tr
          [ style [ ("box-shadow","5px 8px") ] ]
          ( List.map
              (  flip (%) (List.length r)
              >> toString
              >> \x -> td [boldStyle] [text x]
              ) r
          )
      ]
    ]


entrada : Html Msg
entrada =
  input
    [  style [("margin-top","80px"),("margin-bottom","50px")]
    , fieldStyle
    , defaultValue "4 5 7 1 6 3 8 2 11 0 9 10"
    , onInput Introducir
    ]
    []


bloquealeatorio : Html Msg
bloquealeatorio =
  div
    [ style [("margin-top","50px"),("margin-bottom","50px")] ]
    [ span
        [ textStyle "20px" ]
        [ text "Serie aleatoria de longitud " ]
    , input
        [ squarefieldStyle "20px"
        , defaultValue "12"
        , onInput KeepLong
        ] []
    , button [ littlebuttonStyle, onClick Aleatorio ]
             [ text "OK" ]
    ]


view : Model -> Html Msg
view model =
  div [generalStyle]
    [ header
    , tablear model
    , selectors
    , originalrow model.serie
    , entrada
    , bloquealeatorio
    , informacion
    ]
