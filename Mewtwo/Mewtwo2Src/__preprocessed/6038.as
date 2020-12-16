#include <Definition_AIMain.h>
//TrueID=0x6038
id 0x6038

//Set Unknown
unk 0x0

if Equal var18 0
  var20 = 24632
  var9 = 8
  var10 = 5
  var11 = 90
  var12 = 10
  var13 = 8
  var14 = 8
  Call ApproachHub
else
  var15 = 26
  var10 = -3
  var11 = 69
  var12 = 5
  ClearStick
  Button B
  SetFrame 0
  Seek
endif
Return

label 
var1 = 50 + Rnd * 100
label ExecuteAttack
if CurrAction <= 9 || !(Equal AirGroundState 1)
  Call AIHub
endif

var0 = 20

Seek 
Jump
if !(True)
  label

  var4 = 0
  SAFE_INJECT_4 var9
  SAFE_INJECT_5 var10
  SAFE_INJECT_6 var11
  SAFE_INJECT_7 var12
  var17 = OTopNY + OHurtboxSize
  var3 = var12 / 2
  var3 = TopNY - var10 + var3
  if var3 > var17
    var3 = OHurtboxSize * -1
  elif var3 < OTopNY
    var3 = 0
  else
    var17 = (var17 - var3)
    var17 = var17 * -1
    var3 = OHurtboxSize / var17
  endif
  // if Equal var8 0 || Equal var8 1 || Equal var18 1
  //   var5 = TopNX + (var9 * Direction)
  //   var5 = var5 + (var11 * Direction)
  //   var6 = TopNY - var10 + var12
  //   DrawDebugRectOutline var5 var6 var11 var12 255 68 68 153
  //   var6 += var3
  //   if var10 > -2 && var20 >= 24641 && var20 <= 24655
  //     var6 = var6 + var10 + 2 - var3
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
  //   var4 = OHurtboxSize / 2
  //   var17 = OTopNY + var4
  //   DrawDebugRectOutline OTopNX var17 var11 var4 68 255 68 153
  // endif
  var17 = 0
 // SAFE_INJECT_1 var17
  var17 = var13 + var0 + var4 + var17
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
  //   var6 = var6 + var10 + 2 - var3 - OHurtboxSize
  // endif
  // var6 -= TopNY
  var17 = var3 * 2
  var6 -= var17
  var6 = var6 - var12
  var6 += var10
  var5 = var5 - (var9 * Direction)
  // if Equal var8 0 || Equal var8 1 || Equal var18 1
  //   DrawDebugRectOutline var5 var6 var11 var12 255 0 0 136
  // endif
  var5 -= TopNX
  var6 -= TopNY

  if var5 <= var11 && var6 <= var12
    Button B
  endif

  var0 -= 5
  if var0 <= 0
    Seek
    Jump
  endif
  Return
endif
label

if ODistLE 25 && Equal Direction OPos
  if Rnd < 0.7
    Button B
  elif Rnd < 0.3
    Button R
  elif Rnd < 0.5
    Stick 1 0
  else
    Stick -1 0
  endif
endif
var1 -= 1
if var1 <= 0
  Button R
  Call AIHub
endif
Seek ExecuteAttack
Return
Return
