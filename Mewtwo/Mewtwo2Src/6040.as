#include <Definition_AIMain.h>
//TrueID=0x6040
id 0x6040

//Set Unknown
unk 0x00000

//Strings

// control float
if Equal CurrAction hex(0x120)
  Button X
endif

#let frameCounter = var3

// sets up offsets to get to target position
if Equal movePart 0
  if CalledAs NAir
    LOAD_MOVE_DATA(valNAir, nair)
    if Equal moveVariant mv_hc
      move_lastHitFrame = nair_hc_lastHitFrame
    endif
  elif CalledAs FAir
    LOAD_MOVE_DATA(valFAir, fair)
  elif CalledAs BAir
    LOAD_MOVE_DATA(valBAir, bair)
  elif CalledAs UAir
    LOAD_MOVE_DATA(valUAir, uair)
  elif CalledAs DAir
    LOAD_MOVE_DATA(valDAir, dair)
  else
    Call AIHub
  endif
  if Equal approachType at_defend && OFramesHitstun < 1
    Call DefendHub
  elif Equal approachType at_hover
    Call ChrSpecific2
  elif True
    #let isOffstageAtOffset = var0
    OFFSTAGE_OFFSET(var0, var1, 50 * OPos)
    if Equal isOffstageAtOffset 0 && !(ODistLE 40) && ODistLE 70 && CanJump && !(Equal XDistBackEdge XDistFrontEdge) && Equal IsOnStage 1
      Call ChrSpecific4
    else 
      Call ApproachHub
    endif
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

if Equal AirGroundState 1 || frameCounter >= move_IASA
  Call AIHub
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

Seek ExecuteAttack
frameCounter += 1

// control float
if Equal CurrAction hex(0x120)
  Button X
  AbsStick targetXDistance targetYDistance
  if YDistBackEdge > -5 && Equal IsOnStage 1 && targetYDistance < 0
    ClearStick 1
  endif
  if YDistBackEdge > -10
    if CalledAs NAir && Equal moveVariant mv_hc && frameCounter <= 25
      AbsStick targetXDistance (-1)
    elif CalledAs FAir && frameCounter <= 9
      AbsStick targetXDistance (-1)
    elif CalledAs BAir && frameCounter <= 12
      AbsStick targetXDistance (-1)
    elif CalledAs UAir && frameCounter <= 13
      AbsStick targetXDistance (-1)
    elif CalledAs DAir && frameCounter <= 20
      AbsStick targetXDistance (-1)
    endif
  endif
  Return
endif

Abs targetXDistance
Abs targetYDistance
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