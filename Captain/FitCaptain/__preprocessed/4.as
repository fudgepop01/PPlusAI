// RECOVERY HUB
// a place for determining the possible recoveries available
#include <Definition_AIMain.h>
id 0x8004

unk 0x0

if Equal CurrAction 276 || Equal CurrAction 16
  Seek handleUpB
  Jump
  Return
endif

  GetNearestCliff var0
  var1 = XSpeed * 15
  var1 += TopNX
  if var0 < 0
    if Equal IsOnStage 0 || Equal DistBackEdge DistFrontEdge
      var0 += var1
      if var0 >= 0
        var0 = 1
      endif
    endif
  elif var0 > 0
    if Equal IsOnStage 0 || Equal DistBackEdge DistFrontEdge
      var0 += var1
      if var0 <= 0
        var0 = -1
      endif
    endif
  endif
  if !(Equal var0 1) || !(Equal var0 -1)
    if Equal DistBackEdge DistFrontEdge || Equal IsOnStage 0
      var0 = 2
    else
      var0 = 0
    endif
  endif

if Equal var0 0
  LOGSTR 1634541568 1869488128 1937006848 1734688512 1056964608
  Call AIHub
endif

if CurrAction < 11 && CurrAction > 16
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

var4 = TopNY + var10 - OHurtboxSize
if Equal OIsOnStage 0 && var4 >= OTopNY && Equal var19 255 && OTopNY > BBoundary
  Call ApproachHub
endif

// if the opponent is offstage and we're offstage and within the bounds of the rect
// AND we have not yet determined if we can edgeguard the opponent, then check
// and edgeguard if possible
if Equal OIsOnStage 0 && var1 <= 50 && var1 >= -50 && var2 >= -25 && !(Equal var18 255) && !(Equal var19 254)
  var18 = 0
  Call EdgeguardHub
endif
var18 = 0

// makes var0 into the distance from the ledge regardless of whether
// the character is on the left or right of it
var0 = var1
Abs var0

// if we're above the ledge...
if var2 > 0
  // and are above it 60 or more units and over 35 units away
  if var2 > 60 && var0 > 35
    // if we can jump
    if CanJump
      // then jump towards the ledge
      if var1 > 0
        AbsStick (-1) 0
      else
        AbsStick 1 0
      endif
      Button X
      Call AIHub
    endif
    // otherwise perform downB
    // (which doesn't seem to be working at the moment big sad)
    if YSpeed < 0 && LevelValue >= 60
      AbsStick 0 (-1)
      Button B
      Seek bReverseIfNecessary
    endif
    Return
  endif

  // otherwise, drift toward the ledge
  if TopNX < var1
    AbsStick 1 0
  else
    AbsStick (-1) 0
  endif
  if var0 > 10 && var0 < 25 && Equal IsOnStage 0 && var2 < 40 && LevelValue > 48
    Button B
    Seek bReverseIfNecessary
  elif var0 >= 25 && var0 < 50
    Stick 0 0.7
  endif
  Return
