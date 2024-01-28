#include <Definition_AIMain.h>
id 0x850F
unk 0x0

//= XReciever
NoRepeat
// currGoal = cg_attack_reversal
// $setLastAttack(usmash)
scriptVariant = sv_none
if currGoal >= cg_attack && currGoal < calc(cg_attack + 1)
  if CalledFrom ExecuteAttack
    XGoto SetAttackGoal
    Return
  endif

  if currGoal < cg_edgeguard
    immediateTempVar = OXSpeed * 12
    GetYDistFloorOffset immediateTempVar immediateTempVar 15 1
    if Equal OAirGroundState 3
      currGoal = cg_edgeguard
    elif Equal immediateTempVar -1 && OFramesHitstun > 0 
      currGoal = cg_edgeguard
    endif
  elif Equal currGoal cg_edgeguard_ledge
  elif Equal currGoal cg_ledge_edgeguard
    if Equal AirGroundState 1
      currGoal = cg_attack
    endif
  elif True
    if Rnd < 0.02 && !(Equal OAirGroundState 3) && OYDistBackEdge > 0
      if CHANCE_MUL_LE PT_BAITCHANCE 0.15 || CHANCE_MUL_LE PT_AGGRESSION 0.1
        currGoal = cg_edgeguard_ledge
        Return
      endif
    endif
    if Equal OAirGroundState 1
      currGoal = cg_attack_reversal
    endif
  endif

  if Equal lastAttack -1
    Goto OPosGoal
    Goto changeGoal
    Return
  endif

  #let shouldUpdate = var2

  // if shouldUpdate <= 1
  //   DrawDebugRectOutline 0 10 shouldUpdate 2 color(0xFFFFFFEE)
  // else
  //   DrawDebugRectOutline 0 10 shouldUpdate 2 color(0xFF0000EE)
  // endif

  $ifLastOrigin(grab,false)
  elif OCurrAction >= hex(0x1A) && OCurrAction <= hex(0x1D) && Rnd < 0.2
    lastAttack = -1
    Return      
  endif

  anotherTempVar = XSpeed
  Abs anotherTempVar
  anotherTempVar = 8 + anotherTempVar
  XGoto SetAttackGoal

  if scriptVariant < sv_punishRecovery
    scriptVariant = sv_none
  endif
  XGoto CheckAttackWillHit
else
  currGoal = cg_attack
endif
Return
label OPosGoal
if OAnimFrame < 2
  goalX = OTopNX + OTotalXSpeed * 10 * OPos * ODirection * -1
else
  EstOXCoord goalX 10
  goalX -= OTopNX
  goalX *= OPos * ODirection * -1
  goalX += OTopNX
endif
goalY = OYDistBackEdge + OTopNY
Return
label getDist
immediateTempVar = TopNX - goalX
anotherTempVar = TopNY - goalY
Goto normalize
Return
label getODist
immediateTempVar = OTopNX - goalX
anotherTempVar = OTopNY - goalY
Goto normalize
Return
label normalize
Norm immediateTempVar immediateTempVar anotherTempVar
Abs immediateTempVar
Return
label changeGoal
MOD immediateTempVar AnimFrame 8
if Equal immediateTempVar 0
  XGoto CalcAttackGoal
  //= XReciever
endif
Return
Return