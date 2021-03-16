#include <Definition_AIMain.h>
//TrueID=0x6030
id 0x6030

//Set Unknown
unk 0x0

//Strings



// sets up offsets to get to target position
if Equal var18 0
  if CalledAs Jab123
    var20 = 24625
    var9 = 0
    var10 = -4
    var11 = 7.4
    var12 = 3.85
    var13 = 6
    var14 = 7
    var15 = 19
  elif CalledAs FTilt
    // LOGSTR 1718905088 1819541504 0 0 0
    var20 = 24626
    var9 = 1
    var10 = -5.650
    var11 = 6.4
    var12 = 3.850
    var13 = 10
    var14 = 14
    var15 = 27
  elif CalledAs UTilt
    // LOGSTR 1970563328 1819541504 0 0 0
    var20 = 24627
    var9 = -12
    var10 = 1
    var11 = 12.4
    var12 = 12.85
    var13 = 5
    var14 = 14
    var15 = 28
  elif CalledAs DTilt
    // LOGSTR 1685350656 1819541504 0 0 0
    var20 = 24628
    var9 = 1
    var10 = 1
    var11 = 8.55
    var12 = 3.85
    var13 = 5
    var14 = 8
    var15 = 26
  elif CalledAs FSmash
    // LOGSTR 1718840576 1634953216 0 0 0
    var20 = 24629
    var9 = 6
    var10 = -2
    var11 = 10.55
    var12 = 6
    var13 = 20
    var14 = 24
    var15 = 51
  elif CalledAs USmash
    // LOGSTR 1970498816 1634953216 0 0 0
    var20 = 24630
    var9 = 1
    var10 = 0
    var11 = 4.55
    var12 = 19.6
    var13 = 11
    var14 = 24
    var15 = 26
  elif CalledAs DSmash
    // LOGSTR 1970498816 1634953216 0 0 0
    var20 = 24631
    var9 = -17
    var10 = -1
    var11 = 16
    var12 = 4.6
    var13 = 13
    var14 = 18
    var15 = 52
  elif CalledAs NSpecial
    // LOGSTR 1970498816 1634953216 0 0 0
    var20 = 24632
    var9 = 8
    var10 = -3
    var11 = 69
    var12 = 5
    var13 = 8
    var14 = 8
    var15 = 26
  elif CalledAs SSpecial
    // LOGSTR 1970498816 1634953216 0 0 0
    var20 = 24633
    var9 = 0.5
    var10 = -5
    var11 = 7.5
    var12 = 3.6
    var13 = 12
    var14 = 14
    var15 = 58
  elif CalledAs USpecial
    // LOGSTR 1970498816 1634953216 0 0 0
    var20 = 24634
    var9 = -5
    var10 = -5
    var11 = 5
    var12 = 5
    var13 = 1
    var14 = 1
    var15 = 50
  elif CalledAs DSpecial
    // LOGSTR 1970498816 1634953216 0 0 0
    var20 = 24635
    var9 = 0
    var10 = 0
    var11 = 25
    var12 = 10
    var13 = 10
    var14 = 10
    var15 = 30
  elif CalledAs Grab
    // LOGSTR 1970498816 1634953216 0 0 0
    var20 = 24636
    var9 = 1
    var10 = -3
    var11 = 6
    var12 = 3
    var13 = 7
    var14 = 8
    var15 = 31
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
  if CalledAs Jab123
    var15 = 19
    Button A
  elif CalledAs FTilt
    var15 = 27
    Stick (0.5) 0
    Button A
  elif CalledAs UTilt
    var15 = 28
    Stick 0 0.7
    Button A
  elif CalledAs DTilt
    var15 = 26
    Stick 0 (-0.7)
    Button A
  elif CalledAs FSmash
    var15 = 51
    Stick 1 0
    Button A
  elif CalledAs USmash
    var15 = 26
    Stick 0 1
    Button A
  elif CalledAs DSmash
    var15 = 52
    Stick 0 (-1)
    Button A
  elif CalledAs NSpecial
    var15 = 26
    Button B
  elif CalledAs SSpecial
    var15 = 58
    Stick 1 0
    Button B
  elif CalledAs USpecial
    var15 = 50
    Stick 0 1
    Button B
  elif CalledAs DSpecial
    var15 = 30
    Stick 0 (-1)
    Button B
  elif CalledAs Grab
    var15 = 31
    Button R|A
  endif
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
  // calculate own estimated position
  var17 = var13 - NumFrames + var1
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
  var22 = var13 - NumFrames + var1
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

if Equal HitboxConnected 1 && OKBSpeed > var16 && OFramesHitstun > 0
  var16 = OKBSpeed
endif

if CalledAs USmash
  AbsStick OPos
  if Equal NumFrames 5 && Equal var19 1
    var18 = 1
    var19 = 1
    Button B
    Call NSpecial
  endif 
endif

if FrameGE var15 || CurrAction <= 9 || !(Equal AirGroundState 1) || Equal HitboxConnected 1
  Call AIHub
endif
Return
Return
