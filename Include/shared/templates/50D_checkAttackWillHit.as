#include <Definition_AIMain.h>
id 0x850D
unk 0x0

XReciever

#let dirX = var5
Goto getMoveLocationParams
XReciever

#let tempGoalX = var2
#let tempGoalY = var3

tempGoalX = goalX
tempGoalY = goalY

// adjust to O center
anotherTempVar = OHurtboxSize
move_yRange += anotherTempVar
anotherTempVar = OWidth
move_xRange += anotherTempVar

anotherTempVar = OTopNX - OCenterX
tempGoalX -= anotherTempVar
if TopNX < OTopNX
  tempGoalX -= anotherTempVar
else 
  tempGoalX += anotherTempVar
endif

anotherTempVar = OTopNY - OCenterY
tempGoalY -= anotherTempVar

if TopNY < OTopNY
  tempGoalY -= anotherTempVar
else 
  tempGoalY += anotherTempVar
endif

globTempVar = move_hitFrame

if AnimFrame < 2
  if TotalYSpeed > 0
    anotherTempVar = TopNY + TotalYSpeed * globTempVar - Gravity * globTempVar
  else
    anotherTempVar = TopNY + TotalYSpeed * globTempVar
  endif
else
  EstYCoord anotherTempVar globTempVar
endif
anotherTempVar -= TopNY
tempGoalY += anotherTempVar

$ifAerialAttack()
  anotherTempVar = globTempVar
  if Equal CurrAction hex(0x6) || Equal CurrAction hex(0x7)
    anotherTempVar *= 0.35
  elif Equal PrevAction hex(0x6) || Equal PrevAction hex(0x7)
    if Equal CurrAction hex(0x3) && AnimFrame < 4
      anotherTempVar *= 0.35
    endif
  endif
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
anotherTempVar = move_xRange + immediateTempVar
if anotherTempVar > 1
  move_xOffset -= immediateTempVar
  immediateTempVar *= 0.5
  move_xRange += immediateTempVar
  immediateTempVar *= 2
endif
anotherTempVar = move_yRange + immediateTempVar
if anotherTempVar > 1
  move_yOffset -= immediateTempVar
  immediateTempVar *= 0.5
  move_yRange += immediateTempVar
endif

$ifAerialAttack()
  GetAttribute immediateTempVar attr_airMobilityB 0
  immediateTempVar *= move_hitFrame * 0.5
  move_xOffset -= immediateTempVar
  immediateTempVar *= 0.5
  move_xRange += immediateTempVar
endif

if globTempVar > 15
  immediateTempVar = globTempVar - 15
  immediateTempVar *= 0.5
  move_xOffset -= immediateTempVar
  move_yOffset -= immediateTempVar
  immediateTempVar *= 0.5
  move_xRange += immediateTempVar
  move_yRange += immediateTempVar
endif

if Equal currGoal cg_attack_wall
  move_xRange += 12
endif
// anotherTempVar = OXSpeed
// Abs anotherTempVar
// move_xRange += anotherTempVar

#let distX = var0
#let distY = var1
distX = tempGoalX
distY = tempGoalY

immediateTempVar = OTopNX + (move_xOffset + move_xRange) * ODirection
globTempVar = OTopNY - move_yOffset + move_yRange
DrawDebugRectOutline immediateTempVar globTempVar move_xRange move_yRange color(0xFFFF4444)

immediateTempVar = distX 
globTempVar = distY 

DrawDebugRectOutline immediateTempVar globTempVar move_xRange move_yRange color(0x00FF00DD)

globTempVar = distX - TopNX
immediateTempVar = distY - TopNY

Abs globTempVar
Abs immediateTempVar

if !(Equal scriptVariant sv_checkHit)
  $ifMoveRequiresIdleGround()
    anotherTempVar = globTempVar - pt_wavedashDist
    if anotherTempVar <= move_xRange && immediateTempVar <= move_yRange
      if Equal CurrAction hex(0x3) || Equal CurrAction hex(0x8)
        if AnimFrame < calc(pt_dashForceTurnFrame - 4)
          scriptVariant = sv_wavedash_goal
          if XDistFrontEdge < 15 || XDistBackEdge > -15
            scriptVariant = sv_wavedash_awayFromLedge
          endif
          // skipMainInit = mainInitSkip
          // if Rnd < 0.7
            skipMainInit = sm_execAttack
          // endif
          CallI Wavedash      
        endif
      endif
    endif
    if globTempVar <= move_xRange && immediateTempVar <= move_yRange && Equal CurrAction hex(0x4)
      skipMainInit = mainInitSkip
      label crouchWait
        Seek crouchWait
        if !(Equal CurrAction hex(0x4))
          Call MainHub
        endif
        ClearStick
        AbsStick 0 (-0.6)
      Return
    endif
  endif
endif

anotherTempVar = OTopNY - TopNY
$ifAerialAttack()
elif anotherTempVar > pt_shortHopHeight
  lastAttack = -1
endif

if Equal IsOnStage 1
  {FASTFALL_CHECK}
endif

globTempVar = distX - TopNX
immediateTempVar = distY - TopNY

Abs globTempVar
Abs immediateTempVar

if globTempVar <= move_xRange && immediateTempVar <= move_yRange
  if !(Equal scriptVariant sv_checkHit)
    $ifAerialAttack()
      if Equal currGoal cg_edgeguard && Equal IsOnStage 0
        EstYCoord immediateTempVar move_IASA
        DrawDebugRectOutline TopNX immediateTempVar 5 5 color(0x00FFFFDD)
        DrawDebugRectOutline TopNX pt_recoveryDistY 10 2 color(0xFF8800DD)
        if immediateTempVar >= pt_recoveryDistY
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
label getMoveLocationParams

$getMoveLocationParams()

Return

$refreshMoves()
// populates ranges, hitframes, and IASA
$generateAllMovesGotoLocRange()

Return
Return