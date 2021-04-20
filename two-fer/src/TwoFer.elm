module TwoFer exposing (twoFer)


twoFer : Maybe String -> String
twoFer input =
    let
        name = Maybe.withDefault "you" input
    in
        "One for " ++  name ++ ", one for me."
