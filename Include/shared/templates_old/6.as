// NEUTRAL HUB
// controls pathing when in "neutral"
#include <Definition_AIMain.h>
id 0x8006

unk 0x0

Cmd30
// if InAir && Equal IsOnStage 1
//   Call AIHub
// endif

if InAir
  Call AIHub
endif

DEFEND_FROM_O
TRACK_O_OPTIONS

predictAverage immediateTempVar man_oXHitDist LevelValue
immediateTempVar += 15
if XDistLE immediateTempVar
  Norm immediateTempVar TopNX TopNY
  Norm globTempVar OTopNX OTopNY
  if Equal AirGroundState 1
    if Equal approachType at_defend
      #let timer = var0
      timer = 20 + Rnd * 30
      Seek _defend
      Jump
    elif XDistBackEdge < -edgeRange && Rnd < 0.5
      #let timer = var0
      timer = 5 + Rnd * 10
      label
      globTempVar = OPos * -1
      AbsStick globTempVar
      timer -= 1
      if timer < 0
        Call AIHub
      endif
    elif Rnd < 0.4
      #let timer = var0
      timer = 5 + Rnd * 10
      Button X
      label
      ClearStick
      timer -= 1
      if timer < 0
        Call AIHub
      endif
    elif Rnd < 0.2
      label
      Button X
      AbsStick OPos
    elif Rnd < 0.6
      label
      Call FakeOutHub
    else
      #let timer = var0
      timer = 10 + Rnd * 20
      label _defend
      Button R
      timer -= 1
      globTempVar = OPos * 0.5
      immediateTempVar = OTopNY - TopNY
      immediateTempVar *= 0.5
      AbsStick globTempVar immediateTempVar

      if timer <= 0 || Equal CurrAction hex(0x1D) || !(XDistLE 40)
        Call OOSHub
      endif
      Return
    endif
  endif

  Goto trackOMoves

  if Rnd < 0.05 || XDistFrontEdge < edgeRange || XDistBackEdge > -edgeRange || Equal AirGroundState 2
    Call AIHub
  endif
else
  Call AIHub
endif

if Equal CurrAction hex(0x01)
  ClearStick
endif
Return

label trackOMoves
  if ODistLE 45 && Equal OAnimFrame 5
    if OCurrAction >= hex(0x1A) && OCurrAction <= hex(0x21) && Rnd < 0.7
      trackOAction man_defend op_defend
    elif OCurrAction >= hex(0x34) && OCurrAction <= hex(0x38) && Rnd < 0.7
      trackOAction man_defend op_grab
    elif OAttacking && Rnd < 0.7
      trackOAction man_defend op_attack
    elif Rnd < 0.1
      trackOAction man_defend op_null
    endif

    predictOOption globTempVar man_defend LevelValue
    predictionConfidence immediateTempVar man_defend LevelValue

    if Equal globTempVar op_attack && Rnd < immediateTempVar
      Call AIHub
    elif Equal globTempVar op_defend && Rnd < immediateTempVar
      movePart = 0
      lastScript = hex(0x8002)
      Call Grab
    elif Equal globTempVar op_grab && Rnd < immediateTempVar
      Call AIHub
    endif
  endif 
Return

Return
Return