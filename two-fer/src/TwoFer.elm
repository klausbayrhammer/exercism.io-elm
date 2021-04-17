module TwoFer exposing (twoFer)


twoFer : Maybe String -> String
twoFer input =
    case input of
        Nothing ->
            twoFerResponse "you"
        Just name ->
            twoFerResponse name

twoFerResponse : String -> String
twoFerResponse name =
    "One for " ++  name ++ ", one for me."
