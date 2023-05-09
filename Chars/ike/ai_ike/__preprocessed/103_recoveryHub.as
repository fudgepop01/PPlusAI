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
  var0 = TopNX - var0
  var1 *= -1
  var1 += TopNY
Abs var0
  var5 = 10
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
  var0 = TopNX - var0
  var1 *= -1
  var1 += TopNY

var17 = 0
if Equal CurrAction 16 || Equal CurrAction 285
  var17 = 1
  Goto handleSFall
elif Equal CurrAction 276 || Equal CurrAction 286 || Equal CurrAction 287 || Equal CurrAction 288
  var17 = 1
  Goto handleUSpecial
elif Equal CurrAction 274 || Equal CurrAction 279 || Equal CurrAction 280
  var17 = 1
  Goto handleNSpecial
elif Equal CurrAction 275 || Equal CurrAction 283 || Equal CurrAction 284
  var17 = 1
  Goto handleSSpecial
elif Equal CurrAction 277
  var17 = 1
  Goto handleDSpecial
elif CurrAction >= 11 && CurrAction <= 13
  if YDistBackEdge < -10
    var21 = 0
    var20 = -1
    Call MainHub 
  elif YSpeed > 0 || AnimFrame < 8
    var17 = 1
    Goto handleJumpToStage
    Return
  endif
endif

if YDistFloor > -1 
  if Equal AirGroundState 1 || Equal CurrAction 190
    var21 = 0
    var20 = -1
    var14 = BBoundary
    var13 = 0
    Call MainHub
  elif !(Equal var17 0)
    ClearStick
    var17 = TopNX * -1
    AbsStick var17
    Return
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
  var0 = TopNX - var0
  var1 *= -1
  var1 += TopNY
  
  // drift towards goal
  ClearStick
  AbsStick var0
  var2 = var0
  Abs var2
  if var2 < 10 && var16 > 0
    var16 = 0
  endif
  if var16 < 1
    DynamicDiceClear 0
    if var1 < -30 && var2 < 30
      DynamicDiceAdd 0 2 1
    endif
    var17 = -40 + var5
    if var1 < var17 && var2 < 30
      DynamicDiceAdd 0 1 1
    endif
    var17 = -20 + var5
    if var1 > var17 && var2 > 20
      DynamicDiceAdd 0 6 1
    endif
    var17 = -40 + var5
    var22 = var17 + 30
    if var1 < var22 && var1 > var17 && var2 < 20
      DynamicDiceAdd 0 3 1
    endif
  endif
  var22 = -55
  if var0 > 0
    var22 *= -1 
  endif
  if var16 > 0
    var22 *= -1 
  endif
  GetColDistPosRel var22 var22 TopNX -10 var22 0 1
  if !(Equal var22 -1) 
    DynamicDiceAdd 0 4 1
  endif
  if NumJumps > 0
    var17 = -26.39 + var5
    if LevelValue >= 42
      DynamicDiceAdd 0 0 1
    elif var1 < var17
      DynamicDiceAdd 0 0 20
    endif
  endif
  DynamicDiceRoll 0 var4 0
  if Equal var4 0
    Button X
  elif Equal var4 1 || Equal var4 2
    Button B
    ClearStick
    AbsStick var0 1
  elif var4 >= 3 && var4 <= 6 
    Button B
    ClearStick
    AbsStick var0 0
  endif

Return

label handleNSpecial

Return

label handleSSpecial
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
  var0 = TopNX - var0
  var1 *= -1
  var1 += TopNY
  if Equal var4 4 && var16 > 0
    var0 *= -1
  endif
  if AnimFrame > 2 && AnimFrame < 5 && Equal CurrAction 275
    AbsStick var0
    Button B
  elif True
    ClearStick
    AbsStick var0
    var2 = var0
    Abs var2
    var23 = ActionTimer * 0.125 - 1
    var6 = 60 + var23 * 9
    var6 *= Direction
    GetColDistPosRel var22 var23 TopNX -10 var6 0 1
    if Equal var4 4 && !(Equal var22 -1)
      var22 -= TopNX
      Abs var22
      if Equal CurrAction 282
        Return
      else
        MOD var23 AnimFrame 2
        if var23 <= 0
          Stick -1
          Button X
        endif
        Return
      endif
      Return
    endif
    
    var17 = -40 + var5
    var22 = var17 + 30
    if Equal var4 5 && var1 < var17 && var1 > var17
      if Equal CurrAction 282
        Return
      elif !(Equal YDistFloor -1)
        Button B
        Return
      endif
    endif
    if !(Equal CurrAction 283)
      GetYDistFloorOffset var23 var6 0 0
      if var23 > 0
      elif var1 < 0
        var4 = 4
        Button B
      else
        Button B
      endif
    elif var1 < 0
      var4 = 4
    endif
    if !(Equal var4 4) && var1 > 0 && Equal CurrAction 283 && var2 <= 15 && var1 < 10
      Button B
      Return
    endif
  endif
Return

label handleUSpecial
  ClearStick
  if Equal var16 1
    AbsStick var0
  elif var0 > 6 || var0 < -6
    if NoOneHanging
      AbsStick var0
    endif
  else
    AbsStick var0
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
  elif YDistBackEdge < 26.39
    var17 = var0 * 3
    AbsStick var17
  endif
Return

Return
Return
