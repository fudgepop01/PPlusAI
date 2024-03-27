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
  var4 = 0
  var8 = 0
  var5 = Rnd
  var7 = Rnd
  var9 = Rnd
  if var1 < 47 || var0 > 33
    var5 = 0
    var9 = 0
  endif
  var6 = Rnd

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
elif Equal CurrAction 276
  Goto handleUSpecial
  var17 = 1
elif Equal CurrAction 274
  Goto handleNSpecial
  var17 = 1
elif Equal CurrAction 275 || Equal CurrAction 281
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
  if YDistBackEdge < 18 && var2 <= 15 && NumJumps > 0
    Button X
    Goto handleJumpToStage
    Seek begin
    Return
  endif
  if Equal var4 1 || var5 <= 0.4 && NumJumps > 0
    if YDistBackEdge > 16 && Rnd < 0.5
      Button X
      Goto handleJumpToStage
      Seek begin
      Return
    endif
  endif
  if YDistBackEdge > 49 || var17 < 18
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
  var22 = Direction * var0
  if var22 > 0 && var9 <= 0.6 && YDistBackEdge > 20 && YDistBackEdge < -20 && var2 <= 30
    Button R|A
    ClearStick
    Stick 0 1
    Return
  endif
  if XSpeed > 1 || XSpeed < -1
    if var7 <= 0.5 && YDistBackEdge < -20 && Rnd < 0.2 && Equal var8 0
      Button B
      ClearStick
      Stick 1
      Return
    endif
  endif
  if var6 <= 0.25 && var2 <= 66 && var2 > 39.6 && YDistBackEdge < 7 && Equal var4 0
    var4 = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif  
  if var2 <= 33 && YDistBackEdge < 53 && Equal var4 0
    var4 = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif  

Return

label handleNSpecial

Return

label handleSSpecial
  Button B
  if AnimFrame > 2 && AnimFrame < 5
    var22 = TopNX * -1
    AbsStick var22
  else
    var22 = TopNY - OTopNY
    Stick 1
    if var22 > 20
      Stick 1 -1
    elif var22 < 20
      Stick 1 1
    endif
  endif
Return

label handleUSpecial
  Seek reroll
  if CurrAction <= 32 
    var21 = 0
    Call MainHub
  endif
  if Equal var16 0 && var1 > 0
    GetRndPointOnStage var0
    var17 = var0 - TopNX
    AbsStick var17
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
  elif var0 > 6 || var0 < -6
    var17 = var0 * -1
    AbsStick var17
  elif YDistBackEdge < 22
    var17 = var0 * -3
    AbsStick var17
  endif
Return

Return
Return
