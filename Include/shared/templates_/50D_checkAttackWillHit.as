#include <Definition_AIMain.h>
id 0x850D
unk 0x0

XReciever

Goto getMoveLocationParams
XReciever

LOGSTR str("CHOICE")
LOGVAL lastAttack

globTempVar = move_hitFrame
globTempVar *= 0.5

anotherTempVar = OHurtboxSize
move_yRange += anotherTempVar

immediateTempVar = (100 - LevelValue) * 0.2
move_xRange += immediateTempVar
move_yRange += immediateTempVar

if move_hitFrame > 20
  immediateTempVar = move_hitFrame - 20
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
distX = goalX
distY = goalY

#let temp1 = var2
#let temp2 = var3
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

anotherTempVar = OTopNY - TopNY
$ifAerialAttack()
elif anotherTempVar > pt_shortHopHeight
  lastAttack = -1
endif

if globTempVar <= move_xRange && immediateTempVar <= move_yRange
  $ifAerialAttack()
    if Equal AirGroundState 2
      CallI ExecuteAttack
      Finish
    endif
  elif Equal AirGroundState 1
    CallI ExecuteAttack
    Finish
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