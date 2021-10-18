#include <Definition_AIMain.h>
id 0x850E
unk 0x0

XReciever
Cmd30

#let original_goalX = var0
original_goalX = goalX

$getMoveLocationParams()

if True
  immediateTempVar = OTopNX - TopNX
  globTempVar = OTopNY - TopNY
  Norm globTempVar immediateTempVar globTempVar

  globTempVar -= 15
  if globTempVar < 0
    globTempVar = 0
  endif
  globTempVar *= 0.1
endif
globTempVar += move_hitFrame

$ifAerialAttack()
  if Equal AirGroundState 1
    GetAttribute anotherTempVar attr_jumpSquatFrames 0
    globTempVar -= anotherTempVar - 1
  endif
endif
// globTempVar *= 0.5

anotherTempVar = globTempVar
if Equal OCurrAction hex(0x6) || Equal OCurrAction hex(0x7)
  anotherTempVar *= 0.35
elif Equal OPrevAction hex(0x6) || Equal OPrevAction hex(0x7)
  if Equal OCurrAction hex(0x3) && OAnimFrame < 4
    anotherTempVar *= 0.35
  endif
endif
if OAnimFrame < 2
  goalX = OTopNX + OTotalXSpeed * anotherTempVar
else
  EstOXCoord goalX anotherTempVar
  DrawDebugRectOutline goalX OTopNY 5 5 color(0xFFFF0088)
endif

$ifAerialAttack()
  anotherTempVar = globTempVar
  if Equal CurrAction hex(0x6) || Equal CurrAction hex(0x7)
    anotherTempVar *= 0.35
  elif Equal PrevAction hex(0x6) || Equal PrevAction hex(0x7)
    if Equal CurrAction hex(0x3) && AnimFrame < 4
      anotherTempVar *= 0.35
    endif
  endif
  if AnimFrame < 2
    anotherTempVar = TopNX + TotalXSpeed * anotherTempVar
  else
    EstXCoord anotherTempVar anotherTempVar
    DrawDebugRectOutline anotherTempVar TopNY 5 5 color(0x00FFFF88)
  endif
elif True
  anotherTempVar = TopNX
endif
// goalX -= OTopNX
// anotherTempVar -= TopNX
goalX -= anotherTempVar
anotherTempVar = move_xOffset + move_xRange

$ifAerialAttack()
  anotherTempVar *= Direction
else
  anotherTempVar *= OPos
endif

goalX -= anotherTempVar
goalX += TopNX

// TODO: under/overshoot

if OAnimFrame < 2
  goalY = OSCDBottom + OTotalYSpeed * globTempVar
else
  EstOYCoord goalY globTempVar
endif
if AnimFrame < 2
  anotherTempVar = TopNY + TotalYSpeed * globTempVar
else
  EstYCoord anotherTempVar globTempVar
endif
goalY -= anotherTempVar
goalY += TopNY



// if OYDistBackEdge < -30
//   goalY -= calc(pt_shortHopHeight - 3)
// endif

// globTempVar = TopNY + YDistBackEdge
// if SamePlane && goalY <= globTempVar && !(MeteoChance)
//   goalY = globTempVar
// endif

anotherTempVar = move_yOffset + move_yRange
goalY += anotherTempVar

// adjust for char height
// top of Opponent
immediateTempVar = OTopNY + OHurtboxSize
if goalY > immediateTempVar
  goalY -= OHurtboxSize
  goalY -= OHurtboxSize
elif goalY < OTopNY
  // nothing
else 
  globTempVar = immediateTempVar - goalY
  goalY -= globTempVar
  goalY -= globTempVar
endif

// adjust for char "width" 
#const charWidth = 3
immediateTempVar = OTopNX - charWidth
anotherTempVar = OTopNX + charWidth
if goalX > anotherTempVar
  goalX += charWidth
elif goalX < immediateTempVar
  goalX -= charWidth
else
  immediateTempVar = goalX - OTopNX
  if immediateTempVar < 0
    goalX += immediateTempVar
  else
    goalX -= immediateTempVar
  endif
endif

$ifAerialAttack()
  if goalY < pt_shortHopHeight && Equal AirGroundState 1 && !(Equal CurrAction hex(0xA)) && SamePlane
    goalY = pt_shortHopHeight
  endif
elif SamePlane && OYDistBackEdge < calc(pt_djumpHeight * -2) 
  if Equal OAirGroundState 2 && Rnd < 0.1
    Call MainHub
  endif
  goalY = TopNY + YDistBackEdge
endif

if OCurrAction >= hex(0x43) && OCurrAction <= hex(0x49)
elif OXDistBackEdge > -30 && OXDistFrontEdge < 30
elif True
  GetAttribute immediateTempVar attr_dashRunTermVel 0 
  if Equal currGoal cg_attack_overshoot
    immediateTempVar = OXSpeed * OPos
    if OCurrAction >= hex(0x2) && OCurrAction <= hex(0x19) && immediateTempVar > 0
    else
      immediateTempVar *= OPos * move_lastHitFrame * 0.4
      goalX += immediateTempVar
    endif
  elif Equal currGoal cg_attack_wall
    immediateTempVar *= OPos * move_lastHitFrame * 0.6
    goalX -= immediateTempVar
  elif Equal currGoal cg_attack_undershoot
    immediateTempVar *= OPos * move_lastHitFrame * 0.4
    goalX -= immediateTempVar
  endif 
endif

if Equal CurrAction hex(0xA) || Equal scriptVariant sv_attackgoal_justy
  goalX = original_goalX
endif

Cmd30
Return

$refreshMoves()
$generateAllMovesGotoLocONLY()
Return
Return