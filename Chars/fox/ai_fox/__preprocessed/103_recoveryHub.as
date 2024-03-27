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

  var22 = TotalXSpeed * 0.5 * 43
  var0 += var22



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
if CurrAction >= 98 && CurrAction <= 108 && AnimFrame < 8
  Return
elif Equal CurrAction 16 || Equal CurrAction 280
  Goto handleSFall
  var17 = 1
elif Equal CurrAction 276 || Equal CurrAction 279
  Goto handleUSpecial
  var17 = 1
elif Equal CurrAction 274
  Goto handleNSpecial
  var17 = 1
elif Equal CurrAction 275 || Equal CurrAction 297
  Goto handleSSpecial
  var17 = 1
elif Equal CurrAction 277 || Equal CurrAction 282 || Equal CurrAction 284
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
  
  var22 = TotalXSpeed * 0.5 * 43
  var0 += var22
  // LOGSTR str("values")
  // LOGVAL nearCliffY
  var1 *= -1
  var23 = HurtboxSize * 0.5
  var1 -= var23
  var3 = var1
  // LOGVAL nearCliffY
  if !(NoOneHanging) || var6 >= 1 && var16 <= 0
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
      DynamicDiceAdd 0 10 6
    endif
  endif
  if var16 < 1
var23 = Width * -0.5
var23 += 51
var17 = var0 - var23 + CenterX
if var0 < 0
  var17 = var0 + var23 + CenterX
endif
var22 = 15
DrawDebugRectOutline var17 15 98 30 0 255 0 170
if var2 > 2 && var2 < 100 && var1 < 0 && var3 > -30
      DynamicDiceAdd 0 30 0.1
      DynamicDiceAdd 0 31 0.5
    endif
var23 = Width * -0.5
var23 += 70
var17 = var0 - var23 + CenterX
if var0 < 0
  var17 = var0 + var23 + CenterX
endif
var22 = 150
DrawDebugRectOutline var17 150 60 200 0 0 255 170
if var2 > 40 && var2 < 100 && var1 < -50 && var3 > -250
      DynamicDiceAdd 0 40 0.05
    endif
    // DynamicDiceSize dslot0 immediateTempVar
    // if immediateTempVar < 2
      Norm var22 var0 var1
      Abs var22
      if var22 < 110 && var3 > -55
        DynamicDiceAdd 0 20 50
        DynamicDiceAdd 0 21 30
      endif
    // endif
  elif True
    DynamicDiceSize 0 var22
    if var22 < 2
      Norm var22 var0 var1
      Abs var22
      if var22 < 92 && var22 > 80
        DynamicDiceAdd 0 20 50
      endif
    endif
  endif
  var23 = var1 + TopNY - 90
  var22 = var0 + TopNX - 45
  var17 = var22 + 90
  DrawDebugLine var22 var23 var17 var23 221 221 221 136
  var23 = TopNY - BBoundary
  if var23 > 20 && var1 < 115
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
  Seek reroll
Return

label handleSSpecial
  var23 = XSpeed * var0
  if AnimFrame < 5 && ActionTimer < 5 && var23 < 0
    AbsStick var0
  else
    AbsStick var0
    if Equal var5 31 && ActionTimer >= 18
      var22 = Direction * 40
      GetYDistFloorOffset var22 var22 5 0
      if var22 > -1
        Button B
      endif
    endif
  endif
Return

label handleUSpecial
  if Equal var16 1
    if var0 < TopNX
      var0 += 3
    else
      var0 -= 3
    endif
  endif
  if !(Equal CurrAction 279)
    if !(NoOneHanging) && !(Equal var16 1)
      var1 -= 45
    endif
    var4 = var0
    Abs var4
    var3 = var1
    if Equal var5 21
      var22 = Rnd * 70 + 20
      var1 -= var22
      if var4 < var1
        var1 += var4
      endif
    endif
    Norm var17 var0 var1
    var0 /= var17
    var1 /= var17
    var1 *= -1
    if var1 < 0.3 && var1 > 0
      var1 = 0.3
    endif
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

Return

label handleSFall
  var17 = TopNX * -1
  AbsStick var17
Return

label handleJumpToStage
  ClearStick
  if Equal var16 1
    AbsStick var0
  elif var0 > 6 || var0 < -6
    AbsStick var0
  elif YDistBackEdge < 42.39
    var17 = var0 * 3
    AbsStick var17
  endif
Return

Return
Return
