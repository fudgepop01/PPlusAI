#include <Definition_AIMain.h>
id 0x850D
unk 0x0

XReciever

#let move_xOffset = var12
#let move_yOffset = var11
#let move_xRange = var10
#let move_yRange = var9
#let move_hitFrame = var8
#let move_duration = var7
#let move_IASA = var6
#let move_angle = var0
GET_MOVE_DATA(move_angle, move_xOffset, move_yOffset, move_xRange, move_yRange, move_hitFrame, move_duration, move_IASA, globTempVar, globTempVar, globTempVar, globTempVar)

globTempVar = 23 - move_hitFrame
if OAnimFrame < globTempVar
  if OCurrAction >= hex(0x4E) && OCurrAction <= hex(0x52)
    Return
  elif OCurrAction >= hex(0x60) && OCurrAction <= hex(0x61)
    Return
  endif
endif

$ifLastOrigin(grab,false)
  if Equal OCurrAction hex(0x4A) || Equal OCurrAction hex(0x4D) || Equal OCurrAction hex(0x53) || Equal OCurrAction hex(0x54)
    Return
  endif
endif

if OCurrAction >= hex(0x44) && OCurrAction <= hex(0x49) || Equal OCurrAction hex(0x42)
  immediateTempVar = move_yRange - move_yOffset 
  if OYDistFloor < immediateTempVar && OYSpeed < 0 && OYDistFloor > 1
    Return
  endif
endif 

#let move_lastHitFrame = var7
move_lastHitFrame += move_hitFrame

$ifAerialAttack()
else
  move_lastHitFrame = move_hitFrame
endif

move_lastHitFrame -= 1
move_hitFrame -= 1

#let tempGoalX = var2
#let tempGoalY = var3
#let tempXRange = var4
#let tempYRange = var5

if !(True)
  label CHECK_HIT_LOOP
endif

tempGoalX = goalX
tempGoalY = goalY
tempXRange = move_xRange
tempYRange = move_yRange

// adjust to O center
anotherTempVar = OHurtboxSize
tempYRange += anotherTempVar
anotherTempVar = OWidth
tempXRange += anotherTempVar

// anotherTempVar = Width * 0.5
// tempGoalX -= anotherTempVar
// anotherTempVar = HurtboxSize * 0.5
// tempGoalY -= anotherTempVar

anotherTempVar = OTopNX - OCenterX
tempGoalX -= anotherTempVar

// tempGoalX -= anotherTempVar
// if TopNX < OTopNX
//   tempGoalX += anotherTempVar
// else 
//   tempGoalX -= anotherTempVar
// endif

// anotherTempVar = CenterY - TopNY
// tempGoalY -= anotherTempVar

anotherTempVar = OCenterY - OTopNY
tempGoalY += anotherTempVar

