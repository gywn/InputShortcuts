(* ::Package:: *)

Begin["InputShortcuts`Private`"];


With[
    {
        RE = RegularExpression,
        ACV = AbsoluteCurrentValue,
        FETE = FrontEndTokenExecute,
        
        LT = InputShortcuts`Helper`LastToken,
        
        ADP = InputShortcuts`AdvancedDeletePrevious
    },

    ADP[] := Module[
        { sel },
        
        If[
            ACV[ InputNotebook[], "SelectionData" ] =!= $Failed,
            
            FETE["DeletePrevious"],
        
            FETE["SelectPreviousWord"];
            If[
                ACV[ InputNotebook[], "SelectionData" ] === $Failed,
                
                FETE["DeletePrevious"],
                
                sel = LT @ ACV[ InputNotebook[], "SelectionData" ];
                FETE["MoveNext"];
                If[
                    \[Not] StringMatchQ[ sel, RE["^[ 	]*$"] ],
                    
                    FETE["DeletePrevious"],
                    
                    sel = StringReplace[sel, RE["^(	|    )*([ 	]+)$"] -> "$2"];
                    Do[
                        FETE["DeletePrevious"],
                        {i, StringLength[sel]}
                    ]
                ];
            ];
        ];
    ];
]


End[];
