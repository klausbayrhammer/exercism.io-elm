module SumOfMultiples exposing (sumOfMultiples)

import List exposing (any, filter, range, sum)

sumOfMultiples : List Int -> Int -> Int
sumOfMultiples divisors limit =
    let
        dividableByAnyDivisor element = any (\divisor -> modBy divisor element == 0) divisors
    in
        range 1 (limit - 1)
        |> filter dividableByAnyDivisor
        |> sum
