(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {
        FTE = FrontEndTokenExecute,
        
        MB = InputShortcuts`MoveLineRealBeginning,
        DL = InputShortcuts`DeleteWholeLine
    },
    
    DL[] := (MB[]; FTE["SelectNextLine"]; FTE["DeletePrevious"]; FTE["MovePrevious"]);
]


End[];
