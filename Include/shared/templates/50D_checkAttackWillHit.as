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
// adjust for char height
// top of Opponent
immediateTempVar = OTopNY + OHurtboxSize
if tempGoalY > immediateTempVar
  tempGoalY -= OHurtboxSize
  tempGoalY -= OHurtboxSize
elif tempGoalY < OTopNY
  // nothing
else 
  globTempVar = immediateTempVar - tempGoalY
  tempGoalY -= globTempVar
  tempGoalY -= globTempVar
endif

// adjust for char "width" 
#const charWidth = 3
immediateTempVar = OTopNX - charWidth
anotherTempVar = OTopNX + charWidth
if tempGoalX > anotherTempVar
  if Equal dirX -1
    tempGoalX -= charWidth
  else
    tempGoalX += charWidth
  endif
elif tempGoalX < immediateTempVar
  if Equal dirX -1
    tempGoalX += charWidth
  else
    tempGoalX -= charWidth
  endif
else
  immediateTempVar = tempGoalX - OTopNX
  if Equal dirX -1
    immediateTempVar *= -1
  endif
  if immediateTempVar < 0
    tempGoalX += immediateTempVar
  else
    tempGoalX -= immediateTempVar
  endif
endif

globTempVar = move_hitFrame

anotherTempVar = OHurtboxSize
move_yRange += anotherTempVar

immediateTempVar = (100 - LevelValue) * 0.2
move_xOffset -= immediateTempVar
move_yOffset -= immediateTempVar
immediateTempVar *= 0.5
move_xRange += immediateTempVar
move_yRange += immediateTempVar

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
DrawDebugRectOutline immediateTempVar globTempVar move_xRange move_yRange color(0x00FFFFDD)

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
          move_xRange -= 5
          if globTempVar <= move_xRange
            scriptVariant = sv_wavedash_neutral
          elif distX <= TopNX
            if OPos < 0
              scriptVariant = sv_wavedash_in
            else
              scriptVariant = sv_wavedash_out
            endif
          elif distX >= TopNX
            if OPos > 0
              scriptVariant = sv_wavedash_in
            else
              scriptVariant = sv_wavedash_out
            endif
          endif
          if XDistFrontEdge < 15 || XDistBackEdge > -15
            scriptVariant = sv_wavedash_awayFromLedge
          endif
          skipMainInit = mainInitSkip
          if Rnd < 0.7
            skipMainInit = sm_execAttack
          endif
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

$ifAerialAttack()
  if Equal AirGroundState 2
    #let fastfallDist = var4
    CALC_FASTFALL_DIST(fastfallDist, move_hitFrame)

    immediateTempVar = fastfallDist + (OSCDBottom - TopNY)
    immediateTempVar -= YDistBackEdge
    if immediateTempVar > 0
      globTempVar = distX - TopNX
      immediateTempVar = distY - TopNY + fastfallDist

      Abs globTempVar
      Abs immediateTempVar
      if globTempVar <= move_xRange && immediateTempVar <= move_yRange
        if !(Equal scriptVariant sv_checkHit)
          scriptVariant = sv_execute_fastfall
          CallI ExecuteAttack
          Finish
        else
          scriptVariant = sv_execute_fastfall
          Return
        endif
      endif
    endif
  endif
endif

if globTempVar <= move_xRange && immediateTempVar <= move_yRange
  if !(Equal scriptVariant sv_checkHit)
    $ifAerialAttack()
      if Equal AirGroundState 2
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