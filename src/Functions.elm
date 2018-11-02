module Functions exposing (tablear)

import Html exposing (Html, td, text, tr)
import Html.Attributes exposing (style)
import Random
import Styles exposing (boldStyle, cellStyle, tableStyle)
import Types exposing (..)


headx : List Int -> Int
headx x =
    x
        |> List.head
        |> Maybe.withDefault 0


lastx : List Int -> Int
lastx x =
    case x of
        [] ->
            0

        [ a ] ->
            a

        b :: a ->
            lastx a


tablear : Model -> Html Msg
tablear m =
    let
        sigma0 =
            headx m.serie

        sigma11 =
            lastx m.serie

        doce =
            List.length m.serie

        matriz =
            m.serie
                |> List.map (\x -> modBy doce (-x + 2 * sigma0))
                |> List.foldr
                    (\x z ->
                        List.map (\y -> modBy doce (y + x - sigma0)) m.serie
                            :: z
                    )
                    []

        numerito x =
            case m.numeracion of
                Tradicional ->
                    modBy doce (x - sigma0)

                TonosAbsolutos ->
                    x

        ries x =
            case m.numeracion of
                Tradicional ->
                    modBy doce (x + 2 * sigma0 - 2 * sigma11)

                TonosAbsolutos ->
                    x

        subsup x =
            case m.sintaxis of
                Simple ->
                    Html.sub [] [ text (String.fromInt x) ]

                Matematica ->
                    Html.sup [] [ text (String.fromInt x) ]

        mates =
            case m.sintaxis of
                Simple ->
                    text ""

                Matematica ->
                    text "T"
    in
    Html.div [ style "overflow" "auto" ]
        [ Html.table tableStyle
            ([ tr []
                ([ td [] [] ]
                    ++ List.map
                        (\x -> td boldStyle [ text "I", mates, x |> numerito |> subsup ])
                        m.serie
                )
             ]
                ++ List.map
                    (\l ->
                        tr []
                            ([ td boldStyle [ text "T", l |> headx |> numerito |> subsup ] ]
                                ++ List.map ((\y -> td cellStyle [ text y ]) << String.fromInt) l
                                ++ [ td boldStyle [ text "R", mates, l |> headx |> numerito |> subsup ] ]
                            )
                    )
                    matriz
                ++ [ tr []
                        ([ td [] [] ]
                            ++ List.map
                                (\x -> td boldStyle [ text "IR", mates, x |> numerito |> subsup ])
                                m.serie
                        )
                   ]
                ++ [ tr []
                        ([ td [] [] ]
                            ++ List.map
                                (\x -> td boldStyle [ text "RI", mates, x |> numerito |> ries |> subsup ])
                                m.serie
                        )
                   ]
            )
        ]
