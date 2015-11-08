(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {LT = InputShortcuts`Helper`LastToken},

    LT @ RowBox[r_List] := LT @ Last[r];
    LT[s_String] := s;
    LT[_] := $Failed;
]


End[];
