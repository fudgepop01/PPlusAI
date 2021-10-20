#include <Definition_AIMain.h>
id 0x8103
unk 0x0

XReciever
// because some things might rely on these being unset
label reroll
  var4 = 0
  var5 = Rnd
  var6 = Rnd
  var9 = Rnd
  var7 = Rnd
  var8 = Rnd
  var10 = Rnd
label begin
var21 = 3

if FramesHitstun > 0 && CurrAction >= 67 && CurrAction <= 69
  CallI AttackedHub
elif CurrAction >= 115 && CurrAction <= 117
  CallI OnLedge
endif


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
  var1 = var1 - (TopNY * -1)

if Equal CurrAction 16
  Goto handleSFall
  Return
elif Equal CurrAction 276
  Goto handleUSpecial
  Return
elif Equal CurrAction 274
  Goto handleNSpecial
  Return
elif Equal CurrAction 275
  Goto handleSSpecial
  Return
elif Equal CurrAction 277
  Goto handleDSpecial
  Return
elif CurrAction >= 11 && CurrAction <= 13
  if YSpeed > 0 || AnimFrame < 2
    Goto handleJumpToStage
    Return
  endif
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

if Equal var2 0 || Equal AirGroundState 1
  var21 = 0
  Call MainHub
endif

if YDistBackEdge < 0
  XGoto PerFrameChecks
  XReciever
  Seek begin
endif

  GetNearestCliff var0
  var0 = TopNX - var0
  var0 *= -1
  var1 *= -1
  var1 = var1 - (TopNY * -1)
  
  // drift towards goal
  var17 = var0 * -1
  ClearStick
  AbsStick var17
  var2 = var0
  Abs var2
  var17 = TopNY - BBoundary
  if Equal var4 1 || var5 <= 0.3
    if YDistBackEdge > 21.514000000000003
      Button X
      Goto handleJumpToStage
      Return
    endif
  elif YDistBackEdge > 58.51400000000001 || var17 < 18
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
  if var7 <= 0.4 && YDistBackEdge > -8 && YDistBackEdge < 8 && var2 <= 65
    Button B
    ClearStick
    Stick 1
    Return
  endif
  if var6 <= 0.4 && YDistBackEdge > 15 && Equal var4 0
    var4 = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif
  if var9 <= 0.2 && YDistBackEdge > -45 && Equal var4 0
    var4 = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif
  if var2 <= 55 && YDistBackEdge > 40 && Equal var4 0
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
  if AnimFrame > 2 && AnimFrame < 5
    var22 = TopNX * -1
    AbsStick var22
  else
    Stick 1
  endif
  if var8 < 0.7
    Abs var0
    if Equal CurrSubaction 469 && var0 < 25
      Button B
    endif
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
  if !(Equal CurrSubaction 479)
    if !(NoOneHanging) && !(Equal var16 1)
      var1 -= 45
    endif
    if var10 < 0.6
      var22 = Rnd * 70 + 20
      var1 -= var22
    endif
    var4 = var0
    var3 = var1
    Norm var17 var0 var1
    var0 /= var17
    var1 /= var17
    var0 *= -1
    var1 *= -1
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
Return

label handleSFall
  var17 = var0 * -1
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
  endif
Return

Return
Return
