module Grains exposing (square)


squareGrains : Int -> Int
squareGrains n =
    case n of
        1 ->
            1

        _ ->
            2 * squareGrains (n - 1)


square : Int -> Maybe Int
square n =
    if n <= 0 then
        Nothing

    else
        squareGrains n
            |> Just