// tempGoalY -= anotherTempVar
// if TopNY <= OTopNY
//   tempGoalY -= anotherTempVar
// else 
//   tempGoalY += anotherTempVar
// endif

  if move_lastHitFrame < move_hitFrame
    move_lastHitFrame = move_hitFrame
    SeekNoCommit CHECK_HIT_LOOP
  endif

  globTempVar = move_lastHitFrame

  {SELF_Y_ADJUST}
  tempGoalY += TopNY

  {SELF_X_ADJUST}
  tempGoalX += TopNX

  if OAnimFrame <= 3 && !(Equal OYSpeed 0)
    anotherTempVar = OSCDBottom + OTotalYSpeed * globTempVar - OGravity * globTempVar * globTempVar
  else
    EstOYCoord anotherTempVar globTempVar
  endif
  anotherTempVar -= OTopNY
  immediateTempVar = OYDistFloor * -1
  if anotherTempVar < immediateTempVar && OYDistFloor > 0
    anotherTempVar = OTopNY - OYDistFloor
  endif
  tempGoalY += anotherTempVar

  // if OAnimFrame <= 3
  //   anotherTempVar = OTopNX + OTotalXSpeed * globTempVar
  // else
    EstOXCoord anotherTempVar globTempVar
  // endif
  anotherTempVar -= OTopNX
  tempGoalX += anotherTempVar

  immediateTempVar = (100 - LevelValue) * 0.2 - 0
  anotherTempVar = tempXRange + immediateTempVar
  if anotherTempVar > 1
    move_xOffset -= immediateTempVar
    immediateTempVar *= 0.5
    tempXRange += immediateTempVar
    immediateTempVar *= 2
  endif
  anotherTempVar = tempYRange + immediateTempVar
  if anotherTempVar > 1
    move_yOffset -= immediateTempVar
    immediateTempVar *= 0.5
    tempYRange += immediateTempVar
  endif


  // $ifAerialAttack()
  //   GetAttribute immediateTempVar attr_airMobilityB 0
  //   immediateTempVar *= move_hitFrame * 0.5
  //   move_xOffset -= immediateTempVar
  //   immediateTempVar *= 0.5
  //   tempXRange += immediateTempVar
  // endif

  // if globTempVar > 15
  //   immediateTempVar = globTempVar - 15
  //   immediateTempVar *= 0.5
  //   move_xOffset -= immediateTempVar
  //   move_yOffset -= immediateTempVar
  //   immediateTempVar *= 0.5
  //   tempXRange += immediateTempVar
  //   tempYRange += immediateTempVar
  // endif

  if Equal currGoal cg_attack_wall
    tempXRange += 8
  endif
  // anotherTempVar = OXSpeed
  // Abs anotherTempVar
  // tempXRange += anotherTempVar

  #let distX = var0
  #let distY = var1
  distX = tempGoalX
  distY = tempGoalY

  immediateTempVar = OTopNX + (move_xOffset + tempXRange) * ODirection
  globTempVar = OTopNY - move_yOffset + tempYRange
  DrawDebugRectOutline immediateTempVar globTempVar tempXRange tempYRange color(0xFFFF4444)

  immediateTempVar = distX 
  globTempVar = distY 

  DrawDebugRectOutline immediateTempVar globTempVar tempXRange tempYRange color(0x00FF0044)

  globTempVar = distX - TopNX
  immediateTempVar = distY - TopNY

  Abs globTempVar
  Abs immediateTempVar

  if !(Equal scriptVariant sv_checkHit)
    $ifMoveRequiresIdleGround()
      if globTempVar <= tempXRange && immediateTempVar <= tempYRange && Equal CurrAction hex(0x4)
        label crouchWait
          XGoto PerFrameChecks
          XReciever
          Seek crouchWait
          if !(Equal CurrAction hex(0x4))
            skipMainInit = sm_execAttack
            Call MainHub
          endif
          ClearStick
          AbsStick 0 (-0.6)
        Return
      endif

      if Equal CurrAction hex(0x3)
        globTempVar = distX + XSpeed * (AnimFrame - cs_dashForceTurnFrame)
        globTempVar -= TopNX
        Abs globTempVar
        if globTempVar <= tempXRange && immediateTempVar <= tempYRange
          label runWait
          XGoto PerFrameChecks
          XReciever
          Seek runWait
          ClearStick
          Stick 1
          if Equal CurrAction hex(0x4) || Equal CurrAction hex(0x1)
            Seek crouchWait
            Jump
          endif
          Return
        endif
      endif

      anotherTempVar = globTempVar - cs_wavedashDist
      immediateTempVar = OXSpeed
      Abs immediateTempVar
      if anotherTempVar <= tempXRange && immediateTempVar <= tempYRange && immediateTempVar < 0.8 && currGoal < cg_edgeguard
        if Equal CurrAction hex(0x3) || Equal CurrAction hex(0x8) || Equal CurrAction hex(0x9)
          if AnimFrame < calc(cs_dashForceTurnFrame - 4)
            scriptVariant = sv_wavedash_goal
            // if XDistFrontEdge < 15 || XDistBackEdge > -15
            //   scriptVariant = sv_wavedash_awayFromLedge
            // endif
            skipMainInit = sm_execAttack
            // if Rnd < 0.7
              // skipMainInit = sm_execAttack
            // endif
            CallI Wavedash      
          endif
        endif
      endif
    endif
  endif

  // anotherTempVar = OTopNY - TopNY
  // $ifAerialAttack()
  // elif anotherTempVar > cs_shortHopHeight
  //   lastAttack = -1
  // endif

  if Equal IsOnStage 1
    {FASTFALL_CHECK}
  endif

  globTempVar = distX - TopNX
  immediateTempVar = distY - TopNY

  Abs globTempVar
  Abs immediateTempVar

  if globTempVar <= tempXRange && immediateTempVar <= tempYRange
    if !(Equal scriptVariant sv_checkHit)
      $ifAerialAttack()
        if currGoal >= cg_edgeguard || Equal IsOnStage 0
          EstYCoord immediateTempVar move_IASA
          DrawDebugRectOutline TopNX immediateTempVar 5 5 color(0x00FFFFDD)
          DrawDebugRectOutline TopNX calc(cs_recoveryDistY - cs_djumpHeight) 10 2 color(0xFF8800DD)
          if immediateTempVar >= calc(cs_recoveryDistY - cs_djumpHeight) && Equal AirGroundState 2
            CallI ExecuteAttack
            Finish
          endif
        else
          CallI ExecuteAttack
          Finish
        endif
      elif Equal AirGroundState 1
        CallI ExecuteAttack
        Finish
      endif
    else
      scriptVariant = sv_execute_willhit
      Return
    endif
  endif

  // if globTempVar <= tempXRange
  //   goalX = TopNX
  //   Return
  // endif

if move_lastHitFrame > move_hitFrame
  move_lastHitFrame -= 4
  SeekNoCommit CHECK_HIT_LOOP
endif


skipMainInit = 0

// MIXES UP AN APPROACH
GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
if LevelValue >= LV5 && !(Equal currGoal cg_attack_reversal) && !(Equal currGoal cg_attack_undershoot) && Equal immediateTempVar 0 && currGoal < cg_edgeguard
  tempXRange += 20
  tempYRange += 20
  if globTempVar <= tempXRange && immediateTempVar <= tempYRange
    GET_CHAR_TRAIT(immediateTempVar, chr_calc_certainty)
    if immediateTempVar > 0.4
      currGoal = cg_bait_dashdance
      if CHANCE_MUL_LE PT_BAITCHANCE 0.8
        currGoal = cg_bait_wait
        scriptVariant = sv_wavedash_neutral
        skipMainInit = mainInitSkip
        if Equal AirGroundState 2
          if YDistFloor <= 5
            scriptVariant = sv_wavedash_out
          else
            // currGoal = cg_attack_reversal
            scriptVariant = sv_jump_neutral
            CallI JumpScr
          endif
        elif ODistLE 20
          scriptVariant = sv_wavedash_out
        endif
        CallI Wavedash
      endif
      Return
    endif
    PredictOMov immediateTempVar mov_idle LevelValue
    PredictOMov anotherTempVar mov_attack LevelValue
    if immediateTempVar > 0.4 && anotherTempVar > 0.4
      currGoal = cg_bait_shield
      if CHANCE_MUL_LE PT_AGGRESSION 0.5
        currGoal = cg_bait_dashdance
      endif
      Return
    endif
  endif
endif
Return
Return