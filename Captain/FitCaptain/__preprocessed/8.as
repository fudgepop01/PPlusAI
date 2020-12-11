// FAKE OUT HUB
// controls how the AI decides to fake out the opponent
#include <Definition_AIMain.h>
id 0x8008

unk 0x0


// sets up offsets to get to target position
if Equal var18 0
  RetrieveATKD var0 OCurrSubaction 1

  var21 = 32776
  var20 = 32776
  var9 = 0
  var11 = 25
  if !(Equal var0 -1)
    var9 = var3
    var11 = 10 + (var3 - var2)
    Abs var11
  endif
  var10 = 0
  var12 = 50
  var13 = Rnd * 20 + 5
  Call ApproachHub
elif Equal AirGroundState 2
  var0 = OPos * -1
  if YDistBackEdge < -15
    Button X
    AbsStick var0
    Call AIHub
  elif XDistFrontEdge > 10
    AbsStick var0 (-1)
    Button R
    Call AIHub
  endif
  Call AIHub
elif True
  var21 = 32776
  if !(Equal Direction OPos)
    var0 = OPos * 0.65
    AbsStick var0
    Return
  endif
  if Equal OCurrAction 37 || Equal OCurrAction 36
    Seek jumpOver
  endif
  var0 = Rnd
  if var0 < 0.5 && Damage < 25 && !(Equal OCurrAction 52)
    Seek crouchCancelPunish
  elif var0 < 0.3 && Equal CurrAction 3
    Seek dashAway
  elif var0 < 0.4
    Seek wavedashBack
  else
    Seek offensiveShield
  endif
  Jump
endif
Return

label crouchCancelPunish
var0 = Rnd * 20 + 10
label
Stick 0 (-1)
if FramesHitstun > 0 || var0 <= 0
  var21 = 32776
  Call AIHub
endif
var0 -= 1
Return

label dashAway
if Equal Direction OPos
  Stick (-1) 0
endif
Seek
Return
label
if !(XDistLE 20) || XDistFrontEdge < 35
  Call AIHub
endif
Stick 1
Return

label wavedashBack
if CurrAction > 9
  Return
endif
Button X
label
if InAir
  Stick (-1) (-1)
  Button R
  var21 = 32776
  Call AIHub
endif
Return

label offensiveShield
var1 = Rnd * 30 + 10
var0 = OPos * 0.5
Stick OPos
label
Stick var0
Button R
GetShieldRemain var2
if var2 < 10 || var1 <= 0 || Equal CurrAction 29
  Call OOSHub
endif
var1 -= 1
Return

label jumpOver
Button X
if InAir
  Call AIHub
endif
Return
Return
