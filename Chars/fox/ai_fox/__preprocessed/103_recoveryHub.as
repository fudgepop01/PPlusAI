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
  var11 = 20
  var4 = 0
  var5 = Rnd
  if var1 > 85 || var0 > 90
    var5 = 0
  endif
  var6 = Rnd
  var9 = Rnd
  var7 = Rnd
  if var0 > 90
    var7 = 0
  endif
  var8 = Rnd
  var10 = Rnd
  if var0 > 42.5
    var10 = 1
  endif
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
    var2 = 1
  else
    var2 = -1
  endif
elif var1 < TopNX && TopNX < var0
elif var0 < TopNX && TopNX < var1  
elif TopNY < var2
  if var17 < 0
    var2 = 1
  else
    var2 = -1
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

if Equal CurrAction 16 || Equal CurrSubaction 478
  Goto handleSFall
  Return
elif Equal CurrAction 276 || Equal CurrAction 279 || Equal CurrAction 280
  Goto handleUSpecial
  Return
elif Equal CurrAction 274
  Goto handleNSpecial
  Return
elif Equal CurrAction 275 || Equal CurrAction 297
  Goto handleSSpecial
  Return
elif Equal CurrAction 277 || Equal CurrAction 282
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
  Norm var3 var0 var1
  Abs var3
  if Equal var16 0
    if var6 < 0.85
      var22 = 0.7 - var9
      var22 /= 0.7
      var22 *= 25
      var11 += var22
    endif
    if var9 < 0.7
      var22 = 0.7 - var9
      var22 /= 0.7
      var22 *= 50
      var11 += var22
    endif
  endif
  
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
  if YDistBackEdge > 38.39 && var2 <= 15 && NumJumps > 0
    Button X
    Goto handleJumpToStage
    Return
  endif
  var1 -= var14
  if var7 <= 0.7 && YDistBackEdge > -12 && YDistBackEdge < 3 && var2 <= 90
    Button B
    ClearStick
    Stick 1
    Return
  endif
  if var6 <= 0.85 && var3 < 85 && YDistBackEdge < 20 && Equal var4 0
    var4 = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif
  var22 = 85 - var11
  if var3 > var22 && var3 < 85 && Equal var4 0
    var4 = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif
  if Equal var4 1 || var5 <= 0.5 && NumJumps > 0
    if YDistBackEdge > 36.39 && Rnd < 0.5
      Button X
      Goto handleJumpToStage
      Return
    endif
  elif YDistBackEdge > 107.39 || var17 < 18
    if NumJumps > 0
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
  if AnimFrame > 2 && AnimFrame < 5
    var22 = TopNX * -1
    AbsStick var22
  else
    Stick 1
  endif
Return

label handleUSpecial
  if Equal var16 1
    if var0 > TopNX
      var0 += 3
    else
      var0 -= 3
    endif
  endif
  if !(Equal CurrSubaction 479)
    if !(NoOneHanging) && !(Equal var16 1)
      var1 -= 45
    endif
    if var10 < 0.6
      var22 = Rnd * 70 + 20
      var1 -= var22
    endif
    var4 = var0
    var3 = var1
    Norm var17 var0 var1
    var0 /= var17
    var1 /= var17
    var0 *= -1
    var1 *= -1
    if 0.1 < var0 && var0 < 0.25
      AbsStick 0.3 var1
    elif -0.25 < var0 && var0 < -0.1
      AbsStick -0.3 var1
    else
      AbsStick var0 var1
    endif
  else
    var17 = TopNX * -1
    AbsStick var17
  endif
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
  elif YDistBackEdge < 42.39
    var17 = var0 * -3
    AbsStick var17
  endif
Return

Return
Return
