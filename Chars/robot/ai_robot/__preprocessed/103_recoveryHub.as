#include <Definition_AIMain.h>
id 0x8103
unk 0x0

//= XReciever
// because some things might rely on these being unset
label reroll
  // X = direction to cliff
  // Y = vertical height if cliff height = 0
  //
  // if char is above ledge, yVar is positive
  // if below, yVar is negative
  // <= means "lower than" and >= means "higher than"
  //
  // AbsStick X = to ledge
  // AbsStick X * -1 = away from ledge
  // 
  // if left of ledge, xVar is positive
  // if right, xVar is negative
  GetNearestCliff var0
  var0 = CenterX - var0
  var1 *= -1
  var1 += CenterY
  if var1 > 0
    var22 = Direction * var0
    if var22 < 0
      var22 = Width * 2 
      if var0 < 0
        var0 -= var22
      else
        var0 += var22
      endif
    endif
  endif
Abs var0
  

var5 = 0
var6 = 0
if {!(NoOneHanging) && Rnd < 0.8} || Rnd < 0.25
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
elif {var1 < TopNX && var0 > TopNX } || {var0 < TopNX && var1 > TopNX }
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

  // X = direction to cliff
  // Y = vertical height if cliff height = 0
  //
  // if char is above ledge, yVar is positive
  // if below, yVar is negative
  // <= means "lower than" and >= means "higher than"
  //
  // AbsStick X = to ledge
  // AbsStick X * -1 = away from ledge
  // 
  // if left of ledge, xVar is positive
  // if right, xVar is negative
  GetNearestCliff var0
  var0 = CenterX - var0
  var1 *= -1
  var1 += CenterY
  if var1 > 0
    var22 = Direction * var0
    if var22 < 0
      var22 = Width * 2 
      if var0 < 0
        var0 -= var22
      else
        var0 += var22
      endif
    endif
  endif

var17 = 0

if Equal CanCancelAttack 1
  if {{Equal CurrAction 16} || {Equal CurrAction 276 || Equal CurrAction 280} || {Equal CurrAction 274} || {Equal CurrAction 275} || {Equal CurrAction 277 || Equal CurrAction 283 || Equal CurrAction 285}}
    Seek postMoveCheck
    Jump
  endif
endif

if CurrAction >= 98 && CurrAction <= 108 && AnimFrame < 8
  Return
elif Equal CurrAction 16
  Goto handleSFall
  var17 = 1
elif Equal CurrAction 276 || Equal CurrAction 280
  Goto handleUSpecial
  var17 = 1
elif Equal CurrAction 274
  Goto handleNSpecial
  var17 = 1
elif Equal CurrAction 275
  Goto handleSSpecial
  var17 = 1
elif Equal CurrAction 277 || Equal CurrAction 283 || Equal CurrAction 285
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
label postMoveCheck
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

  
  // X = direction to cliff
  // Y = vertical height if cliff height = 0
  //
  // if char is above ledge, yVar is positive
  // if below, yVar is negative
  // <= means "lower than" and >= means "higher than"
  //
  // AbsStick X = to ledge
  // AbsStick X * -1 = away from ledge
  // 
  // if left of ledge, xVar is positive
  // if right, xVar is negative
  GetNearestCliff var0
  var0 = CenterX - var0
  var1 *= -1
  var1 += CenterY
  
  // LOGSTR str("values")
  // LOGVAL nearCliffY
  var1 *= -1
  var23 = HurtboxSize * 0.5
  var1 -= var23
  var3 = var1
  // LOGVAL nearCliffY
  if !(NoOneHanging) || {var6 >= 1 && var16 <= 0}
    var3 += var6
    // LOGSTR str("hcy")
    // LOGVAL highCliffY
  endif
  // drift towards goal
  ClearStick
  var23 = var0
  if var1 > 0 && var16 < 1
    var22 = Width * 2
    if var23 > 0
      var23 -= var22
    else
      var23 += var22
    endif
  endif
  AbsStick var23
  var2 = var0
  Abs var2
  var23 = Width * 0.5
  var2 -= var23
  Abs var2
  // LOGVAL absNCX
  // PRINTLN
  var23 = HurtboxSize * 0.5 + CenterY
  DrawDebugRectOutline CenterX var23 1 1 255 255 255 221
  DrawDebugRectOutline CenterX CenterY Width HurtboxSize 136 136 136 221
  GetColDistPosRel var17 var23 TopNX CenterY 0 80 0
  if Equal var23 -1
    var23 = var0
    Abs var23
    if var23 < 10
      var0 *= -1
      ClearStick
      AbsStick var0
      var0 *= -1
    endif
  endif
  DynamicDiceClear 0
  DynamicDiceAdd 0 0 20
  if NumJumps > 0
