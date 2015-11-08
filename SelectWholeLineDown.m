(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {
        ACV = AbsoluteCurrentValue,
        FETE = FrontEndTokenExecute,
        
        INSD = InputShortcuts`Helper`InputNotebookSelectionData,

        MLRB = InputShortcuts`MoveLineRealBeginning,
        SWLD = InputShortcuts`SelectWholeLineDown
    },

    SWLD[] := If[
        INSD[] === $Failed,

        MLRB[];
        FETE["SelectNextLine"],

        FETE["SelectNextLine"]
    ];
]


End[];
