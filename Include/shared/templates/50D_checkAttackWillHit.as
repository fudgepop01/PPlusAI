#include <Definition_AIMain.h>
id 0x850D
unk 0x0

//= XReciever

// $setLastAttack(dtilt)

// where will attacker be at end of frame
// where will defender be at end of frame
// apply positional offset to defender position
// check to see if move will hit if swung now

// CLEAR VARIABLES:
// 9, 10, 11, 12

#let move_xOffset = var0
#let move_yOffset = var1
#let move_xRange = var10
#let move_yRange = var9
#let move_hitFrame = var15
#let move_duration = var7
#let move_IASA = var6
#let isORecovering = var16
#let doesMoveHitBehind = var16

GET_MOVE_DATA(globTempVar, move_xOffset, move_yOffset, move_xRange, move_yRange, move_hitFrame, move_duration, move_IASA, globTempVar, globTempVar, globTempVar, globTempVar)
doesMoveHitBehind = 0

// temp until loop
// 1. adjust hitFrame
#let isAerialAttack = var3
IF_AERIAL_ATTACK(isAerialAttack)
  if Equal AirGroundState 1
    GetAttribute anotherTempVar attr_jumpSquatFrames 0
    move_hitFrame += anotherTempVar    
  endif
endif

// 2. check if it's worth pursuing this attack
globTempVar = move_hitFrame - OAnimFrame
if OCurrAction >= hex(0x4E) && OCurrAction <= hex(0x52) && 26 > globTempVar
  Return
elif OCurrAction >= hex(0x60) && OCurrAction <= hex(0x61) && 19 > globTempVar
  Return
elif OCurrAction >= hex(0x1f) && OCurrAction <= hex(0x20) && 19 > globTempVar // roll
  Return
elif Equal OCurrAction hex(0x1e) || Equal OCurrAction hex(0x8e) || Equal OCurrAction hex(0x90) || Equal OCurrAction hex(0x91)
  if 15 > globTempVar // spotdodge
    Return
  endif
elif Equal OCurrAction hex(0x21) && 29 > globTempVar // airdodge
  Return
elif Equal OCurrSubaction hex(0xD9) || Equal OCurrSubaction hex(0x30)
  if 33 > globTempVar // roll from ledge
    Return
  endif
elif Equal OCurrSubaction hex(0xDE) || Equal OCurrSubaction hex(0xDD)
  if 61 > globTempVar // roll from ledge SLOW
    Return
  endif
endif

// 3. setup ranges
#let move_centerX = var11
move_centerX = move_xOffset + move_xRange
if move_centerX < 0
  doesMoveHitBehind = 1
  move_centerX *= -1
endif

#let move_centerY = var12
move_centerY = move_yRange - move_yOffset
move_centerY *= -1

// grabs an estimate of the potential move xRange to hit
if Equal AirGroundState 2
  $ifAerialAttackNotSpecial()
    // get max possilbe air speed
    GetAttribute immediateTempVar attr_airMobilityA 0
    globTempVar = move_hitFrame + move_duration * 0.25
    anotherTempVar = globTempVar * immediateTempVar
    globTempVar = anotherTempVar
    // max possible speed
    anotherTempVar += XSpeed
    Abs anotherTempVar
    // min possible speed
    globTempVar -= XSpeed
    Abs globTempVar
    // clamp by term vel
    GetAttribute immediateTempVar attr_airXTermVel 0
    if anotherTempVar > immediateTempVar
      anotherTempVar = immediateTempVar
    endif
    if globTempVar > immediateTempVar
      globTempVar = immediateTempVar
    endif
    // positive offset
    immediateTempVar = move_hitFrame + move_duration * 0.25
    anotherTempVar *= immediateTempVar
    move_xRange += anotherTempVar
    anotherTempVar *= Direction * 2
    move_centerX -= anotherTempVar
    // negative offset
    globTempVar *= immediateTempVar
    move_xRange += globTempVar
    globTempVar *= Direction * 2
    move_centerX += globTempVar
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

