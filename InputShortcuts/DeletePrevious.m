(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {
        RE = RegularExpression,
        FETE = FrontEndTokenExecute,

        INSD = InputShortcuts`Helper`InputNotebookSelectionData,
        LT = InputShortcuts`Helper`LastToken,

        DP = InputShortcuts`DeletePrevious
    },

    DP[] := Module[
        {tok},

        Which[
            INSD[] =!= {},
            FETE["DeletePrevious"],
            
            FETE["SelectPreviousWord"];
            INSD[] === {},
            FETE["DeletePrevious"],
            
            tok = LT @ INSD[];
            FETE["MoveNext"];
            tok === $Failed,
            FETE["DeletePrevious"],
            
            \[Not] StringMatchQ[ tok, RE["^(.*\n)?[ 	]+$"] ],
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
