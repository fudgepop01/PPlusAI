#include <Definition_AIMain.h>
id 0x850E
unk 0x0

XReciever
Cmd30

#let original_goalX = var0
#let original_goalY = var1
original_goalX = goalX
original_goalY = goalY

#let updateOffset = var2
updateOffset = (1 - (LevelValue / 100)) * 30 + 1
MOD updateOffset AnimFrame updateOffset

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
if Equal scriptVariant sv_attackgoal_self
  anotherTempVar -= updateOffset
  anotherTempVar += 1
endif
if OAnimFrame < 2
  goalX = OTopNX + OTotalXSpeed * anotherTempVar
else
  EstOXCoord goalX anotherTempVar
  DrawDebugRectOutline goalX OTopNY 5 5 color(0xFFFF0088)
endif
// goalX = OTopNX

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
  $ifLastOrigin(nspecialair,false)
    anotherTempVar *= OPos
  $ifLastOrigin(dspecialair,true)
    anotherTempVar *= OPos
  $ifLastOrigin(uspecialair,true)
    anotherTempVar *= OPos
  $ifLastOrigin(sspecialair,true)
    anotherTempVar *= OPos
  else
    anotherTempVar *= Direction
  endif
else
  anotherTempVar *= OPos
endif

goalX -= anotherTempVar
goalX += TopNX

// TODO: under/overshoot
if Equal scriptVariant sv_attackgoal_self
  globTempVar -= updateOffset
  globTempVar += 1
endif
if OAnimFrame < 2 && !(Equal OYSpeed 0)
  goalY = OSCDBottom + OTotalYSpeed * globTempVar
else
  EstOYCoord goalY globTempVar
endif
if Equal OCurrAction hex(0x54)
  goalY = OTopNY
endif
if Equal scriptVariant sv_attackgoal_self
  globTempVar -= 1
  globTempVar += updateOffset
endif

if AnimFrame < 2
  if TotalYSpeed > 0
    anotherTempVar = TopNY + TotalYSpeed * globTempVar - Gravity * globTempVar
  else
    anotherTempVar = TopNY + TotalYSpeed * globTempVar
  endif
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

anotherTempVar = (move_yOffset * -1) + move_yRange
goalY -= anotherTempVar

$ifAerialAttack()
  if goalY < pt_shortHopHeight && Equal AirGroundState 1 && !(Equal CurrAction hex(0xA)) && SamePlane && OYDistBackEdge >= -30
    goalY = TopNY + pt_shortHopHeight
  endif

  if SamePlane && OYDistBackEdge >= -30 && Equal AirGroundState 1 && !(Equal CurrAction hex(0xA))
    goalY = TopNY + pt_shortHopHeight
  endif

  // if Equal AirGroundState 1
  //   goalY = TopNY + pt_shortHopHeight * 4
  // endif
elif SamePlane
  goalY = TopNY + YDistBackEdge
endif

globTempVar = OTopNY - TopNY
if globTempVar > 30 || OYDistBackEdge < -35
elif OCurrAction >= hex(0x42) && OCurrAction <= hex(0x59)
elif Equal HitboxConnected 1 || Equal PrevAction hex(0x3C)
elif !(Equal currGoal cg_attack_reversal) && OYDistFloor < 30
  GetAttribute immediateTempVar attr_dashRunTermVel 1
  if Equal currGoal cg_attack_overshoot
    if OXDistBackEdge > -20 && OXDistFrontEdge < 20
      globTempVar = OXSpeed * OPos
      if OCurrAction >= hex(0x2) && OCurrAction <= hex(0x19) && globTempVar > 0
      else
        immediateTempVar *= OPos * move_lastHitFrame * 0.7
        goalX += immediateTempVar
      endif
    endif
  elif Equal currGoal cg_attack_wall
    immediateTempVar *= OPos * move_lastHitFrame * 0.9
    goalX -= immediateTempVar
  elif Equal currGoal cg_attack_undershoot
    immediateTempVar *= OPos * move_lastHitFrame * 0.6
    goalX -= immediateTempVar
  endif 
endif

if Equal CurrAction hex(0xA) || Equal scriptVariant sv_attackgoal_justy
  goalX = original_goalX
elif Equal scriptVariant sv_attackgoal_justx
  goalY = original_goalY
endif

Cmd30
Return

$refreshMoves()
$generateAllMovesGotoLocONLY()
Return
Return