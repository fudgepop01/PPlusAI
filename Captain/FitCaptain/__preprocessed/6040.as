#include <Definition_AIMain.h>
//TrueID=0x6040
id 0x6040

//Set Unknown
unk 0x00000

//Strings


// sets up offsets to get to target position
if Equal var18 0
  if CalledAs NAir
    var20 = 24641
    var9 = -4
    var10 = -3
    var11 = 10
    var12 = 3
    var13 = 7
    var14 = 12
    var15 = 45

    if Equal var19 1
      var9 = -4
      var10 = -3
      var11 = 25
      var13 = 7
    elif Equal var19 2
      var13 = 20
      var14 = 29
    endif
  elif CalledAs FAir
    var20 = 24642
    var9 = 1
    var10 = 0
    var11 = 6
    var12 = 6
    var13 = 14
    var14 = 16
    var15 = 36

    if Equal var19 1
      var13 = 17
      var14 = 30
    endif
  elif CalledAs BAir
    var20 = 24643
    var9 = -15
    var10 = -2
    var11 = 7
    var12 = 4
    var13 = 10
    var14 = 17
    var15 = 29
  elif CalledAs UAir
    var20 = 24644
    var9 = 0
    var10 = -3
    var11 = 8
    var12 = 8
    var13 = 6
    var14 = 10
    var15 = 30

    if Equal var19 1
      var9 = -8
      var10 = -3
      var11 = 8
      var12 = 8
      var13 = 11
      var14 = 13
    endif
  elif CalledAs DAir
    var20 = 24645
    var9 = -4
    var10 = 10
    var11 = 5
    var12 = 12
    var13 = 16
    var14 = 20
    var15 = 38
  else
    Call AIHub
  endif
  if Equal var16 2 && OFramesHitstun < 1
    Call DefendHub
  else
    Call ApproachHub
  endif
elif Equal AirGroundState 2 && Equal var18 1
  ClearStick
  var15 = 45
  if CalledAs FAir
    var15 = 36
    Stick (0.5) 0
  elif CalledAs BAir
    var15 = 29
    Stick (-0.5) 0
  elif CalledAs UAir
    var15 = 30
    Stick 0 (0.5)
  elif CalledAs DAir
    var15 = 38
    Stick 0 (-0.5)
  endif
  Button A
  var3 = 0
  var16 = -1
  Seek ExecuteAttack
else
  Call AIHub
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

if Equal AirGroundState 1 || var3 >= var15
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
Seek ExecuteAttack
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
