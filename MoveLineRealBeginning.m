(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {
        ACV = AbsoluteCurrentValue,
        FTE = FrontEndTokenExecute,
        
        FT = InputShortcuts`Helper`FirstToken,
        
        MB = InputShortcuts`MoveLineRealBeginning
    },

    MB[] := Module[
        {
            nb = InputNotebook[],
            prev,
            curr = $Failed,
            fc
        },
        
        FTE["MoveLineBeginning"];
        While[
            FTE["SelectPrevious"];
            prev = curr;
            curr = ACV[ nb, "SelectionData" ];
            curr =!= prev && curr =!= $Failed && FT[curr] =!= "\n"
        ];
        Which[
            curr === $Failed,
            Null,
            
            FT[curr] === "\n",
            FTE["MovePrevious"]; FTE["MoveNext"],
            
            True,
            FTE["MovePrevious"]
        ];
    ];
]


End[];
