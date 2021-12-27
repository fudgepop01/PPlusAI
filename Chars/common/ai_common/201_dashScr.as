#include <Definition_AIMain.h>
id 0x8201
unk 0x0

XReciever
label setup
#let timeLimit = var0
#let timePassed = var1
#let startOPos = var2
#let dashForceTurnFrame = var3
#let dashDanceMinFrames = var4
GET_CHAR_TRAIT(dashForceTurnFrame, chr_pt_dashForceTurnFrame)
GET_CHAR_TRAIT_SEEK(dashDanceMinFrames, chr_pt_dashDanceMinFrames, setup)

timePassed = 0

if Equal CurrAction hex(0x4) || Equal CurrAction hex(0x5)
  if Equal scriptVariant sv_dash_towards
    if Rnd < 0.2
      scriptVariant = sv_wavedash_neutral
    else
      scriptVariant = sv_wavedash_in
    endif
  elif Equal scriptVariant sv_dash_away
    scriptVariant = sv_wavedash_out 
  elif Equal scriptVariant sv_dash_toCenter
    scriptVariant = sv_wavedash_neutral
  endif
  CallI Wavedash
endif


timeLimit = dashForceTurnFrame * 2 - dashDanceMinFrames + Rnd * 20
timeLimit = Rnd * timeLimit + dashDanceMinFrames 
startOPos = OPos
if Equal scriptVariant sv_dash_away
  timeLimit += 3
  if timeLimit >= dashForceTurnFrame
    timeLimit = dashForceTurnFrame
  endif
endif
label execution
XGoto PerFrameChecks
XReciever
Seek execution

if XDistFrontEdge < 15
  Call MainHub
elif XDistBackEdge > -25
  scriptVariant = sv_dash_towards
endif

if timePassed < dashForceTurnFrame && !(Equal scriptVariant sv_dash_through)
  if Equal scriptVariant sv_dash_towards
    AbsStick OPos
  elif Equal scriptVariant sv_dash_away
    if XDistBackEdge > -20
      scriptVariant = sv_dash_through
      AbsStick OPos
      Return
    endif
    immediateTempVar = OPos * -1
    AbsStick immediateTempVar
  elif Equal scriptVariant sv_dash_toCenter
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  endif
elif Equal scriptVariant sv_dash_through
  if TopNX < 0 && OTopNX > 0
  elif TopNX > 0 && OTopNX < 0
  else
    immediateTempVar = OTopNX
    globTempVar = TopNX 
    Abs immediateTempVar
    Abs globTempVar
    if globTempVar < immediateTempVar && globTempVar > 20
      scriptVariant = sv_dash_toCenter
      AbsStick OPos
      Return
    endif
  endif

  AbsStick OPos
  if !(Equal startOPos OPos)
    Call MainHub
  endif
  Return
endif
timePassed += 1
if timePassed > timeLimit
  Call MainHub
endif
Return
Return