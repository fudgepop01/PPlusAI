#include <Definition_AIMain.h>
id 0x8205
unk 0x0

XReciever
// less perfect for lower levels
label setup
  var0 = LevelValue / 100
  var0 = 1 - var0
  var0 *= Rnd * 4
  if Equal AirGroundState 2
    if YDistBackEdge < -5
      CallI MainHub
    endif
    Seek landing
  endif
  if Equal CurrAction 22 
    if Equal PrevAction 33
      Return
    elif AnimFrame <= 3
      Return
    endif
  elif CurrAction >= 24
    Return
  endif
  Button X
  Seek
  Return
label jumpSquat
  if Equal AirGroundState 2
    Seek 
  endif
  Return
label landing
  Seek landing
  XGoto PerFrameChecks
  XReciever

  if var0 <= 0
    Button R
    if Equal var16 1
      if XDistFrontEdge < 3
        Seek
        Jump
      endif
      AbsStick OPos (-1)
    elif Equal var16 2
      if XDistBackEdge > -3
        Seek
        Jump
      endif
      var22 = OPos * -1
      AbsStick var22 (-1)
    else
      label
      AbsStick 0 (-1)
    endif 
    Call MainHub
  endif
  var0 -= 1
Return
Return