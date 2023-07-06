#include <Definition_AIMain.h>
id 0x8205
unk 0x0

XReciever
// less perfect for lower levels
label setup
  #let airTime = var0
  airTime = LevelValue / 100
  airTime = 1 - airTime
  airTime *= Rnd * 4
  if Equal AirGroundState 2
    if YDistBackEdge < -5
      CallI MainHub
    endif
    Seek landing
  endif
  ACTIONABLE_ON_GROUND
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

  if airTime <= 0
    Button R
    if Equal scriptVariant sv_wavedash_in
      if XDistFrontEdge < 3
        Seek
        Jump
      endif
      AbsStick OPos (-1)
    elif Equal scriptVariant sv_wavedash_out
      if XDistBackEdge > -3
        Seek
        Jump
      endif
      immediateTempVar = OPos * -1
      AbsStick immediateTempVar (-1)
    else
      label
      AbsStick 0 (-1)
    endif 
    Call MainHub
  endif
  airTime -= 1
Return
Return