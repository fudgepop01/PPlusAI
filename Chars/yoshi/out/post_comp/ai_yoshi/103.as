#include <Definition_AIMain.h>
//TrueID=0x103
id 0x8103

//Set Unknown
unk 0x0

//Strings

//____________________
label _0
GetNearestCliff var0
var0-=CenterX
var1*=-1
var1+=CenterY
if var1 > 0
    var22=Direction*var0
    if var22 < 0
        var22=Width*2
        if var0 < 0
            var0-=var22
        else
            var0+=var22
        endif
    endif
endif
Abs var0
var5=0
var6=0
if !(NoOneHanging) && Rnd < 0.8 || Rnd < 0.25
    var6=45*Rnd+HurtboxSize
endif
//____________________
label _1
var21=3
SetDebugOverlayColor 255 136 0 221
EnableDebugOverlay
XGoto 0x8501    //Corrupted?
Seek _1
GetNearestCliff var0
GetReturnGoal var1
var17=var1-var0
var16=0
if var17 < 10 && var17 > -10
    if var17 < 0
        var2=3
    else
        var2=-3
    endif
elif var1 < TopNX && var0 > TopNX || var0 < TopNX && var1 > TopNX
elif TopNY < var2
    if var17 < 0
        var2=5
    else
        var2=-5
    endif
    var16=1
endif
GetColDistPosRel var17 var22 TopNX TopNY 0 150 0
if !(Equal var17 (-1)) || !(Equal var22 (-1))
    var16=1
endif
GetNearestCliff var0
var0-=CenterX
var1*=-1
var1+=CenterY
if var1 > 0
    var22=Direction*var0
    if var22 < 0
        var22=Width*2
        if var0 < 0
            var0-=var22
        else
            var0+=var22
        endif
    endif
endif
var17=0
if Equal CanCancelAttack 1
    if Equal CurrAction 16 || Equal CurrAction 276 || Equal CurrAction 274 || Equal CurrAction 275 || Equal CurrAction 281 || Equal CurrAction 282 || Equal CurrAction 284 || Equal CurrAction 277 || Equal CurrAction 285 || Equal CurrAction 286 || Equal CurrAction 287
        Seek _2
        Jump
    endif
endif
if CurrAction >= 98 && CurrAction <= 108 && AnimFrame < 8
    Return
elif Equal CurrAction 16
    Goto _7
    var17=1
elif Equal CurrAction 276
    Goto _5
    var17=1
elif Equal CurrAction 274
    Goto _3
    var17=1
elif Equal CurrAction 275 || Equal CurrAction 281 || Equal CurrAction 282 || Equal CurrAction 284
    Goto _4
    var17=1
elif Equal CurrAction 277 || Equal CurrAction 285 || Equal CurrAction 286 || Equal CurrAction 287
    Goto _6
    var17=1
elif CurrAction >= 11 && CurrAction <= 13
    if YDistFloor > -1
        var21=0
        var20=-1
        var14=BBoundary
        var13=0
        Call MainHub
    elif CharYSpeed > 0 || AnimFrame < 2
        var17=-1
        Goto _8
        Seek _1
        if AnimFrame < 10
            Return
        endif
    endif
endif
//____________________
label _2
Seek _1
if YDistFloor > -1
    if var17 > 0
        ClearStick
        var17=TopNX*(-1)
        AbsStick var17
        Return
    elif CurrAction <= 25 || Equal CurrAction 190
        var21=0
        var20=-1
        var14=BBoundary
        var13=0
        Call MainHub
    endif
elif HasCurry && Equal HitboxConnected 1
    var21=0
    Call MainHub
elif !(Equal var17 0)
    Return
endif
var17=15
var3=XSpeed*var17
GetYDistFloorOffset var2 var3 5 0
if !(Equal var2 (-1))
    var2=0
elif Equal DistBackEdge DistFrontEdge
    var2=2
elif Equal var2 (-1)
    if var3 < 0
        var2=1
    elif var3 > 0
        var2=-1
    endif
else
    var2=0
endif
GetNearestCliff var0
var0-=CenterX
var1*=-1
var1+=CenterY
var1*=-1
var23=HurtboxSize*0.5
var1-=var23
var3=var1
if !(NoOneHanging) || var6 >= 1 && var16 <= 0
    var3+=var6
endif
ClearStick
var23=var0
if var1 > 0 && var16 < 1
    var22=Width*2
    if var23 > 0
        var23-=var22
    else
        var23+=var22
    endif
endif
AbsStick var23
var2=var0
Abs var2
var23=Width*0.5
var2-=var23
Abs var2
var23=HurtboxSize*0.5+CenterY
DrawDebugRectOutline CenterX var23 1 1 255 255 255 221
DrawDebugRectOutline CenterX CenterY Width HurtboxSize 136 136 136 221
DynamicDiceClear 0
DynamicDiceAdd 0 0 1
if NumJumps > 0
    var23=Width*(-0.5)+150
    var17=(var0-var23)+CenterX
    if var0 < 0
        var17=var0+var23+CenterX
    endif
    var22=-90
    DrawDebugRectOutline var17 (-90) 300 150 255 0 0 170
    if var2 > 0 && var2 < 300 && var1 < 165 && var3 > 15
        DynamicDiceAdd 0 1 6
    endif
endif
var23=Width*(-0.5)+15
var17=(var0-var23)+CenterX
if var0 < 0
    var17=var0+var23+CenterX
endif
var22=-9.5
DrawDebugRectOutline var17 (-9.5) 0 15 0 255 0 170
if var2 > 15 && var2 < 15 && var1 < 17 && var1 > 2
    DynamicDiceAdd 0 3 6
endif
var23=TopNY-BBoundary
if var23 > 20
else
    DynamicDiceClear 0
    DynamicDiceAdd 0 0 1
    if NumJumps > 0
        DynamicDiceAdd 0 1 100
    endif
    if var23 < 2
        DynamicDiceAdd 0 3 100
    endif
endif
DynamicDiceRoll 0 var5 0
if var5 > 1
    ClearStick
endif
if var5 >= 5
    Button B
    AbsStick 0 (-1)
elif var5 >= 3
    Button B
    AbsStick var0
elif var5 >= 2
    Button B
    AbsStick 0 1
elif var5 >= 1
    ClearStick
    var23=TopNX*(-1)
    AbsStick var23
    Button X
endif
Return
//____________________
label _3
Return
//____________________
label _4
if AnimFrame > 2 && AnimFrame < 5
    var22=TopNX*(-1)
    AbsStick var22
elif True
    AbsStick var0 1
endif
Return
//____________________
label _5
Return
//____________________
label _6
Return
//____________________
label _7
var17=TopNX*(-1)
AbsStick var17
Return
//____________________
label _8
ClearStick
if Equal var16 1 || var0 > 6 || var0 < -6
    AbsStick var0
elif YDistBackEdge < 56.78
    var17=var0*3
    AbsStick var17
endif
Return
Return
Return
