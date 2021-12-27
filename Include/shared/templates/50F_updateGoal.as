#include <Definition_AIMain.h>
id 0x850F
unk 0x0

XReciever
scriptVariant = sv_none

if Equal goalY BBoundary
  XGoto GoalChoiceHub
  XReciever
endif

#let teamCloser = var3
GetIsTeammateCloser teamCloser
if Equal teamCloser 1
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
OEndLag = 0
if currGoal < cg_attack || currGoal >= calc(cg_attack + 1)
  Goto EndlagCheck
endif
if currGoal >= cg_circleCamp && currGoal < calc(cg_circleCamp + 1)
  SetDebugOverlayColor color(0x0000FF88)
  EnableDebugOverlay
  immediateTempVar = (1 - (LevelValue / 100)) * 30 + 10
  MOD immediateTempVar AnimFrame immediateTempVar
  // $LV9Check(immediateTempVar = 1)
  if Equal immediateTempVar 1
    globTempVar = OTopNY - TopNY
    if globTempVar > 45 || OYDistBackEdge < -35 && Equal AirGroundState 1
      if Rnd < pt_aggression
        currGoal = cg_attack
        Return
      endif
    endif

    // predictOOption immediateTempVar man_OXHitDist LevelValue 
    // immediateTempVar += 10
    if Rnd < calc(pt_aggression * 0.35)
      // if XDistLE immediateTempVar 
      //   currGoal = cg_bait
      //   Return
      // endif
      currGoal = cg_camp_attack
      XGoto CalcAttackGoal
      XReciever
      
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

  Goto getDist
  if immediateTempVar <= 13
    if ODistLE globTempVar || Rnd <= 0.04
      XGoto GoalChoiceHub
      XReciever
      Return
    endif
    immediateTempVar = (1 - (LevelValue / 100)) * 30 + 10
    MOD immediateTempVar AnimFrame immediateTempVar
    // $LV9Check(immediateTempVar = 1)
    if Equal immediateTempVar 1
      // Goto EndlagCheck

      if Equal AirGroundState 1 && Rnd < pt_jumpiness
        goalY += calc(pt_shortHopHeight - 3) 
        if Rnd < pt_jumpiness && Rnd < pt_jumpiness
          goalY += 5
        endif
      elif Equal AirGroundState 2 && YDistBackEdge < -5
        if Rnd < pt_djumpiness && Rnd < pt_djumpiness && NumJumps > 0
          goalY += pt_djumpHeight
        else
          goalY += 1
          GetYDistFloorAbsPos immediateTempVar goalX goalY
          goalY -= immediateTempVar
        endif
      endif
    endif
  endif
