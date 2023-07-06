// RECOVERY HUB
// a place for determining the possible recoveries available
#include <Definition_AIMain.h>
id 0x8004

unk 0x0

if FramesHitstun > 0 || !(FrameGE 2)
  Return
endif

if Equal CurrAction hex(0x114) || Equal CurrAction hex(0x10)
  Seek handleUpB
  Jump
  Return
endif

#let isGoingOffstage = var0
GOING_OFFSTAGE(var0, var1, 15)

if Equal isGoingOffstage 0 || Equal AirGroundState 1
  Call AIHub
endif

if CurrAction < hex(0x0B) && CurrAction > hex(0x10)
  Return
elif Equal CurrAction hex(0x33) && AnimFrame <= move_IASA
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

if Equal OIsOnStage 0 && Equal approachType at_edgeguard && OTopNY > BBoundary
  if CanJump && YDistBackEdge < 50
    Call ApproachHub
  elif !(CanJump) && YDistBackEdge < 30
    Call ApproachHub
  endif
endif

// if the opponent is offstage and we're offstage and within the bounds of the rect
// AND we have not yet determined if we can edgeguard the opponent, then check
// and edgeguard if possible
if Equal OIsOnStage 0 && nearCliffX <= rw && nearCliffX >= -rw && nearCliffY >= -rh && !(Equal movePart hex(0xFF)) && !(Equal approachType at_ledgeRefresh)
  movePart = 0
  Call EdgeguardHub
endif
movePart = 0

#let absNearCliffX = var0
// makes tempVar into the distance from the ledge regardless of whether
// the character is on the left or right of it
absNearCliffX = nearCliffX
Abs absNearCliffX

tempVar2 = OXDistFrontEdge
Abs tempVar2

globTempVar = nearCliffX
Abs globTempVar

if !(Equal approachType at_ledgeRefresh)
  if nearCliffX < 0
    AbsStick 1 0
  else
    AbsStick (-1) 0
  endif
else
  Button X
  if nearCliffX < 0
    AbsStick (-1) 0
  else
    AbsStick 1 0
  endif
  Goto upB
endif

#let yEdgeDistLimit = var0

#let absNCX2 = var3

// after this, tempVar1 will contain the vertical distance to the ledge
// at which point to perform the next action
if LevelValue >= LV6 
  if Equal approachType at_edgeguard && TopNY > OTopNY && YDistBackEdge > 0
    absNCX2 = absNearCliffX
    yEdgeDistLimit = -maxYEdgeDistJumpNoUpB
  elif NoOneHanging
    if Equal OIsOnStage 0 && absNCX2 < absNearCliffX
      absNCX2 = absNearCliffX
      yEdgeDistLimit = -maxYEdgeDistWithJump + 20
    else
      absNCX2 = absNearCliffX
      yEdgeDistLimit = -maxYEdgeDistWithJump
    endif
  else
    absNCX2 = absNearCliffX
    yEdgeDistLimit = -maxYEdgeDistWithJump + 20
  endif
  if LevelValue <= LV8
    yEdgeDistLimit = yEdgeDistLimit + Rnd * 20
  endif
else
  absNCX2 = absNearCliffX
  yEdgeDistLimit = 10
endif

if CanJump
  #let distFromBottomBZ = var4
  distFromBottomBZ = BBoundary - TopNY
  if distFromBottomBZ > -10
    Seek handleJumpToStage
    Jump
  elif absNCX2 < 20 && nearCliffY <= -maxYEdgeDistJumpNoUpB && Rnd < 0.3
    Seek handleJumpToStage
    Jump
  elif nearCliffY <= yEdgeDistLimit
    Seek handleJumpToStage
    Jump
  elif nearCliffY <= maxYEdgeDistJumpNoUpB && absNCX2 > 40
    Seek handleJumpToStage
    Jump
  endif
endif


if nearCliffY <= 20 && FramesHitstun < 1
  Goto upB
endif
Return

label upB
if !(NoOneHanging)
  nearCliffY -= 25
  if nearCliffX > 0
    nearCliffX += 15
  else
    nearCliffX -= 15
  endif
endif
Norm globTempVar nearCliffX nearCliffY
if globTempVar >= 35 && globTempVar <= 75
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
if Equal CurrAction hex(0x114)
  Seek handleUpB
  Jump
else
  label
  if CurrAction <= hex(0x0F)
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
if !(Equal CurrAction hex(0x114)) && !(Equal CurrAction hex(0x10))
  if Equal AirGroundState 1 || Equal CurrAction hex(0x0E) || Equal CurrAction hex(0x0F) || FramesHitstun > 0
    Call AIHub
  endif
endif

GetNearestCliff nearCliffX
nearCliffX = TopNX - nearCliffX
nearCliffX *= -1
nearCliffY = nearCliffY - TopNY * -1

if Equal CurrSubaction hex(0x1D9) || Equal CurrSubaction hex(0x1DA)
  if !(NoOneHanging)
    nearCliffY -= 25
    if nearCliffX > 0
      nearCliffX += 15
    else
      nearCliffX -= 15
    endif
  endif

  Norm globTempVar nearCliffX nearCliffY

  nearCliffX /= globTempVar
  nearCliffY /= globTempVar
  nearCliffX *= -1
  nearCliffY *= -1

  if 0.1 < nearCliffX && nearCliffX < 0.25
    AbsStick 0.3 nearCliffY
  elif -0.25 < nearCliffX && nearCliffX < -0.1
    AbsStick -0.3 nearCliffY
  else
    AbsStick nearCliffX nearCliffY
  endif

  
else
  globTempVar = TopNX * -1
  AbsStick globTempVar
endif
Return

label handleJumpToStage
SetFrame 0
label
if CanJump && CurrAction <= hex(0x10)
  Button X
endif

GetNearestCliff nearCliffX
nearCliffX = TopNX - nearCliffX
nearCliffX *= -1
nearCliffY = nearCliffY - TopNY * -1

if nearCliffX > 10
  AbsStick -1 0
elif nearCliffX < -10
  AbsStick 1 0
endif

if Equal IsOnStage 1 || FrameGE 30 || FramesHitstun > 0
  Call AIHub
elif FrameGE 10 && !(MeteoChance)
  Call AIHub
endif
Return
Return