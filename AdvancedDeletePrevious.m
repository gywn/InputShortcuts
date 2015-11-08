(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {
        RE = RegularExpression,
        ACV = AbsoluteCurrentValue,
        FETE = FrontEndTokenExecute,

        LT = InputShortcuts`Helper`LastToken,
        INSD = InputShortcuts`Helper`InputNotebookSelectionData,

        ADP = InputShortcuts`AdvancedDeletePrevious
    },

    ADP[] := Module[
        { sel },

        If[
            INSD[] =!= $Failed,

            FETE["DeletePrevious"],

            FETE["SelectPreviousWord"];
            If[
                INSD[] === $Failed,

                FETE["DeletePrevious"],

                sel = LT @ INSD[];
                FETE["MoveNext"];
                If[
                    \[Not] StringMatchQ[ sel, RE["^[ 	]*$"] ],

                    FETE["DeletePrevious"],

                    sel = StringReplace[sel, RE["^(	|    )*([ 	]+)$"] -> "$2"];
                    Do[
                        FETE["DeletePrevious"],
                        {i, StringLength[sel]}
                    ]
                ];
            ];
        ];
    ];
]


End[];
