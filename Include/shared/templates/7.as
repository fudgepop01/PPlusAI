// OOS HUB
// controls OOS options
#include <Definition_AIMain.h>
id 0x8007

unk 0x0

#let tempVar = var0
#let grabOOS = var1
#let grabRange = var2
grabOOS = 0
if LevelValue >= LV7
  grabRange = grab_xOffset + grab_xRange
elif LevelValue >= LV3
  grabRange = 40
else
  grabRange = 0 // will not grab OOS
endif
label

if Equal grabOOS 1 && XDistLE 15 && Rnd < 0.7
  Button R
  if Equal CurrAction hex(0x1B)
    Button A|R
    movePart = 1
    Call Grab
  endif
  Return
elif Equal grabOOS 1 || Rnd < 0.2
  Button R
  if Equal CurrAction hex(0x1B)
    globTempVar = Rnd * 4
    if globTempVar < 1
      Button X
      Seek jumpHandler
      Return
    elif globTempVar < 2
      AbsStick OPos
    elif globTempVar < 3
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
if immediateTempVar < 25 && Equal IsOnStage 1 && Rnd < 0.2
  Button R
  globTempVar *= -1
  AbsStick globTempVar
  Return
endif

if Equal CurrAction hex(0x1D)
  if Equal OPos Direction && XDistLE 15 && Rnd < 0.3 && AnimFrame > 3
    grabOOS = 1
  endif
  tempVar = OPos * 0.6 * -1
  Stick tempVar
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
#let absOXSpeed = var0
#let OTowardsOrAway = var1
absOXSpeed = OXSpeed
Abs absOXSpeed
OTowardsOrAway = OXSpeed * OPos
if SamePlane && OTowardsOrAway < 0 && absOXSpeed > 0.2
  {OFFENSIVE_OPTIONS}
elif Rnd < 0.3
  {OFFENSIVE_OPTIONS}
endif

if InAir
  if Equal OPos Direction
    if XDistBackEdge < -shortEdgeRange
      globTempVar = OPos * -1
      AbsStick globTempVar (-1)
    endif
  elif XDistFrontEdge > shortEdgeRange
    globTempVar = OPos * -1
    AbsStick globTempVar (-1)
  else
    AbsStick 0 (-1)
  endif

  Button R
  Call AIHub
endif
Return
Return