else
  // otherwise, we must be below the ledge...

  // drift toward the ledge
  var17 = var1
  Abs var17
  if !(Equal var19 254)
    if var1 < 0
      AbsStick 1 0
    else
      AbsStick (-1) 0
    endif
  endif

  var3 = OXDistFrontEdge
  Abs var3

  // after this, tempVar1 will contain the vertical distance to the ledge
  // at which point to perform the next action
  if LevelValue >= 48
    if var4 < OTopNY && Equal var19 255 && TopNY > OTopNY
      var3 = var0
      var0 = -10
    elif NoOneHanging
      if Equal OIsOnStage 0 && var3 < var0
        var3 = var0
        var0 = -30
      else
        var3 = var0
        var0 = -50
      endif
    else
      var3 = var0
      var0 = -30
    endif
    if LevelValue <= 75
      var0 = var0 + Rnd * 20
    endif
  else
    var3 = var0
    var0 = 10
  endif
  // var3 now contains the absolute distance to the ledge
  // because i'm not fully sure how OR works here, I just do this lol

  // if var2 < 3 && var2 > 0 && Equal IsOnStage 0
  //   if var1 > -3 && var1 < 0
  //     AbsStick 1 1
  //     Button R
  //     Call AIHub
  //   elif var1 < 3 && var1 > 0
  //     AbsStick (-1) 1
  //     Button R
  //     Call AIHub
  //   endif
  // endif
  if CanJump
    if var17 < 2 && var2 >= -10 && Rnd < 0.3
      Button X
      Seek handleJumpToStage
      Jump
    elif var2 <= var0 && var2 >= -30 && var17 < 20
      Button X
      Seek handleJumpToStage
      Jump
    elif var2 < -25 && var3 > 20
      // if we're beyond 20 units away and under the vertical bounds
      Button X
      Call AIHub
    elif var2 < -40 && var17 < 5
      // if we're directly under the ledge then clear the stick's input
      // and jump
      ClearStick
      Button X
      Call AIHub
    elif var2 < -40
      Button X
      Call AIHub
    elif var3 > 50
      Button X
      Call AIHub
    endif
  endif

  if var2 <= var0 && TotalYSpeed < -1 && FramesHitstun < 1
    // this means we can't jump and are falling, at which point we want to
    // perform upB
    AbsStick 0 0.7
    Button B
    Seek bReverseIfNecessary
  endif
endif
Return

// makes sure that the character is facing the ledge
// I get here using Seek because Seek waits 1 frame before actually
// getting here and continuing, giving it time to actually start the
// desired move
label bReverseIfNecessary
SetFrame 0
label
var0 = var1 * Direction
// LOGVAL NumFrames
if Equal CurrAction 276 && NumFrames < 10 && var17 < 5
  var0 = TopNX * -1
  AbsStick var0
  Return
elif var0 > 0
  ClearStick
  Stick (-1)
  Return
endif
if Equal CurrAction 276
  Seek handleUpB
  Jump
elif Equal CurrAction 275
  Seek handleSideB
  Jump
elif Equal CurrAction 277
  Seek handleDownB
  Jump
elif True
  if FramesHitstun > 0 || NumFrames >= 10
    Call AIHub
  endif
  Return
endif
Return

// these two aren't super special because you really can't do much with
// them once they're performed
label handleDownB
if !(Equal CurrSubaction DSpecialAir) && !(Equal CurrAction 16)
  Call AIHub
endif

Return

label handleSideB
if !(Equal CurrSubaction SSpecialAir) && !(Equal CurrAction 16)
  Call AIHub
endif

Return

// this one however has a bit more complexity
label handleUpB

// if we are no longer performing upB and aren't in special fall,
// call AIHub
if !(Equal CurrAction 276) && !(Equal CurrAction 16)
  if !(Equal AirGroundState 2) || Equal CurrAction 14 || Equal CurrAction 15 || FramesHitstun > 0
    Call AIHub
  endif
endif

// otherwise, we get the distance to the ledge on every frame
GetNearestCliff var1
var1 = TopNX - var1
var1 *= -1
var2 = var2 - TopNY * -1

// based on the direction falcon is facing, we want to be in a certain position
// relative to the ledge so we can grab it.
// this is the code that ensures that happens:
if var2 > -4
  if var1 > 0
    if Equal IsOnStage 0
      AbsStick (-1)
    else
      AbsStick 1
    endif
  elif True
    if Equal IsOnStage 0
      AbsStick 1
    else
      AbsStick -1
    endif
  endif
elif Equal Direction -1
  if var1 > 3
    AbsStick (-1)
  elif var1 < 1
    AbsStick 1
  endif
elif True
  if var1 < -3
    AbsStick 1
  elif var1 > -1
    AbsStick (-1)
  endif
endif
Return

label handleJumpToStage
SetFrame 0
label
if CanJump && CurrAction <= 16
  Button X
endif
if YSpeed > -0.5
  if var1 > 0
    AbsStick 1 0
  else
    AbsStick (-1) 0
  endif
elif True
  if var1 > 0
    AbsStick -1 0
  else
    AbsStick 1 0
  endif
endif

if Equal IsOnStage 1 || FrameGE 30 || FramesHitstun > 0
  Call AIHub
elif FrameGE 10 && !(MeteoChance)
  Call AIHub
endif
Return
Return
