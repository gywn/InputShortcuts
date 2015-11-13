(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {INSD = InputShortcuts`Helper`InputNotebookSelectionData},

    INSD[] := NotebookRead @ InputNotebook[];
]


End[];
