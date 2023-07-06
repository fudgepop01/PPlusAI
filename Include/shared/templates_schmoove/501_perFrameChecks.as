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

//--- special state switches
if Equal CurrAction hex(0x7C) || Equal CurrAction hex(0x7D)
  Stick -0.78
elif !(CalledAs LyingDown) && Equal CurrAction hex(0x4D)
  CallI LyingDown
elif !(CalledAs OnLedge) && CurrAction >= hex(0x73) && CurrAction <= hex(0x75)
  CallI OnLedge
endif

//--- switch tactic if conditions are met
if FramesHitstun > 0 && !(CalledAs AttackedHub) && CurrAction >= hex(0x43) && CurrAction <= hex(0x45)
  CallI AttackedHub
endif
if !(Equal currGoal cg_edgeguard) && !(Equal currGoal cg_recover) && !(CalledAs OnLedge) && Equal FramesHitstun 0
  if OutOfStage 
    globTempVar = TopNY + 10
    GetColDistPosRel globTempVar globTempVar TopNX globTempVar 0 -150 0
    if Equal globTempVar -1 || globTempVar < -5
      CallI RecoveryHub
    endif
  elif MeteoChance
    // CallI EdgeguardHub
  endif
endif

if Equal CurrAction hex(0xBE)
  Stick 1
endif
// react to/read the opponent's attack patterns
immediateTempVar = (1 - (LevelValue / 100)) * 30 + 9
MOD immediateTempVar AnimFrame immediateTempVar
if Equal immediateTempVar 0 && !(Equal currGoal cg_defend)
  predictAverage immediateTempVar man_OXHitDist LevelValue
  immediateTempVar += 3
  if ODistLE immediateTempVar
    GetCommitPredictChance globTempVar LevelValue
    // globTempVar *= 0.8
    immediateTempVar = (Rnd * 4) + 14 + (1 - LevelValue / 100) * 15
    if Rnd < globTempVar && Rnd < globTempVar
      CallI DefendHub
    elif OAnimFrame >= immediateTempVar && OAttackCond
      CallI DefendHub
    endif
  endif
endif
Return
Return