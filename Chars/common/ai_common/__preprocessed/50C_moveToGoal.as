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
STACK_PUSH 6 0
STACK_PUSH 5 0
STACK_PUSH 17 0
STACK_PUSH 4 0
  XGoto GetChrSpecific
  //= XReciever
  var23 *= 0.5
  var3 += var23 
  Abs var4
  var4 += var5
  var23 = var4 - var5
  if XDistLE var23 var4
    var5 *= 2
  endif
  // xRange -= OWidth
  EstOYCoord var22 var3
  var22 -= OYCoord
  var7 = var14 //+ var22
  DrawDebugCircle var13 var7 3 255 0 0 136
else
  var3 = 9
  var5 = 10
  var4 = 10
  var6 = 0
  var7 = var14
endif
var4 *= Scale
var5 *= Scale
var6 *= Scale


var18 = LevelValue * 0.01
if var18 < 0.025
  var18 = 0.025
endif

var22 = TopNX - var13
var23 = TopNY - var7
Norm var22 var22 var23
Abs var22
if var22 <= 8 && Equal AirGroundState 1
  ClearStick
  Return
endif
var1 = GetJumpLength * var3
GetYDistFloorOffset var17 var1 110 0
GetYDistFloorOffset var22 var1 3 0
if var17 > 0 && var21 < 10.5
  var22 = TopNY + 3 - var22
  var17 = TopNY + 100 - var17
  if var21 >= 16 && var21 <= 17 && OFramesHitstun <= 0
  elif var22 < var17 && !(CalledFrom BoardPlatform)
    if CHANCE_MUL_LE PT_PLATCHANCE 1 
      JmpNextIfLabel
    elif var17 < var7 && CHANCE_MUL_LE PT_PLATCHANCE 1
      IfLabel
      Seek platSkill
      Jump
    endif
  endif
endif
GetAttribute var22 940 0
GetAttribute var17 72 0
var22 *= var17
GetAttribute var17 84 0
var22 += var17
GetAttribute var17 112 0
var22 = var22 - var17 * 3.5
GetYDistFloorOffset var17 0 4 0
if AnimFrame < 5 && Equal CurrAction 11
elif Equal AirGroundState 2 && YSpeed < var22 && YDistBackEdge > -1 && !(Equal var17 -1) && Rnd < var18
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

// LOGVAL_NL strv("YOLO")
// LOGVAL_NL xRange

Goto XStickMovement

var22 = GetJumpLength * var3 + TopNX
var22 -= var13
Abs var22
var23 = var5 * 3
// LOGVAL_NL anotherTempVar
if TopNY < var7
  if var22 <= var23 || Equal CurrSubaction JumpSquat
  var22 = 15
  XGoto GetChrSpecific
  //= XReciever
var2 = var22
    var22 = var7 - TopNY
    var1 = var2 * NumJumps * 1.2
    var23 = TopNY + var1
    DrawDebugLine TopNX TopNY TopNX var23 255 255 0 136
    if var22 < var1
      if Equal AirGroundState 1 
  var22 = 14
  XGoto GetChrSpecific
  //= XReciever
var1 = var22
        var17 = var1 + TopNY
        // globTempVar += 10
        if Equal CurrSubaction JumpSquat && var7 > var17
          Button X
          Goto jumpDirHandler
        elif TopNY < var7 && !(Equal CurrSubaction JumpSquat)
          Goto jumpPreCheck
        endif
      elif AnimFrame > 3
        var23 = TopNY + var2 - 5

        // if TotalYSpeed > 0
        //   immediateTempVar = TotalYSpeed / Gravity
        //   EstYCoord anotherTempVar immediateTempVar
        // endif

        // anotherTempVar += HurtboxSize
        // anotherTempVar -= yRange
        // DrawDebugCircle goalX anotherTempVar 3 

        if var23 < var7
          Goto isAirAttack
          if Equal var0 1 || Equal var20 -1
            Button X
            Goto jumpDirHandler
          endif
        endif
      endif
    endif
  endif
