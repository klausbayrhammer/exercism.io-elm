module PhoneNumber exposing (getNumber)


getNumber : String -> Maybe String
getNumber phoneNumber =
    let
        cleanedPhoneNumber =
            phoneNumber
                |> String.filter Char.isAlphaNum
                |> dropCountryCode

        dropCountryCode number =
            if String.startsWith "1" number then
                String.dropLeft 1 number

            else
                number

        isValidPhoneNumber =
            verifyLength cleanedPhoneNumber
                && verifyAreaCode cleanedPhoneNumber
                && verifyExchangeCode cleanedPhoneNumber

        verifyLength number =
            String.length number == 10

        verifyAreaCode number =
            let
                areaCode =
                    String.slice 0 1 number
            in
            areaCode /= "0" && areaCode /= "1"

        verifyExchangeCode number =
            let
                exchangeCode =
                    String.slice 3 4 number
            in
            exchangeCode /= "0" && exchangeCode /= "1"
    in
    if isValidPhoneNumber then
        Just cleanedPhoneNumber

    else
        Nothing
