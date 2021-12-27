#include <Definition_AIMain.h>
id 0x1120
unk 0x0


if CurrAction < 52 || CurrAction > 60
  CallI MainHub
elif Equal CurrAction 57 && AnimFrame > 8
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

if Equal var20 17
    Stick 1 0
elif Equal var20 18
    Stick 0 (-1)
elif Equal var20 19
    Stick -1 0
elif Equal var20 20
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
