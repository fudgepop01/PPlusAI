#include <Definition_AIMain.h>
id 0x1120
unk 0x0

//= XReciever

var0 = 0

  var22 = 19
STACK_PUSH 1 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
  XGoto GetChrSpecific
  //= XReciever

label start

if OFramesHitlag <= 0 && OFramesHitstun > 0
  var0 += 1
  if Equal var0 2
    if !(True)
      label correctMoveAngle
    endif
    if var1 > 90
      var1 -= 90
      if var1 > 90
        SeekNoCommit correctMoveAngle
      endif
    endif

    var22 = var1 + 3
    var23 = var1 - 3
    if OKBAngle > var22
      trackOAction 5 1
    elif OKBAngle < var23
      trackOAction 5 3
    elif Rnd < 0.5
      trackOAction 5 2
    endif
  endif
endif

if Equal CurrSubaction 462
  Button X
elif Equal CurrSubaction 468
  if AnimFrame > 8
    Stick 0 1
  endif
elif CurrSubaction >= 448 && CurrSubaction <= 483 
elif Equal CurrSubaction 115
elif CurrAction < 52 || CurrAction > 60
  XGoto CalcAttackGoal
  //= XReciever
  var15 = -10
  var21 = 16.4
  CallI MainHub
elif Equal CurrAction 57 && AnimFrame > 8
if Equal var20 -1
    Stick 1 0
elif Equal var20 17
    Stick 0 (-1)
elif Equal var20 18
    Stick -1 0
elif Equal var20 19
    Stick 0 1
  elif True
    if Rnd < 0.7
      GetYDistFloorOffset var22 20 0 0
      if Equal var22 -1
        AbsStick 1 0
        Return
      endif
      GetYDistFloorOffset var22 -20 0 0
      if Equal var22 -1
        AbsStick -1 0
        Return
      endif
    endif

    if Rnd < 0.5
      AbsStick 0 1
    else 
      AbsStick 0 (-1)
    endif
  endif
endif

Return
Return
