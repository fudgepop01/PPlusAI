#include <Definition_AIMain.h>
id 0x850F
unk 0x0

XReciever
scriptVariant = sv_none
if Equal goalY BBoundary
  XGoto GoalChoiceHub
  XReciever
  Return
endif

if OYDistBackEdge >= -10 && OCurrAction >= hex(0x45) && OCurrAction <= hex(0x55) && Equal OIsOnStage 1
  $ifLastAttack(fthrow)
    lastAttack = -1
  $elifLastAttack(dthrow)
    lastAttack = -1
  $elifLastAttack(bthrow)
    lastAttack = -1
  $elifLastAttack(uthrow)
    lastAttack = -1
  endif
endif

#let OEndLag = var0
Goto EndlagCheck
if currGoal >= cg_circleCamp && currGoal < calc(cg_circleCamp + 1)
  immediateTempVar = (1 - (LevelValue / 100)) * 30 + 10
  MOD immediateTempVar AnimFrame immediateTempVar
  if Equal immediateTempVar 1
    if Rnd < pt_aggression
      currGoal = cg_camp_attack
      XGoto CalcAttackGoal
      XReciever
      
      if !(Equal lastAttack -1)
        skipMainInit = sm_execAttack
        CallI MainHub
      endif
    endif
  endif
  // if Equal immediateTempVar 1 && Rnd < 0.15
  //   currGoal = cg_bait
  //   Return
  // endif

  predictAverage globTempVar man_OXHitDist LevelValue
  Goto getODist
  if globTempVar <= immediateTempVar
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
  immediateTempVar = (1 - (LevelValue / 100)) * 30 + 12
  MOD immediateTempVar AnimFrame immediateTempVar
  if Equal immediateTempVar 1
    if !(Equal currGoal cg_bait_shield)
      predictOOption immediateTempVar man_OXAttackDist LevelValue 
      predictionConfidence anotherTempVar man_OXAttackDist LevelValue
      if Equal immediateTempVar op_attack_close && Rnd < anotherTempVar
        if Rnd < pt_circleCampChance
          if Rnd < pt_aggression && Rnd < pt_aggression
            Call FastAerial
          else 
            currGoal = cg_circleCamp
          endif
        endif
        immediateTempVar = 1
        Return
      elif Equal immediateTempVar op_attack_mid && Rnd < anotherTempVar && Rnd > pt_braveChance
        immediateTempVar = 1
      else
        immediateTempVar = 0
      endif

      if Equal immediateTempVar 1
        predictAverage immediateTempVar man_OXAttackDist LevelValue
      else
        predictAverage immediateTempVar man_OXHitDist LevelValue
      endif
      immediateTempVar += 15
      anotherTempVar = immediateTempVar - 5
      if XDistLE immediateTempVar && !(XDistLE anotherTempVar) && Rnd < calc(pt_aggression * 0.5)
        if Rnd < pt_braveChance
          currGoal = cg_bait_attack
          XGoto CalcAttackGoal
          XReciever
          
          if !(Equal lastAttack -1)
            skipMainInit = sm_execAttack
            CallI MainHub
          endif
        endif
        currGoal = cg_attack
      endif
    endif

    #let shouldApproach = var1
    shouldApproach = 1
    predictAverage anotherTempVar man_OXAttackDist LevelValue
    if anotherTempVar < 15
      anotherTempVar = 15
    endif
    anotherTempVar += 15 
    anotherTempVar *= OPos
    GetYDistFloorOffset anotherTempVar anotherTempVar 5 0
    if Equal anotherTempVar -1
      LOGSTR str("DANGER BAIT")
      shouldApproach = 0
    endif
    if Equal shouldApproach 0
      globTempVar = 15 * Rnd + 25
      immediateTempVar += globTempVar
    elif True
      if Rnd < pt_braveChance && Rnd < pt_braveChance
      else
        globTempVar = 15 * Rnd + 25
        immediateTempVar += globTempVar
      endif
    endif

    globTempVar = immediateTempVar + 15
    if ODistLE immediateTempVar
      if Equal currGoal cg_bait_shield && Equal AirGroundState 1
        CallI Shield
        Return
      endif

      DynamicDiceClear
      if Equal AirGroundState 1
        #const dr_dash = 1
        #const dr_jump = 2
        #const dr_wdash = 3
        #const dr_shield = 4
        #const dr_plat = 5
        #const dr_dashthrough = 6
        DynamicDiceAdd dr_dash
        DynamicDiceAdd dr_jump
        DynamicDiceAdd dr_wdash
        DynamicDiceAdd dr_shield
        if Equal shouldApproach 1
          DynamicDiceAdd dr_dashthrough
        endif
        GetYDistFloorOffset immediateTempVar 0 40 0
        GetColDistPosRel globTempVar anotherTempVar TopNX SCDBottom 0 40 1
        if Equal globTempVar -1 && !(Equal immediateTempVar -1) && immediateTempVar < 40
          DynamicDiceAdd dr_plat 
        endif
        DynamicDiceRoll immediateTempVar
        if Rnd < calc(pt_bait_dashAwayChance * 0.5)
          scriptVariant = sv_dash_away
          Call DashScr
        elif Rnd < calc(pt_bait_wdashAwayChance * 0.5)
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
          Call JumpScr
        elif Equal immediateTempVar dr_wdash
          scriptVariant = sv_wavedash_out
          Call Wavedash
        elif Equal immediateTempVar dr_shield
          currGoal = cg_bait_shield
        elif Rnd < pt_platChance && Rnd < pt_platChance
          Call BoardPlatform
        endif
      elif NumJumps > 0 && Rnd < pt_djumpiness && Rnd < pt_djumpiness && OYDistBackEdge > -20
        scriptVariant = sv_jump_over
        if Rnd < 0.5
          scriptVariant = sv_jump_away
        endif
        Call JumpScr
      endif
    elif ODistLE globTempVar && Rnd < pt_jumpiness && Equal OAirGroundState 1 && Equal shouldApproach 1
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
      if Equal shouldApproach 1
        Goto OPosGoal
      else
        goalX = 0
      endif
    endif

    // Goto EndlagCheck
  endif
  predictAverage immediateTempVar man_OXHitDist LevelValue
  immediateTempVar += 25
  DrawDebugRectOutline goalX goalY immediateTempVar immediateTempVar color(0xFFFF0088)
  immediateTempVar += 15
  DrawDebugRectOutline goalX goalY immediateTempVar immediateTempVar color(0xFFFF0044)
