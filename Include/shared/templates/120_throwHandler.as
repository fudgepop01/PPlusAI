#include <Definition_AIMain.h>
id 0x1120
unk 0x0


if CurrAction < hex(0x34) || CurrAction > hex(0x3C)
  CallI MainHub
elif Equal CurrAction hex(0x39) && AnimFrame > 8
  if Rnd < 0.7
    GetYDistFloorOffset immediateTempVar 20 0 0
    if Equal immediateTempVar -1
      AbsStick 1 0
      Return
    endif
    GetYDistFloorOffset immediateTempVar -20 0 0
    if Equal immediateTempVar -1
      AbsStick -1 0
      Return
    endif
  endif

  $ifLastAttack(fthrow)
    Stick 1 0
  $elifLastAttack(dthrow)
    Stick 0 (-1)
  $elifLastAttack(bthrow)
    Stick -1 0
  $elifLastAttack(uthrow)
    Stick 0 1
  elif True
    if Rnd < 0.5
      AbsStick 0 1
    else 
      AbsStick 0 (-1)
    endif
  endif
endif

Return
Return