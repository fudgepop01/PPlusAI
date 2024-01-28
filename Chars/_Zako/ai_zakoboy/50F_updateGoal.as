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
    //= XReciever
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

    SetDebugOverlayColor color(0xFF000088)
  elif Equal currGoal cg_edgeguard_ledge
    SetDebugOverlayColor color(0x00FFFFFF)
    Return
  elif Equal currGoal cg_ledge_edgeguard
    SetDebugOverlayColor color(0x00FF88FF)
    if Equal CanCancelAttack 1 && Equal AirGroundState 1
      currGoal = cg_attack
    endif
  else
    SetDebugOverlayColor color(0x00FFFF88)

    if Rnd < 0.02 && !(Equal OAirGroundState 3) && OYDistBackEdge > 0 && YDistFloor > 0
      if CHANCE_MUL_LE PT_BAITCHANCE 0.15 || CHANCE_MUL_LE PT_AGGRESSION 0.1
        currGoal = cg_edgeguard_ledge
        Return
      endif
    endif
    // if Equal OAirGroundState 1 
    //   currGoal = cg_attack_reversal
    // endif
  endif
  EnableDebugOverlay

  MOD immediateTempVar AnimFrame 4
  if Equal lastAttack -1 && immediateTempVar >= 3
    Goto OPosGoal
    Goto changeGoal
    Return
  else 
    MOD immediateTempVar AnimFrame 20
    if immediateTempVar >= 19
      Goto OPosGoal
      Goto changeGoal
      Return
    endif
  endif

  // $ifLastOrigin(grab,false)
  //   if CHANCE_MUL_LE PT_AGGRESSION 0.65
  //     if Equal currGoal cg_attack_wall
  //       Goto changeGoal
  //       Return
  //     elif Equal OCurrAction hex(0x4A) || Equal OCurrAction hex(0x4D) || Equal OCurrAction hex(0x53) || Equal OCurrAction hex(0x54)
  //       Goto changeGoal
  //       Return
  //     elif OCurrAction >= hex(0x44) && OCurrAction <= hex(0x49) || Equal OCurrAction hex(0x42)
  //       if OYDistBackEdge > -12 && OYSpeed < 0
  //         Goto changeGoal
  //         Return
  //       endif
  //     endif 
  //   endif
  // endif

  // $ifLastOrigin(grab,false)
  // elif Equal currGoal cg_attack_wall
  //   predictAverage immediateTempVar man_OXHitDist
  //   if immediateTempVar < 8
  //     immediateTempVar = 8
  //   endif
  //   immediateTempVar += 60
  //   anotherTempVar = immediateTempVar - 70
  //   if XDistLE immediateTempVar && !(XDistLE anotherTempVar) && CHANCE_MUL_LE PT_AGGRESSION 0.05
  //     Call ExecuteAttack
  //   endif
  // endif

  EstOYCoord immediateTempVar 20
  immediateTempVar -= TopNY - YDistFloor
  // $ifAerialAttack()
  //   if currGoal >= cg_edgeguard
  //     lastAttack = -1
  //     Return
  //   endif
  // endif

  // predictAverage immediateTempVar man_OXHitDist
  // immediateTempVar += 10
  // if Equal currGoal cg_attack_crossup && XDistLE immediateTempVar
  //   scriptVariant = sv_jump_over
  //   scriptVariant += svp_jump_fullhop
  //   skipMainInit = mainInitSkip
  //   currGoal = cg_attack_reversal
  //   CallI JumpScr 
  // endif

  // globTempVar = TopNX
  // immediateTempVar = OTopNX
  // Abs globTempVar
  // Abs immediateTempVar
  // if Equal currGoal cg_attack_wall
  //   $ifAerialAttack()
  //     if globTempVar < immediateTempVar
  //       Call ExecuteAttack
  //     elif Rnd < 0.2
  //       Call ExecuteAttack
  //     endif
  //   elif Equal AirGroundState 1
  //     if globTempVar < immediateTempVar
  //       Call ExecuteAttack
  //     elif Rnd < 0.2
  //       Call ExecuteAttack
  //   endif
  //     endif
  // endif

  predictAverage anotherTempVar man_OXHitDist
  anotherTempVar += 20
  if XDistLE anotherTempVar && currGoal < cg_attack_reversal
    if !(Equal currGoal cg_attack_wall)
      GetCommitPredictChance immediateTempVar
      immediateTempVar *= 0.075
      if Rnd < immediateTempVar 
        if CHANCE_MUL_LE PT_WALL_CHANCE 0.45 || CHANCE_MUL_LE PT_BAITCHANCE 0.25
          if CHANCE_MUL_LE PT_BAITCHANCE 0.75
            currGoal = cg_bait
          else
            lastAttack = -1
            currGoal = cg_attack_wall
          endif
          Return
        elif CHANCE_MUL_LE PT_BAITCHANCE 0.2 || CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 0.2
          if YDistFloor < 15 && YDistFloor > 0
            currGoal = cg_bait_dashdance
            Return
          endif
        endif
      endif
    endif
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

  // GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
  // globTempVar = OTopNY - TopNY
  // if Equal immediateTempVar 0
  //   if globTempVar > 30 || OYDistBackEdge < -35 && Equal AirGroundState 1
  //   elif !(Equal currGoal cg_attack_reversal) && OYDistFloor < 45
  //   elif currGoal >= cg_edgeguard
  //   elif True
  //     if shouldUpdate <= 1 && Equal AirGroundState 1
  //       predictOOption immediateTempVar man_OXAttackDist 
  //       predictionConfidence anotherTempVar man_OXAttackDist
  //       if Equal immediateTempVar op_attack_close && CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.6
  //         currGoal = cg_bait_dashdance
  //         Return
  //       elif Equal immediateTempVar op_attack_mid && CHANCE_MUL_GE PT_BRAVECHANCE 0.35
  //         currGoal = cg_bait
  //         Return
  //       elif Equal immediateTempVar op_attack_far && Rnd < anotherTempVar
  //         currGoal = cg_circleCamp
  //         Return
  //       endif
  //     endif
  //     if shouldUpdate <= 1 && Equal shouldApproach 0 && Equal AirGroundState 1 && CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.5
  //       currGoal = cg_bait_dashdance
  //       Return
  //     endif
  //     immediateTempVar += 30
  //     if !(XDistLE immediateTempVar) && CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 1 && CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 1 && OFramesHitstun <= 0
  //       currGoal = cg_circleCamp
  //       Return
  //     endif
  //   endif
  // endif

  predictAverage immediateTempVar man_OXHitDist
  immediateTempVar += 10
  if Equal OCurrAction hex(0x49) && currGoal < cg_edgeguard
    if XDistLE immediateTempVar && !(Equal OAirGroundState 1) 
      predictOOption immediateTempVar man_OOutOfHitstun
      predictionConfidence globTempVar man_OOutOfHitstun
      if Equal immediateTempVar op_hitstun_attack && Rnd < globTempVar
        Call Shield
      endif
    endif
  endif

  // if Equal anotherTempVar globTempVar && immediateTempVar > 55
  //   XGoto GoalChoiceHub
  //   //= XReciever
  //   Return
  // endif

  // prevents truly unreactable adjustements
  Goto getDist
  //= XReciever

  anotherTempVar = XSpeed
  Abs anotherTempVar
  anotherTempVar = 8 + anotherTempVar

  // LOGSTR str("SHOULD UPDATE?")
  // LOGVAL shouldUpdate
  // LOGVAL OCurrAction
  // PRINTLN

  if currGoal >= cg_edgeguard
    scriptVariant = sv_none
    XGoto SetAttackGoal
    //= XReciever
  elif OCurrAction <= hex(0x21) && !(Equal CurrAction hex(0xA)) && Equal OFramesHitstun 0
    if shouldUpdate <= 1
      XGoto SetAttackGoal
      //= XReciever
    endif

    // if OCurrAction >= hex(0xB) && OCurrAction <= hex(0xD) && OAnimFrame < 20
    // else
    //   XGoto SetAttackGoal
    //   //= XReciever
    // endif

    // if currGoal <= cg_attack_reversal && !(Equal currGoal cg_attack_wall)
    //   anotherTempVar = OPos * -15
    //   GetYDistFloorOffset immediateTempVar anotherTempVar 0 0
    //   anotherTempVar *= -2
    //   GetYDistFloorOffset anotherTempVar anotherTempVar 0 1
    //   if Equal immediateTempVar -1
    //     anotherTempVar = -1
    //   endif
    //   if Equal anotherTempVar -1 && CHANCE_MUL_GE PT_AGGRESSION 0.4 && CHANCE_MUL_GE PT_WALL_CHANCE 0.65 && YDistFloor < 3 && YDistFloor > 0
    //     currGoal = cg_bait_wait
    //     if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.05
    //       currGoal = cg_bait_dashdance
    //     endif
    //     Return
    //   elif Equal anotherTempVar -1
    //     IF_AERIAL_ATTACK(var0)
    //       lastAttack = -1
    //       currGoal = cg_attack_wall      
    //       Return
    //     endif
    //   endif
    // endif
  // otherwise carry on as normal
  elif shouldUpdate <= 1 || Equal CurrAction hex(0xA) || Equal OCurrAction hex(0x49) || OFramesHitstun > 1 || Equal HitboxConnected 1
    
    if OAnimFrame <= 9 || Equal CurrAction hex(0xA) || Equal OCurrAction hex(0x49) || OFramesHitstun > 1 || Equal HitboxConnected 1
      if immediateTempVar > anotherTempVar || OAnimFrame > 10
        GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
        if Equal immediateTempVar 1
        elif currGoal >= cg_edgeguard
        elif !(SamePlane) && CHANCE_MUL_LE PT_BAITCHANCE 0.15 && Rnd < 0.2 && OFramesHitstun <= 0
          currGoal = cg_bait
          Return
        endif

        // scriptVariant = sv_attackgoal_self
        XGoto SetAttackGoal
        //= XReciever
      endif
    endif
  endif

  // Goto getDist
  // if immediateTempVar > 35 && shouldUpdate <= 1 && XDistLE 35 && !(Equal currGoal cg_edgeguard)
  //   Goto changeGoal
  //   Return
  // endif

  if scriptVariant < sv_punishRecovery
    scriptVariant = sv_none
  endif
  if lastAttack > -1
    XGoto CheckAttackWillHit
  endif
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
// MOD immediateTempVar AnimFrame 8
// if Equal immediateTempVar 0
  XGoto CalcAttackGoal
  //= XReciever
// endif
Return
Return