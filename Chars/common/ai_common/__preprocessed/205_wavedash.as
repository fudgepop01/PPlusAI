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
  endif
  if CurrAction >= 26 && CurrAction <= 29
  elif True
  var22 = 300
  XGoto GetChrSpecific
  if Equal var22 0 
    Return
  endif
  endif  
  Button X
  Seek
  Return
label jumpSquat
  XGoto PerFrameChecks
  //= XReciever
  Seek jumpSquat
  if Equal AirGroundState 2
    Seek 
    Jump
  endif
  Return
label landing
  XGoto PerFrameChecks
  //= XReciever
  Goto edgeCheck
  Seek landing

  if var0 <= 0 || YSpeed < 0
    Button R
    if Equal XDistBackEdge XDistFrontEdge
      var17 = TopNX * -1
      AbsStick var17 (-0.4)
    elif Equal var16 4
      var17 = XDistBackEdge
      Abs var17
      if XDistFrontEdge > var17
        Stick 1 (-1)
      else
        Stick (-1) (-1)
      endif
    elif Equal var16 1
      AbsStick OPos (-1)
    elif Equal var16 2
      var22 = OPos * -1
      AbsStick var22 (-1)
    elif Equal var16 5
  var22 = 16
  XGoto GetChrSpecific
  //= XReciever
var17 = var22
      var22 = var13 - TopNX
      var17 = 1 / var17
      var22 *= var17
      var17 = var22
      Abs var17
      var17 = 1 - var22
      if var17 > -0.45
        var17 = -0.45
      endif
      AbsStick var22 var17
    else
      label
      ClearStick
      AbsStick 0 (-1)
    endif
    var15 = -1
    Call MainHub
  endif
  var0 -= 1
Return
label edgeCheck
if XDistFrontEdge < 3
  var16 = 4
elif XDistBackEdge > -3
  var16 = 4
endif
Return
Return
