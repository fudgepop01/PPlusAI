#include <Definition_AIMain.h>
//TrueID=0x6030
id 0x6030

//Set Unknown
unk 0x0

//Strings



// sets up offsets to get to target position
if Equal var18 0
  if CalledAs FTilt
    LOGSTR 1718905088 1819541504 0 0 0
    var20 = 24626
    var9 = 7
    var10 = 10
    var11 = 25
    var12 = 10
    var13 = 20
  elif CalledAs UTilt
    LOGSTR 1970563328 1819541504 0 0 0
    var20 = 24627
    var9 = 7
    var10 = 10
    var11 = 15
    var12 = 10
    var13 = 30
  elif CalledAs DTilt
    LOGSTR 1685350656 1819541504 0 0 0
    var20 = 24628
    var9 = 5
    var10 = 0
    var11 = 15
    var12 = 5
    var13 = 20
  elif CalledAs FSmash
    LOGSTR 1718840576 1634953216 0 0 0
    var20 = 24629
    var9 = 5
    var10 = 5
    var11 = 10
    var12 = 10
    var13 = 13
  elif CalledAs USmash
    LOGSTR 1970498816 1634953216 0 0 0
    var20 = 24630
    var9 = 4
    var10 = 10
    var11 = 13
    var12 = 25
    var13 = 13
  else
    Call AIHub
  endif
  Call ApproachHub
else
  ClearStick
  // var14 = 45
  if CalledAs FTilt
    var14 = 30
    Stick (0.5) 0
  elif CalledAs UTilt
    var14 = 38
    Stick 0 0.7
  elif CalledAs DTilt
    var14 = 35
    Stick 0 (-0.7)
  elif CalledAs FSmash
    var14 = 49
    Stick 1 0
  elif CalledAs USmash
    var14 = 32
    Stick 0 1
  endif
  Button A
  Seek ExecuteAttack
endif
Return

label ExecuteAttack
if FrameGE 1
  if AnimFrame >= var14 || CurrAction <= 9 || !(Equal AirGroundState 1)
    Call AIHub
  endif
endif
Return
Return
