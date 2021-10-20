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

#let techSkill = var0
techSkill = LevelValue * 0.01
if techSkill < 0.1
  techSkill = 0.1
endif

immediateTempVar = TopNX - goalX
anotherTempVar = TopNY - goalY
Norm immediateTempVar immediateTempVar anotherTempVar
Abs immediateTempVar
if immediateTempVar <= 8 && Equal AirGroundState 1
  ClearStick
  Return
endif
immediateTempVar = XSpeed * 10
GetYDistFloorOffset globTempVar immediateTempVar 110 0
GetYDistFloorOffset immediateTempVar immediateTempVar 3 0
if globTempVar > 0
  immediateTempVar = TopNY + 3 - immediateTempVar
  globTempVar = TopNY + 100 - globTempVar
  if immediateTempVar < globTempVar && !(Equal currGoal cg_attack)
    #let platChance = var0
    GET_CHAR_TRAIT(platChance, chr_pt_platChance)
    if Rnd < platChance && Rnd < platChance
      label empty_0
      Goto PFC
      Seek empty_0
      if Rnd < techSkill
        CallI BoardPlatform
      endif
      Return
    elif globTempVar < goalY && Rnd < platChance && Rnd < platChance
      label empty_1
      Goto PFC
      Seek empty_1
      if Rnd < techSkill
        CallI BoardPlatform
      endif
      Return
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
if Equal AirGroundState 2 && YSpeed < immediateTempVar && YDistBackEdge > -3 && !(Equal globTempVar -1) && !(Equal YSpeed 0) && Rnd < techSkill
  immediateTempVar = TopNX - goalX
  Abs immediateTempVar
  if immediateTempVar > 15 && Equal IsOnStage 1
    if CurrAction >= hex(0xB) && CurrAction <= hex(0xD)
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
if Equal AirGroundState 2 && !(OutOfStage) || Equal CurrAction hex(0xA)
  #let isGoingOffstage = var1
  #let throwaway = var2
  GOING_OFFSTAGE(isGoingOffstage, throwaway, 16)
  if !(Equal isGoingOffstage 0) && Rnd < techSkill
    AbsStick isGoingOffstage
    AbsStick isGoingOffstage
  endif
elif Equal AirGroundState 1
  immediateTempVar = XSpeed * 10
  GetYDistFloorOffset immediateTempVar immediateTempVar 3 0
  if Equal immediateTempVar -1
    ClearStick
    immediateTempVar = Direction * -1
    AbsStick immediateTempVar
  endif
endif
immediateTempVar = XSpeed * 9 + TopNX
immediateTempVar -= goalX
Abs immediateTempVar
if immediateTempVar <= 15 && TopNY < goalY
  immediateTempVar = goalY - TopNY
  if Equal AirGroundState 1
    immediateTempVar = goalY
    #let shortHopHeight = var1
    GET_CHAR_TRAIT(shortHopHeight, chr_pt_shortHopHeight)
    globTempVar = shortHopHeight + TopNY
    if Equal CurrSubaction JumpSquat && immediateTempVar > globTempVar
      Goto jumpPreCheck
    elif TopNY < immediateTempVar && !(Equal CurrSubaction JumpSquat) 
      Goto jumpPreCheck
    endif
  else
    anotherTempVar = 14 - AnimFrame
    if Equal anotherTempVar 0
      anotherTempVar = 1
    endif
    EstYCoord globTempVar anotherTempVar
    anotherTempVar = goalY - 6
    #let totalJumpHeight = var1
    #let djumpHeight = var2
    GET_CHAR_TRAIT(djumpHeight, chr_pt_djumpHeight)
    totalJumpHeight = djumpHeight * NumJumps
    if globTempVar < anotherTempVar && immediateTempVar < totalJumpHeight && !(Equal YSpeed 0)
      globTempVar = GetJumpHeight / GetJumpLength
      immediateTempVar = goalX - TopNX
      Abs immediateTempVar
      anotherTempVar = goalY - TopNY
      immediateTempVar /= anotherTempVar
      if immediateTempVar <= globTempVar
        #let isAerialAttack = var0
        GET_CHAR_TRAIT(isAerialAttack, chr_chk_isAerialAttack)
        if Equal isAerialAttack 1 || Equal lastAttack -1
          Button X
        endif
      endif
    endif
  endif
