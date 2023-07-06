#include <Definition_AIMain.h>
//TrueID=0x6040
id 0x6040

//Set Unknown
unk 0x00000

//Strings

#let frameCounter = var3

// sets up offsets to get to target position
if Equal movePart 0
  if CalledAs NAir
    lastAttack = hex(0x6041)
    move_xOffset = nair_xOffset
    move_yOffset = nair_yOffset
    move_xRange = nair_xRange
    move_yRange = nair_yRange
    move_hitFrame = nair_hitFrame
    move_lastHitFrame = nair_lastHitFrame
    move_IASA = nair_IASA

    if Equal moveVariant mv_nair_mid
      move_hitFrame = nair_mid_hitFrame
      move_lastHitFrame = nair_mid_lastHitFrame
    elif Equal moveVariant mv_nair_weak
      move_hitFrame = nair_weak_hitFrame
      move_lastHitFrame = nair_weak_lastHitFrame
    endif
  elif CalledAs FAir
    lastAttack = hex(0x6042)
    move_xOffset = fair_xOffset
    move_yOffset = fair_yOffset
    move_xRange = fair_xRange
    move_yRange = fair_yRange
    move_hitFrame = fair_hitFrame
    move_lastHitFrame = fair_lastHitFrame
    move_IASA = fair_IASA
  elif CalledAs BAir
    lastAttack = hex(0x6043)
    move_xOffset = bair_xOffset
    move_yOffset = bair_yOffset
    move_xRange = bair_xRange
    move_yRange = bair_yRange
    move_hitFrame = bair_hitFrame
    move_lastHitFrame = bair_lastHitFrame
    move_IASA = bair_IASA
  elif CalledAs UAir
    lastAttack = hex(0x6044)
    move_xOffset = uair_xOffset
    move_yOffset = uair_yOffset
    move_xRange = uair_xRange
    move_yRange = uair_yRange
    move_hitFrame = uair_hitFrame
    move_lastHitFrame = uair_lastHitFrame
    move_IASA = uair_IASA
  elif CalledAs DAir
    lastAttack = hex(0x6045)
    move_xOffset = dair_xOffset
    move_yOffset = dair_yOffset
    move_xRange = dair_xRange
    move_yRange = dair_yRange
    move_hitFrame = dair_hitFrame
    move_lastHitFrame = dair_lastHitFrame
    move_IASA = dair_IASA
  else
    Call AIHub
  endif
  if Equal approachType at_defend && OFramesHitstun < 1
    Call DefendHub
  else
    Call ApproachHub
  endif
elif Equal AirGroundState 2 && Equal movePart 1
  ClearStick
  move_IASA = nair_IASA
  if CalledAs FAir
    move_IASA = fair_IASA
    Stick (0.5) 0
  elif CalledAs BAir
    move_IASA = bair_IASA
    Stick (-0.5) 0
  elif CalledAs UAir
    move_IASA = uair_IASA
    Stick 0 (0.5)
  elif CalledAs DAir
    move_IASA = dair_IASA
    Stick 0 (-0.5)
  endif
  Button A
  frameCounter = 0
  hit_knockback = -1
  Seek ExecuteAttack
else
  Call AIHub
endif
Return

label ExecuteAttack
var1 = 0
CALC_TARGET_DISTANCES(var5, var6, var0, var1, move_hitFrame - NumFrames, _oCalc, _sCalc)

#let isGoingOffstage = var0
GOING_OFFSTAGE(var0, var1, move_IASA - NumFrames)

if Equal AirGroundState 1 || frameCounter >= move_IASA || Equal HitboxConnected 1
  if CalledAs DAir
    if frameCounter >= 11
      Call AIHub
    endif
  else
    Call AIHub
  endif
endif

RECORD_HIT_KNOCKBACK

ClearStick

if YSpeed <= 0 && Equal IsOnStage 1 && Equal shouldFastFall 1 && Equal isGoingOffstage 0
  Stick 0 (-1)
endif

if !(Equal isGoingOffstage 0) && !(Equal isGoingOffstage 2)
  AbsStick isGoingOffstage
elif True
  if targetXDistance < 0
    AbsStick -1 0
  else
    AbsStick 1 0
  endif
endif

Abs targetXDistance
Abs targetYDistance
Seek ExecuteAttack
frameCounter += 1
if YSpeed < 0 && YDistBackEdge > -10 && YDistBackEdge <= 0 && Equal IsOnStage 1
  var19 = 2
  var18 = 1
  if targetXDistance <= move_xRange && targetYDistance <= move_yRange && Equal hit_knockback hex(0xFFFFFF)
    Return
  elif !(Equal isGoingOffstage 0)
    Return
  endif
  Call Landing
endif
Return
Return