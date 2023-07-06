// EDGEGUARD HUB
// a place to figure out how to edgeguard the opponent
#include <Definition_AIMain.h>
id 0x8003

unk 0x0

// LOGSTR str("called")
SetDisabledMd 4

if Equal lastScript hex(0x1120)
  Call ComboHub
elif FramesHitstun > 0
  Call AIHub
  Return
endif

{EDGEGUARD_RADIUS}
#let tempVar = var0
#let AbsOXDistFrontEdge = var4
#let EstOYDistFrontEdge = var5
#let nearCliffX = var1
#let nearCliffY = var2
#let egType = var3 // edgeguard type

// I don't know why this is necessary but I hate the fact that
// it is with a burning passion
if Equal CurrAction hex(0x114)
  Call RecoveryHub
endif

globTempVar = OTotalXSpeed
Abs globTempVar
if Equal lastScript hex(0x8001) && XDistLE 30 && EstOYDistFrontEdge < 10 && Equal movePart 0 && OFramesHitstun > 0 && globTempVar < 4
  // approachType = at_edgeguard
  Call ApproachHub
// elif Equal lastScript hex(0x8001) && Equal movePart 0
//   Call ApproachHub
endif

lastScript = hex(0x8003)

SetVec nearCliffX Zero
GetNearestCliff nearCliffX

nearCliffX = TopNX - nearCliffX
nearCliffX *= -1
nearCliffY = nearCliffY - TopNY * -1

tempVar = nearCliffX
Abs tempVar
AbsOXDistFrontEdge = OXDistFrontEdge
Abs AbsOXDistFrontEdge
globTempVar = OFramesHitstun / 60
EstOYCoord EstOYDistFrontEdge globTempVar
EstOYDistFrontEdge = nearCliffY - EstOYDistFrontEdge

// if it's not worth going for an edgeguard, don't bother
if Equal OIsOnStage 1
  movePart = hex(0xFF)
  Call RecoveryHub
elif Equal IsOnStage 0 && YSpeed < 0.15 && YDistFrontEdge > 50 && !(Equal CurrAction hex(0x79))
  movePart = hex(0xFF)
  Call RecoveryHub
elif Equal IsOnStage 0 && YSpeed < 0.15 && YDistFrontEdge < -50 && !(Equal CurrAction hex(0x79))
  movePart = hex(0xFF)
  Call RecoveryHub
elif LevelValue <= LV5
  movePart = hex(0xFF)
  Call RecoveryHub
endif

if EstOYDistFrontEdge > -10 && AbsOXDistFrontEdge > 45 && tempVar > 5
  egType = 1
else
  egType = Rnd * 9
  if Equal IsOnStage 0
    egType += 1
  endif
endif
// SAFE_INJECT_2 egType
// LOGVAL egType
label
if YDistBackEdge >= 50
  Call RecoveryHub
endif

SetVec nearCliffX Zero
GetNearestCliff nearCliffX

// DrawDebugRectOutline nearCliffX nearCliffY rw rh color(0xff000088)
nearCliffX = TopNX - nearCliffX
nearCliffX *= -1
nearCliffY *= -1
nearCliffY = nearCliffY + TopNY * -1

tempVar = nearCliffX
Abs tempVar
AbsOXDistFrontEdge = OXDistFrontEdge
Abs AbsOXDistFrontEdge

LOGSTR str("egType")
LOGVAL egType

if Damage < 130 && nearCliffY < -rh
  movePart = hex(0xFF)
  approachType = at_edgeguard
  Call RecoveryHub
endif

if AbsOXDistFrontEdge < 20 && EstOYDistFrontEdge > -10 && LevelValue >= LV7
  movePart = 0
  approachType = at_edgeguard
  if !(Equal OPos Direction)
    {BACKWARD_MOVES}
    Call BAir
  else
    {FORWARD_MOVES}
    Call DAir
  endif
endif

// #let OConsecutiveLedgeGrabs = var5
// GetLaBasic tempVar hex(0x4F) 1
if egType <= 3 && LevelValue >= LV6 && NoOneHanging && AbsOXDistFrontEdge > 10
  movePart = hex(0xFF)
  Goto WDBackGrabLedge
  Return
elif Equal IsOnStage 1 && egType <= 7
  movePart = 0
  approachType = at_edgeguard
  {STAY_MOVES}
elif egType <= 9 && EstOYDistFrontEdge < -30 && LevelValue >= LV5 && AbsOXDistFrontEdge > 5
  if nearCliffX < rw && nearCliffX > -rw && nearCliffY > -rh
    movePart = 0
    approachType = at_edgeguard
    {O_ABOVE_MOVES}
  else
    movePart = hex(0xFF)
    Call RecoveryHub
  endif
  Return
elif True
  if !(MeteoChance)
    Call AIHub
  endif
  if Equal AirGroundState 1 && Idling
    egType = Rnd * 3

    {DEFAULT_MOVES}
    Return
  endif
endif
Return

label WDBackGrabLedge
if !(Equal AirGroundState 3)
  if Equal IsOnStage 1 && !(Equal DistBackEdge DistFrontEdge)
    // wavedash back to ledge?
    immediateTempVar = XSpeed
    Abs immediateTempVar
    immediateTempVar = 20 + immediateTempVar 
    if tempVar < immediateTempVar
      tempVar = nearCliffX * Direction
      LOGSTR str("ncx * dir")
      LOGVAL tempVar
      if tempVar < -10
        Stick -1
        Return
      elif tempVar < 5
        Stick 1
        Return
      elif YDistBackEdge > -1 && InAir && tempVar > 5 && Equal IsOnStage 1
        Button R
        tempVar *= -groundFric
        if tempVar > -0.3
          tempVar = -0.3
        endif
        Stick tempVar (-0.75)
      elif tempVar > 0 && !(Equal CurrAction hex(0x0A)) && Equal IsOnStage 1
        if CurrAction >= hex(0x16) && CurrAction <= hex(0x19)
        else
          Button X
        endif
      endif
    else
      AbsStick OPos
      if Equal CurrAction hex(0x1)
        ClearStick
      endif
    endif
  elif Equal IsFastfalling 1
    Stick 1
  else
    Stick 1 (-1)
  endif
endif
Return
Return