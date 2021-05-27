module Allergies exposing (Allergy(..), isAllergicTo, toList)


type Allergy
    = Eggs
    | Peanuts
    | Shellfish
    | Strawberries
    | Tomatoes
    | Chocolate
    | Pollen
    | Cats


allergies =
    [ ( 128, Cats )
    , ( 64, Pollen )
    , ( 32, Chocolate )
    , ( 16, Tomatoes )
    , ( 8, Strawberries )
    , ( 4, Shellfish )
    , ( 2, Peanuts )
    , ( 1, Eggs )
    ]


isAllergicTo : Allergy -> Int -> Bool
isAllergicTo allergy score =
    toList score
        |> List.member allergy


toList : Int -> List Allergy
toList score =
    let
        highestAllergyValue =
            2 ^ List.length allergies
    in
    toListRec (modBy highestAllergyValue score) allergies


toListRec : Int -> List ( Int, Allergy ) -> List Allergy
toListRec score possibleAllergies =
    case possibleAllergies of
        [] ->
            []

        ( allergyScore, allergy ) :: xs ->
            if score >= allergyScore then
                allergy :: toListRec (score - allergyScore) xs

            else
                toListRec score xs
