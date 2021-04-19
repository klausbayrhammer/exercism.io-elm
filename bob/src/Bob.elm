module Bob exposing (hey)

import Char exposing (isAlpha)
import String exposing (any, endsWith, length, toUpper, trim)

hey : String -> String
hey remark =
    let
        isShouting = remark == toUpper remark && any isAlpha remark
        isQuestion = endsWith "?" (trim remark)
        isSilence = length (trim remark) == 0
        isForcefulQuestion = isShouting && isQuestion
    in
        if isForcefulQuestion then
            "Calm down, I know what I'm doing!"
        else if isShouting then
            "Whoa, chill out!"
        else if isQuestion then
            "Sure."
        else if isSilence then
            "Fine. Be that way!"
        else
            "Whatever."
