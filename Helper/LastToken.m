(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {
        RB = RowBox,
        
        LT = InputShortcuts`Helper`LastToken
    },

    LT @ RB[r_List] := LT @ Last[r];
    LT[s_String] := s;
    LT[_] := $Failed;
]


End[];
