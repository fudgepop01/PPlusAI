// EDGEGUARD HUB
// a place to figure out how to edgeguard the opponent
#include <Definition_AIMain.h>
id 0x8003

unk 0x0

// LOGSTR str("called")

#const rw = 50
#const rh = 25
#let tempVar = var0
// risky - some macros use var5, but we aren't using any macros here so it should be fine
#let AbsOXDistFrontEdge = var5
#let nearCliffX = var1
#let nearCliffY = var2
#let egType = var3 // edgeguard type

// I don't know why this is necessary but I hate the fact that
// it is with a burning passion
if Equal CurrAction hex(0x114)
  Call RecoveryHub
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
elif LevelValue <= LV5
  movePart = hex(0xFF)
  Call RecoveryHub
endif

if OYDistFrontEdge > 0 && AbsOXDistFrontEdge > 30 && tempVar > 5
  egType = 1
else
  egType = Rnd * 8
  if Equal IsOnStage 0
    egType += 1
  endif
endif
// egType = 1
LOGSTR str("eg type")
LOGVAL egType
label
SetVec nearCliffX Zero
GetNearestCliff nearCliffX

DrawDebugRectOutline nearCliffX nearCliffY rw rh color(0xff000088)
nearCliffX = TopNX - nearCliffX
nearCliffX *= -1
nearCliffY = nearCliffY - TopNY * -1

tempVar = nearCliffX
Abs tempVar
AbsOXDistFrontEdge = OXDistFrontEdge
Abs AbsOXDistFrontEdge

// LOGSTR str("egType")
// LOGVAL egType

if Damage < 130 && nearCliffY < -rh
  movePart = hex(0xFF)
  Call RecoveryHub
endif

if Equal OAirGroundState 3 && LevelValue >= LV7
  movePart = 0
  moveVariant = mv_edgeguard
  Call DAir
endif

if egType <= 1 && LevelValue >= LV6 && NoOneHanging
  LOGSTR str("<= 1")
  if !(Equal AirGroundState 3)
    if Equal IsOnStage 1
      // wavedash back to ledge?
      if tempVar < 10
        tempVar = nearCliffX * Direction
        LOGSTR str("tVar")
        LOGVAL tempVar
        if tempVar < -5
          Stick -1
          Return
        elif InAir && tempVar > 2 && Equal IsOnStage 1
          Button R
          Stick -0.6 (-0.75)
        elif tempVar > 0 && !(Equal CurrAction hex(0x0A))
          LOGSTR str("jumping??")
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
  elif AbsOXDistFrontEdge < 10 && OYDistFrontEdge < 10
    Button R
    Call AIHub
  endif
  Return
elif egType <= 5 && OYDistFrontEdge < 30 && LevelValue >= LV5
  if nearCliffX < rw && nearCliffX > -rw && nearCliffY > -rh
    movePart = 0
    if Equal AirGroundState 1
      moveVariant = mv_edgeguard
      Call FAir
    elif OTopNY > TopNY
      moveVariant = mv_edgeguard
      Call UAir
    elif YSpeed > 0.15
      moveVariant = mv_edgeguard
      Call FAir
    else
      moveVariant = mv_edgeguard
      Call UAir
    endif
  else
    movePart = hex(0xFF)
    Call RecoveryHub
  endif
  Return
else
  LOGSTR str("else")
  if !(MeteoChance)
    Call AIHub
  endif
  if Equal AirGroundState 1 && Idling
    egType = Rnd * 3

    Button X
    moveVariant = mv_edgeguard
    movePart = 0
    tempVar = OTopNY - TopNY
    LOGSTR str("tvar")
    LOGVAL tempVar
    if tempVar > 30 && tempVar < 120 && !(XDistLE 30)
      Call FAir
    if tempVar > 40 && tempVar < 120
      Call UAir
    elif tempVar < 20
      Call DAir
    else
      Call NAir
    endif
    Return
  endif
endif
Return

label performEdgeguard1
moveVariant = mv_edgeguard
if Equal AirGroundState 1
  Call FAir
else
  Call UAir
endif
Return
Return