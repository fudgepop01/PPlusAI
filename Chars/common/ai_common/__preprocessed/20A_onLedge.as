#include <Definition_AIMain.h>
id 0x820A
unk 0x0

XReciever
var21 = 15
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

Goto stageCheck
Return
label defensiveOptions
var22 = (1 - (LevelValue / 100)) * 30 + 7
MOD var22 AnimFrame var22
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

if Rnd <= 0.8
  if Rnd < 0.5
    if ODistLE 35 && Rnd < 0.3
      Button A
    elif Rnd < 0.4
      Button R
    else
      Seek dropOptions
      Jump
    endif
  else 
    Seek OffensiveGetup
  endif
endif
Return
label dropOptions
if Rnd <= 0.0
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
Goto stageCheck
Goto edgeGrabCheck
if Equal var22 0 && Equal var0 1
  Return
endif

  var10 = 15
  XGoto GetChrSpecific
  XReciever
  var1 = var10
  Seek lrExec
var22 = var1 + HurtboxSize
if YDistBackEdge >= var22
  Button X
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
Goto stageCheck
if Equal var22 0 && Equal var0 1
  Return
endif

  var10 = 15
  XGoto GetChrSpecific
  XReciever
  var1 = var10
  Seek mdExec
var22 = var1 - HurtboxSize + 1
if YDistBackEdge >= var22
  Button X
  Return
endif
if Equal CurrAction 12 || Equal CurrAction 13
  Stick 1
endif

GetYDistFloorAbsPos var22 TopNX TopNY
if Equal var22 -1 && XDistBackEdge < -2
  GetYDistFloorAbsPos var22 TopNX SCDBottom
  if !(Equal var22 -1) 
    ClearStick
    Button R
    Stick (-1) (-1)
  endif
endif
Return
label edgeGrabCheck
if CurrAction >= 115 && CurrAction <= 117
  if Equal var0 0
    if Rnd <= 0.3
      Stick 0 (-1)
    elif Rnd <= 0.7
      Stick -1
    else
      ClearStick
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
label OffensiveGetup
Seek ledgeDash
Jump
Return
label ledgeDash
XGoto PerFrameChecks
XReciever
Seek ledgeDash
Goto stageCheck
if Equal CurrAction 14 && Rnd <= 0.85
  Button X
  Stick 1
elif Equal AirGroundState 1
  var21 = 16
  var15 = -1
  CallI MainHub
elif YSpeed > 0 || Equal IsOnStage 1
  var17 = TopNX + 5 * Direction
  GetYDistFloorAbsPos var22 var17 TopNY
  if Equal var22 -1 && XDistBackEdge < -2
    GetYDistFloorAbsPos var22 var17 SCDBottom
    if !(Equal var22 -1) 
      ClearStick
      Button R
      Stick 1 -0.65
    endif
  endif
elif CurrAction >= 115 && CurrAction <= 117
  if Rnd <= 0.3
    Stick 0 (-1)
  elif Rnd <= 0.7
    Stick -1
  else
    ClearStick
  endif
endif
Return
label stageCheck
if Equal IsOnStage 1 && CurrAction <= 9 && AnimFrame >= 8
  Call MainHub
endif
Return
Return
