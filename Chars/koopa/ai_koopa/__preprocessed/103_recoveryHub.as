#include <Definition_AIMain.h>
id 0x8103
unk 0x0

XReciever
// because some things might rely on these being unset
label reroll
  var4 = 0
  var8 = 0
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

if Equal CurrAction 16
  Goto handleSFall
  Return
elif Equal CurrAction 276 || Equal CurrAction 279 || Equal CurrAction 280
  Goto handleUSpecial
  Return
elif Equal CurrAction 274
  Goto handleNSpecial
  Return
elif Equal CurrAction 284 || Equal CurrAction 285
  Goto handleSSpecial
  Return
elif Equal CurrAction 281 || Equal CurrAction 282 || Equal CurrAction 283
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

if Equal var2 0 || Equal AirGroundState 1
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
  if YDistBackEdge < 32.48 && var2 <= 15 && NumJumps > 0
    Button X
    Goto handleJumpToStage
    Return
  endif
  if Equal var4 1 || var5 <= 0.4 && NumJumps > 0
    if YDistBackEdge > 30.479999999999997 && Rnd < 0.5
      Button X
      Goto handleJumpToStage
      Return
    endif
  endif
  if YDistBackEdge > 21.47999999999999 || var17 < 18
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
  if XSpeed > 1 || XSpeed < -1
    if var7 <= 0.5 && YDistBackEdge < 20 && Rnd < 0.2 && Equal var8 0
      Button B
      ClearStick
      Stick 1
      Return
    endif
  endif
  if var6 <= 0.25 && YDistBackEdge < -10 && Equal var4 0
    var4 = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif
  if var2 <= 70 && YDistBackEdge > 24 && Equal var4 0
    var4 = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
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
  Seek reroll
  if !(True)
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
  elif YDistBackEdge < 36.48
    var17 = var0 * -3
    AbsStick var17
  endif
Return

Return
Return