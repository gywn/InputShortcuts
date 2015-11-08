(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {
        ACV = AbsoluteCurrentValue,
        FETE = FrontEndTokenExecute,
        
        INSD = InputShortcuts`Helper`InputNotebookSelectionData,

        MLRB = InputShortcuts`MoveLineRealBeginning,
        SWLU = InputShortcuts`SelectWholeLineUp
    },

    SWLU[] := If[
        INSD[] === $Failed,

        FETE["MoveNextLine"]; MLRB[]; FETE["SelectPreviousLine"],

        FETE["SelectPreviousLine"]
    ];
]


End[];
