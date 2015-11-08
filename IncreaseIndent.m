(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {
        RE = RegularExpression,
        RB = RowBox,

        INSD = InputShortcuts`Helper`InputNotebookSelectionData,
        CLS = InputShortcuts`Helper`CombineLeadingSpaces,

        II = InputShortcuts`IncreaseIndent
    },

    II[] := Module[
        { sel = INSD[] },

        If[
            sel =!= $Failed,
            NotebookWrite[
                InputNotebook[],
                CLS[sel]
                    /. s_String :> StringReplace[s, RE["^(.*\n[ 	]*)$"] -> "$1    "]
                    /. RB[{x__}] :> RB[{"    ", x}]
                    /. RB[{x__, s_String}]
                        :> RB[{ x, StringReplace[s, RE["^(.*\n[ 	]*)    $"] -> "$1"] }],
                All
            ]
        ];
    ];
]


End[];
