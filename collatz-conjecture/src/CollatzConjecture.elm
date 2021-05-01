module CollatzConjecture exposing (collatz)


collatz : Int -> Result String Int
collatz start =
    let
        nextStep value =
            if modBy 2 value == 0 then
                value // 2

            else
                value * 3 + 1

        collatzRec numberOfSteps value =
            case value of
                1 ->
                    numberOfSteps

                _ ->
                    collatzRec (numberOfSteps + 1) (nextStep value)
    in
    if start <= 0 then
        Err "Only positive numbers are allowed"

    else
        Ok (collatzRec 0 start)
