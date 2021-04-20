module Leap exposing (isLeapYear)


isLeapYear : Int -> Bool
isLeapYear year =
    let
        isDividableBy divisor = modBy divisor year == 0
    in
        isDividableBy 400 || isDividableBy 4 && not (isDividableBy 100)
