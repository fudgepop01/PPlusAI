#include <Definition_AIMain.h>
//TrueID=0x50
id 0x8050

//Set Unknown
unk 0xA0000

//Strings

if XDistFrontEdge <= 50 || XDistBackEdge <= 50
    Finish
endif
var0=OPos
var1=25
if IsCharOf Ike
    var1+=10
endif
if CalledAs SHopTowards || CalledAs SHopNeutral || CalledAs SHopAway || CalledAs SHopDJ
    var2=Rnd*20+8
    var3=var2
else
    var3=1000
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
if CalledAs SHopDJ || CalledAs FHopDJ
    var2=OPos*Direction
    if var2 > 0
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
if CalledAs FHopAway || CalledAs SHopAway
    var4=Rnd*16+8
    var5=Rnd-0.5
    var6=var5+2
    var0*=-3
    Seek _1
elif CalledAs SHopDJ || CalledAs FHopDJ
    var0*=-3
    Seek _1
else
    var2=OPos*Direction
    if var2 < 0
        Seek
    else
        Seek _1
    endif
endif
Jump
Return
//____________________
label
var7=OPos
var0*=0.6
AbsStick var0
var7=OPos
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
if FrameGE var3
    Finish
endif
if CalledAs SHopTowards || CalledAs SHopDJ
    Goto _3
    AbsStick var0
elif CalledAs FHopTowards || CalledAs FHopDJ
    if !(FrameGE 8) && YCoord < OYCoord && XDistLE 10
        AbsStick 0
    else
        Goto _3
        AbsStick var0
    endif
elif CalledAs FHopAway
    Stick (-1)
elif CalledAs SHopAway
    Goto _3
    var0*=-1
    AbsStick var0
    var0*=-1
    if FrameGE var4
        Finish
    endif
endif
if FrameGE 10 && !(InAir)
    Finish
endif
if Falling
    if ODistLE var1
        Call Unk1080
        Finish
    elif !(OutOfStage) && !(XDistLE 30) && LevelValue > 30
        var23=LevelValue*LevelValue*0.01*var2
        var2=var23
        if IsCharOf Mario
            var2*=0.0015
        elif IsCharOf Diddy
            var2*=0.0002
        else
            var2*=0.0005
        endif
        if Rnd < var2
            var8=OPos*Direction
            if var8 > 0
                AtkDiceRoll slot16
                if !(DiceRollResult Nothing)
                    Call 
                    Finish
                endif
            endif
        endif
    endif
endif
if CalledAs SHopTowards || CalledAs SHopNeutral || CalledAs SHopDJ
    if !(FrameGE 2)
        Button X
    endif
elif CalledAs SHopAway
    if FrameGE var5 && !(FrameGE var6)
        Button X
    endif
else
    var9=OYCoord-YCoord
    if !(FrameGE 20)
        Stick 0 1
    endif
    if FrameGE 30 && NumJumps > 0 && YSpeed < 0 && var9 > 30
        Seek
    endif
endif
Return
//____________________
label _2
if CalledAs SHopTowards || CalledAs FHopTowards || CalledAs SHopDJ || CalledAs FHopDJ
    Goto _3
    AbsStick var0
elif CalledAs FHopAway || CalledAs FHopAway
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
