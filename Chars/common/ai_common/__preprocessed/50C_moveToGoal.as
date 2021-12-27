#include <Definition_AIMain.h>
id 0x850C
unk 0x0

XReciever

XGoto PerFrameChecks
XReciever
if CalledAs ExecuteAttack
  Goto stickMovement
  Return
endif

var0 = LevelValue * 0.01
if var0 < 0.1
  var0 = 0.1
endif

var22 = TopNX - var8
var23 = TopNY - var9
Norm var22 var22 var23
Abs var22
if var22 <= 8 && Equal AirGroundState 1
  ClearStick
  Return
endif
GetAttribute var17 15 0
var22 = XSpeed * 10 * var17
GetYDistFloorOffset var17 var22 110 0
GetYDistFloorOffset var22 var22 3 0
if var17 > 0
  var22 = TopNY + 3 - var22
  var17 = TopNY + 100 - var17
  if var21 <= 16 && var21 <= 17
  elif var22 < var17
  var10 = 9
  XGoto GetChrSpecific
  XReciever
  var0 = var10
    if Rnd < var0 && Rnd < var0
      label empty_0
      Goto PFC
      Seek empty_0
      if Rnd < var0
        CallI BoardPlatform
      endif
      Return
    elif var17 < var9 && Rnd < var0 && Rnd < var0
      label empty_1
      Goto PFC
      Seek empty_1
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
  var22 = TopNX - var8
  Abs var22
  if var22 > 15 && Equal IsOnStage 1
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
endif
Goto stickMovement
if Equal AirGroundState 2 && !(OutOfStage) || Equal CurrAction 10
  var17 = 20
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
  if !(Equal var1 0) && !(Equal var21 16.5)
    AbsStick var1
    AbsStick var1
    Return
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
GetAttribute var17 15 0
var22 = XSpeed * 9 * var17 + TopNX
var22 -= var8
Abs var22
if var22 <= 25 || Equal CurrSubaction JumpSquat && TopNY < var9
  var22 = var9 - TopNY
  if Equal AirGroundState 1
    var22 = var9
  var10 = 14
  XGoto GetChrSpecific
  XReciever
  var1 = var10
    var17 = var1 + TopNY
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
  var10 = 15
  XGoto GetChrSpecific
  XReciever
  var2 = var10
    var1 = var2 * NumJumps * 2
    if var17 < var23 && var22 < var1 && !(Equal YSpeed 0)
      GetAttribute var17 31 0
      GetAttribute var22 18 0
      GetAttribute var23 14 0
      var22 *= var23
      var17 = var17 / var22
      var22 = var8 - TopNX
      Abs var22
      EstYCoord var23 10
      var23 *= -1
      var23 += var9 
      var22 /= var23
      if var22 >= var17
  var10 = 100
  XGoto GetChrSpecific
  XReciever
  var0 = var10
        if Equal var0 1 || Equal var20 -1
          Goto jumpDirHandler
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

  var10 = 1
  XGoto GetChrSpecific
  XReciever
  var0 = var10

  var10 = 3
  XGoto GetChrSpecific
  XReciever
  var1 = var10

  if var17 <= var8 && var8 <= var22 && Rnd < var1
    label empty_2
    Goto PFC
    Seek empty_2
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
    AbsStick -1
  else
    AbsStick 1
  endif
  var22 = TopNX - var8
  Abs var22
  if var22 <= 8 && Equal AirGroundState 1 && !(Equal CurrAction 10)
    if CurrAction < 3 || Equal CurrAction 22 || Equal CurrAction 23 || Equal CurrAction 24 
      ClearStick
      if TopNX > var8
        AbsStick -0.65
      else
        AbsStick 0.65
      endif
    endif
  elif Equal CurrAction 1 && XDistBackEdge < -10 && XDistFrontEdge > 10
    ClearStick
  endif
  if !(Equal var21 16.5) && Equal IsOnStage 1
    var22 = 0
  var10 = 100
  XGoto GetChrSpecific
  XReciever
  var22 = var10
    if Equal var22 1
    else
      var22 = Direction * 10
      GetYDistFloorOffset var22 var22 20 0
      var17 = XSpeed * Direction
      if Equal var22 -1 && var17 > 0.05
        ClearStick
        if CurrAction >= 2 && CurrAction <= 9
          var16 = 4
          CallI Wavedash
        endif
      endif
    endif
  endif
Return
label jumpPreCheck
if 16 <= var21 && var21 <= 17
  var10 = 100
  XGoto GetChrSpecific
  XReciever
  var0 = var10
  if Equal var0 1
    Goto jumpDirHandler
  endif
else
  Goto jumpDirHandler
endif
Return
label jumpDirHandler
Button X
if Equal AirGroundState 1
  GetAttribute var17 15 0
  var22 = XSpeed * 15 * var17 + TopNX
  ClearStick
  
  var22 -= var8
  var17 = var22
  Abs var17

  if LevelValue >= 60 && Rnd < 0.9 && Equal CurrAction 3 && AnimFrame >= 8 
  elif var17 < 18
  elif var22 < 0
    AbsStick -1
  else
    AbsStick 1
  endif
else 
  ClearStick
  GetAttribute var17 31 0
  var22 = var8 - TopNX
  var22 *= 15
  var22 = var22 * 1 / var17
  AbsStick var22
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
  ClearStick
  Stick var17 (-1)
elif XDistBackEdge > -7 && var22 > 0
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
