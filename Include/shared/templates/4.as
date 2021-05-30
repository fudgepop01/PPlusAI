// RECOVERY HUB
// a place for determining the possible recoveries available
#include <Definition_AIMain.h>
id 0x8004

unk 0x0

#let sureTimer = var0
sureTimer = 4
label
Cmd30

if CurrAction >= hex(0x42) && CurrAction <= hex(0x45) && !(OutOfStage)
  Call OnGotDamaged
endif

if Equal AirGroundState 1 && Equal lastScript hex(0x8001)
  Call ApproachHub
elif Equal approachType at_OFF_LEDGE
elif Equal lastScript hex(0x8001) && MeteoChance && Equal approachType at_edgeguard && !(NoOpponent)
  Call ApproachHub
endif

if !(OutOfStage) || Equal AirGroundState 1
  Call AIHub
endif
if Equal approachType at_OFF_LEDGE
  Call LedgeHang
endif
if FramesHitstun > 0
  Return
endif
sureTimer -= 1
if sureTimer > 0
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
{INITIALIZERS}
hasTriedToUpB = 0
label _main
if FramesHitstun > 0
  Call AIHub
endif
Cmd30
#let isBelowStage = var7

// detects if below stage
#let rawCX = var0
#let rawReturnX = var1
#let rawReturnY = var2
#let nearCliffXOffset = var2

GetNearestCliff rawCX
GetReturnGoal rawReturnX

#const NCXOffs = 7
#const NCXOffsNear = 5
{NCXOFFS_REDEFINE}

globTempVar = rawReturnX - rawCX 
isBelowStage = 0
if globTempVar < 10 && globTempVar > -10
  if globTempVar < 0
    nearCliffXOffset = NCXOffsNear
  else
    nearCliffXOffset = -NCXOffsNear
  endif
elif rawReturnX < TopNX && TopNX < rawCX
elif rawCX < TopNX && TopNX < rawReturnX  
elif TopNY < rawReturnY
  if globTempVar < 0
    nearCliffXOffset = NCXOffs
  else
    nearCliffXOffset = -NCXOffs
  endif
  isBelowStage = 1
endif


// gets nearest cliff coordinates relative to position
#let nearCliffX = var0
#let nearCliffY = var1

NEAREST_CLIFF(nearCliffX, nearCliffY)

nearCliffX += nearCliffXOffset

if !(NoOneHanging)
  nearCliffY -= 20 
endif

// nearCliffX -= TopNX
// nearCliffX *= -1
// nearCliffY -= TopNY
// DrawDebugRectOutline nearCliffX nearCliffY maxXEdgeDist maxYEdgeDistWithJump color(0xFF000088)
// DrawDebugRectOutline nearCliffX nearCliffY maxXEdgeDist maxYEdgeDist color(0xFF880088)
// DrawDebugRectOutline nearCliffX nearCliffY maxXEdgeDist maxYEdgeDistJumpNoUpB color(0xFFFF0088)
// DrawDebugRectOutline nearCliffX nearCliffY 5 5 color(0x00FF00DD)
// nearCliffX *= -1
// nearCliffX += TopNX
// nearCliffY += TopNY

if FramesHitstun > 0
  Call AIHub
endif
if Equal approachType at_ledgeRefresh
  {LEDGE_REFRESH}
endif

LOGSTR str("act/sact")
LOGVAL CurrAction
LOGVAL CurrSubaction
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

if Equal isGoingOffstage 0 || Equal AirGroundState 1
  Call AIHub
endif


if CurrAction < hex(0x0B) && CurrAction > hex(0x10)
  Return
elif Equal CurrAction hex(0x33) && AnimFrame <= move_IASA
  Return
endif

#let localMaxYEdgeDist = var2
if CanJump && NumJumps > 0
  localMaxYEdgeDist = maxYEdgeDistWithJump
elif !(CanJump)
  localMaxYEdgeDist = maxYEdgeDistJumpNoUpB
else
  localMaxYEdgeDist = maxYEdgeDist
endif

if Equal OIsOnStage 0 && Equal approachType at_edgeguard && !(NoOpponent) && YDistBackEdge < localMaxYEdgeDist
  Call ApproachHub
endif

if Equal OIsOnStage 0 && nearCliffX <= maxXEdgeDist && nearCliffX >= -maxXEdgeDist && nearCliffY >= globTempVar && !(Equal movePart hex(0xFF)) && !(Equal approachType at_ledgeRefresh)
  movePart = 0
  Call EdgeguardHub
endif

// drift towards goal
globTempVar = nearCliffX * -1
ClearStick
AbsStick globTempVar

jumpingTimer -= 1
if jumpingTimer > 0
  Return
endif


LOGSTR str("NCY")
LOGVAL nearCliffY

#let diamondDist = var2
#let absNCX = var3
DIAMOND_DIST(diamondDist, nearCliffX, nearCliffY)

absNCX = nearCliffX
Abs absNCX
immediateTempVar = TopNY - BBoundary
if immediateTempVar < 10
  if NumJumps > 0
    Button X
  else 
    Stick 0 0.7
    Button B
  endif
elif nearCliffY > maxYEdgeDistJumpNoUpB && Rnd < 0.03 && Equal isBelowStage 0 && NumJumps > 0 && !(Equal movePart hex(0xFF))
  GetRndPointOnStage nearCliffX
  globTempVar = nearCliffX - TopNX
  AbsStick globTempVar
  Button X
  jumpingTimer = 30
  Return
elif nearCliffY < -maxYEdgeDistJumpNoUpB && Rnd < 0.03 && Equal isBelowStage 0 && NumJumps > 0 && !(Equal movePart hex(0xFF))
  GetRndPointOnStage nearCliffX
  globTempVar = nearCliffX - TopNX
  AbsStick globTempVar
  Button X
  jumpingTimer = 30
  Return
elif nearCliffY < -maxYEdgeDistWithJump && NumJumps > 0
  Button X
  jumpingTimer = 30
  Return
elif nearCliffY > -maxYEdgeDist && nearCliffY <= -calc(maxYEdgeDist - sweetSpotYRange)
  if diamondDist > 0 && NumJumps > 0
    GetRndPointOnStage nearCliffX
    globTempVar = nearCliffX - TopNX
    AbsStick globTempVar
    Button X
    jumpingTimer = 30
  elif Equal hasTriedToUpB 0 
    if YDistBackEdge < recoveryHeight
      Return
    endif
    ClearStick
    Stick 0 0.7
    Button B
    hasTriedToUpB = 1
  endif
  Return
endif
immediateTempVar = OTopNY + 30
if YDistBackEdge > 0 && Equal hasTriedToUpB 0 && TopNY < immediateTempVar && nearCliffY > -maxYEdgeDist && Equal OIsOnStage 0 && Equal isBelowStage 0 && XDistLE 10 && absNCX > 10 && diamondDist < 0
  ClearStick
  Stick 0 0.7
  Button B
  hasTriedToUpB = 1
  Return
endif
if diamondDist < 0 && Equal hasTriedToUpB 0 && Equal NumJumps 0
  if YDistBackEdge < recoveryHeight
    Return
  endif
  ClearStick
  Stick 0 0.7
  Button B
  hasTriedToUpB = 1
elif nearCliffY > -15 && Equal isBelowStage 0 && diamondDist < 0 && Equal hasTriedToUpB 0 && NumJumps > 0 && !(Equal movePart hex(0xFF))
  GetRndPointOnStage nearCliffX
  globTempVar = nearCliffX - TopNX
  AbsStick globTempVar
  Button X
  jumpingTimer = 30
endif
{ADDITIONAL_TRIGGERS}

Seek _main
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