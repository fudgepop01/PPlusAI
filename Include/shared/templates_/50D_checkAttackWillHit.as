#include <Definition_AIMain.h>
id 0x850D
unk 0x0

XReciever

// $setLastAttack(dtilt)

#let move_xOffset = var12
#let move_yOffset = var11
#let move_xRange = var10
#let move_yRange = var9
#let move_hitFrame = var15
#let move_duration = var7
#let move_IASA = var6
#let move_angle = var0
#let isORecovering = var16
GET_MOVE_DATA(move_angle, move_xOffset, move_yOffset, move_xRange, move_yRange, move_hitFrame, move_duration, move_IASA, globTempVar, globTempVar, globTempVar, globTempVar)

isORecovering = 0
if OCurrAction >= hex(0x100)
  #let REC_KIND = var3
  $tempVar(REC_ACTION, immediateTempVar)
  immediateTempVar = OCurrAction + hex(0x100)
  RetrieveFullATKD REC_KIND immediateTempVar immediateTempVar immediateTempVar immediateTempVar immediateTempVar immediateTempVar immediateTempVar 1
  if REC_KIND > -1
    isORecovering = 1
  endif
endif

globTempVar = 26 - move_hitFrame
if OAnimFrame < globTempVar
  if OCurrAction >= hex(0x4E) && OCurrAction <= hex(0x52)
    Return
  elif OCurrAction >= hex(0x60) && OCurrAction <= hex(0x61)
    Return
  endif
endif

// if Equal OCurrAction hex(0x4D)
//   move_yRange += 3
//   move_yOffset += 3
// endif

// $ifAerialAttack()
// else
//   immediateTempVar = move_yRange * 2 - move_yOffset
//   if immediateTempVar <= HurtboxSize && OYDistFloor > HurtboxSize && OYSpeed > 0
//     lastAttack = -1
//     Return
//   endif
//   immediateTempVar = move_xOffset * 0.25 - move_xRange * 0.5
//   if XDistLE immediateTempVar
//     lastAttack = -1
//     Return
//   endif
// endif

move_yRange += OHurtboxSize
move_yOffset -= OHurtboxSize
move_xRange += OWidth
move_xOffset -= OWidth

immediateTempVar = 10
// if currGoal >= cg_edgeguard
//   immediateTempVar = (move_duration + move_hitFrame) * 0.15
// endif
if Equal currGoal cg_attack_inCombo
  move_yRange += immediateTempVar
  move_yOffset += immediateTempVar
  move_xRange += immediateTempVar
  move_xOffset -= immediateTempVar
endif 

if Equal currGoal cg_attack_wall
  immediateTempVar = move_hitFrame * 2.5
  move_xRange += immediateTempVar
  // immediateTempVar *= 0.5
  // move_yRange += immediateTempVar
  // move_yOffset += immediateTempVar
endif

$ifAerialAttack()
  if Equal AirGroundState 1
    move_xRange += 5
    move_xOffset -= 5
  endif
endif

$ifLastOrigin(grab,false)
  if Equal OCurrAction hex(0x4A) || Equal OCurrAction hex(0x4D) || Equal OCurrAction hex(0x53) || Equal OCurrAction hex(0x54)
    Return
  endif
  move_duration = 1
endif

if OCurrAction >= hex(0x44) && OCurrAction <= hex(0x49) || Equal OCurrAction hex(0x42)
  immediateTempVar = move_yRange - move_yOffset
  if OYDistFloor < immediateTempVar && OYSpeed < 0 && OYDistFloor > 1
    Return
  endif
endif

#let tempGoalX = var2
#let tempGoalY = var3
#let tempXRange = var4
#let tempYRange = var5
#let counter = var8

// move_hitFrame += 2
counter = move_duration

if !(True)
  label CHECK_HIT_LOOP
endif

tempGoalX = goalX
tempGoalY = goalY
tempXRange = move_xRange
tempYRange = move_yRange

$ifAerialAttack()
  tempGoalY -= HurtboxSize
endif

// adjust to O center
// anotherTempVar = OHurtboxSize * 0.25
// tempYRange += anotherTempVar
// anotherTempVar = OWidth
// tempXRange += anotherTempVar

// anotherTempVar = Width * 0.5
// tempGoalX -= anotherTempVar
// anotherTempVar = HurtboxSize * 0.5
// tempGoalY -= anotherTempVar

anotherTempVar = OCenterX - OTopNX
tempGoalX += anotherTempVar

anotherTempVar = counter + 1 + move_hitFrame
immediateTempVar = 0.3 / anotherTempVar
immediateTempVar += 0.7
tempXRange *= immediateTempVar
tempYRange *= immediateTempVar

