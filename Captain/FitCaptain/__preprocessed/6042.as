// Knee

#include <Definition_AIMain.h>
//TrueID=0x6031
id 0x6031

//Set Unknown
unk 0x0

if Equal var18 0
  var9 = 8
  var10 = 0
  var11 = 11
  var12 = 15
  var13 = 23
  var20 = 24625
  if Equal var21 2 && OFramesHitstun < 1
    Call DefendHub
  else
    Call ApproachHub
  endif
else
  if Equal var19 254 && OYDistFloor < 10
    if YSpeed < 0
      Stick 0 (-1)
    endif
    if YDistFloor > 15 || YSpeed > 0
      Call ApproachHub
    endif
  endif
  var14 = 36
  Stick 1 0
  Button A
  Seek executeAttack
endif
Return

label executeAttack
  DrawDebugPoint TopNX TopNY 255 0 0 85
  if Equal CurrAction 7
    var5 = OTopNX + (var9 * Direction)
  else
    var5 = OTopNX + (var9 * Direction * -1)
  endif
  var6 = OTopNY + var10
  // account for target's & own velocity
  var5 = var5 + (OXSpeed * 10) - (XSpeed * var13 / 2)
  if YSpeed < 0.20 && YDistFloor > 10 && TopNY > OTopNY
    var6 = var6 + (OYSpeed * (var13 + 3) / 2) - ((YSpeed - 1) * (var13 + 3) / 2) + OHurtboxSize + 3
  elif YDistFloor > 10
    var6 = var6 + (OYSpeed * var13 / 2) - ((YSpeed - 0.5) * var13 / 2)
  else
    var6 = var6 + (OYSpeed * var13 / 2) - (YSpeed * var13 / 2)
  endif
  if Equal PlayerNum 0
    DrawDebugRectOutline var5 var6 var11 var12 255 0 0 85
  elif Equal PlayerNum 1
    DrawDebugRectOutline var5 var6 var11 var12 0 0 255 85
  elif Equal PlayerNum 2
    DrawDebugRectOutline var5 var6 var11 var12 255 255 0 85
  elif Equal PlayerNum 3
    DrawDebugRectOutline var5 var6 var11 var12 0 255 0 85
  else
    DrawDebugRectOutline var5 var6 var11 var12 0 0 0 85
  endif
  DrawDebugPoint var5 var6 255 0 0 85
  var5 = var5 - TopNX
  var6 = var6 - TopNY


if Equal AirGroundState 1 || Equal YDistFloor -1 || AnimFrame >= var14
  Call AIHub
endif

if var5 < 0
  AbsStick (-1)
else
  AbsStick 1
endif

if Equal HitboxConnected 1 && OFramesHitstun > 0
  var15 = AnimFrame
endif


if YSpeed < 0 && YDistFloor < 10 && YDistFloor >= 0
  var19 = 2
  var18 = 1
  Call Landing
endif
Return
Return

