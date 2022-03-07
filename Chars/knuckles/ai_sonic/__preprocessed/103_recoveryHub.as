#include <Definition_AIMain.h>
id 0x8103
unk 0x0

XReciever
// because some things might rely on these being unset
label reroll
  var4 = 0
  var5 = Rnd
  var6 = Rnd
  var7 = Rnd
  var9 = Rnd
  var10 = Rnd
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

if Equal CurrAction 16 || Equal CurrAction 14
  Goto handleSFall
  Return
elif Equal CurrAction 276 || Equal CurrAction 285 || Equal CurrAction 291
  Goto handleUSpecial
  Return
elif Equal CurrAction 274 || Equal CurrAction 293 || Equal CurrAction 25
  Goto handleNSpecial
  Return
elif Equal CurrAction 275 || Equal CurrAction 279
  Goto handleSSpecial
  Return
elif Equal CurrAction 277 || Equal CurrAction 292 || Equal CurrAction 286
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
  DrawDebugRectOutline var0 var1 10 10 0 255 0 221
  
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
  if YDistBackEdge < 31.43 && var2 <= 15 && NumJumps > 0
    Button X
    Goto handleJumpToStage
    Return
  endif
  if Equal var4 1 || var5 <= 0.6 && NumJumps > 0
    var22 = 29.43
    if !(NoOneHanging)
      var22 -= 20
    endif
    if YDistBackEdge > var22 && Rnd < 0.5
      Button X
      Goto handleJumpToStage
      var5 *= 1.25
      Return
    endif
  elif YDistBackEdge > 70.43 || var17 < 18
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
  var22 = Direction * -1 * 5
  GetYDistFloorOffset var22 var22 80 0
  if var6 <= 0.45 && YDistBackEdge > 5 && Equal var4 0 && Equal var22 -1 
    var4 = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif
  if var2 <= 45 && YDistBackEdge > 45 && Equal var4 0 && Equal var16 0 && Equal var22 -1 
    var4 = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif
  GetLaBasic var22 89 0
  if Equal var22 0 
    if YDistBackEdge > -40 && YDistBackEdge < -10 && var7 < 0.8
      Button B
      ClearStick
      Stick 1 0
      Return
    endif
    if YDistBackEdge > -100 && YDistBackEdge < -10 && var9 < 0.7
      Button B
      ClearStick
      Stick 1 0
      Return
    endif
    GetColDistPosRel var22 var22 0 TopNY 0 0 1
    if !(Equal var22 -1) && var10 < 0.55 
      Button B
      ClearStick
      Stick 1 0
      Return
    endif
  endif

Return

label handleNSpecial

Return

label handleSSpecial
  ClearStick
  var22 = var0
  Abs var0
  var23 = YDistBackEdge * -1
  if AnimFrame > 2 && AnimFrame < 5
    var22 = TopNX * -1
    AbsStick var22
  elif Equal CurrAction 275 && var23 > var22
    var21 = 16.9
    XGoto CalcAttackGoal
    XReciever
    var16 = 0
    XGoto SetAttackGoal
    XReciever
    var15 = -1
    Call MainHub
  elif YDistBackEdge > 10
    Button B
    Stick 0 1
  endif
Return

label handleUSpecial
  ClearStick
  if AnimFrame > 2 && AnimFrame < 5
    var22 = TopNX * -1
    AbsStick var22
  elif Equal var16 1
    var17 = var0 * -1
    AbsStick var17
  elif var0 > 6 || var0 < -6
    var17 = var0 * -1
    AbsStick var17
    var22 = HurtboxSize - 5
    if NoOneHanging && YDistBackEdge < var22 && var6 < 0.45
      AbsStick 0 (-1)
    endif
  else
    var17 = var0 * -1
    AbsStick var17
    if YDistBackEdge < 15 && YSpeed > 2
      var21 = 16.9
      XGoto CalcAttackGoal
      XReciever
      var16 = 0
      XGoto SetAttackGoal
      XReciever
      var15 = -1
      Call MainHub
    endif
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
  elif Equal IsOnStage 1
    var17 = TopNX * -1
    AbsStick var17
  elif var0 > 6 || var0 < -6
    var17 = var0 * -1
    AbsStick var17
  endif
  var22 = var0 * Direction
  if var22 < 0
    Stick -1
  endif
Return

Return
Return
