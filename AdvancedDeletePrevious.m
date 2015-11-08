(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {
        RE = RegularExpression,
        FETE = FrontEndTokenExecute,

        INSD = InputShortcuts`Helper`InputNotebookSelectionData,
        LT = InputShortcuts`Helper`LastToken,

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
            \[Not] StringMatchQ[ tok, RE["^(.*\n)?[ 	]*$"] ],
            FETE["DeletePrevious"],
            
            True,
            Do[
                FETE["DeletePrevious"],
                { i, StringLength @ StringReplace[
                    tok,
                    RE["^(.*\n)?(	|    )*([ 	]+)$"] -> "$3"
                ] }
            ]
        ]
    ];
]


End[];
