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
  grabRange = 17
elif LevelValue >= LV3
  grabRange = 40
else
  grabRange = 0 // will not grab OOS
endif
label

if Equal grabOOS 1 && XDistLE 15
  Button R
  if Equal CurrAction hex(0x1B)
    Button A|R
    movePart = 1
    Call Grab
  endif
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
  if XDistLE 20
    Call DAir
  elif !(Equal OPos Direction) && XDistLE 40
    Call BAir
  elif XDistLE 40
    Call NAir
  endif
elif Rnd < 0.3
  if XDistLE 20
    Call DAir
  elif !(Equal OPos Direction) && XDistLE 40
    Call BAir
  elif XDistLE 40
    Call NAir
  endif
endif

if InAir
  if Equal OPos Direction
    if XDistBackEdge < -15
      globTempVar = OPos * -1
      AbsStick globTempVar (-1)
    endif
  elif XDistFrontEdge > 15
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