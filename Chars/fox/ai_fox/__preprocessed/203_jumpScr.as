#include <Definition_AIMain.h>
id 0x8203
unk 0x0

XReciever


label setup
XGoto PerFrameChecks
XReciever
Seek setup
  if Equal CurrAction 22 
    if Equal PrevAction 33
      Return
    elif AnimFrame <= 3
      Return
    endif
  elif CurrAction >= 66 && CurrAction <= 73
  elif Equal CanCancelAttack 1
  elif CurrAction >= 24
    Return
  endif

var0 = OPos
OR var17 var16 var16
var1 = var16 - var17
if Equal var1 0.1
  var1 = 1
else
  var1 = 0
endif
label jumpCommand
Button X
label locomotion
XGoto PerFrameChecks
XReciever
if Equal var1 1 && Equal AirGroundState 1
  Seek jumpCommand
else
  Seek locomotion
endif

if Equal CurrSubaction JumpSquat
  Button X
endif
if Equal var16 1
  if Equal AirGroundState 1
    Return
  endif
  AbsStick var0
  if !(Equal var0 OPos) || YSpeed < 0
    CallI MainHub
  endif
elif Equal var16 2
  if Equal AirGroundState 2
    CallI MainHub
  endif
elif Equal var16 3
  var22 = OPos * -1
  AbsStick var22
  if YSpeed < 0 && Equal AirGroundState 2
    CallI MainHub
  endif
else
  CallI MainHub
endif
Return
Return
