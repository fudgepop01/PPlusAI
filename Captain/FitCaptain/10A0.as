#include <Definition_AIMain.h>
//TrueID=0x10A0
id 0x10A0

//Set Unknown
unk 0x00000

//Strings
// str "#jump_start_f"
// str "#meteo_range"
// str "#atk_range_base"
// str "#atk_range_rnd"
// str "#quick_range1"
// str "#quick_range2"
// str "#dash_range"

if Equal lastScript hex(0x8001)
  moveVariant = mv_edgeguard
  Call ApproachHub
else
  Call AIHub
endif

var0=30
var1=80
var2=40
SetTimeout 600
//____________________
label
if DistToOEdge > var2 && !(InAir)
    var3=LevelValue*0.0099
    if Rnd < var3
        SetTimeout 10
        Seek _0
        if Dashing
            Jump
        endif
        Return
    endif
endif
Seek _1
Jump
Return
//____________________
label _0
if Idling || Dashing
    // Call EdgeguardHub
    SetTimeout 600
    Seek
    Jump
endif
Return
//____________________
label _1
if !(MeteoChance)
    Finish
endif
if OutOfStage
    if NumJumps > 0.5
        Call RecoveryHub
    else
        Call RecoveryHub
    endif
endif
if Dashing
    var4=40
else
    var4=15
endif
var9=Direction*OPos
if var9 < 0
    var3=OPos*0.9
    AbsStick var3
    Return
elif DistToOEdge > var4
    if DistToOEdge > 10
        AbsStick OPos
    else
        var3=OPos*0.5
        AbsStick var3
    endif
    Return
else
    var3=OYCoord-YCoord
    if Dashing && var3 < 50 && var3 > 0 && XDistLE var0 var1
        var3=0.006*LevelValue
        if Rnd < var3
            if Dashing
                AbsStick OPos
            endif
            // Call EdgeguardHub
            Finish
        endif
    endif
    Seek
endif
Return
//____________________
label
if !(MeteoChance)
    Finish
endif
// WaitForGroundCanAct
Seek
Return
//____________________
label
if !(MeteoChance)
    Finish
endif
if CurrAction <= hex(0x09)
    if DistToOEdge > 7
        var3=0.5*OPos
        AbsStick var3
    elif DistToOEdge < 2
        var3=-0.7*OPos
        AbsStick var3
    else
        Call EdgeguardHub
        var3=OPos*Direction
        if var3 < 0
            var3=0.5*OPos
            AbsStick var3
        endif
    endif
endif
Return
Return
