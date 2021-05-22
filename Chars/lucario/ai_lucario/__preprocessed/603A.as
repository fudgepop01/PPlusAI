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
  var5 = 0
  var6 = 0
  var22 = 4
  EstOYCoord var6 var22
  // if the opponent is in an actionable state, lower the estimate of
  // their x offset to prevent dashdancing from setting it off when very far away
  if OCurrAction <= 9 && var20 < 24641
    var22 /= 3
  endif
  EstOXCoord var5 var22
  var6 = var6 - (OSCDBottom - OTopNY)
  // correct if estimated y positions go beyond ground level
  // target
  var22 = OYDistBackEdge + OTopNY
  if var6 < var22 && Equal OIsOnStage 1
    var22 -= var6
    var6 += var22
  elif Equal OCurrAction 70 || Equal OCurrAction 74 || Equal OCurrAction 84 || Equal OCurrAction 85
    var6 += var22
  endif
  // DrawDebugRectOutline var5 var6 5 5 136 255 136 221

var5 -= TopNX
var6 -= TopNY

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
