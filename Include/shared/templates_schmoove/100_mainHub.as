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

// JUMP_HEIGHT_TEST

DisableDebugOverlay
scriptVariant = sv_none
if Equal currGoal cg_recover
  CallI RecoveryHub
endif

DynamicDiceClear
if Rnd < pt_circleCampChance
  DynamicDiceAdd cg_circleCamp
endif
if Rnd < pt_baitChance
  DynamicDiceAdd cg_bait
endif
DynamicDiceRoll currGoal
if Equal currGoal -1
  currGoal = cg_nothing
endif

label initial
Goto PFC
Seek initial
if Equal goalX 0 && Equal goalY 0
  XGoto GoalChoiceHub
  XReciever
endif

ACTIONABLE_ON_GROUND
#let techSkill = var0
techSkill = LevelValue * 0.01
if techSkill < 0
  techSkill = 0.05
endif
LOGSTR str("TSkill")
LOGVAL techSkill
label tskillWait
Goto PFC
XReciever
Seek tskillWait
if Rnd < techSkill
  Seek selectGoal
  Jump
endif
LOGSTR str("waiting")
Return
label selectGoal
XGoto UpdateGoal
XReciever
if Equal goalY BBoundary
  Seek selectGoal
  Jump
endif
LOGSTR str("selected")
label navigateToGoal
Goto PFC
XReciever
Seek selectGoal
LOGSTR str("navigating")
immediateTempVar = TopNX - goalX
anotherTempVar = TopNY - goalY
Norm immediateTempVar immediateTempVar anotherTempVar
Abs immediateTempVar
if immediateTempVar <= 8 && Equal AirGroundState 1
  ClearStick
  Return
endif
immediateTempVar = XSpeed * 12
GetYDistFloorOffset globTempVar immediateTempVar 110 0
GetYDistFloorOffset immediateTempVar immediateTempVar 3 0
if globTempVar > 0
  immediateTempVar = TopNY + 3 - immediateTempVar
  globTempVar = TopNY + 100 - globTempVar
  if immediateTempVar < globTempVar
    if Rnd < pt_platChance && Rnd < pt_platChance && Rnd < pt_platChance
      label
      Goto PFC
      if Rnd < techSkill
        CallI BoardPlatform
      endif
      Return
    elif globTempVar < goalY
      label
      Goto PFC
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
if TopNX > goalX
  AbsStick -1
else
  AbsStick 1
endif
immediateTempVar = TopNX - goalX
Abs immediateTempVar
if immediateTempVar <= 10 && Equal AirGroundState 1 && !(Equal CurrAction hex(0xA))
  ClearStick
  if TopNX > goalX
    AbsStick -0.85
  else
    AbsStick 0.85
  endif
elif Equal CurrAction hex(0x1)
  ClearStick
endif
if Equal AirGroundState 2 && !(OutOfStage) || Equal CurrAction hex(0xA)
  #let isGoingOffstage = var1
  #let throwaway = var2
  GOING_OFFSTAGE(isGoingOffstage, throwaway, 16)
  if !(Equal isGoingOffstage 0) && Rnd < techSkill
    AbsStick isGoingOffstage
    AbsStick isGoingOffstage
  endif
endif
immediateTempVar = XSpeed * 9 + TopNX
immediateTempVar -= goalX
Abs immediateTempVar
if immediateTempVar <= 15 && TopNY < goalY
  immediateTempVar = goalY - TopNY
  if Equal AirGroundState 1
    immediateTempVar = goalY - 6
    globTempVar = shortHopHeight + TopNY
    if Equal CurrSubaction JumpSquat && immediateTempVar > globTempVar
      Button X
      Goto jumpDirHandler
    elif TopNY < immediateTempVar && !(Equal CurrSubaction JumpSquat) 
      Button X
      Goto jumpDirHandler
    endif
  else
    anotherTempVar = 14 - AnimFrame
    if Equal anotherTempVar 0
      anotherTempVar = 1
    endif
    EstYCoord globTempVar anotherTempVar
    anotherTempVar = goalY - 6
    if globTempVar < anotherTempVar && immediateTempVar < djumpHeight && !(Equal YSpeed 0)
      globTempVar = GetJumpHeight / GetJumpLength
      immediateTempVar = goalX - TopNX
      Abs immediateTempVar
      anotherTempVar = goalY - TopNY
      immediateTempVar /= anotherTempVar
      if immediateTempVar <= globTempVar
        Button X
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

  if globTempVar <= goalX && goalX <= immediateTempVar
    label
    Goto PFC
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
label jumpDirHandler
immediateTempVar = XSpeed * 15 + TopNX
immediateTempVar -= goalX
ClearStick
if immediateTempVar > goalX
  AbsStick -0.75
else
  AbsStick 0.75
endif
Return
label handleWaveland
if TopNX < goalX
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