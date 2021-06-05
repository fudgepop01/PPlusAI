#include <Definition_AIMain.h>
//TrueID=0x50
id 0x8050

//Set Unknown
unk 0x00000

//Strings

if XDistFrontEdge <= 50 || XDistBackEdge <= 50
    Goto _end
endif
var0=OPos
var10=25
if IsCharOf Ike
    var10+=10
endif
if CalledAs SHopTowards || CalledAs SHopNeutral || CalledAs SHopAway || CalledAs SHopDJ
    var11=Rnd*20+8
    var12=var11
else
    var12=1000
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
    var11=OPos*Direction
    if var11 > 0
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
    var13=Rnd*16+8
    var14=Rnd-0.5
    var15=var14+2
    var0*=-3
    Seek _1
elif CalledAs SHopDJ || CalledAs FHopDJ
    var0*=-3
    Seek _1
else
    var11=OPos*Direction
    if var11 < 0
        Seek
    else
        Seek _1
    endif
endif
Jump
Return
//____________________
label
var3=OPos
var0*=0.6
AbsStick var0
var3=OPos
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
if FrameGE var12
    Goto _end
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
    if FrameGE var13
        Goto _end
    endif
endif
if FrameGE 10 && !(InAir)
    Goto _end
endif
if Falling
    if ODistLE var10
        Call Unk1080
        Goto _end
    elif !(OutOfStage) && !(XDistLE 30) && LevelValue > 30
        var21=LevelValue*LevelValue*0.01*var11
        var11=var21
        if IsCharOf Mario
            var11*=0.0015
        elif IsCharOf Diddy
            var11*=0.0002
        else
            var11*=0.0005
        endif
        if Rnd < var11
            var17=OPos*Direction
            if var17 > 0
                AtkDiceRoll slot16
                if !(DiceRollResult Nothing)
                    Call
                    Goto _end
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
    if FrameGE var14 && !(FrameGE var15)
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

label _end
FORCED_SWITCH_CONDITIONS
Call AIHub
Return
Return
