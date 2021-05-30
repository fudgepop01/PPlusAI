// EDGE ESCAPE HUB
// controls how the AI decides to take back stage control
#include <Definition_AIMain.h>
id 0x8009

unk 0x0

SetTimeout 600

var21 = 32777

label start

if !(Equal Direction OPos)
  var22 = OPos * 0.5
  AbsStick var22
else
  Seek
  Jump
endif

predictOOption var17 13 LevelValue
predictionConfidence var22 13 LevelValue

if Equal var17 1
  var22 *= 0.65
  if var22 < Rnd
    Seek threat
    Jump
  endif
elif Equal var17 2 && var22 < Rnd
  Seek wait
  Jump
elif Equal var17 3 && var22 < Rnd
  Seek commit
  Jump  
endif

var17 = Rnd * 3
if var17 < 1
  Seek threat
elif var17 < 2
  Seek wait
else
  Seek commit
endif
Jump
Return

label threat
var16 = 101
var17 = Rnd * 4
if var17 < 1 && Equal AirGroundState 1
  label threat_WDBack
  var4 = Rnd * 10
  label 
  Goto checkSituation
  var4 -= 1
  if var4 <= 0 || XDistLE 15
    Button X
    Seek
  endif
  AbsStick OPos
  Return
  label
  Goto checkSituation
  var22 = OPos * -1
  AbsStick var22
  if InAir
    Button R
    if XDistBackEdge > -5
      ClearStick 
      AbsStick 0 (-1)
    else
      AbsStick var22 (-1)
    endif
    Seek
  endif
  Return 
  label
  Goto checkSituation
  if CurrAction <= 18
    Seek
  endif
  Return
  label
elif var17 < 2
  label threat_dash_foward
  var4 = Rnd * 4
  label 
  Goto checkSituation
  var4 -= 1
  if var4 <= 0 || XDistLE 15
    Seek
  endif
  AbsStick OPos
  Return
  label
elif var17 < 3 && XDistBackEdge < -10
  label threat_dash_back
  var4 = Rnd * 4
  label 
  Goto checkSituation
  var4 -= 1
  if var4 <= 0 || XDistLE 15
    Seek
  endif
  var22 = OPos * -1
  AbsStick var22
  Return
  label  
elif var17 < 4 && XSpeed < 0.5 && XSpeed > -0.5
  label threat_jump
  var4 = Rnd * 15 + 10
  Button X
  label 
  Goto checkSituation
  var4 -= 1
  if var4 <= 0
    Seek
  endif
  if XDistLE 20 && XDistBackEdge < -10 && InAir
    var22 = OPos * -1
    AbsStick var22
  endif
  Return
  label
else
  label threat_aerial
  Goto checkSituation
  var4 = Rnd * 15
  if !(InAir)
    Button X
    label 
    Goto checkSituation
    var4 -= 1
    if var4 <= 0
      Seek
    endif
    if !(XDistLE 20) && InAir
      var22 = OPos * 1
      AbsStick var22
    endif
    Return
  endif
  label
  Goto checkSituation
  if Rnd < 0.5
    ClearStick
    Button A
  else
    Button A
    Stick 1
  endif
  Seek
  Return
  label
  Goto checkSituation
  if InAir
    var22 = OPos * 1
    AbsStick var22
  else
    Seek
  endif
  Return
  label
endif

Seek start
trackOAction 13 1
Jump
Return

label wait
var16 = 102

if Rnd < 0.5
  label wait_stand
  var4 = Rnd * 30 + 20
  label 
  Goto checkSituation
  var4 -= 1
  if var4 <= 0
    Seek
  endif
  Return
  label
else
  label wait_shield
  Goto checkSituation
  var4 = Rnd * 40 + 20
  label 
  Goto checkSituation
  var4 -= 1
  Button R
  if var4 <= 0
    Seek
  elif Equal CurrAction 29 
    trackOAction 13 2
    Call OOSHub
  endif
  Return
  label
endif
Return
label

Seek start
trackOAction 13 2
Jump
Return

label commit
var16 = 103

var17 = Rnd * 4
if var17 < 1
  label commit_attack
  Goto checkSituation
  if Rnd < 0.2
    Button A
    Stick 0 (-1)
  elif Rnd < 0.2
    Button A
    Stick 0.7 0
  else
    ClearStick
    Button A
  endif
  Seek
  Return
  label
  Goto checkSituation
  var22 = TopNX * -1
  AbsStick var22
  Return
elif var17 < 2
  label commit_aerial
  var4 = Rnd * 40 + 10
  Button X
  label 
  Goto checkSituation
  var4 -= 1
  var22 = TopNX * -1
  AbsStick var22
  if var4 <= 0 && InAir
    Seek
  endif  
  Return
  label
  if Rnd < 0.5
    ClearStick
    Button A
  else
    Button A
    Stick 1
  endif
  Seek
  Return
  label
  Goto checkSituation
  var22 = TopNX * -1
  AbsStick var22
  Return
elif var17 < 3
  label commit_roll
  Goto checkSituation
  if !(InAir)
    Seek
  endif
  Return
  label
  Button R
  if Equal CurrAction 27
    var22 = TopNX * -1
    AbsStick var22
    Seek
  endif
  Return
  label
  Goto checkSituation
  if Equal CurrAction 27
    Seek commit_jump
  endif
  Return
elif var17 < 4
  label commit_jump
  Goto checkSituation
  if InAir && Rnd <= 0.03
    Seek
    Return
  endif
  Button X
  Return
  label
  Goto checkSituation
  Button X
  var22 = TopNX * -1
  AbsStick var22
  Return
endif
Return

label checkSituation

  GetNearestCliff var0
  var0 = TopNX - var0
  var0 *= -1
  var1 *= -1
  var1 = var1 - (TopNY * -1)
Abs var0

var1 = TopNX
Abs var1
var2 = OTopNX
Abs var2

var3 = TopNY - OTopNY

if var0 > 45 || var1 < var2 || !(XDistLE 50) || var3 > 40
  if Equal var16 103
    trackOAction 13 3
  endif
  Call AIHub
elif OFramesHitstun > 0
  if Equal var16 103
    trackOAction 13 3
  endif
  Call ComboHub
elif OAttacking && OAnimFrame > 10 && !(Equal var16 103)
  Seek commit
  Jump
endif
Return
Return
