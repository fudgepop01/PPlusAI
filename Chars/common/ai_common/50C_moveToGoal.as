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
GetAttribute globTempVar attr_jumpXVelGroundMult 0
immediateTempVar = XSpeed * 10 * globTempVar
GetYDistFloorOffset globTempVar immediateTempVar 110 0
GetYDistFloorOffset immediateTempVar immediateTempVar 3 0
if globTempVar > 0
  immediateTempVar = TopNY + 3 - immediateTempVar
  globTempVar = TopNY + 100 - globTempVar
  if currGoal <= cg_attack && currGoal <= calc(cg_attack + 1)
  elif immediateTempVar < globTempVar
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
  GOING_OFFSTAGE(isGoingOffstage, throwaway, 20)
  if !(Equal isGoingOffstage 0) && !(Equal currGoal cg_edgeguard)
    AbsStick isGoingOffstage
    AbsStick isGoingOffstage
    Return
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
GetAttribute globTempVar attr_jumpXVelGroundMult 0
immediateTempVar = XSpeed * 9 * globTempVar + TopNX
immediateTempVar -= goalX
Abs immediateTempVar
if immediateTempVar <= 25 || Equal CurrSubaction JumpSquat && TopNY < goalY
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
    totalJumpHeight = djumpHeight * NumJumps * 2
    if globTempVar < anotherTempVar && immediateTempVar < totalJumpHeight && !(Equal YSpeed 0)
      GetAttribute globTempVar attr_airXTermVel 0
      GetAttribute immediateTempVar attr_airJumpYMult 0
      GetAttribute anotherTempVar attr_jumpYInitVel 0
      immediateTempVar *= anotherTempVar
      globTempVar = globTempVar / immediateTempVar
      immediateTempVar = goalX - TopNX
      Abs immediateTempVar
      EstYCoord anotherTempVar 10
      anotherTempVar *= -1
      anotherTempVar += goalY 
      immediateTempVar /= anotherTempVar
      if immediateTempVar >= globTempVar
        #let isAerialAttack = var0
        GET_CHAR_TRAIT(isAerialAttack, chr_chk_isAerialAttack)
        if Equal isAerialAttack 1 || Equal lastAttack -1
          Goto jumpDirHandler
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

  if globTempVar <= goalX && goalX <= immediateTempVar && Rnd < aggression
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
    AbsStick -1
  else
    AbsStick 1
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
  elif Equal CurrAction hex(0x1) && XDistBackEdge < -10 && XDistFrontEdge > 10
    ClearStick
  endif
  if !(Equal currGoal cg_edgeguard) && Equal IsOnStage 1
    immediateTempVar = 0
    GET_CHAR_TRAIT(immediateTempVar, chr_chk_isAerialAttack)
    if Equal immediateTempVar 1
    else
      immediateTempVar = Direction * 10
      GetYDistFloorOffset immediateTempVar immediateTempVar 20 0
      globTempVar = XSpeed * Direction
      if Equal immediateTempVar -1 && globTempVar > 0.05
        ClearStick
        if CurrAction >= hex(0x2) && CurrAction <= hex(0x9)
          scriptVariant = sv_wavedash_awayFromLedge
          CallI Wavedash
        endif
      endif
    endif
  endif
Return
label jumpPreCheck
if cg_attack <= currGoal && currGoal <= calc(cg_attack + 1)
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
if Equal AirGroundState 1
  GetAttribute globTempVar attr_jumpXVelGroundMult 0
  immediateTempVar = XSpeed * 15 * globTempVar + TopNX
  ClearStick
  
  immediateTempVar -= goalX
  globTempVar = immediateTempVar
  Abs globTempVar

  if LevelValue >= LV7 && Rnd < 0.9 && Equal CurrAction hex(0x3) && AnimFrame >= pt_dashForceTurnFrame 
  elif globTempVar < 18
  elif immediateTempVar < 0
    AbsStick -1
  else
    AbsStick 1
  endif
else 
  ClearStick
  GetAttribute globTempVar attr_airXTermVel 0
  immediateTempVar = goalX - TopNX
  immediateTempVar *= 15
  immediateTempVar = immediateTempVar * 1 / globTempVar
  AbsStick immediateTempVar
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