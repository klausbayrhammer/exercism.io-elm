module Hamming exposing (distance)

import List exposing (filter)
import String exposing (length, toList)

distance : String -> String -> Result String Int
distance left right =
    let
        hammingDistance = List.map2 (\a b -> a == b) (toList left) (toList right)
           |> filter (\x -> x == False)
           |> List.length
    in
        if not (length right == length left) then
            Err "left and right strands must be of equal length"
        else
            Ok hammingDistance
