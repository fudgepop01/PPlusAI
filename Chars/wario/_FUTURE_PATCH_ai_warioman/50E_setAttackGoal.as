#include <Definition_AIMain.h>
id 0x850E
unk 0x0

//= XReciever
Cmd30
NoRepeat

anotherTempVar = 1
if OCurrAction >= hex(0x4D) && OCurrAction <= hex(0x52)
  anotherTempVar = 0
elif OCurrAction >= hex(0x60) && OCurrAction <= hex(0x61)
  anotherTempVar = 0
endif
globTempVar = 30 - LevelValue * 0.021
if Equal anotherTempVar 0 && OAnimFrame < globTempVar
  Return
endif


// updateOffset = (1 - (LevelValue / 100)) * 30 + 1
// MOD updateOffset AnimFrame updateOffset
// updateOffset = 0

#let move_xOffset = var11
#let move_yOffset = var10
#let move_xRange = var9
#let move_yRange = var8
#let move_hitFrame = var7
#let move_duration = var0
#let move_damage = var2
GET_MOVE_DATA(globTempVar, move_xOffset, move_yOffset, move_xRange, move_yRange, move_hitFrame, move_duration, globTempVar, move_damage, globTempVar, globTempVar, globTempVar)
move_xOffset *= Scale
move_yOffset *= Scale
move_xRange *= Scale
move_yRange *= Scale

if move_damage <= 0
  goalX = TopNX
  if OYDistFloor > 0
    goalX = OTopNX
    predictAverage immediateTempVar man_OXHitDist
    immediateTempVar += 10
    immediateTempVar *= OPos
    goalX -= immediateTempVar
    GetYDistFloorAbsPos immediateTempVar goalX TopNY
    if immediateTempVar < 0
      goalX = OTopNX
    endif
  endif
  goalY = TopNY
  Return
endif
$ifLastOrigin(grab,false)
  move_duration = 1
endif

// #let shouldOffsetRes = var2
// Goto shouldOffset
// shouldOffsetRes = anotherTempVar

#let isORecovering = var12
isORecovering = -1
if OCurrAction >= hex(0x100)
  #let REC_KIND = var3
  $tempVar(REC_ACTION, immediateTempVar)
  immediateTempVar = OCurrAction + hex(0x100)
  RetrieveFullATKD REC_KIND immediateTempVar immediateTempVar immediateTempVar immediateTempVar immediateTempVar immediateTempVar immediateTempVar 1
  if REC_KIND >= 0
    move_hitFrame += move_duration
    // shouldOffsetRes = 0
    isORecovering = REC_KIND
  endif
endif

globTempVar = move_hitFrame

if OFramesHitstun > 0 && OFramesHitstun < move_hitFrame
  move_hitFrame = OFramesHitstun
endif

IF_AERIAL_ATTACK(var3)
  if Equal AirGroundState 1
    GetAttribute anotherTempVar attr_jumpSquatFrames 0
    move_hitFrame += anotherTempVar
  endif
endif
// globTempVar *= 0.5

if isORecovering < 0
  $tempVar(estOXPos, anotherTempVar)
  if OCurrAction > hex(0x20) && OAnimFrame > 3
    EstOXCoord estOXPos move_hitFrame
  else
    estOXPos = OTopNX + OTotalXSpeed * move_hitFrame
  endif
  goalX = estOXPos

  $tempVar(estOYPos, anotherTempVar)
  if Equal OAirGroundState 2
    if OAnimFrame <= 3 && !(Equal OYSpeed 0)
      estOYPos = OYCoord + OTotalYSpeed * move_hitFrame - OGravity * move_hitFrame * move_hitFrame
    else
      EstOYCoord estOYPos move_hitFrame
    endif
  else

    GetAttribute immediateTempVar attr_dashInitVel 1
    PredictOMov anotherTempVar mov_attack
    anotherTempVar *= immediateTempVar
    anotherTempVar *= OPos * -1
    if Equal currGoal cg_attack_wall || Equal currGoal cg_bait_attack 
      goalX += anotherTempVar
    endif
    goalX += anotherTempVar
    
    estOYPos = OTopNY
    PredictOMov immediateTempVar mov_jump
    PredictOMov globTempVar mov_djump
    if globTempVar > 0.65
      if ONumJumps > 0
        GetAttribute immediateTempVar attr_jumpYInitVel 1
        CalcYChange immediateTempVar move_hitFrame immediateTempVar OGravity OMaxFallSpeed OFastFallSpeed 0
        estOYPos += immediateTempVar
      endif      
    endif

  endif
  // if OYDistBackEdge > 5
  //   if estOYPos < 0
  //     estOYPos = 0
  //   endif
  //   tempYRange += estOYPos
  // endif
  Goto adjustPosIfInGround
  goalY = estOYPos
