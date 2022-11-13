#include <Definition_AIMain.h>
id 0x850E
unk 0x0

XReciever
Cmd30

#let shouldOffsetRes = var2
Goto shouldOffset
shouldOffsetRes = anotherTempVar
// updateOffset = (1 - (LevelValue / 100)) * 30 + 1
// MOD updateOffset AnimFrame updateOffset
// updateOffset = 0

#let move_xOffset = var11
#let move_yOffset = var10
#let move_xRange = var9
#let move_yRange = var8
#let move_lastHitFrame = var7
#let move_hitFrame = var0

GET_MOVE_DATA(globTempVar, move_xOffset, move_yOffset, move_xRange, move_yRange, move_hitFrame, move_lastHitFrame, globTempVar, globTempVar, globTempVar, globTempVar, globTempVar)
$ifLastOrigin(grab,false)
  move_lastHitFrame = 1
endif
move_lastHitFrame += move_hitFrame

// anotherTempVar = TopNX + XSpeed * move_lastHitFrame
// globTempVar = 10 * Direction
// anotherTempVar += globTempVar
// DrawDebugLine CenterX CenterY anotherTempVar CenterY color(0xFF0000DD)
// GetColDistPosAbs anotherTempVar globTempVar CenterX CenterY anotherTempVar CenterY 0
//   LOGSTR str("colResVal")
//   LOGVAL anotherTempVar
//   PRINTLN
// if !(Equal anotherTempVar -1)
//   DrawDebugRectOutline anotherTempVar globTempVar 1 1 color(0x00FF00DD)
//   DrawDebugRectOutline anotherTempVar globTempVar 2 2 color(0x00FF00DD)
//   DrawDebugRectOutline anotherTempVar globTempVar 3 3 color(0x00FF00DD)
//   DrawDebugRectOutline anotherTempVar globTempVar 4 4 color(0x00FF00DD)
// endif

#let original_goalX = var0
#let original_goalY = var1
original_goalX = goalX
original_goalY = goalY

// if True
//   immediateTempVar = OTopNX - TopNX
//   globTempVar = OTopNY - TopNY
//   Norm globTempVar immediateTempVar globTempVar
//   Abs globTempVar

//   globTempVar -= 30
//   if globTempVar < 0
//     globTempVar = 0
//   endif
//   globTempVar *= 0.1
// endif
globTempVar = move_lastHitFrame

// if OFramesHitstun > 0 && OFramesHitstun > move_lastHitFrame
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
if OCurrAction < hex(0x100)
  goalX = OTopNX + OTotalXSpeed * anotherTempVar
else
  goalX = OTopNX
endif
DrawDebugRectOutline goalX OTopNY 5 5 color(0xFFFF0088)
if Equal shouldOffsetRes 1 
  predictOOption anotherTempVar man_OBaitDirection LevelValue
  if !(Equal anotherTempVar op_baitdir_neutral) || Equal currGoal cg_attack_wall
    goalX = OTopNX
  endif
endif

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
goalX += TopNX

// CalcYChange goalY globTempVar OTotalYSpeed OGravity OMaxFallSpeed OFastFallSpeed 0
// goalY *= -1
// goalY += OSCDBottom
if OAnimFrame <= 3 || AnimFrame <= 3
  if OYSpeed > 0
    goalY = OYSpeed * globTempVar - OGravity * globTempVar * globTempVar
  else
    goalY = OYSpeed * globTempVar
  endif
  goalY += OSCDBottom
elif OCurrAction >= hex(0x100)
  goalY += OSCDBottom
else
  EstOYCoord goalY globTempVar
endif

