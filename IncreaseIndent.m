(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {
        RE = RegularExpression,
        RB = RowBox,
        ACV = AbsoluteCurrentValue,
        
        CS = InputShortcuts`Helper`CombineLeadingSpaces,
        
        II = InputShortcuts`IncreaseIndent
    },

    II[] := Module[
        {
            nb = InputNotebook[],
            sel = ACV[ InputNotebook[], "SelectionData" ]
        },
        
        If[
            sel =!= $Failed,
            NotebookWrite[
                nb,
                CS[sel]
                    /. s_String :> StringReplace[s, RE["^\n([ 	]*)$"] -> "\n$1    "]
                    /. RB[{x__}] :> RB[{"    ", x}]
                    /. RB[{x__, s_String}]
                        :> RB[{ x, StringReplace[s, RE["^\n([ 	]*)    $"] -> "\n$1"] }],  
                All
            ]
        ];
    ];
]


End[];
