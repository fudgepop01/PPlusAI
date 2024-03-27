#include <Definition_AIMain.h>
id 0x8103
unk 0x0

//= XReciever
// because some things might rely on these being unset
label reroll
  GetNearestCliff var0
  var0 = CenterX - var0
  var0 *= -1
  var1 *= -1
  var1 += TopNY
  if var1 > 0
    var22 = Direction * var0
    if var22 > 0
      var22 = Width * 2 
      if var0 > 0
        var0 -= var22
      else
        var0 += var22
      endif
    endif
  endif
Abs var0
  var5 = 0
  var6 = Rnd
  var7 = Rnd
  var9 = Rnd
  var10 = Rnd

var5 = 0
var6 = 0
if !(NoOneHanging) && Rnd < 0.8 || Rnd < 0.25
  var6 = HurtboxSize + 45 * Rnd
endif
label begin
var21 = 3
SetDebugOverlayColor 255 136 0 221
EnableDebugOverlay

XGoto PerFrameChecks
//= XReciever
Seek begin


// detects if below stage

GetNearestCliff var0
GetReturnGoal var1

// {CLIFF_OFFSET}



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
  var0 = CenterX - var0
  var0 *= -1
  var1 *= -1
  var1 += TopNY
  if var1 > 0
    var22 = Direction * var0
    if var22 > 0
      var22 = Width * 2 
      if var0 > 0
        var0 -= var22
      else
        var0 += var22
      endif
    endif
  endif

var17 = 0
if CurrAction >= 98 && CurrAction <= 108 && AnimFrame < 8
  Return
elif Equal CurrAction 16
  Goto handleSFall
  var17 = 1
elif Equal CurrAction 276 || Equal CurrAction 285 || Equal CurrAction 291
  Goto handleUSpecial
  var17 = 1
elif Equal CurrAction 274 || Equal CurrAction 293 || Equal CurrAction 25
  Goto handleNSpecial
  var17 = 1
elif Equal CurrAction 275 || Equal CurrAction 279
  Goto handleSSpecial
  var17 = 1
elif Equal CurrAction 277 || Equal CurrAction 292 || Equal CurrAction 286
  Goto handleDSpecial
  var17 = 1
elif CurrAction >= 11 && CurrAction <= 13
  if YDistFloor > -1
    var21 = 0
    var20 = -1
    var14 = BBoundary
    var13 = 0
    Call MainHub
  elif CharYSpeed > 0 || AnimFrame < 2
    var17 = -1
    Goto handleJumpToStage
    Seek begin
    if AnimFrame < 10
      Return
    endif
  endif
endif
Seek begin

if YDistFloor > -1
  if var17 > 0
    ClearStick
    var17 = TopNX * -1
    AbsStick var17
    Return
  elif CurrAction <= 25 || Equal CurrAction 190
    var21 = 0
    var20 = -1
    var14 = BBoundary
    var13 = 0
    Call MainHub
  endif
elif HasCurry && Equal HitboxConnected 1
  var21 = 0
  Call MainHub
elif !(Equal var17 0)
  Return
endif

  var17 = 15
  var3 = XSpeed * var17
  GetYDistFloorOffset var2 var3 5 0
  // immediateTempVar = TopNY - goingOffstage 
  // DrawDebugLine TopNX TopNY TopNX immediateTempVar color(0xFF0000DD)
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

  GetNearestCliff var0
  DrawDebugRectOutline var0 var1 10 10 0 255 0 221
  GetLaBit var4 61 0
  
  GetNearestCliff var0
  var0 = CenterX - var0
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
  var1 -= TotalYSpeed
  var1 += HurtboxSize
  // if !(NoOneHanging) && !(Equal isBelowStage 1)
  //   LOGSTR_NL str("someone hanging")
  //   tolerence += 25
  // endif
  if YDistBackEdge < 31.43 && var2 <= 15 && NumJumps > 0
    Button X
    Goto handleJumpToStage
    Seek begin
    Return
  endif
  var22 = Direction * -1 * 5
  GetYDistFloorOffset var22 var22 80 0
  if var6 <= 0.45 && YDistBackEdge > -10 && Equal var4 1 && Equal var22 -1 
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif
  if var2 <= 34 && YDistBackEdge > 50 && Equal var4 1 && Equal var16 0 && Equal var22 -1 
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif
  GetLaBit var4 61 0
  GetLaBasic var22 89 0
  if !(Equal var22 0) 
    if YDistBackEdge > -30 && YDistBackEdge < -10 && var7 < 0.8
      Button B
      ClearStick
      Stick 1 0
      Return
    endif
    if YDistBackEdge > -50 && YDistBackEdge < -10 && var9 < 0.7
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
  elif YDistBackEdge > 55.43000000000001 || var17 < 18
    if NumJumps > 0
      Button X
      Goto handleJumpToStage
      Seek begin
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
    //= XReciever
    var16 = 0
    XGoto SetAttackGoal
    //= XReciever
    var15 = -10
    Call MainHub
  elif YDistBackEdge > 10
    Button B
    Stick 0 1
    if YDistBackEdge < 15 && YSpeed > 2
      var21 = 16.9
      XGoto CalcAttackGoal
      //= XReciever
      var16 = 0
      XGoto SetAttackGoal
      //= XReciever
      var15 = -10
      Call MainHub
    endif
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
  endif
Return

label handleDSpecial
  var23 = TopNX * -1
  AbsStick var23
  Button X
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
