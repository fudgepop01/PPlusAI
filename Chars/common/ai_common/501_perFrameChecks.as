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
// O OOS Option
if Equal OAnimFrame 0 && OFramesSinceShield < 20
  if Equal OCurrAction hex(0x21)
    trackOAction man_OOOSOption op_OOOS_WD
  elif OAttacking && !(Equal OCurrAction hex(0x34))
    trackOAction man_OOOSOption op_OOOS_attack
  elif Equal OCurrAction hex(0x34)
    trackOAction man_OOOSOption op_OOOS_grab
  endif
elif OAttacking && Equal OAnimFrame 0
  globTempVar = TopNX - OTopNX
  Abs globTempVar
  trackOAction man_OXAttackDist globTempVar
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
if currGoal >= cg_bait && currGoal < calc(cg_bait + 1)
  Goto baitDefendOption
elif Equal currGoal cg_defend
  Goto baitDefendOption
endif
if !(True)
  label baitDefendOption
  immediateTempVar = (1 - (LevelValue / 100)) * 30 + 12
  MOD immediateTempVar AnimFrame immediateTempVar
  if Equal immediateTempVar 1
    globTempVar = man_OBaitOption
    if Equal currGoal cg_defend
      globTempVar = man_ODefendOption
    endif
    predictAverage immediateTempVar man_OXHitDist LevelValue
    immediateTempVar += 15
    // globTempVar = immediateTempVar + 15
    if ODistLE immediateTempVar
      if hex(0x3) <= OCurrAction && OCurrAction <= hex(0x5) && Rnd < 0.4 && !(Equal currGoal cg_defend)
        trackOAction man_OBaitOption op_bait_move
        if OAnimFrame >= 6 || Equal OCurrAction hex(0x4) || Equal OCurrAction hex(0x3)
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
      elif Equal OCurrAction hex(0x34) || Equal OCurrAction hex(0x36) || Equal OCurrAction hex(0x38) 
        trackOAction globTempVar op_bait_grab
      elif OAttacking && Rnd < 0.5 && Equal currGoal cg_defend
        trackOAction globTempVar op_defend_attack
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
elif !(CalledAs LyingDown) && Equal CurrAction hex(0x4D)
  CallI LyingDown
elif !(CalledAs OnLedge) && CurrAction >= hex(0x73) && CurrAction <= hex(0x75)
  CallI OnLedge
endif

//--- switch tactic if conditions are met
if !(CalledAs AttackedHub) && CurrAction >= hex(0x42) && CurrAction <= hex(0x45) && !(Equal currGoal cg_inHitstun)
  if FramesHitstun > 0
    CallI AttackedHub
  elif Equal CurrAction hex(0x42)
    CallI AttackedHub
  endif
endif
if !(Equal currGoal cg_edgeguard) && !(Equal currGoal cg_recover) && !(CalledAs OnLedge) && Equal FramesHitstun 0
  if OutOfStage 
    globTempVar = SCDBottom + 5
    GetColDistPosRel globTempVar globTempVar TopNX globTempVar 25 -150 0
    if Equal globTempVar -1 || globTempVar < -5
      GetColDistPosRel globTempVar globTempVar TopNX globTempVar -25 -150 0
      if Equal globTempVar -1 || globTempVar < -5
        CallI RecoveryHub
      endif
    endif
  elif MeteoChance
    // CallI EdgeguardHub
  endif
endif

if Equal CurrAction hex(0xBE)
  Stick 1
endif

if Equal CurrAction hex(0x1D) && !(CalledAs Shield)
  CallI Shield
endif

ACTIONABLE_ON_GROUND

// react to/read the opponent's attack patterns
immediateTempVar = (1 - (LevelValue / 100)) * 30 + 14
MOD immediateTempVar AnimFrame immediateTempVar
if Equal immediateTempVar 0 && !(Equal currGoal cg_defend) && !(Equal currGoal cg_attack_reversal) && OFramesHitstun <= 0 && !(CalledAs Shield)
  if OCurrAction < hex(0x42) || OCurrAction >= hex(0x48)
    if Equal AirGroundState 2 && Rnd < 0.5
      Return
    endif
    predictAverage immediateTempVar man_OXHitDist LevelValue
    immediateTempVar += 3
    if Equal currGoal cg_inHitstun || Equal CurrAction hex(0x49)
      immediateTempVar += 17
    endif
    if ODistLE immediateTempVar
      GetCommitPredictChance globTempVar LevelValue
      globTempVar *= 0.8
      if Equal currGoal cg_inHitstun || Equal CurrAction hex(0x49)
        immediateTempVar = Damage * 0.1
        globTempVar += immediateTempVar
      endif
      immediateTempVar = (Rnd * 4) + 14 + (1 - LevelValue / 100) * 15
      if Rnd < globTempVar && Rnd < globTempVar
        if currGoal < cg_attack || currGoal > calc(cg_attack + 1)
          CallI DefendHub
        elif Rnd < 0.75 || Equal currGoal cg_inHitstun || Equal CurrAction hex(0x49)
          CallI DefendHub
        endif
      elif OAnimFrame >= immediateTempVar && OAttackCond
        if currGoal < cg_attack || currGoal > calc(cg_attack + 1)
          CallI DefendHub
        elif Rnd < 0.75 || Equal currGoal cg_inHitstun || Equal CurrAction hex(0x49)
          CallI DefendHub
        endif
      endif
    endif
  endif
endif
Return
Return