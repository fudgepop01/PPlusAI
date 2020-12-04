// RECOVERY HUB
// a place for determining the possible recoveries available
#include <Definition_AIMain.h>
id 0x8004

unk 0x0

if Equal CurrAction hex(0x114) || Equal CurrAction hex(0x10)
  Seek handleUpB
  Jump
  Return
endif

#let isGoingOffstage = var0
GOING_OFFSTAGE(var0, var1, 15)

if Equal isGoingOffstage 0
  LOGSTR str("am on stage??")
  Call AIHub
endif

if CurrAction < hex(0x0B) && CurrAction > hex(0x10)
  Return
endif

// edge range width
#const rw = 50
// edge range height
#const rh = 25
// a temporary variable
#let tempVar = var0
// a second temporary variable
#let tempVar2 = var3
// will contain the X distance from the ledge
#let nearCliffX = var1
// will contain the Y distance from the ledge
#let nearCliffY = var2

SetVec nearCliffX Zero
// GetNearestCliff stores values in BOTH the target var AND the next var over.
// This means if we input var0, it'll store values in var0 AND var1. The way
// we have the "let" variables above setup, nearCliffX is var1, which means
// var2 will then contain the Y position of the cliff, which is why we name
// var2 nearCliffY
GetNearestCliff nearCliffX

// draws a debug rectangle around the cliff so we can see a visual of what
// the ranges are
// DrawDebugRectOutline nearCliffX nearCliffY rw rh color(0xffffff88)

// makes nearCliffX and nearCliffY relative to the character's position
nearCliffX = TopNX - nearCliffX
nearCliffX *= -1
nearCliffY *= -1
nearCliffY = nearCliffY - (TopNY * -1)

#let distToOpp = var4
distToOpp = TopNY + move_yOffset - OHurtboxSize
if Equal OIsOnStage 0 && distToOpp >= OTopNY && Equal moveVariant mv_edgeguard && OTopNY > BBoundary
  Call ApproachHub
endif

// if the opponent is offstage and we're offstage and within the bounds of the rect
// AND we have not yet determined if we can edgeguard the opponent, then check
// and edgeguard if possible
if Equal OIsOnStage 0 && nearCliffX <= rw && nearCliffX >= -rw && nearCliffY >= -rh && !(Equal movePart hex(0xFF)) && !(Equal moveVariant mv_ledgeRefresh)
  movePart = 0
  Call EdgeguardHub
endif
movePart = 0

// makes tempVar into the distance from the ledge regardless of whether
// the character is on the left or right of it
tempVar = nearCliffX
Abs tempVar

// if we're above the ledge...
if nearCliffY > 0
  // and are above it 60 or more units and over 35 units away
  if nearCliffY > 60 && tempVar > 35
    // if we can jump
    if CanJump
      // then jump towards the ledge
      if nearCliffX > 0
        AbsStick (-1) 0
      else
        AbsStick 1 0
      endif
      Button X
      Call AIHub
    endif
    // otherwise perform downB
    // (which doesn't seem to be working at the moment big sad)
    if YSpeed < 0 && LevelValue >= LV7
      AbsStick 0 (-1)
      Button B
      Seek bReverseIfNecessary
    endif
    Return
  endif

  // otherwise, drift toward the ledge
  if TopNX < nearCliffX
    AbsStick 1 0
  else
    AbsStick (-1) 0
  endif
  if tempVar > 10 && tempVar < 25 && Equal IsOnStage 0 && nearCliffY < 40 && LevelValue > LV6
    Button B
    Seek bReverseIfNecessary
  elif tempVar >= 25 && tempVar < 50
    Stick 0 0.7
  endif
  Return
