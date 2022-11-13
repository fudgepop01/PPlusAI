#include <Definition_AIMain.h>
id 0x8103
unk 0x0

XReciever
// because some things might rely on these being unset
label reroll
var14 = Rnd * 0
  GetNearestCliff var0
  var0 = TopNX - var0
  var0 *= -1
  var1 *= -1
  var1 += TopNY
Abs var0
// {INITIALIZATION}
label begin
var21 = 3
SetDebugOverlayColor 255 136 0 221
EnableDebugOverlay

XGoto PerFrameChecks
XReciever
Seek begin


// detects if below stage

GetNearestCliff var0
GetReturnGoal var1

// {NCXOFFS_REDEFINE}

var17 = var1 - var0 
var16 = 0
if var17 < 10 && var17 > -10
  if var17 < 0
    var2 = 5
  else
    var2 = -5
  endif
elif var1 < TopNX && TopNX < var0
elif var0 < TopNX && TopNX < var1  
elif TopNY < var2
  if var17 < 0
    var2 = 7
  else
    var2 = -7
  endif
  var16 = 1
endif

GetColDistPosRel var17 var22 TopNX TopNY 0 150 0
if !(Equal var17 -1) || !(Equal var22 -1)
  var16 = 1
endif

  GetNearestCliff var0
  var0 = TopNX - var0
  var0 *= -1
  var1 *= -1
  var1 += TopNY

if Equal CurrAction 16
  Goto handleSFall
  Return
elif Equal CurrAction 276 || Equal CurrAction 279 || Equal CurrAction 280
  Goto handleUSpecial
  Return
elif Equal CurrAction 274
  Goto handleNSpecial
  Return
elif Equal CurrAction 275 || Equal CurrAction 282 || Equal CurrAction 283 || Equal CurrAction 284
  Goto handleSSpecial
  Return
elif Equal CurrAction 277 || Equal CurrAction 285
  Goto handleDSpecial
  Return
elif CurrAction >= 11 && CurrAction <= 13
  if YDistBackEdge < -10
    var21 = 0
    var20 = -1
    Call MainHub 
  elif YSpeed > 0 || AnimFrame < 2
    Goto handleJumpToStage
    Return
  endif
endif

  var17 = 15
  var3 = XSpeed * var17
  GetYDistFloorOffset var2 var3 5 0
  // var22 = TopNY - var2 
  // DrawDebugLine TopNX TopNY TopNX var22 255 0 0 221
  if !(Equal var2 -1) 
    var2 = 0
  elif Equal DistBackEdge DistFrontEdge
    var2 = 2
  elif Equal var2 -1
    if var3 < 0
      var2 = 1
    elif var3 > 0
      var2 = -1
    endif
  else
    var2 = 0
  endif

if YDistFloor > -1 || Equal AirGroundState 1
  var21 = 0
  var20 = -1
  var14 = BBoundary
  var13 = 0
  Call MainHub
endif

// {RECOVERY_CONDITIONS}

Return

label handleNSpecial
  Seek reroll
Return

label handleSSpecial
  Seek reroll
Return

label handleUSpecial
  Seek reroll
Return

label handleDSpecial
  Seek reroll
Return

label handleSFall
  var17 = TopNX * -1
  AbsStick var17
Return

label handleJumpToStage
  ClearStick
  if Equal var16 1
    var17 = var0 * -1
    AbsStick var17
  elif var0 > 6 || var0 < -6
    var17 = var0 * -1
    AbsStick var17
  elif YDistBackEdge < 27.84
    var17 = var0 * -3
    AbsStick var17
  endif
Return

Return
Return
