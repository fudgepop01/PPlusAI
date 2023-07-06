#include <Definition_AIMain.h>
//TrueID=0x1070
id 0x9070

//Set Unknown
unk 0x00000

//Strings


if XDistFrontEdge <= 50 || XDistBackEdge <= 50
    Finish
endif
var0=OPos
SetVec var10 Zero
if CalledAs Unk1071 || CalledAs Unk1073 || CalledAs Unk1076 || CalledAs Unk1077
    var12=Rnd*20+8
    var13=var12
else
    var13=1000
endif
if InAir
    Seek _2
    Jump
endif
SetTimeout 20
//____________________
label
if !(Idling) && !(Dashing)
    Return
endif
SetTimeout 120
if CalledAs Unk1077 || CalledAs Unk1078
    var12=OPos*Direction
    if var12 > 0
        Stick (-0.5)
        Seek _0
        Return
    endif
endif
Seek
Jump
Return
//____________________
label
if CalledAs Unk1075 || CalledAs Unk1076
    var14=Rnd*16+8
    var15=Rnd-0.5
    var16=var15+2
    var0*=-3
    Seek _1
elif CalledAs Unk1077 || CalledAs Unk1078
    var0*=-3
    Seek _1
else
    var12=OPos*Direction
    if var12 < 0
        Seek
    else
        Seek _1
    endif
    Seek
endif
Jump
Return
//____________________
label
var17=OPos
var0*=0.6
AbsStick var0
var17=OPos
Seek
Return
//____________________
label _0
if FrameGE 2
    Seek
endif
Return
//____________________
label _1
if FrameGE var13
    Seek
    Return
endif
if FrameGE 2 && Falling
    Seek
    Return
endif
if CalledAs Unk1071 || CalledAs Unk1077
    Goto _3
    AbsStick var0
elif CalledAs Unk1072 || CalledAs Unk1078
    if !(FrameGE 8) && YCoord < OYCoord && XDistLE 10
        AbsStick 0
    else
        Goto _3
        AbsStick var0
    endif
elif CalledAs Unk1075
    Stick (-1)
elif CalledAs Unk1076
    Goto _3
    var0*=-1
    AbsStick var0
    var0*=-1
    if FrameGE var14
        Seek
        Return
    endif
endif
if FrameGE 10 && !(InAir)
    Finish
endif
if CalledAs Unk1071 || CalledAs Unk1073 || CalledAs Unk1077
    if !(FrameGE 2)
        Button X
    endif
elif CalledAs Unk1076
    if FrameGE var15 && !(FrameGE var16)
        Button X
    endif
else
    var9=OYCoord-YCoord
    if !(FrameGE 20)
        Stick 0 1
    endif
endif
Return
//____________________
label
if !(Falling)
    if FrameGE 8
        Finish
    endif
    Return
endif
EstOPosVecR var10 var11 0.3
var10*=Direction
if ODamage > 80
    var12=(ODamage-80)*0.005
    if var12 > 0.5
        var12=0.5
    endif
    if Rnd < var12
        SetVec var1 var10
        Abs var1
        Abs var2
        if var1 > var2
            AtkDiceRoll slot17
        else
            AtkDiceRoll slot18
        endif
        if !(DiceRollResult Nothing)
            if DiceRollResult FAir
                if var10 > 0
                    Call
                endif
            elif DiceRollResult BAir
                if var10 < 0
                    Call
                endif
            elif DiceRollResult UAir || DiceRollResult USpecialAir
                if var11 > 0
                    Call
                endif
            elif DiceRollResult DAir || DiceRollResult DSpecialAir
                if var11 < 0
                    Call
                endif
            else
                Call
            endif
        endif
    endif
endif
if var11 > 26
    Call slot14
elif var10 < -12
    Call slot13
elif var10 > 16
    Call slot12
else
    Call slot11
endif
Finish
Return
//____________________
label _2
if CalledAs Unk1071 || CalledAs Unk1072 || CalledAs Unk1077 || CalledAs Unk1078
    Goto _3
    AbsStick var0
elif CalledAs Unk1075 || CalledAs Unk1075
    Goto _3
    var0*=-1
    AbsStick var0
    var0*=-1
endif
if FrameGE 3
    if NumJumps < 2
        EdgeCheck 10
    endif
    Seek _1
endif
Return
//____________________
label _3
if OPos > 0
    var0+=0.4
    if var0 > 1
        var0=1
    endif
else
    var0+=-0.4
    if var0 < -1
        var0=-1
    endif
endif
Return
Return

