(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {FT = InputShortcuts`Helper`FirstToken},

    (* NotebookRead can return a list or a box structure *)
    FT @ r : {__} := FT @ First[r];
    FT @ RowBox[r_List] := FT @ First[r];
    FT[s_String] := s;
    FT[_] := $Failed;
]


End[];
