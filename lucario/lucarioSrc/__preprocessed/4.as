// RECOVERY HUB
// a place for determining the possible recoveries available
#include <Definition_AIMain.h>
id 0x8004

unk 0x0

if FramesHitstun > 0 || !(FrameGE 2)
  Return
endif

if Equal CurrAction 276 || Equal CurrAction 16
  Seek handleUpB
  Jump
  Return
endif

  GetNearestCliff var0
  var17 = 15
  var1 = XSpeed * var17
  var1 += TopNX
  if var0 < 0
    if Equal IsOnStage 1 && !(Equal DistBackEdge DistFrontEdge)
      var0 -= var1
      if var0 >= 0
        var0 = 1
      endif
    endif
  elif var0 > 0
    if Equal IsOnStage 1 && !(Equal DistBackEdge DistFrontEdge)
      var0 -= var1
      if var0 <= 0
        var0 = -1
      endif
    endif
  endif
  if !(Equal var0 1) && !(Equal var0 -1)
    if Equal DistBackEdge DistFrontEdge || Equal IsOnStage 0
      var0 = 2
    else
      var0 = 0
    endif
  endif

if Equal var0 0 || Equal AirGroundState 1
  Call AIHub
endif

if CurrAction < 11 && CurrAction > 16
  Return
elif Equal CurrAction 51 && AnimFrame <= var15
  Return
endif

// edge range width
// edge range height
// a temporary variable
// a second temporary variable
// will contain the X distance from the ledge
// will contain the Y distance from the ledge

SetVec var1 Zero
// GetNearestCliff stores values in BOTH the target var AND the next var over.
// This means if we input var0, it'll store values in var0 AND var1. The way
// we have the "let" variables above setup, var1 is var1, which means
// var2 will then contain the Y position of the cliff, which is why we name
// var2 var2
GetNearestCliff var1

// draws a debug rectangle around the cliff so we can see a visual of what
// the ranges are
// DrawDebugRectOutline var1 var2 50 25 255 255 255 136

// makes var1 and var2 relative to the character's position
var1 = TopNX - var1
var1 *= -1
var2 *= -1
var2 = var2 - (TopNY * -1)

if Equal OIsOnStage 0 && Equal var16 3 && OTopNY > BBoundary
  if CanJump && YDistBackEdge < 50
    Call ApproachHub
  elif !(CanJump) && YDistBackEdge < 30
    Call ApproachHub
  endif
endif

// if the opponent is offstage and we're offstage and within the bounds of the rect
// AND we have not yet determined if we can edgeguard the opponent, then check
// and edgeguard if possible
if Equal OIsOnStage 0 && var1 <= 50 && var1 >= -50 && var2 >= -25 && !(Equal var18 255) && !(Equal var16 5)
  var18 = 0
  Call EdgeguardHub
endif
var18 = 0

// makes var0 into the distance from the ledge regardless of whether
// the character is on the left or right of it
var0 = var1
Abs var0

var3 = OXDistFrontEdge
Abs var3

var17 = var1
Abs var17

if !(Equal var16 5)
  if var1 < 0
    AbsStick 1 0
  else
    AbsStick (-1) 0
  endif
else
  Button X
  if var1 < 0
    AbsStick (-1) 0
  else
    AbsStick 1 0
  endif
  Goto upB
endif



// after this, tempVar1 will contain the vertical distance to the ledge
// at which point to perform the next action
if LevelValue >= 48 
  if Equal var16 3 && TopNY > OTopNY && YDistBackEdge > 0
    var3 = var0
    var0 = -9999.9999
  elif NoOneHanging
    if Equal OIsOnStage 0 && var3 < var0
      var3 = var0
      var0 = -65 + 20
    else
      var3 = var0
      var0 = -65
    endif
  else
    var3 = var0
    var0 = -65 + 20
  endif
  if LevelValue <= 75
    var0 = var0 + Rnd * 20
  endif
else
  var3 = var0
  var0 = 10
endif

if CanJump
  var4 = BBoundary - TopNY
  if var4 > -10
    Seek handleJumpToStage
    Jump
  elif var3 < 20 && var2 <= -9999.9999 && Rnd < 0.3
    Seek handleJumpToStage
    Jump
  elif var2 <= var0
    Seek handleJumpToStage
    Jump
  elif var2 <= 9999.9999 && var3 > 40
    Seek handleJumpToStage
    Jump
  endif
endif


if var2 <= 40 && FramesHitstun < 1
  Goto upB
endif
Return

label upB
if !(NoOneHanging)
  var2 -= 25
  if var1 > 0
    var1 += 15
  else
    var1 -= 15
  endif
elif var2 > -3
    var2 += 20
endif
Norm var17 var1 var2
if Equal var16 5
  var22 = 20
else
  var22 = 40
endif
if var2 < 0 && var1 <= 30 && var1 >= -30
  var22 = 72
endif
if var17 >= var22 && var17 <= 100
  ClearStick
  AbsStick 0 0.7
  Button B
  Seek bReverseIfNecessary
endif
Return

// makes sure that the character is facing the ledge
// I get here using Seek because Seek waits 1 frame before actually
// getting here and continuing, giving it time to actually start the
// desired move
label bReverseIfNecessary
if Equal CurrAction 276
  Seek handleUpB
  Jump
else
  label
  if CurrAction <= 15
    Button X
    Seek handleJumpToStage
    Jump
  endif
  if FramesHitstun > 0
    Call AIHub
  endif
  Return
endif
Return

label handleUpB
if !(Equal CurrAction 276) && !(Equal CurrAction 16)
  if Equal AirGroundState 1 || Equal CurrAction 14 || Equal CurrAction 15 || FramesHitstun > 0
    Call AIHub
  endif
endif

GetNearestCliff var1
var1 = TopNX - var1
var1 *= -1
var2 = var2 - TopNY * -1

if !(Equal CurrSubaction 476) && !(Equal CurrSubaction 477)
  if !(NoOneHanging)
    var2 -= 25
    if var1 > 0
      var1 += 15
    else
      var1 -= 15
    endif
  elif var2 > -3
    var2 += 20
  endif

  var17 = var1
  Abs var17
  if var17 < 5 && var2 > -3 && var2 < 5 && YSpeed < 0
    ClearStick
  else
    Norm var17 var1 var2

    var0 = var1
    var3 = var2
    var1 /= var17
    var2 /= var17
    var1 *= -1
    var2 *= -1

    Abs var0
    if var3 < 0 && var0 < 10
      var2 -= 0.5
    endif

    if 0.1 < var1 && var1 < 0.25
      AbsStick 0.3 var2
    elif -0.25 < var1 && var1 < -0.1
      AbsStick -0.3 var2
    else
      AbsStick var1 var2
    endif
  endif
else
  var17 = TopNX * -1
  AbsStick var17
endif
Return

label handleJumpToStage
SetFrame 0
label
if CanJump && CurrAction <= 16
  Button X
endif

GetNearestCliff var1
var1 = TopNX - var1
var1 *= -1
var2 = var2 - TopNY * -1

if var1 > 10
  AbsStick -1 0
elif var1 < -10
  AbsStick 1 0
endif

if Equal IsOnStage 1 || FrameGE 30 || FramesHitstun > 0
  Call AIHub
elif FrameGE 10 && !(MeteoChance)
  Call AIHub
endif
Return
Return
