#include <Definition_AIMain.h>
id 0x850D
unk 0x0

//= XReciever

RESET_LTF_STACK_PTR

// $setLastAttack(nspecialair)
// currGoal = cg_attack_wall

// where will attacker be at end of frame
// where will defender be at end of frame
// apply positional offset to defender position
// check to see if move will hit if swung now

// CLEAR VARIABLES:
// 9, 10, 11, 12

// $setLastAttack(dtilt)

#let move_xOffset = var0
#let move_yOffset = var1
#let move_xRange = var10
#let move_yRange = var9
#let move_hitFrame = var7
#let move_duration = var15
#let move_IASA = var6
#let isORecovering = var16
#let doesMoveHitBehind = var16
#let shouldBeFalling = var18

GET_MOVE_DATA(globTempVar, move_xOffset, move_yOffset, move_xRange, move_yRange, move_hitFrame, move_duration, move_IASA, globTempVar, globTempVar, globTempVar, globTempVar)
doesMoveHitBehind = 0

LOGSTR str("1")
LOGVAL move_xRange

if Equal currGoal cg_attack_wall
  GET_CHAR_TRAIT(immediateTempVar, chr_get_OEndlag)
  GetAttribute anotherTempVar attr_dashInitVel fromOpponent
  globTempVar = move_IASA
  globTempVar -= immediateTempVar
  globTempVar *= anotherTempVar
  if XDistLE globTempVar
    currGoal = cg_attack_reversal
    XGoto CalcAttackGoal
  endif
endif

if move_duration > 10
  move_duration = 10
endif

move_xOffset *= Scale
move_yOffset *= Scale
move_xRange *= Scale
move_yRange *= Scale

LOGSTR str("2")
LOGVAL move_xRange

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
globTempVar = OAnimFrame + move_hitFrame
if OCurrAction >= hex(0x4E) && OCurrAction <= hex(0x52) && globTempVar < 26
  Return
elif OCurrAction >= hex(0x60) && OCurrAction <= hex(0x61) && globTempVar < 19
  Return
elif OCurrAction >= hex(0x1f) && OCurrAction <= hex(0x20) && globTempVar < 19 // roll
  Return
elif Equal OCurrAction hex(0x1e) || Equal OCurrAction hex(0x8e) || Equal OCurrAction hex(0x90) || Equal OCurrAction hex(0x91)
  if globTempVar < 15 // spotdodge
    Return
  endif
elif Equal OCurrAction hex(0x21) && globTempVar < 29 // airdodge
  Return
elif Equal OCurrSubaction hex(0xD9) || Equal OCurrSubaction hex(0x30)
  if globTempVar < 33 // roll from ledge
    Return
  endif
elif Equal OCurrSubaction hex(0xDE) || Equal OCurrSubaction hex(0xDD)
  if globTempVar < 61 // roll from ledge SLOW
    Return
  endif
endif

// 3. setup ranges
#let move_centerX = var0
move_centerX = move_xRange + move_xOffset 
if move_centerX < 0
  doesMoveHitBehind = 1
  move_centerX *= -1
endif
immediateTempVar = OWidth * 0.5
// move_centerX += immediateTempVar
// move_xRange += immediateTempVar
// move_centerX -= 2

#let move_centerY = var1
// move_yRange -= 2
move_centerY = move_yRange - move_yOffset
move_centerY *= -1
immediateTempVar = OHurtboxSize * 0.5
// move_centerY += immediateTempVar
// move_yRange += immediateTempVar

// move_centerY += HurtboxSize

shouldBeFalling = 0
immediateTempVar = HurtboxSize * 0.9
if move_centerY > immediateTempVar && OTopNY < TopNY
  shouldBeFalling = 1
  LOGSTR_NL str("SHOULD B FALLING")
  LOGVAL_NL immediateTempVar
  LOGVAL_NL move_centerY
endif

// move_centerY += 2
move_xRange *= 2
move_yRange *= 2
// move_xRange -= 2
// move_yRange -= 2

LOGSTR str("3")
LOGVAL move_xRange

#let move_offsetMod = var2
GET_CHAR_TRAIT(move_offsetMod, chr_calc_moveOffset)

