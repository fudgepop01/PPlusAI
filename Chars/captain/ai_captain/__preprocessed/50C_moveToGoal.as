#include <Definition_AIMain.h>
id 0x850C
unk 0x0

XReciever

if CalledAs ExecuteAttack
  Goto stickMovement
  Return
endif

var0 = LevelValue * 0.01
if var0 < 0
  var0 = 0.05
endif

LOGSTR 1851880960 1768382720 1953066496 1728053248 0
var22 = TopNX - var8
var23 = TopNY - var9
Norm var22 var22 var23
Abs var22
if var22 <= 8 && Equal AirGroundState 1
  ClearStick
  Return
endif
var22 = XSpeed * 10
GetYDistFloorOffset var17 var22 110 0
GetYDistFloorOffset var22 var22 3 0
if var17 > 0
  var22 = TopNY + 3 - var22
  var17 = TopNY + 100 - var17
  if var22 < var17 && !(Equal var21 16)
    if Rnd < 0.1 && Rnd < 0.1
      label
      Goto PFC
      if Rnd < var0
        CallI BoardPlatform
      endif
      Return
    elif var17 < var9 && Rnd < 0.1 && Rnd < 0.1
      label
      Goto PFC
      if Rnd < var0
        CallI BoardPlatform
      endif
      Return
    endif
  endif
endif
GetAttribute var22 12 0
GetAttribute var17 14 0
var22 *= var17
GetAttribute var17 17 0
var22 += var17
GetAttribute var17 25 0
var22 = var22 - var17 * 3.5
GetYDistFloorOffset var17 0 4 0
if Equal AirGroundState 2 && YSpeed < var22 && YDistBackEdge > -3 && !(Equal var17 -1) && !(Equal YSpeed 0) && Rnd < var0
  if CurrAction >= 11 && CurrAction <= 13
    if AnimFrame >= 4
      Goto handleWaveland
      Return
    endif
  else
    Goto handleWaveland
    Return
  endif
endif
Goto stickMovement
if Equal AirGroundState 2 && !(OutOfStage) || Equal CurrAction 10
  var17 = 16
  var2 = XSpeed * var17
  GetYDistFloorOffset var1 var2 5 0
  // var22 = TopNY - var1 
  // DrawDebugLine TopNX TopNY TopNX var22 255 0 0 221
  if !(Equal var1 -1) 
    var1 = 0
  elif Equal DistBackEdge DistFrontEdge
    var1 = 2
  elif Equal var1 -1
    if var2 < 0
      var1 = 1
    elif var2 > 0
      var1 = -1
    endif
  else
    var1 = 0
  endif
  if !(Equal var1 0) && Rnd < var0
    AbsStick var1
    AbsStick var1
  endif
elif Equal AirGroundState 1
  var22 = XSpeed * 10
  GetYDistFloorOffset var22 var22 3 0
  if Equal var22 -1
    ClearStick
    var22 = Direction * -1
    AbsStick var22
  endif
endif
var22 = XSpeed * 9 + TopNX
var22 -= var8
Abs var22
if var22 <= 15 && TopNY < var9
  var22 = var9 - TopNY
  if Equal AirGroundState 1
    var22 = var9
    var17 = 15 + TopNY
    if Equal CurrSubaction JumpSquat && var22 > var17
      Goto jumpPreCheck
    elif TopNY < var22 && !(Equal CurrSubaction JumpSquat) 
      Goto jumpPreCheck
    endif
  else
    var23 = 14 - AnimFrame
    if Equal var23 0
      var23 = 1
    endif
    EstYCoord var17 var23
    var23 = var9 - 6
    var1 = 28 * NumJumps
    if var17 < var23 && var22 < var1 && !(Equal YSpeed 0)
      var17 = GetJumpHeight / GetJumpLength
      var22 = var8 - TopNX
      Abs var22
      var23 = var9 - TopNY
      var22 /= var23
      if var22 <= var17
if !(True) || Equal var20 14|| Equal var20 15|| Equal var20 16|| Equal var20 17|| Equal var20 18|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22
          Button X
        endif
      endif
    endif
  endif
elif var22 <= 15 && TopNY > var9 && Equal IsOnPassableGround 1
  if Equal Direction 1 
    var22 = TopNX + XDistFrontEdge
    var17 = TopNX + XDistBackEdge
  else
    var22 = TopNX - XDistBackEdge
    var17 = TopNX - XDistFrontEdge
  endif

  if var17 <= var8 && var8 <= var22 && Rnd < 0.2 && Rnd < 0.75
    label
    Goto PFC
    if Rnd < var0
      CallI ShieldDrop
    endif
    Return
  endif
endif
Return
label PFC
XGoto PerFrameChecks
XReciever
Return
label stickMovement
  if TopNX > var8
    if Equal Direction 1 && Equal CurrAction 4 && LevelValue >= 48
      var16 = 1
      CallI Wavedash
    endif
    GetYDistFloorOffset var22 -8 0 0
    if !(Equal var22 -1) 
      AbsStick -1
    elif XDistBackEdge > -4
      AbsStick 0.65
    endif
  elif True
    if Equal Direction -1 && Equal CurrAction 4 && LevelValue >= 48
      var16 = 1
      CallI Wavedash
    endif
    GetYDistFloorOffset var22 8 0 0
    if !(Equal var22 -1) 
      AbsStick 1
    elif XDistBackEdge > -4
      AbsStick -0.65
    endif
  endif
  var22 = TopNX - var8
  Abs var22
  if var22 <= 15 && Equal AirGroundState 1 && !(Equal CurrAction 10)
    if CurrAction < 3 || Equal CurrAction 22 || Equal CurrAction 23 || Equal CurrAction 24 
      ClearStick
      if TopNX > var8
        AbsStick -0.65
      else
        AbsStick 0.65
      endif
    endif
  elif Equal CurrAction 1 && YDistBackEdge < -10 && YDistFrontEdge > 10
    ClearStick
  endif
  var22 = CharXSpeed * 8 + 5 * Direction
  GetYDistFloorOffset var22 var22 10 0
  if Equal var22 -1 && CurrAction > 2 && FramesHitstun <= 0 && Equal AirGroundState 1
    ClearStick
    var16 = 4
    Call Wavedash
  endif
Return
label jumpPreCheck
if Equal var21 16
if !(True) || Equal var20 14|| Equal var20 15|| Equal var20 16|| Equal var20 17|| Equal var20 18|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22
    Goto jumpDirHandler
  endif
else
  Goto jumpDirHandler
endif
Return
label jumpDirHandler
Button X
var22 = XSpeed * 15 + TopNX
var22 -= var8
ClearStick
if var22 > var8
  AbsStick -1
else
  AbsStick 1
endif
Return
label handleWaveland
var17 = 1
if XDistFrontEdge < 30 && XDistBackEdge > -30
  var17 = 0.6
endif
if TopNX < var8
  AbsStick var17 (-1)
else
  var17 *= -1
  AbsStick var17 (-1)
endif
var22 = var8 * Direction
if XDistFrontEdge < 7 && var22 < 0
  LOGSTR 1463899648 1162625280 1313087488 1179799296 1314127872
  ClearStick
  Stick var17 (-1)
elif XDistBackEdge > -7 && var22 > 0
  LOGSTR 1463899648 1162625280 1313087488 1111573248 1258291200
  ClearStick
  var17 *= -1
  Stick var17 (-1)
endif
if Equal XDistBackEdge XDistFrontEdge
  ClearStick
  var17 = TopNX * -1
  AbsStick var17 0
endif
Button R
Return
Return