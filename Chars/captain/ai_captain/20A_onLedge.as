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

if Rnd <= 0.2
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
    Seek OffensiveGetup
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

#let djumpHeight = var1
GET_CHAR_TRAIT_SEEK(djumpHeight, chr_pt_djumpHeight, lrExec)
immediateTempVar = djumpHeight
if YDistBackEdge >= immediateTempVar
  Button X
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

#let djumpHeight = var1
GET_CHAR_TRAIT_SEEK(djumpHeight, chr_pt_djumpHeight, lrExec)
immediateTempVar = djumpHeight + 1
if YDistBackEdge >= immediateTempVar
  Button X
  Return
endif
if Equal CurrAction hex(0xC) || Equal CurrAction hex(0xD)
  Stick 1
endif

GetYDistFloorAbsPos immediateTempVar TopNX TopNY
if Equal immediateTempVar -1 && XDistBackEdge < -2
  GetYDistFloorAbsPos immediateTempVar TopNX SCDBottom
  if !(Equal immediateTempVar -1) 
    ClearStick
    Button R
    Stick (-1) (-1)
  endif
endif
Return
label edgeGrabCheck
if CurrAction >= hex(0x73) && CurrAction <= hex(0x75)
  if Equal grabbed 0
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
  grabbed = 1
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
if Equal CurrAction hex(0xE) && Rnd <= 0.85
  Button X
  Stick 1
elif Equal AirGroundState 1
  currGoal = cg_attack
  skipMainInit = mainInitSkip
  CallI MainHub
elif YSpeed > 0 || Equal IsOnStage 1
  globTempVar = TopNX + 5 * Direction
  GetYDistFloorAbsPos immediateTempVar globTempVar TopNY
  if Equal immediateTempVar -1 && XDistBackEdge < -2
    GetYDistFloorAbsPos immediateTempVar globTempVar SCDBottom
    if !(Equal immediateTempVar -1) 
      ClearStick
      Button R
      Stick 1 -0.65
    endif
  endif
elif CurrAction >= hex(0x73) && CurrAction <= hex(0x75)
  if Rnd <= 0.3
    Stick 0 (-1)
  elif Rnd <= 0.7
    Stick -1
  else
    ClearStick
  endif
endif
Return
Return