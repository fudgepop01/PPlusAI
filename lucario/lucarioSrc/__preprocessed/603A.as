#include <Definition_AIMain.h>
//TrueID=0x603A
id 0x603A

//Set Unknown
unk 0x0


var20 = 24634
var9 = -5
var10 = -5
var11 = 5
var12 = 5
var13 = 1
var14 = 1
var15 = 50

Button B
Stick 0 0.7
SetFrame 0
var16 = -1
Seek ExecuteAttack
Return

label ExecuteAttack
var1 = 0
  SAFE_INJECT_4 var9
  SAFE_INJECT_5 var10
  SAFE_INJECT_6 var11
  SAFE_INJECT_7 var12
  // calculate own estimated position
  var17 = 4 + var1
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
  EstOPosVecR var0 var17 var17
  var22 = ExactOXCoord - ExactXCoord
  var22 = var22 - (OTopNX - TopNX)
  var0 -= var22
  var22 = ExactOYCoord - ExactYCoord
  var22 = var22 - (OSCDBottom - TopNY)
  var17 -= var22
  var0 += TopNX
  var17 += TopNY
  var0 -= OTopNX
  var0 *= -2
  var22 = var5 - OTopNX
  var0 += var22
  var0 += TopNX
  var17 -= OSCDBottom
  var17 *= -2
  var22 = var6 - OSCDBottom
  var17 += var22
  var17 += TopNY
  // estimate target position separately
  var22 = 4 + var1
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
  // var0 = estimated own x position
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
  //     DrawDebugRectOutline var0 var17 5 5 255 0 0 136
  //     // target
  //     DrawDebugRectOutline var5 var6 5 5 0 0 255 136
  //   endif
  // endif
  // calculate difference between the two
  
  var5 = var0 - var5
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
  var0 = TopNY - var10 + var12 + var22
  if var0 >= var17 
    // above
    var0 = OHurtboxSize * -1
  elif var0 <= OSCDBottom 
    // below
    var0 = 0
  else 
    // middle
    var0 = OHurtboxSize - (var17 - var0)
  endif
  // var0 += OHurtboxSize
  var6 += var0
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
  //     var17 += var0
  //     DrawDebugRectOutline var22 var17 var11 var12 255 255 255 136
  //     var22 = OHurtboxSize / 2
  //     var17 = var22 + OSCDBottom
  //     DrawDebugRectOutline OTopNX var17 5 var22 255 255 0 221
  //   endif
  // endif

Norm var7 var5 var6
var5 /= var7
var6 /= var7
AbsStick var5 var6

if Equal HitboxConnected 1 && OKBSpeed > var16 && OFramesHitstun > 0
  var16 = OKBSpeed
endif

if Equal HitboxConnected 1 || Equal NumFrames 38
  label
  Button A
  if Equal CurrSubaction 30
    SetFrame 0
    Seek CancelAttack
  endif
  Return
endif

if CurrAction <= 9 || Equal HitboxConnected 1
  Call AIHub
endif
Return

label CancelAttack
  if FrameGE 10
    var16 = 255
    Call ComboHub
  endif
Return
Return
