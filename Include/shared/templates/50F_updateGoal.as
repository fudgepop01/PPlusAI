#include <Definition_AIMain.h>
id 0x850F
unk 0x0

XReciever
scriptVariant = sv_none

#let OCommitAttack = var0
GetCommitPredictChance OCommitAttack LevelValue
if currGoal >= cg_attack && currGoal < calc(cg_attack + 1)
elif OCommitAttack >= 0.35
  if CHANCE_MUL_LE PT_AGGRESSION 0.25
    currGoal = cg_attack_undershoot
  else
    currGoal = cg_bait_dashawayWhenApproached
  endif
elif OCommitAttack >= 0.2
  if CHANCE_MUL_LE PT_AGGRESSION 0.75
    currGoal = cg_attack_undershoot
  else
    currGoal = cg_bait_shield
  endif
endif
#let OCommitGrab = var0
PredictOMov OCommitGrab mov_grab LevelValue
if OCommitGrab >= 0.25
  if CHANCE_MUL_LE PT_AGGRESSION 0.75
    currGoal = cg_attack_undershoot
  elif CHANCE_MUL_LE PT_AGGRESSION 0.5
    currGoal = cg_bait_dashawayWhenApproached
  else
    currGoal = cg_bait_dashdance
  endif
endif

if Equal goalY BBoundary
  XGoto GoalChoiceHub
  XReciever
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

// if OYDistBackEdge >= -10 && OCurrAction >= hex(0x45) && OCurrAction <= hex(0x55) && Equal OIsOnStage 1
//   $ifLastAttack(fthrow)
//     lastAttack = -1
//   $elifLastAttack(dthrow)
//     lastAttack = -1
//   $elifLastAttack(bthrow)
//     lastAttack = -1
//   $elifLastAttack(uthrow)
//     lastAttack = -1
//   endif
// endif
#let OEndLag = var0
OEndLag = -1
immediateTempVar = (1 - (LevelValue / 100)) * 30
immediateTempVar *= PT_REACTION_TIME
if immediateTempVar <= 1
  Goto EndlagCheck
