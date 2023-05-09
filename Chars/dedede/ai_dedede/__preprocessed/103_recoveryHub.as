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
  var8 = 10
  var4 = 0
  var5 = Rnd
  if var1 < -115 || var0 > 50
    var5 = 0
  endif
  var6 = Rnd
  var7 = Rnd
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
if Equal CurrAction 16
  var17 = 1
  Goto handleSFall
elif Equal CurrAction 276 || Equal CurrAction 298 || Equal CurrAction 298 || Equal CurrAction 302
  var17 = 1
  Goto handleUSpecial
elif Equal CurrAction 274 || Equal CurrAction 279 || Equal CurrAction 280
  var17 = 1
  Goto handleNSpecial
elif Equal CurrAction 275 || Equal CurrAction 297
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
  var17 = TopNY - BBoundary
  var1 -= TotalYSpeed
  var1 += HurtboxSize
  if !(NoOneHanging) && !(Equal var16 1)
    // LOGSTR_NL 1936682240 1701801472 1696622592 1634625280 1768843008
    // var8 += 25
  endif
  if YDistBackEdge < 8.8 && var2 <= 15 && NumJumps > 0
    Button X
    Goto handleJumpToStage
    Return
  endif
  if var6 <= 0.45 && var1 <= -45 && Equal var4 0
var4 = 1
Button B
ClearStick
AbsStick 0 (0.7)
Return
  endif
  var23 = -115 + var8
  if var2 <= 50 && var1 < var23 && Equal var4 0 && Equal var16 0
var4 = 1
Button B
ClearStick
AbsStick 0 (0.7)
Return
  endif 
  if var17 < 18 && TotalYSpeed < -0.1
    var17 = -1
  endif
  if Equal var4 1 || var5 <= 0.35 && NumJumps > 0
    var22 = -6.800000000000001
    if !(NoOneHanging)
      var22 += 20
    endif
    if var1 < var22 && TotalYSpeed < 0.5
      Button X
      var5 *= 1.25
      Return
    endif
  elif var1 < -107.8 || Equal var17 -1
    if NumJumps > 0
      Button X
      Return
    else
var4 = 1
Button B
ClearStick
AbsStick 0 (0.7)
Return
    endif
  endif
  // if YDistBackEdge < -30 && var7 < 0.6 && NumJumps > 0
  //   Seek execWaddleDash
  //   Jump
  // endif
  // if !(True)
  //   label execWaddleDash
  //     XGoto PerFrameChecks
  //     //= XReciever
  //     Seek execWaddleDash
  //     var17 = var0 * -1
  //     AbsStick var17
  //     if Equal CurrAction 14 || Equal CurrAction 15
  //       Button B
  //     elif Equal CurrAction 275
  //       if Equal CanCancelAttack 1
  //         Seek postThrow
  //         Jump
  //       endif
  //     endif
  //   Return
  //   label postThrow
  //     XGoto PerFrameChecks
  //     //= XReciever
  //     Seek postThrow
  //     ClearStick
  //     var17 = var0 * -1
  //     AbsStick var17
  //     if Equal CurrAction 275
  //       Button X
  //     elif Equal CurrAction 14 || Equal CurrAction 13
  //       Button X
  //     endif
  //   Return
  // endif

Return

label handleNSpecial

Return

label handleSSpecial
  Seek reroll
  if CurrAction <= 32 
    var21 = 0
    Call MainHub
  endif
Return

label handleUSpecial
  ClearStick
  if AnimFrame > 2 && AnimFrame < 5
    AbsStick var0
  elif Equal var16 1
    AbsStick var0
  elif Equal CurrSubaction 503
    AbsStick var0
    var22 = HurtboxSize - 6
    if NoOneHanging && var1 > var22
      Abs var0
      if 0.45 > var6 || OYDistFloor < 0 && var0 < Width
        ClearStick
        AbsStick 0 (-1)
      endif
    endif
  elif var0 > 6 || var0 < -6
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
  elif Equal IsOnStage 1
    var17 = var0 * -1
    AbsStick var17
  elif var0 > 6 || var0 < -6
    AbsStick var0
  endif
  var22 = var0 * Direction
  if var22 > 0
    Stick -1
  endif
Return

Return
Return
