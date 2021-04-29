module GradeSchool exposing (addStudent, allStudents, empty, studentsInGrade)

import Dict exposing (Dict)


type alias Grade =
    Int


type alias Student =
    String


type alias School =
    Dict Grade (List Student)


empty : School
empty =
    Dict.empty


addStudent : Grade -> Student -> School -> School
addStudent grade student school =
    let
        newListOfStudentsInGrade =
            student
                :: studentsInGrade grade school
                |> List.sort
    in
    Dict.insert grade newListOfStudentsInGrade school


studentsInGrade : Grade -> School -> List Student
studentsInGrade grade school =
    Dict.get grade school
        |> Maybe.withDefault []


allStudents : School -> List ( Grade, List Student )
allStudents school =
    Dict.toList school