immediateTempVar = OHurtboxSize * 0.5
move_yRange += immediateTempVar
immediateTempVar *= 0.5
move_centerY += immediateTempVar
immediateTempVar = OWidth * 0.5
move_xRange += immediateTempVar
immediateTempVar *= 0.5
move_centerX -= immediateTempVar

// LOGVAL_NL move_xRange
// immediateTempVar = 10
// // if currGoal >= cg_edgeguard
// //   immediateTempVar = (move_duration + move_hitFrame) * 0.15
// // endif
// if Equal currGoal cg_attack_inCombo
//   move_yRange += immediateTempVar
//   // move_yOffset += immediateTempVar
//   move_xRange += immediateTempVar
//   // move_xOffset -= immediateTempVar
// endif 

if Equal currGoal cg_attack_wall && OFramesHitstun < 1
  if move_IASA > 120
    lastAttack = -1
    Return
  endif
  anotherTempVar = move_centerX
  anotherTempVar -= Width
  if anotherTempVar > 0
    move_xRange += anotherTempVar
    move_centerX += anotherTempVar
  elif True
    GetAttribute immediateTempVar attr_dashInitVel 1
    immediateTempVar *= move_IASA
    immediateTempVar -= OWidth
    immediateTempVar *= 0.5
    move_xRange += immediateTempVar
    move_centerX += immediateTempVar
  endif
  // immediateTempVar *= 0.5
  // move_yRange += immediateTempVar
  // move_yOffset += immediateTempVar
endif
// LOGVAL_NL move_xRange

$ifLastOrigin(grab,false)
  if Equal OCurrAction hex(0x4A) || Equal OCurrAction hex(0x4D) || Equal OCurrAction hex(0x53) || Equal OCurrAction hex(0x54)
    Return
  endif
  move_duration = 1
endif

// if OCurrAction >= hex(0x44) && OCurrAction <= hex(0x49) || Equal OCurrAction hex(0x42)
//   immediateTempVar = move_yRange - move_yOffset
//   if OYDistFloor < immediateTempVar && OYSpeed < 0 && OYDistFloor > 1
//     Return
//   endif
// endif

// CLEAR VARIABLES:
// 9, 10, 11, 12

// $tempVar(dirX, immediateTempVar)
// GET_CHAR_TRAIT(dirX, chr_get_moveDir)

if Equal AirGroundState 1
  if move_centerX < 0 && OPos < 0
  elif move_centerX > 0 && OPos > 0
  else
    move_centerX *= -1
  endif
elif isAerialAttack > 0 && doesMoveHitBehind > 0
  move_centerX *= -1
endif

#let tempGoalX = var2
#let tempGoalY = var3
#let tempXRange = var4
#let tempYRange = var5
#let counter = var8

// adjust difficulty
if LevelValue <= LV3
  immediateTempVar = Rnd * 12 - 6
  move_hitFrame += immediateTempVar
  immediateTempVar = Rnd * 12 - 6
  move_centerX += immediateTempVar
  immediateTempVar = Rnd * 12 - 6
  move_centerY += immediateTempVar
  immediateTempVar = Rnd * 8
  move_xRange += immediateTempVar
  immediateTempVar = Rnd * 8
  move_yRange += immediateTempVar
elif LevelValue <= LV7
  immediateTempVar = Rnd * 6 - 3
  move_centerX += immediateTempVar
  immediateTempVar = Rnd * 6 - 3
  move_centerY += immediateTempVar
  immediateTempVar = Rnd * 3
  move_xRange += immediateTempVar
  immediateTempVar = Rnd * 3
  move_yRange += immediateTempVar
endif

move_hitFrame -= 1
counter = move_duration

STACK_PUSH move_xRange 1
STACK_PUSH move_yRange 1
STACK_PUSH move_centerX 1
STACK_PUSH move_centerY 1

// move_yOffset *= -1

