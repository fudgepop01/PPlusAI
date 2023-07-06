// OOS HUB
// controls OOS options
#include <Definition_AIMain.h>
id 0x8007

unk 0x0

var1 = 0
if LevelValue >= 60
  var2 = 1 + 3
elif LevelValue >= 21
  var2 = 40
else
  var2 = 0 // will not grab OOS
endif
label

if Equal var1 1 && XDistLE 15
  Button R
  if Equal CurrAction 27
    Button A|R
    var18 = 1
    Call Grab
  endif
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
