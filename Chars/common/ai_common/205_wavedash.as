#include <Definition_AIMain.h>
id 0x8205
unk 0x0

//= XReciever
// less perfect for lower levels
label setup
  XGoto PerFrameChecks
  //= XReciever
  Seek setup
  #let airTime = var0
  airTime = LevelValue / 100
  airTime = 1 - airTime
  airTime *= Rnd * 4
  if Equal AirGroundState 2
    if YDistFloor > 15
      CallI MainHub
    endif
    Seek landing
  endif
  if CurrAction >= hex(0x1A) && CurrAction <= hex(0x1D)
  elif True
    ACTIONABLE_ON_GROUND
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
      AbsStick OPos (-1)
    elif Equal scriptVariant sv_wavedash_out
      immediateTempVar = OPos * -1
      AbsStick immediateTempVar (-1)
    elif Equal scriptVariant sv_wavedash_goal
      GET_CHAR_TRAIT(globTempVar, chr_cs_wavedashDist)
      immediateTempVar = goalX - TopNX
      globTempVar = 1 / globTempVar
      immediateTempVar *= globTempVar
      globTempVar = immediateTempVar
      Abs globTempVar
      globTempVar = 1 - immediateTempVar
      if globTempVar > -0.45
        globTempVar = -0.45
      endif
      AbsStick immediateTempVar globTempVar
    else
      label
      ClearStick
      AbsStick 0 (-1)
    endif
    skipMainInit = mainInitSkip
    Call MainHub
  endif
  airTime -= 1
Return
label edgeCheck
if XDistFrontEdge < 3
  scriptVariant = sv_wavedash_awayFromLedge
elif XDistBackEdge > -3
  scriptVariant = sv_wavedash_awayFromLedge
endif
Return
Return