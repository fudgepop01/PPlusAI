#include <Definition_AIMain.h>
id 0x820A
unk 0x0

XReciever
label begin
XGoto PerFrameChecks
XReciever
Seek begin

if Equal CurrAction hex(0x73) || Equal CurrAction hex(0x74)
  Return
endif

if MeteoChance
  // stuff goes here
else
  Goto defensiveOptions
endif

if !(OutOfStage)
  Call MainHub
endif
Return
label defensiveOptions
immediateTempVar = (1 - (LevelValue / 100)) * 30 + 7
MOD immediateTempVar AnimFrame immediateTempVar
if Equal immediateTempVar 0 && !(Equal currGoal cg_defend)
  predictAverage immediateTempVar man_OXHitDist LevelValue
  immediateTempVar += 8
  if ODistLE immediateTempVar
    GetCommitPredictChance globTempVar LevelValue
    globTempVar *= 1.5
    immediateTempVar = (Rnd * 4) + 14 + (1 - LevelValue / 100) * 15
    if Rnd < globTempVar
      if ODistLE 25 && Rnd < 0.3
        Button A
      elif Rnd < 0.2
        Button R
      else
        Seek dropOptions
        Jump
      endif
      Return
    elif OAnimFrame >= immediateTempVar && OAttacking
      if ODistLE 25 && Rnd < 0.3
        Button A
      elif Rnd < 0.2
        Button R
      else
        Seek dropOptions
        Jump
      endif
      Return
    endif
  endif
endif

if Rnd <= 0.1
  if Rnd < 0.3
    if ODistLE 25 && Rnd < 0.3
      Button A
    elif Rnd < 0.2
      Button R
    else
      Seek dropOptions
      Jump
    endif
  else 
    // Seek OffensiveGetup
  endif
endif
Return
label dropOptions
if Rnd <= 0.35
  Seek ledgeRefresh
  Jump
elif Rnd <= 0.3
  Seek ledgeDash
  Jump
else
  Seek mikuDash
  Jump
endif
Return
//----------- DROP OPTIONS -----------//
label ledgeRefresh
#let grabbed = var0
grabbed = 0
label lrExec
XGoto PerFrameChecks
XReciever
Seek lrExec
immediateTempVar = grabbed
Goto edgeGrabCheck
if Equal immediateTempVar 0 && Equal grabbed 1
  Return
endif

immediateTempVar = djumpHeight + HurtboxSize
if YDistBackEdge >= immediateTempVar
  Button X
endif
Return
label ledgeDash
#let grabbed = var0
grabbed = 0
label ldExec
XGoto PerFrameChecks
XReciever
Seek ldExec
immediateTempVar = grabbed
Goto edgeGrabCheck
if Equal immediateTempVar 0 && Equal grabbed 1
  Return
endif

immediateTempVar = djumpHeight - HurtboxSize - 8
if YDistBackEdge >= immediateTempVar
  Button X
  Return
endif
if Equal CurrAction hex(0xC) || Equal CurrAction hex(0xD)
  Stick 1
endif
immediateTempVar = HurtboxSize * -0.5
if YDistBackEdge < immediateTempVar
  ClearStick
  Button R
  Stick 1 (-1)
  CallI MainHub
endif
Return 
label mikuDash
#let grabbed = var0
grabbed = 0
label mdExec
XGoto PerFrameChecks
XReciever
Seek mdExec
immediateTempVar = grabbed
Goto edgeGrabCheck
if Equal immediateTempVar 0 && Equal grabbed 1
  Return
endif

immediateTempVar = djumpHeight - HurtboxSize + 1
if YDistBackEdge >= immediateTempVar
  Button X
  Return
endif
if Equal CurrAction hex(0xC) || Equal CurrAction hex(0xD)
  Stick 1
endif
immediateTempVar = HurtboxSize * -1
if YDistBackEdge > immediateTempVar && !(OutOfStage) && XDistBackEdge < -5
  ClearStick
  Button R
  Stick (-1) (-1)
endif
Return
label edgeGrabCheck
if CurrAction >= hex(0x73) && CurrAction <= hex(0x75)
  if Equal grabbed 0
    if Rnd <= 0.5
      Stick 0 (-1)
    else
      Stick -1
    endif
  else
    Seek begin
  endif
  Return
else
  grabbed = 1
endif
Return
//----------- OFFENSIVE GETUP OPTIONS -----------//
Return
Return