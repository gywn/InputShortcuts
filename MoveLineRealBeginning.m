(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {
        FETE = FrontEndTokenExecute,

        INSD = InputShortcuts`Helper`InputNotebookSelectionData,
        FT = InputShortcuts`Helper`FirstToken,

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