if OCurrAction >= hex(0x100)
  #let REC_KIND = var3
  #let REC_ARG1 = var4
  #let REC_ARG2 = var5
  #let REC_ARG3 = var6
  $tempVar(REC_ACTION, immediateTempVar)
  immediateTempVar = OCurrAction + hex(0x100)
  RetrieveFullATKD REC_KIND REC_ARG1 REC_ARG2 REC_ARG3 immediateTempVar immediateTempVar immediateTempVar REC_ACTION 1
  if Equal REC_KIND -1
    SeekNoCommit esc_recovery
  endif
  // move_lastHitFrame += 6
  goalX = OTopNX
  goalY = OTopNY
  if Equal REC_KIND RECOVERY_IDLE
  elif Equal REC_KIND RECOVERY_HORIZONTAL
    $tempVar(punish_frame, REC_ARG1)
    $tempVar(distTolerence, REC_ARG2)
    $tempVar(punishDist, REC_ARG3)

    immediateTempVar = punish_frame - move_lastHitFrame
    if XDistLE distTolerence || OActionTimer > immediateTempVar
    else
      scriptVariant = sv_punishRecovery + punish_frame * 0.001
      punishDist *= ODirection
      goalX += punishDist
    endif
  elif Equal REC_KIND RECOVERY_VERTICAL
    $tempVar(punish_frame, REC_ARG1)
    $tempVar(distTolerence, REC_ARG2)
    $tempVar(punishDist, REC_ARG3)

    immediateTempVar = punish_frame - move_lastHitFrame
    if XDistLE distTolerence || OActionTimer > immediateTempVar
    else
      scriptVariant = sv_punishRecovery + punish_frame * 0.001
      goalY += punishDist
    endif
  elif Equal REC_KIND RECOVERY_AIM
    $tempVar(movementStart, REC_ARG1)
    $tempVar(movementEnd, REC_ARG2)
    $tempVar(totalDistance, REC_ARG3)
    
    Norm immediateTempVar OXSpeed OYSpeed
    Abs immediateTempVar
    if Equal immediateTempVar 0
      SeekNoCommit esc_recovery
    endif 
    anotherTempVar = immediateTempVar
    immediateTempVar = 1 / anotherTempVar
    globTempVar = OXSpeed * immediateTempVar
    immediateTempVar = OYSpeed * immediateTempVar
    globTempVar *= totalDistance
    immediateTempVar *= totalDistance
    
    anotherTempVar = move_lastHitFrame + OActionTimer
    if anotherTempVar > movementStart
      // mult totalDist by (OActionTimer + move_lastHitFrame) / totalTime
      movementEnd -= movementStart
      if anotherTempVar > movementEnd
        anotherTempVar = movementEnd
      endif
      // anotherTempVar = movementEnd - anotherTempVar
      anotherTempVar -= OActionTimer
      anotherTempVar /= movementEnd
      globTempVar *= anotherTempVar
      immediateTempVar *= anotherTempVar
      goalX += globTempVar
      goalY += immediateTempVar
    endif
  endif
endif
if !(True)
  label esc_recovery
endif

immediateTempVar = OTopNY - goalY
if immediateTempVar > OYDistFloor && !(Equal OYDistFloor -1) 
  goalY = OTopNY - OYDistFloor
endif

if Equal OCurrAction hex(0x54)
  goalY = OTopNY
endif

DrawDebugRectOutline goalX goalY 3 3 color(0xFFFFFFDD)


// {SELF_Y_ADJUST}
// goalY += TopNY

// if OYDistBackEdge < -30
//   goalY -= calc(cs_shortHopHeight - 3)
// endif

// globTempVar = TopNY + YDistBackEdge
// if SamePlane && goalY <= globTempVar && !(MeteoChance)
//   goalY = globTempVar
// endif
immediateTempVar = OWidth * 0.5
anotherTempVar = move_xOffset + move_xRange
anotherTempVar += immediateTempVar

$ifAerialAttack()
  $genLastAttackDirAerials(immediateTempVar)
  if Equal immediateTempVar -1
    anotherTempVar = move_xOffset
    if Equal AirGroundState 1
      anotherTempVar *= Direction
    endif
  endif

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

// anotherTempVar *= 0.5
goalX -= anotherTempVar

// immediateTempVar = goalX - OTopNX
// immediateTempVar *= OPos
// immediateTempVar -= move_xOffset
// immediateTempVar += move_xRange + -30
// if immediateTempVar > 0 && !(XDistLE 20)
//   lastAttack = -1
//   Return
// endif

anotherTempVar = (move_yOffset * -1) + move_yRange
// anotherTempVar *= 0.5
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

