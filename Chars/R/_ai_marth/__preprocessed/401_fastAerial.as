#include <Definition_AIMain.h>
id 0x8401
unk 0x0

XReciever
label begin
XGoto PerFrameChecks
XReciever
Seek begin

  if Equal CurrAction 22 
    if Equal PrevAction 33
      Return
    elif AnimFrame <= 3
      Return
    endif
  elif Equal CanCancelAttack 1
  elif CurrAction >= 24 && !(Equal CurrAction 73)
    Return
  endif

var16 = 1
XGoto CalcAttackGoal
XReciever

var15 = -2
var21 = 16.4
Call MainHub
Return
Return