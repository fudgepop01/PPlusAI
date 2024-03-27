#include <Definition_AIMain.h>
id 0x8204
unk 0x0

//= XReciever
label setup
#let OHasHitShield = var0
#let OEndLag = var1
#let patience = var2
#let willStrike = var3

OHasHitShield = 0

willStrike = false
PredictOMov immediateTempVar mov_grab
if CHANCE_MUL_LE PT_AGGRESSION 0.35 || immediateTempVar > 0.4
  willStrike = true
endif

patience = Rnd * 35 + 5
PredictOMov immediateTempVar mov_attack
if Equal currGoal cg_bait_shield || immediateTempVar > 0.36
  immediateTempVar = 30 * Rnd + 10
  patience += immediateTempVar
endif
if Equal currGoal cg_defend_crouchCancel
  patience *= 1.5
endif
label shield
XGoto PerFrameChecks
//= XReciever
Seek shield

GET_CHAR_TRAIT(OEndLag, chr_get_OEndlagSafe)
Seek shield
if CurrAction >= hex(0x1E) && CurrAction <= hex(0x20)
  Return
elif CurrAction <= hex(0x10) && PrevAction >= hex(0x1E) && PrevAction <= hex(0x20)
  currGoal = cg_nothing
  CallI MainHub
endif

if Equal CurrAction hex(0x39)
  currGoal = cg_attack_reversal
  CallI ExecuteAttack
elif !(Equal AirGroundState 1)
  Return
endif

patience -= 1
if Equal currGoal cg_defend_crouchCancel
  AbsStick 0 (-0.7)
  if patience <= 0
    CallI MainHub
  endif
else
  Button R
  predictAverage globTempVar man_OXHitDist
  if XDistLE globTempVar
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
    if !(Equal currGoal cg_bait_shield)
      GetCommitPredictChance immediateTempVar
      PredictOMov anotherTempVar mov_grab
      if Rnd < 0.3 && immediateTempVar > 0.21
        Goto rollOption
      elif anotherTempVar > 0.12
        Goto rollOption
      endif
    endif
  endif
endif

Seek shield
// LOGSTR_NL str("endl")
// LOGVAL_NL OEndLag
if Equal CurrAction hex(0x1D)
  MOD globTempVar GameTimer 14
  if Equal globTempVar 0
    if OEndLag >= 17
      AbsStick OPos
    else
      immediateTempVar = OPos * -1
      AbsStick immediateTempVar
    endif
  endif 
  OHasHitShield += 1
endif
if OAttackCond && Equal OEndLag -1 && CurrAction <= hex(0x1E)
  patience += 1
  Return
endif

MOD globTempVar GameTimer 3
if Equal globTempVar 0 || patience <= 0
  if Equal CurrAction hex(0x1B) || Equal CurrAction hex(0x11) || Equal CurrAction hex(0x12)
    GetShieldRemain globTempVar
    immediateTempVar = OHasHitShield * 0.05
    GetCommitPredictChance anotherTempVar
    if globTempVar < 40 || OEndLag > 6 || !(XDistLE 50)
      Seek pickOption
      Jump
    elif anotherTempVar > 0.25 && Rnd <= 0.85 && Equal willStrike false
      Return
    elif Equal willStrike true && XDistLE 40 && Rnd < 0.4
      Seek pickOption
      Jump
    elif OAttacking && OEndLag < 1
      Return
    elif Rnd <= immediateTempVar
      Seek pickOption
      Jump
    elif patience <= 0 && !(XDistLE 10)
      Seek pickOption
      Jump
    endif
  endif
endif
Return
label pickOption
OEndLag += 8
predictAverage immediateTempVar man_OXHitDist
immediateTempVar += 10
if CHANCE_MUL_LE PT_AGGRESSION 0.35 || Equal willStrike true || OEndLag > 10
  if OEndLag > 10 && Rnd < 0.85
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
    if !(Equal currGoal cg_defend_crouchCancel)
      Button X
      Seek jumpExec
      // LOGSTR_NL str("jumping")
      Return
    endif
    label jumpExec
    // LOGSTR_NL str("execing")
    XGoto CalcAttackGoal
    //= XReciever
    scriptVariant = sv_none
    XGoto SetAttackGoal
    //= XReciever
    skipMainInit = mainInitSkip
    currGoal = cg_attack_shieldPunish
    CallI MainHub
  endif

  if Equal OPos Direction && XDistLE 10
    if OEndLag > 5 && Rnd < 0.75 || Equal willStrike true
      Button A
      Call ExecuteAttack
    endif
  endif
endif

if !(Equal currGoal cg_defend_crouchCancel)
  // LOGSTR_NL str("wdPlace")
  if OEndLag > 15 && Rnd < 0.75
    Goto wdPunish
  elif OEndLag > 4 && Rnd < 0.4
    scriptVariant = sv_wavedash_out
    currGoal = cg_nothing
    CallI Wavedash
  endif

  if Rnd < 0.3
    predictionConfidence immediateTempVar man_ODefendOption
    predictOOption globTempVar man_ODefendOption 
    if Rnd < immediateTempVar
      if Equal globTempVar op_defend_attack && Rnd < immediateTempVar
        if Rnd < 0.3
          scriptVariant = sv_jump_away
          if DistBackEdge < 15
            scriptVariant = calc(sv_jump_over + svp_jump_fullhop)
          endif
          CallI JumpScr
        endif
        Seek shield
        Return
      elif True
        Goto wdPunish
      endif
    endif
  endif
endif
Seek shield
Return
label wdPunish
scriptVariant = sv_wavedash_in
if DistBackEdge < 10 || DistFrontEdge < 10
  scriptVariant = sv_wavedash_awayFromLedge
endif
skipMainInit = mainInitSkip
currGoal = cg_attack_shieldPunish
CallI Wavedash
label rollOption
Seek RO_Exec
ClearStick
Return
label RO_Exec
Button R
immediateTempVar = Rnd
if immediateTempVar < 0.2
  AbsStick OPos
elif immediateTempVar < 0.4
  immediateTempVar = OPos * -1
  AbsStick immediateTempVar
else
  AbsStick 0 (-1)
endif
Seek shield
Return
Return