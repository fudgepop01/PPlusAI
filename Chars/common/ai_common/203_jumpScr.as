#include <Definition_AIMain.h>
id 0x8203
unk 0x0

XReciever


label setup
XGoto PerFrameChecks
XReciever
Seek setup

if CurrAction >= hex(0x1A) && CurrAction <= hex(0x1D)
elif True
  ACTIONABLE_ON_GROUND
endif

#let savedOPos = var0
savedOPos = OPos
#let shouldFullHop = var1
shouldFullHop = 0
OR globTempVar scriptVariant scriptVariant
shouldFullHop = scriptVariant - globTempVar
if !(Equal shouldFullHop 0)
  shouldFullHop = 1
  scriptVariant -= svp_jump_fullhop
  OR scriptVariant scriptVariant scriptVariant
else
  shouldFullHop = 0
endif
PRINTLN
label jumpCommand
Button X
if CurrAction >= hex(0x1A) && CurrAction <= hex(0x1D)
  Return
endif
label locomotion
XGoto PerFrameChecks
XReciever
if Equal shouldFullHop 1 && Equal AirGroundState 1
  Seek jumpCommand
else
  Seek locomotion
endif

if Equal CurrSubaction JumpSquat
  Button X
endif
if Equal scriptVariant sv_jump_over
  if Equal AirGroundState 1
    Return
  endif
  AbsStick savedOPos
  if !(Equal savedOPos OPos) || YSpeed < 0
    CallI MainHub
  endif
elif Equal scriptVariant sv_jump_neutral
  if Equal AirGroundState 2
    CallI MainHub
  endif
elif Equal scriptVariant sv_jump_away
  immediateTempVar = OPos * -1
  globTempVar = immediateTempVar * 25
  GetYDistFloorOffset globTempVar globTempVar 0 0
  if Equal globTempVar -1
    if Rnd < 0.35
      scriptVariant = sv_jump_over
    else
      scriptVariant = sv_jump_neutral
    endif
    Return
  endif
  AbsStick immediateTempVar
  if YSpeed < 0 && Equal AirGroundState 2
    CallI MainHub
  endif
else
  CallI MainHub
endif
Return
Return