elif immediateTempVar <= 15 && TopNY > goalY && Equal IsOnPassableGround 1
  if Equal Direction 1 
    immediateTempVar = TopNX + XDistFrontEdge
    globTempVar = TopNX + XDistBackEdge
  else
    immediateTempVar = TopNX - XDistBackEdge
    globTempVar = TopNX - XDistFrontEdge
  endif

  #let djumpiness = var0
  GET_CHAR_TRAIT(djumpiness, chr_pt_djumpiness)

  #let aggression = var1
  GET_CHAR_TRAIT(aggression, chr_pt_aggression)

  if globTempVar <= goalX && goalX <= immediateTempVar && Rnd < djumpiness && Rnd < aggression
    label empty_2
    Goto PFC
    Seek empty_2
    if Rnd < techSkill
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
  if TopNX > goalX
    if Equal Direction 1 && Equal CurrAction hex(0x4) && LevelValue >= LV6
      scriptVariant = sv_wavedash_in
      CallI Wavedash
    endif
    GetYDistFloorOffset immediateTempVar -8 0 0
    if !(Equal immediateTempVar -1) 
      AbsStick -1
    elif XDistBackEdge > -4
      AbsStick 0.65
    endif
  elif True
    if Equal Direction -1 && Equal CurrAction hex(0x4) && LevelValue >= LV6
      scriptVariant = sv_wavedash_in
      CallI Wavedash
    endif
    GetYDistFloorOffset immediateTempVar 8 0 0
    if !(Equal immediateTempVar -1) 
      AbsStick 1
    elif XDistBackEdge > -4
      AbsStick -0.65
    endif
  endif
  immediateTempVar = TopNX - goalX
  Abs immediateTempVar
  if immediateTempVar <= 8 && Equal AirGroundState 1 && !(Equal CurrAction hex(0xA))
    if CurrAction < hex(0x3) || Equal CurrAction hex(0x16) || Equal CurrAction hex(0x17) || Equal CurrAction hex(0x18) 
      ClearStick
      if TopNX > goalX
        AbsStick -0.65
      else
        AbsStick 0.65
      endif
    endif
  elif Equal CurrAction hex(0x1) && YDistBackEdge < -10 && YDistFrontEdge > 10
    ClearStick
  endif
  immediateTempVar = CharXSpeed * 8 + 5 * Direction
  GetYDistFloorOffset immediateTempVar immediateTempVar 10 0
  if Equal immediateTempVar -1 && CurrAction > hex(0x2) && FramesHitstun <= 0 && Equal AirGroundState 1
    ClearStick
    scriptVariant = sv_wavedash_awayFromLedge
    Call Wavedash
  endif
Return
label jumpPreCheck
if Equal currGoal cg_attack
  #let isAerialAttack = var0
  GET_CHAR_TRAIT(isAerialAttack, chr_chk_isAerialAttack)
  if Equal isAerialAttack 1
    Goto jumpDirHandler
  endif
else
  Goto jumpDirHandler
endif
Return
label jumpDirHandler
Button X
immediateTempVar = XSpeed * 15 + TopNX
immediateTempVar -= goalX
ClearStick
if LevelValue >= LV7 && Rnd < 0.9 && Equal CurrAction hex(0x3) && AnimFrame >= pt_dashForceTurnFrame 
elif immediateTempVar > goalX
  AbsStick -1
else
  AbsStick 1
endif
Return
label handleWaveland
globTempVar = 1
if XDistFrontEdge < 30 && XDistBackEdge > -30
  globTempVar = 0.6
endif
if TopNX < goalX
  AbsStick globTempVar (-1)
else
  globTempVar *= -1
  AbsStick globTempVar (-1)
endif
immediateTempVar = goalX * Direction
if XDistFrontEdge < 7 && immediateTempVar < 0
  ClearStick
  Stick globTempVar (-1)
elif XDistBackEdge > -7 && immediateTempVar > 0
  ClearStick
  globTempVar *= -1
  Stick globTempVar (-1)
endif
if Equal XDistBackEdge XDistFrontEdge
  ClearStick
  globTempVar = TopNX * -1
  AbsStick globTempVar 0
endif
Button R
Return
Return