elif currGoal >= cg_attack && currGoal < calc(cg_attack + 1)
  if CalledAs ExecuteAttack
    XGoto SetAttackGoal
    XReciever
    Return
  endif

  if Equal lastAttack -1
    XGoto GoalChoiceHub
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
  predictAverage anotherTempVar man_OXAttackDist LevelValue
  anotherTempVar += 30
  anotherTempVar *= OPos
  GetYDistFloorOffset anotherTempVar anotherTempVar 5 0
  if Equal anotherTempVar -1
    shouldApproach = 0
  endif

  LOGSTR str("==ATTACK==")
  $printMoveName()
  LOGSTR str("==========")
  #let shouldUpdate = var0
  shouldUpdate = (1 - (LevelValue / 100)) * 30 + 12
  MOD shouldUpdate AnimFrame shouldUpdate
  globTempVar = shouldUpdate * 3
  MOD anotherTempVar AnimFrame globTempVar
  globTempVar -= 1

  // prevents truly unreactable adjustements
  Goto getDist
  XReciever

  if Equal shouldUpdate 1 && Equal shouldApproach 0 && Rnd > calc(pt_braveChance * 0.5)
    LOGSTR str("DANGER ATK")
    currGoal = cg_bait
    Return
  endif

  predictAverage immediateTempVar man_OXHitDist LevelValue
  immediateTempVar += 20
  if Equal OCurrAction hex(0x49)
    if ODistLE immediateTempVar && !(Equal OAirGroundState 1) 
      predictOOption immediateTempVar man_OOutOfHitstun LevelValue
      predictionConfidence globTempVar man_OOutOfHitstun LevelValue
      if Equal immediateTempVar op_hitstun_attack && Rnd < globTempVar
        Call Shield
      endif
    endif
  endif
  immediateTempVar += 30
  if !(ODistLE immediateTempVar) && Rnd < pt_circleCampChance && Rnd < pt_circleCampChance && OFramesHitstun <= 0
    currGoal = cg_circleCamp
    Return
  endif

  if Equal anotherTempVar globTempVar && immediateTempVar > 55
    XGoto GoalChoiceHub
    XReciever
    Return
  endif

  anotherTempVar = XSpeed
  Abs anotherTempVar
  anotherTempVar = 8 + anotherTempVar

  scriptVariant = sv_none
  if OCurrAction <= hex(0x21) && immediateTempVar <= anotherTempVar && !(Equal CurrAction hex(0xA)) && Equal OFramesHitstun 0
    if Equal shouldUpdate 1
      anotherTempVar = OPos * -15
      GetYDistFloorOffset anotherTempVar anotherTempVar 0 0
      if Equal anotherTempVar -1 && Rnd > pt_aggression
        CallI DefendHub
      endif


      if XSpeed > -0.6 && XSpeed < 0.6 && ODistLE 8 && Equal currGoal cg_attack
        XGoto CalcAttackGoal
        XReciever
        Return
      endif

      scriptVariant = sv_attackgoal_justy
      if OCurrAction >= hex(0xB) && OCurrAction <= hex(0xD) && OAnimFrame < 20
      else
        XGoto SetAttackGoal
        XReciever
      endif
    endif
  // otherwise carry on as normal
  elif Equal shouldUpdate 1 || Equal CurrAction hex(0xA) || Equal OCurrAction hex(0x49) || OFramesHitstun > 1 || Equal HitboxConnected 1
    anotherTempVar = OPos * -15
    GetYDistFloorOffset anotherTempVar anotherTempVar 0 0
    if Equal anotherTempVar -1 && Rnd > pt_aggression
      CallI DefendHub
    endif

    if immediateTempVar > anotherTempVar
      if !(SamePlane) && Rnd < pt_baitChance && Rnd < 0.2 && Equal shouldUpdate 1 && OFramesHitstun <= 0
        currGoal = cg_bait
        Return
      endif
      
      if OCurrAction >= hex(0xB) && OCurrAction <= hex(0xD) && OAnimFrame < 20
        scriptVariant = sv_attackgoal_justx
      endif
      
      XGoto SetAttackGoal
      XReciever
    endif
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
immediateTempVar += OEndLag + 10
if OEndLag >= 12 && ODistLE immediateTempVar && OFramesHitstun <= 0
  predictOOption immediateTempVar man_OBaitOption LevelValue
  predictionConfidence globTempVar man_OBaitOption LevelValue
  globTempVar *= 2
  globTempVar = globTempVar + Damage * 0.02
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