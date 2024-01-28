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

if Equal currGoal cg_edgeguard_ledge
  Goto WDBackGrabLedge
  Return
endif

#let hitFrame = var3
#let xOffset = var4
#let xRange = var5
#let yRange = var6
#let simGoalY = var7
if !(Equal lastAttack -1)
  GET_MOVE_DATA(globTempVar, xOffset, globTempVar, xRange, yRange, hitFrame, anotherTempVar, globTempVar, globTempVar, globTempVar, globTempVar, globTempVar)
  anotherTempVar *= 0.5
  hitFrame += anotherTempVar 
  // xRange -= OWidth
  xOffset += xRange
  anotherTempVar = xRange * 0.5
  if XDistLE anotherTempVar
    xRange *= 2
  endif
  // xRange *= 2
  // xOffset *= 2
  // yRange *= 0.5
  EstOYCoord immediateTempVar hitFrame
  immediateTempVar -= OYCoord
  simGoalY = goalY //+ immediateTempVar
  DrawDebugCircle goalX simGoalY 3 color(0xFF000088)
else
  hitFrame = 9
  xRange = 10
  xOffset = 10
  yRange = 0
  simGoalY = goalY
endif
xOffset *= Scale
xRange *= Scale
yRange *= Scale


#let techSkill = var18
techSkill = LevelValue * 0.01
if techSkill < 0.1
  techSkill = 0.1
endif

immediateTempVar = TopNX - goalX
anotherTempVar = TopNY - simGoalY
Norm immediateTempVar immediateTempVar anotherTempVar
Abs immediateTempVar
if immediateTempVar <= 8 && Equal AirGroundState 1
  ClearStick
  Return
endif
#let estJumpLoc = var1
estJumpLoc = GetJumpLength * hitFrame
GetYDistFloorOffset globTempVar estJumpLoc 110 0
GetYDistFloorOffset immediateTempVar estJumpLoc 3 0
if globTempVar > 0 && currGoal < cg_bait_dashdance
  immediateTempVar = TopNY + 3 - immediateTempVar
  globTempVar = TopNY + 100 - globTempVar
  if currGoal >= cg_attack && currGoal <= calc(cg_attack + 1) && OFramesHitstun <= 0
  elif immediateTempVar < globTempVar && !(CalledFrom BoardPlatform)
    #let platChance = var0
    platChance = PT_PLATCHANCE
    if Rnd < platChance
      Seek platSkill
      Jump
    elif globTempVar < simGoalY && Rnd < platChance
      Seek platSkill
      Jump
    endif
  endif
endif
GetAttribute immediateTempVar attr_jumpSquatFrames 0
GetAttribute globTempVar attr_jumpYInitVel 0
immediateTempVar *= globTempVar
GetAttribute globTempVar attr_jumpYInitVelShort 0
immediateTempVar += globTempVar
GetAttribute globTempVar attr_gravity 0
immediateTempVar = immediateTempVar - globTempVar * 3.5
GetYDistFloorOffset globTempVar 0 4 0
if AnimFrame < 5 && Equal CurrAction hex(0xB)
elif Equal AirGroundState 2 && YSpeed < immediateTempVar && YDistBackEdge > -1 && !(Equal globTempVar -1) && Rnd < techSkill
  immediateTempVar = TopNX - goalX
  Abs immediateTempVar
  if immediateTempVar > 15 && Equal IsOnStage 1
    if CurrAction >= hex(0xB) && CurrAction <= hex(0xD)
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

immediateTempVar = GetJumpLength * hitFrame + TopNX
immediateTempVar -= goalX
Abs immediateTempVar
anotherTempVar = xRange * 2
// LOGVAL_NL strv("YOLO")
// LOGVAL_NL immediateTempVar
// LOGVAL_NL anotherTempVar
if immediateTempVar <= anotherTempVar || Equal CurrSubaction JumpSquat && TopNY < simGoalY
  #let totalJumpHeight = var1
  #let djumpHeight = var2
  GET_CHAR_TRAIT(djumpHeight, chr_cs_djumpHeight)
  immediateTempVar = simGoalY - TopNY
  totalJumpHeight = djumpHeight * NumJumps * 1.2
  if immediateTempVar < totalJumpHeight
    if Equal AirGroundState 1 
      #let shortHopHeight = var1
      GET_CHAR_TRAIT(shortHopHeight, chr_cs_shortHopHeight)
      globTempVar = shortHopHeight + TopNY
      // globTempVar += 10
      if Equal CurrSubaction JumpSquat && simGoalY > globTempVar
        Button X
        Goto jumpDirHandler
      elif TopNY < simGoalY && !(Equal CurrSubaction JumpSquat)
        Goto jumpPreCheck
      endif
    elif AnimFrame > 3
      anotherTempVar = TopNY + djumpHeight - 5
      if YSpeed > 0
        immediateTempVar = YSpeed / Gravity
        EstYCoord anotherTempVar immediateTempVar
      endif
      // anotherTempVar += HurtboxSize
      // anotherTempVar -= yRange           
      if anotherTempVar < simGoalY
        #let isAerialAttack = var0
        Goto isAirAttack
        if Equal isAerialAttack 1 || Equal lastAttack -1
          Button X
          Goto jumpDirHandler
        endif
      endif
    endif
  endif
