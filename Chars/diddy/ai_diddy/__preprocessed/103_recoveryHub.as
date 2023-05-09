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
  // no charge ==> full direction
  // max charge ==> full direction
  // max charge w/ lean ==> full direction
  // no charge ==> no direction
  // max charge ==> no direction
  // max charge w/ lean ==> full direction
  var9 = 10
  var4 = 0
  var5 = Rnd
  var6 = Rnd
  var8 = Rnd
  var7 = Rnd * 60
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
    var2 = 5
  else
    var2 = -5
  endif
elif var1 < TopNX && TopNX < var0
elif var0 < TopNX && TopNX < var1  
elif TopNY < var2
  if var17 < 0
    var2 = 10
  else
    var2 = -10
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
elif Equal CurrAction 276 || Equal CurrAction 293 || Equal CurrAction 295
  var17 = 1
  Goto handleUSpecial
elif Equal CurrAction 274 || Equal CurrAction 279 || Equal CurrAction 280 || Equal CurrAction 281 || Equal CurrAction 282
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
  var17 = TopNY - BBoundary
  var1 -= TotalYSpeed
  var1 += HurtboxSize
  if !(NoOneHanging) && !(Equal var16 1)
    // LOGSTR_NL 1936682240 1701801472 1696622592 1634625280 1768843008
    // var9 += 25
  endif
  if YDistBackEdge < 24.93 && var2 <= 15 && NumJumps > 0
    Button X
    Goto handleJumpToStage
    Return
  endif
  if var8 <= 0.55 && var1 >= -4 && var1 < 4 && var2 <= 90
Button B
ClearStick
Stick 1
Return
  endif
  if var6 <= 0.2 && var1 < -20 && Equal var4 0
var4 = 1
Button B
ClearStick
AbsStick 0 (0.7)
Return
  endif
  var23 = -60 + var9
  if var2 <= 105 && var1 < var23 && Equal var4 0
var4 = 1
Button B
ClearStick
AbsStick 0 (0.7)
Return
  endif
  if var17 < 18 && TotalYSpeed < -0.1
    var17 = -1
  endif
  if Equal var4 1 || var5 <= 0.3 && NumJumps > 0
    if var1 < -22.93 && Rnd < 0.5
Button X
Goto handleJumpToStage
Return
    endif
  elif var1 > -68.93 || var17 < 18
    if NumJumps > 0
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
  if Equal var16 1
    if var0 > TopNX
      var0 += 2
    else
      var0 -= 2
    endif
  endif
  if !(NoOneHanging)
    var1 -= 20
  endif
  // SetDebugMode 1
  if Equal CurrAction 276 || Equal CurrAction 293
    var3 = var0
    Abs var3
    // LOGSTR 1094927360 1476395008 0 0 0
    // LOGVAL var3
    var17 = var1 / -63
    var23 = var3 / 105
    var4 = var23 - var17
    // LOGSTR 1097754368 1818566656 1349675264 1869768960 1954086912
    // LOGVAL var4
    // PRINTLN
    if var4 > 0.5
      var3 += var7
      var23 = var3 / 105
      var4 = var23 - var17
      // LOGSTR 1399351552 1718904064 1679839232 1919512320 1919513600
      // LOGVAL var4
    endif
    // 0.5 = equal priority; 45 deg angle
    // > 0.5 = height is more important
    // < 0.5 = dist is more important
    
    Norm var5 var0 var1
    Abs var5
    var5 += -60
    var5 /= 45
    
    // because var5 and var5 are var1
    var5 *= 45
    // LOGSTR 1667784960 1919378688 544499968 1835335680 0
    // LOGVAL var5
    var6 = var5 * var4
    var6 -= 45
    Abs var5
    Abs var6
    var6 *= 0.45
    // LOGSTR 1818583296 1847617024 1918987520 1694498816 0
    // LOGVAL var6
    // PRINTLN
    if AnimFrame > var6
      AbsStick var0
    endif
    if AnimFrame <= var5
      Button B
    endif
  else
    AbsStick var0
  endif
  // SetDebugMode 0
Return

label handleDSpecial
  Seek reroll
// move "dspecial" not found
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
  elif YDistBackEdge < 28.93
    var17 = var0 * 3
    AbsStick var17
  endif
Return

Return
Return
