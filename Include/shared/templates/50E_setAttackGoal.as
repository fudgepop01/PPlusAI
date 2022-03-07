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
#let move_hitFrame = var7

GET_MOVE_DATA(globTempVar, move_xOffset, move_yOffset, move_xRange, move_yRange, move_hitFrame, globTempVar, globTempVar, globTempVar, globTempVar, globTempVar, globTempVar)

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
// if OFramesHitstun > 0 && OFramesHitstun > move_hitFrame
//   globTempVar = OFramesHitstun
// endif

$ifAerialAttack()
  if Equal AirGroundState 1
    GetAttribute anotherTempVar attr_jumpSquatFrames 0
    globTempVar += anotherTempVar
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
// if OAnimFrame <= 3
  goalX = OTopNX + OTotalXSpeed * anotherTempVar
  DrawDebugRectOutline goalX OTopNY 5 5 color(0xFFFF0088)
// endif
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
  // if AnimFrame <= 3
    anotherTempVar = TopNX //+ TotalXSpeed * anotherTempVar
    DrawDebugRectOutline anotherTempVar TopNY 5 5 color(0x00FFFF88)
  // endif
  // anotherTempVar *= -1
elif True
  anotherTempVar = TopNX
endif
// goalX += OTopNX
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

anotherTempVar *= 0.5
goalX -= anotherTempVar
goalX += TopNX

if Equal scriptVariant sv_attackgoal_self
  globTempVar -= updateOffset
  globTempVar += 1
endif
// CalcYChange goalY globTempVar OTotalYSpeed OGravity OMaxFallSpeed OFastFallSpeed 0
// goalY *= -1
// goalY += OSCDBottom
if OAnimFrame <= 3 && !(Equal OYSpeed 0)
  if OTotalYSpeed > 0
    goalY = OSCDBottom + OTotalYSpeed * globTempVar - OGravity * globTempVar * globTempVar
  else
    goalY = OSCDBottom + OTotalYSpeed * globTempVar
  endif
else
  EstOYCoord goalY globTempVar
endif
immediateTempVar = OTopNY - goalY
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
anotherTempVar *= 0.5
goalY -= anotherTempVar

immediateTempVar = OTopNY - goalY
if immediateTempVar > OYDistFloor && !(Equal OYDistFloor -1) 
  goalY = OTopNY - OYDistFloor
endif

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

  globTempVar = OTopNY + OHurtboxSize
  if TopNY > globTempVar
    if OCurrAction >= hex(0xA) && OCurrAction <= hex(0xB) && OAnimFrame < 10
      goalY = OTopNY - OYDistFloor
    endif
  endif

  // if Equal AirGroundState 1
  //   goalY = TopNY + cs_shortHopHeight * 4
  // endif
endif
GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
globTempVar = OTopNY - TopNY
if Equal immediateTempVar 1
elif globTempVar > 30 || OYDistBackEdge < -35
elif !(Equal currGoal cg_attack_reversal) && currGoal < cg_edgeguard && OYDistFloor < 30
  predictAverage immediateTempVar man_OXHitDist LevelValue
  if immediateTempVar < 7
    immediateTempVar = 7
  endif
  predictOOption anotherTempVar man_OBaitDirection LevelValue 
  if Equal currGoal cg_attack_wall
    immediateTempVar *= OPos * 3
    goalX -= immediateTempVar
  elif Equal anotherTempVar op_baitdir_overshoot
    if OXDistBackEdge > -20 && OXDistFrontEdge < 20
      globTempVar = OXSpeed * OPos
      if OCurrAction >= hex(0x2) && OCurrAction <= hex(0x19) && globTempVar > 0
      else
        immediateTempVar *= OPos * 2
        goalX -= immediateTempVar
      endif
    endif
  elif Equal anotherTempVar op_baitdir_undershoot
    immediateTempVar *= OPos * 2
    goalX += immediateTempVar
  endif
endif

GetYDistFloorOffset immediateTempVar 50 10 1
if Equal immediateTempVar -1 && Equal OPos -1
  goalX -= 20 
endif
GetYDistFloorOffset immediateTempVar -50 10 1
if Equal immediateTempVar -1 && Equal OPos 1
  goalX += 20 
endif

// LOGSTR str("GOALX, Y")
// LOGVAL goalX
// LOGVAL goalY
// LOGSTR str("SVariant")
// LOGVAL scriptVariant
// PRINTLN

// if CalledFrom UpdateGoal
//   if Equal CurrAction hex(0xA) || Equal scriptVariant sv_attackgoal_justy
//     goalX = original_goalX
//   elif Equal scriptVariant sv_attackgoal_justx
//     goalY = original_goalY
//   endif
// endif

Cmd30
Return
Return