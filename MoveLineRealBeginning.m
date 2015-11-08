(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {
        FETE = FrontEndTokenExecute,

        FT = InputShortcuts`Helper`FirstToken,
        INSD = InputShortcuts`Helper`InputNotebookSelectionData,

        MLRB = InputShortcuts`MoveLineRealBeginning
    },

    MLRB[] := Module[
        {
            prev,
            curr = $Failed
        },

        FETE["MoveLineBeginning"];
        While[
            FETE["SelectPrevious"];
            prev = curr;
            curr = INSD[];
            curr =!= prev && curr =!= $Failed && FT[curr] =!= "\n"
        ];
        Which[
            curr === $Failed,
            Null,

            FT[curr] === "\n",
            FETE["MovePrevious"]; FETE["MoveNext"],

            True,
            FETE["MovePrevious"]
        ];
    ];
]


End[];
