#include <Definition_AIMain.h>
id 0x850C
unk 0x0

//= XReciever

NoRepeat
//= XReciever
if CalledAs ExecuteAttack
  Goto XStickMovement
  Return
endif

if Equal var21 16.72
  Goto WDBackGrabLedge
  Return
endif

if !(Equal var20 -1)
  var22 = 19
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 23 0
STACK_PUSH 3 0
STACK_PUSH 5 0
STACK_PUSH 4 0
STACK_PUSH 17 0
STACK_PUSH 17 0
  XGoto GetChrSpecific
  //= XReciever
  var23 *= 0.5
  var3 += var23
  var4 *= 0.5
  var23 = OWidth * 0.5
  var4 += var23
  var5 *= 0.5
  EstOYCoord var22 var3
  var22 -= OYCoord
  var6 = var14 + var22
else
  var3 = 9
  var4 = 10
  var5 = 0
  var6 = var14
endif


var18 = LevelValue * 0.01
if var18 < 0.1
  var18 = 0.1
endif

var22 = TopNX - var13
var23 = TopNY - var6
Norm var22 var22 var23
Abs var22
if var22 <= 8 && Equal AirGroundState 1
  ClearStick
  Return
endif
GetAttribute var17 76; 0
var1 = XSpeed * var3 * var17
GetYDistFloorOffset var17 var1 110 0
GetYDistFloorOffset var22 var1 3 0
if var17 > 0 && var21 < 10.5
  var22 = TopNY + 3 - var22
  var17 = TopNY + 100 - var17
  if var21 >= 16 && var21 <= 17
  elif var22 < var17 && !(CalledFrom BoardPlatform)
    var0 = PT_PLATCHANCE
    if Rnd < var0
      Seek platSkill
      Jump
    elif var17 < var6 && Rnd < var0
      Seek platSkill
      Jump
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
if Equal AirGroundState 2 && YSpeed < var22 && YDistBackEdge > -3 && !(Equal var17 -1) && !(Equal YSpeed 0) && Rnd < var18
  var22 = TopNX - var13
  Abs var22
  if var22 > 15 && Equal IsOnStage 1
    if CurrAction >= 11 && CurrAction <= 13
      if AnimFrame >= 10
        Goto handleWaveland
        Return
      endif
    else
      Goto handleWaveland
      Return
    endif
  endif
endif

Goto XStickMovement

GetAttribute var17 76; 0
var22 = XSpeed * var3 * var17 + TopNX
var22 -= var13
Abs var22
if var22 <= var4 || Equal CurrSubaction JumpSquat && TopNY < var6
  var22 = 15
  XGoto GetChrSpecific
  //= XReciever
var2 = var22
  var22 = var6 - TopNY
  var1 = var2 * NumJumps * 1.2 + var5 + HurtboxSize
  if var22 < var1
    if Equal AirGroundState 1 
  var22 = 14
  XGoto GetChrSpecific
  //= XReciever
var1 = var22
      var17 = var1 + TopNY + var5
      // var17 += 10
      if Equal CurrSubaction JumpSquat && var6 > var17
        Button X
        Goto jumpDirHandler
      elif TopNY < var6 && !(Equal CurrSubaction JumpSquat)
        Goto jumpPreCheck
      endif
    elif AnimFrame > 3
      var23 = TopNY + var2 - 5
      if YSpeed > 0
        var22 = YSpeed / Gravity
        EstYCoord var23 var22
      endif
      var23 -= HurtboxSize
      var23 += var5           
      if var23 < var6
        Goto isAirAttack
        if Equal var0 1 || Equal var20 -1
          Button X
          Goto jumpDirHandler
        endif
      endif
    endif
  endif
elif var22 <= 15 && TopNY > var6 && Equal IsOnPassableGround 1
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
    XGoto PerFrameChecks
    Seek empty_2
    if Rnd < var18
      CallI ShieldDrop
    endif
    Return
  endif
