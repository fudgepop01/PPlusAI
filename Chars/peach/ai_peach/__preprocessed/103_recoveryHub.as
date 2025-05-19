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
  
  // these exist too
  // #let recOption = var4
  // #let shouldGoHigh = var5

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
    var2 = 3
  else
    var2 = -3
  endif
elif var1 < TopNX && var0 > TopNX 
elif var0 < TopNX && var1 > TopNX
elif TopNY < var2
  if var17 < 0
    var2 = 5
  else
    var2 = -5
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
  if {{Equal CurrAction 16 || Equal CurrAction 286} || {Equal CurrAction 276 || Equal CurrAction 282 || Equal CurrAction 283 || Equal CurrAction 284} || {Equal CurrAction 276} || {Equal CurrAction 275 || Equal CurrAction 279 || Equal CurrAction 280 || Equal CurrAction 281} || {Equal CurrAction 277}}
    Seek postMoveCheck
    Jump
  endif
endif

if CurrAction >= 98 && CurrAction <= 108 && AnimFrame < 8
  Return
elif Equal CurrAction 16 || Equal CurrAction 286
  Goto handleSFall
  var17 = 1
elif Equal CurrAction 276 || Equal CurrAction 282 || Equal CurrAction 283 || Equal CurrAction 284
  Goto handleUSpecial
  var17 = 1
elif Equal CurrAction 276
  Goto handleNSpecial
  var17 = 1
elif Equal CurrAction 275 || Equal CurrAction 279 || Equal CurrAction 280 || Equal CurrAction 281
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
  DynamicDiceAdd 0 0 5
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
      DynamicDiceAdd 0 1 6
    endif
  endif
  if var16 < 1
var23 = Width * -0.5
var23 += 25
var17 = var0 - var23 + CenterX
if var0 < 0
  var17 = var0 + var23 + CenterX
endif
var22 = 60
DrawDebugRectOutline var17 60 50 100 0 255 0 170
if var2 > 0 && var2 < 50 && var1 < -10 && var3 > -110
      DynamicDiceAdd 0 4 50
    endif
var23 = Width * -0.5
var23 += 70
var17 = var0 - var23 + CenterX
if var0 < 0
  var17 = var0 + var23 + CenterX
endif
var22 = 75
DrawDebugRectOutline var17 75 50 100 0 0 255 170
if var2 > 20 && var2 < 70 && var1 < -25 && var3 > -125
      DynamicDiceAdd 0 5 1
    endif
    GetLaBit var22 62 0
    if Equal var22 0
var23 = Width * -0.5
var23 += 110
var17 = var0 - var23 + CenterX
if var0 < 0
  var17 = var0 + var23 + CenterX
endif
var22 = 50
DrawDebugRectOutline var17 50 220 100 255 255 0 170
if var2 > 0 && var2 < 220 && var1 < 0 && var3 > -100
        DynamicDiceAdd 0 6 50
      endif
var23 = Width * -0.5
var23 += 110
var17 = var0 - var23 + CenterX
if var0 < 0
  var17 = var0 + var23 + CenterX
endif
var22 = 50
DrawDebugRectOutline var17 50 220 100 255 0 255 170
if var2 > 0 && var2 < 220 && var1 < 0 && var3 > -100
        DynamicDiceAdd 0 6 50
      endif
    endif
  endif
  DynamicDiceSize 0 var22
  if var22 < 3
var23 = Width * -0.5
var23 += 50
var17 = var0 - var23 + CenterX
if var0 < 0
  var17 = var0 + var23 + CenterX
endif
var22 = -5
DrawDebugRectOutline var17 -5 100 30 0 255 255 170
if var2 > 0 && var2 < 100 && var1 < 20 && var1 > -10
      DynamicDiceAdd 0 2 5
    endif
  endif
var23 = Width * -0.5
var23 += 25
var17 = var0 - var23 + CenterX
if var0 < 0
  var17 = var0 + var23 + CenterX
endif
var22 = -31
DrawDebugRectOutline var17 -31 50 10 136 0 255 170
if var2 > 0 && var2 < 50 && var1 < 36 && var1 > 26
    if var22 < 2
      DynamicDiceClear 0
    endif
    DynamicDiceAdd 0 2 25
  endif
  var23 = TopNY - BBoundary
  if var23 > 20 && var1 < 76
  else
    DynamicDiceClear 0
    DynamicDiceAdd 0 0 1
    if NumJumps > 0
      DynamicDiceAdd 0 1 100
    endif
    DynamicDiceSize 0 var23
    if var23 < 2
      DynamicDiceAdd 0 2 100
    endif
  endif
  DynamicDiceRoll 0 var5 0
  if var5 > 1
    ClearStick
  endif
  if var5 >= 6
    AbsStick 0 (-1)
    Button X
  elif var5 >= 4
    Button B
    AbsStick var0
  elif var5 >= 2
    Button B
    AbsStick 0 1
  elif var5 >= 1
    Button X
  endif

Return

label handleNSpecial
  Seek reroll
Return

label handleSSpecial
  AbsStick var0
Return

label handleUSpecial
  ClearStick
  if AnimFrame > 2 && AnimFrame < 5
    var22 = TopNX * -1
    AbsStick var22
  elif Equal var16 1 || var0 > 6 || var0 < -6
    AbsStick var0
  endif
  Abs var0
  if var0 < 10 || TopNX > -20 && TopNX < 20 && Equal IsOnStage 1
    if Equal IsFastfalling 0
      AbsStick var0 (-1)
    endif
  endif
  if YDistBackEdge > 40
    AbsStick 0 -1
  endif
Return

label handleDSpecial
  Seek reroll
Return

label handleSFall
  AbsStick var0
  if Equal CurrAction 286
    Abs var0
    if var0 < 20 || Equal IsOnStage 1
      Seek reroll
      Return
    endif
    Button X
  endif
Return

label handleJumpToStage
  if var5 > 6
    Button X
  endif
  ClearStick
  if Equal var16 1 || var0 > 6 || var0 < -6
    AbsStick var0
  elif YDistBackEdge < 33.00
    var17 = var0 * 3
    AbsStick var17
  endif
Return

Return
Return