// grabs an estimate of the potential move xRange to hit
// $ifAerialAttackNotSpecial()
//   globTempVar = move_hitFrame + move_duration * 0.25
//   globTempVar *= 0.15
//   if Equal AirGroundState 2
//     // get max possilbe air speed
//     GetAttribute immediateTempVar attr_airMobilityA 0
//     anotherTempVar = globTempVar * immediateTempVar
//     globTempVar = anotherTempVar
//     // max possible speed
//     anotherTempVar += XSpeed
//     Abs anotherTempVar
//     // min possible speed
//     globTempVar -= XSpeed
//     Abs globTempVar
//     // clamp by term vel
//     GetAttribute immediateTempVar attr_airXTermVel 0
//     if anotherTempVar > immediateTempVar
//       anotherTempVar = immediateTempVar
//     endif
//     if globTempVar > immediateTempVar
//       globTempVar = immediateTempVar
//     endif
//     // positive offset
//     immediateTempVar = move_hitFrame + move_duration * 0.25
//     immediateTempVar *= 0.15
//     anotherTempVar *= immediateTempVar
//     move_xRange += anotherTempVar
//     anotherTempVar *= Direction * 2
//     move_centerX -= anotherTempVar
//     // negative offset
//     globTempVar *= immediateTempVar
//     move_xRange += globTempVar
//     globTempVar *= Direction * 2
//     move_centerX += globTempVar
//   elif !(Equal CurrAction hex(0xA))
//     GetAttribute immediateTempVar attr_jumpXInitVel 0
//     immediateTempVar *= globTempVar
//     move_xRange += immediateTempVar
//     move_yRange += OHurtboxSize
//   endif
// endif

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
//   immediateTempVar = move_xOffset * 0.25 - move_xRange * 0.8
//   if XDistLE immediateTempVar
//     lastAttack = -1
//     Return
//   endif
// endif

// anotherTempVar = TopNX + move_centerX
// immediateTempVar = OCenterX - anotherTempVar
// anotherTempVar = OWidth * 0.5
// Abs immediateTempVar
// if immediateTempVar > anotherTempVar
//   immediateTempVar = anotherTempVar
// endif
// move_centerX += immediateTempVar

$ifSpecialAttack() 
  Abs move_centerX
elif Equal AirGroundState 1
  if move_centerX < 0 && OPos < 0
  elif move_centerX > 0 && OPos > 0
  else
    move_centerX *= -1
  endif
elif doesMoveHitBehind > 0
  move_centerX *= -1
endif

// immediateTempVar = OHurtboxSize * 0.5
// move_yRange += immediateTempVar
// immediateTempVar *= 0.5
// move_centerY -= immediateTempVar

// LOGSTR str("OHBS")
// LOGVAL OHurtboxSize
// PRINTLN

// immediateTempVar = OWidth
// immediateTempVar *= 0.3
// move_xRange += immediateTempVar
// move_centerX += immediateTempVar
// immediateTempVar *= 0.5

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

LOGSTR_NL str("outside-chk")
GET_CHAR_TRAIT(immediateTempVar, chr_get_OEndlag)
if immediateTempVar < 5 && currGoal < cg_edgeguard //&& Equal DEBUG_VALUE 0 
  LOGSTR_NL str("inside-chk")
  globTempVar = OTopNY + OHurtboxSize
  anotherTempVar = TopNY - move_yOffset
  // $ifAerialAttack()
  if globTempVar < anotherTempVar && Equal AirGroundState 1
    lastAttack = -1
    Return  
  endif

  if !(Equal currGoal cg_attack_wall) && !(Equal currGoal cg_attack_shieldPunish)
    LOGSTR_NL str("adjusting")
    move_offsetMod *= 0.5
    anotherTempVar = move_offsetMod
    Abs anotherTempVar
    move_xRange += anotherTempVar
    move_centerX += move_offsetMod
  endif

  // GetAttribute immediateTempVar attr_dashInitVel 1
  // PredictOMov anotherTempVar mov_attack
  // anotherTempVar *= immediateTempVar
  // move_xRange += anotherTempVar

  // immediateTempVar *= anotherTempVar
  // immediateTempVar *= 2

  if Equal currGoal cg_attack_wall
    predictAverage immediateTempVar man_OXHitDist
    immediateTempVar *= 0.75
    move_xRange += immediateTempVar
    move_xRange += Width
  endif
endif

LOGSTR str("4")
LOGVAL move_xRange
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

#let counter = var8

