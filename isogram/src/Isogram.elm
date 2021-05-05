module Isogram exposing (isIsogram)


isIsogram : String -> Bool
isIsogram sentence =
    let
        lowerCaseSentence =
            String.toLower sentence

        charInSentence char =
            lowerCaseSentence
                |> String.filter (\e -> e == char)
                |> String.length

        charOccursOnlyOnce char =
            charInSentence char == 1

        removeNonLetterCharacters char =
            char /= '-' && char /= ' '
    in
    lowerCaseSentence
        |> String.filter removeNonLetterCharacters
        |> String.all charOccursOnlyOnce
