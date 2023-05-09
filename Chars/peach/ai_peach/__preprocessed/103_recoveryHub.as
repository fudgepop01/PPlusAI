#include <Definition_AIMain.h>
id 0x8103
unk 0x0

//= XReciever
// because some things might rely on these being unset
label reroll
  GetNearestCliff var0
  var0 = TopNX - var0
  var0 *= -1
  var1 *= -1
  var1 += TopNY
Abs var0
  var4 = 0
  var5 = Rnd
  var7 = Rnd
  if var1 < 25 || var0 > 15
    var5 = 0
    var7 = 0
  endif
  var9 = Rnd
  var10 = Rnd
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
    var2 = 3
  else
    var2 = -3
  endif
elif var1 < TopNX && TopNX < var0
elif var0 < TopNX && TopNX < var1  
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

  GetNearestCliff var0
  var0 = TopNX - var0
  var0 *= -1
  var1 *= -1
  var1 += TopNY

var17 = 0
if Equal CurrAction 16
  var17 = 1
  Goto handleSFall
elif Equal CurrAction 276 || Equal CurrAction 282 || Equal CurrAction 283 || Equal CurrAction 284
  var17 = 1
  Goto handleUSpecial
elif Equal CurrAction 274
  var17 = 1
  Goto handleNSpecial
elif Equal CurrAction 275 || Equal CurrAction 279 || Equal CurrAction 280 || Equal CurrAction 281
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

  GetNearestCliff var0
  DrawDebugRectOutline var0 var1 10 10 0 255 0 221
  
  GetNearestCliff var0
  var0 = TopNX - var0
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
  if !(NoOneHanging) && !(Equal var16 1)
    // LOGSTR_NL 1936682240 1701801472 1696622592 1634625280 1768843008
    // 10 += 25
  endif
  if YDistBackEdge < 16 && var2 <= 15 && NumJumps > 0
    Button X
    Goto handleJumpToStage
    Return
  endif
  var22 = Direction * -1 * 5
  GetYDistFloorOffset var22 var22 80 0
  if var2 <= 15 && YDistBackEdge > 15 && Equal var4 0 && Equal var16 0 && Equal var22 -1 
    var4 = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif
  
  if YDistBackEdge < 20 && var2 > 15 && var10 < 0.95
    Button B
    ClearStick
    Stick 1 0
    Return
  endif
  if YDistBackEdge < 40 && YDistBackEdge > 10 && var2 > 15 && var7 < 0.7
    Button B
    ClearStick
    Stick 1 0
    Return
  endif
  if Equal var4 0 && YDistBackEdge > -35 && var2 > 5 && var7 < 0.7
    var4 = 1
    Button B
    ClearStick
    Stick 0 1
    Return
  endif
  if Equal var4 1 || var5 <= 0.6 && NumJumps > 0
    var22 = 14
    if !(NoOneHanging)
      var22 -= 20
    endif
    if YDistBackEdge > var22 && Rnd < 0.5
      Button X
      Goto handleJumpToStage
      var5 *= 1.25
      Return
    endif
  elif YDistBackEdge > 35 || var17 < 18
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

Return

label handleNSpecial

Return

label handleSSpecial
  if AnimFrame > 2 && AnimFrame < 5
    var22 = TopNX * -1
    AbsStick var22
  elif True
  GetNearestCliff var0
  var0 = TopNX - var0
  var0 *= -1
  var1 *= -1
  var1 += TopNY
    // drift towards goal
    var17 = var0 * -1
    ClearStick
    AbsStick var17
    var2 = var0
    Abs var2
    if var9 < 0.85 && YDistBackEdge < -10 && YDistBackEdge > -45
      if Equal CurrSubaction 475 && AnimFrame >= 7 && Rnd < 0.2 
        Return
      elif !(Equal YDistFloor -1) 
        Button B
        Return
      endif
    endif
    if Equal CurrSubaction 475 && AnimFrame >= 7 && Rnd < 0.2 && YDistBackEdge < 5 && YDistBackEdge > -10
      Return
    elif var2 <= 15
      Button B
      Return
    endif
  endif
  if Equal CurrSubaction 475
    Button B
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
  else
    var17 = var0 * -1
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
