(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {
        ACV = AbsoluteCurrentValue,
        FTE = FrontEndTokenExecute,
        
        MB = InputShortcuts`MoveLineRealBeginning,
        SU = InputShortcuts`SelectWholeLineUp
    },

    SU[] := If[
        ACV[ InputNotebook[], "SelectionData" ] === $Failed,
        
        FTE["MoveNextLine"]; MB[]; FTE["SelectPreviousLine"],
        
        FTE["SelectPreviousLine"]
    ];
]


End[];
