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
  var4 = 0
  var5 = Rnd
  var6 = Rnd
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



var17 = var1 - var0 
var16 = 0
if var17 < 10 && var17 > -10
  if var17 < 0
    var2 = 4
  else
    var2 = -4
  endif
elif var1 < TopNX && TopNX < var0
elif var0 < TopNX && TopNX < var1  
elif TopNY < var2
  if var17 < 0
    var2 = 6
  else
    var2 = -6
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
elif Equal CurrAction 276
  Goto handleUSpecial
  Return
elif Equal CurrAction 274
  Goto handleNSpecial
  Return
elif Equal CurrAction 275
  Goto handleSSpecial
  Return
elif Equal CurrAction 281 || Equal CurrAction 284
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

  GetNearestCliff var0
  var0 = TopNX - var0
  var0 *= -1
  var1 *= -1
  var1 += TopNY
  
  // drift towards goal
  var17 = var0 * -1
  ClearStick
  AbsStick var17
  var2 = var0
  Abs var2
  var17 = TopNY - BBoundary
  if !(NoOneHanging) && !(Equal var16 1)
    LOGSTR_NL 1936682240 1701801472 1696622592 1634625280 1768843008
    var1 -= 25
  endif
  if YDistBackEdge > 23.84 && var2 <= 15 && NumJumps > 0
    Button X
    Goto handleJumpToStage
    Return
  endif
  var1 -= var14
  if var6 <= 0.65 && YDistBackEdge < 50 && Equal var4 0
    var4 = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif
  if var2 <= 90 && YDistBackEdge > 84 && Equal var4 0
    var4 = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif 
  if Equal var4 1 || var5 <= 0.1 && NumJumps > 0
    if YDistBackEdge > 21.84 && Rnd < 0.5
      Button X
      Goto handleJumpToStage
      Return
    endif
  elif YDistBackEdge > 97.84 || var17 < 18
    if NumJumps > 0 && Equal var4 1
      Button X
      Goto handleJumpToStage
      Return
    else
      var4 = 1
      Button B
      ClearStick
      AbsStick 0 (0.7)
      Return
    endif
  endif

Return

label handleNSpecial

Return

label handleSSpecial

Return

label handleUSpecial
  Seek reroll
  if CurrAction <= 32 
    var21 = 0
    Call MainHub
  endif
  if Equal var16 0 && var1 > 0
    GetRndPointOnStage var0
    var17 = var0 - TopNX
    AbsStick var17
  else
    var17 = var0 * -1
    AbsStick var17
  endif
Return

label handleDSpecial

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
