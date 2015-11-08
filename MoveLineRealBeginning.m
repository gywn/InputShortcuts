(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {
        ACV = AbsoluteCurrentValue,
        FETE = FrontEndTokenExecute,

        FT = InputShortcuts`Helper`FirstToken,

        MLRB = InputShortcuts`MoveLineRealBeginning
    },

    MLRB[] := Module[
        {
            nb = InputNotebook[],
            prev,
            curr = $Failed,
            fc
        },

        FETE["MoveLineBeginning"];
        While[
            FETE["SelectPrevious"];
            prev = curr;
            curr = ACV[ nb, "SelectionData" ];
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