elif currGoal >= cg_bait && currGoal < calc(cg_bait + 1)
  SetDebugOverlayColor color(0xFF00FF88)
  if Equal currGoal cg_bait_dashdance
    SetDebugOverlayColor color(0xFF00FFFF)
  endif
  EnableDebugOverlay
  immediateTempVar = (1 - (LevelValue / 100)) * 30 + 13
  MOD immediateTempVar AnimFrame immediateTempVar
  // $LV9Check(immediateTempVar = 1)
  if Equal immediateTempVar 1
    Goto OPosGoal

    globTempVar = OTopNY - TopNY
    if globTempVar > 45 || OYDistBackEdge < -35 && Equal AirGroundState 1
      if Rnd < pt_aggression
        currGoal = cg_attack
        Return
      endif
    endif
    
    if Equal currGoal cg_bait_wait
      Return
    endif

    if !(Equal currGoal cg_bait_shield) && !(Equal currGoal cg_bait_dashdance)
      predictOOption immediateTempVar man_OXAttackDist LevelValue 
      predictionConfidence anotherTempVar man_OXAttackDist LevelValue
      if Equal immediateTempVar op_attack_close && Rnd < anotherTempVar
        if Rnd < pt_circleCampChance && Equal teamCloser 0
          if Rnd < calc(pt_baitChance * 0.5)
            currGoal = cg_bait_dashdance
          else 
            currGoal = cg_circleCamp
          endif
        endif
        immediateTempVar = 1
        Return
      elif Equal immediateTempVar op_attack_mid && Rnd < anotherTempVar && Rnd < pt_braveChance
        immediateTempVar = 1
      else
        immediateTempVar = 0
      endif

      predictAverage immediateTempVar man_OXHitDist LevelValue
      immediateTempVar += 45
      anotherTempVar = immediateTempVar - 20
      if XDistLE immediateTempVar && !(XDistLE anotherTempVar) && Rnd < calc(pt_aggression * 0.25) && Equal teamCloser 0
        if Rnd < calc(pt_braveChance * 0.5)
          if Rnd < calc(pt_wall_chance * 0.75)
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
    anotherTempVar += 15
    anotherTempVar *= OPos
    GetYDistFloorOffset anotherTempVar anotherTempVar 5 0
    if Equal anotherTempVar -1 || Equal teamCloser 1
      shouldApproach = 0
    endif

    Goto getDist
    if immediateTempVar >= 25
      shouldApproach = 1
    elif Rnd < calc(pt_baitChance * 0.3)
      shouldApproach = -1
    endif 

    predictAverage globTempVar man_OXHitDist LevelValue
    if !(Equal shouldApproach 1)
      globTempVar = globTempVar + 15 * Rnd + 10
    elif True
      if Rnd < pt_braveChance && Rnd < calc(pt_braveChance * 0.75)
      else
        globTempVar = globTempVar + 15 * Rnd + 10
      endif
    endif
    immediateTempVar = globTempVar

    globTempVar += 20
    GetAttribute anotherTempVar attr_dashInitVel 0
    anotherTempVar *= 5
    globTempVar -= anotherTempVar
    if ODistLE globTempVar && Equal AirGroundState 1 && Equal currGoal cg_bait_dashdance
      if Rnd < calc(pt_bait_dashAwayChance * 0.35) || Rnd < calc(pt_bait_wdashAwayChance * 0.35)
        skipMainInit = mainInitSkip
        if Rnd < calc(pt_bait_wdashAwayChance * 0.5)
          scriptVariant = sv_wavedash_out
          Call Wavedash
        endif
        scriptVariant = sv_dash_away
        Call DashScr
      endif
    endif

    if ODistLE immediateTempVar && !(Equal shouldApproach -1)
      // LOGSTR str("===IN 1===")
      immediateTempVar -= 8
      if Equal currGoal cg_bait_shield && Equal AirGroundState 1 && ODistLE immediateTempVar
        currGoal = cg_attack_reversal
        CallI Shield
      endif

      DynamicDiceClear
      if Equal AirGroundState 1
        #const dr_dash = 1
        #const dr_jump = 2
        #const dr_wdash = 3
        #const dr_shield = 4
        #const dr_plat = 5
        #const dr_dashthrough = 6
        #const dr_wait = 7

        predictAverage anotherTempVar man_OXHitDist LevelValue
        anotherTempVar += 35
        anotherTempVar *= OPos
        GetYDistFloorOffset anotherTempVar anotherTempVar 5 0

        DynamicDiceAdd dr_dash
        DynamicDiceAdd dr_jump
        DynamicDiceAdd dr_jump
        DynamicDiceAdd dr_wdash
        DynamicDiceAdd dr_shield
        DynamicDiceAdd dr_wait
        if Equal anotherTempVar -1
        elif Equal shouldApproach 1 && Rnd < calc(pt_aggression * 0.6)
          DynamicDiceAdd dr_dashthrough
          DynamicDiceAdd dr_dashthrough
          if Rnd < calc(pt_aggression * 0.45)
            scriptVariant = sv_jump_over
            scriptVariant += svp_jump_fullhop
            if Rnd < calc(pt_aggression * 0.6)
              currGoal = cg_attack
            endif
            Call JumpScr
          endif
        endif
        GetYDistFloorOffset immediateTempVar 0 40 0
        GetColDistPosRel globTempVar anotherTempVar TopNX SCDBottom 0 40 1
        if Equal globTempVar -1 && !(Equal immediateTempVar -1) && immediateTempVar < 40
          DynamicDiceAdd dr_plat 
        endif
        DynamicDiceRoll immediateTempVar
        if Rnd > calc(pt_aggression * 0.75)
          LOGSTR_NL str("START WAIT")
          currGoal = cg_bait_wait
        endif
        if Rnd < calc(pt_bait_dashAwayChance * 1.3)
          scriptVariant = sv_dash_away
          Call DashScr
        elif Rnd < calc(pt_bait_wdashAwayChance * 1.3)
          scriptVariant = sv_wavedash_out
          Call Wavedash
        endif
        if Equal immediateTempVar dr_dash
          scriptVariant = sv_dash_away
          Call DashScr
        elif Equal immediateTempVar dr_dashthrough
          scriptVariant = sv_dash_through
          Call DashScr
        elif Equal immediateTempVar dr_jump
          scriptVariant = sv_jump_away
          if Rnd < pt_jumpiness
            scriptVariant += svp_jump_fullhop
          endif
          Goto getDist
          if Rnd < calc(pt_aggression * 0.6) && immediateTempVar <= 30
            currGoal = cg_attack
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
        if globTempVar > -40 && Rnd < pt_platChance
          Call BoardPlatform
        endif
      elif NumJumps > 0 && Rnd < pt_djumpiness && Rnd < pt_djumpiness && OYDistBackEdge > -20
        scriptVariant = sv_jump_over
        if Rnd < 0.5
          scriptVariant = sv_jump_away
        endif
        scriptVariant += svp_jump_fullhop
        Call JumpScr
      endif
    elif ODistLE globTempVar && Rnd < pt_jumpiness && Equal OAirGroundState 1 && Equal shouldApproach 1
      // LOGSTR str("===IN 2===")
      if Rnd < pt_jumpiness
        scriptVariant = sv_jump_over
        scriptVariant += svp_jump_fullhop
      elif Rnd < pt_jumpiness
        scriptVariant = sv_jump_away
      else
        scriptVariant = sv_jump_neutral
      endif
      Call JumpScr
    elif True
      // LOGSTR str("===IN 3===")
      Goto OPosGoal
      if Equal shouldApproach 1
      elif True
        predictAverage immediateTempVar man_OXHitDist LevelValue
        immediateTempVar += 15
        goalX = goalX + immediateTempVar * OPos * -1 
      endif
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
  if CalledAs ExecuteAttack
    XGoto SetAttackGoal
    XReciever
    Return
  endif
  if !(Equal currGoal cg_edgeguard)
    SetDebugOverlayColor color(0xFF000088)
  else
    SetDebugOverlayColor color(0x00FFFF88)
  endif
    EnableDebugOverlay

  if Equal lastAttack -1
    XGoto GoalChoiceHub
    XReciever
    XGoto SetAttackGoal
    XReciever
    Return
  endif

  globTempVar = TopNX
  immediateTempVar = OTopNX
  Abs globTempVar
  Abs immediateTempVar
  if Equal currGoal cg_attack_wall
    $ifAerialAttack()
      if globTempVar < immediateTempVar
        Call ExecuteAttack
      elif Rnd < 0.3
        Call ExecuteAttack
      endif
    elif Equal AirGroundState 1
      if globTempVar < immediateTempVar
        Call ExecuteAttack
      elif Rnd < 0.3
        Call ExecuteAttack
      endif
    endif
  endif


  #let shouldApproach = var1
  shouldApproach = 1
  predictAverage anotherTempVar man_OXHitDist LevelValue
  anotherTempVar += 20
  anotherTempVar *= OPos
  GetYDistFloorOffset anotherTempVar anotherTempVar 5 0
  if Equal anotherTempVar -1
    shouldApproach = 0
    if !(Equal currGoal cg_attack_wall) && !(Equal currGoal cg_attack_undershoot)
      if Rnd < calc(pt_wall_chance * 0.75)
        if Rnd < pt_wall_chance
          currGoal = cg_attack_wall
        else
          currGoal = cg_attack_undershoot
        endif
        lastAttack = -1
        Return
      elif Rnd < calc(pt_baitChance * 0.3) || Rnd < calc(pt_circleCampChance * 0.3)
        currGoal = cg_bait_dashdance
        lastAttack = -1
        Return
      endif
    endif
  endif

  LOGSTR str("==ATTACK==")
  $printMoveName()
  LOGSTR str("==========")
  #let shouldUpdate = var2
  // combos
  shouldUpdate = (1 - (LevelValue / 100)) * 30 + 3
  immediateTempVar = OAnimFrame - 2
  // standard
  if OCurrAction >= hex(0x42) && OCurrAction <= hex(0x59)
  elif Equal HitboxConnected 1 || Equal PrevAction hex(0x3C)
  else
    shouldUpdate = (1 - (LevelValue / 100)) * 30 + 7
    immediateTempVar = OAnimFrame - 3
  endif
  
  MOD shouldUpdate immediateTempVar shouldUpdate
  globTempVar = shouldUpdate * 3
  MOD anotherTempVar immediateTempVar globTempVar
  globTempVar -= 1
  // $LV9Check(shouldUpdate = 1)

  // if OAnimFrame <= 4
  //   shouldUpdate = 0
  // endif

  if Equal shouldUpdate 1 && !(Equal currGoal cg_edgeguard)
    globTempVar = OTopNY - TopNY
    if globTempVar > 45 || OYDistBackEdge < -45 && Equal AirGroundState 1
    elif OCurrAction >= hex(0x42) && OCurrAction <= hex(0x59)
    elif Equal HitboxConnected 1 || Equal PrevAction hex(0x3C)
    elif !(Equal currGoal cg_attack_reversal) && OYDistFloor < 30
      predictOOption immediateTempVar man_OXAttackDist LevelValue 
      predictionConfidence anotherTempVar man_OXAttackDist LevelValue
      if Equal immediateTempVar op_attack_close && Rnd < anotherTempVar
        currGoal = cg_bait
        Return
      elif Equal immediateTempVar op_attack_mid && Rnd > calc(pt_braveChance * 0.5)
        currGoal = cg_bait_dashdance
        Return
      elif Equal immediateTempVar op_attack_far && Rnd < anotherTempVar
        currGoal = cg_circleCamp
        Return
      endif
    endif
  endif

  globTempVar = OTopNY - TopNY
  if globTempVar > 30 || OYDistBackEdge < -35 && Equal AirGroundState 1
  elif OCurrAction >= hex(0x42) && OCurrAction <= hex(0x59) 
  elif Equal HitboxConnected 1 || Equal PrevAction hex(0x3C)
  elif Equal shouldUpdate 1 && Equal shouldApproach 0 && Rnd > calc(pt_braveChance * 0.5) && Equal AirGroundState 1 && !(Equal currGoal cg_edgeguard)
    currGoal = cg_bait_dashdance
    Return
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
  immediateTempVar += 30
  if !(ODistLE immediateTempVar) && Rnd < pt_circleCampChance && Rnd < pt_circleCampChance && OFramesHitstun <= 0 && !(Equal currGoal cg_edgeguard)
    currGoal = cg_circleCamp
    Return
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
    if Equal shouldUpdate 1 && !(Equal currGoal cg_edgeguard)
      anotherTempVar = OPos * -15
      GetYDistFloorOffset anotherTempVar anotherTempVar 0 0
      if Equal anotherTempVar -1 && Rnd > calc(pt_aggression * 0.5)
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
  elif Equal shouldUpdate 1 || Equal CurrAction hex(0xA) || Equal OCurrAction hex(0x49) || OFramesHitstun > 1 || Equal HitboxConnected 1
    if OAnimFrame <= 9 || Equal CurrAction hex(0xA) || Equal OCurrAction hex(0x49) || OFramesHitstun > 1 || Equal HitboxConnected 1
      anotherTempVar = OPos * -15
      GetYDistFloorOffset anotherTempVar anotherTempVar 0 0
      if Equal OCurrAction hex(0x49) || OFramesHitstun > 1 || Equal HitboxConnected 1
      elif Equal anotherTempVar -1 && Rnd > pt_aggression && Rnd > pt_aggression
        currGoal = cg_bait_dashdance
        Return
      endif

      if immediateTempVar > anotherTempVar
        if OCurrAction >= hex(0x42) && OCurrAction <= hex(0x59)
        elif !(SamePlane) && Rnd < pt_baitChance && Rnd < 0.2 && Equal shouldUpdate 1 && OFramesHitstun <= 0
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
  if Equal shouldUpdate 0
    scriptVariant = sv_attackgoal_self
    XGoto SetAttackGoal
    XReciever
  endif

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
CALC_ENDLAG(OEndLag)
predictAverage immediateTempVar man_OXHitDist LevelValue
LOGSTR str("ENDLAG")
LOGVAL OEndLag
anotherTempVar = OEndLag * 1.25
immediateTempVar += anotherTempVar + 10
if OEndLag >= 10 && ODistLE immediateTempVar && OFramesHitstun <= 0 && Rnd < pt_aggression
  predictOOption immediateTempVar man_OBaitOption LevelValue
  predictionConfidence globTempVar man_OBaitOption LevelValue
  globTempVar *= 1.1
  globTempVar = globTempVar + Damage * 0.01 - ODamage * 0.01
  if Rnd < globTempVar && Equal immediateTempVar op_bait_move 
    currGoal = cg_bait_shield
  else
    currGoal = cg_attack_reversal
  endif
endif
Return
label OPosGoal
if OAnimFrame < 2
  goalX = OTopNX + OTotalXSpeed * 10 * OPos * ODirection * -1
else
  EstOXCoord goalX 18
  goalX -= OTopNX
  goalX *= OPos * ODirection * -1
  goalX += OTopNX
endif
goalY = OYDistBackEdge + OTopNY
// if OYDistBackEdge < -30
//   goalY += calc(pt_shortHopHeight - 3) 
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
Return