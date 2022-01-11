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
// updateOffset = (1 - (LevelValue / 100)) * 30 + 1
// MOD updateOffset AnimFrame updateOffset
updateOffset = 0

#let move_xOffset = var11
#let move_yOffset = var10
#let move_xRange = var9
#let move_yRange = var8
#let move_hitFrame = var8

GET_MOVE_DATA(globTempVar, move_xOffset, move_yOffset, move_xRange, move_yRange, move_hitFrame, globTempVar, globTempVar, globTempVar)

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
if OFramesHitstun > 0 && OFramesHitstun > move_hitFrame
  globTempVar = OFramesHitstun
endif

$ifAerialAttack()
  if Equal AirGroundState 1
    GetAttribute anotherTempVar attr_jumpSquatFrames 0
    globTempVar -= anotherTempVar - 1
  endif
endif
// globTempVar *= 0.5

anotherTempVar = globTempVar
// if Equal OCurrAction hex(0x6) || Equal OCurrAction hex(0x7)
//   anotherTempVar *= 0.35
// elif Equal OPrevAction hex(0x6) || Equal OPrevAction hex(0x7)
//   if Equal OCurrAction hex(0x3) && OAnimFrame < 4
//     anotherTempVar *= 0.35
//   endif
// endif
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
  // if Equal CurrAction hex(0x6) || Equal CurrAction hex(0x7)
  //   anotherTempVar *= 0.35
  // elif Equal PrevAction hex(0x6) || Equal PrevAction hex(0x7)
  //   if Equal CurrAction hex(0x3) && AnimFrame < 4
  //     anotherTempVar *= 0.35
  //   endif
  // endif
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

  $genLastAttackDirAerials(immediateTempVar)

  if Equal immediateTempVar -1
    anotherTempVar *= -1
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
  goalY = OSCDBottom + OTotalYSpeed * globTempVar - OGravity * OGravity * globTempVar
else
  EstOYCoord goalY globTempVar
endif
immediateTempVar = OTopNY - goalY
if immediateTempVar > OYDistFloor
  goalY = OTopNY - OYDistFloor
endif
if Equal OCurrAction hex(0x54)
  goalY = OTopNY
endif
if Equal scriptVariant sv_attackgoal_self
  globTempVar -= 1
  globTempVar += updateOffset
endif

{SELF_Y_ADJUST}
goalY += TopNY

// if OYDistBackEdge < -30
//   goalY -= calc(cs_shortHopHeight - 3)
// endif

// globTempVar = TopNY + YDistBackEdge
// if SamePlane && goalY <= globTempVar && !(MeteoChance)
//   goalY = globTempVar
// endif

anotherTempVar = (move_yOffset * -1) + move_yRange
goalY -= anotherTempVar

// anotherTempVar = OHurtboxSize * 0.5
// tempYRange += anotherTempVar
// anotherTempVar = OWidth * 0.5
// tempXRange += anotherTempVar

// anotherTempVar = Width * 0.5
// tempGoalX -= anotherTempVar
// anotherTempVar = HurtboxSize * 0.5
// tempGoalY += anotherTempVar

// anotherTempVar = OTopNX - OCenterX
// anotherTempVar *= 1
// tempGoalX -= anotherTempVar

// anotherTempVar = OTopNY - OTopNY
// anotherTempVar *= 1
// tempGoalY += anotherTempVar

$ifAerialAttack()
  immediateTempVar = (TopNY - YDistFloor) + cs_shortHopHeight
  if goalY < immediateTempVar && Equal AirGroundState 1 && !(Equal CurrAction hex(0xA)) && SamePlane && OYDistFloor < move_yRange
    goalY = TopNY + cs_shortHopHeight
  endif

  if SamePlane && OYDistFloor < move_yRange && Equal AirGroundState 1 && !(Equal CurrAction hex(0xA))
    goalY = TopNY + cs_shortHopHeight
  endif

  // if Equal AirGroundState 1
  //   goalY = TopNY + cs_shortHopHeight * 4
  // endif
endif
GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
globTempVar = OTopNY - TopNY
if Equal immediateTempVar 1
elif globTempVar > 30 || OYDistBackEdge < -35
elif !(Equal currGoal cg_attack_reversal) && !(Equal currGoal cg_edgeguard) && OYDistFloor < 30
  predictAverage immediateTempVar man_OXHitDist LevelValue
  if immediateTempVar < 7
    immediateTempVar = 7
  endif
  if Equal currGoal cg_attack_overshoot
    if OXDistBackEdge > -20 && OXDistFrontEdge < 20
      globTempVar = OXSpeed * OPos
      if OCurrAction >= hex(0x2) && OCurrAction <= hex(0x19) && globTempVar > 0
      else
        immediateTempVar *= OPos * 2
        goalX += immediateTempVar
      endif
    endif
  elif Equal currGoal cg_attack_wall
    immediateTempVar *= OPos * 3
    goalX -= immediateTempVar
  elif Equal currGoal cg_attack_undershoot
    immediateTempVar *= OPos * 2
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
Return