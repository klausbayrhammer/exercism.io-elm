module RobotSimulator exposing
    ( Bearing(..)
    , Robot
    , advance
    , defaultRobot
    , simulate
    , turnLeft
    , turnRight
    )


type Bearing
    = North
    | East
    | South
    | West


type alias Robot =
    { bearing : Bearing
    , coordinates : { x : Int, y : Int }
    }


defaultRobot : Robot
defaultRobot =
    { bearing = North
    , coordinates = { x = 0, y = 0 }
    }


turnRight : Robot -> Robot
turnRight robot =
    let
        bearing =
            case robot.bearing of
                North ->
                    East

                East ->
                    South

                South ->
                    West

                West ->
                    North
    in
    Robot bearing robot.coordinates


turnLeft : Robot -> Robot
turnLeft robot =
    let
        bearing =
            case robot.bearing of
                North ->
                    West

                East ->
                    North

                South ->
                    East

                West ->
                    South
    in
    Robot bearing robot.coordinates


advance : Robot -> Robot
advance robot =
    let
        coordinates =
            case robot.bearing of
                North ->
                    { x = robot.coordinates.x, y = robot.coordinates.y + 1 }

                East ->
                    { x = robot.coordinates.x + 1, y = robot.coordinates.y }

                South ->
                    { x = robot.coordinates.x, y = robot.coordinates.y - 1 }

                West ->
                    { x = robot.coordinates.x - 1, y = robot.coordinates.y }
    in
    Robot robot.bearing coordinates


simulate : String -> Robot -> Robot
simulate directions robot =
    let
        actions =
            String.toList directions
                |> List.filterMap toAction

        toAction char =
            case char of
                'L' ->
                    Just turnLeft

                'R' ->
                    Just turnRight

                'A' ->
                    Just advance

                _ ->
                    Nothing
    in
    List.foldl (<|) robot actions
