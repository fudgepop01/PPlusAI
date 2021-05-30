// OOS HUB
// controls OOS options
#include <Definition_AIMain.h>
id 0x8007

unk 0x0

#let tempVar = var0
#let grabOOS = var1
#let grabRange = var2
#let timer = var3
predictOOption globTempVar man_shield LevelValue
predictionConfidence immediateTempVar man_shield LevelValue
if Equal globTempVar op_attack
  timer = 7
  if immediateTempVar >= 0.5
    timer = 14
  elif immediateTempVar >= 0.8
    timer = 20
  endif
endif

grabOOS = 0
if LevelValue >= LV7
  grabRange = grab_xOffset + grab_xRange
elif LevelValue >= LV3
  grabRange = 40
else
  grabRange = 0 // will not grab OOS
endif
label
Cmd30
lastScript = hex(0x8007)

if OAttacking && OAnimFrame < 20 && XDistLE 50 || XDistLE 50 && timer > 0
  Button R
endif
timer -= 1

if Equal CurrAction hex(0x1D)
  if Equal OPos Direction && XDistLE 20 && Rnd < 0.8 && AnimFrame > 3
    grabOOS = 1
  endif
  if LevelValue >= LV8 && Equal OPos Direction
    tempVar = OPos
  else
    tempVar = OPos * 0.6 * -1
  endif
  AbsStick tempVar
  Return
endif

if Equal grabOOS 1 && XDistLE 20 && Equal OPos Direction
  Button R
  if Equal CurrAction hex(0x1B)
    Button A|R
    movePart = 1
    Call Grab
  endif
  Return
elif Equal grabOOS 1 || Rnd <= 0.03
  Button R
  if Equal CurrAction hex(0x1B)
    globTempVar = Rnd * 100
    if globTempVar < 70
      Button X
      Seek jumpHandler
      Return
    elif globTempVar < 80 && XDistFrontEdge > edgeRange
      AbsStick OPos
    elif globTempVar < 90
      globTempVar = OPos * -1
      AbsStick globTempVar
    else
      AbsStick 0 (-1)
    endif
    Call AIHub
  endif
  Return
endif

NEAREST_CLIFF(globTempVar, immediateTempVar)
immediateTempVar = globTempVar
Abs immediateTempVar
if immediateTempVar < 25 && Equal IsOnStage 1 && Rnd < 0.1
  Button R
  globTempVar *= -1
  AbsStick globTempVar
  Return
endif

if Equal CurrAction hex(0x1C)
  Button X
  Seek jumpHandler
  Return
endif

if CurrAction <= hex(0x20)
  Call AIHub
endif
Return

label jumpHandler
Cmd30
#let absOXSpeed = var0
#let OTowardsOrAway = var1
absOXSpeed = OXSpeed
Abs absOXSpeed
globTempVar = OPos * 0.4
AbsStick globTempVar
OTowardsOrAway = OXSpeed * OPos
if SamePlane && OTowardsOrAway < 0 && absOXSpeed > 0.2 && InAir
  {OFFENSIVE_OPTIONS}
elif Rnd < 0.4 && InAir
  {OFFENSIVE_OPTIONS}
endif

if InAir
  if XDistBackEdge < -shortEdgeRange
    globTempVar = OPos * -1
    AbsStick globTempVar (-1)
  elif XDistFrontEdge > shortEdgeRange && Rnd < 0.4
    AbsStick OPos (-1)
  else
    AbsStick 0 (-1)
  endif

  Button R
  Call AIHub
endif
Return
Return