(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {
        RE = RegularExpression,
        ACV = AbsoluteCurrentValue,
        FTE = FrontEndTokenExecute,
        
        LT = InputShortcuts`Helper`LastToken,
        
        AD = InputShortcuts`AdvancedDeletePrevious
    },

    AD[] := Module[
        { sel },
        
        If[
            ACV[ InputNotebook[], "SelectionData" ] =!= $Failed,
            
            FTE["DeletePrevious"],
        
            FTE["SelectPreviousWord"];
            If[
                ACV[ InputNotebook[], "SelectionData" ] === $Failed,
                
                FTE["DeletePrevious"],
                
                sel = LT @ ACV[ InputNotebook[], "SelectionData" ];
                FTE["MoveNext"];
                If[
                    \[Not] StringMatchQ[ sel, RE["^[ 	]*$"] ],
                    
                    FTE["DeletePrevious"],
                    
                    sel = StringReplace[sel, RE["^(	|    )*([ 	]+)$"] -> "$2"];
                    Do[
                        FTE["DeletePrevious"],
                        {i, StringLength[sel]}
                    ]
                ];
            ];
        ];
    ];
]


End[];
