(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {
        RE = RegularExpression,
        RB = RowBox,
        FETE = FrontEndTokenExecute,

        INSD = InputShortcuts`Helper`InputNotebookSelectionData,
        CLS = InputShortcuts`Helper`CombineLeadingSpaces,

        MLRB = InputShortcuts`MoveLineRealBeginning,
        II = InputShortcuts`IncreaseIndent
    },

    II[trySelect_ : True] := Module[
        { sel = INSD[] },

        Which[
            sel =!= {},
            NotebookWrite[
                InputNotebook[],
                CLS[sel]
                    /. s_String :> StringReplace[s, RE["^(.*\n[ 	]*)$"] -> "$1    "]
                    /. RB[{x__}] :> RB[{"    ", x}]
                    /. RB[{x__, s_String}]
                        :> RB[{ x, StringReplace[s, RE["^(.*\n[ 	]*)    $"] -> "$1"] }],
                All
            ],
            
            trySelect,
            MLRB[]; FETE["SelectLineEnd"];
            II[False]; (* only try selecting once *)
            FETE["MoveLineBeginning"]
        ];
    ];
]


End[];
