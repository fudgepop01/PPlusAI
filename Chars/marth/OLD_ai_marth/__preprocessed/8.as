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

LOGSTR 1819501312 1919512576 1946157056 0 0
LOGVAL var21
if Equal var21 8272 && Rnd < 0.50 && ODistLE 45 && Equal OAirGroundState 1 && SamePlane 
  LOGSTR 1163412736 1126191872 1347376128 1146045440 1195720448
  Button R
  Stick 0 (-1)
  Call AIHub
endif

// sets up offsets to get to target position
if Equal var18 0 && !(XDistLE 15) && !(Equal var21 8272)
  predictAverage var0 3 LevelValue

  var21 = 32776
  var20 = -1
  var9 = 0
  var11 = 15 + var0
  Abs var11
  var10 = 0
  var12 = 50
  var13 = Rnd * 3

  predictAverage var22 3 LevelValue
  var22 += 15
  predictOOption var17 7 LevelValue
  predictionConfidence var23 7 LevelValue
  var23 *= 3.5

  var16 = 14
  if Rnd <= 0.3 && Equal var17 1
    Seek
    Jump
  elif Rnd < 0.05
    Seek
    Jump
  elif OCurrActionFreq >= 3 && !(Equal CurrAction 0)
    Seek
    Jump
  endif
  if OCurrAction <= 23 && Rnd < var23 && Equal var17 1
    label
    var11 = var22 * 2
    var9 = 0
    var13 = Rnd * 3
    if Rnd < 0.7
      var20 = 25003
      var9 += 35
    else
      var20 = 25002
    endif
    Call ApproachHub
  endif

  Call ApproachHub
elif Equal AirGroundState 2
  var0 = OPos * -1
  var17 = TopNY - OTopNY
  if YDistBackEdge < -3 && var17 < 25 && YSpeed < -0.3
    Button X
    AbsStick var0
    Call AIHub
  // elif XDistFrontEdge > 10 && XDistBackEdge < -10 && Equal IsOnStage 1
  //   AbsStick var0 (-1)
  //   Button R
  //   Call AIHub
  endif
  Call AIHub
elif True
  label
  Cmd30
  if Equal var21 8304 && Rnd < 0.70 && ODistLE 45 && Equal OAirGroundState 1 && SamePlane
    Button R
    Stick 0 (-1)
    Call AIHub
  elif Equal var21 8272 && Rnd < 0.50 && ODistLE 45 && Equal OAirGroundState 1 && SamePlane 
    Button R
    Stick 0 (-1)
    Call AIHub
  elif Equal var20 25002 
    Seek offensiveShield
    Jump
  elif Equal var20 25003
    Seek jumpOver
    Jump
  endif
  var20 = -1

  if FramesHitstun > 0 && Equal AirGroundState 1 && NumFrames < 4
    Return
  endif

  var21 = 32776
  if !(Equal Direction OPos) && !(Equal CurrAction 6)
    var0 = OPos
    AbsStick var0
    Return
  endif
  if Equal OCurrAction 37
    Seek jumpOver
  endif
  predictAverage var22 3 LevelValue
  predictAverage var17 4 LevelValue
  if XDistLE var17 var22 && OAttacking
    Seek offensiveShield
  endif

  var0 = Rnd
  if var0 <= 0.1
    Seek jumpOver
  elif var0 <= 0.25 && Damage < 60 && !(Equal OCurrAction 52)
    Seek crouchCancelPunish
  elif var0 <= 0.60 && Equal CurrAction 3
    Seek dashAway
  elif var0 <= 0.70
    Seek wavedashBack

  else
    Seek offensiveShield
  endif
  Jump
endif
Return



label crouchCancelPunish
  Cmd30
Goto checkHitstun
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
Goto checkHitstun
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
Goto checkHitstun
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
var20 = -1
Cmd30
Goto checkHitstun
var1 = Rnd * 50 + 10
var17 = var9 + var11
if XDistLE var17 || XDistLE 15
  Seek
  Jump
else
  AbsStick OPos
  if Equal CurrAction 1
    ClearStick 
  endif
endif
Return
label
Cmd30
Goto checkHitstun
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
Goto checkHitstun
if CurrAction >= 9
  Return
endif
label
Cmd30
Goto checkHitstun
AbsStick OPos
Button X
if InAir
  Call AIHub
endif
Return
label checkHitstun
  if FramesHitstun > 0
    var22 = LevelValue * 0.01 - 0.1
    if LevelValue >= 60 && Rnd <= var22
      if Damage < 80 || Equal FramesHitlag 1
        ClearStick
        Stick 0 (-1)
      elif Rnd < 0.4
        ClearStick
        Stick 0 (-1)
        if LevelValue >= 75 && Rnd <= var22
          Button R
        endif
      endif
    endif
    Call OnGotDamaged
  endif

Return
Return
