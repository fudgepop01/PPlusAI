#include <Definition_AIMain.h>
id 0x8501
unk 0x0

XReciever
//--- keep this script from being called more than once per frame
NoRepeat

//--- visualize stuffs
if Equal PlayerNum 0
  DrawDebugRectOutline goalX goalY 5 5 color(0xFF0000DD)
elif Equal PlayerNum 1
  DrawDebugRectOutline goalX goalY 5 5 color(0x0000FFDD)
elif Equal PlayerNum 2
  DrawDebugRectOutline goalX goalY 5 5 color(0x00FF00DD)
elif Equal PlayerNum 3
  DrawDebugRectOutline goalX goalY 5 5 color(0xFFFF00DD)
else
  DrawDebugRectOutline goalX goalY 5 5 color(0x222222DD)
endif
//--- prevent auto-attack
Cmd30
// keeps the AI from targeting itself because that can happen for some reason
if Equal PlayerNum OPlayerNum
  SwitchTarget
endif
//--- track target stuff 
// out of tumble action
if Equal OPrevAction hex(0x44) || Equal OPrevAction hex(0x45) || Equal OPrevAction hex(0x49)
  if Equal OCurrAction hex(0x49) && Equal OAnimFrame 30
    trackOAction man_OOutOfHitstun op_hitstun_fall
  elif Equal OAnimFrame 0
    if Equal OCurrAction hex(0xC) || Equal OCurrAction hex(0xD)
      trackOAction man_OOutOfHitstun op_hitstun_jump
    elif Equal OCurrAction hex(0xE) || Equal OCurrAction hex(0xF)
      trackOAction man_OOutOfHitstun op_hitstun_fall
    elif OAttacking
      trackOAction man_OOutOfHitstun op_hitstun_attack
    endif
  endif
endif
// frame count after hitstun ends
if OCurrAction >= hex(0x41) && OCurrAction <= hex(0x64)
  trackOAction man_OFramesPostHitstun 0
elif OFramesHitstun > 0
  trackOAction man_OFramesPostHitstun 0
else 
  getCurrentPredictValue immediateTempVar man_OFramesPostHitstun
  if immediateTempVar < 100
    incrementPrediction man_OFramesPostHitstun
  endif
endif
// O OOS Option
if Equal OAnimFrame 0 && OFramesSinceShield < 20
  if Equal OCurrAction hex(0x21)
    trackOAction man_OOOSOption op_OOOS_WD
  elif OAttacking && !(Equal OCurrAction hex(0x34))
    trackOAction man_OOOSOption op_OOOS_attack
  elif Equal OCurrAction hex(0x34)
    trackOAction man_OOOSOption op_OOOS_grab
  endif
elif OAttackCond && Equal OAnimFrame 0
  globTempVar = TopNX - OTopNX
  Abs globTempVar
  predictAverage immediateTempVar man_OXHitDist LevelValue
  
  immediateTempVar += 10
  anotherTempVar = immediateTempVar + 20
  if globTempVar < immediateTempVar
    trackOAction man_OXAttackDist op_attack_close
  elif globTempVar < anotherTempVar
    trackOAction man_OXAttackDist op_attack_mid
  else
    trackOAction man_OXAttackDist op_attack_far
  endif

  RetrieveFullATKD anotherTempVar anotherTempVar anotherTempVar globTempVar immediateTempVar anotherTempVar anotherTempVar OCurrSubaction 1
  Abs globTempVar
  Abs immediateTempVar
  if globTempVar < immediateTempVar
    globTempVar = immediateTempVar
  endif
  GetAttribute immediateTempVar attr_dashInitVel 1
  immediateTempVar *= 8
  globTempVar += immediateTempVar
  trackOAction man_OXHitDist globTempVar
endif
// O Tech Option
if Equal OAnimFrame 10
  if Equal OCurrAction hex(0x61) 
    globTempVar = OPos * OXSpeed
    if globTempVar > 0
      trackOAction man_OTechOption op_tech_in
    else
      trackOAction man_OTechOption op_tech_out
    endif
  elif Equal OCurrAction hex(0x60)
    trackOAction man_OTechOption op_tech_neutral
  endif

  if Equal OPrevAction hex(0x4D)
    if Equal OCurrAction hex(0x52)
      globTempVar = OPos * OXSpeed
      if globTempVar > 0
        trackOAction man_OGetupOption op_getup_in
      else
        trackOAction man_OGetupOption op_getup_out
      endif
    elif Equal OCurrAction hex(0x53)
      trackOAction man_OGetupOption op_getup_attack
    endif
  endif
endif
// O Bait/Defend Option
if currGoal >= cg_circleCamp && currGoal < calc(cg_bait + 1)
  Goto baitDefendOption
  XReciever
elif Equal currGoal cg_defend
  Goto baitDefendOption
  XReciever
elif Rnd < 0.2
  Goto baitDefendOption
  XReciever
