#include <Definition_AIMain.h>
id 0x820A
unk 0x0

XReciever
label begin
XGoto PerFrameChecks
XReciever
Seek begin

if Equal CurrAction 115 || Equal CurrAction 116
  Return
endif

if MeteoChance
  // stuff goes here
else
  Goto defensiveOptions
endif

if !(OutOfStage)
  CallI MainHub
endif
Return
label defensiveOptions
MOD var22 AnimFrame 7
if Equal var22 0 && !(Equal var21 13)
  predictAverage var22 10 LevelValue
  var22 += 8
  if ODistLE var22
    GetCommitPredictChance var17 LevelValue
    var17 *= 1.5
    var22 = (Rnd * 4) + 14 + (1 - LevelValue / 100) * 15
    if Rnd < var17
      if ODistLE 25 && Rnd < 0.3
        Button A
      elif Rnd < 0.2
        Button R
      else
        Seek dropOptions
        Jump
      endif
      Return
    elif OAnimFrame >= var22 && OAttacking
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
var0 = 0
label lrExec
XGoto PerFrameChecks
XReciever
Seek lrExec
var22 = var0
Goto edgeGrabCheck
if Equal var22 0 && Equal var0 1
  Return
endif

var22 = 25 + HurtboxSize
if YDistBackEdge >= var22
  Button X
endif
Return
label ledgeDash
var0 = 0
label ldExec
XGoto PerFrameChecks
XReciever
Seek ldExec
var22 = var0
Goto edgeGrabCheck
if Equal var22 0 && Equal var0 1
  Return
endif

var22 = 25 - HurtboxSize - 8
if YDistBackEdge >= var22
  Button X
  Return
endif
if Equal CurrAction 12 || Equal CurrAction 13
  Stick 1
endif
var22 = HurtboxSize * -0.5
if YDistBackEdge < var22
  ClearStick
  Button R
  Stick 1 (-1)
  CallI MainHub
endif
Return 
label mikuDash
var0 = 0
label mdExec
XGoto PerFrameChecks
XReciever
Seek mdExec
var22 = var0
Goto edgeGrabCheck
if Equal var22 0 && Equal var0 1
  Return
endif

var22 = 25 - HurtboxSize + 1
if YDistBackEdge >= var22
  Button X
  Return
endif
if Equal CurrAction 12 || Equal CurrAction 13
  Stick 1
endif
var22 = HurtboxSize * -1
if YDistBackEdge < var22 && !(OutOfStage)
  ClearStick
  Button R
  Stick (-1) (-1)
endif
Return
label edgeGrabCheck
if CurrAction >= 115 && CurrAction <= 117
  if Equal var0 0
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
  var0 = 1
endif
Return
//----------- OFFENSIVE GETUP OPTIONS -----------//
Return
Return