// adjust difficulty
if LevelValue <= LV3
  immediateTempVar = Rnd * 80 - 40
  move_hitFrame += immediateTempVar
  immediateTempVar = Rnd * 80 - 40
  move_centerX += immediateTempVar
  immediateTempVar = Rnd * 80 - 40
  move_centerY += immediateTempVar
  immediateTempVar = Rnd * 30 - 5
  move_xRange += immediateTempVar
  immediateTempVar = Rnd * 30 - 5
  move_yRange += immediateTempVar
elif LevelValue <= LV7
  immediateTempVar = Rnd * 26 - 13
  move_centerX += immediateTempVar
  immediateTempVar = Rnd * 26 - 13
  move_centerY += immediateTempVar
  immediateTempVar = Rnd * 10 - 5
  move_xRange += immediateTempVar
  immediateTempVar = Rnd * 10 - 5
  move_yRange += immediateTempVar
endif

move_hitFrame += 1
counter = move_duration

// anotherTempVar = OHurtboxSize * 0.25
// move_yRange += anotherTempVar

LOGSTR str("xRange")
LOGVAL move_xRange
PRINTLN
STACK_PUSH move_xRange 1
STACK_PUSH move_yRange 1
STACK_PUSH move_centerX 1

immediateTempVar = 0
$ifAerialAttack()
  immediateTempVar = TotalYSpeed
  if OTopNY >= TopNY
    if Equal AirGroundState 1 || YDistFloor < 2 && YDistFloor > 0
      // LOGSTR_NL str("AAT AGS1")
      GetAttribute immediateTempVar attr_jumpYInitVelShort 0
      // globTempVar = TopNY + immediateTempVar //- move_centerY
      goalY = TopNY + cs_shortHopHeight - 1
      // anotherTempVar = move_yRange * 0.5
      // goalY += anotherTempVar
      EstOYCoord anotherTempVar move_hitFrame
      if goalY < anotherTempVar
        // LOGSTR_NL str("BIGJUMP")
        GetAttribute immediateTempVar attr_jumpYInitVel 0
        goalY = TopNY + cs_jumpHeight - 1
      endif
    elif Equal AirGroundState 2 && TotalYSpeed < 0.7 && NumJumps > 0
      // LOGSTR_NL str("AAT ELSE")
      GetAttribute immediateTempVar attr_jumpYInitVel 0
      GetAttribute anotherTempVar attr_airJumpYMult 0
      immediateTempVar *= anotherTempVar
      EstOYCoord globTempVar move_hitFrame
      anotherTempVar = TopNY + cs_djumpHeight //- move_centerY
      globTempVar -= calc(cs_djumpHeight * 0.5)
      if anotherTempVar > globTempVar && NumJumps > 0 && OTopNY > TopNY
        goalY = anotherTempVar + 4
        // goalY += move_centerY
      elif currGoal >= cg_edgeguard && YDistBackEdge > calc(cs_djumpHeight - 8)
        goalY = anotherTempVar + 4
        // goalY += move_centerY
        goalX = TopNX
      endif
      immediateTempVar = TotalYSpeed
    endif
  endif
endif
STACK_PUSH immediateTempVar 1

// anotherTempVar = TopNY + move_centerY
// immediateTempVar = OCenterY - anotherTempVar
// if immediateTempVar > OHurtboxSize
//   immediateTempVar = OHurtboxSize
// elif immediateTempVar < 0
//   immediateTempVar = 0
// endif
// immediateTempVar *= 0.5

// move_centerY += immediateTempVar
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
  if REC_KIND >= 0
    move_offsetMod = 0
  endif
endif

#let tempGoalX = var2
#let tempGoalY = var3
#let tempXRange = var4
#let tempYRange = var5

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
// LOGSTR str("ef; c; hf")
// LOGVAL estFrame
// LOGVAL counter
// LOGVAL move_hitFrame
// PRINTLN

