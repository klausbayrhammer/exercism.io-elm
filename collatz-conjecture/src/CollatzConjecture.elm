module CollatzConjecture exposing (collatz)


collatz : Int -> Result String Int
collatz start =
    let
        collatzRec numberOfSteps value =
            if value == 1 then
                numberOfSteps

            else if modBy 2 value == 0 then
                collatzRec (numberOfSteps + 1) (value // 2)

            else
                collatzRec (numberOfSteps + 1) (value * 3 + 1)
    in
    if start <= 0 then
        Err "Only positive numbers are allowed"

    else
        Ok (collatzRec 0 start)