elif True
  $tempVar(estOXPos, immediateTempVar)
  $tempVar(estOYPos, anotherTempVar)
  immediateTempVar = OTopNX
  anotherTempVar = OTopNY
  globTempVar = move_hitFrame
  O_RECOVERY_POSITION(immediateTempVar, anotherTempVar, globTempVar)

  goalX = estOXPos
  Goto adjustPosIfInGround
  goalY = estOYPos
endif

if Equal OCurrAction hex(0x54)
  goalY = OTopNY
endif

// DrawDebugRectOutline goalX goalY 3 3 color(0x00FF00DD)

$tempVar(move_centerX,immediateTempVar)
move_centerX = move_xOffset + move_xRange
$ifAerialAttackNotSpecial()
  move_centerX *= Direction
else
  move_centerX *= OPos
endif
goalX -= move_centerX

$tempVar(OWidthOffset,immediateTempVar)
OWidthOffset = OPos * 0.5 * OWidth
goalX += OWidthOffset

// goalY += move_yOffset
// immediateTempVar = OHurtboxSize + move_yRange
immediateTempVar = move_yRange - move_yOffset
goalY -= immediateTempVar
immediateTempVar = move_yRange * 0.5
goalY -= immediateTempVar

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

// immediateTempVar = OHurtboxSize
// goalY += immediateTempVar

IF_AERIAL_ATTACK(var3)
  immediateTempVar = (TopNY - YDistFloor) + cs_shortHopHeight
  if !(Equal OYDistFloor -1) && SamePlane && OYDistFloor < move_yRange && Equal AirGroundState 1
    if goalY < immediateTempVar
      anotherTempVar = goalY - cs_jumpHeight * 0.5
      if anotherTempVar < immediateTempVar
        goalY = TopNY + cs_jumpHeight
      elif !(Equal CurrAction hex(0xA))
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
endif

if Equal OCurrAction hex(0x49) && !(CalledFrom ExecuteAttack)
  predictionConfidence immediateTempVar man_OOutOfHitstun
  if immediateTempVar >= 0.3
    predictOOption immediateTempVar man_OOutOfHitstun
    if Equal immediateTempVar op_hitstun_jump && ONumJumps > 0
      immediateTempVar = OHurtboxSize * 3
      goalY += immediateTempVar
    elif Equal immediateTempVar op_hitstun_attack && XDistLE 20 && Equal AirGroundState 1
      anotherTempVar = OTopNY - 30
      if TopNY < anotherTempVar
        if CHANCE_MUL_LE PT_BAITCHANCE 0.3
          skipMainInit = mainInitSkip
          scriptVariant = sv_jump_away
          Call JumpScr
        endif
      elif True
        IF_AERIAL_ATTACK(var3)
          XGoto CalcAttackGoal
        endif
      endif
    endif
  endif
endif

// shouldOffsetRes = 0
if !(CalledFrom ExecuteAttack)
  if Equal OCurrAction hex(0x4D)
    predictOOption globTempVar man_OGetupOption
    predictionConfidence immediateTempVar man_OGetupOption
    if immediateTempVar >= 0.3
      anotherTempVar = OPos * 20
      if Equal globTempVar op_getup_in
        goalX -= globTempVar
      elif Equal globTempVar op_getup_out
        goalX += globTempVar
      elif Equal globTempVar op_getup_attack && XDistLE 15 && Equal AirGroundState 1 && SamePlane
        if CHANCE_MUL_LE PT_AGGRESSION 0.25
          currGoal = cg_attack_reversal
          scriptVariant = calc(sv_jump_over + svp_jump_fullhop)
          IF_AERIAL_ATTACK(var3)
          else
            XGoto CalcAttackGoal
          endif
          skipMainInit = mainInitSkip
          Call JumpScr
        else
          currGoal = cg_defend
          Call Shield
        endif
      endif
    endif
  endif
endif
Return
label adjustPosIfInGround
  $tempVar(estOYPos, anotherTempVar)
  if OYDistFloor > 0
    immediateTempVar = ExactOYCoord - estOYPos
    if immediateTempVar > OYDistFloor
      estOYPos = ExactOYCoord - OYDistFloor
    endif
  endif
Return
Return