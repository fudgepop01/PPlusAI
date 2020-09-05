#include <Definition_AIMain.h>
//TrueID=0x6040
id 0x6040

//Set Unknown
unk 0x50000

//Strings



// sets up offsets to get to target position
if Equal var18 0
  if CalledAs NAir
    var20 = 24641
    var9 = 11
    var10 = -2
    var11 = 20
    var12 = 10
    var13 = 20
  elif CalledAs FAir
    var20 = 24642
    var9 = 8
    var10 = -3
    var11 = 9
    var12 = 11
    var13 = 25
  elif CalledAs BAir
    var20 = 24643
    var9 = -5
    var10 = -5
    var11 = 10
    var12 = 10
    var13 = 13
  elif CalledAs UAir
    var20 = 24644
    var9 = 5
    var10 = -10
    var11 = 20
    var12 = 10
    var13 = 10
  elif CalledAs DAir
    var20 = 24645
    var9 = 0
    var10 = 10
    var11 = 20
    var12 = 13
    var13 = 19
  else
    Call AIHub
  endif
  Call ApproachHub
elif Equal AirGroundState 2
  ClearStick
  var14 = 45
  if CalledAs FAir
    var14 = 36
    Stick (0.5) 0
  elif CalledAs BAir
    var14 = 29
    Stick (-0.5) 0
  elif CalledAs UAir
    var14 = 30
    Stick 0 (0.5)
  elif CalledAs DAir
    var14 = 38
    Stick 0 (-0.5)
  endif
  Button A
  Seek ExecuteAttack
else
  Call AIHub
endif
Return

label ExecuteAttack
if FrameGE 1
  DrawDebugPoint TopNX TopNY 255 0 0 85
  if Equal CurrAction 7
    var5 = OTopNX + (var9 * Direction)
  else
    var5 = OTopNX + (var9 * Direction * -1)
  endif
  var6 = OTopNY + var10
  // account for target's & own velocity
  var5 = var5 + (OXSpeed * 10) - (XSpeed * var13 / 2)
  if YSpeed < 0.10 && YDistFloor > 10 && TopNY > OTopNY
    var6 = var6 + (OYSpeed * var13 / 2) - ((YSpeed - 1) * var13 / 2) + OHurtboxSize
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


  if YSpeed < 0 && YDistFloor < 25 && YDistFloor >= 0
    var19 = 2
    var18 = 1
    Call Landing
  endif
endif
Return
Return
