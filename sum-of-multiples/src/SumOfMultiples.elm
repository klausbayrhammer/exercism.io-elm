module SumOfMultiples exposing (sumOfMultiples)


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples divisors limit =
    let
        dividableByAnyDivisor element =
            List.any (\divisor -> modBy divisor element == 0) divisors
    in
    List.range 1 (limit - 1)
        |> List.filter dividableByAnyDivisor
        |> List.sum
