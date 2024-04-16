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
  // false = canUse
  // true = canUse

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
  if {{Equal CurrAction 16} || {Equal CurrAction 276 || Equal CurrAction 283 || Equal CurrAction 284} || {Equal CurrAction 274 || Equal CurrAction 279 || Equal CurrAction 280 || Equal CurrAction 281} || {Equal CurrAction 275} || {Equal CurrAction 277}}
    Seek postMoveCheck
    Jump
  endif
endif

if CurrAction >= 98 && CurrAction <= 108 && AnimFrame < 8
  Return
elif Equal CurrAction 16
  Goto handleSFall
  var17 = 1
elif Equal CurrAction 276 || Equal CurrAction 283 || Equal CurrAction 284
  Goto handleUSpecial
  var17 = 1
elif Equal CurrAction 274 || Equal CurrAction 279 || Equal CurrAction 280 || Equal CurrAction 281
  Goto handleNSpecial
  var17 = 1
elif Equal CurrAction 275
  Goto handleSSpecial
  var17 = 1
elif Equal CurrAction 277
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
  var1 *= -1
  if !(NoOneHanging)
    var1 += 25
  endif
  // drift towards goal
  ClearStick
  AbsStick var0
  var2 = var0
  Abs var2
  Norm var3 var0 var1
  Abs var3
  DynamicDiceClear 0
  DynamicDiceAdd 0 0 1
  
  GetLaFloat var17 27 0
  if var17 >= 65 
    GetLaBit var23 63 0
    if var3 < 100 && Equal var23 1 
      DynamicDiceAdd 0 4 5
    endif
    GetLaBit var23 66 0
    if var2 <= 110 && Equal var23 0 && var1 < 20
      DynamicDiceAdd 0 6 5
    endif
  endif
  GetLaBit var23 63 0
  if var3 < 70 && var2 <= 50 && Equal var23 1
    DynamicDiceAdd 0 2 20
  endif
  GetLaBit var23 66 0
  if var2 <= 90 && Equal var23 0 && var1 < 20
    DynamicDiceAdd 0 5 20
  endif
  if var1 > 34.69 && NumJumps > 0
    DynamicDiceAdd 0 1 3
  endif
  var17 = 0
  // GetLaBit anotherTempVar LucUpB_LABit 0
  // if Equal anotherTempVar true
  //   recPotential += UpBRadius
  //   GetLaFloat anotherTempVar LucAura_LAFloat 0
  //   if anotherTempVar >= 65
  //     recPotential += 10
  //   endif
  // endif
  var23 = NumJumps * 34.69
  var17 += var23
  var23 = TopNY - BBoundary
  if var23 > 20 && var1 < var17
  else
    DynamicDiceClear 0
    DynamicDiceAdd 0 0 1
    if NumJumps > 0
      DynamicDiceAdd 0 1 100
    else
      GetLaFloat var17 27 0
      GetLaBit var23 63 0
      if var17 >= 65 && Equal var23 1
        DynamicDiceAdd 0 4 100
      else 
        DynamicDiceAdd 0 2 100
      endif
    endif
  endif
  DynamicDiceRoll 0 var5 0
  if var5 > 1
    ClearStick
  endif
  if var5 > 0
    if Equal var5 1
      Button X
    elif var5 < 5
      Button B
      AbsStick 0 1
    else 
      Button B
      AbsStick 0 -1
    endif
  endif

Return

label handleNSpecial
  Seek reroll
Return

label handleSSpecial
  Seek reroll
Return

label handleUSpecial
  if Equal CurrSubaction 30
    Call MainHub
  endif 
  if Equal var16 1
    if var0 > TopNX
      var0 -= 2
    else
      var0 += 2
    endif
  endif
  if Equal CurrAction 283 || Equal CurrAction 276
    if Equal var5 4 && ActionTimer >= 15 && Equal CurrAction 283 
      Button A
      var23 = TopNX * -1
      AbsStick var23
      Return
    endif
    if !(NoOneHanging)
      var1 -= 15
      if var0 > 0
        var0 -= 5
      else
        var0 += 5
      endif
    endif
    if Equal var16 0
      if XSpeed < -0.2 && var0 < 0 
        var0 -= 50
      elif XSpeed > 0.2 && var0 > 0
        var0 += 50
      endif
    endif
    var17 = var0
    Abs var17
    if var17 < 10 && var1 < 3 && var1 > -5 && YSpeed < 0
      ClearStick
    else
      var2 = var0
      var3 = var1
      Norm var17 var0 var1
      Abs var17
      var0 /= var17
      var1 /= var17
      var1 *= -1
      Abs var2
      var17 = XSpeed
      Abs var17
      if var3 < 0 && var2 < 30 && var17 > 2
        var1 -= 1
      elif var3 < 20 && var2 < 30 && YSpeed > 0
        var1 -= 1
      endif
      AbsStick var0 var1
    endif
  endif
Return

label handleDSpecial
  if AnimFrame > 2 && AnimFrame < 5
    AbsStick var0
  elif Equal var5 6
    Button A
    Stick 0 (-1)
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
  elif YDistBackEdge < 34.69
    var17 = var0 * 3
    AbsStick var17
  endif
Return

Return
Return
