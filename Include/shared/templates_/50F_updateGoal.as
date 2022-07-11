#include <Definition_AIMain.h>
id 0x850F
unk 0x0

XReciever
NoRepeat
scriptVariant = sv_none

// LOGSTR str("cg_value")
// LOGVAL currGoal
// PRINTLN

// #let OCommitAttack = var0
// GetCommitPredictChance OCommitAttack LevelValue
// MOD immediateTempVar AnimFrame 25
// if !(Equal immediateTempVar 23) || Rnd < 0.35
// elif Equal currGoal cg_attack_reversal
// elif currGoal < cg_edgeguard && !(Equal currGoal cg_bait_dashdance)
//   if OAttacking
//   elif OCommitAttack >= 0.65
//     if CHANCE_MUL_LE PT_AGGRESSION 0.7
//       currGoal = cg_bait_dashawayWhenApproached
//     elif CHANCE_MUL_LE PT_BAITCHANCE 0.65
//       currGoal = cg_bait_shield
//     else
//       currGoal = cg_bait
//     endif
//   elif OCommitAttack <= 0.25
//     if CHANCE_MUL_GE PT_AGGRESSION 0.2
//       currGoal = cg_circleCamp
//     elif CHANCE_MUL_LE PT_AGGRESSION 0.1
//       currGoal = cg_attack_wall
//     else
//       currGoal = cg_bait
//     endif
//   elif CHANCE_MUL_LE PT_AGGRESSION 0.3
//     currGoal = cg_bait_dashawayWhenApproached
//   endif
//   #let OCommitGrab = var0
//   PredictOMov OCommitGrab mov_grab LevelValue
//   if OCommitGrab >= 0.2
//     if CHANCE_MUL_LE PT_AGGRESSION 0.35
//       currGoal = cg_attack_wall
//     elif CHANCE_MUL_LE PT_AGGRESSION 0.75
//       currGoal = cg_bait_dashawayWhenApproached
//     else
//       currGoal = cg_bait_dashdance
//     endif
//   endif
// elif !(Equal OYDistFloor -1)
//   currGoal = cg_attack
// endif

if Equal goalY BBoundary
  if currGoal >= cg_attack && currGoal < calc(cg_attack + 1)
  else
    Goto forceChangeGoal
  endif
endif

#let teamCloser = var3
GetIsTeammateCloser teamCloser
if Equal teamCloser 1
  if Rnd <= 0.02
    SwitchTarget
    Return
  endif
  lastAttack = -1
  currGoal = cg_circleCamp
endif

