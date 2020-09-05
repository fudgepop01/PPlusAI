// EDGEGUARD HUB
// a place to figure out how to edgeguard the opponent
#include <Definition_AIMain.h>
id 0x8003

unk 0x0

LOGSTR str("called")

#const rw = 60
#const rh = 25
#let tempVar = var0
// risky - some macros use var5, but we aren't using any macros here so it should be fine
#let AbsOXDistFrontEdge = var5
#let nearCliffX = var1
#let nearCliffY = var2
#let egType = var3 // edgeguard type


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
if Equal OIsOnStage 1 || YSpeed < -0.15
  movePart = hex(0xFF)
  Call RecoveryHub
// elif OYDistFrontEdge > 0 && AbsOXDistFrontEdge < 3
endif

if OYDistFrontEdge > 0 && AbsOXDistFrontEdge > 30 && tempVar > 5
  egType = 1
else
  egType = Rnd * 3 + 1
endif
// egType = 2
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

if egType <= 1
  if !(Equal AirGroundState 3)
    if Equal IsOnStage 1
      // wavedash back to ledge?
      if tempVar < 10
        tempVar = nearCliffX * Direction
        if tempVar < 0
          Stick -1
          Return
        elif InAir && tempVar > 5
          Button R
          Stick -0.8 (-0.75)
        elif tempVar > 0 && !(Equal CurrAction hex(0x0A))
          Button X
        endif
      else
        tempVar = OPos*0.5
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
elif egType <= 3 && OYDistFrontEdge < 10
  if nearCliffX < rw && nearCliffX > -rw && nearCliffY > -rh
    if nearCliffY > 5 || Equal AirGroundState 1
      moveVariant = mv_edgeguard
      Call FAir
    elif YSpeed > 0.15 && nearCliffY > -5
      moveVariant = mv_edgeguard
      Call FAir
    elif nearCliffY > -5
      moveVariant = mv_edgeguard
      Call UAir
    endif
  else
    movePart = hex(0xFF)
    Call RecoveryHub
  endif
else
  if Equal AirGroundState 1 && Rnd < 0.2
    Button X
  endif
endif

if Damage < 130 && nearCliffY < -rh
  movePart = hex(0xFF)
  Call RecoveryHub
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