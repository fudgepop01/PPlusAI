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
  if Equal var19 2
    var9 = 0
    var10 = 4
    var12 = 10
  endif
  Call ApproachHub
else
  var15 = 26
  var10 = -3
  var11 = 69
  var12 = 5
  ClearStick
  Button B
  SetFrame 0
  if Equal var19 1 
    Seek ASC
  elif Equal var19 2
    Button A
    Seek aurabomb
  else
    Seek setup
  endif
endif
Return

label ASC
if CurrAction <= 9
  Call AIHub
endif

if CurrSubaction >= 464 && CurrSubaction <= 467
  Button R
  Call AIHub
endif
Return

label aurabomb
  Call AIHub
Return

label setup
var1 = 20 + Rnd * 60
if CurrSubaction >= 464 && CurrSubaction <= 467
  Seek ExecuteAttack
  Return
elif CurrAction <= 9
  Call AIHub
endif
if !(Equal OPos Direction)
  AbsStick OPos
endif
Return

label ExecuteAttack
if !(Equal AirGroundState 1) && Equal XDistFrontEdge XDistBackEdge && CurrSubaction >= 464 && CurrSubaction <= 467
  Button R
  Call AIHub
elif CurrAction <= 9
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
  // calculate own estimated position
  var17 = var13 + var0 + var4
  // if using a grounded attack then own offset will be very small
  if var20 >= 24625 && var20 <= 24631
    var17 -= var13 
    var17 -= var8
  endif
  var17 += 1
  EstOXCoord var5 var17
  EstOYCoord var6 var17
  var17 -= 1
  var17 /= 60
  EstOPosVecR var3 var17 var17
  var22 = ExactOXCoord - ExactXCoord
  var22 = var22 - (OTopNX - TopNX)
  var3 -= var22
  var22 = ExactOYCoord - ExactYCoord
  var22 = var22 - (OSCDBottom - TopNY)
  var17 -= var22
  var3 += TopNX
  var17 += TopNY
  var3 -= OTopNX
  var3 *= -2
  var22 = var5 - OTopNX
  var3 += var22
  var3 += TopNX
  var17 -= OSCDBottom
  var17 *= -2
  var22 = var6 - OSCDBottom
  var17 += var22
  var17 += TopNY
  // estimate target position separately
  var22 = var13 + var0 + var4
  EstOYCoord var6 var22
  // if the opponent is in an actionable state, lower the estimate of
  // their x offset to prevent dashdancing from setting it off when very far away
  if OCurrAction <= 21
    var22 /= 3
  endif
  EstOXCoord var5 var22
  var6 = var6 - (OSCDBottom - OTopNY)
  // var5 = estimated target x position
  // var6 = estimated target y position
  // var3 = estimated own x position
  // var17 = estimated own y position
  // var22 = temporary variable
  // correct if estimated y positions go beyond ground level
  // self
  var22 = YDistBackEdge + TopNY
  if var17 < var22 && Equal IsOnStage 1
    var22 -= var17
    var17 += var22
  endif
  // target
  var22 = OYDistBackEdge + OTopNY
  if var6 < var22 && Equal OIsOnStage 1
    var22 -= var6
    var6 += var22
  endif
  // if !(CalledAs ComboHub)
  //   if Equal var8 1 || Equal var18 1
  //     // self
  //     DrawDebugRectOutline var3 var17 5 5 255 0 0 136
  //     // target
  //     DrawDebugRectOutline var5 var6 5 5 0 0 255 136
  //   endif
  // endif
  // calculate difference between the two
  
  var5 = var3 - var5
  var6 = var17 - var6
  // adjust for the move parameters
  if !(InAir)
    var5 = var5 - (var11 * OPos)
    var5 = var5 - (var9 * OPos)
  else
    var5 = var5 - (var11 * Direction)
    var5 = var5 - (var9 * Direction)
  endif
  // account for target height
  var22 = 0
  SAFE_INJECT_E var22
  var17 = OSCDBottom + OHurtboxSize
  var3 = TopNY - var10 + var12 + var22
  if var3 >= var17 
    // above
    var3 = OHurtboxSize * -1
  elif var3 <= OSCDBottom 
    // below
    var3 = 0
  else 
    // middle
    var3 = OHurtboxSize - (var17 - var3)
  endif
  // var3 += OHurtboxSize
  var6 += var3
  // if !(CalledAs ComboHub)
  //   if Equal var8 1 || Equal var18 1
  //     var5 += TopNX
  //     var6 += TopNY
  //     DrawDebugRectOutline var5 var6 var11 var12 0 255 0 136
  //     var5 -= TopNX
  //     var6 -= TopNY
  //     var17 = TopNY - var10 + var12 + var22
  //     DrawDebugRectOutline TopNX var17 10 0 0 255 255 136
  //     var22 = var9 + TopNX
  //     var17 = TopNY - var10
  //     DrawDebugRectOutline var22 var17 var11 var12 0 0 0 136
  //     var17 += var3
  //     DrawDebugRectOutline var22 var17 var11 var12 255 255 255 136
  //     var22 = OHurtboxSize / 2
  //     var17 = var22 + OSCDBottom
  //     DrawDebugRectOutline OTopNX var17 5 var22 255 255 0 221
  //   endif
  // endif

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

if ODistLE 30
  if Rnd < 0.8 && Equal Direction OPos
    Button B
  elif Rnd < 0.2
    Button R
  elif Rnd < 0.4
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
