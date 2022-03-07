#include <Definition_AIMain.h>
id 0x820A
unk 0x0

XReciever
if var21 >= 16.7
  var21 = 15.1
else
  var21 = 15
endif
label begin
XGoto PerFrameChecks
XReciever
Seek begin

if Equal CurrAction 115 || Equal CurrAction 116
  Return
endif

if AnimFrame > 2
  if Equal var21 15.1
    LOGSTR_NL 1279607808 1195728640 1162102528 1162298368 0
    var0 = OTopNX - TopNX
    var1 = var0
    Abs var1

    if ODistLE 30
      if OCurrAction >= 272
        Button R
        Call MainHub
      elif Invincible && AnimFrame < 15
        Stick -1
        XGoto CalcAttackGoal
        XReciever
        var15 = -1
        var21 = 16.7
        Call MainHub
        Return
      endif
    elif Rnd < 0.2
      Seek exec_wait
      Jump
    elif OYDistBackEdge < -5 && var1 < 15
      Button A
      Call MainHub
    elif OYDistBackEdge < -25 && var1 < 45
      Button X
      XGoto CalcAttackGoal
      XReciever
      var15 = -1
      var21 = 16.7
      Call MainHub
    elif ODistLE 70
      if Rnd < 0.2
        Seek exec_wait
        Jump
      endif
      Call LedgeStall
    endif
  else

    DynamicDiceClear 0
    DynamicDiceAdd 0 1 0.8
    if LevelValue >= 60
      DynamicDiceAdd 0 2 2.5
    endif
    DynamicDiceAdd 0 3 1.6
    DynamicDiceAdd 0 4 0.8
    DynamicDiceAdd 0 5 1.2
    DynamicDiceAdd 0 6 1.2

    DynamicDiceRoll 0 var22 0
    if Equal var22 1
      Button X
      if CHANCE_MUL_LE PT_AGGRESSION 0.75
        var21 = 16
        var15 = -1
      endif
      Call MainHub
    elif Equal var22 3
      Seek exec_wait
      Jump
    elif Equal var22 4 && ODistLE 35
      Button R
      Call MainHub
    elif Equal var22 2 
      Call LedgeDash
    elif Equal var22 5 && ODistLE 40
      Button A
    elif Equal var22 6 && ODistLE 30
      XGoto CalcAttackGoal
      XReciever
      Stick -1
      Seek
      Return
      label
      XGoto PerFrameChecks
      XReciever
      
      if YDistBackEdge <= 0
        var15 = -2
        var21 = 16
        Call MainHub
      elif YDistBackEdge > 5
        Button X
        Stick 1
      endif
    endif
  endif
endif

if CurrAction <= 33
  CallI MainHub
endif
Return
label exec_wait
  var0 = Rnd * 45 + 10
  label waiting
  XGoto PerFrameChecks
  XReciever
  Seek waiting
  var0 -= 1
  if var0 <= 0
    Seek begin
  endif
Return
Return
