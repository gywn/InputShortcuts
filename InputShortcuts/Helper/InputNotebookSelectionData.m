(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {INSD = InputShortcuts`Helper`InputNotebookSelectionData},

    INSD[] := AbsoluteCurrentValue[ InputNotebook[], "SelectionData" ];
]


End[];
