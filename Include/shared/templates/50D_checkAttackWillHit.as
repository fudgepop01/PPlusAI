#include <Definition_AIMain.h>
id 0x850D
unk 0x0

XReciever

if OAnimFrame < 23
  if OCurrAction >= hex(0x4E) && OCurrAction <= hex(0x52)
    Return
  elif OCurrAction >= hex(0x60) && OCurrAction <= hex(0x61)
    Return
  endif
endif

$ifLastOrigin(grab,false)
  if Equal OCurrAction hex(0x4A) || Equal OCurrAction hex(0x4D) || Equal OCurrAction hex(0x53) || Equal OCurrAction hex(0x54)
    Return
  elif OCurrAction >= hex(0x44) && OCurrAction <= hex(0x49) || Equal OCurrAction hex(0x42)
    if OYDistBackEdge > -8 && OYSpeed < 0
      Return
    endif
  endif 
endif

#let move_xOffset = var12
#let move_yOffset = var11
#let move_xRange = var10
#let move_yRange = var9
#let move_hitFrame = var8
#let move_duration = var7
#let move_IASA = var6
GET_MOVE_DATA(globTempVar, move_xOffset, move_yOffset, move_xRange, move_yRange, move_hitFrame, move_duration, move_IASA, globTempVar)

#let move_lastHitFrame = var7
move_lastHitFrame = move_hitFrame + move_duration

#let tempGoalX = var2
#let tempGoalY = var3
#let tempXRange = var4
#let tempYRange = var5
tempGoalX = goalX
tempGoalY = goalY
tempXRange = move_xRange
tempYRange = move_yRange

// adjust to O center
anotherTempVar = OHurtboxSize * 0.5
tempYRange += anotherTempVar
anotherTempVar = OWidth * 0.5
tempXRange += anotherTempVar

anotherTempVar = Width * 0.5
tempGoalX -= anotherTempVar
anotherTempVar = HurtboxSize * 0.5
tempGoalY += anotherTempVar

anotherTempVar = OTopNX - OCenterX
tempGoalX -= anotherTempVar
// tempGoalX -= anotherTempVar
// if TopNX < OTopNX
//   tempGoalX += anotherTempVar
// else 
//   tempGoalX -= anotherTempVar
// endif

anotherTempVar = OCenterY - OTopNY
tempGoalY += anotherTempVar
// tempGoalY -= anotherTempVar
// if TopNY <= OTopNY
//   tempGoalY -= anotherTempVar
// else 
//   tempGoalY += anotherTempVar
// endif

globTempVar = move_hitFrame


{SELF_Y_ADJUST}
tempGoalY += TopNY

if OAnimFrame < 2 && !(Equal OYSpeed 0)
  anotherTempVar = OSCDBottom + OTotalYSpeed * globTempVar - OGravity * OGravity * globTempVar
else
  EstOYCoord anotherTempVar globTempVar
endif
anotherTempVar -= OTopNY
if anotherTempVar > OYDistFloor
  anotherTempVar = OTopNY - OYDistFloor
endif
tempGoalY += anotherTempVar


if OAnimFrame < 2
  anotherTempVar = OTopNX + OTotalXSpeed * globTempVar
else
  EstOXCoord anotherTempVar globTempVar
endif
anotherTempVar -= OTopNX
tempGoalX += anotherTempVar

$ifAerialAttack()
  GET_CHAR_TRAIT(immediateTempVar, chr_get_moveDirY)
  if Equal immediateTempVar 1 && Equal PrevAction hex(0xA) && AnimFrame < 2
    Return
  endif 
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
  endif
elif True
  anotherTempVar = TopNX
endif
anotherTempVar -= TopNX
tempGoalX -= anotherTempVar

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


$ifAerialAttack()
  GetAttribute immediateTempVar attr_airMobilityB 0
  immediateTempVar *= move_hitFrame * 0.5
  move_xOffset -= immediateTempVar
  immediateTempVar *= 0.5
  tempXRange += immediateTempVar
endif

if globTempVar > 15
  immediateTempVar = globTempVar - 15
  immediateTempVar *= 0.5
  move_xOffset -= immediateTempVar
  move_yOffset -= immediateTempVar
  immediateTempVar *= 0.5
  tempXRange += immediateTempVar
  tempYRange += immediateTempVar
endif

if Equal currGoal cg_attack_wall
  tempXRange += 12
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

DrawDebugRectOutline immediateTempVar globTempVar tempXRange tempYRange color(0x00FF00DD)

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
    if anotherTempVar <= tempXRange && immediateTempVar <= tempYRange
      if Equal CurrAction hex(0x3) || Equal CurrAction hex(0x8) || Equal CurrAction hex(0x9)
        if AnimFrame < calc(cs_dashForceTurnFrame - 4)
          scriptVariant = sv_wavedash_goal
          // if XDistFrontEdge < 15 || XDistBackEdge > -15
          //   scriptVariant = sv_wavedash_awayFromLedge
          // endif
          skipMainInit = mainInitSkip
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
      if Equal currGoal cg_edgeguard || Equal IsOnStage 0
        EstYCoord immediateTempVar move_IASA
        DrawDebugRectOutline TopNX immediateTempVar 5 5 color(0x00FFFFDD)
        DrawDebugRectOutline TopNX cs_recoveryDistY 10 2 color(0xFF8800DD)
        if immediateTempVar >= calc(cs_recoveryDistY - cs_djumpHeight) && Equal AirGroundState 2
          CallI ExecuteAttack
          Finish
        endif
      elif Equal AirGroundState 2
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
Return
Return