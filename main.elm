module Calc exposing (..)

-- exposes everything

import Html


-- shorten module name

import Html.Attributes as Attr


type alias Button =
    String


type alias Model =
    Int


type Message
    = NumberPressed Int
    | OperatorPressed Operator


type Operator
    = Plus
    | Minus
    | Divide
    | Multiply
    | Equals
    | Comma



-- define type for `main` value


main : Program Never Model Message
main =
    Html.beginnerProgram
        { model = 0
        , view = view
        , update = update
        }


update : Message -> Model -> Model
update msg model =
    model


view : Model -> Html.Html Message
view model =
    Html.div
        [ Attr.style
            [ ( "margin", "1rem" )
            , ( "width", "10rem" )
            ]
        ]
        [ display model
        , keyboard
            [ [ "7", "8", "9", "*" ]
            , [ "4", "5", "6", "/" ]
            , [ "1", "2", "3", "+" ]
            , [ "0", ",", "=", "-" ]
            ]
        ]


keyboard : List (List Button) -> Html.Html Message
keyboard buttons_ =
    Html.div
        []
        (List.map buttons buttons_)


buttons : List Button -> Html.Html Message
buttons labels =
    Html.div []
        (List.map button labels)


button : String -> Html.Html Message
button label =
    Html.button
        [ Attr.style
            [ ( "width", "2rem" )
            , ( "height", "2rem" )
            , ( "margin", "0 .5rem .5rem 0" )
            ]
        ]
        [ Html.text label ]


display : Int -> Html.Html Message
display number =
    Html.h1
        [ Attr.style
            [ ( "background", "lightgray" )
            , ( "text-align", "right" )
            ]
        ]
        [ Html.text (toString number) ]
