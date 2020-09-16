// FAKE OUT HUB
// controls how the AI decides to fake out the opponent
#include <Definition_AIMain.h>
id 0x8008

unk 0x0


// sets up offsets to get to target position
if Equal var18 0
  var20 = 32776
  var9 = 0
  var10 = 0
  var11 = 20
  var12 = 50
  var13 = Rnd * 20 + 5
  Call ApproachHub
elif Equal AirGroundState 2
  LOGSTR 2018537216 1929379840 0 0 0
  LOGVAL TopNX
  LOGSTR 1482975488 1936998912 1633905408 1164207872 1694498816
  LOGVAL XDistBackEdge
  var0 = OPos * -1
  if YDistFloor > 15
    Button X
    AbsStick var0
    Call AIHub
  elif XDistBackEdge > -10
    AbsStick var0 (-1)
    Button R
    Call AIHub
  endif
  Call AIHub
else
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
Stick (-1) 0
Seek
label
if !(XDistLE 30) || XDistFrontEdge < 25
  Call AIHub
endif
Stick 1
Return

label wavedashBack
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
Return
