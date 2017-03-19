module Calc exposing (..)
-- exposes everything

import Html

-- define type for `main` value
main : Html.Html msg
main =
  display

display : Html.Html msg
display =
  Html.h1 [] [ Html.text "0" ]