// 1. where will attacker be at end of frame
  $tempVar(estXPos, anotherTempVar)
  immediateTempVar = LTF_STACK_READ * -1 // move_centerX
  globTempVar = 0
  $ifSpecialAttack()
    globTempVar = 1
    immediateTempVar *= OPos
  endif
  $ifAerialAttack()
    if Equal globTempVar 0
      immediateTempVar *= Direction
    endif
  endif
  estXPos = TopNX
  {SELF_X_ADJUST}
  estXPos -= immediateTempVar // move_centerX
  STACK_PUSH estXPos 0
  $tempVar(estYPos, anotherTempVar)
  estYPos = TopNY
  immediateTempVar = LTF_STACK_READ // estYVelocity
  {SELF_Y_ADJUST}
  // LOGSTR str("ypos bef; aft")
  // LOGVAL estYPos
  estYPos += LTF_STACK_READ // move_centerY
  // LOGVAL estYPos
  // PRINTLN
  STACK_PUSH estYPos 0

  // NOTE visualization SELF
  globTempVar = STACK_POP // YPos
  immediateTempVar = STACK_POP // XPos
  // LOGSTR_NL str("POPPED")
  // LOGVAL_NL immediateTempVar
  anotherTempVar = estFrame * -5 + 255
  DrawDebugRectOutline immediateTempVar globTempVar tempXRange tempYRange 200 255 0 anotherTempVar
  STACK_PUSH immediateTempVar 0
  STACK_PUSH globTempVar 0


// $tempVar(trueOHBSize,move_xRange)
// trueOHBSize = 0
// if Equal OAirGroundState 2
//   $ifAerialAttack()
//     trueOHBSize = OHurtboxSize + HurtboxSize
//     trueOHBSize *= 0.5
//   endif
// endif
// 2. where will defender be at end of frame
  if isORecovering < 0
    $tempVar(estOXPos, anotherTempVar)
    if OCurrAction > hex(0x20) && OAnimFrame > 3
      EstOXCoord estOXPos estFrame
    else
      estOXPos = OCenterX + OTotalXSpeed * estFrame
    endif

    // if OYDistBackEdge > 20
    //   estOXPos = OTopNX
    // endif

    STACK_PUSH estOXPos 0
    
    $tempVar(estOYPos, anotherTempVar)
    if Equal OAirGroundState 2
      anotherTempVar = estFrame
      if OAnimFrame <= 3 && !(Equal OYSpeed 0)
        CalcYChange estOYPos anotherTempVar OCharYSpeed OGravity OMaxFallSpeed OFastFallSpeed 0
        estOYPos += OCenterY
        // immediateTempVar = OHurtboxSize
        // estOYPos += immediateTempVar
      else
        EstOYCoord estOYPos anotherTempVar
        immediateTempVar = OHurtboxSize * 0.5
        estOYPos += immediateTempVar
      endif
    else
      estOYPos = OCenterY
    endif
    // if OYDistBackEdge > 5
    //   if estOYPos < 0
    //     estOYPos = 0
    //   endif
    //   tempYRange += estOYPos
    // endif
    Goto adjustPosIfInGround
    // estOYPos += trueOHBSize
    // estOYPos += OHurtboxSize
    STACK_PUSH estOYPos 0
  elif True
    $tempVar(estOXPos, immediateTempVar)
    $tempVar(estOYPos, anotherTempVar)
    immediateTempVar = OCenterX
    anotherTempVar = OCenterY
    globTempVar = estFrame
    O_RECOVERY_POSITION(immediateTempVar, anotherTempVar, globTempVar)

    if OYDistBackEdge > 20
      estOXPos = OTopNX
    endif
    
    STACK_PUSH estOXPos 0
    Goto adjustPosIfInGround
    // estOYPos += OHurtboxSize
    STACK_PUSH estOYPos 0
  endif

  // NOTE visualization OTHER
  globTempVar = STACK_POP // YPos
  immediateTempVar = STACK_POP // XPos
  anotherTempVar = estFrame * -5 + 255
  DrawDebugRectOutline immediateTempVar globTempVar OWidth OHurtboxSize 255 0 255 anotherTempVar
  // LOGSTR str("est O yPos")
  // LOGVAL estFrame
  // LOGVAL globTempVar
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
  // estOXPosOffs = OCenterX - goalX
  // estOXPosOffs += STACK_POP // estOXPos
  // STACK_PUSH estOXPosOffs 0
  // STACK_PUSH estOYPosOffs 0

