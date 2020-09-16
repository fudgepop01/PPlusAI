// OOS HUB
// controls OOS options
#include <Definition_AIMain.h>
id 0x8007

unk 0x0

var1 = 0
if LevelValue >= 60
  var2 = 17
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
  LOGVAL AnimFrame
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
if SamePlane && var1 < 0 && var0 > 0.4
  if XDistLE 20
    Call DAir
  elif !(Equal OPos Direction) && XDistLE 40
    Call BAir
  elif XDistLE 40
    Call NAir
  endif
endif

if InAir
  if var1 < 0 && XDistFrontEdge > 15
    Stick 1 (-1)
  elif var1 > 0 && XDistBackEdge < -8
    Stick (-1) (-1)
  else
    Stick 0 (-1)
  endif
  Button R
  Call AIHub
endif
Return
Return