else
  // otherwise, we must be below the ledge...

  // drift toward the ledge
  globTempVar = nearCliffX
  Abs globTempVar
  if !(Equal moveVariant mv_ledgeRefresh)
    if nearCliffX < 0
      AbsStick 1 0
    else
      AbsStick (-1) 0
    endif
  endif

  tempVar2 = OXDistFrontEdge
  Abs tempVar2

  // after this, tempVar1 will contain the vertical distance to the ledge
  // at which point to perform the next action
  if LevelValue >= LV6
    if distToOpp < OTopNY && Equal moveVariant mv_edgeguard && TopNY > OTopNY
      tempVar2 = tempVar
      tempVar = -10
    elif NoOneHanging
      if Equal OIsOnStage 0 && tempVar2 < tempVar
        tempVar2 = tempVar
        tempVar = -30
      else
        tempVar2 = tempVar
        tempVar = -50
      endif
    else
      tempVar2 = tempVar
      tempVar = -30
    endif
    if LevelValue <= LV8
      tempVar = tempVar + Rnd * 20
    endif
  else
    tempVar2 = tempVar
    tempVar = 10
  endif
  // tempVar2 now contains the absolute distance to the ledge
  // because i'm not fully sure how OR works here, I just do this lol

  // if nearCliffY < 3 && nearCliffY > 0 && Equal IsOnStage 0
  //   if nearCliffX > -3 && nearCliffX < 0
  //     AbsStick 1 1
  //     Button R
  //     Call AIHub
  //   elif nearCliffX < 3 && nearCliffX > 0
  //     AbsStick (-1) 1
  //     Button R
  //     Call AIHub
  //   endif
  // endif
  if CanJump
    if globTempVar < 2 && nearCliffY >= -10 && Rnd < 0.3
      Button X
      Seek handleJumpToStage
      Jump
    elif nearCliffY <= tempVar && nearCliffY >= -30 && globTempVar < 20
      Button X
      Seek handleJumpToStage
      Jump
    elif nearCliffY < -rh && tempVar2 > 20
      // if we're beyond 20 units away and under the vertical bounds
      Button X
      Call AIHub
    elif nearCliffY < -40 && globTempVar < 5
      // if we're directly under the ledge then clear the stick's input
      // and jump
      ClearStick
      Button X
      Call AIHub
    elif nearCliffY < -40
      Button X
      Call AIHub
    elif tempVar2 > rw
      Button X
      Call AIHub
    endif
  endif

  if nearCliffY <= tempVar && TotalYSpeed < -1 && FramesHitstun < 1
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
tempVar = nearCliffX * Direction
// LOGVAL NumFrames
if Equal CurrAction hex(0x114) && NumFrames < 10 && globTempVar < 5
  tempVar = TopNX * -1
  AbsStick tempVar
  Return
elif tempVar > 0
  ClearStick
  Stick (-1)
  Return
endif
if Equal CurrAction hex(0x114)
  Seek handleUpB
  Jump
elif Equal CurrAction hex(0x113)
  Seek handleSideB
  Jump
elif Equal CurrAction hex(0x115)
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
if !(Equal CurrSubaction DSpecialAir) && !(Equal CurrAction hex(0x10))
  Call AIHub
endif

Return

label handleSideB
if !(Equal CurrSubaction SSpecialAir) && !(Equal CurrAction hex(0x10))
  Call AIHub
endif

Return

// this one however has a bit more complexity
label handleUpB
#let prevTopNY = var3

// if we are no longer performing upB and aren't in special fall,
// call AIHub
if !(Equal CurrAction hex(0x114)) && !(Equal CurrAction hex(0x10))
  if !(Equal AirGroundState 2) || Equal CurrAction hex(0x0E) || Equal CurrAction hex(0x0F) || FramesHitstun > 0
    Call AIHub
  endif
endif

// otherwise, we get the distance to the ledge on every frame
GetNearestCliff nearCliffX
nearCliffX = TopNX - nearCliffX
nearCliffX *= -1
nearCliffY = nearCliffY - TopNY * -1

// based on the direction falcon is facing, we want to be in a certain position
// relative to the ledge so we can grab it.
// this is the code that ensures that happens:
if nearCliffY > -4
  if nearCliffX > 0
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
  if nearCliffX > 3
    AbsStick (-1)
  elif nearCliffX < 1
    AbsStick 1
  endif
elif True
  if nearCliffX < -3
    AbsStick 1
  elif nearCliffX > -1
    AbsStick (-1)
  endif
endif
Return

label handleJumpToStage
SetFrame 0
label
if CanJump && CurrAction <= hex(0x10)
  Button X
endif
if YSpeed > -0.5
  if nearCliffX > 0
    AbsStick 1 0
  else
    AbsStick (-1) 0
  endif
elif True
  if nearCliffX > 0
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