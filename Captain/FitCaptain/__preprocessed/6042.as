// Knee

#include <Definition_AIMain.h>
//TrueID=0x6031
id 0x6031

//Set Unknown
unk 0x0


if Equal var18 0
  var9 = 1
  var10 = 0
  var11 = 6
  var12 = 6
  var13 = 14
  var14 = 16
  var15 = 36
  var20 = 24642

  if Equal var19 1
    var13 = 17
    var14 = 30
  endif

  if Equal var16 2 && OFramesHitstun < 1
    Call DefendHub
  else
    Call ApproachHub
  endif
elif True
  var15 = 36
  Stick 1 0
  Button A
  SetFrame 0
  var16 = -1
  Seek executeAttack
endif
Return

label executeAttack
var1 = 0
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

  GetNearestCliff var0
  var17 = var15 - NumFrames
  var1 = XSpeed * var17
  var1 += TopNX
  if var0 < 0
    if Equal IsOnStage 1 && !(Equal DistBackEdge DistFrontEdge)
      var0 -= var1
      if var0 >= 0
        var0 = 1
      endif
    endif
  elif var0 > 0
    if Equal IsOnStage 1 && !(Equal DistBackEdge DistFrontEdge)
      var0 -= var1
      if var0 <= 0
        var0 = -1
      endif
    endif
  endif
  if !(Equal var0 1) && !(Equal var0 -1)
    if Equal DistBackEdge DistFrontEdge || Equal IsOnStage 0
      var0 = 2
    else
      var0 = 0
    endif
  endif

if Equal AirGroundState 1 || FrameGE var15
  Call AIHub
endif

if Equal HitboxConnected 1 && OKBSpeed > var16 && OFramesHitstun > 0
  var16 = OKBSpeed
endif

ClearStick

if YSpeed <= 0 && Equal IsOnStage 1 && Equal var2 1 && Equal var0 0
  Stick 0 (-1)
endif

if !(Equal var0 0) && !(Equal var0 2)
  AbsStick var0
elif True
  if var5 < 0
    AbsStick -1 0
  else
    AbsStick 1 0
  endif
endif

Abs var5
Abs var6
Seek executeAttack
var3 += 1
if YSpeed < 0 && YDistBackEdge > -10 && YDistBackEdge <= 0 && Equal IsOnStage 1
  var19 = 2
  var18 = 1
  if var5 <= var11 && var6 <= var12 && Equal var16 16777215
    Return
  elif !(Equal var0 0)
    Return
  endif
  Call Landing
endif
Return
Return

