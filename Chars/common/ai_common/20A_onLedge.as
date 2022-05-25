#include <Definition_AIMain.h>
id 0x820A
unk 0x0

XReciever
if currGoal >= cg_edgeguard
  currGoal = cg_ledge_edgeguard
else
  currGoal = cg_ledge
endif
label begin
XGoto PerFrameChecks
XReciever
Seek begin

if Equal CurrAction hex(0x73) || Equal CurrAction hex(0x74)
  Return
endif

if AnimFrame > 2
  if Equal currGoal cg_ledge_edgeguard
    // LOGSTR_NL str("LEDGE_EDGEGD")
    #let oCloseness = var0
    #let absOCloseness = var1
    oCloseness = OTopNX - TopNX
    absOCloseness = oCloseness
    Abs absOCloseness

    if ODistLE 30
      if OCurrAction >= hex(0x110)
        Button R
        Call MainHub
      elif Invincible && AnimFrame < 15
        Stick -1
        XGoto CalcAttackGoal
        XReciever
        skipMainInit = mainInitSkip
        currGoal = cg_edgeguard
        Call MainHub
        Return
      endif
    elif Rnd < 0.2
      Seek exec_wait
      Jump
    elif OYDistBackEdge < -5 && absOCloseness < 15
      Button A
      Call MainHub
    elif OYDistBackEdge < -25 && absOCloseness < 45
      Button X
      XGoto CalcAttackGoal
      XReciever
      skipMainInit = mainInitSkip
      currGoal = cg_edgeguard
      Call MainHub
    elif ODistLE 70
      if Rnd < 0.2
        Seek exec_wait
        Jump
      endif
      Call LedgeStall
    endif
  else
    #const t_winner = 1
    #const ledgedash = 2
    #const wait = 3
    #const roll = 4
    #const getupAttack = 5
    #const jumpAttack = 6

    DynamicDiceClear dslot0
    DynamicDiceAdd dslot0 t_winner 0.8
    if LevelValue >= LV7
      DynamicDiceAdd dslot0 ledgedash 2.5
    endif
    DynamicDiceAdd dslot0 wait 1.6
    DynamicDiceAdd dslot0 roll 0.8
    DynamicDiceAdd dslot0 getupAttack 1.2
    DynamicDiceAdd dslot0 jumpAttack 1.2

    DynamicDiceRoll dslot0 immediateTempVar 0
    if Equal immediateTempVar t_winner
      Button X
      if CHANCE_MUL_LE PT_AGGRESSION 0.75
        currGoal = cg_attack
        skipMainInit = mainInitSkip
      endif
      Call MainHub
    elif Equal immediateTempVar wait
      Seek exec_wait
      Jump
    elif Equal immediateTempVar roll && ODistLE 60
      Button R
      Call MainHub
    elif Equal immediateTempVar ledgedash 
      Call LedgeDash
    elif Equal immediateTempVar getupAttack && ODistLE 40
      Button A
    elif Equal immediateTempVar jumpAttack && ODistLE 30
      XGoto CalcAttackGoal
      XReciever
      Stick -1
      Seek
      Return
      label
      XGoto PerFrameChecks
      XReciever
      
      if YDistBackEdge <= 0
        skipMainInit = sm_execAttack
        currGoal = cg_attack
        Call MainHub
      elif YDistBackEdge > 5
        Button X
        Stick 1
      endif
    endif
  endif
endif

if CurrAction <= hex(0x21)
  CallI MainHub
endif
Return
label exec_wait
  #let timer = var0
  timer = Rnd * 45 + 10
  label waiting
  XGoto PerFrameChecks
  XReciever
  Seek waiting
  timer -= 1
  if timer <= 0
    Seek begin
  endif
Return
Return