module Pangram exposing (isPangram)


isPangram : String -> Bool
isPangram sentence =
    let
        fullAlphabet =
            "abcdefghijklmnopqrstuvwxyz"

        testIfCharIsIncludedInSentence test =
            String.toLower sentence
                |> String.contains (String.fromChar test)
    in
    String.all testIfCharIsIncludedInSentence fullAlphabet