immediateTempVar = OHurtboxSize
goalY += immediateTempVar

$ifAerialAttack()
  immediateTempVar = (TopNY - YDistFloor) + cs_shortHopHeight
  if !(Equal OYDistFloor -1) && SamePlane && OYDistFloor < move_yRange && Equal AirGroundState 1 && !(Equal CurrAction hex(0xA))
    if goalY < immediateTempVar
      immediateTempVar += cs_shortHopHeight
      if goalY < immediateTempVar
        goalY = TopNY + cs_jumpHeight
      else 
        goalY = TopNY + cs_shortHopHeight
      endif
    endif
  endif

  globTempVar = OTopNY + OHurtboxSize
  if TopNY > globTempVar && Equal AirGroundState 1
    if OCurrAction >= hex(0xA) && OCurrAction <= hex(0xB) && OAnimFrame < 10
      goalY = OTopNY - OYDistFloor
    endif
  endif

  // if Equal OYDistFloor -1 && OYDistBackEdge > 5
  //   immediateTempVar = OPos * OWidth
  //   goalX += immediateTempVar
  // endif
endif
if Equal shouldOffsetRes 1
  GetAttribute immediateTempVar attr_dashInitVel 1
  $ifAerialAttack()
    if move_lastHitFrame > 10
      move_lastHitFrame = 10
    endif
  endif
  immediateTempVar *= 0.4 * move_lastHitFrame * OPos
  predictOOption anotherTempVar man_OBaitDirection LevelValue 
  if Equal currGoal cg_attack_wall
  elif Equal anotherTempVar op_baitdir_undershoot
    // LOGSTR_NL str("UNDERSHOOT")
    globTempVar = OXSpeed
    globTempVar *= OPos
    if OCurrAction >= hex(0x2) && OCurrAction <= hex(0x19) && globTempVar >= 0
    else
      immediateTempVar *= 7
    endif
    goalX -= immediateTempVar
  elif Equal anotherTempVar op_baitdir_overshoot
    // LOGSTR_NL str("OVERSHOOT")
    immediateTempVar = OPos * 25
    GetYDistFloorOffset immediateTempVar immediateTempVar 5 1
    if !(Equal immediateTempVar -1)
      immediateTempVar *= 5
      goalX += immediateTempVar
    endif
  // else
  //   LOGSTR_NL str("NEUTRAL")
  endif
  // immediateTempVar = TopNX - original_goalX
  // Abs immediateTempVar
  // if immediateTempVar <= 20
  //   goalX = original_goalX
  // endif
endif

// immediateTempVar = move_xRange * 0.5 * OPos
// goalX += immediateTempVar

// immediateTempVar = original_goalX - TopNX
// anotherTempVar = goalX - TopNX

// immediateTempVar -= anotherTempVar
// Abs immediateTempVar
// if immediateTempVar > 10
//   anotherTempVar = goalX + original_goalX
//   anotherTempVar *= 0.5
//   goalX = anotherTempVar
// endif

// if Equal OIsOnStage 1
//   GetYDistFloorOffset immediateTempVar 20 10 1
//   if Equal immediateTempVar -1 && Equal OPos -1
//     goalX -= 2 
//   endif
//   GetYDistFloorOffset immediateTempVar -20 10 1
//   if Equal immediateTempVar -1 && Equal OPos 1
//     goalX += 2
//   endif
// endif

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

DrawDebugRectOutline goalX goalY 8 8 color(0xFFFFFFDD)

Cmd30
Return
label shouldOffset
  GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
  anotherTempVar = 0
  if Equal immediateTempVar 1
  elif OYDistBackEdge < -10
  elif !(Equal currGoal cg_attack_reversal) && currGoal < cg_edgeguard
    immediateTempVar = OTopNY - TopNY
    if immediateTempVar <= 30
      anotherTempVar = 1
    endif
  endif
  if OCurrAction >= hex(0x4E) && OCurrAction <= hex(0x52)
    anotherTempVar = 0
  elif OCurrAction >= hex(0x60) && OCurrAction <= hex(0x61)
    anotherTempVar = 0
  endif
Return
Return