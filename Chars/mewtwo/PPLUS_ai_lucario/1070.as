#include <Definition_AIMain.h>
//TrueID=0x1070
id 0x9070

//Set Unknown
unk 0xD0000

//Strings

if XDistFrontEdge <= 50 || XDistBackEdge <= 50
    Finish
endif
var0=OPos
SetVec var1 Zero
if CalledAs Unk1071 || CalledAs Unk1073 || CalledAs Unk1076 || CalledAs Unk1077
    var3=Rnd*20+8
    var4=var3
else
    var4=1000
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
    var3=OPos*Direction
    if var3 > 0
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
    var5=Rnd*16+8
    var6=Rnd-0.5
    var7=var6+2
    var0*=-3
    Seek _1
elif CalledAs Unk1077 || CalledAs Unk1078
    var0*=-3
    Seek _1
else
    var3=OPos*Direction
    if var3 < 0
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
var8=OPos
var0*=0.6
AbsStick var0
var8=OPos
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
if FrameGE var4
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
    if FrameGE var5
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
    if FrameGE var6 && !(FrameGE var7)
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
EstOPosVecR var1 var2 0.3
var1*=Direction
if ODamage > 80
    var3=(ODamage-80)*0.005
    if var3 > 0.5
        var3=0.5
    endif
    if Rnd < var3
        SetVec var11 var1
        Abs var11
        Abs var12
        if var11 > var12
            AtkDiceRoll slot17
        else
            AtkDiceRoll slot18
        endif
        if !(DiceRollResult Nothing)
            if DiceRollResult FAir
                if var1 > 0
                    Call 
                endif
            elif DiceRollResult BAir
                if var1 < 0
                    Call 
                endif
            elif DiceRollResult UAir || DiceRollResult USpecialAir
                if var2 > 0
                    Call 
                endif
            elif DiceRollResult DAir || DiceRollResult DSpecialAir
                if var2 < 0
                    Call 
                endif
            else
                Call 
            endif
        endif
    endif
endif
if var2 > 26
    Call slot14
elif var1 < -12
    Call slot13
elif var1 > 16
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
