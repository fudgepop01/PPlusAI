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
if !(NoOneHanging) && Rnd < 0.8
  JmpNextIfLabel
elif Rnd < 0.25
  IfLabel
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
elif var1 < TopNX && var0 > TopNX 
elif var0 < TopNX && var1 > TopNX
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
  if {{Equal CurrAction 16} || {Equal CurrAction 276 || Equal CurrAction 285 || Equal CurrAction 133} || {Equal CurrAction 274 || Equal CurrAction 279 || Equal CurrAction 280} || {Equal CurrAction 275 || Equal CurrAction 281 || Equal CurrAction 282} || {Equal CurrAction 277 || Equal CurrAction 283 || Equal CurrAction 284}}
    Seek postMoveCheck
    Jump
  endif
endif

if CurrAction >= 98 && CurrAction <= 108 && AnimFrame < 8
  Return
elif Equal CurrAction 16
  Goto handleSFall
  var17 = 1
elif Equal CurrAction 276 || Equal CurrAction 285 || Equal CurrAction 133
  Goto handleUSpecial
  var17 = 1
elif Equal CurrAction 274 || Equal CurrAction 279 || Equal CurrAction 280
  Goto handleNSpecial
  var17 = 1
elif Equal CurrAction 275 || Equal CurrAction 281 || Equal CurrAction 282
  Goto handleSSpecial
  var17 = 1
elif Equal CurrAction 277 || Equal CurrAction 283 || Equal CurrAction 284
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
  if !(NoOneHanging)
    JmpNextIfLabel
  elif var6 >= 1 && var16 <= 0
    IfLabel
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
  
  DynamicDiceClear 0
  DynamicDiceAdd 0 0 1
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
      var22 = NumJumps * 10
      DynamicDiceAdd 0 10 var22
    endif
  endif
  if var16 < 1
var23 = Width * -0.5
var23 += 50
var17 = var0 - var23 + CenterX
if var0 < 0
  var17 = var0 + var23 + CenterX
endif
var22 = 2.5
DrawDebugRectOutline var17 2.5 100 65 0 255 0 170
if var2 > 0 && var2 < 100 && var1 < 30 && var1 > -35
      DynamicDiceAdd 0 21 5
    endif
var23 = Width * -0.5
var23 += 61.5
var17 = var0 - var23 + CenterX
if var0 < 0
  var17 = var0 + var23 + CenterX
endif
var22 = 0
DrawDebugRectOutline var17 0 23 40 0 0 255 170
if var2 > 50 && var2 < 73 && var1 < 20 && var1 > -20
      DynamicDiceAdd 0 30 5
    endif
var23 = Width * -0.5
var23 += 17.5
var17 = var0 - var23 + CenterX
if var0 < 0
  var17 = var0 + var23 + CenterX
endif
var22 = -17.5
DrawDebugRectOutline var17 -17.5 35 35 255 255 0 170
if var2 > 0 && var2 < 35 && var1 < 35 && var1 > 0
      DynamicDiceAdd 0 40 20
    endif
var23 = Width * -0.5
var23 += 40
var17 = var0 - var23 + CenterX
if var0 < 0
  var17 = var0 + var23 + CenterX
endif
var22 = -10
DrawDebugRectOutline var17 -10 80 50 255 0 255 170
if var2 > 0 && var2 < 80 && var1 < 35 && var1 > -15
      DynamicDiceAdd 0 50 10
    endif
  elif True
var23 = Width * -0.5
var23 += 17.5
var17 = var0 - var23 + CenterX
if var0 < 0
  var17 = var0 + var23 + CenterX
endif
var22 = -40.5
DrawDebugRectOutline var17 -40.5 15 15 0 255 255 170
if var2 > 10 && var2 < 25 && var1 < 48 && var1 > 33
      DynamicDiceAdd 0 20 80
    endif
  endif
  // DynamicDiceSize dslot0 immediateTempVar
  // if immediateTempVar < 2
  //   $if_recoveryRect(x_abs,0,UpBXDist,y_rangeAbove,nearCliffY,UpBYDist,10)
  //     DynamicDiceAdd dslot0 optUpB 50
  //   endif
  // endif
  var23 = TopNY - BBoundary
  if var23 > 20 && var1 < 88
  else
    DynamicDiceClear 0
    DynamicDiceAdd 0 0 1
    if NumJumps > 0
      DynamicDiceAdd 0 10 100
    endif
    DynamicDiceSize 0 var23
    if var23 < 2
      DynamicDiceAdd 0 21 100
    endif
  endif
  DynamicDiceRoll 0 var5 0
  if var5 > 10
    ClearStick
  endif
  if var5 >= 50
    ClearStick
    Button B
  elif var5 >= 40
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
  MOD var22 AnimFrame 3
  if var22 <= 1
    Button B
  endif
  ClearStick
  if AnimFrame > 2 && AnimFrame < 5
    var22 = TopNX * -1
    AbsStick var22
  elif Equal var16 1 || var0 > 6 || var0 < -6
    AbsStick var0
  endif
Return

label handleSSpecial
  var23 = XSpeed * var0
  if AnimFrame <= 12 && ActionTimer <= 12 && var23 < 0
    AbsStick var0
  elif var1 < 0
    Stick 0 1
  elif var1 > 10
    Stick 0 -1
  endif
Return

label handleUSpecial
  if Equal var5 21
    if Equal CurrAction 276 && AnimFrame < 5
      AbsStick var0
    endif
  if Equal CurrAction 132
    AbsStick var0
  else
    var22 = HurtboxSize * -0.15
    if var1 < var22
      Stick -1
    elif var1 > 15 && YSpeed > -1.25
      Stick 1
    endif
  endif
    Abs var0
    if var0 < 10 && var1 < 0 || YDistFloor > 0
      if XDistLE 20
        Button A
      else 
        Button X
      endif
    endif
  elif True
    if AnimFrame > 2 && AnimFrame < 5
      if var0 < 10 && var0 > -10 && YDistBackEdge > 10
        var22 = TopNX
        AbsStick var22
      elif Equal var16 1
        var22 = TopNX
        AbsStick var22
      endif
    else
      Abs var0
      if var0 < 10 && var1 < 15
        Stick 0 1
        Button B
      elif Equal var16 1
        Stick 0 1
        Button B
      endif
    endif
  endif
Return

label handleDSpecial
  if Equal CurrAction 284
    var22 = var0 * -1
    ClearStick
    AbsStick var22
  else
    Norm var17 var0 var1
    var0 /= var17
    var1 /= var17
    var1 *= -1
    if 0.1 < var0 && var0 < 0.25
      AbsStick 0.3 var1
    elif -0.25 < var0 && var0 < -0.1
      AbsStick -0.3 var1
    else
      AbsStick var0 var1
    endif
  endif
Return

label handleSFall
  var17 = TopNX * -1
  AbsStick var17
Return

label handleJumpToStage
  if CurrAction < 11 || CurrAction > 13
    var22 = Direction * var0
    var22 += 10
    if var22 > 0
      Return
    endif
  endif
  ClearStick
  if Equal var16 1 || var0 > 6 || var0 < -6
    AbsStick var0
  elif YDistBackEdge < 8.28
    var17 = var0 * 3
    AbsStick var17
  endif
Return

Return
Return