endif
if !(True)
  label baitDefendOption
  immediateTempVar = (1 - (LevelValue / 100)) * 10
  MOD immediateTempVar AnimFrame immediateTempVar
  if Equal immediateTempVar 1
    globTempVar = man_OBaitOption
    if Equal currGoal cg_defend
      globTempVar = man_ODefendOption
    endif
    predictAverage immediateTempVar man_OXHitDist LevelValue
    immediateTempVar += 20
    // globTempVar = immediateTempVar + 15
    if ODistLE immediateTempVar
      if hex(0x3) <= OCurrAction && OCurrAction <= hex(0x5) && Rnd < 0.65 && !(Equal currGoal cg_defend)
        trackOAction man_OBaitOption op_bait_move
        if OAnimFrame >= 4 || Equal OCurrAction hex(0x4) || Equal OCurrAction hex(0x5)
          // the target is running in a direction as a result of a bait
          if !(Equal OPos ODirection) 
            // the target is running away, therefor overshoot
            trackOAction man_OBaitDirection op_baitdir_overshoot
          else
            // the target is advancing, therefor undershoot
            trackOAction man_OBaitDirection op_baitdir_undershoot
          endif
        endif
      elif Rnd < 0.25 && OCurrAction <= hex(0x2) && !(Equal currGoal cg_defend)
        // the target is roughly in-place, therefor neutral
        trackOAction man_OBaitOption op_bait_move
        trackOAction man_OBaitDirection op_baitdir_neutral
      elif OAttacking && Rnd < 0.5 && Equal currGoal cg_defend
        trackOAction globTempVar op_defend_attack
      elif OAttacking && Rnd < 0.5 && !(Equal currGoal cg_defend)
        trackOAction man_OBaitOption op_bait_attack
      elif hex(0x1A) <= OCurrAction && OCurrAction <= hex(0x1C) && Rnd < 0.6
        trackOAction globTempVar op_bait_shield
      endif
    endif
  endif
  Return
endif

//--- special state switches
if Equal CurrAction hex(0x7C) || Equal CurrAction hex(0x7D)
  Stick -0.78
elif Equal CurrAction hex(0x39)
  CallI Unk1120
elif Equal CurrAction hex(0x4D) && !(Equal currGoal cg_lying) 
  CallI LyingDown
elif Equal CurrAction hex(0x89) && !(Equal currGoal cg_lying) 
  CallI LyingDown
elif !(Equal currGoal cg_ledge) && !(Equal currGoal cg_ledge_edgeguard) && CurrAction >= hex(0x73) && CurrAction <= hex(0x75)
  CallI OnLedge
endif

//--- switch tactic if conditions are met
if CurrAction >= hex(0x42) && CurrAction <= hex(0x45) && !(Equal currGoal cg_inHitstun) && !(Equal OCurrAction hex(0x49))
  immediateTempVar = LevelValue * 0.01 - 0.15
  if FramesHitstun > 0
    Goto OnGotHitAdjustments
    CallI AttackedHub
  elif Equal CurrAction hex(0x42)
    Goto OnGotHitAdjustments
    CallI AttackedHub
  endif
endif

if Equal OFramesHitlag 1 && OFramesHitstun > 0 && Equal HitboxConnected 0
  CALL_EVENT(evt_rangedHit)
endif

CALL_EVENT(evt_chrChecks)

if !(True)
  label OnGotHitAdjustments
    CALL_EVENT(evt_gotHit)
  Return
endif

if Equal IsOnStage 0 && Equal OCurrAction hex(0xBD) && !(Equal currGoal cg_recover)
  CallI RecoveryHub
elif Equal currGoal cg_recover_reversal
elif currGoal >= cg_edgeguard && Equal OIsOnStage 0 && Equal IsOnStage 0
  GET_CHAR_TRAIT(globTempVar, chr_cs_recoveryDistX)
  NEAREST_CLIFF(immediateTempVar, anotherTempVar)
  Abs immediateTempVar
  if immediateTempVar > globTempVar
    GET_CHAR_TRAIT(immediateTempVar, chr_cs_recoveryDistY)
    if YDistBackEdge >= immediateTempVar
      CallI RecoveryHub
    endif
  endif
  Norm immediateTempVar OXDistBackEdge OYDistBackEdge
  Norm globTempVar XDistBackEdge YDistBackEdge

  if immediateTempVar < globTempVar && YDistBackEdge > 0
    CallI RecoveryHub
  endif
elif currGoal >= cg_edgeguard && Equal OIsOnStage 0
elif !(Equal currGoal cg_recover) && !(Equal currGoal cg_ledge) && !(Equal currGoal cg_ledge_edgeguard) && Equal FramesHitstun 0  
  if Equal IsOnStage 0
    GetYDistFloorOffset immediateTempVar 15 15 0
    GetYDistFloorOffset globTempVar -15 15 0
    if Equal immediateTempVar -1 && Equal globTempVar -1
      CallI RecoveryHub
    endif
  elif Equal OIsOnStage 0 && currGoal < cg_edgeguard
    GetYDistFloorOffset immediateTempVar 15 15 1
    GetYDistFloorOffset globTempVar -15 15 1
    if Equal immediateTempVar -1 && Equal globTempVar -1
      currGoal = cg_edgeguard
      skipMainInit = mainInitSkip
      CallI MainHub
    endif
  endif
endif

if Equal CurrAction hex(0xBE)
  Stick 1
endif

if Equal CurrAction hex(0x1D) && !(CalledFrom Shield)
  CallI Shield
endif

ACTIONABLE_ON_GROUND

CALL_EVENT(evt_checkDefend)
Return
Return