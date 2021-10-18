#include <Definition_AIMain.h>
id 0x8100
unk 0x0


XReciever
SetAutoDefend 0
SetDisabledSwitch 1
SetDebugMode 1

if ODistLE 180
  SetDisabledMd 6
else
  SetDisabledMd -1
endif
DisableDebugOverlay
var16 = 0
if Equal var21 3
  CallI RecoveryHub
endif

DynamicDiceClear
if Rnd < 0.4
  DynamicDiceAdd 7
endif
if Rnd < 0.8
  DynamicDiceAdd 10
endif
DynamicDiceRoll var21
if Equal var21 -1
  var21 = 0
endif

label initial
Goto PFC
Seek initial
if Equal var8 0 && Equal var9 0
  XGoto GoalChoiceHub
  XReciever
endif

  if Equal CurrAction 22 
    if Equal PrevAction 33
      Return
    elif AnimFrame <= 3
      Return
    endif
  elif CurrAction >= 24
    Return
  endif
var0 = LevelValue * 0.01
if var0 < 0
  var0 = 0.05
endif
LOGSTR 1414753024 1768713216 0 0 0
LOGVAL var0
label tskillWait
Goto PFC
XReciever
Seek tskillWait
if Rnd < var0
  Seek selectGoal
  Jump
endif
LOGSTR 2002872576 1953066496 1728053248 0 0
Return
label selectGoal
XGoto UpdateGoal
XReciever
if Equal var9 BBoundary
  Seek selectGoal
  Jump
endif
LOGSTR 1936026624 1701016576 1701052416 0 0
label navigateToGoal
Goto PFC
XReciever
Seek selectGoal
LOGSTR 1851880960 1768382720 1953066496 1728053248 0
var22 = TopNX - var8
var23 = TopNY - var9
Norm var22 var22 var23
Abs var22
if var22 <= 8 && Equal AirGroundState 1
  ClearStick
  Return
endif
var22 = XSpeed * 12
GetYDistFloorOffset var17 var22 110 0
GetYDistFloorOffset var22 var22 3 0
if var17 > 0
  var22 = TopNY + 3 - var22
  var17 = TopNY + 100 - var17
  if var22 < var17
    if Rnd < 0.15 && Rnd < 0.15 && Rnd < 0.15
      label
      Goto PFC
      if Rnd < var0
        CallI BoardPlatform
      endif
      Return
    elif var17 < var9
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
endif
var22 = XSpeed * 9 + TopNX
var22 -= var8
Abs var22
if var22 <= 15 && TopNY < var9
  var22 = var9 - TopNY
  if Equal AirGroundState 1
    var22 = var9 - 6
    var17 = 16 + TopNY
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
    if var17 < var23 && var22 < 38 && !(Equal YSpeed 0)
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
label handleWaveland
if TopNX < var8
  AbsStick 1 (-1)
else
  AbsStick -1 (-1)
endif
if XDistFrontEdge < 5
  ClearStick
  Stick -1 (-1)
elif XDistBackEdge > -5
  ClearStick
  Stick 1 (-1)
endif
Button R
Return
Return