LOGSTR str("XR")
LOGVAL move_xRange
LOGSTR str("YR")
LOGVAL move_yRange
LOGSTR str("CX")
LOGVAL move_centerX
LOGSTR str("CY")
LOGVAL move_centerY
PRINTLN

isORecovering = -1
if OCurrAction >= hex(0x100)
  #let REC_KIND = var3
  $tempVar(REC_ACTION, immediateTempVar)
  immediateTempVar = OCurrAction + hex(0x100)
  RetrieveFullATKD REC_KIND immediateTempVar immediateTempVar immediateTempVar immediateTempVar immediateTempVar immediateTempVar immediateTempVar 1
  isORecovering = REC_KIND
endif

if !(True)
  label CHECK_HIT_LOOP
endif

RESET_LTF_STACK_PTR

tempXRange = LTF_STACK_READ
tempYRange = LTF_STACK_READ

if counter < 0
  counter = 0
  SeekNoCommit CHECK_HIT_LOOP
endif

#let estFrame = var2
estFrame = counter
estFrame += move_hitFrame
// LOGSTR str("estim frame")
// LOGVAL estFrame
// PRINTLN

// 1. where will attacker be at end of frame
  $tempVar(estXPos, anotherTempVar)
  {SELF_X_ADJUST}
  STACK_PUSH estXPos 0
  $tempVar(estYPos, anotherTempVar)
  {SELF_Y_ADJUST}
  STACK_PUSH estYPos 0

  // NOTE visualization SELF
  globTempVar = STACK_POP // YPos
  immediateTempVar = STACK_POP // XPos
  // LOGSTR_NL str("POPPED")
  // LOGVAL_NL immediateTempVar
  anotherTempVar = 255 - estFrame * 5
  DrawDebugRectOutline immediateTempVar globTempVar tempXRange tempYRange 200 255 0 anotherTempVar
  STACK_PUSH immediateTempVar 0
  STACK_PUSH globTempVar 0

// 2. where will defender be at end of frame
  if isORecovering < 0
    $tempVar(estOXPos, anotherTempVar)
    estOXPos = OTopNX + OTotalXSpeed * estFrame
    // if OAnimFrame <= 3
    // else
    //   EstOXCoord estOXPos estFrame
    // endif
    LOGSTR str("est")
    LOGVAL immediateTempVar
    STACK_PUSH estOXPos 0

    $tempVar(estOYPos, anotherTempVar)
    if Equal OAirGroundState 2
      if OAnimFrame <= 3 && !(Equal OYSpeed 0)
        estOYPos = OSCDBottom + OTotalYSpeed * estFrame - OGravity * estFrame * estFrame
      else
        EstOYCoord estOYPos estFrame
      endif
    else
      estOYPos = OTopNY
    endif
    // if OYDistBackEdge > 5
    //   if estOYPos < 0
    //     estOYPos = 0
    //   endif
    //   tempYRange += estOYPos
    // endif
    Goto adjustPosIfInGround
    STACK_PUSH estOYPos 0
  elif True
    $tempVar(estOXPos, immediateTempVar)
    $tempVar(estOYPos, anotherTempVar)
    immediateTempVar = OTopNX
    anotherTempVar = OTopNY
    globTempVar = estFrame
    O_RECOVERY_POSITION(immediateTempVar, anotherTempVar, globTempVar)

    STACK_PUSH estOXPos 0
    Goto adjustPosIfInGround
    STACK_PUSH estOYPos 0
  endif

  // NOTE visualization OTHER
  globTempVar = STACK_POP // YPos
  immediateTempVar = STACK_POP // XPos
  anotherTempVar = 255 - estFrame * 5
  DrawDebugRectOutline immediateTempVar globTempVar OWidth OHurtboxSize 255 0 255 anotherTempVar
  // LOGSTR str("popped")
  // LOGVAL immediateTempVar
  // PRINTLN
  STACK_PUSH immediateTempVar 0
  STACK_PUSH globTempVar 0

