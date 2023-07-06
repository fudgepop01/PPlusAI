#include <Definition_AIMain.h>
id 0x8501
unk 0x0

//= XReciever
//--- keep this script from being called more than once per frame
NoRepeat
SetTimeout 999

// SetDebugMode 1
// LOGSTR str("mode")
// LOGVAL currGoal
// PRINTLN
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
// SetDebugMode 0
//--- prevent auto-attack
Cmd30
// keeps the AI from targeting itself because that can happen for some reason
// if Equal PlayerNum OPlayerNum && !(Equal YDistFloor -1)
//   SwitchTarget
// endif
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
  if immediateTempVar < 250
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
  RetrieveFullATKD anotherTempVar anotherTempVar anotherTempVar globTempVar immediateTempVar anotherTempVar anotherTempVar OCurrSubaction 1
  if anotherTempVar >= 0
    Abs globTempVar
    Abs immediateTempVar
    if globTempVar < immediateTempVar
      globTempVar = immediateTempVar
    endif
    GetAttribute immediateTempVar attr_dashInitVel 1
    immediateTempVar *= 5
    globTempVar += immediateTempVar
        
    trackOAction man_OXHitDist globTempVar
    // RetrieveFullATKD anotherTempVar anotherTempVar anotherTempVar anotherTempVar anotherTempVar globTempVar immediateTempVar OCurrSubaction 1
    // Goto getMax
    // trackOAction man_OYHitDist globTempVar    
  endif
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
elif Equal currGoal cg_defend
  Goto baitDefendOption
elif Rnd < 0.2
  Goto baitDefendOption
endif
if !(True)
  label baitDefendOption
  immediateTempVar = (1 - (LevelValue / 100)) * 10 + 5
  MOD immediateTempVar AnimFrame immediateTempVar
  if immediateTempVar < 1
    globTempVar = man_OBaitOption
    if Equal currGoal cg_defend || Equal currGoal cg_defend_crouchCancel
      globTempVar = man_ODefendOption
    endif
    predictAverage immediateTempVar man_OXHitDist
    immediateTempVar += 20
    // globTempVar = immediateTempVar + 15
    if XDistLE immediateTempVar
      if hex(0x4) <= OCurrAction && OCurrAction <= hex(0x5) && Rnd < 0.65 && !(Equal globTempVar man_ODefendOption)
        trackOAction man_OBaitOption op_bait_move
        if OAnimFrame >= 4
          // the target is running in a direction as a result of a bait
          if Equal OPos ODirection 
            // the target is advancing, therefor overshoot
            trackOAction man_OBaitDirection op_baitdir_overshoot
          else
            // the target is running away, therefor undershoot
            trackOAction man_OBaitDirection op_baitdir_undershoot
          endif
        endif
      elif Rnd < 0.5 && OCurrAction <= hex(0x2) && !(Equal globTempVar man_ODefendOption)
        // the target is roughly in-place, therefor neutral
        trackOAction man_OBaitOption op_bait_move
        trackOAction man_OBaitDirection op_baitdir_neutral
      elif OAttacking && Rnd < 0.5 && Equal globTempVar man_ODefendOption
        trackOAction globTempVar op_defend_attack
      elif OAttacking && Rnd < 0.5 && !(Equal globTempVar man_ODefendOption)
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
elif Equal CurrAction hex(0x39) && !(CalledFrom ExecuteAttack)
  CallI Unk1120
elif CurrAction >= hex(0x3D) && CurrAction <= hex(0x3F)
  immediateTempVar = Rnd * 2 - 1
  anotherTempVar = Rnd * 2 - 1
  AbsStick immediateTempVar anotherTempVar
elif !(CalledFrom LedgeDash) && !(CalledFrom LedgeStall) && !(CalledFrom OnLedge) && CurrAction >= hex(0x73) && CurrAction <= hex(0x75)
  CallI OnLedge
elif !(CalledFrom LyingDown)
  if CurrAction >= hex(0x4A) && CurrAction <= hex(0x54) 
    CallI LyingDown
  elif CurrAction >= hex(0x8A) && CurrAction <= hex(0x8D)
    CallI LyingDown
  endif
endif

//--- switch tactic if conditions are met
if CurrAction >= hex(0x42) && CurrAction <= hex(0x45) && !(Equal OCurrAction hex(0x49)) && !(CalledFrom AttackedHub)
  immediateTempVar = LevelValue * 0.01 - 0.15
  if FramesHitlag > 0
    Goto OnGotHitAdjustments
    CallI AttackedHub
  elif Equal CurrAction hex(0x42)
    // Goto OnGotHitAdjustments
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

if Equal CurrAction hex(0xBE)
  Stick 1
endif

ACTIONABLE_ON_GROUND

if !(CalledFrom RecoveryHub) && DangerEnabled && Equal IsOnStage 0
  if Equal PlayerNum OPlayerNum
    CallI RecoveryHub
  endif
  GET_CHAR_TRAIT(globTempVar, chr_cs_recoveryDistX)
  if Equal IsOnStage 0 && currGoal < cg_edgeguard
    globTempVar *= 0.5
    GetYDistFloorOffset immediateTempVar globTempVar 15 0
    globTempVar *= -1
    GetYDistFloorOffset anotherTempVar globTempVar 15 0
    if Equal immediateTempVar -1 && Equal anotherTempVar -1
      CallI RecoveryHub
    endif
    globTempVar *= -2
  endif
  GET_CHAR_TRAIT(immediateTempVar, chr_cs_recoveryDistY)

  anotherTempVar = globTempVar / immediateTempVar
  globTempVar = anotherTempVar

  DIST_TO_CLIFF(immediateTempVar, anotherTempVar)

  Abs immediateTempVar
  globTempVar *= immediateTempVar
  GET_CHAR_TRAIT(immediateTempVar, chr_cs_recoveryDistY)
  globTempVar -= immediateTempVar
  if anotherTempVar < globTempVar && TotalYSpeed < -0.2 && AnimFrame > 2 && Equal IsOnStage 0
    CallI RecoveryHub
  endif
  // immediateTempVar = OTopNY - TopNY
  // globTempVar += immediateTempVar
  // if anotherTempVar < globTempVar && TotalYSpeed < -1 && AnimFrame > 2 && Equal IsOnStage 0
  //   CallI RecoveryHub
  // endif

  // DrawDebugRectOutline TopNX globTempVar 3 3 color(0xFF0000DD)
endif
if !(CalledFrom ExecuteAttack) && !(CalledFrom RecoveryHub)
  if currGoal >= cg_edgeguard && Equal OIsOnStage 0
  elif !(Equal currGoal cg_ledge) && !(Equal currGoal cg_ledge_edgeguard) && Equal FramesHitstun 0
    if Equal OIsOnStage 0 && currGoal < cg_edgeguard
      GetYDistFloorOffset immediateTempVar 10 15 1
      GetYDistFloorOffset globTempVar -10 15 1
      if Equal immediateTempVar -1 && Equal globTempVar -1
        currGoal = cg_edgeguard
        skipMainInit = mainInitSkip
        CallI MainHub
      endif
    endif
  endif
endif

if Equal CurrAction hex(0x1D) && !(CalledFrom Shield)
  CallI Shield
endif

if !(CalledFrom ExecuteAttack) && !(Equal currGoal cg_attack_inCombo)
  CALL_EVENT(evt_checkDefend)
endif
Return
Return