endif
Return
label XStickMovement
if Equal CurrSubaction JumpSquat
  Goto jumpDirHandler
else
  Goto stickMovement
  if var21 <= 11 && LevelValue >= 60
  var22 = 12
  XGoto GetChrSpecific
  //= XReciever
var1 = var22
    var1 -= 1
    if Equal CurrAction 3 && AnimFrame >= var22 && AnimFrame < 16
      ClearStick
    endif
  endif
endif
if var21 < 16.7
  if Equal AirGroundState 2 && !(OutOfStage) || Equal CurrAction 10
  var17 = 15
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
    if !(Equal var1 0)
      AbsStick var1
      AbsStick var1
      Return
    endif
  endif
endif
Return
label stickMovement
  

  Goto isAirAttack
  var1 = var0
  

  var23 = XSpeed * var3 + TopNX
  if var21 < 16 || Equal var1 0
    var23 = TopNX
  endif
  
  if var23 > var13
    AbsStick -1
  else
    AbsStick 1
  endif
  if Equal AirGroundState 1 && Equal var1 0
    var23 -= var13
    Abs var23
    if Equal CurrAction 3 && var23 < 20
      ClearStick
    elif var23 < 10
      ClearStick
    endif
  endif

  var17 = TopNX + Width * Direction * 0.5
  var23 = XSpeed * 2 + 3 * Direction
  var23 += var17
  GetColDistPosAbs var23 var17 var17 CenterY var23 CenterY 0
  if !(Equal var23 -1) && var21 < 16.7
    ClearStick
    Button X
    Goto jumpDirHandler
  endif 
  var23 = TopNX - var13
  Abs var23
  if var23 < 20 && Equal AirGroundState 1 && !(Equal CurrAction 10)
    if Equal CurrAction 3 || Equal CurrAction 22 || Equal CurrAction 23 || Equal CurrAction 24 
      ClearStick
    endif
    if !(Equal var21 16.3)
      if TopNX > var13
        AbsStick -0.65
      else
        AbsStick 0.65
      endif
    endif
  elif Equal CurrAction 1 && XDistBackEdge < -10 && XDistFrontEdge > 10
    ClearStick
  endif
  
  if Equal AirGroundState 1
    if Equal var21 16.7
      var22 = 15
      if OXDistBackEdge < 20 && OYDistBackEdge > -10
        var22 = 40
      endif
      var23 = OPos * var22
      GetYDistFloorOffset var23 var23 15 0
      var17 = XSpeed * OPos
      if Equal var23 -1
        if Equal var1 0
          if Equal YDistFloor -1
            Call RecoveryHub
          elif var17 > 0.1
            var16 = 3
            if XDistFrontEdge < 5
              var16 = 4
            endif
            CallI Wavedash
          elif True
            Goto stopMoveIfAhead
          endif
        elif True
          var17 = TopNX - var13
          Abs var17

          // within 80 x units
          if var17 <= 80
  var22 = 15
  XGoto GetChrSpecific
  //= XReciever
var2 = var22
            var22 = var6 - TopNY - var5 - OHurtboxSize
            // within djump height
            if var22 < var2 || var17 > 60
              if Equal CurrSubaction JumpSquat
                Goto jumpPreCheck
              else
                Goto jumpPreCheck
                Goto jumpDirHandler
              endif
            // within 30 x units and jumping and O more above ledge
            elif var6 < 40 && Equal CurrSubaction JumpSquat && var17 <= 35
              Goto jumpPreCheck
            // within 30 x units and O slightly above ledge
            elif var6 < 15 && var17 <= 30 
            elif True
              Goto stopMoveIfAhead
            endif
            Return
          endif
          Goto stopMoveIfAhead

        endif
      endif
    else
      var22 = Direction * 15
      GetYDistFloorOffset var22 var22 5 0
      var17 = XSpeed * Direction
      if Equal var22 -1 && var17 > 0.05
        ClearStick
        if CurrAction >= 2 && CurrAction <= 9
          var16 = 3
          if XDistFrontEdge < 10
            var16 = 4
          endif
          CallI Wavedash
        endif
      endif
      if Equal CurrAction 8
        var16 = 1
        CallI Wavedash
      endif
    endif
  endif