// stack: 
// estOYPos, estOXPos, estYPos, estXPos, goalY, goalX, move_xRange, move_yRange

// 3. apply positional offset to defender position
  // FIXME come up with a better strategy for setAttackGoal
  // $tempVar(estOYPosOffs, anotherTempVar)
  // estOYPosOffs = OTopNY - goalY
  // estOYPosOffs += STACK_POP // estOYPos
  // $tempVar(estOXPosOffs, immediateTempVar)
  // estOXPosOffs = OTopNX - goalX
  // estOXPosOffs += STACK_POP // estOXPos
  // STACK_PUSH estOXPosOffs 0
  // STACK_PUSH estOYPosOffs 0

// check to see if move will hit if swung now
  #let estOYPos = var9
  estOYPos = STACK_POP // estOYPos

  #let xDiff = var10
  xDiff = STACK_POP // estOXPos

  #let yDiff = var11
  yDiff = estOYPos - STACK_POP // estYPos
  Abs yDiff

  // tempXRange *= 1
  // tempYRange *= 1

  // LOGSTR_NL str("xR; yR; yD")
  // LOGVAL tempXRange
  // LOGVAL tempYRange
  // LOGVAL yDiff
  // PRINTLN
  // handle dash for idle ground moves:
  $ifMoveRequiresIdleGround()
    if Equal CurrAction hex(0x3)
      STACK_TOSS 1 // ignore estXPos

      immediateTempVar = xDiff - XSpeed * (AnimFrame - cs_dashForceTurnFrame)
      Abs xDiff
      Abs yDiff
      if immediateTempVar <= tempXRange && yDiff <= tempYRange
        label runWait
          XGoto PerFrameChecks
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

    anotherTempVar = cs_wavedashDist + OXSpeed
    immediateTempVar = xDiff - anotherTempVar
    Abs immediateTempVar
    if immediateTempVar <= tempXRange && yDiff <= tempYRange && currGoal < cg_edgeguard
      if Equal CurrAction hex(0x3) || Equal CurrAction hex(0x8) || Equal CurrAction hex(0x9)
        if AnimFrame < calc(cs_dashForceTurnFrame - 3) || Equal CurrAction hex(0x8) || Equal CurrAction hex(0x9)
          scriptVariant = sv_wavedash_goal
          skipMainInit = sm_execAttack
          CallI Wavedash 
        endif
      endif
    endif
  endif
  
  #let estOXPos = var12
  estOXPos = STACK_POP // estXPos
  xDiff -= estOXPos
  Abs xDiff
  // LOGSTR_NL str("xD")
  // LOGVAL_NL xDiff
  
  if xDiff < tempXRange
    IF_AERIAL_ATTACK(var3)
      $tempVar(yChange, xDiff)
      Abs yDiff
      STACK_PUSH isORecovering st_function
      STACK_PUSH yDiff 0
      CALC_FASTFALL_DIST(yChange, move_hitFrame + move_duration - counter + 1)
      yDiff = estOYPos - yChange
      Abs yDiff
      if yDiff <= tempYRange
        scriptVariant = sv_execute_fastfall
        CalcYChange yChange move_IASA YSpeed Gravity MaxFallSpeed FastFallSpeed 1
        Goto checkIfAirViable // fastfall
      endif
      yDiff = STACK_POP // original yDiff
      if yDiff <= tempYRange
        scriptVariant = sv_none
        CalcYChange yChange move_IASA YSpeed Gravity MaxFallSpeed FastFallSpeed 0
        Goto checkIfAirViable // normal
      endif
      
      isORecovering = STACK_POP
    elif Equal AirGroundState 1 && yDiff <= tempYRange
      // handle run for idle ground moves
      if Equal CurrAction hex(0x4)
        $ifMoveRequiresIdleGround()
          label crouchWait
            XGoto PerFrameChecks
            //= XReciever
            Seek crouchWait
            if !(Equal CurrAction hex(0x4))
              skipMainInit = sm_execAttack
              Call MainHub
            endif
            ClearStick
            AbsStick 0 (-0.6)
          Return
        endif
      endif


      CallI ExecuteAttack
    endif
  endif