endif
if currGoal >= cg_circleCamp && currGoal < calc(cg_circleCamp + 1)
  Norm immediateTempVar TopNX TopNY
  Norm globTempVar OTopNX OTopNY
  Abs immediateTempVar
  Abs globTempVar
  if immediateTempVar < globTempVar
    currGoal = cg_bait
    Return
  endif

  SetDebugOverlayColor color(0x0000FF88)
  EnableDebugOverlay
  GET_CHAR_TRAIT(globTempVar, chr_calc_certainty)
  globTempVar = (1 - globTempVar)
  immediateTempVar = (1 - (LevelValue / 100)) * 30 + 10 * globTempVar
  immediateTempVar *= PT_REACTION_TIME

  MOD immediateTempVar AnimFrame immediateTempVar
  if immediateTempVar <= 1
    globTempVar = OTopNY - TopNY
    if globTempVar > 45 || OYDistBackEdge < -35 && Equal AirGroundState 1
      if CHANCE_MUL_LE PT_AGGRESSION 1.4
        currGoal = cg_attack
        Return
      endif
    endif

    // predictOOption immediateTempVar man_OXHitDist LevelValue 
    // immediateTempVar += 10
    if CHANCE_MUL_LE PT_AGGRESSION 1.25
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
        XGoto GoalChoiceHub
        XReciever
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
    XGoto GoalChoiceHub
    XReciever
    Return
  endif

  globTempVar = immediateTempVar * 0.75
  Goto getDist
  if globTempVar < immediateTempVar
    XGoto GoalChoiceHub
    XReciever
    Return
  endif

  Goto getDist
  if immediateTempVar <= 13
    if ODistLE globTempVar || Rnd <= 0.04
      XGoto GoalChoiceHub
      XReciever
      Return
    endif
    GET_CHAR_TRAIT(globTempVar, chr_calc_certainty)
    globTempVar = (1 - globTempVar)
    immediateTempVar = (1 - (LevelValue / 100)) * 30 + 10 * globTempVar
    immediateTempVar *= PT_REACTION_TIME
    MOD immediateTempVar AnimFrame immediateTempVar
    // $LV9Check(immediateTempVar = 1)
    if immediateTempVar <= 1
      // Goto EndlagCheck

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
  GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
  if Equal immediateTempVar 1
    currGoal = cg_attack
    Return
  endif

  SetDebugOverlayColor color(0xFF00FF88)
  if Equal currGoal cg_bait_dashdance
    SetDebugOverlayColor color(0xFF00FFFF)
  endif
  EnableDebugOverlay

  GET_CHAR_TRAIT(globTempVar, chr_calc_certainty)
  globTempVar = (1 - globTempVar)
  immediateTempVar = (1 - (LevelValue / 100)) * 30 + 10 * globTempVar

  immediateTempVar *= PT_REACTION_TIME
  MOD immediateTempVar AnimFrame immediateTempVar
  // $LV9Check(immediateTempVar = 1)
  if immediateTempVar <= 1 && OAnimFrame > globTempVar
    predictAverage immediateTempVar man_OXHitDist LevelValue
    immediateTempVar += 15
    if Equal currGoal cg_bait && ODistLE immediateTempVar && CHANCE_MUL_LE PT_AGGRESSION 0.65
      if !(OAttacking) || !(Equal OEndLag -1)
        currGoal = cg_attack
        Return
      endif
    endif

    Goto OPosGoal

    globTempVar = OTopNY - TopNY
    if globTempVar > 45 || OYDistBackEdge < -35 && Equal AirGroundState 1
      if CHANCE_MUL_LE PT_AGGRESSION 1.25
        currGoal = cg_attack
        Return
      endif
    endif
    
    if Equal currGoal cg_bait_wait
      Return
    endif

    if !(Equal currGoal cg_bait_shield) && !(Equal currGoal cg_bait_dashdance) && !(Equal currGoal cg_bait_dashawayWhenApproached)
      predictOOption immediateTempVar man_OXAttackDist LevelValue 
      predictionConfidence anotherTempVar man_OXAttackDist LevelValue
      if Equal immediateTempVar op_attack_close && Rnd < anotherTempVar
        if CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 1 && Equal teamCloser 0
          if CHANCE_MUL_LE PT_BAITCHANCE 0.25
            currGoal = cg_bait_dashdance
          else 
            currGoal = cg_circleCamp
          endif
        endif
        immediateTempVar = 1
        Return
      elif Equal immediateTempVar op_attack_mid && Rnd < anotherTempVar && CHANCE_MUL_LE PT_BRAVECHANCE 1
        immediateTempVar = 1
      else
        immediateTempVar = 0
      endif

      predictAverage immediateTempVar man_OXHitDist LevelValue
      immediateTempVar += 10
      anotherTempVar = immediateTempVar - 20
      if XDistLE immediateTempVar && !(XDistLE anotherTempVar) && CHANCE_MUL_LE PT_AGGRESSION 0.65 && Equal teamCloser 0
        if CHANCE_MUL_LE PT_BRAVECHANCE 0.5
          if CHANCE_MUL_LE PT_WALL_CHANCE 0.75
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
        currGoal = cg_attack
        Return
      endif
    endif

    #let shouldApproach = var1
    shouldApproach = 1
    predictAverage anotherTempVar man_OXHitDist LevelValue
    if anotherTempVar < 8
      anotherTempVar = 8
    endif
    anotherTempVar += 45
    anotherTempVar *= OPos
    
    Norm immediateTempVar TopNX TopNY
    Norm globTempVar OTopNX OTopNY
    Abs immediateTempVar
    Abs globTempVar

    GetYDistFloorOffset anotherTempVar anotherTempVar 5 1
    if Equal currGoal cg_edgeguard
    elif Equal anotherTempVar -1 || Equal teamCloser 1 || immediateTempVar < globTempVar
      shouldApproach = 0
      predictAverage anotherTempVar man_OXHitDist LevelValue
      goalX -= anotherTempVar
    endif

    Goto getDist
    if immediateTempVar >= 120 && !(Equal shouldApproach 0)
      shouldApproach = 1
    elif CHANCE_MUL_LE PT_BAITCHANCE 0.3
      shouldApproach = -1
    endif 

    predictAverage globTempVar man_OXHitDist LevelValue
    if !(Equal shouldApproach 1)
      globTempVar = globTempVar + 15 * Rnd + 10
    elif True
      if CHANCE_MUL_LE PT_BRAVECHANCE 1 && CHANCE_MUL_LE PT_BRAVECHANCE 0.75
      else
        globTempVar = globTempVar + 15 * Rnd + 10
      endif
    endif
    immediateTempVar = globTempVar

    globTempVar += 20
    GetAttribute anotherTempVar attr_dashInitVel 0
    anotherTempVar *= 2
    globTempVar -= anotherTempVar
    GetAttribute anotherTempVar attr_dashInitVel 1
    anotherTempVar *= 4
    globTempVar += anotherTempVar
    if ODistLE globTempVar && Equal AirGroundState 1 && Equal currGoal cg_bait_dashdance
      if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.45 || CHANCE_MUL_LE PT_BAIT_WDASHAWAYCHANCE 0.45
        skipMainInit = mainInitSkip
        if CHANCE_MUL_LE PT_BAIT_WDASHAWAYCHANCE 0.5
          scriptVariant = sv_wavedash_out
          Call Wavedash
        endif
        scriptVariant = sv_dash_away
        Call DashScr
      endif
    elif CHANCE_MUL_LE PT_AGGRESSION 0.2 && Equal AirGroundState 1 && !(ODistLE immediateTempVar)
      predictAverage immediateTempVar man_OXHitDist LevelValue
      immediateTempVar += 30
      if CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 0.75
        currGoal = cg_camp_attack
        XGoto CalcAttackGoal
        XReciever
        currGoal = cg_bait
        if !(Equal lastAttack -1)
          skipMainInit = sm_execAttack
          CallI MainHub
        else
          XGoto GoalChoiceHub
          XReciever
          Return
        endif
      elif CHANCE_MUL_LE PT_BAITCHANCE 0.45 || XDistLE immediateTempVar
        currGoal = cg_attack_undershoot
        if XDistLE immediateTempVar && CHANCE_MUL_LE PT_AGGRESSION 0.2
          currGoal = cg_attack
        endif
        XGoto CalcAttackGoal
        XReciever
        Return
      endif
    endif

    immediateTempVar += 13
    if ODistLE immediateTempVar
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
        scriptVariant = sv_dash_away_defense
        Call DashScr
      endif
    endif
    immediateTempVar -= 13

    if XDistLE immediateTempVar && !(Equal shouldApproach -1)
      // LOGSTR str("===IN 1===")

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
        GetYDistFloorOffset anotherTempVar anotherTempVar 5 0

        DynamicDiceAdd dslot0 dr_dash 1
        DynamicDiceAdd dslot0 dr_jump 2
        DynamicDiceAdd dslot0 dr_wdash 1
        DynamicDiceAdd dslot0 dr_shield 1
        DynamicDiceAdd dslot0 dr_wait 1
        if Equal anotherTempVar -1
        elif Equal shouldApproach 1 && CHANCE_MUL_LE PT_AGGRESSION 0.7
          DynamicDiceAdd dslot0 dr_dashthrough 4
          if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.35 || CHANCE_MUL_LE PT_BRAVECHANCE 0.55
            if ODistLE 15
              scriptVariant = sv_jump_over
              scriptVariant += svp_jump_fullhop
            else
              scriptVariant = sv_jump_away
            endif
            if CHANCE_MUL_LE PT_AGGRESSION 0.9
              currGoal = cg_attack
              skipMainInit = mainInitSkip
            endif
            Call JumpScr
          endif
        endif
        GetYDistFloorOffset immediateTempVar 0 40 0
        GetColDistPosRel globTempVar anotherTempVar TopNX SCDBottom 0 40 1
        if Equal globTempVar -1 && !(Equal immediateTempVar -1) && immediateTempVar < 40
          DynamicDiceAdd dslot0 dr_plat 1 
        endif
        DynamicDiceRoll dslot0 immediateTempVar 0
        if CHANCE_MUL_GE PT_AGGRESSION 0.6
          currGoal = cg_bait_wait
        endif
        if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.6
          scriptVariant = sv_dash_away
          Call DashScr
        elif CHANCE_MUL_LE PT_BAIT_WDASHAWAYCHANCE 0.6
          scriptVariant = sv_wavedash_out
          Call Wavedash
        endif
        if Equal immediateTempVar dr_dash
          scriptVariant = sv_dash_away
          if CHANCE_MUL_LE PT_AGGRESSION 1.4
            scriptVariant = sv_dash_towards
          endif
          Call DashScr
        elif Equal immediateTempVar dr_dashthrough
          scriptVariant = sv_dash_through
          Call DashScr
        elif Equal immediateTempVar dr_jump
          scriptVariant = sv_jump_neutral
          if CHANCE_MUL_GE PT_AGGRESSION 1.2
            scriptVariant = sv_jump_away
          endif
          Goto getDist
          if CHANCE_MUL_LE PT_AGGRESSION 0.95 && immediateTempVar <= 30
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
        if globTempVar > -40 && CHANCE_MUL_LE PT_PLATCHANCE 1
          Call BoardPlatform
        endif
      elif NumJumps > 0 && CHANCE_MUL_LE PT_DJUMPINESS 1 && CHANCE_MUL_LE PT_DJUMPINESS 1 && YDistFloor < 20
        
        scriptVariant = sv_jump_neutral
        if CHANCE_MUL_LE PT_AGGRESSION 1.25 && XDistLE 25
          scriptVariant = sv_jump_over
        elif Rnd < 0.5
          scriptVariant = sv_jump_away
        endif
        scriptVariant += svp_jump_fullhop
        Call JumpScr
      endif
    elif ODistLE globTempVar && CHANCE_MUL_LE PT_JUMPINESS 1 && Equal OAirGroundState 1 && Equal shouldApproach 1
      // LOGSTR str("===IN 2===")
      if CHANCE_MUL_LE PT_JUMPINESS 1 && XDistLE 25
        scriptVariant = sv_jump_over
        scriptVariant += svp_jump_fullhop
      else
        scriptVariant = sv_jump_neutral
      endif
      if CHANCE_MUL_LE PT_AGGRESSION 1.1 && immediateTempVar <= 30
        currGoal = cg_attack
        skipMainInit = mainInitSkip
      endif
      Call JumpScr
    elif True
      // LOGSTR str("===IN 3===")
      // Goto OPosGoal
      // if Equal shouldApproach 1
      // elif True
      //   predictAverage immediateTempVar man_OXHitDist LevelValue
      //   immediateTempVar += 15
      //   goalX = goalX + immediateTempVar * OPos * -1 
      // endif
    endif

    // Goto EndlagCheck
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

  if !(Equal currGoal cg_edgeguard)
    SetDebugOverlayColor color(0xFF000088)
  else
    SetDebugOverlayColor color(0x00FFFF88)
  endif
  EnableDebugOverlay

  if Equal lastAttack -1
    Goto changeGoal
    Return
  endif

  $ifLastOrigin(grab,false)
    if CHANCE_MUL_LE PT_AGGRESSION 0.45
      if Equal OCurrAction hex(0x4A) || Equal OCurrAction hex(0x4D) || Equal OCurrAction hex(0x53) || Equal OCurrAction hex(0x54)
        Goto changeGoal
        Return
      elif OCurrAction >= hex(0x44) && OCurrAction <= hex(0x49) || Equal OCurrAction hex(0x42)
        if OYDistBackEdge > -8 && OYSpeed < 0
          Goto changeGoal
          Return
        endif
      endif 
    endif
  endif
  $ifAerialAttack()
  elif YDistFloor > 25
    Goto changeGoal
    Return
  endif

  predictAverage immediateTempVar man_OXHitDist LevelValue
  immediateTempVar += 10
  if Equal currGoal cg_attack_crossup && XDistLE immediateTempVar
    scriptVariant = sv_jump_over
    scriptVariant += svp_jump_fullhop
    skipMainInit = mainInitSkip
    currGoal = cg_attack_reversal
    CallI JumpScr 
  endif

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


  #let shouldApproach = var1
  shouldApproach = 1
  predictAverage anotherTempVar man_OXHitDist LevelValue
  anotherTempVar += 10
  anotherTempVar *= OPos
  GetYDistFloorOffset anotherTempVar anotherTempVar 5 1
  if Equal anotherTempVar -1 && !(Equal currGoal cg_edgeguard) && !(Equal currGoal cg_attack_reversal)
    shouldApproach = 0
    if !(Equal currGoal cg_attack_wall) && !(Equal currGoal cg_attack_undershoot)
      if CHANCE_MUL_LE PT_WALL_CHANCE 0.75 || CHANCE_MUL_LE PT_BAITCHANCE 1
        if CHANCE_MUL_LE PT_BAITCHANCE 1
          currGoal = cg_attack_undershoot
        else
          currGoal = cg_attack_wall
        endif
        lastAttack = -1
        Return
      elif CHANCE_MUL_LE PT_BAITCHANCE 0.1 || CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 0.1
        currGoal = cg_bait_dashdance
        lastAttack = -1
        Return
      endif
    endif
  endif

  LOGSTR str("==ATTACK:")
  $printMoveName()
  
  #let shouldUpdate = var2
  // combos
  shouldUpdate = (1 - (LevelValue / 100)) * 25 + 1
  globTempVar = OAnimFrame - 15
  // standard
  GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
  if Equal immediateTempVar 1
  else
    shouldUpdate = (1 - (LevelValue / 100)) * 30 + 2
    globTempVar = OAnimFrame - 25
  endif

  GET_CHAR_TRAIT(anotherTempVar, chr_calc_certainty)
  anotherTempVar = (1 - anotherTempVar)
  shouldUpdate *= anotherTempVar
  shouldUpdate += 4

  shouldUpdate *= PT_REACTION_TIME

  MOD shouldUpdate globTempVar shouldUpdate

  Goto getODist
  anotherTempVar = 12 * PT_REACTION_TIME
  if OAnimFrame <= anotherTempVar && globTempVar < 25
    shouldUpdate = 2
  endif

  GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
  globTempVar = OTopNY - TopNY
  if Equal immediateTempVar 1
    if globTempVar > 30 || OYDistBackEdge < -35 && Equal AirGroundState 1
    elif !(Equal currGoal cg_attack_reversal) && OYDistFloor < 45
    elif Equal currGoal cg_edgeguard
    elif True
      if shouldUpdate <= 1
        predictOOption immediateTempVar man_OXAttackDist LevelValue 
        predictionConfidence anotherTempVar man_OXAttackDist LevelValue
        if Equal immediateTempVar op_attack_close && Rnd < anotherTempVar
          currGoal = cg_bait
          Return
        elif Equal immediateTempVar op_attack_mid && CHANCE_MUL_GE PT_BRAVECHANCE 0.5
          currGoal = cg_bait_dashdance
          Return
        elif Equal immediateTempVar op_attack_far && Rnd < anotherTempVar
          currGoal = cg_circleCamp
          Return
        endif
      endif
      if shouldUpdate <= 1 && Equal shouldApproach 0 && CHANCE_MUL_GE PT_BRAVECHANCE 0.5 && Equal AirGroundState 1
        currGoal = cg_bait_dashdance
        Return
      endif
      immediateTempVar += 30
      if !(ODistLE immediateTempVar) && CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 1 && CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 1 && OFramesHitstun <= 0
        currGoal = cg_circleCamp
        Return
      endif
    endif
  endif

  predictAverage immediateTempVar man_OXHitDist LevelValue
  immediateTempVar += 20
  if Equal OCurrAction hex(0x49) && !(Equal currGoal cg_edgeguard)
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
  Goto getDist
  XReciever

  anotherTempVar = XSpeed
  Abs anotherTempVar
  anotherTempVar = 8 + anotherTempVar

  scriptVariant = sv_none
  if OCurrAction <= hex(0x21) && !(Equal CurrAction hex(0xA)) && Equal OFramesHitstun 0
    if shouldUpdate <= 1 && !(Equal currGoal cg_edgeguard)
      anotherTempVar = OPos * -15
      GetYDistFloorOffset anotherTempVar anotherTempVar 0 0
      if Equal anotherTempVar -1 && CHANCE_MUL_GE PT_AGGRESSION 0.8
        currGoal = cg_bait_dashdance
        Return
      endif

      if XSpeed > -0.6 && XSpeed < 0.6 && XDistLE 10
        // scriptVariant = sv_attackgoal_self
        XGoto SetAttackGoal
        XReciever
      endif
    endif

    scriptVariant = sv_attackgoal_justy
    if OCurrAction >= hex(0xB) && OCurrAction <= hex(0xD) && OAnimFrame < 20
    else
      // scriptVariant = sv_attackgoal_self
      XGoto SetAttackGoal
      XReciever
    endif
  // otherwise carry on as normal
  elif shouldUpdate <= 1 || Equal CurrAction hex(0xA) || Equal OCurrAction hex(0x49) || OFramesHitstun > 1 || Equal HitboxConnected 1
    if OAnimFrame <= 9 || Equal CurrAction hex(0xA) || Equal OCurrAction hex(0x49) || OFramesHitstun > 1 || Equal HitboxConnected 1
      anotherTempVar = OPos * -15
      GetYDistFloorOffset anotherTempVar anotherTempVar 0 0
      if Equal OCurrAction hex(0x49) || OFramesHitstun > 1 || Equal HitboxConnected 1
      elif Equal anotherTempVar -1 && CHANCE_MUL_GE PT_AGGRESSION 0.85 && CHANCE_MUL_GE PT_AGGRESSION 0.65 && !(Equal currGoal cg_edgeguard)
        currGoal = cg_bait_dashdance
        Return
      endif

      if immediateTempVar > anotherTempVar
        GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
        if Equal immediateTempVar 1
        elif Equal currGoal cg_edgeguard
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
  if Equal currGoal cg_edgeguard
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
  Goto getDist
  if immediateTempVar <= 8
    XGoto GoalChoiceHub
    XReciever
    Return
  endif
