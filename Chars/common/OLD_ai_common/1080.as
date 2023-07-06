#include <Definition_AIMain.h>
//TrueID=0x1080
id 0x1080

//Set Unknown
unk 0x110000

//Strings

var0=0
SetVec var1 Zero
var3=25
var4=18
if IsCharOf Ike
    var3+=10
    var4+=10
endif
Random var5
var6=(100-LevelValue)*0.08
var5*=var6
var5+=var6
SetTimeout 20
//____________________
label _0
if OutOfStage
    var0=60
endif
if var0 > 0
    Goto _1
else
    var0-=1
    var7=OPos
    AbsStick var7
endif
if !(InAir)
    Finish
endif
if var5 > 0
    var5-=1
elif YSpeed > 0 && LevelValue < 30
    Return
elif ODistLE var3
    SetTimeout 20
    Seek
else
    EstOPosVecR var1 var2 0.5
    Norm var9 var1 var2
    if var9 < var4
        SetTimeout 20
        Seek
    endif
endif
Return
//____________________
label
var6=LevelValue*0.0089+0.1
Random var10
if var10 > var6
    Random var5 6 10
    Seek _0
    Return
endif
EstOPosVecR var1 var2 0.3
var1*=Direction
if ODamage > 50
    var11=(ODamage-50)*0.01
    if var11 > 0.7
        var11=0.7
    endif
    if Rnd < var11
        SetVec var12 var1
        Abs var12
        Abs var13
        if var12 > var13
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
if var2 < 0 && YSpeed > 0.05
    var2=0
endif
if var2 > 16
    Call slot14
elif var2 < -20
    Call slot15
elif var1 < -8
    Call slot13
elif var1 > 12
    Call slot12
else
    Call slot11
endif
Finish
Return
//____________________
label _1
GetReturnGoal var14
var16=var14-XCoord
var7=Direction
if var16 < 0
    var7*=-1
endif
Abs var16
if var16 > 5
    var16-=5
    var16/=5
    if var16 > 1
        var16=1
    endif
    var16*=var7
    Stick var16
endif
Return
Return
