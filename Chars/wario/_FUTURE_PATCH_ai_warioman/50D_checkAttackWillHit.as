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

move_xOffset *= Scale
move_yOffset *= Scale
move_xRange *= Scale
move_yRange *= Scale

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
globTempVar = OAnimFrame - move_hitFrame + move_duration * 0.5
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
#let move_centerX = var0
move_centerX = move_xOffset + move_xRange
if move_centerX < 0
  doesMoveHitBehind = 1
  move_centerX *= -1
endif

#let move_centerY = var1
move_centerY = move_yRange - move_yOffset

// grabs an estimate of the potential move xRange to hit
$ifAerialAttackNotSpecial()
  globTempVar = move_hitFrame + move_duration * 0.25
  if Equal AirGroundState 2
    // get max possilbe air speed
    GetAttribute immediateTempVar attr_airMobilityA 0
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
  else
    GetAttribute immediateTempVar attr_jumpXInitVel 0
    immediateTempVar *= globTempVar
    move_xRange += immediateTempVar
    move_yRange += OHurtboxSize
  endif
endif

immediateTempVar = OHurtboxSize * 0.8
move_yRange += immediateTempVar
immediateTempVar = OWidth * 0.5
move_xRange += immediateTempVar

// if OFramesHitstun < 1
//   GetAttribute immediateTempVar attr_dashInitVel 1
//   PredictOMov anotherTempVar mov_attack
//   anotherTempVar *= immediateTempVar
//   move_xRange += anotherTempVar

//   // immediateTempVar *= anotherTempVar
//   // immediateTempVar *= 2

//   if Equal currGoal cg_attack_wall
//     predictAverage immediateTempVar man_OXHitDist
//     immediateTempVar *= 0.75
//     move_xRange += immediateTempVar
//     move_xRange += Width
//   endif
// endif
// LOGVAL_NL move_xRange

$ifLastOrigin(grab,false)
  if OCurrAction >= hex(0x4A) && OCurrAction <= hex(0x54)
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

// LOGSTR str("XR")
// LOGVAL move_xRange
// LOGSTR str("YR")
// LOGVAL move_yRange
// LOGSTR str("CX")
// LOGVAL move_centerX
// LOGSTR str("CY")
// LOGVAL move_centerY
// PRINTLN

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
  immediateTempVar = LTF_STACK_READ * -1 // move_centerX
  estXPos = TotalXSpeed * estFrame
  globTempVar = 0
  $ifSpecialAttack()
    globTempVar = 1
    immediateTempVar *= OPos
  endif
  $ifAerialAttack()
    if Equal globTempVar 0
      immediateTempVar *= Direction
    endif
    if Equal AirGroundState 1
      GetAttribute globTempVar attr_jumpXVelGroundMult 0
      estXPos *= globTempVar
    endif
  else
    estXPos = 0
  endif
  estXPos += TopNX
  estXPos -= immediateTempVar

  STACK_PUSH estXPos 0
  $tempVar(estYPos, anotherTempVar)
  estYPos = TopNY
  if Equal AirGroundState 1
    $ifAerialAttack()
      GetAttribute immediateTempVar attr_jumpYInitVelShort 0
      globTempVar = TopNY + immediateTempVar
      goalY = TopNY + cs_shortHopHeight - 5
      if globTempVar < OTopNY
        GetAttribute immediateTempVar attr_jumpYInitVel 0
        goalY = TopNY + cs_djumpHeight - 5
      endif
      CalcYChange estYPos estFrame immediateTempVar Gravity MaxFallSpeed FastFallSpeed 0
      estYPos += TopNY
    else
      estYPos = TopNY
    endif
  elif AnimFrame <= 5
    // MARKER THINGY HERE
    CalcYChange estYPos estFrame CharYSpeed Gravity MaxFallSpeed FastFallSpeed 0
    estYPos += TopNY
  else
    EstYCoord estYPos estFrame
  endif
  estYPos -= LTF_STACK_READ // move_centerY
  STACK_PUSH estYPos 0

  // NOTE visualization SELF
  // globTempVar = STACK_POP // YPos
  // immediateTempVar = STACK_POP // XPos
  // // LOGSTR_NL str("POPPED")
  // // LOGVAL_NL immediateTempVar
  // anotherTempVar = 255 - estFrame * 5
  // tempXRange *= 0.5
  // tempYRange *= 0.5
  // DrawDebugRectOutline immediateTempVar globTempVar tempXRange tempYRange 200 255 0 anotherTempVar
  // tempXRange *= 2
  // tempYRange *= 2
  // STACK_PUSH immediateTempVar 0
  // STACK_PUSH globTempVar 0


