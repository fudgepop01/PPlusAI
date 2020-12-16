#include <Definition_AIMain.h>
//TrueID=0x6031
id 0x6031

//Set Unknown
unk 0x0

if Equal var18 0
  // LOGSTR 1784766976 0 0 0 0
  var20 = 24625
  var9 = 1
  var10 = -9
  var11 = 8
  var12 = 2
  var13 = 3
  var14 = 5
  var15 = 14
  if Equal var16 2 && OFramesHitstun < 1
    Call DefendHub
  else
    Call ApproachHub
  endif
else
  var15 = 14
  Button A
  SetFrame 0
  Seek execute
endif
Return

label execute

if Equal var19 1
  if FrameGE 15 || Idling
    Call AIHub
  endif
  Return
endif

label
ClearStick
var1 = 0
  // SAFE_INJECT_4 var9
  // SAFE_INJECT_5 var10
  // SAFE_INJECT_6 var11
  // SAFE_INJECT_7 var12
  
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
  var5 = var5 - (var11 * Direction)
  var6 += TopNY
  // var17 = YDistBackEdge
  // if var10 > -2 && var20 >= 24641 && var20 <= 24655
  //   var6 = var6 + var10 + 2 - var0 - OHurtboxSize
  // endif
  // var6 -= TopNY
  var17 = var0 * 2
  var6 -= var17
  var6 = var6 - var12
  var6 += var10
  var5 = var5 - (var9 * Direction)
  // if Equal var8 0 || Equal var8 1 || Equal var18 1
  //   DrawDebugRectOutline var5 var6 var11 var12 255 0 0 136
  // endif
  var5 -= TopNX
  var6 -= TopNY

if FrameGE 2
  if Equal CurrSubaction Attack11
    if Equal HitboxConnected 1 && FrameGE 7
      SetFrame 0
      Button A
    elif FrameGE 15
      Call AIHub
    endif
  elif Equal CurrSubaction Attack12
    if Equal HitboxConnected 1 && FrameGE 8
      SetFrame 0
      Button A
    elif FrameGE 18
      Call AIHub
    endif
  elif Equal CurrSubaction Attack13
    if Idling
      Call AIHub
    endif
  else
    Call AIHub
  endif
endif
Return
Return

