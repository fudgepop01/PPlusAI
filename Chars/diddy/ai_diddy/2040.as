#include <Definition_AIMain.h>
//TrueID=0x2040
id 0x2040

//Set Unknown
unk 0xB0000

//Strings

SetVec var0 Zero
var2=99
var3=LevelValue
if LevelValue > 60
    var3=60
endif
//____________________
label
Goto _2
if !(Falling)
    if FrameGE 4
        Finish
    endif
elif DiddyCling && ODistLE 15
    SetTimeout 40
    Seek _1
elif InAirOnSaved
    if FrameGE 8
        Finish
    endif
else
    var4=YCoord-var1
    var5=Rnd*10+10
    if DiddyCling && LevelValue >= 50 && var4 > var5 && OutOfStage && DistFrontEdge < -40
        SetTimeout 40
        Seek _1
    else
        var6=DistFrontEdge
        var7=var1+(-25)
        var8=var1+15
        if var6 > -20 && var6 < 10 && YCoord > var7 && YCoord < var8
            Return
        elif YSpeed < 0.5
            Seek
        endif
    endif
endif
Return
//____________________
label
Goto _2
if FrameGE 4
    if !(InAirOnSaved)
        Goto _0
        Seek
        Return
    endif
    if FrameGE 10
        Finish
    endif
endif
Return
//____________________
label
if Idling || Falling
    Finish
endif
Button B
AbsStick var2 0.6
if FrameGE var3
    Seek
endif
Return
//____________________
label
if FrameGE 2
    Finish
endif
Return
//____________________
label _0
ClearStick
GetNearestCliff var0
var9=var0-XCoord
if var9 > 60
    var2=1
elif var9 >= -60
    var9*=0.0166
    var2=var9
else
    var2=-1
endif
AbsStick 0 1
Button B
Return
//____________________
label _1
Goto _2
if !(FrameGE 2)
    Button B
elif Falling || !(InAir)
    Finish
endif
Return
//____________________
label _2
if !(InAir)
    Finish
endif
GetReturnGoal var0
var9=var0-XCoord
var10=Direction
if var9 < 0
    var10*=-1
endif
Abs var9
if var9 > 5
    var9-=5
    var9/=5
    if var9 > 1
        var9=1
    endif
    var9*=var10
    Stick var9
endif
Return
Return
