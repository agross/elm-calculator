module Calc exposing (..)

-- exposes everything

import Html


-- shorten module name

import Html.Attributes as Attr


type alias Button =
    String



-- define type for `main` value


main : Html.Html msg
main =
    Html.div
        [ Attr.style
            [ ( "margin", "1rem" )
            , ( "width", "10rem" )
            ]
        ]
        [ display 0
        , keyboard
            [ [ "7", "8", "9", "*" ]
            , [ "4", "5", "6", "/" ]
            , [ "1", "2", "3", "+" ]
            , [ "0", ",", "=", "-" ]
            ]
        ]


keyboard : List (List Button) -> Html.Html msg
keyboard buttons_ =
    Html.div
        []
        (List.map buttons buttons_)


buttons : List Button -> Html.Html msg
buttons labels =
    Html.div []
        (List.map button labels)


button : String -> Html.Html msg
button label =
    Html.button
        [ Attr.style
            [ ( "width", "2rem" )
            , ( "height", "2rem" )
            , ( "margin", "0 .5rem .5rem 0" )
            ]
        ]
        [ Html.text label ]


display : Int -> Html.Html msg
display number =
    Html.h1
        [ Attr.style
            [ ( "background", "lightgray" )
            , ( "text-align", "right" )
            ]
        ]
        [ Html.text (toString number) ]
