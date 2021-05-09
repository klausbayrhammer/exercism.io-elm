module Raindrops exposing (raindrops)


raindrops : Int -> String
raindrops number =
    let
        plingPlangPlong =
            List.filterMap identity [ pling, plang, plong ]

        pling =
            modByEqualsZeroOrEmptyString 3 "Pling"

        plang =
            modByEqualsZeroOrEmptyString 5 "Plang"

        plong =
            modByEqualsZeroOrEmptyString 7 "Plong"

        modByEqualsZeroOrEmptyString divisor successReturnValue =
            if modBy divisor number == 0 then
                Just successReturnValue

            else
                Nothing
    in
    if List.length plingPlangPlong > 0 then
        String.concat plingPlangPlong

    else
        String.fromInt number
