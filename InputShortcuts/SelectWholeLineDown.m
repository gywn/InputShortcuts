(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {
        FETE = FrontEndTokenExecute,
        
        INSD = InputShortcuts`Helper`InputNotebookSelectionData,

        MLRB = InputShortcuts`MoveLineRealBeginning,
        SWLD = InputShortcuts`SelectWholeLineDown
    },

    SWLD[] := If[
        INSD[] === {},

        MLRB[];
        FETE["SelectNextLine"],

        FETE["SelectNextLine"]
    ];
]


End[];
