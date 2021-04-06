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
    Seek techChase_wait
    Jump
  else
    Seek seekOpponent
    Jump
  endif
  Return
elif True
  if Equal CurrSubaction JumpSquat
    Button A|R
    Seek execute
    SetFrame 0
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
TECHCHASE_SITUATION(var0, var1, var2, var3, var4, var5, Rnd * 75 + 75, _AIHub, seekOpponent)

label _AIHub
Call AIHub

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
move_IASA = grab_IASA
move_xOffset = grab_xOffset
move_yOffset = grab_yOffset
move_xRange = grab_xRange
move_yRange = grab_yRange
move_hitFrame = grab_hitFrame
move_lastHitFrame = grab_lastHitFrame
Call ApproachHub
Return

label execute
CALC_TARGET_DISTANCES(var5, var6, var8, var0, var1, move_hitFrame - NumFrames, _oCalc, _sCalc)

if CurrAction < hex(0x09) || Equal CurrAction hex(0x7D)
  Call AIHub
elif Equal CurrAction hex(0x37) || Equal CurrAction hex(0x35)
  Call Unk1120
endif
Return
Return
