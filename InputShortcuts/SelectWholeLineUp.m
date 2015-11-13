(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {
        FETE = FrontEndTokenExecute,
        
        INSD = InputShortcuts`Helper`InputNotebookSelectionData,

        MLRB = InputShortcuts`MoveLineRealBeginning,
        SWLU = InputShortcuts`SelectWholeLineUp
    },

    SWLU[] := If[
        INSD[] === {},

        FETE["MoveNextLine"]; MLRB[]; FETE["SelectPreviousLine"],

        FETE["SelectPreviousLine"]
    ];
]


End[];
