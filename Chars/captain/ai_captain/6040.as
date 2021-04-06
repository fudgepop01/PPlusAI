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
    $generateDefinedVariants(NAir)
  elif CalledAs FAir
    $generateDefinedVariants(FAir)
  elif CalledAs BAir
    $generateDefinedVariants(BAir)
  elif CalledAs UAir
    $generateDefinedVariants(UAir)
  elif CalledAs DAir
    $generateDefinedVariants(DAir)
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
Cmd30
var1 = 0
CALC_TARGET_DISTANCES(var5, var6, var8, var0, var1, move_lastHitFrame, _oCalc, _sCalc)

#let isGoingOffstage = var0
GOING_OFFSTAGE(var0, var1, move_IASA - frameCounter)

if Equal AirGroundState 1 || frameCounter >= move_IASA
  Call AIHub
endif

RECORD_HIT_KNOCKBACK

ClearStick

if YSpeed <= 0 && Equal IsOnStage 1 && Equal shouldFastFall 1 && Equal isGoingOffstage 0
  LOGSTR str("should_FF")
  Stick 0 (-1)
else
  Stick 0 0.5
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
if YSpeed < 0 && YDistBackEdge > -10 && YDistBackEdge <= 0 && Equal IsOnStage 1 && frameCounter > move_lastHitFrame
  globTempVar = move_xRange * 2
  if targetXDistance <= globTempVar && Equal hit_knockback (-1)
    Return
  elif !(Equal isGoingOffstage 0)
    Return
  endif
  var19 = 2
  var18 = 1
  Call Landing
endif
Return
Return