if Equal OYDistFloor -1 && Equal AirGroundState 1
  if OYDistBackEdge > -10
    tempGoalY -= OHurtboxSize
  elif OYDistBackEdge < -45
    tempGoalY += OHurtboxSize
  endif
endif
// tempGoalX -= anotherTempVar
// if TopNX < OTopNX
//   tempGoalX += anotherTempVar
// else 
//   tempGoalX -= anotherTempVar
// endif

// anotherTempVar = CenterY - TopNY
// tempGoalY -= anotherTempVar

anotherTempVar = OCenterY - OTopNY
tempGoalY -= anotherTempVar

// tempGoalY -= anotherTempVar
// if TopNY <= OTopNY
//   tempGoalY -= anotherTempVar
// else 
//   tempGoalY += anotherTempVar
// endif

  if counter < 0
    counter = 0
    SeekNoCommit CHECK_HIT_LOOP
  endif

  globTempVar = counter + move_hitFrame

  {SELF_Y_ADJUST}

  DrawDebugRectOutline TopNX tempGoalY 10 10 color(0xFF0000DD)

  {SELF_X_ADJUST}

  globTempVar = counter
  if Equal isORecovering 0
    if OAnimFrame <= 3 && !(Equal OYSpeed 0)
      anotherTempVar = OSCDBottom + OTotalYSpeed * globTempVar - OGravity * globTempVar * globTempVar
    else
      EstOYCoord anotherTempVar globTempVar
    endif
    anotherTempVar -= OSCDBottom
  endif
  immediateTempVar = OYDistFloor * -1
  if anotherTempVar < OYDistBackEdge && OYDistFloor > 0
    anotherTempVar = OTopNY - OYDistFloor
  endif
  tempGoalY -= anotherTempVar

  if Equal isORecovering 0
    if OAnimFrame <= 3
      anotherTempVar = OTopNX + OTotalXSpeed * globTempVar
    else
      EstOXCoord anotherTempVar globTempVar
    endif
    anotherTempVar -= OTopNX
    tempGoalX -= anotherTempVar
  endif

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
  //   immediateTempVar *= counter * 0.5
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

  
  // anotherTempVar = OXSpeed
  // Abs anotherTempVar
  // tempXRange += anotherTempVar

  #let targetX = var0
  #let targetY = var1
  targetX = tempGoalX
  targetY = tempGoalY //- immediateTempVar
  // immediateTempVar = OHurtboxSize * 0.5
  // tempYRange += immediateTempVar

  immediateTempVar = OTopNX + (move_xOffset + tempXRange) * ODirection
  globTempVar = OTopNY - move_yOffset + tempYRange + OHurtboxSize * 0.5
  DrawDebugRectOutline immediateTempVar globTempVar tempXRange tempYRange color(0xFFFF4444)

  immediateTempVar = targetX 
  globTempVar = targetY 

  DrawDebugRectOutline immediateTempVar globTempVar tempXRange tempYRange color(0x00FF0044)

  globTempVar = targetX - TopNX
  immediateTempVar = targetY - TopNY

  Abs globTempVar
  Abs immediateTempVar

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
      globTempVar = targetX - XSpeed * (AnimFrame - cs_dashForceTurnFrame)
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
    if anotherTempVar <= tempXRange && immediateTempVar <= tempYRange && currGoal < cg_edgeguard
      if Equal CurrAction hex(0x3) || Equal CurrAction hex(0x8) || Equal CurrAction hex(0x9)
        if AnimFrame < calc(cs_dashForceTurnFrame - 3) || Equal CurrAction hex(0x8) || Equal CurrAction hex(0x9)
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

  // anotherTempVar = OTopNY - TopNY
  // $ifAerialAttack()
  // elif anotherTempVar > cs_shortHopHeight
  //   lastAttack = -1
  // endif

  if Equal IsOnStage 1
    {FASTFALL_CHECK}
  endif

  globTempVar = targetX - TopNX
  immediateTempVar = targetY - TopNY

  Abs globTempVar
  Abs immediateTempVar

  if globTempVar <= tempXRange && immediateTempVar <= tempYRange
    anotherTempVar = counter + 1
    immediateTempVar = 6 / anotherTempVar
    if Rnd < immediateTempVar
      $ifAerialAttack()
        if currGoal >= cg_edgeguard || Equal IsOnStage 0
          {MOVE_IASA_CHECK}
          DrawDebugRectOutline TopNX immediateTempVar 5 5 color(0x00FFFFDD)
          anotherTempVar = cs_recoveryDistY
          if NumJumps > 0
            anotherTempVar -= cs_djumpHeight
          endif
          DrawDebugRectOutline TopNX anotherTempVar 10 2 color(0xFF8800DD)
          if immediateTempVar >= anotherTempVar && Equal AirGroundState 2
            CallI ExecuteAttack
            Finish
          elif NumJumps > 0 && YDistBackEdge > cs_djumpHeight
            Button X
            Return
          endif
        elif Equal AirGroundState 2
          CallI ExecuteAttack
        elif OFramesHitstun < 1 && !(Equal CurrSubaction JumpSquat)
          Button X
        endif
      elif Equal AirGroundState 1
        CallI ExecuteAttack
        Finish
      endif
    endif
  endif

  // if globTempVar <= tempXRange
  //   goalX = TopNX
  //   Return
  // endif

