(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {
        RE = RegularExpression,
        RB = RowBox,
        ACV = AbsoluteCurrentValue,

        INSD = InputShortcuts`Helper`InputNotebookSelectionData
    },

    INSD[] := ACV[ InputNotebook[], "SelectionData" ];
]


End[];