endif
Return
label EndlagCheck
GET_CHAR_TRAIT(OEndLag, chr_get_OEndlag)
predictAverage immediateTempVar man_OXHitDist LevelValue
anotherTempVar = OEndLag * 1.35
immediateTempVar += anotherTempVar + 10
if Equal currGoal cg_attack_reversal || Equal currGoal cg_bait_shield
elif OEndLag >= 5 && CHANCE_MUL_LE PT_AGGRESSION 1.35
  predictionConfidence globTempVar man_OBaitOption LevelValue
  globTempVar *= 0.2
  globTempVar = globTempVar + Damage * 0.003 - ODamage * 0.001
  // LOGSTR str("CHOICE")
  // LOGVAL anotherTempVar
  // LOGSTR str("CONFIDENCE")
  // LOGVAL globTempVar
  // PRINTLN
  predictOOption anotherTempVar man_OBaitOption LevelValue
  if OCurrAction >= hex(0x4A) && OCurrAction <= hex(0x65)
  elif Rnd < globTempVar && Equal anotherTempVar op_bait_attack && Equal AirGroundState 1
    currGoal = cg_bait_shield
    if CHANCE_MUL_LE PT_AGGRESSION 1
      currGoal = cg_bait_dashawayWhenApproached
    endif
    Return
  endif
  if ODistLE immediateTempVar || OCurrAction >= hex(0x4A) && OCurrAction <= hex(0x65)
    if OCurrAction >= hex(0x1A) && OCurrAction <= hex(0x1D)
      currGoal = cg_attack_reversal
      if CHANCE_MUL_LE PT_JUMPINESS 1
        currGoal = cg_attack_crossup
      endif
    elif CHANCE_MUL_LE PT_JUMPINESS 1.45
      currGoal = cg_attack_crossup
    elif currGoal >= cg_attack && currGoal < calc(cg_attack + 1)
    elif OAnimFrame > 8
      currGoal = cg_attack_reversal
    endif
  endif
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
XGoto GoalChoiceHub
XReciever
XGoto SetAttackGoal
XReciever
Return
Return