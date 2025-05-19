#include <Definition_AIMain.h>
//TrueID=0x10F0
id 0x10F0

//Set Unknown
unk 0x00000

//Strings
str "#wait_f"

SetTimeout 10
var0 = AIPDFloat2 * 0.65
if !(XDistLE var0) && Rnd < 0.3
    Call GoMidCloseLedge
endif
label
if Idling
    var0 = LevelValue * 0.002
    if Rnd < var0
        if Rnd < var0
            Call Unk3020
        else
            Call GoMidCloseLedge
        endif
    elif Rnd < var0
        if Rnd < var0
            SetTimeout 55
            var0 = Rnd * 35 + 10
            label
            Button R
            GetShieldRemain var1
            if FrameGE var0 || var1 < 30
                Seek attack
            endif
            Return
        else
            label attack
            if !(Idling)
                if Rnd < 0.25 
                    Button X
                endif
            else
                AtkDiceRoll slot9
                Call
                Finish
            endif
        endif
    elif FrameGE 1
        Finish
    endif
endif
Return

