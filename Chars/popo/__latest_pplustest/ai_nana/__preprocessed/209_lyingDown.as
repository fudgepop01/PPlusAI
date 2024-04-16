#include <Definition_AIMain.h>
id 0x8209
unk 0x0

//= XReciever
label setup
var0 = 0
label begin
XGoto PerFrameChecks
//= XReciever
Seek begin
var21 = 17

if CurrAction <= 32 || Equal CanCancelAttack 1
  if ODistLE 30
    CallI DefendHub
  endif
  CallI MainHub
endif

if !(Equal CurrAction 77) && CurrAction < 137
  Return
endif

var22 = Rnd * 4 - 2
if var22 > 1
  Button R
  if var22 > 2
    Button A
  endif
else
  var22 *= 5
  Stick var22
endif 

Return
Return
