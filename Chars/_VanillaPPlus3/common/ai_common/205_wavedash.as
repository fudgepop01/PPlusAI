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
    Jump
  endif
  if CurrAction >= hex(0x1A) && CurrAction <= hex(0x1D)
  elif True
    ACTIONABLE_ON_GROUND(setup)
  endif
label jumpSquat
  XGoto PerFrameChecks
  //= XReciever
  Seek jumpSquat
  if LastJumpSquatFrame
    Seek landing
    Jump
  elif NoJumpPrevFrame && !(Equal CurrAction hex(0xA)) 
    Button X
  endif
  Return
label landing
  XGoto PerFrameChecks
  //= XReciever
  if !(Equal scriptVariant sv_wavedash_goal)
    Goto edgeCheck
  endif
  Seek landing
  
  if airTime <= 0 || YSpeed < 0
    Button R
    if YDistFloor < 0
      globTempVar = TopNX * -1
      AbsStick globTempVar (-0.3)
    elif Equal scriptVariant sv_wavedash_awayFromLedge
      Stick anotherTempVar (-0.65)
    elif Equal scriptVariant sv_wavedash_in
      AbsStick OPos (-0.5)
    elif Equal scriptVariant sv_wavedash_out
      immediateTempVar = OPos * -1
      AbsStick immediateTempVar (-0.5)
    elif Equal scriptVariant sv_wavedash_goal
      GET_CHAR_TRAIT(globTempVar, chr_cs_wavedashDist)
      immediateTempVar = goalX - TopNX
      anotherTempVar = 1 / globTempVar
      immediateTempVar *= anotherTempVar
      globTempVar = immediateTempVar
      Abs globTempVar
      globTempVar = 1 - immediateTempVar
      if globTempVar > -0.3
        globTempVar = -0.3
      endif
      AbsStick immediateTempVar globTempVar
    else
      AbsStick 0 (-1)
    endif
    if skipMainInit > 0
      skipMainInit = mainInitSkip
    endif
    Call MainHub
  endif
  airTime -= 1
Return
label edgeCheck
anotherTempVar = 0
immediateTempVar = 8 * YDistFloor + 10
if DistBackEdge > immediateTempVar
  anotherTempVar = -1
elif DistFrontEdge > immediateTempVar
  anotherTempVar = 1
endif
if DistBackEdge < immediateTempVar || DistFrontEdge < immediateTempVar
  scriptVariant = sv_wavedash_awayFromLedge
endif
Return
Return
