#include <Definition_AIMain.h>
id 0x850F
unk 0x0

//= XReciever
NoRepeat

// $setLastAttack(ftilt)

// if Equal currGoal cg_edgeguard
//   if OYDistBackEdge > 0
//     $setLastAttack(dspecialair)
//   else
//     $setLastAttack(bair)
//   endif
// else
//   currGoal = cg_attack_reversal
//   if OYDistFloor > 35 || YDistFloor > 20
//     $setLastAttack(uair)
//   else
//     $setLastAttack(usmash)
//   endif
// endif

// $setLastAttack(uair_outer)

scriptVariant = sv_none
if HasCurry
  ADJUST_PERSONALITY idx_aggression 0.2 Rnd
endif
// predictAverage immediateTempVar man_OXHitDist
// LOGSTR str("oxhitdist")
// LOGVAL immediateTempVar
// PRINTLN

// currGoal = cg_attack_wall
// $setLastAttack(ftilt)

// if currGoal >= cg_attack && currGoal < calc(cg_attack + 1)
// else 
//   predictOOption immediateTempVar man_OXHitDist
//   immediateTempVar *= 0.25
//   GetCommitPredictChance anotherTempVar
//   if XDistLE immediateTempVar
//     if anotherTempVar < 0.1
//       currGoal = cg_attack
//       XGoto CalcAttackGoal
//       //= XReciever
//     elif OAnimFrame > 45 && OCurrAction <= hex(0x1) && anotherTempVar < 0.3
//       currGoal = cg_attack
//       XGoto CalcAttackGoal
//       //= XReciever
//     endif
//   endif
// endif

// if currGoal < cg_bait || currGoal > cg_bait_dashawayWhenApproached
//   currGoal = cg_bait
// endif

LOGSTR str("cg_value")
LOGVAL currGoal
PRINTLN

// if Equal goalY BBoundary
//   if currGoal >= cg_attack && currGoal < calc(cg_attack + 1)
//   else
//     Call MainHub
//   endif
// endif

#let teamCloser = var3
GetIsTeammateCloser teamCloser
if Equal teamCloser 1
  if Rnd <= 0.02
    SwitchTarget
    Return
  endif
  lastAttack = -1
  currGoal = cg_circleCamp
// elif currGoal < cg_bait
//   currGoal = cg_attack
endif
// currGoal = cg_circleCamp

{MOVE_UPDATE}

