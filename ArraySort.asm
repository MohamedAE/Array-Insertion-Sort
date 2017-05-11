; A3B_Sort_Array_Bonus.asm

; Authors:              Denesh Canjimavadivel          040 854 471
;                       Mohamed Elmekki                040 847 947
;                       Jagmandeeph Singh              040 851 451

; Date:                 05 Apr 2015

; Purpose               Use iterations, pointers and the indexed addressing mode
;                       to sort the following unsigned data.

STACK                   equ     $2000
                        org     $1000                                           ;Data Area
Source_Array            db      $fd, $ff, $00, $fe, $01, $03, $02, $fc, $04, $fd
End_Source
                        org     #STACK                                          ;Program Code
Start                   lds     #STACK                                          ;Stack location
                        ldx     #Source_Array+1                              	;Beginning of unsorted segment
StartFor
                        cpx     #End_Source                                	;Check to see if we are at end of array
                        beq     EndFor                                          ;End of array reached? If so, end for loop
                        ldab    0,x                                             ;Temporily store the first value of unsorted segment
                        leay    0,x                                             ;Point y to the memory address of first value of unsorted segment
StartWhile
                        cpy     #Source_Array                                   ;Check to see if we are back at the beginning of initial array
                        bls     EndWhile                                        ;If yes, end while loop
                        ldaa    -1,y
                        cba                                                     ;Compare first value of unsorted segment with current value of sorted segment
                        bls     EndWhile
                        staa    0,y
                        dey                                                     ;If greater than, continue walking backwards. Else, begin insertion.
                        bra     StartWhile
EndWhile
                        stab    0,y                                        	;Insert temporarily stored value
                        inx
                        bra     StartFor                                        ;Begin iteration with next unsorted value
EndFor
                        swi
                        end