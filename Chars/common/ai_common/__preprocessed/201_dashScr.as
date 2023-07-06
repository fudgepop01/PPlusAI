#include <Definition_AIMain.h>
id 0x8201
unk 0x0

//= XReciever
label setup
  var22 = 12
  XGoto GetChrSpecific
  //= XReciever
var3 = var22
  var22 = 13
  XGoto GetChrSpecific
  //= XReciever
var4 = var22
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
  elif Equal var16 4
    var16 = 3
  endif
  CallI Wavedash
endif

var0 = var3 - var4
var0 = Rnd * var0 + var4
var2 = OPos
var3 -= 1
if Equal var16 3
  var0 += 8
endif
label execution
XGoto PerFrameChecks
//= XReciever
Seek execution
if Equal CurrAction 1 || Equal CurrAction 6
  ClearStick
  Return
endif

if XDistBackEdge > -25 && Equal Direction OPos && !(Equal var16 5)
  var16 = 1
endif

var17 = OPos * 15
GetYDistFloorOffset var17 var17 10 1
if var17 < 0 && !(Equal var16 4)
  var16 = 4
endif

if var1 < var3 && !(Equal var16 5)
  if Equal var16 1
    AbsStick OPos
  elif Equal var16 2 || Equal var16 3 || Equal var16 6
    if DistFrontEdge < 15
      var16 = 1
      AbsStick OPos
      Return
    endif
    var22 = OPos * -1
    AbsStick var22

    if Equal var16 6
      predictAverage var22 10
      if XDistLE var22
        Return
      endif
    elif Equal var16 3
  var22 = 0.004
  XGoto GetChrSpecific
  //= XReciever
      Seek execution
      if var22 >= 10
        var21 = 16.4
        var15 = -1
        if Equal CurrAction 4
          var16 = 5
          CallI Wavedash
        endif
        CallI MainHub
      endif
    endif
  elif Equal var16 4
    var22 = TopNX * -1
    AbsStick var22
  endif
elif Equal var16 5
  AbsStick OPos
  if !(Equal var2 OPos)
    if CHANCE_MUL_LE PT_AGGRESSION 0.7
      var21 = 16.4
      var15 = -1
    endif
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
