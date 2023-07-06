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
GET_MOVE_DATA(globTempVar, move_xOffset, move_yOffset, move_xRange, move_yRange, move_hitFrame, move_duration, move_IASA, globTempVar, globTempVar, globTempVar, globTempVar)

#let move_centerX = var11
move_centerX = move_xOffset + move_xRange
#let move_centerY = var12
move_centerY = move_yRange - move_yOffset
move_centerY *= -1

// grabs an estimate of the potential move xRange to hit
$ifAerialAttackNotSpecial()
  // get max possilbe air speed
  GetAttribute immediateTempVar attr_airMobilityA 0
  globTempVar = move_hitFrame + move_duration * 0.5
  anotherTempVar = globTempVar * immediateTempVar
  globTempVar = anotherTempVar
  // max possible speed
  anotherTempVar += XSpeed
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
  immediateTempVar = move_hitFrame + move_duration * 0.5
  anotherTempVar *= immediateTempVar
  move_xRange += anotherTempVar
  anotherTempVar *= Direction
  move_centerX += anotherTempVar
  // negative offset
  globTempVar *= immediateTempVar
  move_xRange += globTempVar
  anotherTempVar *= Direction
  move_centerX -= globTempVar
endif



isORecovering = -1
if OCurrAction >= hex(0x100)
  #let REC_KIND = var3
  $tempVar(REC_ACTION, immediateTempVar)
  immediateTempVar = OCurrAction + hex(0x100)
  RetrieveFullATKD REC_KIND immediateTempVar immediateTempVar immediateTempVar immediateTempVar immediateTempVar immediateTempVar immediateTempVar 1
  isORecovering = REC_KIND
endif


globTempVar = move_hitFrame - OAnimFrame
if OCurrAction >= hex(0x4E) && OCurrAction <= hex(0x52) && 26 < globTempVar
  Return
elif OCurrAction >= hex(0x60) && OCurrAction <= hex(0x61) && 19 < globTempVar
  Return
elif OCurrAction >= hex(0x1f) && OCurrAction <= hex(0x20) && 19 < globTempVar // roll
  Return
elif Equal OCurrAction hex(0x1e) || Equal OCurrAction hex(0x8e) || Equal OCurrAction hex(0x90) || Equal OCurrAction hex(0x91)
  if 15 < globTempVar // spotdodge
    Return
  endif
elif Equal OCurrAction hex(0x21) && 29 < globTempVar // airdodge
  Return
elif Equal OCurrSubaction hex(0xD9) || Equal OCurrSubaction hex(0x30)
  if 33 < globTempVar // roll from ledge
    Return
  endif
elif Equal OCurrSubaction hex(0xDE) || Equal OCurrSubaction hex(0xDD)
  if 61 < globTempVar // roll from ledge SLOW
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
immediateTempVar = OHurtboxSize
move_centerY += immediateTempVar
move_xRange += OWidth
immediateTempVar = OWidth * 0.25
move_centerX -= immediateTempVar

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
  anotherTempVar = move_xRange + move_xOffset
  anotherTempVar -= Width
  if anotherTempVar > 0
    move_xRange += anotherTempVar
  elif True
    GetAttribute immediateTempVar attr_dashInitVel 1
    immediateTempVar *= move_IASA
    immediateTempVar -= OWidth
    immediateTempVar *= 0.5
    move_xRange += immediateTempVar
  endif
  // immediateTempVar *= 0.5
  // move_yRange += immediateTempVar
  // move_yOffset += immediateTempVar
endif

IF_AERIAL_ATTACK(var3)
  if Equal AirGroundState 1
    move_xRange += 5
    // move_xOffset -= 5
  endif
endif

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

#let tempGoalX = var2
#let tempGoalY = var3
#let tempXRange = var4
#let tempYRange = var5
#let counter = var8

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

      xDiff = xDiff - XSpeed * (AnimFrame - cs_dashForceTurnFrame)
      Abs xDiff
      if xDiff <= tempXRange && yDiff <= tempYRange
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

    anotherTempVar = xDiff - cs_wavedashDist
    immediateTempVar = OXSpeed
    Abs immediateTempVar
    if anotherTempVar <= tempXRange && immediateTempVar <= tempYRange && currGoal < cg_edgeguard
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


      Goto updateGoals
      CallI ExecuteAttack
    endif
  endif

if counter > 0
  counter -= 1
  SeekNoCommit CHECK_HIT_LOOP
endif

skipMainInit = 0
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
  globTempVar = OPos * 10
  immediateTempVar += globTempVar
  GetYDistFloorOffset immediateTempVar immediateTempVar 5 0
  if Equal immediateTempVar -1 || Equal YDistFloor -1
    if OXDistBackEdge > 20 && OYDistBackEdge > 15
      GET_CHAR_TRAIT(anotherTempVar, chr_cs_recoveryDistY)
      anotherTempVar *= -1
    else
      anotherTempVar = calc(cs_djumpHeight * -1 + 10)
    endif
    if Equal AirGroundState 2
      globTempVar = OTopNY + OYDistBackEdge
      immediateTempVar = TopNY + yChange
      globTempVar += immediateTempVar
      LOGSTR str("fdist, range")
      LOGVAL globTempVar
      LOGVAL anotherTempVar
      PRINTLN
      if globTempVar > anotherTempVar || !(DangerEnabled)
        Goto updateGoals
        CallI ExecuteAttack
      elif Equal scriptVariant sv_none
        lastAttack = -1
      endif
    endif
  elif Equal AirGroundState 2
    Goto updateGoals
    CallI ExecuteAttack
  endif
Return
label updateGoals
  // #let estOYPos = var9
  // #let estOXPos = var12

  // goalX = estOXPos
  // immediateTempVar = move_xOffset * OPos * -0.5
  // $ifAerialAttackNotSpecial()
  //   immediateTempVar *= Direction
  // endif
  // goalX -= immediateTempVar

  // goalY = estOYPos
  // goalY -= move_yOffset
  // goalY -= OHurtboxSize
Return
Return