if counter > 0
  counter -= 4
  SeekNoCommit CHECK_HIT_LOOP
endif

skipMainInit = 0

// MIXES UP AN APPROACH


if currGoal < cg_edgeguard && CHANCE_MUL_LE PT_BAITCHANCE 0.04
  PredictOMov immediateTempVar mov_shield LevelValue
  if immediateTempVar < 0.2 && immediateTempVar > 0.05 && Rnd < 0.45
    $ifAerialAttack()
      if move_hitFrame <= 8
        Return
      endif
    elif move_hitFrame <= 13
      Return
    endif
  endif

  GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
  if LevelValue >= LV6 && Equal immediateTempVar 0 && currGoal < cg_edgeguard && !(Equal currGoal cg_attack_wall) && OAnimFrame > 8
    predictAverage immediateTempVar man_OXHitDist LevelValue
    if immediateTempVar < 15
      immediateTempVar = 15
    endif
    immediateTempVar *= 2.5
    if XDistLE immediateTempVar
      LOGSTR_NL str("MIXUP?")
      skipMainInit = mainInitSkip
      GetCommitPredictChance anotherTempVar LevelValue
      if Rnd < 0.35 && CHANCE_MUL_LE PT_BAITCHANCE 0.04
        LOGSTR_NL str("FIRST")
        if CHANCE_MUL_LE PT_BAITCHANCE 0.6
          scriptVariant = sv_wavedash_neutral
          if Equal AirGroundState 2 && AnimFrame > 6
            if YDistFloor <= 5
              scriptVariant = sv_wavedash_out
            elif YSpeed < 0.5 && NumJumps > 0
              LOGSTR_NL str("JUMP OVER 1")
              scriptVariant = sv_jump_over + svp_jump_fullhop
              lastAttack = -1
              CallI JumpScr
            endif
          elif XDistLE 20
            scriptVariant = sv_wavedash_out
          endif
          CallI Wavedash
        endif
        scriptVariant = sv_dash_away
        currGoal = cg_attack_reversal
        CallI DashScr
        Return
      endif

      GetCommitPredictChance anotherTempVar LevelValue
      LOGVAL anotherTempVar
      if Equal AirGroundState 1 && CHANCE_MUL_LE PT_BAITCHANCE 0.04
        LOGSTR_NL str("CHK BAIT")
        PredictOMov immediateTempVar mov_shield LevelValue
        if anotherTempVar >= 0.10 && immediateTempVar < 0.2
          LOGSTR_NL str("BAIT WAIT")
          currGoal = cg_bait_wait
          if ODistLE 25
            scriptVariant = sv_dash_away
            CallI DashScr
          else
            scriptVariant = sv_wavedash_out
            CallI Wavedash
          endif
        endif
      endif
      LOGVAL anotherTempVar
      if anotherTempVar < 0.15 && Rnd < 0.4 || anotherTempVar > 0.25 && Rnd < 0.4
        immediateTempVar = OPos * 40
        GetYDistFloorOffset immediateTempVar immediateTempVar 15 1
        if immediateTempVar > 0
          if CHANCE_MUL_LE PT_BRAVECHANCE 0.2
            LOGSTR_NL str("DASH THROUGH")
            scriptVariant = sv_dash_through
            lastAttack = -1
            CallI DashScr
          elif CHANCE_MUL_LE PT_AGGRESSION 0.2 && AnimFrame > 6
            LOGSTR_NL str("JUMP OVER FULL")
            currGoal = cg_attack_reversal
            scriptVariant = sv_jump_over + svp_jump_fullhop
            lastAttack = -1
            CallI JumpScr
          endif
          currGoal = cg_bait_shield
        endif
        Return
      endif
    endif
  endif
endif
Return
Return