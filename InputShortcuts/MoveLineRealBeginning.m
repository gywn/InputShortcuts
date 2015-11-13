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
            curr = {}
        },

        FETE["MoveLineBeginning"];
        While[
            FETE["SelectPrevious"];
            prev = curr;
            curr = INSD[];
            curr =!= prev && curr =!= {} && FT[curr] =!= "\n"
        ];
        Which[
            curr === {},
            Null,

            FT[curr] === "\n",
            FETE["MovePrevious"]; FETE["MoveNext"],

            True,
            FETE["MovePrevious"]
        ];
    ];
]


End[];