elif var22 <= 15 && TopNY > var7 && Equal IsOnPassableGround 1
  // #let djumpiness = var0
  // djumpiness = PT_DJUMPINESS

  // #let aggression = var1
  // aggression = PT_AGGRESSION


  var22 = XDistFrontEdge * Direction + 40
  var17 = XDistBackEdge * Direction - 40
  var22 += TopNX
  var17 += TopNX
  if var17 <= var13 && var13 <= var22
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
  if Equal AirGroundState 2 && !(OutOfStage)
    JmpNextIfLabel
  elif Equal CurrAction 10
    IfLabel
  var17 = 15
  var2 = XSpeed * var17
  GetYDistFloorOffset var1 var2 5 0
  // immediateTempVar = TopNY - goingOffstage 
  // DrawDebugLine TopNX TopNY TopNX immediateTempVar color(0xFF0000DD)
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
  

  var23 = TotalXSpeed * var3 + TopNX
  if var21 < 16 || Equal AirGroundState 1
    var23 = TopNX
  endif

  var23 -= var13
  var22 = var23
  Abs var23
  var23 -= var4
  Abs var23
  // anotherTempVar *= -1

  var0 = 1
  // LOGVAL_NL anotherTempVar

  if Equal AirGroundState 1 && !(Equal CurrAction 10) && Equal var1 0 && !(Equal var21 16.3)
    if var23 > 0 && var23 < var4 && var21 < 16.7
      var0 *= 0.72
    elif var21 >= 16.7 && DistToOEdge < 30
      var0 *= 0.72
    // elif anotherTempVar < 0
    //   stickMagnitude = 1
    elif var23 > var4 && Equal CurrAction 1 
      var0 = 0
    endif
  endif

  if var22 > 0
    var0 *= -1
  endif
  AbsStick var0
  
  // if Equal AirGroundState 1 && Equal isAerialAttack 0 && anotherTempVar < 0
  //   ClearStick
  // endif
  // if Equal isAerialAttack 0
  //   if Equal AirGroundState 1 && !(Equal CurrAction hex(0xA))
  //     if !(Equal currGoal cg_attack_wall)
  //       if currGoal >= cg_edgeguard && DistToOEdge < 35
  //         ClearStick
  //       endif
  //       if anotherTempVar > 0
  //         if TopNX > goalX
  //           AbsStick -0.72
  //         else
  //           AbsStick 0.72
  //         endif
  //       endif
  //     endif
  //   elif Equal CurrAction hex(0x1) && DistToOEdge < 10
  //     ClearStick
  //   endif
  // endif

  

  var17 = TopNX + Width * Direction * 0.5
  var23 = CharXSpeed * 2 + 3 * Direction
  var23 += var17
  GetColDistPosAbs var23 var17 var17 CenterY var23 CenterY 0
  if !(Equal var23 -1)
    ClearStick
    Goto jumpPreCheck
    Goto jumpDirHandler
  endif 
  
  if Equal AirGroundState 1
    if var21 >= 16.7
      var22 = var4 * 1.5
      var4 *= 0.5
      var23 = OPos * var22
      GetYDistFloorOffset var23 var23 15 0
      var17 = XSpeed * OPos
      if Equal var23 -1
        if Equal var1 0 && var20 >= 0
          if Equal YDistFloor -1
            Call RecoveryHub
          elif Equal CurrAction 3 || DistToOEdge < var4
            var16 = 3
            if DistToOEdge < 5
              var16 = 4
            endif
            CallI Wavedash
          elif True
            Goto stopMoveIfAhead
          endif
        elif True
          var17 = TopNX - var13
          Abs var17

  var22 = 15
  XGoto GetChrSpecific
  //= XReciever
