#include <Definition_AIMain.h>
id 0x8100
unk 0x0

XReciever
SetAutoDefend 0
SetDisabledSwitch 1
if ODistLE 180
  SetDisabledMd 6
else
  SetDisabledMd -1
endif
var16 = 0
var21 = 0
DisableDebugOverlay
// XGoto PerFrameChecks
if Equal var8 0 && Equal var9 0
  XGoto RandomizeGoal
  XReciever
endif

label selectGoal
var22 = TopNX - var8
var17 = TopNY - var9
Norm var22 var22 var17
Abs var22
if var22 <= 8
  XGoto RandomizeGoal
  XReciever
  Seek selectGoal
  Jump
elif Equal var9 -1 
  XGoto RandomizeGoal
  XReciever
  Seek selectGoal
  Jump
endif

label navigateToGoal
XGoto PerFrameChecks
XReciever
Seek selectGoal
// MOD var22 AnimFrame 14
// if Equal var22 1 && OAnimFrame >= 2
//   EstOXCoord var8 10
//   EstOYCoord var9 10
// endif
  if Equal CurrAction 22 
    if Equal PrevAction 33
      Return
    elif AnimFrame <= 3
      Return
    endif
  elif CurrAction >= 24
    Return
  endif
var22 = XSpeed * 9
GetYDistFloorOffset var17 var22 110 0
GetYDistFloorOffset var22 var22 3 0
if var17 > 0
  var22 = TopNY + 3 - var22
  var17 = TopNY + 100 - var17
  if var22 < var17
    if Rnd < 0.15 && Rnd < 0.15 && Rnd < 0.15 
      CallI BoardPlatform
    elif var17 < var9
      CallI BoardPlatform
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
if Equal AirGroundState 2 && YSpeed < var22 && YDistBackEdge > -3 && !(OutOfStage) && !(Equal YSpeed 0) && AnimFrame > 4
  var1 = XDistBackEdge
  var0 = XDistFrontEdge
  if Equal Direction -1
    var1 *= -1
    var0 *= -1
  endif
  if TopNX < var8
    AbsStick 1 (-1)
  else
    AbsStick -1 (-1)
  endif
  if var0 < 5
    ClearStick
    AbsStick -1 (-1)
  elif var1 > -5
    ClearStick
    AbsStick 1 (-1)
  endif
  Button R
  Return
endif
if TopNX > var8
  AbsStick -1
else
  AbsStick 1
endif
var22 = TopNX - var8
Abs var22
if var22 <= 10 && Equal AirGroundState 1 && !(Equal CurrAction 10)
  ClearStick
  if TopNX > var8
    AbsStick -0.85
  else
    AbsStick 0.85
  endif
elif Equal CurrAction 1
  ClearStick
endif
if Equal AirGroundState 2 && !(OutOfStage) || Equal CurrAction 10
  var17 = 16
  var1 = XSpeed * var17
  GetYDistFloorOffset var0 var1 5 0
  // var22 = TopNY - var0 
  // DrawDebugLine TopNX TopNY TopNX var22 255 0 0 221
  if !(Equal var0 -1) 
    var0 = 0
  elif Equal DistBackEdge DistFrontEdge
    var0 = 2
  elif Equal var0 -1
    if var1 < 0
      var0 = 1
    elif var1 > 0
      var0 = -1
    endif
  else
    var0 = 0
  endif
  if !(Equal var0 0)
    AbsStick var0
    AbsStick var0
  endif
endif
var22 = XSpeed * 9 + TopNX
var22 -= var8
Abs var22
if var22 <= 15 && TopNY < var9
  var22 = var9 - TopNY
  if Equal AirGroundState 1
    var22 = var9 - 6
    var17 = 24 + TopNY
    if Equal CurrSubaction JumpSquat && var22 > var17
      Button X
      Goto jumpDirHandler
    elif TopNY < var22 && !(Equal CurrSubaction JumpSquat) 
      Button X
      Goto jumpDirHandler
    endif
  else
    var23 = 14 - AnimFrame
    if Equal var23 0
      var23 = 1
    endif 
    EstYCoord var17 var23
    var23 = var9 - 6
    if var17 < var23 && var22 < 25 && !(Equal YSpeed 0)
      var17 = GetJumpHeight / GetJumpLength
      var22 = var8 - TopNX
      Abs var22
      var23 = var9 - TopNY
      var22 /= var23
      if var22 <= var17
        Button X
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

  if var17 <= var8 && var8 <= var22
    CallI ShieldDrop
  endif
endif
Return
label jumpDirHandler
var22 = XSpeed * 15 + TopNX
var22 -= var8
ClearStick
if var22 > var8
  AbsStick -0.75
else
  AbsStick 0.75
endif
Return
Return
