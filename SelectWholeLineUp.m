(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {
        ACV = AbsoluteCurrentValue,
        FETE = FrontEndTokenExecute,

        MLRB = InputShortcuts`MoveLineRealBeginning,
        SWLU = InputShortcuts`SelectWholeLineUp
    },

    SWLU[] := If[
        ACV[ InputNotebook[], "SelectionData" ] === $Failed,

        FETE["MoveNextLine"]; MLRB[]; FETE["SelectPreviousLine"],

        FETE["SelectPreviousLine"]
    ];
]


End[];
