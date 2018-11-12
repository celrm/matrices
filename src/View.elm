module View exposing (view)

import Browser
import Functions exposing (tablear)
import Html exposing (..)
import Html.Attributes exposing (checked, placeholder, href, name, style, type_)
import Html.Events exposing (keyCode, on, onCheck, onClick, onInput, onMouseOver, targetValue)
import Info exposing (informacion)
import Styles exposing (..)
import Types exposing (..)


opciones : Html Msg
opciones =
    doblecolumna "60"
        [ a
            ( textStyle "30px" )
            [ text "Numeración" ]
        , br [] []
        , label
            ( textStyle "20px" )
            [ input
                [ type_ "radio"
                , name "Numeración"
                , checked True
                , onClick (SwitchNum Tradicional)
                ]
                []
            , text " Tradicional"
            ]
        , br [] []
        , label
            ( textStyle "20px" )
            [ input
                [ type_ "radio"
                , name "Numeración"
                , onClick (SwitchNum TonosAbsolutos)
                ]
                []
            , text " Tonos Absolutos"
            ]
        ]
        [ a
            ( textStyle "30px" )
            [ text "Sintaxis" ]
        , br [] []
        , label
            ( textStyle "20px" )
            [ input
                [ type_ "radio"
                , name "Sintaxis"
                , checked True
                , onClick (SwitchSin Simple)
                ]
                []
            , text " Simple"
            ]
        , br [] []
        , label
            ( textStyle "20px" )
            [ input
                [ type_ "radio"
                , name "Sintaxis"
                , onClick (SwitchSin Matematica)
                ]
                []
            , text " Matemática"
            ]
        ]


view : Model -> Browser.Document Msg
view model =
  (Browser.Document "Matrices"
    [ div generalStyle
        [ navbar 1
        , titulo "MATRIZ DODECAFÓNICA"
        , tablear model
        , opciones
        , br [] []
        , bloquealeatorio (onInput KeepLong) (onClick Aleatorio)
        , br [] []
        , originalrow model.serie
        , entrada (onInput Introducir)
        , informacion
        ]
    ]
  )
