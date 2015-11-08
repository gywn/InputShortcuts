(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {
        RE = RegularExpression,
        RB = RowBox,
        FETE = FrontEndTokenExecute,

        INSD = InputShortcuts`Helper`InputNotebookSelectionData,
        CLS = InputShortcuts`Helper`CombineLeadingSpaces,
        LT = InputShortcuts`Helper`LastToken,
        
        MLRB = InputShortcuts`MoveLineRealBeginning,
        JL = InputShortcuts`JoinLines
    },

    JL[trySelect_ : True] := Module[
        { sel = INSD[] },

        Which[
            LT @ sel === "\n",
            NotebookWrite[
                InputNotebook[],
                RB[{
                    Replace[ CLS[sel], RB[{x__, "\n"}] :> RB[{x}] ]
                        /. s_String :> StringReplace[s, RE["^(.*)\n[ 	]*$"] -> "$1 "],
                    "\n"
                }],
                After
            ];
            FETE["MovePrevious"],
            
            sel =!= $Failed,
            NotebookWrite[
                InputNotebook[],
                CLS[sel]
                    /. s_String :> StringReplace[s, RE["^(.*)\n[ 	]*$"] -> "$1 "],
                After
            ],
            
            trySelect,
            MLRB[]; FETE["SelectLineEnd"]; FETE["SelectNextWord"];
            JL[False]; (* only try selecting once *)
            FETE["MovePreviousWord"]
        ];
    ];
]


End[];
