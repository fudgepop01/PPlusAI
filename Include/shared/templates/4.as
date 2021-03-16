// RECOVERY HUB
// a place for determining the possible recoveries available
#include <Definition_AIMain.h>
id 0x8004

unk 0x0

if FramesHitstun > 0
  Return
endif
if Equal movePart hex(0xFF)
  Seek
  Jump
endif

{PREREQ_CHECKS}

#let hasTriedToUpB = var8
#let jumpingTimer = var6
jumpingTimer = 0
label
hasTriedToUpB = 0
label
#let isBelowStage = var7

// detects if below stage
#let rawCX = var0
#let rawReturnX = var1
#let rawReturnY = var2
#let nearCliffXOffset = var2

GetNearestCliff rawCX
GetReturnGoal rawReturnX

globTempVar = rawReturnX - rawCX 
isBelowStage = 0
if globTempVar < 10 && globTempVar > -10
  if globTempVar < 0
    nearCliffXOffset = 5
  else
    nearCliffXOffset = -5
  endif
elif rawReturnX < TopNX && TopNX < rawCX
elif rawCX < TopNX && TopNX < rawReturnX  
elif TopNY < rawReturnY
  if globTempVar < 0
    nearCliffXOffset = 10
  else
    nearCliffXOffset = -10
  endif
  isBelowStage = 1
endif


// gets nearest cliff coordinates relative to position
#let nearCliffX = var0
#let nearCliffY = var1

NEAREST_CLIFF(nearCliffX, nearCliffY)

nearCliffX += nearCliffXOffset
if Rnd < 0.05
  nearCliffY -= 20
endif

if !(NoOneHanging)
  nearCliffY -= 20 
endif

if Equal approachType at_ledgeRefresh
  if nearCliffY < -40
    Button X
  endif
  Return
endif

{SFALL_ACTIONS}
  Goto handleSFall
  Return
{USPECIAL_ACTIONS}
  Goto handleUSpecial
  Return
{NSPECIAL_ACTIONS}
  Goto handleNSpecial
  Return
{SSPECIAL_ACTIONS}
  Goto handleSSpecial
  Return
{DSPECIAL_ACTIONS}
  Goto handleDSpecial
  Return
endif

#let isGoingOffstage = var2
GOING_OFFSTAGE(isGoingOffstage, var3, 15)

if Equal isGoingOffstage 0
  Call AIHub
endif


if CurrAction < hex(0x0B) && CurrAction > hex(0x10)
  Return
elif Equal CurrAction hex(0x33) && AnimFrame <= move_IASA
  Return
endif

#let localMaxYEdgeDist = var2
if CanJump && NumJumps > 0
  localMaxYEdgeDist = -maxYEdgeDistWithJump
elif !(CanJump)
  localMaxYEdgeDist = -maxYEdgeDistJumpNoUpB
else
  localMaxYEdgeDist = -maxYEdgeDist
endif

globTempVar = localMaxYEdgeDist * -1
if Equal OIsOnStage 0 && Equal approachType at_edgeguard && OTopNY > BBoundary && YDistBackEdge < globTempVar
  Call ApproachHub
endif

if Equal OIsOnStage 0 && nearCliffX <= maxXEdgeDist && nearCliffX >= -maxXEdgeDist && nearCliffY >= globTempVar && !(Equal movePart hex(0xFF)) && !(Equal approachType at_ledgeRefresh)
  movePart = 0
  Call EdgeguardHub
endif
movePart = 0

// drift towards goal
globTempVar = nearCliffX * -1
ClearStick
AbsStick globTempVar

jumpingTimer -= 1
if jumpingTimer > 0
  Return
endif

globTempVar = nearCliffX
Abs globTempVar
immediateTempVar = TopNY - BBoundary

if immediateTempVar < 10
  if NumJumps > 0
    Button X
  else 
    Stick 0 0.7
    Button B
  endif
elif nearCliffY > maxYEdgeDistJumpNoUpB && Rnd < 0.1 && Equal isBelowStage 0 && NumJumps > 0
  GetRndPointOnStage nearCliffX
  globTempVar = nearCliffX - TopNX
  AbsStick globTempVar
  Button X
  jumpingTimer = 30
elif nearCliffY < -maxYEdgeDistJumpNoUpB && Rnd < 0.1 && Equal isBelowStage 0 && NumJumps > 0
  GetRndPointOnStage nearCliffX
  globTempVar = nearCliffX - TopNX
  AbsStick globTempVar
  Button X
  jumpingTimer = 30
elif nearCliffY < -maxYEdgeDistWithJump && NumJumps > 0
  Button X
  jumpingTimer = 30
elif nearCliffY < -maxYEdgeDist && Equal hasTriedToUpB 0
  ClearStick
  Stick 0 0.7
  Button B
  hasTriedToUpB = 1
elif globTempVar > maxXEdgeDist && Equal hasTriedToUpB 0 && Equal NumJumps 0
  ClearStick
  Stick 0 0.7
  Button B
  hasTriedToUpB = 1
elif nearCliffY > -15 && Equal isBelowStage 0 && globTempVar < minXEdgeDist && Equal hasTriedToUpB 0 && NumJumps > 0
  GetRndPointOnStage nearCliffX
  globTempVar = nearCliffX - TopNX
  AbsStick globTempVar
  Button X
  jumpingTimer = 30
endif
Return

label willOEdgehog
  
Return


label handleNSpecial
  {NSPECIAL}
Return

label handleSSpecial
  {SSPECIAL}
Return

label handleUSpecial
  hasTriedToUpB = 0
  {USPECIAL}
Return

label handleDSpecial
  {DSPECIAL}
Return

label handleSFall
  {SFALL}
Return

label handleJumpToStage
  {JUMP_TO_STAGE}
Return
Return