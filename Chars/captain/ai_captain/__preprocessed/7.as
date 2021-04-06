// OOS HUB
// controls OOS options
#include <Definition_AIMain.h>
id 0x8007

unk 0x0

var1 = 0
if LevelValue >= 60
  var2 = -0.5 + 5.5
elif LevelValue >= 21
  var2 = 40
else
  var2 = 0 // will not grab OOS
endif
label
Cmd30

if Equal var1 1 && XDistLE 15 && Rnd < 0.5
  Button R
  if Equal CurrAction 27
    Button A|R
    var18 = 1
    Call Grab
  endif
  Return
elif Equal var1 1 || Rnd < 0.04
  Button R
  if Equal CurrAction 27
    var17 = Rnd * 100
    if var17 < 70
      Button X
      Seek jumpHandler
      Return
    elif var17 < 80
      AbsStick OPos
    elif var17 < 90
      var17 = OPos * -1
      AbsStick var17
    else
      AbsStick 0 (-1)
    endif
    Call AIHub
  endif
  Return
endif

  GetNearestCliff var17
  var17 = TopNX - var17
  var17 *= -1
  var22 *= -1
  var22 = var22 - (TopNY * -1)
var22 = var17
Abs var22
if var22 < 25 && Equal IsOnStage 1 && Rnd < 0.05
  Button R
  var17 *= -1
  AbsStick var17
  Return
endif

if Equal CurrAction 29
  if Equal OPos Direction && XDistLE 15 && Rnd < 0.3 && AnimFrame > 3
    var1 = 1
  endif
  var0 = OPos * 0.6 * -1
  Stick var0
  Return
endif
if Equal CurrAction 28
  Button X
  Seek jumpHandler
  Return
endif

if CurrAction <= 32
  Call AIHub
endif
Return

label jumpHandler
Cmd30
var0 = OXSpeed
Abs var0
var1 = OXSpeed * OPos
if SamePlane && var1 < 0 && var0 > 0.2 && InAir
  var18 = 1
  if XDistLE 40
    Call DAir
  elif !(Equal OPos Direction) && XDistLE 60
    Call BAir
  elif XDistLE 60
    Call NAir
  endif
elif Rnd < 0.4 && InAir
  var18 = 1
  if XDistLE 40
    Call DAir
  elif !(Equal OPos Direction) && XDistLE 60
    Call BAir
  elif XDistLE 60
    Call NAir
  endif
endif

if InAir
  if Equal OPos Direction
    if XDistBackEdge < -10
      var17 = OPos * -1
      AbsStick var17 (-1)
    endif
  elif XDistFrontEdge > 10
    var17 = OPos * -1
    AbsStick var17 (-1)
  else
    AbsStick 0 (-1)
  endif

  Button R
  Call AIHub
endif
Return
Return
