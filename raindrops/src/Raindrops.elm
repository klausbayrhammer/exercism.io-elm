module Raindrops exposing (raindrops)


raindrops : Int -> String
raindrops number =
    let
        pling =
            modBy 3 number == 0

        plang =
            modBy 5 number == 0

        plong =
            modBy 7 number == 0
    in
    if pling && plang && plong then
        "PlingPlangPlong"

    else if pling && plang then
        "PlingPlang"

    else if pling && plong then
        "PlingPlong"

    else if plang && plong then
        "PlangPlong"

    else if pling then
        "Pling"

    else if plang then
        "Plang"

    else if plong then
        "Plong"

    else
        String.fromInt number