if currGoal >= cg_circleCamp && currGoal < calc(cg_circleCamp + 1)
  lastAttack = -1
  // Norm immediateTempVar TopNX TopNY
  // Norm globTempVar OTopNX OTopNY
  // Abs immediateTempVar
  // Abs globTempVar
  // if immediateTempVar < globTempVar
  //   currGoal = cg_bait
  //   Return
  // endif

  SetDebugOverlayColor color(0x0000FF88)
  EnableDebugOverlay
  GET_CHAR_TRAIT(globTempVar, chr_calc_certainty)
  globTempVar = (1 - globTempVar)
  immediateTempVar = (1 - (LevelValue / 100)) * 30 + 10 * globTempVar
  immediateTempVar *= PT_REACTION_TIME

  MOD immediateTempVar AnimFrame immediateTempVar
  if immediateTempVar <= 1
    globTempVar = OTopNY - TopNY
    if globTempVar > 45 || OYDistBackEdge < -20 && Equal AirGroundState 1
      if CHANCE_MUL_LE PT_AGGRESSION 1.4
        currGoal = cg_attack
        Return
      endif
    endif

    // predictOOption immediateTempVar man_OXHitDist LevelValue 
    // immediateTempVar += 10
    if CHANCE_MUL_LE PT_AGGRESSION 0.4
      // if XDistLE immediateTempVar 
      //   currGoal = cg_bait
      //   Return
      // endif
      currGoal = cg_camp_attack
      XGoto CalcAttackGoal
      XReciever
      currGoal = cg_circleCamp
      
      if !(Equal lastAttack -1)
        skipMainInit = sm_execAttack
        CallI MainHub
      else
        Goto forceChangeGoal
      endif
    endif
  endif
  // if Equal immediateTempVar 1 && Rnd < 0.15
  //   currGoal = cg_bait
  //   Return
  // endif

  predictAverage globTempVar man_OXHitDist LevelValue
  Goto getODist
  if immediateTempVar <= globTempVar
    Goto forceChangeGoal
    Return
  endif

  globTempVar = immediateTempVar * 0.75
  Goto getDist
  if globTempVar < immediateTempVar
    Goto forceChangeGoal
    Return
  endif

  Goto getDist
  if immediateTempVar <= 13
    if ODistLE globTempVar || Rnd <= 0.04
      Goto forceChangeGoal
      Return
    endif
    GET_CHAR_TRAIT(globTempVar, chr_calc_certainty)
    globTempVar = (1 - globTempVar)
    immediateTempVar = (1 - (LevelValue / 100)) * 30 + 10 * globTempVar
    immediateTempVar *= PT_REACTION_TIME
    MOD immediateTempVar AnimFrame immediateTempVar
    // $LV9Check(immediateTempVar = 1)
    if immediateTempVar <= 1
      if Equal AirGroundState 1 && CHANCE_MUL_LE PT_JUMPINESS 1
        goalY += calc(cs_shortHopHeight - 3) 
        if CHANCE_MUL_LE PT_JUMPINESS 1 && CHANCE_MUL_LE PT_JUMPINESS 1
          goalY += 5
        endif
      elif Equal AirGroundState 2 && YDistBackEdge < -5
        if CHANCE_MUL_LE PT_DJUMPINESS 1 && CHANCE_MUL_LE PT_DJUMPINESS 1 && NumJumps > 0
          goalY += cs_djumpHeight
        else
          goalY += 1
          GetYDistFloorAbsPos immediateTempVar goalX goalY
          goalY -= immediateTempVar
        endif
      endif
    endif
  endif
