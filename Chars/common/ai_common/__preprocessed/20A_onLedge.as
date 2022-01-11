#include <Definition_AIMain.h>
id 0x820A
unk 0x0

XReciever
var21 = 15
label begin
XGoto PerFrameChecks
XReciever
Seek begin

if Equal CurrAction 115 || Equal CurrAction 116
  Return
endif

if AnimFrame > 2

  DynamicDiceClear 0
  DynamicDiceAdd 0 1 1
  // if LevelValue >= 60
  //   DynamicDiceAdd 2
  //   DynamicDiceAdd 2
  // endif
  DynamicDiceAdd 0 3 1
  DynamicDiceAdd 0 4 1

  DynamicDiceRoll 0 var22 0
  if Equal var22 1
    Button X
    if CHANCE_MUL_LE PT_AGGRESSION 0.75
      var21 = 16
      var15 = -1
    endif
    Call MainHub
  elif Equal var22 3
    var0 = Rnd * 45 + 10
    label waiting
    XGoto PerFrameChecks
    XReciever
    Seek waiting
    var0 -= 1
    if var0 <= 0
      Seek begin
    endif
  elif Equal var22 4
    Button R
    Call MainHub
  endif
endif

if CurrAction <= 33
  CallI MainHub
endif
Return
Return
