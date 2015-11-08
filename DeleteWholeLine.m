(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {
        FETE = FrontEndTokenExecute,

        MLRB = InputShortcuts`MoveLineRealBeginning,
        DWL = InputShortcuts`DeleteWholeLine
    },

    DWL[] := (MLRB[]; FETE["SelectNextLine"]; FETE["DeletePrevious"]; FETE["MovePrevious"]);
]


End[];
