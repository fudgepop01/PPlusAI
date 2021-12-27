#include <Definition_AIMain.h>
id 0x8205
unk 0x0

XReciever
// less perfect for lower levels
label setup
  XGoto PerFrameChecks
  XReciever
  Seek setup
  #let airTime = var0
  airTime = LevelValue / 100
  airTime = 1 - airTime
  airTime *= Rnd * 4
  if Equal AirGroundState 2
    if YDistBackEdge < -15
      CallI MainHub
    endif
    Seek landing
  endif
  ACTIONABLE_ON_GROUND
  Button X
  Seek
  Return
label jumpSquat
  XGoto PerFrameChecks
  XReciever
  Seek jumpSquat
  if Equal AirGroundState 2
    Seek 
    Jump
  endif
  Return
label landing
  XGoto PerFrameChecks
  XReciever
  Seek landing

  if airTime <= 0 || YSpeed < 0
    Button R
    if Equal XDistBackEdge XDistFrontEdge
      globTempVar = TopNX * -1
      AbsStick globTempVar (-0.4)
    elif Equal scriptVariant sv_wavedash_awayFromLedge
      globTempVar = XDistBackEdge
      Abs globTempVar
      if XDistFrontEdge > globTempVar
        Stick 1 (-1)
      else
        Stick (-1) (-1)
      endif
    elif Equal scriptVariant sv_wavedash_in
      if XDistFrontEdge < 3
        Seek
        Jump
      elif XDistBackEdge > -3
        Seek
        Jump
      endif
      AbsStick OPos (-1)
    elif Equal scriptVariant sv_wavedash_out
      if XDistFrontEdge < 3
        Seek
        Jump
      elif XDistBackEdge > -3
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