module Hamming exposing (distance)


import List exposing (filter, length)
import String exposing (toList)
distance : String -> String -> Result String Int
distance left right =
    let
        leftList = toList left
        rightList = toList right
        zippedList = List.map2 (\a b -> a == b) leftList rightList
        hammingDistance = length (filter (\x -> x == False) zippedList)
    in
        if not (length rightList == length leftList) then
            Err "left and right strands must be of equal length"
        else
            Ok hammingDistance
