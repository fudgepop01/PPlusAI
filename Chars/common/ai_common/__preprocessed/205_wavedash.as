#include <Definition_AIMain.h>
id 0x8205
unk 0x0

//= XReciever
// less perfect for lower levels
label setup
  XGoto PerFrameChecks
  //= XReciever
  Seek setup
  var0 = LevelValue / 100
  var0 = 1 - var0
  var0 *= Rnd * 4
  if Equal AirGroundState 2
    if YDistFloor > 15
      CallI MainHub
    endif
    Seek landing
    Jump
  endif
  if CurrAction >= 26 && CurrAction <= 29
  elif True
  var22 = 300
  XGoto GetChrSpecific
  Seek setup
  if Equal var22 0 
    Return
  endif
  endif
label jumpSquat
  XGoto PerFrameChecks
  //= XReciever
  Seek jumpSquat
  if LastJumpSquatFrame
    Seek landing
    Jump
  elif NoJumpPrevFrame && !(Equal CurrAction 10) 
    Button X
  endif
  Return
label landing
  XGoto PerFrameChecks
  //= XReciever
  if !(Equal var16 5)
    Goto edgeCheck
  endif
  Seek landing
  
  if var0 <= 0 || YSpeed < 0
    Button R
    if YDistFloor < 0
      var17 = TopNX * -1
      AbsStick var17 (-0.3)
    elif Equal var16 4
      Stick var23 (-0.65)
    elif Equal var16 1
      AbsStick OPos (-0.5)
    elif Equal var16 2
      var22 = OPos * -1
      AbsStick var22 (-0.5)
    elif Equal var16 5
  var22 = 16
  XGoto GetChrSpecific
  //= XReciever
var17 = var22
      var22 = var13 - TopNX
      var23 = 1 / var17
      var22 *= var23
      var17 = var22
      Abs var17
      var17 = 1 - var22
      if var17 > -0.3
        var17 = -0.3
      endif
      AbsStick var22 var17
    else
      AbsStick 0 (-1)
    endif
    if var15 > 0
      var15 = -10
    endif
    Call MainHub
  endif
  var0 -= 1
Return
label edgeCheck
var23 = 0
var22 = 8 * YDistFloor + 10
if DistBackEdge > var22
  var23 = -1
elif DistFrontEdge > var22
  var23 = 1
endif
if DistBackEdge < var22 || DistFrontEdge < var22
  var16 = 4
endif
Return
Return