elif immediateTempVar <= 15 && TopNY > simGoalY && Equal IsOnPassableGround 1
  #let djumpiness = var0
  djumpiness = PT_DJUMPINESS

  #let aggression = var1
  aggression = PT_AGGRESSION

  if Equal Direction 1 
    immediateTempVar = TopNX + XDistFrontEdge + 20
    globTempVar = TopNX + XDistBackEdge - 20
  else
    immediateTempVar = TopNX - XDistBackEdge - 20
    globTempVar = TopNX - XDistFrontEdge + 20
  endif

  if globTempVar <= goalX && goalX <= immediateTempVar && Rnd < aggression
    label empty_2
    XGoto PerFrameChecks
    Seek empty_2
    if Rnd < techSkill
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
  if currGoal <= calc(cg_bait + 1) && LevelValue >= LV7
    #let dashForceTurnFrame = var1
    GET_CHAR_TRAIT(dashForceTurnFrame, chr_cs_dashForceTurnFrame)
    dashForceTurnFrame -= 1
    if Equal CurrAction hex(0x3) && AnimFrame >= immediateTempVar && AnimFrame < 16
      ClearStick
    endif
  endif
endif
if currGoal < cg_edgeguard
  if Equal AirGroundState 2 && !(OutOfStage) || Equal CurrAction hex(0xA)
    #let isGoingOffstage = var1
    #let throwaway = var2
    GOING_OFFSTAGE(isGoingOffstage, throwaway, 15)
    if !(Equal isGoingOffstage 0)
      AbsStick isGoingOffstage
      AbsStick isGoingOffstage
      Return
    endif
  endif
endif
Return
label stickMovement
  

  #let IAT_Return = var0
  Goto isAirAttack
  #let isAerialAttack = var1
  isAerialAttack = IAT_Return
  

  anotherTempVar = TotalXSpeed * hitFrame + TopNX
  if currGoal < cg_attack || Equal AirGroundState 1
    anotherTempVar = TopNX
  endif

  anotherTempVar -= goalX
  immediateTempVar = anotherTempVar
  Abs anotherTempVar
  anotherTempVar -= xOffset

  #let stickMagnitude = var0
  stickMagnitude = 1

  if Equal AirGroundState 1 && !(Equal CurrAction hex(0xA)) && Equal isAerialAttack 0
    if !(Equal currGoal cg_attack_wall)
      if anotherTempVar > 0 && anotherTempVar < xOffset && currGoal < cg_edgeguard
        stickMagnitude = 0.72
      elif anotherTempVar < 0
        stickMagnitude = 0
      endif
      if currGoal >= cg_edgeguard && DistToOEdge < 30
        stickMagnitude *= 0.72
      elif anotherTempVar > xOffset && Equal CurrAction hex(0x1) 
        stickMagnitude = 0
      endif
    endif
  endif

  if immediateTempVar > 0
    stickMagnitude *= -1
  endif
  AbsStick stickMagnitude
  
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

  

  globTempVar = TopNX + Width * Direction * 0.5
  anotherTempVar = CharXSpeed * 2 + 3 * Direction
  anotherTempVar += globTempVar
  GetColDistPosAbs anotherTempVar globTempVar globTempVar CenterY anotherTempVar CenterY 0
  if !(Equal anotherTempVar -1)
    ClearStick
    Goto jumpPreCheck
    Goto jumpDirHandler
  endif 
  
  if Equal AirGroundState 1
    if Equal currGoal cg_edgeguard
      immediateTempVar = xOffset * 1.5
      xOffset *= 0.5
      anotherTempVar = OPos * immediateTempVar
      GetYDistFloorOffset anotherTempVar anotherTempVar 15 0
      globTempVar = XSpeed * OPos
      if Equal anotherTempVar -1
        if Equal isAerialAttack 0 && lastAttack >= 0
          if Equal YDistFloor -1
            Call RecoveryHub
          elif Equal CurrAction hex(0x3) || DistToOEdge < xOffset
            scriptVariant = sv_wavedash_neutral
            if DistToOEdge < 5
              scriptVariant = sv_wavedash_awayFromLedge
            endif
            CallI Wavedash
          elif True
            Goto stopMoveIfAhead
          endif
        elif True
          globTempVar = TopNX - goalX
          Abs globTempVar

          #let djumpHeight = var2
          GET_CHAR_TRAIT(djumpHeight, chr_cs_djumpHeight)
          djumpHeight *= 2.25
          immediateTempVar = simGoalY - TopNY - yRange - OHurtboxSize
          // within 80 x units
          if globTempVar <= 80
            // within djump height
            if immediateTempVar < djumpHeight && immediateTempVar > 0 || globTempVar > 60
              if Equal CurrSubaction JumpSquat
                Goto jumpPreCheck
              else
                Goto jumpPreCheck
                Goto jumpDirHandler
              endif
            // within 30 x units and jumping and O more above ledge
            elif immediateTempVar > 40 && Equal CurrSubaction JumpSquat && globTempVar <= 45
              Goto jumpPreCheck
            // within 30 x units and O slightly above ledge
            elif immediateTempVar > 15 && globTempVar <= 20 
            elif True
              Goto stopMoveIfAhead
            endif
            Return
          endif
          Goto stopMoveIfAhead

        endif
      endif
    else
      immediateTempVar = Direction * 15
      GetYDistFloorOffset immediateTempVar immediateTempVar 5 0
      globTempVar = XSpeed * Direction
      if Equal immediateTempVar -1 && globTempVar > 0.05
        immediateTempVar = Direction * 40
        GetYDistFloorOffset immediateTempVar immediateTempVar 40 0
        if Equal immediateTempVar -1
          ClearStick
          if CurrAction >= hex(0x2) && CurrAction <= hex(0x9)
            scriptVariant = sv_wavedash_neutral
            if DistToOEdge < 10
              scriptVariant = sv_wavedash_awayFromLedge
            endif
            CallI Wavedash
          endif
        else
          Button X
        endif
      endif
      if Equal CurrAction hex(0x8)
        scriptVariant = sv_wavedash_in
        CallI Wavedash
      endif
    endif
  endif