$tempVar(trueOHBSize,move_xRange)
trueOHBSize = OHurtboxSize * 0.8
// 2. where will defender be at end of frame
  if isORecovering < 0
    $tempVar(estOXPos, anotherTempVar)
    if OCurrAction > hex(0x20) && OAnimFrame > 3
      EstOXCoord estOXPos estFrame
    else
      estOXPos = OTopNX + OTotalXSpeed * estFrame
    endif
    STACK_PUSH estOXPos 0

    $tempVar(estOYPos, anotherTempVar)
    if Equal OAirGroundState 2
      if OAnimFrame <= 3 && !(Equal OYSpeed 0)
        CalcYChange estOYPos estFrame OYSpeed OGravity OMaxFallSpeed OFastFallSpeed 0
        estOYPos += OTopNY
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
    estOYPos += trueOHBSize
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
    estOYPos += trueOHBSize
    STACK_PUSH estOYPos 0
  endif

  // NOTE visualization OTHER
  // globTempVar = STACK_POP // YPos
  // immediateTempVar = STACK_POP // XPos
  // anotherTempVar = 255 - counter * 5
  // DrawDebugRectOutline immediateTempVar globTempVar OWidth trueOHBSize 255 0 255 anotherTempVar
  // // LOGSTR str("popped")
  // // LOGVAL immediateTempVar
  // // PRINTLN
  // STACK_PUSH immediateTempVar 0
  // STACK_PUSH globTempVar 0

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
      Abs immediateTempVar
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
        if AnimFrame < calc(cs_dashForceTurnFrame - 10) || Equal CurrAction hex(0x8) || Equal CurrAction hex(0x9)
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
      // LOGSTR str("y diff")
      // LOGVAL yDiff
      CALC_FASTFALL_DIST(yChange, estFrame)
  
      immediateTempVar = TopNY + yChange - move_centerY
      // VIS FASTFALL
      // tempYRange *= 0.5
      // tempXRange *= 0.5
      // DrawDebugRectOutline OTopNX immediateTempVar tempXRange tempYRange color(0xFF00FFDD)
      // tempYRange *= 2
      // tempXRange *= 2

      yDiff = estOYPos - immediateTempVar
      Abs yDiff
      if yDiff <= tempYRange
        CALC_FASTFALL_DIST(yChange, move_hitFrame + move_duration - counter)
        scriptVariant = sv_execute_fastfall
        CalcYChange yChange move_IASA YSpeed Gravity MaxFallSpeed FastFallSpeed 1
        Goto checkCanEdgeguard
        if immediateTempVar > 0
          Goto checkIfAirViable // fastfall
        endif
      endif
      // LOGSTR str("ff")
      // LOGVAL yDiff
      PRINTLN
      yDiff = STACK_POP // original yDiff
      CalcYChange yChange move_IASA YSpeed Gravity MaxFallSpeed FastFallSpeed 0
      Goto checkCanEdgeguard
      if immediateTempVar < 0
        lastAttack = -1
        Return
      endif
      if yDiff <= tempYRange
        scriptVariant = sv_none
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
  immediateTempVar = XSpeed * counter * 1.2
  if Equal scriptVariant sv_execute_fastfall
    immediateTempVar *= 0.7
  endif
  immediateTempVar += OPos
  GetYDistFloorOffset immediateTempVar immediateTempVar 5 0
  if Equal immediateTempVar -1 || Equal YDistFloor -1 || currGoal >= cg_edgeguard && Equal OYDistFloor -1
    GET_CHAR_TRAIT(anotherTempVar, chr_cs_recoveryDistY)
    anotherTempVar *= -1
    if Equal AirGroundState 2
      globTempVar = OTopNY + OYDistBackEdge
      LOGVAL globTempVar
      immediateTempVar = TopNY + yChange
      globTempVar += immediateTempVar
      if globTempVar > anotherTempVar || !(DangerEnabled)
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