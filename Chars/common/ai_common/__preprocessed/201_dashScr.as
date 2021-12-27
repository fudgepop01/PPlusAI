#include <Definition_AIMain.h>
id 0x8201
unk 0x0

XReciever
label setup
  var10 = 12
  XGoto GetChrSpecific
  XReciever
  var3 = var10
  var10 = 13
  XGoto GetChrSpecific
  XReciever
  var4 = var10
  Seek setup

var1 = 0

if Equal CurrAction 4 || Equal CurrAction 5
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


var0 = var3 * 2 - var4 + Rnd * 20
var0 = Rnd * var0 + var4 
var2 = OPos
if Equal var16 2
  var0 += 3
  if var0 >= var3
    var0 = var3
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

if var1 < var3 && !(Equal var16 4)
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
  endif
elif Equal var16 4
  if TopNX < 0 && OTopNX > 0
  elif TopNX > 0 && OTopNX < 0
  else
    var22 = OTopNX
    var17 = TopNX 
    Abs var22
    Abs var17
    if var17 < var22 && var17 > 20
      var16 = 3
      AbsStick OPos
      Return
    endif
  endif

  AbsStick OPos
  if !(Equal var2 OPos)
    Call MainHub
  endif
  Return
endif
var1 += 1
if var1 > var0
  Call MainHub
endif
Return
Return
