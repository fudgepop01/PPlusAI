// OOS HUB
// controls OOS options
#include <Definition_AIMain.h>
id 0x8007

unk 0x0

predictOOption var17 11 LevelValue
predictionConfidence var22 11 LevelValue
if Equal var17 3
  var3 = 7
  if var22 >= 0.5
    var3 = 14
  elif var22 >= 0.8
    var3 = 20
  endif
endif

var1 = 0
if LevelValue >= 60
  var2 = -0.75 + 5
elif LevelValue >= 21
  var2 = 40
else
  var2 = 0 // will not grab OOS
endif
label
Cmd30
var21 = 32775

if OAttacking && OAnimFrame < 20 && XDistLE 50 || XDistLE 50 && var3 > 0
  Button R
endif
var3 -= 1

if Equal CurrAction 29
  if Equal OPos Direction && XDistLE 20 && Rnd < 0.8 && AnimFrame > 3
    var1 = 1
  endif
  if LevelValue >= 75 && Equal OPos Direction
    var0 = OPos
  else
    var0 = OPos * 0.6 * -1
  endif
  AbsStick var0
  Return
endif

if Equal var1 1 && XDistLE 20 && Equal OPos Direction
  Button R
  if Equal CurrAction 27
    Button A|R
    var18 = 1
    Call Grab
  endif
  Return
elif Equal var1 1 || Rnd <= 0.03
  Button R
  if Equal CurrAction 27
    var17 = Rnd * 100
    if var17 < 70
      Button X
      Seek jumpHandler
      Return
    elif var17 < 80 && XDistFrontEdge > 25
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
if var22 < 25 && Equal IsOnStage 1 && Rnd < 0.1
  Button R
  var17 *= -1
  AbsStick var17
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
var17 = OPos * 0.4
AbsStick var17
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
  if XDistBackEdge < -10
    var17 = OPos * -1
    AbsStick var17 (-1)
  elif XDistFrontEdge > 10 && Rnd < 0.4
    AbsStick OPos (-1)
  else
    AbsStick 0 (-1)
  endif

  Button R
  Call AIHub
endif
Return
Return