Return
label stopMoveIfAhead
  var22 = var13 - TopNX
  var22 *= OPos
  if var22 >= 0
    ClearStick 
  endif
Return
label jumpPreCheck
if CalledFrom ExecuteAttack
  SeekNoCommit jpc_if
elif 16 <= var21 && var21 <= 17
  if (!True)
    label jpc_if
  endif
  Goto isAirAttack
  if Equal var0 1 && Equal AirGroundState 1
  var22 = 0.001
  XGoto GetChrSpecific
  //= XReciever
var0 = var22
    if Equal var0 -1 && Equal Direction OPos
      ClearStick
      Stick -1
    elif Equal var0 1 && !(Equal Direction OPos)
      ClearStick
      Stick -1
    else
      Button X
    endif
  elif Equal OIsOnStage 1 && !(SamePlane)
    Button X
  endif
else
  Button X
endif
Return
label jumpDirHandler
if Equal AirGroundState 1
  GetAttribute var17 76; 0
  var22 = XSpeed * var3 * var17 + TopNX
  ClearStick
  
  var22 -= var13
  var17 = var22
  Abs var17

  if LevelValue >= 60 && Rnd < 0.9 && Equal CurrAction 3 && AnimFrame >= 8 
  elif var17 < 4
  elif var22 < 0
    AbsStick 1
  else
    AbsStick -1
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
if XDistFrontEdge < 3 || XDistBackEdge > -3
  var17 = -0.3
elif XDistFrontEdge < 10 || XDistBackEdge > -10
  var17 = 0.3
elif XDistFrontEdge < 30 && XDistBackEdge > -30
  var17 = 0.6
endif
if TopNX < var13
  AbsStick var17 (-1)
else
  var17 *= -1
  AbsStick var17 (-1)
endif
var22 = var13 * Direction
if XDistFrontEdge < 7 && XDistFrontEdge > 3 && var22 < 0
  ClearStick
  Stick var17 (-1)
elif XDistBackEdge > -7  && XDistFrontEdge < -3 && var22 > 0
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
label WDBackGrabLedge
if !(Equal AirGroundState 3)
  GetNearestCliff var0  
  var0 = TopNX - var0
  if Equal IsOnStage 1 && !(Equal DistBackEdge DistFrontEdge)
    // wavedash back to ledge?
    var22 = XSpeed
    Abs var22
    var22 = 20 + var22 
    var17 = var0
    Abs var17
    if var17 < var22
      var17 = var0 * Direction
      if var17 < 20 && var17 > 0
        Stick -1
        Return
      elif var17 > -5 && var17 < 0
        Stick 1
        Return
      elif YDistBackEdge > -1 && InAir && var17 < -5 && Equal IsOnStage 1
        Button R
        GetAttribute var22 36; 0
        var17 *= var22
        if var17 > -0.3
          var17 = -0.3
        endif
        Stick var17 (-0.75)
      elif var17 < 0 && !(Equal CurrAction 10) && Equal IsOnStage 1
        if CurrAction >= 22 && CurrAction <= 25
        else
          Button X
        endif
      endif
    else
      AbsStick OPos
      if Equal CurrAction 1
        ClearStick
      endif
    endif
  elif Equal IsFastfalling 1
    Stick 1
  else
    Stick 1 (-1)
  endif
endif
Return
label platSkill
  XGoto PerFrameChecks
  Seek platSkill
  if Rnd < var18
    Call BoardPlatform
  endif
Return
label isAirAttack
  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var0 = var22
Return
Return
