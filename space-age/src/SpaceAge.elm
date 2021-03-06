module SpaceAge exposing (Planet(..), ageOn)


type Planet
    = Mercury
    | Venus
    | Earth
    | Mars
    | Jupiter
    | Saturn
    | Uranus
    | Neptune


ageOn : Planet -> Float -> Float
ageOn planet seconds =
    let
        earthYears = seconds /  31557600
    in
        earthYears / orbitalPeriod planet

orbitalPeriod : Planet -> Float
orbitalPeriod planet =
    case planet of
        Earth -> 1
        Mercury -> 0.2408467
        Venus -> 0.61519726
        Mars -> 1.8808158
        Jupiter -> 11.862615
        Saturn -> 29.447498
        Uranus -> 84.016846
        Neptune -> 164.79132
