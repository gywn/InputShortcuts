(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {
        RE = RegularExpression,
        RB = RowBox,

        INSD = InputShortcuts`Helper`InputNotebookSelectionData,
        CLS = InputShortcuts`Helper`CombineLeadingSpaces,
    
        DI = InputShortcuts`DecreaseIndent
    },

    DI[] := Module[
        { sel = INSD[] },

        If[
            sel =!= $Failed,
            NotebookWrite[
                InputNotebook[],
                CLS[sel]
                    /. s_String :> StringReplace[s, RE["^(.*\n[ 	]*)    $"] -> "$1"]
                    /. RB[{s_String, x__}]
                        :> RB[{ StringReplace[s, RE["^([ 	]*)    $"] -> "$1"], x }],
                All
            ]
        ];
    ];
]


End[];
