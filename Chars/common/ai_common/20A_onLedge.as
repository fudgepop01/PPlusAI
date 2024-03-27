#include <Definition_AIMain.h>
id 0x820A
unk 0x0

//= XReciever
label begin
if Equal OIsOnStage 1
  currGoal = cg_ledge
else
  currGoal = cg_ledge_edgeguard
endif
XGoto PerFrameChecks
//= XReciever
Seek begin

if Equal CurrAction hex(0x73) || Equal CurrAction hex(0x74)
  Return
endif

Goto actionCheck
Seek begin

if AnimFrame > 2
  if Equal currGoal cg_ledge_edgeguard
    // LOGSTR_NL str("LEDGE_EDGEGD")
    #let oCloseness = var0
    #let absOCloseness = var1
    oCloseness = OTopNX - TopNX
    absOCloseness = oCloseness
    Abs absOCloseness

    if absOCloseness <= 45 && CHANCE_MUL_LE PT_AGGRESSION 0.25
      if OCurrAction >= hex(0x110) || Equal OCurrAction hex(0x10)
        if AnimFrame > 20 || ODistLE 10
          Button R
          Call MainHub
        endif
      elif OYDistBackEdge > -45
        if OYDistBackEdge < -15
          Button X
        else
          Stick -1
        endif
        currGoal = cg_ledge_edgeguard
        XGoto CalcAttackGoal
        //= XReciever
        skipMainInit = mainInitSkip
        Call MainHub
        Return
      endif
    elif Rnd < 0.2
      Seek exec_wait
      Jump
    elif OYDistBackEdge < 5 && absOCloseness < 15
      Button A
      Call MainHub
    elif OYDistBackEdge < 25 && absOCloseness < 50
      Button R
      Call MainHub
    elif absOCloseness > 70 && Equal OAirGroundState 2
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
      DynamicDiceAdd dslot0 ledgedash 1.6
    endif
    DynamicDiceAdd dslot0 wait 1.2
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
    elif Equal immediateTempVar roll && XDistLE 60
      Button R
      Call MainHub
    elif Equal immediateTempVar ledgedash 
      Call LedgeDash
    elif Equal immediateTempVar getupAttack && XDistLE 40
      Button A
      Call MainHub
    elif Equal immediateTempVar jumpAttack && XDistLE 30
      XGoto CalcAttackGoal
      //= XReciever
      Stick -1
      Seek _jAttack
      Return
      label _jAttack
      XGoto PerFrameChecks
      //= XReciever
      Seek _jAttack

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
Return
label exec_wait
  #let timer = var0
  timer = Rnd * 45 + 10
  label waiting
  XGoto PerFrameChecks
  //= XReciever
  timer -= 1
  Goto actionCheck
  Seek waiting
  if timer <= 0
    Seek begin
  endif
Return
label actionCheck
  if CurrAction <= hex(0x21)
    currGoal = cg_nothing
    CallI MainHub
  endif
Return
Return