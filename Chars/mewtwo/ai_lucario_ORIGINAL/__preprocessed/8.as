// FAKE OUT HUB
// controls how the AI decides to fake out the opponent
#include <Definition_AIMain.h>
id 0x8008

unk 0x0

Cmd30


if Equal XDistFrontEdge XDistBackEdge && !(Equal AirGroundState 1)
  Call RecoveryHub
endif

if YDistBackEdge < -25 && YDistBackEdge > 1
  Call AIHub
endif

// sets up offsets to get to target position
if Equal var18 0 && !(XDistLE 15)
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
  var13 = Rnd * 3
  Call ApproachHub
elif Equal AirGroundState 2
  var0 = OPos * -1
  if YDistBackEdge < -15
    Button X
    AbsStick var0
    Call AIHub
  elif XDistFrontEdge > 9999.9999 && XDistBackEdge < -9999.9999 && Equal IsOnStage 1
    AbsStick var0 (-1)
    Button R
    Call AIHub
  endif
  Call AIHub
elif True
  label
  Cmd30

  if FramesHitstun > 0 && Equal AirGroundState 1 && NumFrames < 4
    Return
  endif

  var21 = 32776
  if !(Equal Direction OPos) && !(Equal CurrAction 6)
    var0 = OPos
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
//   {ADDITIONAL_FAKEOUTS}
  else
    Seek offensiveShield
  endif
  Jump
endif
Return

// {ADDITIONAL_FAKEOUTS_ROUTINES}

label crouchCancelPunish
  Cmd30
var0 = Rnd * 20
label
Stick 0 (-1)
if FramesHitstun > 0 || var0 <= 0
  var21 = 32776
  Call AIHub
endif
var0 -= 1
Return

label dashAway
  Cmd30
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
  Cmd30
if CurrAction > 9
  Return
endif
Button X
label
if InAir
  var17 = OPos * -1
  Stick var17 (-1)
  Button R
  var21 = 32776
  Call AIHub
endif
Return

label offensiveShield
Cmd30
var1 = Rnd * 30 + 10
var17 = var9 + 10
if XDistLE var17 || XDistLE 15
  Seek
  Jump
else
  AbsStick OPos
endif
Return
label
Cmd30
var0 = OPos * 0.5
AbsStick var0
Button R
GetShieldRemain var2
if var2 < 10 || var1 <= 0 || Equal CurrAction 29
  Call OOSHub
endif
var1 -= 1
Return

label jumpOver
Cmd30
Button X
if InAir
  Call AIHub
endif
Return
Return
