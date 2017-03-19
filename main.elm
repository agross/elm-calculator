module Calc exposing (..)

-- exposes everything

import Html


-- shorten module name

import Html.Attributes as Attr


type alias Button =
    { text : String
    , message : Message
    }


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
    let
        n n =
            Button (toString n) (NumberPressed n)

        o l o =
            Button l (OperatorPressed o)
    in
        Html.div
            [ Attr.style
                [ ( "margin", "1rem" )
                , ( "width", "10rem" )
                ]
            ]
            [ display model
            , keyboard
                [ [ n 7, n 8, n 9, o "*" Multiply ]
                , [ n 4, n 5, n 6, o "/" Divide ]
                , [ n 1, n 2, n 3, o "+" Plus ]
                , [ n 0, o "," Comma, o "=" Equals, o "-" Minus ]
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


button : Button -> Html.Html Message
button button =
    Html.button
        [ Attr.style
            [ ( "width", "2rem" )
            , ( "height", "2rem" )
            , ( "margin", "0 .5rem .5rem 0" )
            ]
        ]
        [ Html.text button.text ]


display : Int -> Html.Html Message
display number =
    Html.h1
        [ Attr.style
            [ ( "background", "lightgray" )
            , ( "text-align", "right" )
            ]
        ]
        [ Html.text (toString number) ]
