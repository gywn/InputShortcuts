(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {
        ACV = AbsoluteCurrentValue,
        FETE = FrontEndTokenExecute,
        
        MLRB = InputShortcuts`MoveLineRealBeginning,
        SWLD = InputShortcuts`SelectWholeLineDown
    },

    SWLD[] := If[
        ACV[ InputNotebook[], "SelectionData" ] === $Failed,
 
        MLRB[];
        FETE["SelectNextLine"],
        
        FETE["SelectNextLine"]
    ];
]


End[];
