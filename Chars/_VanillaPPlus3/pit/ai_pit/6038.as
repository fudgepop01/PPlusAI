#include <Definition_AIMain.h>
//TrueID=0x6038
id 0x6038

//Set Unknown
unk 0x00000

//Strings

SetVec var0 Zero
var2=(LevelValue-20)*0.0166*3
if var2 < 0
    var2=0
elif var2 > 3
    var2=3
endif
var3=RandXOffset+3
//____________________
label _0
if FrameGE 5
    EstOPosVecR var0 var1 0.5
    if var0 < 0.1 && var0 > -0.1
        var0=0.1
    endif
    var5=var1/var0
    Abs var5
    if var5 > 4
        AbsStick 0 1
    endif
elif FrameGE 2
    var5=OPos*Direction
    if var5 < 0
        AbsStick OPos
    endif
endif
if FrameGE var3
    if FrameGE 14
        if LevelValue > 55
            SetTimeout 28
            Seek
        else
            Finish
        endif
    endif
else
    Button B
endif
Return
//____________________
label
if FrameGE 28 || Idling || Falling
    Finish
endif
Norm var5 ObjXSpeed ObjYSpeed
if var5 > 0.5
    var5=ObjXSpeed
    Abs var5
    SetVec var0 OXSpeed
    var0*=var2
    var1*=var2
    AddVector var0 ExactOXCoord
    SubVector var0 ObjXCoord
    if ObjYSpeed > var5
        if var1 < 0
            Finish
        endif
        var6=var1/ObjYSpeed
        var5=ObjXSpeed/ObjYSpeed*var6-var0
        if var5 < -5
            AbsStick 1
        elif var5 > 5
            AbsStick (-1)
        endif
    else
        var5=var0*Direction
        if var5 < 0
            Finish
        endif
        var6=var0/ObjXSpeed
        var5=ObjYSpeed/ObjXSpeed*var6-var1
        if var5 < -8
            AbsStick 0 1
        elif var5 > 10
            AbsStick 0 (-1)
        endif
    endif
endif
Return
Return
