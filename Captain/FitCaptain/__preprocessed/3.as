// EDGEGUARD HUB
// a place to figure out how to edgeguard the opponent
#include <Definition_AIMain.h>
id 0x8003

unk 0x0

LOGSTR 1667329024 1818584064 0 0 0

// risky - some macros use var5, but we aren't using any macros here so it should be fine


SetVec var1 Zero
GetNearestCliff var1

var1 = TopNX - var1
var1 *= -1
var2 = var2 - TopNY * -1

var0 = var1
Abs var0
var5 = OXDistFrontEdge
Abs var5

// if it's not worth going for an edgeguard, don't bother
if Equal OIsOnStage 1 || YSpeed < -0.15
  var18 = 255
  Call RecoveryHub
// elif OYDistFrontEdge > 0 && var5 < 3
endif

if OYDistFrontEdge > 0 && var5 > 30 && var0 > 5
  var3 = 1
else
  var3 = Rnd * 3 + 1
endif
// var3 = 2
label
SetVec var1 Zero
GetNearestCliff var1

DrawDebugRectOutline var1 var2 60 25 255 0 0 136
var1 = TopNX - var1
var1 *= -1
var2 = var2 - TopNY * -1

var0 = var1
Abs var0
var5 = OXDistFrontEdge
Abs var5

if var3 <= 1
  if !(Equal AirGroundState 3)
    if Equal IsOnStage 1
      // wavedash back to ledge?
      if var0 < 10
        var0 = var1 * Direction
        if var0 < 0
          Stick -1
          Return
        elif InAir && var0 > 5
          Button R
          Stick -0.8 (-0.75)
        elif var0 > 0 && !(Equal CurrAction 10)
          Button X
        endif
      else
        var0 = OPos*0.5
        AbsStick var0
      endif
    elif var0 > 3
      var18 = 255
      Call RecoveryHub
    endif
  elif var5 < 10 && OYDistFrontEdge < 10
    Button R
    Call AIHub
  endif
  Return
elif var3 <= 3 && OYDistFrontEdge < 10
  if var1 < 60 && var1 > -60 && var2 > -25
    if var2 > 5 || Equal AirGroundState 1
      var19 = 255
      Call FAir
    elif YSpeed > 0.15 && var2 > -5
      var19 = 255
      Call FAir
    elif var2 > -5
      var19 = 255
      Call UAir
    endif
  else
    var18 = 255
    Call RecoveryHub
  endif
else
  if Equal AirGroundState 1 && Rnd < 0.2
    Button X
  endif
endif

if Damage < 130 && var2 < -25
  var18 = 255
  Call RecoveryHub
endif
Return

label performEdgeguard1
var19 = 255
if Equal AirGroundState 1
  Call FAir
else
  Call UAir
endif
Return
Return