Return
label stopMoveIfAhead
  immediateTempVar = goalX - TopNX
  immediateTempVar *= OPos
  if immediateTempVar >= 0
    ClearStick 
  endif
Return
label jumpPreCheck
if CalledFrom ExecuteAttack
  SeekNoCommit jpc_if
elif cg_attack <= currGoal && currGoal <= calc(cg_attack + 1)
  if (!True)
    label jpc_if
  endif
  #let isAerialAttack = var0
  Goto isAirAttack
  if Equal isAerialAttack 1 && Equal AirGroundState 1
    #let moveDir = var0
    GET_CHAR_TRAIT(moveDir, chr_get_moveDir)
    if Equal moveDir -1 && Equal Direction OPos
      ClearStick
      Stick -1
    elif Equal moveDir 1 && !(Equal Direction OPos)
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
ClearStick
if Equal AirGroundState 1
  #let swapStorage = var0
  GetAttribute immediateTempVar attr_jumpXInitVel 0
  anotherTempVar = GetJumpLength + immediateTempVar
  swapStorage = GetJumpLength - immediateTempVar

  immediateTempVar = anotherTempVar * hitFrame + TopNX  
  immediateTempVar -= goalX
  globTempVar = immediateTempVar
  Abs globTempVar
  if globTempVar < 25
    AbsStick 1
  endif

  immediateTempVar = swapStorage * hitFrame + TopNX
  immediateTempVar -= goalX
  globTempVar = immediateTempVar
  Abs globTempVar
  if globTempVar < 25
    AbsStick -1
  endif
else 
  GetAttribute globTempVar attr_airXTermVel 0
  immediateTempVar = goalX - TopNX
  LOGVAL_NL immediateTempVar
  immediateTempVar *= 0.05
  immediateTempVar = immediateTempVar / globTempVar
  LOGVAL_NL immediateTempVar
  AbsStick immediateTempVar
endif
Return
label handleWaveland
scriptVariant = sv_wavedash_goal
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
  #let nearCliffX = var0
  GetNearestCliff nearCliffX  
  nearCliffX = TopNX - nearCliffX
  if Equal IsOnStage 1
    // wavedash back to ledge?
    immediateTempVar = XSpeed
    Abs immediateTempVar
    anotherTempVar = immediateTempVar
    immediateTempVar = 20 + immediateTempVar 
    globTempVar = nearCliffX
    Abs globTempVar
    if globTempVar < immediateTempVar
      globTempVar = nearCliffX * Direction
      if globTempVar < 20 && globTempVar > 0
        Stick -1
      elif globTempVar > -5 && globTempVar < 0 && anotherTempVar < 0.2
        Stick 1
      elif InAir && globTempVar < -5 && Equal PrevAction hex(0xA)
        Button R
        GetAttribute immediateTempVar attr_groundFriction 0
        globTempVar *= immediateTempVar
        if globTempVar > -0.3
          globTempVar = -0.3
        endif
        Stick globTempVar (-0.75)
      elif globTempVar < 0 && !(Equal CurrAction hex(0x0A))
        if CurrAction < hex(0x16) || CurrAction > hex(0x19)
          Button X
        endif
      endif
    else
      AbsStick OPos
      if Equal CurrAction hex(0x1)
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
  if Rnd < techSkill
    Call BoardPlatform
  endif
Return
label isAirAttack
  #let isAerialAttack = var0
  GET_CHAR_TRAIT(isAerialAttack, chr_chk_isAerialAttack)
Return
Return