var2 = var22
          var2 *= 2.25
          var22 = var7 - TopNY - var6 - OHurtboxSize
          // within 80 x units
          if var17 <= 80
            // within djump height
            if var22 < var2 && var22 > 0
              JmpNextIfLabel
            elif var17 > 60
              IfLabel
              if Equal CurrSubaction JumpSquat
                Goto jumpPreCheck
              else
                Goto jumpPreCheck
                Goto jumpDirHandler
              endif
            // within 30 x units and jumping and O more above ledge
            elif var22 > 40 && Equal CurrSubaction JumpSquat && var17 <= 45
              Goto jumpPreCheck
            // within 30 x units and O slightly above ledge
            elif var22 > 15 && var17 <= 20 
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
        var22 = Direction * 40
        GetYDistFloorOffset var22 var22 40 0
        if Equal var22 -1
          ClearStick
          if CurrAction >= 2 && CurrAction <= 9
            var16 = 3
            if DistToOEdge < 10
              var16 = 4
            endif
            CallI Wavedash
          endif
        else
          Button X
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
    var0 *= Direction * OPos
    if Equal var0 -1
      if !(Equal CurrAction 7) && !(Equal CurrAction 6)
        ClearStick
        Stick -1
      endif
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
ClearStick
if Equal AirGroundState 1
  GetAttribute var22 68 0
  var23 = GetJumpLength + var22
  var0 = GetJumpLength - var22

  var22 = var23 * var3 + TopNX  
  var22 -= var13
  var17 = var22
  Abs var17
  if var17 < 25
    AbsStick 1
  endif

  var22 = var0 * var3 + TopNX
  var22 -= var13
  var17 = var22
  Abs var17
  if var17 < 25
    AbsStick -1
  endif
else 
  GetAttribute var17 136 0
  var22 = var13 - TopNX
  var22 *= 0.05
  var22 = var22 / var17
  AbsStick var22
endif
Return
label handleWaveland
var16 = 5
XGoto Wavedash
// globTempVar = 1
// if XDistFrontEdge < 3 || XDistBackEdge > -3
//   globTempVar = -0.3
// elif XDistFrontEdge < 10 || XDistBackEdge > -10
//   globTempVar = 0.3
// elif XDistFrontEdge < 30 && XDistBackEdge > -30
//   globTempVar = 0.6
// endif
// if TopNX < goalX
//   AbsStick globTempVar (-0.5)
// else
//   globTempVar *= -1
//   AbsStick globTempVar (-0.5)
// endif
// immediateTempVar = goalX * Direction
// if XDistFrontEdge < 7 && XDistFrontEdge > 3 && immediateTempVar < 0
//   ClearStick
//   Stick globTempVar (-0.5)
// elif XDistBackEdge > -7  && XDistFrontEdge < -3 && immediateTempVar > 0
//   ClearStick
//   globTempVar *= -1
//   Stick globTempVar (-0.5)
// endif
// if Equal XDistBackEdge XDistFrontEdge
//   ClearStick
//   globTempVar = TopNX * -1
//   AbsStick globTempVar 0
// endif
// Button R
Return
label WDBackGrabLedge
if !(Equal AirGroundState 3)
  GetNearestCliff var0  
  var0 = TopNX - var0
  if Equal IsOnStage 1
    // wavedash back to ledge?
    var22 = XSpeed
    Abs var22
    var23 = var22
    var22 = 20 + var22 
    var17 = var0
    Abs var17
    if var17 < var22
      var17 = var0 * Direction
      if var17 < 20 && var17 > 0
        Stick -1
      elif var17 > -5 && var17 < 0 && var23 < 0.2
        Stick 1
      elif LastJumpSquatFrame && var17 < -5 && Equal CurrAction 10
        Button R
        GetAttribute var22 36 0
        var17 *= var22
        if var17 > -0.3
          var17 = -0.3
        endif
        Stick var17 (-0.75)
      elif var17 < 0 && !(Equal CurrAction 10)
        Button X
      elif CurrAction < 22 || CurrAction > 25
        Button X
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
