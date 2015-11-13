(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {
        RE = RegularExpression,
        RB = RowBox,

        CLS = InputShortcuts`Helper`CombineLeadingSpaces
    },

    CLS[sel_] := RB[{sel}]
        //. RB[{ hd___, RB[{in__}], tl___ }] :> RB[{ hd, in, tl }]
        //. RB[{ hd___, s1_String, s2_String, tl___ }]
            /; StringMatchQ[s1, RE @ ".*\n[ 	]*"]
                && StringMatchQ[s2, RE @ "[ 	]+"]
            :> RB[{ hd, s1 ~~ s2, tl }];
]


End[];
