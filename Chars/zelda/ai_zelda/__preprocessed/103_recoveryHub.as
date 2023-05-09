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
  if PrevAction >= 116 && PrevAction <= 123 
    AND var4 var4 14
  else
    var4 = 0
  endif
  var5 = Rnd
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

  GetNearestCliff var0
  var0 = TopNX - var0
  var0 *= -1
  var1 *= -1
  var1 += TopNY

var17 = 0
if Equal CurrAction 16 || Equal CurrAction 282
  var17 = 1
  Goto handleSFall
elif Equal CurrAction 276 || Equal CurrAction 281
  var17 = 1
  Goto handleUSpecial
elif Equal CurrAction 274
  var17 = 1
  Goto handleNSpecial
elif Equal CurrAction 275 || Equal CurrAction 279 || Equal CurrAction 280
  var17 = 1
  Goto handleSSpecial
elif !(True)
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
  EstXCoord var22 33
  var0 = var22 - var0
  var0 *= -1
  EstYCoord var22 33
  var1 *= -1
  var1 = var1 - (var22 * -1)
  
  // drift towards goal
  var17 = var0 * -1
  ClearStick
  AbsStick var17
  var2 = var0
  Abs var2
  var1 -= TotalYSpeed
  var1 += HurtboxSize
  if !(NoOneHanging) && !(Equal var16 1)
    // LOGSTR_NL 1936682240 1701801472 1696622592 1634625280 1768843008
    // 40 += 25
  endif
  if YDistBackEdge < 22.19 && var2 <= 15 && NumJumps > 0
    Button X
    Goto handleJumpToStage
    Return
  endif
  
  var22 = var0 + XSpeed * 30
  Abs var22
  var23 = YDistBackEdge + YSpeed * -30
  AND var17 var4 1
  if var6 <= 0.65 && var23 > 40 && var17 <= 0
    OR var4 var4 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif
  if var22 <= 80 && var23 > 40 && var17 <= 0
    OR var4 var4 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif 
  AND var17 var4 2
  if var7 <= 0.4 && YDistBackEdge < 20 && var17 <= 0
    OR var4 var4 2
    Button B
    ClearStick
    Return
  endif
  var17 = TopNY - BBoundary
  AND var22 var4 1
  if var22 <= 0 || var5 <= 0.7 && NumJumps > 0
    if YDistBackEdge > 20.19 && Rnd < 0.5
      Button X
      Goto handleJumpToStage
      Return
    endif
  elif var23 > 86.19 || var17 < 18
    if NumJumps > 0 && Rnd < 0.5
      Button X
      Goto handleJumpToStage
      Return
    else
      OR var4 var4 1
      Button B
      ClearStick
      AbsStick 0 (0.7)
      Return
    endif
  endif

Return

label handleNSpecial
  if AnimFrame > 2 && AnimFrame < 5
    var22 = TopNX * -1
    AbsStick var22
  elif AnimFrame > 4
    Stick 1
  endif
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
  if !(NoOneHanging) && !(Equal var16 1)
    var1 -= 25
    if var0 > 0
      var0 += 15
    else
      var0 -= 15
    endif
  endif
  var4 = var0
  var3 = var1
  if var4 < 10 && var3 < 10 && var3 > -10
    Button B
  endif
  
  if !(Equal CurrAction 281)
    Norm var17 var0 var1
    var0 /= var17
    var1 /= var17
    var0 *= -1
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
    var17 = var0 * -1
    AbsStick var17
  elif var0 > 6 || var0 < -6
    var17 = var0 * -1
    AbsStick var17
  elif YDistBackEdge < 26.19
    var17 = var0 * -3
    AbsStick var17
  endif
Return

Return
Return
