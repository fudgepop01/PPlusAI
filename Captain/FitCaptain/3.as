// EDGEGUARD HUB
// a place to figure out how to edgeguard the opponent
#include <Definition_AIMain.h>
id 0x8003

unk 0x0

// LOGSTR str("called")

if FramesHitstun > 0
  Return
endif

#const rw = 50
#const rh = 25
#let tempVar = var0
#let AbsOXDistFrontEdge = var4
#let nearCliffX = var1
#let nearCliffY = var2
#let egType = var3 // edgeguard type

// I don't know why this is necessary but I hate the fact that
// it is with a burning passion
if Equal CurrAction hex(0x114)
  Call RecoveryHub
endif

if Equal lastScript hex(0x8001) && XDistLE 20 && OYDistBackEdge < 0 && Equal movePart 0 && OFramesHitstun > 0
  approachType = at_edgeguard
  Call ApproachHub
endif

SetVec nearCliffX Zero
GetNearestCliff nearCliffX

nearCliffX = TopNX - nearCliffX
nearCliffX *= -1
nearCliffY = nearCliffY - TopNY * -1

tempVar = nearCliffX
Abs tempVar
AbsOXDistFrontEdge = OXDistFrontEdge
Abs AbsOXDistFrontEdge

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

if OYDistFrontEdge > -10 && AbsOXDistFrontEdge > 45 && tempVar > 5
  egType = 1
else
  egType = Rnd * 9
  if Equal IsOnStage 0
    egType += 1
  endif
  if Damage < 60 && egType > 7
    egType = 7
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

// LOGSTR str("egType")
// LOGVAL egType

if Damage < 130 && nearCliffY < -rh
  movePart = hex(0xFF)
  approachType = at_edgeguard
  Call RecoveryHub
endif

if AbsOXDistFrontEdge < 20 && OYDistFrontEdge > -10 && LevelValue >= LV7
  movePart = 0
  approachType = at_edgeguard
  if !(Equal OPos Direction)
    Call BAir
  else
    Call DAir
  endif
endif

// #let OConsecutiveLedgeGrabs = var5
// GetLaBasic tempVar hex(0x4F) 1
if egType <= 3 && LevelValue >= LV6 && NoOneHanging && AbsOXDistFrontEdge > 10
  Goto WDBackGrabLedge
  Return
elif Equal IsOnStage 1 && egType <= 7 && OYDistBackEdge > 30
  movePart = 0
  approachType = at_edgeguard
  if OYDistBackEdge < 0
    Call UTilt
  elif Rnd < 0.3
    Call DTilt
  elif Rnd < 0.2
    Call UTilt
  else
    Call FSmash
  endif
elif egType <= 9 && OYDistFrontEdge < -30 && LevelValue >= LV5 && AbsOXDistFrontEdge > 5
  if nearCliffX < rw && nearCliffX > -rw && nearCliffY > -rh
    movePart = 0
    if Equal AirGroundState 1
      approachType = at_edgeguard
      Call FAir
    elif !(Equal OPos Direction)
      approachType = at_edgeguard
      Call BAir
    elif OTopNY > TopNY
      approachType = at_edgeguard
      Call UAir
    elif YSpeed > 0.15
      approachType = at_edgeguard
      Call FAir
    else
      approachType = at_edgeguard
      Call UAir
    endif
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

    Button X
    approachType = at_edgeguard
    movePart = 0
    tempVar = OTopNY - TopNY
    if tempVar > 30 && tempVar < 120 && !(XDistLE 30)
      Call FAir
    elif tempVar > 40 && tempVar < 120
      Call UAir
    else
      Call UAir
    endif
    Return
  endif
endif
Return

label WDBackGrabLedge
if !(Equal AirGroundState 3)
  if Equal IsOnStage 1 && !(Equal DistBackEdge DistFrontEdge)
    // wavedash back to ledge?
    if tempVar < 15
      tempVar = nearCliffX * Direction
      // LOGSTR str("ncx * dir")
      // LOGVAL tempVar
      if tempVar < -5
        Stick -1
        Return
      elif InAir && tempVar > 2.5 && Equal IsOnStage 1
        Button R
        tempVar *= -0.1
        Stick tempVar (-0.75)
      elif tempVar > 0 && !(Equal CurrAction hex(0x0A)) && Equal IsOnStage 1
        Button X
      endif
    else
      tempVar = OPos*0.8
      AbsStick tempVar
    endif
  elif tempVar > 3
    movePart = hex(0xFF)
    Call RecoveryHub
  endif
// elif AbsOXDistFrontEdge < 10 && OYDistFrontEdge < 10
//   Button R
//   Call AIHub
endif
Return
Return