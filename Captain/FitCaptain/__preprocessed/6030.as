#include <Definition_AIMain.h>
//TrueID=0x6030
id 0x6030

//Set Unknown
unk 0x0

//Strings



// sets up offsets to get to target position
if Equal var18 0
  if CalledAs FTilt
    // LOGSTR 1718905088 1819541504 0 0 0
    var20 = 24626
    var9 = 10
    var10 = -5
    var11 = 11
    var12 = -1
    var13 = 9
    var14 = 3
  elif CalledAs UTilt
    // LOGSTR 1970563328 1819541504 0 0 0
    var20 = 24627
    var9 = 10
    var10 = -8
    var11 = 13
    var12 = 10
    var13 = 17
    var14 = 6
  elif CalledAs DTilt
    // LOGSTR 1685350656 1819541504 0 0 0
    var20 = 24628
    var9 = 5
    var10 = 0
    var11 = 15
    var12 = 5
    var13 = 10
    var14 = 6
  elif CalledAs FSmash
    // LOGSTR 1718840576 1634953216 0 0 0
    var20 = 24629
    var9 = 7
    var10 = -5
    var11 = 17
    var12 = 6
    var13 = 19
    var14 = 3
  elif CalledAs USmash
    // LOGSTR 1970498816 1634953216 0 0 0
    var20 = 24630
    var9 = 1
    var10 = -20
    var11 = 11
    var12 = 15
    var13 = 22
    var14 = 8
  else
    Call AIHub
  endif
  SAFE_INJECT_4 var9
  SAFE_INJECT_5 var11
  if Equal var21 2 && OFramesHitstun < 1
    Call DefendHub
  else
    Call ApproachHub
  endif
else
  ClearStick
  // var15 = 45
  if CalledAs FTilt
    var15 = 30
    Stick (0.5) 0
  elif CalledAs UTilt
    var15 = 38
    Stick 0 0.7
  elif CalledAs DTilt
    var15 = 35
    Stick 0 (-0.7)
  elif CalledAs FSmash
    var15 = 49
    Stick 1 0
  elif CalledAs USmash
    var15 = 41
    Stick 0 1
  endif
  Button A
  SetFrame 0
  var16 = -1
  Seek ExecuteAttack
endif
Return

label ExecuteAttack
if Equal HitboxConnected 1 && OKBSpeed > var16 && OFramesHitstun > 0
  var16 = OKBSpeed
endif

if FrameGE var15 || CurrAction <= 9 || !(Equal AirGroundState 1)
  Call AIHub
endif
Return
Return