var23 = Width * -0.5
var23 += 150
var17 = var0 - var23 + CenterX
if var0 < 0
  var17 = var0 + var23 + CenterX
endif
var22 = -90
DrawDebugRectOutline var17 -90 300 150 255 0 0 170
if var2 > 0 && var2 < 300 && var1 < 165 && var3 > 15
      DynamicDiceAdd 0 10 25
    endif
  endif
  if var16 < 1
    var23 = Direction * var0
    if var23 < 0
var23 = Width * -0.5
var23 += 105
var17 = var0 - var23 + CenterX
if var0 < 0
  var17 = var0 + var23 + CenterX
endif
var22 = 40
DrawDebugRectOutline var17 40 90 100 0 255 0 170
if var2 > 60 && var2 < 150 && var1 < 10 && var3 > -90
        DynamicDiceAdd 0 40 10
      endif
var23 = Width * -0.5
var23 += 75
var17 = var0 - var23 + CenterX
if var0 < 0
  var17 = var0 + var23 + CenterX
endif
var22 = 50
DrawDebugRectOutline var17 50 150 100 0 0 255 170
if var2 > 0 && var2 < 150 && var1 < 0 && var3 > -100
        DynamicDiceAdd 0 30 10
      endif
    endif
var23 = Width * -0.5
var23 += 55
var17 = var0 - var23 + CenterX
if var0 < 0
  var17 = var0 + var23 + CenterX
endif
var22 = 120
DrawDebugRectOutline var17 120 90 100 255 255 0 170
if var2 > 10 && var2 < 100 && var1 < -70 && var3 > -170
      DynamicDiceAdd 0 30 10
    endif
    DynamicDiceSize 0 var22
    if var22 < 2
var23 = Width * -0.5
var23 += 90
var17 = var0 - var23 + CenterX
if var0 < 0
  var17 = var0 + var23 + CenterX
endif
var22 = -25
DrawDebugRectOutline var17 -25 120 150 255 0 255 170
if var2 > 30 && var2 < 150 && var1 < 100 && var3 > -50
        DynamicDiceAdd 0 21 10
      endif
var23 = Width * -0.5
var23 += 15
var17 = var0 - var23 + CenterX
if var0 < 0
  var17 = var0 + var23 + CenterX
endif
var22 = -25
DrawDebugRectOutline var17 -25 30 150 0 255 255 170
if var2 > 0 && var2 < 30 && var1 < 100 && var3 > -50
        DynamicDiceAdd 0 20 10
      endif
    endif
  elif True
var23 = Width * -0.5
var23 += 75
var17 = var0 - var23 + CenterX
if var0 < 0
  var17 = var0 + var23 + CenterX
endif
var22 = -50
DrawDebugRectOutline var17 -50 150 100 136 0 255 170
if var2 > 0 && var2 < 150 && var1 < 100 && var3 > 0
      DynamicDiceAdd 0 30 10
    endif
  endif
  var23 = TopNY - BBoundary
  if var23 > 20 && var1 < 190
  else
    DynamicDiceClear 0
    DynamicDiceAdd 0 0 1
    if NumJumps > 0
      DynamicDiceAdd 0 10 100
    endif
    DynamicDiceSize 0 var23
    if var23 < 2
      DynamicDiceAdd 0 20 100
    endif
  endif
  DynamicDiceRoll 0 var5 0
  if var5 > 10
    ClearStick
  endif
  if var5 >= 40
    Button B
    AbsStick 0 -1
  elif var5 >= 30
    Button B
    AbsStick var0
  elif var5 >= 20
    Button B
    AbsStick 0 1
  elif var5 >= 10
    Button X
  endif

Return

label handleNSpecial

Return

label handleSSpecial
  ClearStick
  var23 = XSpeed * var0
  if AnimFrame <= 12 && ActionTimer <= 12 && var23 < 0
    AbsStick var0
  else
    AbsStick var0
  endif
Return

label handleUSpecial
  ClearStick
  if Equal var5 21 && ActionTimer >= 23
    Stick -1
    Button A
    Seek begin
    Return
  endif
  AbsStick var0
Return

label handleDSpecial
  ClearStick
  var23 = XSpeed * var0
  if AnimFrame <= 12 && ActionTimer <= 12 && var23 < 0
    AbsStick var0
  elif Equal CurrAction 280 && AnimFrame > 2
    Button R
  else
    AbsStick var0
  endif
Return

label handleSFall
  var17 = TopNX * -1
  AbsStick var17
Return

label handleJumpToStage
  ClearStick
  if Equal var16 1 || {var0 > 6 || var0 < -6}
    AbsStick var0
  elif YDistBackEdge < 39.01
    var17 = var0 * 3
    AbsStick var17
  endif
Return

Return
Return
