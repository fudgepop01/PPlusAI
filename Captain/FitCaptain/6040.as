#include <Definition_AIMain.h>
//TrueID=0x6040
id 0x6040

//Set Unknown
unk 0x00000

//Strings

// sets up offsets to get to target position
if Equal movePart 0
  if CalledAs NAir
    lastAttack = hex(0x6041)
    move_xOffset = nair_xOffset
    move_yOffset = nair_yOffset
    move_xRange = nair_xRange
    move_yRange = nair_yRange
    move_hitFrame = nair_hitFrame
    move_length = nair_length

    if Equal moveVariant mv_approachingNair
      move_xOffset = app_nair_xOffset
      move_yOffset = app_nair_yOffset
      move_xRange = app_nair_xRange
      move_hitFrame = app_nair_hitFrame
    elif Equal moveVariant mv_nairHit2
      move_hitFrame = nairHit2_hitFrame
      move_length = nairHit2_length
    endif
  elif CalledAs FAir
    lastAttack = hex(0x6042)
    move_xOffset = fair_xOffset
    move_yOffset = fair_yOffset
    move_xRange = fair_xRange
    move_yRange = fair_yRange
    move_hitFrame = fair_hitFrame
    move_length = fair_length
  elif CalledAs BAir
    lastAttack = hex(0x6043)
    move_xOffset = bair_xOffset
    move_yOffset = bair_yOffset
    move_xRange = bair_xRange
    move_yRange = bair_yRange
    move_hitFrame = bair_hitFrame
    move_length = bair_length
  elif CalledAs UAir
    lastAttack = hex(0x6044)
    move_xOffset = uair_xOffset
    move_yOffset = uair_yOffset
    move_xRange = uair_xRange
    move_yRange = uair_yRange
    move_hitFrame = uair_hitFrame
    move_length = uair_length
  elif CalledAs DAir
    lastAttack = hex(0x6045)
    move_xOffset = dair_xOffset
    move_yOffset = dair_yOffset
    move_xRange = dair_xRange
    move_yRange = dair_yRange
    move_hitFrame = dair_hitFrame
    move_length = dair_length
  else
    Call AIHub
  endif
  SAFE_INJECT_3 move_yOffset
  SAFE_INJECT_4 move_yRange
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
  SetFrame 0
  move_knockback = -1
  Seek ExecuteAttack
else
  Call AIHub
endif
Return

label ExecuteAttack
CALC_TARGET_DISTANCES(var5, var6, var0, var1, move_hitFrame, _oCalc, _sCalc)

if Equal AirGroundState 1 || Equal IsOnStage 0 || FrameGE move_IASA
  Call AIHub
endif

RECORD_MOVE_KNOCKBACK

if targetXDistance < 0
  AbsStick (-1)
else
  AbsStick 1
endif

Abs targetXDistance
Abs targetYDistance
#let isGoingOffstage = var0
GOING_OFFSTAGE(var0, var1, 10)
if YSpeed < 0 && YDistBackEdge > -10 && YDistBackEdge <= 0 && Equal IsOnStage 1
  var19 = 2
  var18 = 1
  if targetXDistance <= move_xRange && targetYDistance <= move_yRange && Equal move_knockback hex(0xFFFFFF)
    Return
  elif !(Equal isGoingOffstage 0)
    Return
  endif
  Call Landing
endif
Return
Return