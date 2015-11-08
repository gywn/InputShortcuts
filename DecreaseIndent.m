(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {
        RE = RegularExpression,
        RB = RowBox,
        ACV = AbsoluteCurrentValue,

        CLS = InputShortcuts`Helper`CombineLeadingSpaces,

        DI = InputShortcuts`DecreaseIndent
    },

    DI[] := Module[
        {
            nb = InputNotebook[],
            sel = ACV[ InputNotebook[], "SelectionData" ]
        },

        If[
            sel =!= $Failed,
            NotebookWrite[
                nb,
                CLS[sel]
                    /. s_String :> StringReplace[s, RE["^\n([ 	]*)    $"] -> "\n$1"]
                    /. RB[{s_String, x__}]
                        :> RB[{ StringReplace[s, RE["^([ 	]*)    $"] -> "$1"], x }],
                All
            ]
        ];
    ];
]


End[];
