// RECOVERY HUB
// a place for determining the possible recoveries available
#include <Definition_AIMain.h>
id 0x8004

unk 0x0

if FramesHitstun > 0
  Return
endif
if Equal var18 255
  Seek
  Jump
endif

// {PREREQ_CHECKS}

var8 = 0
var6 = 0
label

// detects if below stage

GetNearestCliff var0
GetReturnGoal var1

var17 = var1 - var0 
var7 = 0
if var17 < 10 && var17 > -10
  if var17 < 0
    var2 = -3
  else
    var2 = 3
  endif
elif var1 < TopNX && TopNX < var0
elif var0 < TopNX && TopNX < var1  
elif TopNY < var2
  if var17 < 0
    var2 = -10
  else
    var2 = 10
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
  var2 = -70
elif !(CanJump)
  var2 = -25
else
  var2 = -50
endif

var17 = var2 * -1
if Equal OIsOnStage 0 && Equal var16 3 && OTopNY > BBoundary && YDistBackEdge < var17
  Call ApproachHub
endif

if Equal OIsOnStage 0 && var0 <= 60 && var0 >= -60 && var1 >= var17 && !(Equal var18 255) && !(Equal var16 5)
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
elif var1 > -25 && Rnd < 0.1 && Equal var7 0
  GetRndPointOnStage var0
  var17 = var0 - TopNX
  AbsStick var17
  Button X
  var6 = 30
elif var1 < -70 && NumJumps > 0
  Button X
  var6 = 30
elif var1 < -50 && var17 < 60 && Equal var8 0
  Stick 0 0.7
  Button B
  var8 = 1
endif
Return


label handleNSpecial
// move "nspecial" not found
Return

label handleSSpecial
  if !(Equal CurrSubaction 468) && !(Equal CurrSubaction 469)
    Call AIHub
  endif
Return

label handleUSpecial
  if !(Equal CurrSubaction 470) && !(Equal CurrSubaction 471)
    Call AIHub
  endif
  var17 = var0 * -1
  AbsStick var17
Return

label handleDSpecial
// move "dspecial" not found
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