elif currGoal >= cg_bait && currGoal < calc(cg_bait + 1)
  lastAttack = -1
  currGoal = cg_bait_dashdance
  GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
  if Equal immediateTempVar 1
    currGoal = cg_attack_reversal
    Return
  endif

  predictAverage immediateTempVar man_OXHitDist LevelValue
  if immediateTempVar < 8
    immediateTempVar = 8
  endif
  immediateTempVar += 10
  DrawDebugRectOutline goalX goalY immediateTempVar immediateTempVar color(0xFFFF0088)
  immediateTempVar += 10
  DrawDebugRectOutline goalX goalY immediateTempVar immediateTempVar color(0xFFFF0044)
  immediateTempVar += 10
  DrawDebugRectOutline goalX goalY immediateTempVar immediateTempVar color(0xFFFF0022)
  immediateTempVar += 10
  anotherTempVar = OPos * -30
  GetYDistFloorOffset anotherTempVar anotherTempVar 10 0

  SetDebugOverlayColor color(0xFF00FF88)
  if Equal currGoal cg_bait_dashdance
    SetDebugOverlayColor color(0xFF00FFFF)
  endif
  EnableDebugOverlay

  GET_CHAR_TRAIT(globTempVar, chr_calc_certainty)
  globTempVar *= -1
  globTempVar += 1

  immediateTempVar = (1 - (LevelValue / 100)) * 30 + 10 * globTempVar
  immediateTempVar *= PT_REACTION_TIME
  MOD immediateTempVar AnimFrame immediateTempVar
  // $LV9Check(immediateTempVar = 1)
  if immediateTempVar <= 1 && OAnimFrame > globTempVar
    Goto OPosGoal

    globTempVar = OTopNY - TopNY
    if globTempVar > 45 || OYDistBackEdge < -20 && Equal AirGroundState 1
      if CHANCE_MUL_LE PT_AGGRESSION 1.25
        currGoal = cg_attack
        Return
      endif
    endif
    
    if Equal currGoal cg_bait_wait
      Return
    elif Equal currGoal cg_bait_dashdance && CHANCE_MUL_LE PT_BAITCHANCE 0.7
      Return
    else
      GetCommitPredictChance immediateTempVar LevelValue
      predictAverage anotherTempVar man_OXHitDist LevelValue
      anotherTempVar += 15
      if immediateTempVar > 0.65 && !(XDistLE anotherTempVar) && Rnd < 0.5
        currGoal = cg_bait_wait
        if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.3
          currGoal = cg_bait_dashdance
        endif
        scriptVariant = sv_wavedash_neutral
        CallI Wavedash
        Return
      endif
    endif

    // predictAverage immediateTempVar man_OXHitDist LevelValue
    // if CHANCE_MUL_LE PT_AGGRESSION 0.4 && Equal AirGroundState 1 && !(XDistLE immediateTempVar)
    //   if CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 0.8
    //     currGoal = cg_camp_attack
    //     XGoto CalcAttackGoal
    //     XReciever
    //     currGoal = cg_bait_dashdance
    //     if !(Equal lastAttack -1)
    //       skipMainInit = sm_execAttack
    //       CallI MainHub
    //     endif
    //   endif
    // endif

    if !(Equal currGoal cg_bait_shield) && CHANCE_MUL_LE PT_BAITCHANCE 1 && Equal teamCloser 0
      predictAverage immediateTempVar man_OXHitDist LevelValue
      if immediateTempVar < 8
        immediateTempVar = 8
      endif
      immediateTempVar += 100
      anotherTempVar = immediateTempVar - 70
      if XDistLE immediateTempVar && !(XDistLE anotherTempVar) && CHANCE_MUL_LE PT_AGGRESSION 0.3
        if CHANCE_MUL_LE PT_BRAVECHANCE 0.4
          if CHANCE_MUL_LE PT_WALL_CHANCE 0.35
            currGoal = cg_attack_wall
          else  
            currGoal = cg_bait_attack
          endif
          XGoto CalcAttackGoal
          XReciever
          
          if !(Equal lastAttack -1)
            skipMainInit = sm_execAttack
            CallI MainHub
          endif
        endif
      elif XDistLE anotherTempVar && CHANCE_MUL_LE PT_AGGRESSION 0.7
        GetCommitPredictChance immediateTempVar LevelValue
        if CHANCE_MUL_LE PT_BRAVECHANCE 0.75 && immediateTempVar < 0.35
          if CHANCE_MUL_LE PT_WALL_CHANCE 0.85
            currGoal = cg_attack_wall
          else  
            currGoal = cg_bait_attack
          endif
          XGoto CalcAttackGoal
          XReciever
          
          if !(Equal lastAttack -1)
            skipMainInit = sm_execAttack
            CallI MainHub
          endif
        endif
      endif
    endif
  endif

  if Equal currGoal cg_bait_wait
    Return
  endif

  #let shouldApproach = var1
  shouldApproach = 1
  predictAverage anotherTempVar man_OXHitDist LevelValue
  if anotherTempVar < 8
    anotherTempVar = 8
  endif
  anotherTempVar += 10
  anotherTempVar *= OPos
  
  Norm immediateTempVar TopNX TopNY
  Norm globTempVar OTopNX OTopNY
  Abs immediateTempVar
  Abs globTempVar

  GetYDistFloorOffset anotherTempVar anotherTempVar 5 1
  if Equal anotherTempVar -1 || Equal teamCloser 1 || immediateTempVar < globTempVar
    shouldApproach = 0
    predictAverage anotherTempVar man_OXHitDist LevelValue
  endif

  Goto getDist
  if immediateTempVar >= 55
    shouldApproach = 1
  elif CHANCE_MUL_LE PT_BAITCHANCE 0.15
    shouldApproach = -1
  endif 

  predictAverage globTempVar man_OXHitDist LevelValue
  if globTempVar < 8
    globTempVar = 8
  endif
  immediateTempVar = 15 * Rnd
  globTempVar -= immediateTempVar
  if !(Equal shouldApproach 1)
    globTempVar = globTempVar + 15 * Rnd
  elif True
    if CHANCE_MUL_LE PT_BRAVECHANCE 1.25
    else
      globTempVar = globTempVar + 15 * Rnd
    endif
  endif
  immediateTempVar = globTempVar

  if ODistLE globTempVar && Equal AirGroundState 1 && Equal currGoal cg_bait_dashdance
    // if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.75 || CHANCE_MUL_LE PT_BAIT_WDASHAWAYCHANCE 0.75
    skipMainInit = mainInitSkip
    if CHANCE_MUL_LE PT_BAIT_WDASHAWAYCHANCE 0.45
      scriptVariant = sv_wavedash_out
      Call Wavedash
    endif
    scriptVariant = sv_dash_away
    if CurrAction > hex(0x3)
      label wdback
      if XDistBackEdge > -15 || XDistFrontEdge < 15
        Call DefendHub
      endif
      XGoto PerFrameChecks
      XReciever
      Seek wdback
      if Equal AirGroundState 2
        immediateTempVar = OPos * -1
        AbsStick immediateTempVar (-1)
        Button R
      elif CurrAction <= hex(0x3)
        Seek exec_dash
        Jump
      elif !(Equal CurrSubaction JumpSquat)
        Button X
      endif
      Return
    endif
    label exec_dash
    CallI DashScr
    // endif
  endif


  if Equal currGoal cg_bait_dashdance
    Return
  endif

  predictAverage immediateTempVar man_OXHitDist LevelValue
  immediateTempVar += 5
  if ODistLE immediateTempVar && Equal shouldApproach 1
    if Equal currGoal cg_bait_shield && Equal AirGroundState 1
      label startup
      Stick 1
      if Equal CurrAction hex(0x3) && AnimFrame >= 5
        Seek slide
        Jump
      elif CurrAction <= hex(0x5) && !(Equal CurrAction hex(0x0))
        Seek slide
        Jump
      endif
      Return
      label slide
      Stick 1
      Button R
      if -0.2 < XSpeed && XSpeed < 0.2
        CallI Shield
      endif
      Return
    elif Equal currGoal cg_bait_dashawayWhenApproached && Equal AirGroundState 1
      scriptVariant = sv_dash_away
      if CHANCE_MUL_LE PT_AGGRESSION 0.75
        scriptVariant = sv_dash_away_defense
      endif
      Call DashScr
    endif
  endif
  immediateTempVar += 10

  if XDistLE immediateTempVar && !(Equal shouldApproach -1)

    DynamicDiceClear dslot0
    if Equal AirGroundState 1
      #const dr_dash = 1
      #const dr_jump = 2
      #const dr_wdash = 3
      #const dr_shield = 4
      #const dr_plat = 5
      #const dr_dashthrough = 6
      #const dr_wait = 7

      predictAverage anotherTempVar man_OXHitDist LevelValue
      anotherTempVar += 10
      anotherTempVar *= OPos
      GetYDistFloorOffset anotherTempVar anotherTempVar 5 1

      DynamicDiceAdd dslot0 dr_dash PT_BAIT_DASHAWAYCHANCE
      DynamicDiceAdd dslot0 dr_jump PT_JUMPINESS
      DynamicDiceAdd dslot0 dr_wdash PT_BAIT_WDASHAWAYCHANCE
      immediateTempVar = 4 - PT_AGGRESSION
      DynamicDiceAdd dslot0 dr_shield immediateTempVar
      immediateTempVar = PT_BAITCHANCE * 3
      Abs immediateTempVar
      DynamicDiceAdd dslot0 dr_wait immediateTempVar
      if Equal anotherTempVar -1
      elif Equal shouldApproach 1 && CHANCE_MUL_LE PT_AGGRESSION 0.3
        GetCommitPredictChance immediateTempVar LevelValue
        GetAttribute anotherTempVar attr_dashInitVel 0
        if immediateTempVar < 0.6 && anotherTempVar > 1.5
          DynamicDiceAdd dslot0 dr_dashthrough 1.25
        endif
        // if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.35 || CHANCE_MUL_LE PT_BRAVECHANCE 0.3
        //   if ODistLE 15
        //     scriptVariant = sv_jump_over
        //     scriptVariant += svp_jump_fullhop
        //   else
        //     scriptVariant = sv_jump_away
        //   endif
        //   if CHANCE_MUL_LE PT_AGGRESSION 1.35
        //     currGoal = cg_attack
        //     skipMainInit = mainInitSkip
        //   endif
        //   Call JumpScr
        // endif
      endif
      GetYDistFloorOffset immediateTempVar 0 40 0
      GetColDistPosRel globTempVar anotherTempVar TopNX SCDBottom 0 40 1
      if Equal globTempVar -1 && !(Equal immediateTempVar -1) && immediateTempVar < 30
        DynamicDiceAdd dslot0 dr_plat 1 
      endif
      DynamicDiceRoll dslot0 immediateTempVar 0
      if CHANCE_MUL_GE PT_AGGRESSION 0.8
        currGoal = cg_bait_wait
        if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.35
          currGoal = cg_bait_dashdance
        endif
      endif
      if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.05
        scriptVariant = sv_dash_away
        Call DashScr
      elif CHANCE_MUL_LE PT_BAIT_WDASHAWAYCHANCE 0.05
        scriptVariant = sv_wavedash_out
        Call Wavedash
      endif
      if Equal immediateTempVar dr_dash
        scriptVariant = sv_dash_away
        if CHANCE_MUL_LE PT_AGGRESSION 0.
          scriptVariant = sv_dash_towards
        endif
        Call DashScr
      elif Equal immediateTempVar dr_dashthrough
        scriptVariant = sv_dash_through
        Call DashScr
      elif Equal immediateTempVar dr_jump
        scriptVariant = sv_jump_neutral
        if CHANCE_MUL_GE PT_AGGRESSION 0.25
          scriptVariant = sv_jump_away
        endif
        Goto getDist
        if CHANCE_MUL_LE PT_AGGRESSION 0.9 && immediateTempVar <= 100
          currGoal = cg_attack
          skipMainInit = mainInitSkip
        endif
        Call JumpScr
      elif Equal immediateTempVar dr_wdash
        scriptVariant = sv_wavedash_out
        Call Wavedash
      elif Equal immediateTempVar dr_shield
        currGoal = cg_bait_shield
      elif Equal immediateTempVar dr_wait
        currGoal = cg_bait_wait
      endif
      GetYDistFloorOffset globTempVar 0 50 0
      if globTempVar < 40 && CHANCE_MUL_LE PT_PLATCHANCE 1
        Call BoardPlatform
      endif
    elif NumJumps > 0 && CHANCE_MUL_LE PT_DJUMPINESS 0.2 && YDistFloor < 20
      
      scriptVariant = sv_jump_neutral
      if CHANCE_MUL_LE PT_AGGRESSION 0.6 && XDistLE 25
        scriptVariant = sv_jump_over
      elif Rnd < 0.5
        scriptVariant = sv_jump_away
      endif
      scriptVariant += svp_jump_fullhop
      Goto getDist
      if immediateTempVar <= 100 && CHANCE_MUL_LE PT_AGGRESSION 0.8
        currGoal = cg_attack
        skipMainInit = mainInitSkip
      endif
      Call JumpScr
    endif
  elif ODistLE globTempVar && CHANCE_MUL_LE PT_JUMPINESS 0.2 && Equal OAirGroundState 1 && Equal shouldApproach 1
    // LOGSTR str("===IN 2===")
    if CHANCE_MUL_LE PT_JUMPINESS 1 && XDistLE 25
      scriptVariant = sv_jump_over
      scriptVariant += svp_jump_fullhop
    else
      scriptVariant = sv_jump_neutral
    endif
    Goto getDist
    if CHANCE_MUL_LE PT_AGGRESSION 0.9 && immediateTempVar <= 100
      currGoal = cg_attack
      skipMainInit = mainInitSkip
    endif
    Call JumpScr
  elif Equal shouldApproach -1 && CHANCE_MUL_GE PT_AGGRESSION 0.1
    scriptVariant = sv_dash_toCenter
    Call DashScr
  endif
