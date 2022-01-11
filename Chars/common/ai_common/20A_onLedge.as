#include <Definition_AIMain.h>
id 0x820A
unk 0x0

XReciever
currGoal = cg_ledge
label begin
XGoto PerFrameChecks
XReciever
Seek begin

if Equal CurrAction hex(0x73) || Equal CurrAction hex(0x74)
  Return
endif

if AnimFrame > 2
  #const t_winner = 1
  #const ledgedash = 2
  #const wait = 3
  #const roll = 4

  DynamicDiceClear dslot0
  DynamicDiceAdd dslot0 t_winner 1
  // if LevelValue >= LV7
  //   DynamicDiceAdd ledgedash
  //   DynamicDiceAdd ledgedash
  // endif
  DynamicDiceAdd dslot0 wait 1
  DynamicDiceAdd dslot0 roll 1

  DynamicDiceRoll dslot0 immediateTempVar 0
  if Equal immediateTempVar t_winner
    Button X
    if CHANCE_MUL_LE PT_AGGRESSION 0.75
      currGoal = cg_attack
      skipMainInit = mainInitSkip
    endif
    Call MainHub
  elif Equal immediateTempVar wait
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
  elif Equal immediateTempVar roll
    Button R
    Call MainHub
  endif
endif

if CurrAction <= hex(0x21)
  CallI MainHub
endif
Return
Return