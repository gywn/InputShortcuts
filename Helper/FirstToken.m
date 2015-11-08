(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {
        RB = RowBox,
        
        FT = InputShortcuts`Helper`FirstToken
    },
         
    FT @ RB[r_List] := FT @ First[r];
    FT[s_String] := s;
    FT[_] := $Failed;
]


End[];
