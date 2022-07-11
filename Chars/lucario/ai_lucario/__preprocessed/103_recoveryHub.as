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
  var1 = var1 - (TopNY * -1)
Abs var0
  var4 = 0
  var5 = Rnd
  var6 = Rnd
  var7 = Rnd
label begin
var21 = 3
SetDebugOverlayColor 255 136 0 221
EnableDebugOverlay

if FramesHitstun > 0 && CurrAction >= 67 && CurrAction <= 69
  CallI AttackedHub
elif CurrAction >= 115 && CurrAction <= 117
  CallI OnLedge
elif Equal CurrAction 189 || Equal CurrAction 190
  var21 = 0
  CallI MainHub
endif


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
  var1 = var1 - (TopNY * -1)

if Equal CurrAction 16 || Equal CurrAction 284
  Goto handleSFall
  Return
elif Equal CurrAction 276 || Equal CurrAction 283
  Goto handleUSpecial
  Return
elif Equal CurrAction 274 || Equal CurrAction 279 || Equal CurrAction 280 || Equal CurrAction 281
  Goto handleNSpecial
  Return
elif Equal CurrAction 275 || Equal CurrSubaction 102
  Goto handleSSpecial
  Return
elif Equal CurrAction 277
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

if YDistBackEdge < 0
  XGoto PerFrameChecks
  XReciever
  Seek begin
endif

  GetNearestCliff var0
  var0 = TopNX - var0
  var0 *= -1
  var1 *= -1
  var1 = var1 - (TopNY * -1)
  Norm var3 var0 var1
  Abs var3
  
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
  if YDistBackEdge > 30.689999999999998 && var2 <= 15 && NumJumps > 0
    Button X
    Goto handleJumpToStage
    Return
  endif
  var1 -= var14
  if Equal var4 1 || var5 <= 0.65 && NumJumps > 0
    if YDistBackEdge > 28.689999999999998 && Rnd < 0.5
      Button X
      Goto handleJumpToStage
      Return
    endif
  elif YDistBackEdge > 78.69 || var17 < 18
    if NumJumps > 0 && Rnd < 0.5
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
  if YDistBackEdge < 10 && var2 > 20 && Rnd < 0.2
    Button A
    ClearStick
    AbsStick 0 (-0.7)
    Return
  endif
  if YDistBackEdge < 30 && var2 > 35 && var7 < 0.75
    Button B
    ClearStick
    AbsStick 0 (-0.7)
    Return
  endif
  if var6 <= 0.15 && var3 < 64 && YDistBackEdge < 20 && Equal var4 0
    var4 = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif
  if var3 > 29 && var3 < 64 && Equal var4 0
    var4 = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif

Return

label handleNSpecial
  Seek reroll
// move "nspecial" not found
Return

label handleSSpecial
  Seek reroll
// move "sspecial" not found
Return

label handleUSpecial
  if Equal var16 1
    if var0 > TopNX
      var0 += 5
    else
      var0 -= 5
    endif
  endif
  if !(Equal CurrSubaction 476) && !(Equal CurrSubaction 477)
    if !(NoOneHanging)
      var1 -= 25
      if var0 > 0
        var0 += 15
      else
        var0 -= 15
      endif
    endif
    if Equal var16 0
      if XSpeed < 0 && var0 < 0 
        var0 -= 50
      elif XSpeed > 0 && var0 > 0
        var0 += 50
      endif
    endif
    var17 = var0
    Abs var17
    if var17 < 5 && var1 > -3 && var1 < 5 && YSpeed < 0
      ClearStick
    else
      var4 = var0
      var3 = var1
      Norm var17 var0 var1
      var0 /= var17
      var1 /= var17
      var0 *= -1
      var1 *= -1
      Abs var4
      var17 = XSpeed
      Abs var17
      if var3 < 0 && var4 < 30 && var17 > 2
        var1 -= 1
      elif var3 < 20 && var4 < 30 && YSpeed > 0
        var1 -= 1
      endif
      if 0.1 < var0 && var0 < 0.25
        AbsStick 0.3 var1
      elif -0.25 < var0 && var0 < -0.1
        AbsStick -0.3 var1
      else
        AbsStick var0 var1
      endif
    endif
  else
    var17 = TopNX * -1
    AbsStick var17
  endif
Return

label handleDSpecial
  Button A
  Stick 0 (-1)
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
  elif YDistBackEdge < 34.69
    var17 = var0 * -3
    AbsStick var17
  endif
Return

Return
Return
