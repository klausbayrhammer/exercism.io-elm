module Raindrops exposing (raindrops)


raindrops : Int -> String
raindrops number =
    let
        sounds =
            [ ( 3, "Pling" ), ( 5, "Plang" ), ( 7, "Plong" ) ]

        plingPlangPlong =
            List.filterMap modByEqualsZeroOrEmptyString sounds

        modByEqualsZeroOrEmptyString ( divisor, successReturnValue ) =
            if modBy divisor number == 0 then
                Just successReturnValue

            else
                Nothing
    in
    if List.length plingPlangPlong > 0 then
        String.concat plingPlangPlong

    else
        String.fromInt number
