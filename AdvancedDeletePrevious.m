(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {
        RE = RegularExpression,
        FETE = FrontEndTokenExecute,

        LT = InputShortcuts`Helper`LastToken,
        INSD = InputShortcuts`Helper`InputNotebookSelectionData,

        ADP = InputShortcuts`AdvancedDeletePrevious
    },

    ADP[] := Module[
        {tok},

        Which[
            INSD[] =!= $Failed,
            FETE["DeletePrevious"],
            
            FETE["SelectPreviousWord"];
            INSD[] === $Failed,
            FETE["DeletePrevious"],
            
            tok = LT @ INSD[];
            FETE["MoveNext"];
            \[Not] StringMatchQ[ tok, RE["^[ 	]*$"] ],
            FETE["DeletePrevious"],
            
            True,
            Do[
                FETE["DeletePrevious"],
                { i, StringLength @ StringReplace[
                    tok,
                    RE["^(	|    )*([ 	]+)$"] -> "$2"
                ] }
            ]
        ]
    ];
]


End[];
