module Calc exposing (..)

-- exposes everything

import Html


-- shorten module name

import Html.Attributes as Attr


-- define type for `main` value


main : Html.Html msg
main =
    Html.div []
        [ display 0
        , button "1"
        ]


display : Int -> Html.Html msg
display number =
    Html.h1
        [ Attr.style
            [ ( "background", "lightgray" )
            , ( "text-align", "right" )
            ]
        ]
        [ Html.text (toString number) ]


button : String -> Html.Html msg
button text =
    Html.button
        [ Attr.style
            [ ( "width", "30px" )
            , ( "height", "30px" )
            ]
        ]
        [ Html.text text ]
