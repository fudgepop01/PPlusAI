#include <Definition_AIMain.h>
//TrueID=0x603C
id 0x603C

//Set Unknown
unk 0x0

if CurrAction >= 52 && CurrAction <= 60
  Call 0x1120
endif

if Equal var18 0
  LOGSTR 1735549184 1644167168 0 0 0
  if Equal var19 1
    Goto techChase_wait
  else
    Goto seekOpponent
  endif
  Return
else
  if Equal CurrSubaction JumpSquat
    Button A|R
    Seek execute
  endif
  if !(Equal OPos Direction)
    Stick -0.8
    Return
  endif
  if Equal AirGroundState 1 && CurrAction <= 9
    Button X
  endif
endif
Return

label techChase_wait
SetTimeout 300
var0 = Rnd * 75 + 75
var1 = 0
label
if !(XDistLE 15)
  // walk-up
  var2 = OPos * 0.7
  AbsStick var2 (-0.4)
else
  // force crouch cancel
  Stick 0 (-1)
endif

  var5 = 0
  if Equal var6 96 || Equal var6 81
    if OAnimFrame < 15
      var5 = 1
    endif
  endif
  if Equal var6 30 || Equal var6 31 || Equal var6 32 || Equal var6 78 || Equal var6 80 || Equal var6 82 || Equal var6 83 || Equal var6 97
    if OAnimFrame < 21
      var5 = 1
    endif
  endif


if Equal var5 1
  var1 = 1
endif
var0 -= 1
if OCurrAction <= 32
  Call AIHub
elif Equal var1 1 && Equal var5 0
  Goto seekOpponent
elif var0 <= 0 || Equal OYDistFloor -1
  Goto seekOpponent
elif OYDistFloor > 10 && Equal OFramesHitstun 0
  Goto seekOpponent
endif
Return

label seekOpponent
var20 = 24636
var9 = 1
var10 = 1
var11 = 5
var12 = 2
var13 = 16
Call ApproachHub
Return

label execute
if CurrAction < 9
  Call AIHub
elif Equal CurrAction 55 || Equal CurrAction 53
  Call 0x1120
endif
Return
Return