if currGoal >= cg_circleCamp && currGoal < calc(cg_circleCamp + 1)
  lastAttack = -1
  if LevelValue <= LV5
    Call MainHub
  endif
  Goto shuffleBaitCamp

  SetDebugOverlayColor color(0x0000FF88)
  EnableDebugOverlay
  GET_CHAR_TRAIT(globTempVar, chr_calc_certainty)
  globTempVar *= -1
  globTempVar += 1

  immediateTempVar = (1 - (LevelValue / 100)) * 60 + 15 * globTempVar
  immediateTempVar *= PT_REACTION_TIME
  MOD immediateTempVar GameTimer immediateTempVar
  if immediateTempVar <= 1
    globTempVar = OTopNY - TopNY
    if globTempVar > 45 || OYDistBackEdge < -20 && Equal AirGroundState 1
      GetCommitPredictChance immediateTempVar
      if CHANCE_MUL_LE PT_AGGRESSION 0.2 && XDistLE 40 && immediateTempVar < 0.125
        currGoal = cg_attack
        Return
      endif
    endif

    predictOOption immediateTempVar man_OXHitDist 
    immediateTempVar += 5
    if CHANCE_MUL_LE PT_AGGRESSION 0.25
      if XDistLE immediateTempVar 
        currGoal = cg_bait
        Return
      endif
      scriptVariant = sv_campAttack
      XGoto CalcAttackGoal
      //= XReciever
      scriptVariant = sv_none
      
      if !(Equal lastAttack -1) && !(XDistLE 20) && LevelValue >= LV6
        skipMainInit = sm_execAttack
        scriptVariant = sv_wavedash_neutral
        CallI Wavedash
      elif XDistLE 5
        currGoal = cg_attack_wall
        lastAttack = -1
        Return
      elif CHANCE_MUL_LE PT_AGGRESSION 0.15
        Goto forceChangeGoal
      endif
      lastAttack = -1
    endif
  endif
  
  
  // if Equal immediateTempVar 1 && Rnd < 0.15
  //   currGoal = cg_bait
  //   Return
  // endif

  predictAverage globTempVar man_OXHitDist
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
    if CHANCE_MUL_LE PT_AGGRESSION 0.1
      currGoal = cg_bait
      Return
    elif XDistLE globTempVar || Rnd <= 0.04
      Goto forceChangeGoal
      Return
    endif
    GET_CHAR_TRAIT(globTempVar, chr_calc_certainty)
    globTempVar *= -1
    globTempVar += 1

    immediateTempVar = (1 - (LevelValue / 100)) * 30 + 40 * globTempVar
    immediateTempVar *= PT_REACTION_TIME
    MOD immediateTempVar GameTimer immediateTempVar
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
  if LevelValue <= LV3
    currGoal = cg_attack
    Return
  endif
  Goto shuffleBaitCamp
  MOD immediateTempVar GameTimer 8
  if Equal currGoal cg_bait_attack
    if !(Equal lastAttack -1)
      skipMainInit = sm_execAttack
      CallI MainHub
    elif immediateTempVar <= 1
      XGoto CalcAttackGoal
      if !(Equal lastAttack -1)
        skipMainInit = sm_execAttack
        CallI MainHub
      endif
    endif
  endif

  lastAttack = -1
  GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
  if Equal immediateTempVar 1
    currGoal = cg_attack_reversal
    Return
  endif

  predictAverage immediateTempVar man_OXHitDist
  if immediateTempVar < 8
    immediateTempVar = 8
  endif
  DrawDebugRectOutline goalX goalY immediateTempVar immediateTempVar color(0xFFFF0088)
  immediateTempVar += 25
  DrawDebugRectOutline goalX goalY immediateTempVar immediateTempVar color(0xFFFF0044)
  
  predictAverage immediateTempVar man_OXSwingDist
  DrawDebugRectOutline goalX goalY immediateTempVar immediateTempVar color(0xFF000088)
  immediateTempVar += 25
  DrawDebugRectOutline goalX goalY immediateTempVar immediateTempVar color(0xFF000044)

  // if Equal currGoal cg_bait_attack && XDistLE immediateTempVar
  //   currGoal = cg_attack_wall
  //   Return
  // endif

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

  immediateTempVar = (1 - (LevelValue / 100)) * 40 + 14 * globTempVar
  immediateTempVar *= PT_REACTION_TIME
  MOD immediateTempVar GameTimer immediateTempVar
  globTempVar *= 18
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
    
    // GetAttribute anotherTempVar attr_dashInitVel 0
    // immediateTempVar = 2 - anotherTempVar
    // immediateTempVar *= 0.25 * PT_CIRCLECAMPCHANCE
    // if CHANCE_MUL_LE PT_AGGRESSION immediateTempVar
    //   if YDistFloor > -1 && YDistFloor < 25
    //     scriptVariant = sv_campAttack
    //     XGoto CalcAttackGoal
    //     //= XReciever
    //     if !(Equal lastAttack -1)
    //       skipMainInit = sm_execAttack
    //       CallI MainHub
    //     endif
    //     scriptVariant = sv_none
    //   endif
    // endif
    // Norm immediateTempVar OTopNX OTopNY
    // Abs immediateTempVar
    // if CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 0.005 && immediateTempVar < 35
    //   currGoal = cg_circleCamp
    //   Return
    // endif

    if Equal currGoal cg_bait_wait
      Return
    elif Equal currGoal cg_bait_dashdance
      if CHANCE_MUL_LE PT_BAITCHANCE 0.25 || CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.5 || CHANCE_MUL_LE PT_BAIT_WDASHAWAYCHANCE 0.5
        // Return
      elif CHANCE_MUL_LE PT_AGGRESSION 0.025
        // LOGSTR_NL str("FORCE AGGRO")
        currGoal = cg_bait_attack
        XGoto CalcAttackGoal
      endif
    elif !(Equal currGoal cg_bait_attack) && !(HasCurry)
      if Equal CurrAction hex(0x3) || Equal CurrAction hex(0x4)
        GetCommitPredictChance immediateTempVar
        predictAverage anotherTempVar man_OXHitDist
        if anotherTempVar < Width
          anotherTempVar = Width
        endif
        anotherTempVar += 1
        if immediateTempVar > 0.13 && !(XDistLE anotherTempVar) && CHANCE_MUL_LE PT_BAITCHANCE 0.02 && LevelValue >= LV7
          skipMainInit = mainInitSkip
          currGoal = cg_bait_wait
          if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.1
            currGoal = cg_bait_dashdance
          endif
          scriptVariant = sv_wavedash_neutral
          CallI Wavedash
          Return
        endif
      endif
    endif

    predictAverage immediateTempVar man_OXHitDist
    predictAverage anotherTempVar man_OXSwingDist
    // if CHANCE_MUL_LE PT_AGGRESSION 0.4 && YDistFloor > -1 && YDistFloor < 15 && !(XDistLE immediateTempVar) && XDistLE anotherTempVar
      
    // endif

    if CHANCE_MUL_LE PT_AGGRESSION 0.05 && CHANCE_MUL_LE PT_BAITCHANCE 0.05
      currGoal = cg_bait_attack
    elif CHANCE_MUL_LE PT_WALL_CHANCE 0.15
      currGoal = cg_attack_wall
    endif

    // if !(Equal currGoal cg_bait_shield) && CHANCE_MUL_LE PT_BAITCHANCE 1 && Equal teamCloser 0
    //   predictAverage immediateTempVar man_OXHitDist
    //   if immediateTempVar < 8
    //     immediateTempVar = 8
    //   endif
    //   immediateTempVar += 100
    //   anotherTempVar = immediateTempVar - 70
    //   if XDistLE immediateTempVar && !(XDistLE anotherTempVar) && CHANCE_MUL_LE PT_AGGRESSION 0.3
    //     if CHANCE_MUL_LE PT_BRAVECHANCE 0.4
    //       if CHANCE_MUL_LE PT_WALL_CHANCE 0.35
    //         currGoal = cg_attack_wall
    //       else  
    //         currGoal = cg_bait_attack
    //       endif
    //       XGoto CalcAttackGoal
    //       //= XReciever
          
    //       if !(Equal lastAttack -1)
    //         skipMainInit = sm_execAttack
    //         CallI MainHub
    //       endif
    //     endif
    //   elif XDistLE anotherTempVar && CHANCE_MUL_LE PT_AGGRESSION 0.7
    //     GetCommitPredictChance immediateTempVar
    //     if CHANCE_MUL_LE PT_BRAVECHANCE 0.75 && immediateTempVar < 0.35
    //       if CHANCE_MUL_LE PT_WALL_CHANCE 0.85
    //         currGoal = cg_attack_wall
    //       else  
    //         currGoal = cg_bait_attack
    //       endif
    //       XGoto CalcAttackGoal
    //       //= XReciever
          
    //       if !(Equal lastAttack -1)
    //         skipMainInit = sm_execAttack
    //         CallI MainHub
    //       endif
    //     endif
    //   endif
    // endif
  endif

  if Equal currGoal cg_bait_wait
    Return
  endif

  #let shouldApproach = var1
  shouldApproach = 1
  predictAverage anotherTempVar man_OXHitDist
  if anotherTempVar < Width
    anotherTempVar = Width
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
    predictAverage anotherTempVar man_OXHitDist
  endif

  Goto getDist
  GetCommitPredictChance anotherTempVar
  if immediateTempVar >= 55 || anotherTempVar < 0.12
    shouldApproach = 1
  elif CHANCE_MUL_LE PT_BAITCHANCE 0.1 || anotherTempVar > 0.18
    shouldApproach = -1
  endif 

  predictAverage anotherTempVar man_OXSwingDist
  predictAverage globTempVar man_OXHitDist
  if globTempVar < Width
    globTempVar = Width + OWidth
  endif
  if anotherTempVar < globTempVar
    anotherTempVar = globTempVar
  endif
  immediateTempVar = 15 * Rnd
  if !(Equal shouldApproach 1)
    globTempVar += immediateTempVar
  elif CHANCE_MUL_LE PT_BRAVECHANCE 1.25
  else
    globTempVar += immediateTempVar
  endif

  immediateTempVar = globTempVar
  if XDistLE anotherTempVar && Equal AirGroundState 1 && Equal currGoal cg_bait_dashdance
    label dashdance_exec
    if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.25
      skipMainInit = mainInitSkip
    endif
    if CHANCE_MUL_LE PT_BAIT_WDASHAWAYCHANCE 0.45 && LevelValue >= LV7
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
      //= XReciever
      Seek wdback
      if Equal AirGroundState 2
        immediateTempVar = OPos * -1
        AbsStick immediateTempVar (-1)
        Button R
      elif CurrAction <= hex(0x3)
        Seek exec_dash
        Jump
      elif !(Equal CurrSubaction JumpSquat) && NoJumpPrevFrame
        Button X
      endif
      Return
    endif
    label exec_dash
    scriptVariant = sv_dash_outOfRange
    CallI DashScr
    // endif
  endif

  if Equal currGoal cg_bait_dashdance && XDistLE anotherTempVar
    if YDistFloor > 1
      scriptVariant = sv_aerialdrift_away
      skipMainInit = mainInitSkip
      CallI AerialDrift
    endif
    // GetCommitPredictChance immediateTempVar
    // anotherTempVar = 1 - immediateTempVar
    // anotherTempVar *= 2
    // if CHANCE_MUL_GE PT_BAITCHANCE anotherTempVar
    //   currGoal = cg_attack
    // endif
    Return
  endif

  predictAverage globTempVar man_OXSwingDist
  globTempVar += 5
  if XDistLE globTempVar
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
      XGoto PerFrameChecks
      Seek startup
      Return
      label slide
      if Equal AirGroundState 2
        Call MainHub
      endif
      Stick 1
      Button R
      if -0.2 < XSpeed && XSpeed < 0.2
        CallI Shield
      endif
      XGoto PerFrameChecks
      Seek slide
      Return
    elif Equal currGoal cg_bait_dashawayWhenApproached && Equal AirGroundState 1
      scriptVariant = sv_dash_away_defense
      Call DashScr
    endif
  endif
  anotherTempVar += Width

  predictAverage globTempVar man_OXHitDist
  if XDistLE anotherTempVar && !(Equal shouldApproach -1) || XDistLE globTempVar
    DynamicDiceClear dslot0
    if Equal AirGroundState 1
      #const dr_dash = 1
      #const dr_jump = 2
      #const dr_wdash = 3
      #const dr_shield = 4
      #const dr_plat = 5
      #const dr_dashthrough = 6
      #const dr_wait = 7
      #const dr_dashdance = 8

      predictAverage anotherTempVar man_OXSwingDist
      anotherTempVar += 10
      anotherTempVar *= OPos
      GetYDistFloorOffset anotherTempVar anotherTempVar 5 1

      DynamicDiceAdd dslot0 dr_dash PT_BAIT_DASHAWAYCHANCE
      DynamicDiceAdd dslot0 dr_jump PT_JUMPINESS
      DynamicDiceAdd dslot0 dr_wdash PT_BAIT_WDASHAWAYCHANCE
      immediateTempVar = 4 - PT_AGGRESSION
      DynamicDiceAdd dslot0 dr_shield immediateTempVar
      immediateTempVar = PT_BAITCHANCE * 2.5
      Abs immediateTempVar
      DynamicDiceAdd dslot0 dr_wait immediateTempVar
      immediateTempVar *= 1.5
      DynamicDiceAdd dslot0 dr_dashdance immediateTempVar
      

      if Equal anotherTempVar -1
      elif Equal shouldApproach 1 && CHANCE_MUL_LE PT_AGGRESSION 0.3
        GetCommitPredictChance immediateTempVar
        GetAttribute anotherTempVar attr_dashInitVel 0
        if immediateTempVar < 0.1 && anotherTempVar > 1.5
          DynamicDiceAdd dslot0 dr_dashthrough 1.25
        endif
      endif
      GetYDistFloorOffset immediateTempVar 0 40 0
      GetColDistPosRel globTempVar anotherTempVar TopNX SCDBottom 0 40 1
      if Equal globTempVar -1 && !(Equal immediateTempVar -1) && immediateTempVar < 30
        DynamicDiceAdd dslot0 dr_plat 1 
      endif
      if CHANCE_MUL_GE PT_AGGRESSION 0.5
        currGoal = cg_bait_wait
        if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.05
          currGoal = cg_bait_dashdance
        endif
      endif
      if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.10 && LevelValue >= LV4
        scriptVariant = sv_dash_outOfRange
        currGoal = cg_attack_wall
        Call DashScr
      elif CHANCE_MUL_LE PT_BAIT_WDASHAWAYCHANCE 0.10 && LevelValue >= LV7
        scriptVariant = sv_wavedash_out
        Call Wavedash
      endif
      DynamicDiceRoll dslot0 immediateTempVar 0
      if Equal immediateTempVar dr_dash
        scriptVariant = sv_dash_outOfRange
        if CHANCE_MUL_LE PT_AGGRESSION 0.15 && LevelValue >= LV5
          // scriptVariant = sv_dash_towards
          currGoal = cg_attack_wall
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
        scriptVariant += svp_jump_fullhop
        Goto getDist
        if CHANCE_MUL_LE PT_AGGRESSION 0.35 && immediateTempVar <= 35
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
      elif Equal immediateTempVar dr_dashdance
        currGoal = cg_bait_dashdance
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
      if immediateTempVar <= 30 && CHANCE_MUL_LE PT_AGGRESSION 0.35
        currGoal = cg_attack
        skipMainInit = mainInitSkip
      endif
      Call JumpScr
    endif
  elif XDistLE globTempVar && CHANCE_MUL_LE PT_JUMPINESS 0.2 && Equal OAirGroundState 1 && Equal shouldApproach 1
    // LOGSTR str("===IN 2===")
    if CHANCE_MUL_LE PT_JUMPINESS 1 && XDistLE 25
      scriptVariant = sv_jump_over
      scriptVariant += svp_jump_fullhop
    else
      scriptVariant = sv_jump_neutral
    endif
    Goto getDist
    if CHANCE_MUL_LE PT_AGGRESSION 0.9 && immediateTempVar <= 40
      currGoal = cg_attack
      skipMainInit = mainInitSkip
    endif
    Call JumpScr
  elif Equal shouldApproach -1 && CHANCE_MUL_GE PT_AGGRESSION 0.65
    if CHANCE_MUL_LE PT_WALL_CHANCE 0.25
      lastAttack = -1
      currGoal = cg_attack_wall
      skipMainInit = mainInitSkip
    elif CHANCE_MUL_LE PT_AGGRESSION 0.15
      lastAttack = -1
      currGoal = cg_bait_attack
      skipMainInit = mainInitSkip
    endif
    scriptVariant = sv_dash_toCenter
    Call DashScr
  endif
