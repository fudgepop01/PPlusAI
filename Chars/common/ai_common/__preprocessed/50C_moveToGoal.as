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

var22 = TopNX - var13
var23 = TopNY - var14
Norm var22 var22 var23
Abs var22
if var22 <= 8 && Equal AirGroundState 1
  ClearStick
  Return
endif
GetAttribute var17 76; 0
var22 = XSpeed * 10 * var17
GetYDistFloorOffset var17 var22 110 0
GetYDistFloorOffset var22 var22 3 0
if var17 > 0
  var22 = TopNY + 3 - var22
  var17 = TopNY + 100 - var17
  if var21 <= 16 && var21 <= 17
  elif var22 < var17
    var0 = PT_PLATCHANCE
    if Rnd < var0 && Rnd < var0
      label empty_0
      Goto PFC
      Seek empty_0
      if Rnd < var0
        CallI BoardPlatform
      endif
      Return
    elif var17 < var14 && Rnd < var0 && Rnd < var0
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
GetAttribute var22 940; 0
GetAttribute var17 72; 0
var22 *= var17
GetAttribute var17 84; 0
var22 += var17
GetAttribute var17 112; 0
var22 = var22 - var17 * 3.5
GetYDistFloorOffset var17 0 4 0
if Equal AirGroundState 2 && YSpeed < var22 && YDistBackEdge > -3 && !(Equal var17 -1) && !(Equal YSpeed 0) && Rnd < var0
  var22 = TopNX - var13
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
endif
GetAttribute var17 76; 0
var22 = XSpeed * 9 * var17 + TopNX
var22 -= var13
Abs var22
if var22 <= 25 || Equal CurrSubaction JumpSquat && TopNY < var14
  var22 = var14 - TopNY
  if Equal AirGroundState 1
  var22 = 14
  XGoto GetChrSpecific
  XReciever
var1 = var22
    var22 = var14
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
    var23 = var14 - 6
  var22 = 15
  XGoto GetChrSpecific
  XReciever
var2 = var22
    var22 = var14 - TopNY
    var1 = var2 * NumJumps * 2
    if var17 < var23 && var22 < var1 && !(Equal YSpeed 0)
      GetAttribute var17 136; 0
      GetAttribute var22 88; 0
      GetAttribute var23 72; 0
      var22 *= var23
      var17 = var17 / var22
      var22 = var13 - TopNX
      Abs var22
      EstYCoord var23 10
      var23 *= -1
      var23 += var14 
      var22 /= var23
      if var22 >= var17
  var22 = 100
  XGoto GetChrSpecific
  XReciever
var0 = var22
        if Equal var0 1 || Equal var20 -1
          Goto jumpDirHandler
        endif
      endif
    endif
  endif
elif var22 <= 15 && TopNY > var14 && Equal IsOnPassableGround 1
  var0 = PT_DJUMPINESS

  var1 = PT_AGGRESSION

  if Equal Direction 1 
    var22 = TopNX + XDistFrontEdge + 20
    var17 = TopNX + XDistBackEdge - 20
  else
    var22 = TopNX - XDistBackEdge - 20
    var17 = TopNX - XDistFrontEdge + 20
  endif

  if var17 <= var13 && var13 <= var22 && Rnd < var1
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
  if TopNX > var13
    AbsStick -1
  else
    AbsStick 1
  endif
  var22 = TopNX + XSpeed * 9 + 10 * Direction
  GetColDistPosAbs var22 var17 CenterX CenterY var22 CenterY 0
  if !(Equal var22 -1)
    ClearStick
    Goto jumpPreCheck
  endif 
  var22 = TopNX - var13
  Abs var22
  if var22 <= 8 && Equal AirGroundState 1 && !(Equal CurrAction 10)
    if CurrAction < 3 || Equal CurrAction 22 || Equal CurrAction 23 || Equal CurrAction 24 
      ClearStick
      if TopNX > var13
        AbsStick -0.65
      else
        AbsStick 0.65
      endif
    endif
  elif Equal CurrAction 1 && XDistBackEdge < -10 && XDistFrontEdge > 10
    ClearStick
  endif
  
  var22 = 0
  var22 = 100
  XGoto GetChrSpecific
  XReciever
  if Equal var21 16.5 && Equal AirGroundState 1
    var23 = Direction * 15
    GetYDistFloorOffset var23 var23 20 0
    var17 = XSpeed * Direction
    if Equal var23 -1
      if Equal var22 0
        if var17 > 0.1
          var16 = 3
          CallI Wavedash
        else
          ClearStick
        endif
      elif True
  var22 = 15
  XGoto GetChrSpecific
  XReciever
var2 = var22
        var22 = OTopNY - TopNY + OHurtboxSize
        if var22 >= var2 || !(XDistLE 40)
          Goto jumpPreCheck
        elif var22 > -15 && !(Equal CurrSubaction JumpSquat)
          Goto jumpPreCheck
        endif
      endif
    endif
  elif Equal IsOnStage 1
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
  var0 = PT_BAIT_WDASHAWAYCHANCE
  var0 *= 0.08
  MOD var22 AnimFrame 4
  if Equal var22 0 && Equal AirGroundState 1 && Rnd < var0 && LevelValue >= 75
    var16 = 5
    if XDistBackEdge > -15 || XDistFrontEdge < 15
      var16 = 4
    endif
    CallI Wavedash
  endif
Return
label jumpPreCheck
if 16 <= var21 && var21 <= 17
  var22 = 100
  XGoto GetChrSpecific
  XReciever
var0 = var22
  if Equal var0 1 && Equal AirGroundState 1
  var22 = 0.001
  XGoto GetChrSpecific
  XReciever
var0 = var22
    if Equal var0 -1 && Equal Direction OPos
      ClearStick
      Stick -1
    elif Equal var0 1 && !(Equal Direction OPos)
      ClearStick
      Stick -1
    else
      Goto jumpDirHandler
    endif
  elif Equal OIsOnStage 0 || !(SamePlane)
    Goto jumpDirHandler
  endif
else
  Goto jumpDirHandler
endif
Return
label jumpDirHandler
Button X
if Equal AirGroundState 1
  GetAttribute var17 76; 0
  var22 = XSpeed * 10 * var17 + TopNX
  ClearStick
  
  var22 -= var13
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
  GetAttribute var17 136; 0
  var22 = var13 - TopNX
  var22 *= 10
  var22 = var22 * 1 / var17
  AbsStick var22
endif
Return
label handleWaveland
var17 = 1
if XDistFrontEdge < 30 && XDistBackEdge > -30
  var17 = 0.6
endif
if XDistFrontEdge < 10 || XDistBackEdge > -10
  var17 = 0.3
endif
if TopNX < var13
  AbsStick var17 (-1)
else
  var17 *= -1
  AbsStick var17 (-1)
endif
var22 = var13 * Direction
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
