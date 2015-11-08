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
        DI = InputShortcuts`DecreaseIndent
    },

    DI[trySelect_ : True] := Module[
        { sel = INSD[] },

        Which[
            sel =!= $Failed,
            NotebookWrite[
                InputNotebook[],
                CLS[sel]
                    /. s_String :> StringReplace[s, RE["^(.*\n[ 	]*)(    |	)$"] -> "$1"]
                    /. RB[{s_String, x__}]
                        :> RB[{ StringReplace[s, RE["^([ 	]*)(    |	)$"] -> "$1"], x }],
                All
            ],
            
            trySelect,
            MLRB[]; FETE["SelectLineEnd"];
            DI[False]; (* only try selecting once *)
            FETE["MoveLineBeginning"]
        ];
    ];
]


End[];