// check to see if move will hit if swung now
  #let estOYPos = var9
  estOYPos = STACK_POP // estOYPos

  #let xDiff = var10
  xDiff = STACK_POP // estOXPos

  if Equal OCurrAction hex(0x45) || Equal OCurrAction hex(0x49)
    GetYDistFloorAbsPos anotherTempVar xDiff estOYPos
    if anotherTempVar < 3 && anotherTempVar > 0
      estOYPos = TBoundary * 2
    endif
  endif

  #let yDiff = var11
  // LOGSTR str("est oyp")
  // LOGVAL estOYPos
  // anotherTempVar = STACK_POP
  // LOGSTR str("est y pos")
  // LOGVAL anotherTempVar
  // yDiff = estOYPos - anotherTempVar // estYPos
  // Abs yDiff
  // PRINTLN
  yDiff = estOYPos - STACK_POP // estYPos
  Abs yDiff

  // tempXRange *= 1
  // tempYRange *= 1

  // LOGSTR_NL str("xR; yR; yD")
  // LOGVAL tempXRange
  // LOGVAL tempYRange
  // LOGVAL yDiff
  // PRINTLN

  anotherTempVar = OWidth * 0.5
  tempXRange += anotherTempVar
  anotherTempVar = OHurtboxSize * 0.5
  tempYRange += anotherTempVar
  tempXRange *= 0.5
  tempYRange *= 0.5

  globTempVar = xDiff + OTotalXSpeed * 12 // wavedash lag

  #let estOXPos = var12
  estOXPos = STACK_POP // estXPos
  xDiff -= estOXPos
  Abs xDiff
  // handle dash for idle ground moves:
  $ifMoveRequiresIdleGround()
    anotherTempVar = TopNX + cs_wavedashDist * OPos
    immediateTempVar = globTempVar - anotherTempVar
    Abs immediateTempVar
    if immediateTempVar <= tempXRange && xDiff > tempXRange && yDiff <= tempYRange && currGoal < cg_edgeguard && LevelValue >= LV7
      GetAttribute immediateTempVar attr_groundFriction fromSelf
      if Equal CurrAction hex(0x4) && immediateTempVar <= 0.6 && CHANCE_MUL_GE immediateTempVar 1.35 
        scriptVariant = sv_wavedash_goal
        skipMainInit = mainInitSkip
        CallI Wavedash
      elif Equal CurrAction hex(0x3) || Equal CurrAction hex(0x8) || Equal CurrAction hex(0x9)
        if AnimFrame < calc(cs_dashForceTurnFrame - 7) || Equal CurrAction hex(0x8) || Equal CurrAction hex(0x9) || !(Equal Direction OPos)
          scriptVariant = sv_wavedash_goal
          skipMainInit = sm_execAttack
          CallI Wavedash 
        endif
      endif
    endif

    if Equal CurrAction hex(0x3) && LevelValue >= LV4
      // STACK_TOSS 1 // ignore estXPos
      anotherTempVar = TopNX + TotalXSpeed * (AnimFrame - cs_dashForceTurnFrame + 2)
      immediateTempVar = globTempVar - anotherTempVar
      Abs immediateTempVar
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
  endif
    
  // LOGSTR str("xD")
  // LOGVAL xDiff
  // PRINTLN
  // tempYRange *= 0.5  
  if xDiff < tempXRange
    IF_AERIAL_ATTACK(var3)
      $tempVar(yChange, xDiff)
      Abs yDiff
      STACK_PUSH isORecovering st_function
      STACK_PUSH yDiff 0
      // LOGSTR str("y diff")
      // LOGVAL yDiff
      if !(Equal OYSpeed 0) || !(Equal OAirGroundState 2)
        {FASTFALL_CHECK}
      endif
      // LOGSTR str("ff")
      // LOGVAL yDiff
      // PRINTLN
      yDiff = STACK_POP // original yDiff
      anotherTempVar = YSpeed 
      if Equal AirGroundState 1
        GetAttribute anotherTempVar attr_jumpYInitVelShort fromSelf
      endif
      yChange = YDistFloor + 1
      {UNAFFECTED_Y_MOVES}
      elif True
        CalcYChange yChange estFrame anotherTempVar Gravity MaxFallSpeed FastFallSpeed 0
      endif
      anotherTempVar = HurtboxSize * 0.5
      immediateTempVar = yChange + YDistFloor + anotherTempVar
      // LOGSTR str("YDF; ATV")
      // LOGVAL YDistFloor
      // LOGVAL immediateTempVar
      // PRINTLN
      if yChange > 0 && Equal shouldBeFalling 1
      elif immediateTempVar > 0 || YDistFloor < 0
        CalcYChange yChange move_IASA TotalYSpeed Gravity MaxFallSpeed FastFallSpeed 0
        Goto checkCanEdgeguard
        if immediateTempVar < 0
          if NumJumps < 1
            lastAttack = -1
          endif
          Return
        endif
        // LOGSTR str("YDiff; YRange")
        // LOGVAL yDiff
        // LOGVAL tempYRange
        // PRINTLN
        if yDiff <= tempYRange
          scriptVariant = sv_none
          Goto checkIfAirViable // normal
        endif
      endif
      
      isORecovering = STACK_POP
    elif Equal AirGroundState 1 && yDiff <= tempYRange
      // handle run for idle ground moves
      if Equal CurrAction hex(0x4) || Equal CurrAction hex(0x3) 
        $ifMoveRequiresIdleGround()
          label crouchWait
            XGoto PerFrameChecks
            //= XReciever
            Seek crouchWait
            if CurrAction < hex(0x3) || CurrAction > hex(0x4)
              // skipMainInit = sm_execAttack
              CallI ExecuteAttack
            endif
            ClearStick
            if Equal CurrAction hex(0x4)
              Stick 0 -1
            else  
              Stick 1
            endif
          Return
        endif
      endif

      CallI ExecuteAttack
    endif
  endif