if counter > 0
  counter -= 1
  SeekNoCommit CHECK_HIT_LOOP
endif

skipMainInit = 0

// MIXES UP AN APPROACH

#let OEndlag = var0
GET_CHAR_TRAIT(OEndlag, chr_get_OEndlag)
PredictOMov immediateTempVar mov_attack LevelValue
if Equal currGoal cg_attack_inCombo || YDistFloor > 35
elif CHANCE_MUL_LE PT_BAITCHANCE 0.04 || immediateTempVar > 0.15 
  if currGoal < cg_edgeguard && OEndlag <= move_hitFrame
    RESET_LTF_STACK_PTR
    globTempVar = LTF_STACK_READ // tempXRange
    Abs move_centerX
    globTempVar += move_centerX
    globTempVar *= 1.5
    
    if !(XDistLE globTempVar)
      LOGSTR_NL str("FORCE DASHDANCE")
      currGoal = cg_bait_dashdance
      lastAttack = -1
      Return
    endif

    if immediateTempVar < 0.075
      IF_AERIAL_ATTACK(var3)
        if move_hitFrame <= 8
          Return
        endif
      elif move_hitFrame <= 13
        Return
      endif
    endif

    GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
    if LevelValue >= LV6 && Equal immediateTempVar 0 && currGoal < cg_edgeguard && OAnimFrame > 8
      predictAverage immediateTempVar man_OXHitDist LevelValue
      if immediateTempVar < 15
        immediateTempVar = 15
      endif
      immediateTempVar *= 2.5
      if XDistLE immediateTempVar
        LOGSTR_NL str("MIXUP?")
        skipMainInit = mainInitSkip
        GetCommitPredictChance anotherTempVar LevelValue
        if anotherTempVar > 0.2 && Rnd < 0.15
          LOGSTR_NL str("FULLHOP AWAY")
          scriptVariant = sv_jump_away + svp_jump_fullhop
          CallI JumpScr
        endif
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
          if anotherTempVar >= 0.25 && immediateTempVar < 0.2
            LOGSTR_NL str("BAIT WAIT")
            scriptVariant = sv_dash_away
            if XDistLE 25
              currGoal = cg_bait_shield
              CallI Shield
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
              LOGSTR_NL str("DASH AWAY")
              scriptVariant = sv_dash_outOfRange
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
endif
Return
label adjustPosIfInGround
  $tempVar(estOYPos, anotherTempVar)
  if OYDistFloor > 0
    immediateTempVar = OTopNY - estOYPos
    if immediateTempVar > OYDistFloor
      estOYPos = OTopNY - OYDistFloor
    endif
  endif
Return
label checkIfAirViable
  $tempVar(yChange, var10)
  immediateTempVar = XSpeed * counter * 1.2
  if Equal scriptVariant sv_execute_fastfall
    immediateTempVar *= 0.5
  endif
  immediateTempVar += OPos
  GetYDistFloorOffset immediateTempVar immediateTempVar 5 0
  if Equal immediateTempVar -1 || Equal YDistFloor -1
    GET_CHAR_TRAIT(anotherTempVar, chr_cs_recoveryDistY)
    anotherTempVar *= -1
    if Equal AirGroundState 2
      globTempVar = OTopNY + OYDistBackEdge
      immediateTempVar = TopNY + yChange
      globTempVar += immediateTempVar
      LOGSTR str("fdist, range")
      LOGVAL globTempVar
      LOGVAL anotherTempVar
      PRINTLN
      if globTempVar > anotherTempVar || !(DangerEnabled)
        CallI ExecuteAttack
      elif Equal scriptVariant sv_none
        lastAttack = -1
      endif
    endif
  elif !(Equal AirGroundState 3)
    CallI ExecuteAttack
  endif
Return
Return