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
  
  if Equal currGoal cg_attack_inCombo && Rnd < 0.05
    XGoto DefendHub
    //= XReciever
    Return
  endif

  // if OCurrAction >= hex(0x42) && OCurrAction <= hex(0x59) && !(Equal OCurrAction hex(0x49))
  // elif Equal OCurrAction hex(0x49) && OYDistFloor > 15
  // elif Equal HitboxConnected 1 || Equal PrevAction hex(0x3C)
  // elif Equal currGoal cg_edgeguard && Equal OIsOnStage 1
  //   currGoal = cg_attack
  // endif 

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

  // LOGSTR str("==ATTACK:")
  // $printMoveName()
  
  #let shouldUpdate = var2
  // combos
  shouldUpdate = (1 - (LevelValue / 100)) * 25 + 2
  globTempVar = OAnimFrame
  // standard
  GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
  if Equal immediateTempVar 0
    shouldUpdate = (1 - (LevelValue / 100)) * 30 + 15
    globTempVar = OAnimFrame
  endif

  GET_CHAR_TRAIT(anotherTempVar, chr_calc_certainty)
  anotherTempVar = (1 - anotherTempVar)
  anotherTempVar *= 2
  if anotherTempVar < 0.25
    anotherTempVar = 0.25
  endif
  shouldUpdate *= anotherTempVar
  shouldUpdate += 4

  shouldUpdate *= PT_REACTION_TIME

  MOD shouldUpdate globTempVar shouldUpdate

  Goto getODist
  anotherTempVar = 2 * PT_REACTION_TIME
  if OAnimFrame <= anotherTempVar && immediateTempVar < 5
    shouldUpdate = 2
  endif

  // if shouldUpdate <= 1
  //   DrawDebugRectOutline 0 10 shouldUpdate 2 color(0xFFFFFFEE)
  // else
  //   DrawDebugRectOutline 0 10 shouldUpdate 2 color(0xFF0000EE)
  // endif

  $ifLastOrigin(grab,false)
  elif OCurrAction >= hex(0x1A) && OCurrAction <= hex(0x1D) && shouldUpdate < 1 && Rnd < 0.2
    lastAttack = -1
    Return      
  endif

  anotherTempVar = XSpeed
  Abs anotherTempVar
  anotherTempVar = 8 + anotherTempVar

  if currGoal >= cg_edgeguard
    scriptVariant = sv_none
    XGoto SetAttackGoal
    //= XReciever
  elif OCurrAction <= hex(0x21) && !(Equal CurrAction hex(0xA)) && Equal OFramesHitstun 0
    if shouldUpdate <= 1
      XGoto SetAttackGoal
      //= XReciever
    endif

    if currGoal <= cg_attack_reversal && !(Equal currGoal cg_attack_wall)
      anotherTempVar = OPos * -15
      GetYDistFloorOffset immediateTempVar anotherTempVar 0 0
      anotherTempVar *= -2
      GetYDistFloorOffset anotherTempVar anotherTempVar 0 1
      if Equal immediateTempVar -1
        anotherTempVar = -1
      endif
      if Equal anotherTempVar -1 && CHANCE_MUL_GE PT_AGGRESSION 0.4 && CHANCE_MUL_GE PT_WALL_CHANCE 0.65
        currGoal = cg_bait_wait
        if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.4
          currGoal = cg_bait_dashdance
        endif
        Return
      elif Equal anotherTempVar -1
        IF_AERIAL_ATTACK(var0)
          currGoal = cg_attack_wall      
          Return
        endif
      endif
    endif
  // otherwise carry on as normal
  elif shouldUpdate <= 1 || Equal CurrAction hex(0xA) || Equal OCurrAction hex(0x49) || OFramesHitstun > 1 || Equal HitboxConnected 1
    
    if OAnimFrame <= 9 || Equal CurrAction hex(0xA) || Equal OCurrAction hex(0x49) || OFramesHitstun > 1 || Equal HitboxConnected 1
      if immediateTempVar > anotherTempVar
        GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
        if Equal immediateTempVar 1
        elif currGoal >= cg_edgeguard
        elif !(SamePlane) && CHANCE_MUL_LE PT_BAITCHANCE 1 && Rnd < 0.2 && shouldUpdate <= 1 && OFramesHitstun <= 0
          currGoal = cg_attack
          Return
        endif

        // scriptVariant = sv_attackgoal_self
        XGoto SetAttackGoal
        //= XReciever
      endif
    endif
  endif

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