if counter > 0
  counter -= 2
  SeekNoCommit CHECK_HIT_LOOP
endif

skipMainInit = 0

// MIXES UP AN APPROACH

// #let OEndlag = var0
// GET_CHAR_TRAIT(OEndlag, chr_get_OEndlag)
// PredictOMov immediateTempVar mov_attack

// anotherTempVar = LevelValue + 2
// immediateTempVar = Rnd * anotherTempVar

// if YDistFloor > 35 || LevelValue < LV4 || immediateTempVar < 2.5
// elif CHANCE_MUL_LE PT_BAITCHANCE 0.02 || immediateTempVar > 0.25
//   if currGoal < cg_attack_reversal && OEndlag <= move_hitFrame
//     RESET_LTF_STACK_PTR
//     globTempVar = LTF_STACK_READ // tempXRange
//     Abs move_centerX
//     globTempVar += move_centerX
//     globTempVar *= 2.5
    
//     if !(XDistLE globTempVar)
//       PRINTLN
//       // LOGSTR_NL str("FORCE DASHDANCE")
//       // LOGVAL_NL globTempVar
//       globTempVar = TopNX - OCenterX
//       Abs globTempVar
//       LOGVAL_NL globTempVar
//       // currGoal = cg_bait_dashdance
//       scriptVariant = sv_dash_away_defense
//       Call DashScr
//       // lastAttack = -1
//       Return
//     endif

//     // if immediateTempVar < 0.075
//     //   IF_AERIAL_ATTACK(var3)
//     //     if move_hitFrame <= 8
//     //       Return
//     //     endif
//     //   elif move_hitFrame <= 13
//     //     Return
//     //   endif
//     // endif

//     GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
//     if LevelValue >= LV6 && Equal immediateTempVar 0 && currGoal < cg_edgeguard && OAnimFrame > 8
//       predictAverage immediateTempVar man_OXSwingDist
//       if immediateTempVar < 15
//         immediateTempVar = 15
//       endif
//       immediateTempVar *= 2.5
//       if XDistLE immediateTempVar
//         LOGSTR_NL str("MIXUP?")
//         skipMainInit = mainInitSkip
//         GetCommitPredictChance anotherTempVar
//         if anotherTempVar > 0.13 && Rnd < 0.15
//           LOGSTR_NL str("FULLHOP AWAY")
//           scriptVariant = sv_jump_away + svp_jump_fullhop
//           CallI JumpScr
//         endif
//         if Rnd < 0.35 && CHANCE_MUL_LE PT_BAITCHANCE 0.04
//           LOGSTR_NL str("FIRST")
//           if CHANCE_MUL_LE PT_BAITCHANCE 0.6
//             scriptVariant = sv_wavedash_neutral
//             if Equal AirGroundState 2 && AnimFrame > 6
//               if YDistFloor <= 5
//                 scriptVariant = sv_wavedash_out
//               elif YSpeed < 0.5 && NumJumps > 0
//                 LOGSTR_NL str("JUMP OVER 1")
//                 scriptVariant = sv_jump_over + svp_jump_fullhop
//                 lastAttack = -1
//                 CallI JumpScr
//               endif
//             elif XDistLE 20
//               scriptVariant = sv_wavedash_out
//             endif
//             CallI Wavedash
//           endif
//           scriptVariant = sv_dash_away
//           currGoal = cg_attack_reversal
//           CallI DashScr
//           Return
//         endif

