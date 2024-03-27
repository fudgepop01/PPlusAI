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
    var9 = 1
    var10 = -9
    var11 = 9
    var12 = 3
    var13 = 9
    var14 = 11
    var15 = 30
  elif CalledAs UTilt
    // LOGSTR 1970563328 1819541504 0 0 0
    var20 = 24627
    var9 = 1
    var10 = 2
    var11 = 7
    var12 = 13
    var13 = 17
    var14 = 22
    var15 = 38
  elif CalledAs DTilt
    // LOGSTR 1685350656 1819541504 0 0 0
    var20 = 24628
    var9 = 1
    var10 = 0
    var11 = 10
    var12 = 5
    var13 = 10
    var14 = 15
    var15 = 35
  elif CalledAs FSmash
    // LOGSTR 1718840576 1634953216 0 0 0
    var20 = 24629
    var9 = 3
    var10 = -7
    var11 = 8
    var12 = 3
    var13 = 19
    var14 = 21
    var15 = 49
  elif CalledAs USmash
    // LOGSTR 1970498816 1634953216 0 0 0
    var20 = 24630
    var9 = -1
    var10 = -3
    var11 = 6
    var12 = 13
    var13 = 22
    var14 = 29
    var15 = 41
  else
    Call AIHub
  endif
 // SAFE_INJECT_4 var9
 // SAFE_INJECT_5 var11
  if Equal var16 2 && OFramesHitstun < 1
    Call DefendHub
  else
    Call ApproachHub
  endif
else
  ClearStick
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
var1 = 0
  SAFE_INJECT_4 var9
  SAFE_INJECT_5 var10
  SAFE_INJECT_6 var11
  SAFE_INJECT_7 var12
  var17 = OTopNY + OHurtboxSize
  var0 = var12 / 2
  var0 = TopNY - var10 + var0
  if var0 > var17
    var0 = OHurtboxSize * -1
  elif var0 < OTopNY
    var0 = 0
  else
    var17 = (var17 - var0)
    var17 = var17 * -1
    var0 = OHurtboxSize / var17
  endif
  // if Equal var8 0 || Equal var8 1 || Equal var18 1
  //   var5 = TopNX + (var9 * Direction)
  //   var5 = var5 + (var11 * Direction)
  //   var6 = TopNY - var10 + var12
  //   DrawDebugRectOutline var5 var6 var11 var12 255 68 68 153
  //   var6 += var0
  //   if var10 > -2 && var20 >= 24641 && var20 <= 24655
  //     var6 = var6 + var10 + 2 - var0
  //   endif
  //   if Equal PlayerNum 0
  //     DrawDebugRectOutline var5 var6 var11 var12 255 68 68 153
  //   elif Equal PlayerNum 1
  //     DrawDebugRectOutline var5 var6 var11 var12 68 68 255 153
  //   elif Equal PlayerNum 2
  //     DrawDebugRectOutline var5 var6 var11 var12 255 255 68 153
  //   elif Equal PlayerNum 3
  //     DrawDebugRectOutline var5 var6 var11 var12 68 255 68 153
  //   else
  //     DrawDebugRectOutline var5 var6 var11 var12 68 68 68 153
  //   endif
  //   var1 = OHurtboxSize / 2
  //   var17 = OTopNY + var1
  //   DrawDebugRectOutline OTopNX var17 var11 var1 68 255 68 153
  // endif
  var17 = 0
 // SAFE_INJECT_1 var17
  var17 = var13 - NumFrames + var1 + var17
  var17 /= 60
  EstOPosVecR var5 var6 var17
  // convert the values to use TopN X and Y instead of character's coordinates
  var17 = ExactOXCoord - ExactXCoord
  var17 = var17 - (OTopNX - TopNX)
  var5 = var5 - var17
  var17 = ExactOYCoord - ExactYCoord
  var17 = var17 - (OTopNY - TopNY)
  var6 = var6 - var17
  var5 += TopNX
  var17 = var9 + (var11 * 2)
  var17 /= 2
  if var17 <= -1
    var5 = var5 - (var11 * OPos * -1)
    var5 = var5 - (var9 * OPos * -1)
  else
    var5 = var5 - (var11 * Direction)
    var5 = var5 - (var9 * Direction)
  endif
  var6 += TopNY
  var17 = var0 * 2
  var6 -= var17
  var6 = var6 - var12
  var6 += var10
  // if Equal var8 0 || Equal var8 1 || Equal var18 1
  //   DrawDebugRectOutline var5 var6 var11 var12 255 0 0 136
  // endif
  var5 -= TopNX
  var6 -= TopNY

if Equal HitboxConnected 1 && OKBSpeed > var16 && OFramesHitstun > 0
  var16 = OKBSpeed
endif

if FrameGE var15 || CurrAction <= 9 || !(Equal AirGroundState 1)
  Call AIHub
endif
Return
Return

