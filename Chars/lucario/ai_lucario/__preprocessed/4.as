// RECOVERY HUB
// a place for determining the possible recoveries available
#include <Definition_AIMain.h>
id 0x8004

unk 0x0

if YDistBackEdge < 1 && YDistBackEdge > -1 
  Call AIHub
endif

label

if !(Equal XDistBackEdge XDistFrontEdge)
  Call AIHub
endif
if Equal var16 7
  Call LedgeHang
endif
if FramesHitstun > 0
  Return
endif
if Equal var18 255
  Seek
  Jump
endif

// {PREREQ_CHECKS}

var6 = 0
label
var8 = 0
label
Cmd30

// detects if below stage

GetNearestCliff var0
GetReturnGoal var1

var17 = var1 - var0 
var7 = 0
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
  var7 = 1
endif


// gets nearest cliff coordinates relative to position

  GetNearestCliff var0
  var0 = TopNX - var0
  var0 *= -1
  var1 *= -1
  var1 = var1 - (TopNY * -1)

var0 += var2
if Rnd < 0.05
  var1 -= 20
endif

if !(NoOneHanging)
  var1 -= 20 
endif

if Equal var16 5
  if var1 < -40
    Button X
  endif
  Return
endif

LOGSTR 1633907712 796090624 1668546560 0 0
LOGVAL CurrAction
LOGVAL CurrSubaction
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
endif

  GetNearestCliff var2
  var17 = 15
  var3 = XSpeed * var17
  var3 += TopNX
  if var2 < 0
    if Equal IsOnStage 1 && !(Equal DistBackEdge DistFrontEdge)
      var2 -= var3
      if var2 >= 0
        var2 = 1
      endif
    endif
  elif var2 > 0
    if Equal IsOnStage 1 && !(Equal DistBackEdge DistFrontEdge)
      var2 -= var3
      if var2 <= 0
        var2 = -1
      endif
    endif
  endif
  if !(Equal var2 1) && !(Equal var2 -1)
    if Equal DistBackEdge DistFrontEdge || Equal IsOnStage 0
      var2 = 2
    else
      var2 = 0
    endif
  endif

if Equal var2 0
  Call AIHub
endif


if CurrAction < 11 && CurrAction > 16
  Return
elif Equal CurrAction 51 && AnimFrame <= var15
  Return
endif

if CanJump && NumJumps > 0
  var2 = -65
elif !(CanJump)
  var2 = -20
else
  var2 = -45
endif

var17 = var2 * -1
if Equal OIsOnStage 0 && Equal var16 3 && OTopNY > BBoundary && YDistBackEdge < var17
  Call ApproachHub
endif

if Equal OIsOnStage 0 && var0 <= 45 && var0 >= -45 && var1 >= var17 && !(Equal var18 255) && !(Equal var16 5)
  var18 = 0
  Call EdgeguardHub
endif
var18 = 0

// drift towards goal
var17 = var0 * -1
ClearStick
AbsStick var17

var6 -= 1
if var6 > 0
  Return
endif

var17 = var0
Abs var17
var22 = TopNY - BBoundary

if var22 < 10
  if NumJumps > 0
    Button X
  else 
    Stick 0 0.7
    Button B
  endif
elif var1 > 20 && Rnd < 0.03 && Equal var7 0 && NumJumps > 0
  GetRndPointOnStage var0
  var17 = var0 - TopNX
  AbsStick var17
  Button X
  var6 = 30
elif var1 < -20 && Rnd < 0.03 && Equal var7 0 && NumJumps > 0
  GetRndPointOnStage var0
  var17 = var0 - TopNX
  AbsStick var17
  Button X
  var6 = 30
elif var1 < -65 && NumJumps > 0
  Button X
  var6 = 30
elif var1 < -45
  if var17 > 45
    Button X
    var6 = 30
  elif Equal var8 0
    ClearStick
    Stick 0 0.7
    Button B
    var8 = 1
  endif
  Return
endif
if var17 > 45 && Equal var8 0 && Equal NumJumps 0
  ClearStick
  Stick 0 0.7
  Button B
  var8 = 1
elif var1 > -15 && Equal var7 0 && var17 < 15 && Equal var8 0 && NumJumps > 0
  GetRndPointOnStage var0
  var17 = var0 - TopNX
  AbsStick var17
  Button X
  var6 = 30
endif
Return

label willOEdgehog
  
Return


label handleNSpecial

Return

label handleSSpecial

Return

label handleUSpecial
  var8 = 0
if !(Equal CurrAction 276) && !(Equal CurrAction 16)
  if Equal AirGroundState 1 || Equal CurrAction 14 || Equal CurrAction 15 || FramesHitstun > 0
    Call AIHub
  endif
endif
GetReturnGoal var0
var0 = TopNX - var0
var0 *= -1
var1 = var1 - TopNY * -1
if !(Equal CurrSubaction 476) && !(Equal CurrSubaction 477)
  if !(NoOneHanging)
    var1 -= 25
    if var0 > 0
      var0 += 15
    else
      var0 -= 15
    endif
  elif var1 > -3
    var1 += 20
  endif
  var17 = var0
  Abs var17
  if var17 < 5 && var1 > -3 && var1 < 5 && YSpeed < 0
    ClearStick
  else
    Norm var17 var0 var1
    var4 = var0
    var3 = var1
    var0 /= var17
    var1 /= var17
    var0 *= -1
    var1 *= -1
    Abs var4
    if var3 < 0 && var4 < 10
      var1 -= 0.5
    endif
    if 0.1 < var0 && var0 < 0.25
      AbsStick 0.3 var1
    elif -0.25 < var0 && var0 < -0.1
      AbsStick -0.3 var1
    else
      AbsStick var0 var1
    endif
  endif
else
  var17 = TopNX * -1
  AbsStick var17
endif
Return

label handleDSpecial

Return

label handleSFall
  var17 = var0 * -1
  AbsStick var17
Return

label handleJumpToStage
  SetFrame 0
  label
  if CanJump && CurrAction <= 16
    Button X
  endif
  var17 = var0 * -1
  AbsStick var17
  if Equal IsOnStage 1 || FrameGE 30 || FramesHitstun > 0
    Call AIHub
  elif FrameGE 2 && YSpeed < 0
    Call AIHub
  elif FrameGE 20 && !(MeteoChance)
    Call AIHub
  endif
Return
Return
