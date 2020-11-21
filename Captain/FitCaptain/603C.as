#include <Definition_AIMain.h>
//TrueID=0x603C
id 0x603C

//Set Unknown
unk 0x0

if CurrAction >= hex(0x34) && CurrAction <= hex(0x3C)
  Call 0x1120
endif

if Equal movePart 0
  // LOGSTR str("grab")
  if Equal moveVariant mv_techChase
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
  if Equal AirGroundState 1 && CurrAction <= hex(0x09)
    Button X
  endif
endif
Return

label techChase_wait
SetTimeout 300
#let patience = var0
#let rollFlag = var1
#let distance = var2
patience = Rnd * 75 + 75
rollFlag = 0
if Damage < 30
  distance = 15
else
  distance = 25
endif
label
if !(XDistLE distance)
  // walk-up
  var3 = OPos * 0.7
  AbsStick var3 (-0.4)
else
  // force crouch cancel
  Stick 0 (-1)
endif

IS_EARLY_ROLL(var5, var6)

if Equal isEarlyRoll 1
  rollFlag = 1
endif
patience -= 1
if OCurrAction <= hex(0x15)
  Call AIHub
elif Equal rollFlag 1 && Equal isEarlyRoll 0
  Goto seekOpponent
elif patience <= 0
  Goto seekOpponent
elif Equal OIsOnStage 0 && Equal OCurrAction hex(0x49)
  Call AIHub
elif OYDistBackEdge < -20 && Equal OFramesHitstun 0
  Goto seekOpponent
endif
Return

label seekOpponent
SetFrame 0
label
if Equal moveVariant mv_techChase
  #let tempVar = var0
  tempVar = (100 - LevelValue) / 100
  if Rnd < tempVar && !(FrameGE 15)
    Return
  endif
endif
lastAttack = hex(0x603C)
move_xOffset = grab_xOffset
move_yOffset = grab_yOffset
move_xRange = grab_xRange
move_yRange = grab_yRange
move_hitFrame = grab_hitFrame
Call ApproachHub
Return

label execute
if CurrAction < hex(0x09) || Equal CurrAction hex(0x7D)
  Call AIHub
elif Equal CurrAction hex(0x37) || Equal CurrAction hex(0x35)
  Call 0x1120
endif
Return
Return
