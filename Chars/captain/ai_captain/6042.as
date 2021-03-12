// Knee

#include <Definition_AIMain.h>
//TrueID=0x6031
id 0x6031

//Set Unknown
unk 0x0

#let frameCounter = var3

if Equal movePart 0
  move_xOffset = fair_xOffset
  move_yOffset = fair_yOffset
  move_xRange = fair_xRange
  move_yRange = fair_yRange
  move_hitFrame = fair_hitFrame
  move_lastHitFrame = fair_lastHitFrame
  move_IASA = fair_IASA
  lastAttack = hex(0x6042)

  if Equal moveVariant mv_fair_weak
    move_hitFrame = fair_weak_hitFrame
    move_lastHitFrame = fair_weak_lastHitFrame
  endif

  if Equal approachType at_defend && OFramesHitstun < 1
    Call DefendHub
  else
    Call ApproachHub
  endif
elif True
  move_IASA = fair_IASA
  Stick 1 0
  Button A
  SetFrame 0
  hit_knockback = -1
  Seek executeAttack
endif
Return

label executeAttack
var1 = 0
CALC_TARGET_DISTANCES(var5, var6, var8, var0, var1, move_hitFrame - NumFrames, _oCalc, _sCalc)

#let isGoingOffstage = var0
GOING_OFFSTAGE(var0, var1, move_IASA - NumFrames)

if Equal AirGroundState 1 || FrameGE move_IASA
  Call AIHub
endif

RECORD_HIT_KNOCKBACK

ClearStick

if YSpeed <= 0 && Equal IsOnStage 1 && Equal shouldFastFall 1 && Equal isGoingOffstage 0
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
Seek executeAttack
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
