module Raindrops exposing (raindrops)


raindrops : Int -> String
raindrops number =
    let
        plingPlangPlong =
            pling ++ plang ++ plong

        pling =
            modByEqualsZeroOrEmptyString 3 "Pling"

        plang =
            modByEqualsZeroOrEmptyString 5 "Plang"

        plong =
            modByEqualsZeroOrEmptyString 7 "Plong"

        modByEqualsZeroOrEmptyString divisor successReturnValue =
            if modBy divisor number == 0 then
                successReturnValue

            else
                ""
    in
    if plingPlangPlong /= "" then
        plingPlangPlong

    else
        String.fromInt number