elif currGoal >= cg_attack && currGoal < calc(cg_attack + 1)
  if CalledFrom ExecuteAttack
    XGoto SetAttackGoal
    XReciever
    Return
  endif
  
  // if OCurrAction >= hex(0x42) && OCurrAction <= hex(0x59) && !(Equal OCurrAction hex(0x49))
  // elif Equal OCurrAction hex(0x49) && OYDistFloor > 15
  // elif Equal HitboxConnected 1 || Equal PrevAction hex(0x3C)
  // elif Equal currGoal cg_edgeguard && Equal OIsOnStage 1
  //   currGoal = cg_attack
  // endif 

  immediateTempVar = OXSpeed * 12
  GetYDistFloorOffset immediateTempVar immediateTempVar 15 1
  if Equal OAirGroundState 3
    currGoal = cg_edgeguard
  elif Equal immediateTempVar -1 && OFramesHitstun > 0 
    currGoal = cg_edgeguard
  endif

  if currGoal < cg_edgeguard
    SetDebugOverlayColor color(0xFF000088)
  else
    SetDebugOverlayColor color(0x00FFFF88)

    if OYDistBackEdge > 15 && !(Equal OAirGroundState 3) && OXDistBackEdge > 30
      SetDebugOverlayColor color(0x00FFFFFF)
      currGoal = cg_edgeguard_ledge
    elif Equal OAirGroundState 1
      currGoal = cg_attack_reversal
    else
      currGoal = cg_edgeguard
    endif
  endif
  EnableDebugOverlay

  if Equal lastAttack -1
    Goto OPosGoal
    Goto changeGoal
    Return
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

  $ifLastOrigin(grab,false)
  elif Equal currGoal cg_attack_wall
    predictAverage immediateTempVar man_OXHitDist LevelValue
    if immediateTempVar < 8
      immediateTempVar = 8
    endif
    immediateTempVar += 60
    anotherTempVar = immediateTempVar - 70
    if XDistLE immediateTempVar && !(XDistLE anotherTempVar) && CHANCE_MUL_LE PT_AGGRESSION 0.05
      Call ExecuteAttack
    endif
  endif

  EstOYCoord immediateTempVar 20
  immediateTempVar -= TopNY - YDistFloor
  $ifAerialAttack()
    if currGoal >= cg_edgeguard && OYDistBackEdge > 40
      lastAttack = -1
      Return
    endif
  endif

  // predictAverage immediateTempVar man_OXHitDist LevelValue
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
  //     endif
  //   endif
  // endif

  predictAverage anotherTempVar man_OXHitDist LevelValue
  anotherTempVar += 30
  if ODistLE anotherTempVar && currGoal < cg_attack_reversal
    if !(Equal currGoal cg_attack_wall)
      GetCommitPredictChance immediateTempVar LevelValue
      immediateTempVar *= 0.1
      if Rnd < immediateTempVar 
        if CHANCE_MUL_LE PT_WALL_CHANCE 0.75 || CHANCE_MUL_LE PT_BAITCHANCE 1
          if CHANCE_MUL_LE PT_BAITCHANCE 0.8
            currGoal = cg_bait
          else
            currGoal = cg_attack_wall
          endif
          Return
        elif CHANCE_MUL_LE PT_BAITCHANCE 0.75 || CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 0.6
          currGoal = cg_bait_dashdance
          Return
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
  shouldUpdate *= anotherTempVar
  shouldUpdate += 4

  shouldUpdate *= PT_REACTION_TIME

  MOD shouldUpdate globTempVar shouldUpdate

  Goto getODist
  anotherTempVar = 2 * PT_REACTION_TIME
  if OAnimFrame <= anotherTempVar && immediateTempVar < 5
    shouldUpdate = 2
  endif

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
  //       predictOOption immediateTempVar man_OXAttackDist LevelValue 
  //       predictionConfidence anotherTempVar man_OXAttackDist LevelValue
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
  //     if !(ODistLE immediateTempVar) && CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 1 && CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 1 && OFramesHitstun <= 0
  //       currGoal = cg_circleCamp
  //       Return
  //     endif
  //   endif
  // endif

  predictAverage immediateTempVar man_OXHitDist LevelValue
  immediateTempVar += 10
  if Equal OCurrAction hex(0x49) && currGoal < cg_edgeguard
    if ODistLE immediateTempVar && !(Equal OAirGroundState 1) 
      predictOOption immediateTempVar man_OOutOfHitstun LevelValue
      predictionConfidence globTempVar man_OOutOfHitstun LevelValue
      if Equal immediateTempVar op_hitstun_attack && Rnd < globTempVar
        Call Shield
      endif
    endif
  endif

  // if Equal anotherTempVar globTempVar && immediateTempVar > 55
  //   XGoto GoalChoiceHub
  //   XReciever
  //   Return
  // endif

  // prevents truly unreactable adjustements
  // Goto getDist
  // XReciever

  anotherTempVar = XSpeed
  Abs anotherTempVar
  anotherTempVar = 8 + anotherTempVar

  // LOGSTR str("SHOULD UPDATE?")
  // LOGVAL shouldUpdate
  // LOGVAL OCurrAction
  // PRINTLN

  scriptVariant = sv_none
  if OCurrAction <= hex(0x21) && !(Equal CurrAction hex(0xA)) && Equal OFramesHitstun 0
    if shouldUpdate <= 1
      XGoto SetAttackGoal
      XReciever
    endif

    if OCurrAction >= hex(0xB) && OCurrAction <= hex(0xD) && OAnimFrame < 20
    else
      XGoto SetAttackGoal
      XReciever
    endif
  // otherwise carry on as normal
  elif shouldUpdate <= 1 || Equal CurrAction hex(0xA) || Equal OCurrAction hex(0x49) || OFramesHitstun > 1 || Equal HitboxConnected 1
    if OAnimFrame <= 9 || Equal CurrAction hex(0xA) || Equal OCurrAction hex(0x49) || OFramesHitstun > 1 || Equal HitboxConnected 1
      anotherTempVar = OPos * -15
      GetYDistFloorOffset anotherTempVar anotherTempVar 0 0
      if Equal OCurrAction hex(0x49) || OFramesHitstun > 1 || Equal HitboxConnected 1 || Equal currGoal cg_attack_reversal
      elif Equal anotherTempVar -1 && CHANCE_MUL_GE PT_AGGRESSION 0.55 && CHANCE_MUL_GE PT_AGGRESSION 0.45 && currGoal < cg_edgeguard
        currGoal = cg_bait_dashdance
        Return
      endif

      if immediateTempVar > anotherTempVar
        GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
        if Equal immediateTempVar 1
        elif currGoal >= cg_edgeguard
        elif !(SamePlane) && CHANCE_MUL_LE PT_BAITCHANCE 1 && Rnd < 0.2 && shouldUpdate <= 1 && OFramesHitstun <= 0
          currGoal = cg_bait
          Return
        endif
        
        if OCurrAction >= hex(0xB) && OCurrAction <= hex(0xD) && OAnimFrame < 20
          scriptVariant = sv_attackgoal_justx
        endif
        
        // scriptVariant = sv_attackgoal_self
        XGoto SetAttackGoal
        XReciever
      endif
    endif
  endif
  if currGoal >= cg_edgeguard
    scriptVariant = sv_none
    XGoto SetAttackGoal
    XReciever
  endif

  // Goto getDist
  // if immediateTempVar > 35 && shouldUpdate <= 1 && ODistLE 35 && !(Equal currGoal cg_edgeguard)
  //   Goto changeGoal
  //   Return
  // endif

  scriptVariant = sv_none
  XGoto CheckAttackWillHit
  XReciever
else
  currGoal = cg_bait
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
// if OYDistBackEdge < -30
//   goalY += calc(cs_shortHopHeight - 3) 
// endif
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
  XGoto GoalChoiceHub
  XReciever
endif
Return
label forceChangeGoal
XGoto GoalChoiceHub
XReciever
Return
Return