#include <Definition_AIMain.h>
//TrueID=0x603C
id 0x603C

//Set Unknown
unk 0x0

if CurrAction >= hex(0x34) && CurrAction <= hex(0x3C)
  Call 0x1120
endif

if Equal movePart 0
  LOGSTR str("grab")
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
  Button X
endif
Return

label techChase_wait
#let patience = var0
#let rollFlag = var1
patience = Rnd * 50 + 100
rollFlag = 0
label
if !(XDistLE 15)
  // walk-up
  var2 = OPos * 0.7
  AbsStick var2 (-0.4)
else
  // force crouch cancel
  Stick 0 (-1)
endif

IS_EARLY_ROLL

if Equal isEarlyRoll 1
  rollFlag = 1
endif
LOGSTR str("waiting...")
patience -= 1
if Equal rollFlag 1 && Equal isEarlyRoll 0
  Goto seekOpponent
elif OCurrAction <= hex(0x20)
  Call AIHub
elif patience <= 0 || Equal OYDistFloor -1
  Goto seekOpponent
elif OYDistFloor > 10 && Equal OFramesHitstun 0
  Goto seekOpponent
endif
Return

label seekOpponent
lastAttack = hex(0x603C)
move_xOffset = grab_xOffset
move_yOffset = grab_yOffset
move_xRange = grab_xRange
move_yRange = grab_yRange
move_hitFrame = grab_dist1
Call ApproachHub
Return

label execute
if CurrAction < hex(0x09)
  Call AIHub
elif Equal CurrAction hex(0x37) || Equal CurrAction hex(0x35)
  Call 0x1120
endif
Return
Return
