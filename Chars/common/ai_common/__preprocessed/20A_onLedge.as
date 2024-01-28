#include <Definition_AIMain.h>
id 0x820A
unk 0x0

//= XReciever
label begin
if Equal OIsOnStage 1
  var21 = 15
else
  var21 = 16.71
endif
XGoto PerFrameChecks
//= XReciever
Seek begin

if Equal CurrAction 115 || Equal CurrAction 116
  Return
endif

Goto actionCheck
Seek begin

if AnimFrame > 2
  if Equal var21 16.71
    LOGSTR_NL 1279607808 1195728640 1162102528 1162298368 0
    var0 = OTopNX - TopNX
    var1 = var0
    Abs var1

    if var1 <= 45 && CHANCE_MUL_LE PT_AGGRESSION 0.25
      if OCurrAction >= 272 && AnimFrame > 20
        Button R
        Call MainHub
      elif OYDistBackEdge > -45
        if OYDistBackEdge < -15
          Button X
        else
          Stick -1
        endif
        var21 = 16.71
        XGoto CalcAttackGoal
        //= XReciever
        var15 = -10
        Call MainHub
        Return
      endif
    elif Rnd < 0.2
      Seek exec_wait
      Jump
    elif OYDistBackEdge < 5 && var1 < 15
      Button A
      Call MainHub
    elif OYDistBackEdge < 25 && var1 < 50
      Button R
      Call MainHub
    elif var1 > 70 && Equal OAirGroundState 2
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
      DynamicDiceAdd 0 2 1.6
    endif
    DynamicDiceAdd 0 3 1.2
    DynamicDiceAdd 0 4 0.8
    DynamicDiceAdd 0 5 1.2
    DynamicDiceAdd 0 6 1.2

    DynamicDiceRoll 0 var22 0
    if Equal var22 1
      Button X
      if CHANCE_MUL_LE PT_AGGRESSION 0.75
        var21 = 16
        var15 = -10
      endif
      Call MainHub
    elif Equal var22 3
      Seek exec_wait
      Jump
    elif Equal var22 4 && XDistLE 60
      Button R
      Call MainHub
    elif Equal var22 2 
      Call LedgeDash
    elif Equal var22 5 && XDistLE 40
      Button A
      Call MainHub
    elif Equal var22 6 && XDistLE 30
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
        var15 = -20
        var21 = 16
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
  var0 = Rnd * 45 + 10
  label waiting
  XGoto PerFrameChecks
  //= XReciever
  var0 -= 1
  Goto actionCheck
  Seek waiting
  if var0 <= 0
    Seek begin
  endif
Return
label actionCheck
  if CurrAction <= 33
    var21 = 0
    CallI MainHub
  endif
Return
Return