elif currGoal >= cg_attack && currGoal < calc(cg_attack + 1)
  if CalledFrom ExecuteAttack
    XGoto SetAttackGoal
    //= XReciever
    Return
  endif
  
  GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
  if immediateTempVar > 0
    if currGoal < cg_attack_reversal || Equal OIsOnStage 1 && currGoal >= cg_edgeguard 
      currGoal = cg_attack_reversal
    endif
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

  if currGoal >= cg_edgeguard && Equal OIsOnStage 1 && OYDistFloor < 60
    currGoal = cg_attack
  endif

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

    if Rnd < 0.02 && !(Equal OAirGroundState 3) && OYDistBackEdge > 0 && YDistFloor > 0 && DistToOEdge < 40 && OXDistBackEdge > 20 
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

  MOD immediateTempVar GameTimer 4
  if Equal lastAttack -1 && immediateTempVar >= 3
    Goto OPosGoal
    Goto changeGoal
    Return
  elif OFramesHitstun <= 0 && OFramesHitlag <= 0 && !(ODistLE 35) 
    MOD immediateTempVar GameTimer 60
    if immediateTempVar >= 59
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
  shouldUpdate = (1 - (LevelValue / 100)) * 45 + 4
  // standard
  GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
  if Equal immediateTempVar 0
    shouldUpdate = (1 - (LevelValue / 100)) * 60 + 10
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

  MOD shouldUpdate GameTimer shouldUpdate

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
    endif

    // predictAverage immediateTempVar man_OAvgEndlag
    // LOGSTR str("avg endl")
    // LOGVAL immediateTempVar
    // PRINTLN

    MOD immediateTempVar GameTimer 8
    if LevelValue >= LV7 && OCurrAction <= hex(0x20) && immediateTempVar <= 1 && currGoal < cg_attack_shieldPunish
      predictAverage immediateTempVar man_OXHitDist
      anotherTempVar = Width + OWidth + 5
      immediateTempVar += anotherTempVar
      if XDistLE anotherTempVar immediateTempVar
        GetCommitPredictChance immediateTempVar
        anotherTempVar = immediateTempVar * 1.5
        if immediateTempVar >= 0.13
          // predictAverage immediateTempVar man_OAvgEndlag
          if CHANCE_MUL_GE PT_AGGRESSION anotherTempVar //|| immediateTempVar >= 15
            Goto aggressiveWait
          endif
        endif
      endif
    endif
  elif shouldUpdate <= 1 || Equal CurrAction hex(0xA) || Equal OCurrAction hex(0x49) || OFramesHitstun > 1 || Equal HitboxConnected 1    

    if immediateTempVar > anotherTempVar
      GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
      if Equal immediateTempVar 1
      elif currGoal >= cg_edgeguard
      elif !(SamePlane) && CHANCE_MUL_LE PT_BAITCHANCE 0.15 && Rnd < 0.2 && OFramesHitstun <= 0
        currGoal = cg_bait
        Return
      endif
    endif

    if !(Equal currGoal cg_attack_shieldPunish) && !(XDistLE 15)
      GET_CHAR_TRAIT(globTempVar, chr_get_OEndlagSafe)
      if Equal globTempVar -500
        if CHANCE_MUL_GE PT_AGGRESSION 0.5
          currGoal = cg_bait_shield
        else
          Goto aggressiveWait
        endif
      endif
    endif
    // scriptVariant = sv_attackgoal_self
    XGoto SetAttackGoal
    //= XReciever
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
label shuffleBaitCamp
  MOD immediateTempVar GameTimer 450
  if immediateTempVar >= 449
    Call MainHub
  endif
Return
label changeGoal
  XGoto CalcAttackGoal
Return
label forceChangeGoal
  if CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 0.35 || Equal currGoal cg_circleCamp && Rnd < 0.75
    XGoto CircleCampGoal
  else
    XGoto RandomizeGoal
  endif
Return
label aggressiveWait
  anotherTempVar = LevelValue + 2
  immediateTempVar = Rnd * anotherTempVar
  if lastAttack >= 0 && LevelValue >= LV5
    if CHANCE_MUL_LE PT_AGGRESSION 0.10
      currGoal = cg_attack_shieldPunish
    elif CHANCE_MUL_LE PT_AGGRESSION 0.2
      currGoal = cg_attack_wall
    endif
  endif
  if immediateTempVar > 10 && !(HasCurry)
    if YDistFloor > 5 && NumJumps > 0 && SamePlane
      Button X
    elif Equal AirGroundState 1
      skipMainInit = mainInitSkip
      Seek dashdance_exec
      Jump
    else
      skipMainInit = mainInitSkip
      scriptVariant = sv_jump_neutral
      Call JumpScr
    endif
  endif
Return
Return