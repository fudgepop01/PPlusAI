// RECOVERY HUB
// a place for determining the possible recoveries available
#include <Definition_AIMain.h>
id 0x8004

unk 0x0

var0 = 4
label
Cmd30

if CurrAction >= 66 && CurrAction <= 69 && !(OutOfStage)
  Call OnGotDamaged
endif

if Equal AirGroundState 1 && Equal var21 32769
  Call ApproachHub
elif Equal var16 7
elif Equal var21 32769 && MeteoChance && Equal var16 3 && !(NoOpponent)
  Call ApproachHub
endif

if !(OutOfStage) || Equal AirGroundState 1
  Call AIHub
endif
if Equal var16 7
  Call LedgeHang
endif
if FramesHitstun > 0
  Return
endif
var0 -= 1
if var0 > 0
  Return
endif

if Equal var18 255
  Seek
  Jump
endif

// {PREREQ_CHECKS}

var6 = 0
label
// {INITIALIZERS}
var8 = 0
label _main
if FramesHitstun > 0
  Call AIHub
endif
Cmd30

// detects if below stage

GetNearestCliff var0
GetReturnGoal var1

// {NCXOFFS_REDEFINE}

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
    var2 = 7
  else
    var2 = -7
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

if !(NoOneHanging)
  var1 -= 20 
endif

// var0 -= TopNX
// var0 *= -1
// var1 -= TopNY
// DrawDebugRectOutline var0 var1 35 80 255 0 0 136
// DrawDebugRectOutline var0 var1 35 40 255 136 0 136
// DrawDebugRectOutline var0 var1 35 60 255 255 0 136
// DrawDebugRectOutline var0 var1 5 5 0 255 0 221
// var0 *= -1
// var0 += TopNX
// var1 += TopNY

if FramesHitstun > 0
  Call AIHub
endif
if Equal var16 5
  if var1 < -40 && YSpeed < 0
    if NumJumps > 0
      Button X
      Return 
    else
      var16 = 0
      Return
    endif
  else
    Return
  endif
endif

LOGSTR 1633907712 796090624 1668546560 0 0
LOGVAL CurrAction
LOGVAL CurrSubaction
  if Equal CurrAction 16 
  Goto handleSFall
  Return
  elif Equal CurrAction 276 || Equal CurrAction 283
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
  var2 -= TopNX
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
    if Equal XDistBackEdge XDistFrontEdge || Equal IsOnStage 0
      var2 = 2
    else
      var2 = 0
    endif
  endif

if Equal var2 0 || Equal AirGroundState 1
  Call AIHub
endif


if CurrAction < 11 && CurrAction > 16
  Return
elif Equal CurrAction 51 && AnimFrame <= var15
  Return
endif

if CanJump && NumJumps > 0
  var2 = 80
elif !(CanJump)
  var2 = 60
else
  var2 = 40
endif

if Equal OIsOnStage 0 && Equal var16 3 && !(NoOpponent) && YDistBackEdge < var2
  Call ApproachHub
endif

if Equal OIsOnStage 0 && var0 <= 35 && var0 >= -35 && var1 >= var17 && !(Equal var18 255) && !(Equal var16 5)
  var18 = 0
  Call EdgeguardHub
endif

// drift towards goal
var17 = var0 * -1
ClearStick
AbsStick var17

var6 -= 1
if var6 > 0
  Return
endif


LOGSTR 1313036544 0 0 0 0
LOGVAL var1

  var22 = var0 
  Abs var22
  var17 = var1
  Abs var17
  var22 = var17 - var22
  Abs var22
  var2 = var22 - 35

var3 = var0
Abs var3
var22 = TopNY - BBoundary
if var22 < 10
  if NumJumps > 0
    Button X
  else 
    Stick 0 0.7
    Button B
  endif
elif var1 > 60 && Rnd < 0.03 && Equal var7 0 && NumJumps > 0 && !(Equal var18 255)
  GetRndPointOnStage var0
  var17 = var0 - TopNX
  AbsStick var17
  Button X
  var6 = 30
  Return
elif var1 < -60 && Rnd < 0.03 && Equal var7 0 && NumJumps > 0 && !(Equal var18 255)
  GetRndPointOnStage var0
  var17 = var0 - TopNX
  AbsStick var17
  Button X
  var6 = 30
  Return
elif var1 < -80 && NumJumps > 0
  Button X
  var6 = 30
  Return
elif var1 > -40 && var1 <= -36
  if var2 > 0 && NumJumps > 0
    GetRndPointOnStage var0
    var17 = var0 - TopNX
    AbsStick var17
    Button X
    var6 = 30
  elif Equal var8 0 
    if YDistBackEdge < 0
      Return
    endif
    ClearStick
    Stick 0 0.7
    Button B
    var8 = 1
  endif
  Return
endif
var22 = OTopNY + 30
if YDistBackEdge > 0 && Equal var8 0 && TopNY < var22 && var1 > -40 && Equal OIsOnStage 0 && Equal var7 0 && XDistLE 10 && var3 > 10 && var2 < 0
  ClearStick
  Stick 0 0.7
  Button B
  var8 = 1
  Return
endif
if var2 < 0 && Equal var8 0 && Equal NumJumps 0
  if YDistBackEdge < 0
    Return
  endif
  ClearStick
  Stick 0 0.7
  Button B
  var8 = 1
elif var1 > -15 && Equal var7 0 && var2 < 0 && Equal var8 0 && NumJumps > 0 && !(Equal var18 255)
  GetRndPointOnStage var0
  var17 = var0 - TopNX
  AbsStick var17
  Button X
  var6 = 30
endif
// {ADDITIONAL_TRIGGERS}

Seek _main
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
  if Equal CurrSubaction 473 || Equal CurrSubaction 474
    if Equal var7 1
  GetNearestCliff var0
  var0 = TopNX - var0
  var0 *= -1
  var1 *= -1
  var1 = var1 - (TopNY * -1)
    endif 
    
    if !(NoOneHanging)
      var1 -= 25
      if var0 > 0
        var0 += 15
      else
        var0 -= 15
      endif
    endif
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
    GetNearestCliff var0 
    var0 = TopNX - var0
    if Equal var7 1
      var0 *= -1
    endif
    AbsStick var0
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
