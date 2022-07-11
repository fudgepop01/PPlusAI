#include <Definition_AIMain.h>
id 0x8204
unk 0x0

XReciever
label setup
#let OHasHitShield = var0
#let OEndLag = var1
#let timer = var2
#let patience = var3
#let willStrike = var4

OHasHitShield = 0
timer = 0

willStrike = false
if CHANCE_MUL_LE PT_AGGRESSION 0.4
  willStrike = true
endif

patience = Rnd * 35 + 5
if Equal currGoal cg_bait_shield || XDistLE 30
  immediateTempVar = 60 * Rnd + 20
  patience += immediateTempVar
endif
Seek shield
Return
label shield
currGoal = cg_defend

XGoto PerFrameChecks
XReciever
Seek shield

if !(Equal AirGroundState 1)
  Return
endif

timer += 1
Button R

GET_CHAR_TRAIT(OEndLag, chr_get_OEndlagSafe)
Seek shield

if Equal LevelValue LV9
  immediateTempVar = OPos * 0.5
  globTempVar = OTopNY - TopNY
  if globTempVar > 0.5
    globTempVar = 0.5
  else
    globTempVar = -0.5
  endif
  AbsStick immediateTempVar globTempVar
endif

if Equal CurrAction hex(0x1D)
  MOD globTempVar timer 14
  if Equal globTempVar 0
    if OEndLag >= 35
      AbsStick OPos
    else
      immediateTempVar = OPos * -1
      AbsStick immediateTempVar
    endif
  endif 
  OHasHitShield += 1
endif

MOD globTempVar timer 3
if Equal CurrAction hex(0x1B) && Equal globTempVar 0 
  GetShieldRemain globTempVar
  immediateTempVar = OHasHitShield * 0.02
  GetCommitPredictChance anotherTempVar LevelValue
  if globTempVar < 40 || OEndLag > 12 || !(ODistLE 55)
    Seek pickOption
    Jump
  elif anotherTempVar > 0.35 
    Return
  elif OAttacking && OEndLag < 1
    Return
  elif Rnd <= immediateTempVar
    Seek pickOption
    Jump
  elif Equal willStrike true && ODistLE 45 && Rnd < 0.4
    Seek pickOption
    Jump
  elif timer >= patience && !(ODistLE 15) 
    Seek pickOption
    Jump
  endif
endif
Return
label pickOption
OEndLag += 15
predictAverage immediateTempVar man_OXHitDist LevelValue
immediateTempVar += 10
if CHANCE_MUL_LE PT_AGGRESSION 0.35 || Equal willStrike true
  if OEndLag > 10 && Rnd < 0.4
    Seek exec_attack
    Jump
  elif Rnd < 0.2 && XDistLE immediateTempVar
    Seek exec_attack
    Jump
  elif Rnd < 0.6 && Equal willStrike true
    Seek exec_attack
    Jump
  endif

  if !(True)
    label exec_attack
    Button X
    GetCommitPredictChance immediateTempVar LevelValue
    currGoal = cg_attack_reversal
    if ODistLE 10 && immediateTempVar > 0.2
      currGoal = cg_attack_wall
    endif
    XGoto CalcAttackGoal
    XReciever
    scriptVariant = sv_none
    XGoto SetAttackGoal
    XReciever
    skipMainInit = mainInitSkip
    CallI MainHub
  endif

  immediateTempVar -= 10
  if Equal OPos Direction && ODistLE 15
    if OEndLag > 5 && Rnd < 0.75 || Equal willStrike true
      Button A
      Call 0x1120
    endif
  endif
endif

GetCommitPredictChance immediateTempVar LevelValue
if Rnd < 0.4 && immediateTempVar > 0.15
  if Rnd < 0.2
    AbsStick OPos
  elif Rnd < 0.2
    immediateTempVar = OPos * -1
    AbsStick immediateTempVar
  elif Rnd < 0.6
    AbsStick 0 (-1)
  endif
endif

if OEndLag > 15 && Rnd < 0.75
  scriptVariant = sv_wavedash_in
  currGoal = cg_attack_reversal
  CallI Wavedash
elif OEndLag > 9 && Rnd < 0.7
  scriptVariant = sv_wavedash_out
  currGoal = cg_attack_reversal
  CallI Wavedash
endif

if Rnd < 0.3
  predictionConfidence immediateTempVar man_ODefendOption LevelValue
  predictOOption globTempVar man_ODefendOption LevelValue 
  if Rnd < immediateTempVar
    if Equal globTempVar op_defend_attack && Rnd < immediateTempVar
      if Rnd < 1
        scriptVariant = sv_jump_away
        if XDistBackEdge > -15
          scriptVariant = sv_jump_over
          scriptVariant += svp_jump_fullhop
        endif
        CallI JumpScr
      endif
      Seek shield
      Return
    elif Equal globTempVar op_defend_grab
      scriptVariant = sv_wavedash_in
      if XDistBackEdge > -10 && XDistFrontEdge < 10
        scriptVariant = sv_wavedash_awayFromLedge
      endif
      CallI Wavedash
    elif Equal globTempVar op_defend_shield
      scriptVariant = sv_wavedash_in
      if XDistBackEdge > -10 && XDistFrontEdge < 10
        scriptVariant = sv_wavedash_awayFromLedge
      endif
      CallI Wavedash
    endif
  endif
endif
Seek shield
Return
Return