//         GetCommitPredictChance anotherTempVar
//         LOGVAL anotherTempVar
//         if Equal AirGroundState 1 && CHANCE_MUL_LE PT_BAITCHANCE 0.04
//           LOGSTR_NL str("CHK BAIT")
//           PredictOMov immediateTempVar mov_shield
//           if anotherTempVar >= 0.15 && immediateTempVar < 0.10
//             LOGSTR_NL str("BAIT WAIT")
//             if XDistLE 25
//               currGoal = cg_bait_wait
//               Return
//             else
//               scriptVariant = sv_wavedash_out
//               CallI Wavedash
//             endif
//           endif
//         endif
//         LOGVAL anotherTempVar
//         if anotherTempVar < 0.15 && Rnd < 0.4 || anotherTempVar > 0.25 && Rnd < 0.4
//           immediateTempVar = OPos * 40
//           GetYDistFloorOffset immediateTempVar immediateTempVar 15 1
//           if immediateTempVar > 0
//             // if CHANCE_MUL_LE PT_BRAVECHANCE 0.2
//             //   LOGSTR_NL str("DASH AWAY")
//             //   scriptVariant = sv_dash_outOfRange
//             //   // lastAttack = -1
//             //   CallI DashScr
//             // el
//             if CHANCE_MUL_LE PT_AGGRESSION 0.2 && AnimFrame > 6
//               LOGSTR_NL str("JUMP OVER FULL")
//               currGoal = cg_attack_shieldPunish
//               scriptVariant = sv_jump_over + svp_jump_fullhop
//               // lastAttack = -1
//               CallI JumpScr
//             endif
//             // currGoal = cg_bait_shield
//           endif
//           Return
//         endif
//       endif
//     endif
//   endif
// endif
Return
label adjustPosIfInGround
  $tempVar(estOYPos, anotherTempVar)
  if OYDistFloor > 0
    immediateTempVar = OSCDBottom - estOYPos
    if immediateTempVar > OYDistFloor
      estOYPos = OSCDBottom - OYDistFloor
    endif
  endif
Return
label checkCanEdgeguard
  $tempVar(yChange, var10)
  immediateTempVar = TotalXSpeed * counter * 1.2
  if Equal scriptVariant sv_execute_fastfall
    immediateTempVar *= 0.7
  endif
  anotherTempVar = OPos * 10
  immediateTempVar += anotherTempVar
  GetYDistFloorOffset immediateTempVar immediateTempVar 5 0
  anotherTempVar = goalY + 10
  GetYDistFloorAbsPos anotherTempVar goalX anotherTempVar
  if Equal immediateTempVar -1 || Equal anotherTempVar -1 || Equal YDistFloor -1 || currGoal >= cg_edgeguard && Equal OYDistFloor -1
    GET_CHAR_TRAIT(anotherTempVar, chr_cs_recoveryDistY)
    anotherTempVar -= HurtboxSize
    anotherTempVar *= -1
    if Equal AirGroundState 2
      globTempVar = OTopNY + OYDistBackEdge
      // LOGVAL yChange
      immediateTempVar = TopNY + yChange
      globTempVar += immediateTempVar
      // LOGSTR str("fdist, range")
      // LOGVAL globTempVar
      // LOGVAL anotherTempVar
      // DrawDebugLine TopNX TopNY TopNX globTempVar color(0xFF0000DD)
      // DrawDebugRectOutline TopNX anotherTempVar 50 2 color(0xFF0000DD)
      // PRINTLN
      if globTempVar > anotherTempVar
      else
        immediateTempVar = -1
        Return
      endif
    endif
  endif
  immediateTempVar = 1
Return
label checkIfAirViable
  if Equal CurrAction hex(0xA)
  elif Equal AirGroundState 1
    $tempVar(moveDir,immediateTempVar)
    GET_CHAR_TRAIT(moveDir, chr_get_moveDir)
    $ifSpecialAttack()
      if NoJumpPrevFrame
        Button X
      endif
    elif Equal moveDir -1 && Equal Direction OPos
      scriptVariant = sv_noNavigation
      ClearStick
      Stick -1
    elif !(Equal moveDir -1) && !(Equal Direction OPos)
      scriptVariant = sv_noNavigation
      ClearStick
      Stick -1
    elif NoJumpPrevFrame
      Button X
    endif
  elif !(Equal AirGroundState 3)
    CallI ExecuteAttack
  endif
Return
Return