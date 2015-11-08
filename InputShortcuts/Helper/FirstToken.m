(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {FT = InputShortcuts`Helper`FirstToken},

    FT @ RowBox[r_List] := FT @ First[r];
    FT[s_String] := s;
    FT[_] := $Failed;
]


End[];
