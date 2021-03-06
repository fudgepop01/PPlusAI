// OOS HUB
// controls OOS options
#include <Definition_AIMain.h>
id 0x8007

unk 0x0

var1 = 0
if LevelValue >= 60
  var2 = 0 + 0
elif LevelValue >= 21
  var2 = 40
else
  var2 = 0 // will not grab OOS
endif
label

if Equal var1 1 && XDistLE 15 && Rnd < 0.7
  Button R
  if Equal CurrAction 27
    Button A|R
    var18 = 1
    Call Grab
  endif
  Return
elif Equal var1 1 || Rnd < 0.2
  Button R
  if Equal CurrAction 27
    var17 = Rnd * 4
    if var17 < 1
      Button X
      Seek jumpHandler
      Return
    elif var17 < 2
      AbsStick OPos
    elif var17 < 3
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
if var22 < 25 && Equal IsOnStage 1 && Rnd < 0.2
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
var0 = OXSpeed
Abs var0
var1 = OXSpeed * OPos
if SamePlane && var1 < 0 && var0 > 0.2
//   {OFFENSIVE_OPTIONS}
elif Rnd < 0.3
//   {OFFENSIVE_OPTIONS}
endif

if InAir
  if Equal OPos Direction
    if XDistBackEdge < -9999.9999
      var17 = OPos * -1
      AbsStick var17 (-1)
    endif
  elif XDistFrontEdge > 9999.9999
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
