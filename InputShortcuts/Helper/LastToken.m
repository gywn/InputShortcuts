(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {LT = InputShortcuts`Helper`LastToken},

    (* NotebookRead can return a list or a box structure *)
    LT @ r : {__} := LT @ Last[r];
    LT @ RowBox[r_List] := LT @ Last[r];
    LT[s_String] := s;
    LT[_] := $Failed;
]


End[];
