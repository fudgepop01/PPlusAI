#include <Definition_AIMain.h>
id 0x8201
unk 0x0

XReciever
label setup

if Equal CurrAction 4 || Equal CurrAction 5 || Equal CurrAction 6
  if Equal var16 1
    if Rnd < 0.2
      var16 = 3
    else
      var16 = 1
    endif
  elif Equal var16 2
    var16 = 2 
  elif Equal var16 3
    var16 = 3
  endif
  CallI Wavedash
endif

var0 = 14 - 2
var0 = Rnd * var0 + 2
var1 = 1
if Equal var16 2
  var0 += 3
  if var0 >= 14
    var0 = 14
  endif
endif
label execution
XGoto PerFrameChecks
XReciever
Seek execution

if XDistFrontEdge < 15
  Call MainHub
elif XDistBackEdge > -25
  var16 = 1
endif

if Equal var16 1
  AbsStick OPos
elif Equal var16 2
  if XDistBackEdge > -20
    var16 = 4
    AbsStick OPos
    Return
  endif
  var22 = OPos * -1
  AbsStick var22
elif Equal var16 3
  var22 = TopNX * -1
  AbsStick var22
elif Equal var16 4
  AbsStick OPos
  if !(Equal var1 OPos)
    Call MainHub
  endif
  Return
endif
var0 -= 1
if var0 <= 0
  Call MainHub
endif
Return
Return
