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
        
        JI = InputShortcuts`JoinLines
    },

    JI[] := Module[
        { sel = INSD[] },

        Which[
            sel === $Failed,
            Null,
            
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
            
            True,
            NotebookWrite[
                InputNotebook[],
                CLS[sel]
                    /. s_String :> StringReplace[s, RE["^(.*)\n[ 	]*$"] -> "$1 "],
                After
            ]
        ];
    ];
]


End[];
