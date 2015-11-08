(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {
        ACV = AbsoluteCurrentValue,
        FTE = FrontEndTokenExecute,
        
        MB = InputShortcuts`MoveLineRealBeginning,
        SD = InputShortcuts`SelectWholeLineDown
    },

    SD[] := If[
        ACV[ InputNotebook[], "SelectionData" ] === $Failed,
 
        MB[];
        FTE["SelectNextLine"],
        
        FTE["SelectNextLine"]
    ];
]


End[];
