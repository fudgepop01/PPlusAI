#include <Definition_AIMain.h>
id 0x8100
unk 0x0

$genPersonalityStrings()

//= XReciever

// XGoto PerFrameChecks
//= XReciever

SetAutoDefend 0
SetDisabledSwitch 1
SetDebugMode false
// SetDebugMode 1

SetDisabledMd -1

label initHitPredictValues
getCurrentPredictValue immediateTempVar man_OXHitDist
if Equal immediateTempVar 0
  trackOAction man_OXHitDist 20
  trackOAction man_OXSwingDist 40
  trackOAction man_OFramesPostHitstun 250
  Seek initHitPredictValues
  Jump
endif

label start

DisableDebugOverlay
if Equal currGoal cg_recover && Equal YDistFloor -1
  CallI RecoveryHub
elif currGoal >= cg_edgeguard
  lastAttack = -1
  Seek navigateToGoal
  Jump
endif

XGoto PerFrameChecks
//= XReciever
Seek start

#let teamCloser = var3
GetIsTeammateCloser teamCloser
if Equal teamCloser 1
  skipMainInit = -100
endif

if Equal skipMainInit mainInitSkip
  skipMainInit = -100
  GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
  if Equal immediateTempVar 1
    currGoal = cg_attack_reversal
  endif
  if !(Equal lastAttack -1)
    XGoto SetAttackGoal
    //= XReciever
    IF_AERIAL_ATTACK(var0)
    $ifLastOrigin(usmash,true)
    $ifLastOrigin(uspecial,true)
    elif Equal CurrSubaction JumpSquat
      scriptVariant = sv_wavedash_in
      Call Wavedash      
    endif
  endif
  Seek initial
  Jump
elif Equal skipMainInit sm_execAttack
  label empty_0
  XGoto PerFrameChecks
  //= XReciever
  Seek empty_0

  if Equal CurrAction hex(0x3) || Equal CurrAction hex(0x4)
    $ifLastOrigin(dashattack, false)
    elif True
      if Equal currGoal cg_defend
        scriptVariant = sv_wavedash_out
      endif
      scriptVariant = sv_wavedash_neutral
      CallI Wavedash 
    endif
  endif
  Goto isActionable
  Seek empty_0
  if Equal immediateTempVar 0
    Return
  endif
  skipMainInit = -100

  CallI ExecuteAttack
elif Equal currGoal cg_attack_wall && CHANCE_MUL_LE PT_WALL_CHANCE 0.45
  if YDistFloor > 25
    currGoal = cg_nothing
    lastAttack = -1
    Seek rollTactics
    Jump
  endif
  label empty_1
  XGoto PerFrameChecks
  //= XReciever
  Seek empty_1

  Goto isActionable
  if Equal immediateTempVar 0
    Return
  endif
  label setupWallDelay
  XGoto PerFrameChecks
  //= XReciever

  if Rnd < 0.1 && CHANCE_MUL_LE PT_WALL_CHANCE 1
    XGoto CalcAttackGoal
  elif Equal lastAttack -1 
    XGoto CalcAttackGoal
  endif
  Seek setupWallDelay
  
  #let timer = var0
  globTempVar = OTopNX - TopNX 
  immediateTempVar = OTopNY - TopNY
  Norm timer globTempVar immediateTempVar
  Abs timer
  if timer > 120
    currGoal = cg_nothing
    Call MainHub
    Return
  endif
  timer *= 0.4 * Rnd
  label wallDelay
  XGoto PerFrameChecks 
  //= XReciever
  Seek wallDelay
  if timer <= 0
    CallI ExecuteAttack
  endif
  timer -= 1
  Return
endif

label rollTactics

XGoto PerFrameChecks
//= XReciever

scriptVariant = sv_none
lastAttack = -1

DynamicDiceClear dslot0

predictionConfidence immediateTempVar man_OBaitOption
if immediateTempVar > 0.4 || CHANCE_MUL_LE PT_AGGRESSION 0.35
  DynamicDiceAdd dslot0 cg_attack 2
endif
immediateTempVar = PT_AGGRESSION * 4
DynamicDiceAdd dslot0 cg_attack immediateTempVar
GetCommitPredictChance immediateTempVar
if YDistFloor < 25
  immediateTempVar *= 8 * PT_WALL_CHANCE
  DynamicDiceAdd dslot0 cg_attack_wall immediateTempVar
endif
immediateTempVar = 5 - immediateTempVar
DynamicDiceAdd dslot0 cg_attack_reversal immediateTempVar

DynamicDiceRoll dslot0 currGoal 0

GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
if Equal teamCloser 1
  currGoal = cg_circleCamp
elif Equal HitboxConnected 1 || Equal PrevAction hex(0x3C)
  currGoal = cg_attack_reversal
elif Equal immediateTempVar 1
  currGoal = cg_attack_reversal
endif
goalY = BBoundary
if Equal currGoal -1
  Call MainHub
elif Equal currGoal cg_attack
  goalY = BBoundary
endif

label initial
XGoto PerFrameChecks
Seek initial
Goto isActionable
if Equal immediateTempVar 0
  Seek initial
  Return
endif

#let techSkill = var0
techSkill = LevelValue * 0.01
if techSkill < 0
  techSkill = 0.01
endif
label tskillWait
XGoto PerFrameChecks
Seek tskillWait
if Rnd < techSkill
  Seek selectGoal
  Jump
endif
Return
label selectGoal
XGoto PerFrameChecks
Cmd30
XGoto UpdateGoal

elif Equal goalY BBoundary
  Return
elif Equal currGoal cg_attack && Equal lastAttack -1
  Return
endif
if !(True)
  label navigateToGoal
endif
Seek selectGoal
{NAVIGATION_OVERRIDE}
if Equal scriptVariant sv_noNavigation
  scriptVariant = 0
  Return
endif
XGoto PerFrameChecks
Goto isActionable
Seek selectGoal
if Equal immediateTempVar 0
  Return
endif

XGoto MoveToGoal
Seek selectGoal
Return
label isActionable
{ISACTIONABLE_OVERRIDE}
immediateTempVar = 0

if Equal CanCancelAttack 1
elif Equal HitboxConnected 1 && HasCurry
elif CurrAction >= hex(0x67) && CurrAction <= hex(0x6D)
elif Equal CurrAction hex(0x16) 
  if Equal PrevAction hex(0x21)
    Return
  elif AnimFrame <= 3
    Return
  endif
elif CurrAction >= hex(0x18) && !(Equal CurrAction hex(0x49)) && !(Equal CurrAction hex(0x67)) && !(Equal CurrAction hex(0x6C))
  Return
endif

immediateTempVar = 1
Return
Return