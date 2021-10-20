#include <Definition_AIMain.h>
//TrueID=0x6030
id 0xE030

//Set Unknown
unk 0xE0000

//Strings
str "#wait_f"



var0=2
var1=0
SetVec var2 Zero
if CalledAs 0x603D
    Seek _0
    Return
endif
if CalledAs FSmash || CalledAs USmash || CalledAs DSmash
    var4=1
    var5=1
elif CalledAs Jab123 || CalledAs NSpecial
    var4=0
    var5=0
elif CalledAs Grab
    var4=(LevelValue-100)*(-0.2)
    Random var5
    var5*=0.6
    var5+=0.4
    var4*=var5
    var4+=2
    var5=0
elif CalledAs USpecial || CalledAs SSpecial || CalledAs DSpecial
    var4=1
    var5=1
else
    var4=8
    var5=0.7
endif
if Rnd < 0.5
    var4+=0.5
endif
var6=var4+Func12+3
if CalledAs USmash && OInAir
    var7=15*Rnd
    var6+=var7+25
endif
var8=-1
//____________________
label
if CalledAs Jab123 || CalledAs FTilt || CalledAs UTilt || CalledAs DTilt || CalledAs NSpecial || CalledAs SSpecial || CalledAs USpecial || CalledAs DSpecial || CalledAs Grab
    Seek _1
else
    Seek
endif
Jump
Return
//____________________
label
if FrameGE var0
    Seek
endif
Return
//____________________
label _1
var9=var5
if !(FrameGE var4)
    var9*=NumFrames
    var9/=var4
endif
if CalledAs FTilt || CalledAs FSmash || CalledAs SSpecial
    var9*=OPos
    AbsStick var9
elif CalledAs UTilt || CalledAs USmash || CalledAs USpecial
    Stick 0 var9
elif CalledAs DTilt || CalledAs DSmash || CalledAs DSpecial
    var9*=-1
    Stick 0 var9
endif
if CalledAs Grab
    Button R
endif
if FrameGE var4
    if var1 < 1
        if CalledAs NSpecial || CalledAs SSpecial || CalledAs USpecial || CalledAs DSpecial
            Button B
        else
            Button A
        endif
        var1=Func13
        if var8 < 0 && LevelValue > 55
            if CalledAs FTilt || CalledAs FSmash
                var8=1
                if var6 < 4
                    var6+=4
                endif
            elif IsCharOf Robot && CalledAs NSpecial
                var8=1
                if var6 < 4
                    var6+=4
                endif
            endif
        endif
    else
        var1-=1
    endif
    if var8 > 0
        if var8 > 1
            Goto _2
        else
            var8+=1
        endif
    endif
    if !(CalledAs DSmash) && LevelValue > 45
        var10=Direction*OPos
        if var10 < 0
            var6=0
        endif
    endif
    if LevelValue > 55 && !(IsCaught) && !(OInAir)
        if CalledAs FSmash
            var7=AIPDFloat2*0.3
            if XDistLE var7
                var6=0
            endif
        elif CalledAs USmash
            var7=AIPDFloat2*0.1
            if ODistLE var7
                var6=0
            endif
        elif CalledAs DSmash
            var7=AIPDFloat2*0.2
            if ODistLE var7
                var6=0
            endif
        endif
    endif
    if CalledAs USmash && OInAir
        EstOPosVecR var2 var3 0.5
        var3-=HurtboxSize
        if var3 < 8
            var6=0
        endif
    endif
    if FrameGE var6
        if var8 > 0
            Seek
        else
            Finish
        endif
    endif
endif
Return
//____________________
label
if FrameGE 4
    Finish
endif
Goto _2
Return
//____________________
label _2
var12=HurtboxSize*0.6+YCoord
if OYCoord > var12
    Stick 0 0.6
else
    var13=OHurtboxSize+OYCoord
    if var13 < var12
        Stick 0 (-0.6)
    else
        var12=HurtboxSize+YCoord+2
        if var13 > var12
            Stick 0 0.6
        endif
    endif
endif
Return
//____________________
label _0
if FrameGE 4
    Finish
endif
Return
Return

