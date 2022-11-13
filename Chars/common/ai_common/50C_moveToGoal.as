#include <Definition_AIMain.h>
id 0x850C
unk 0x0

XReciever

XGoto PerFrameChecks
XReciever
if CalledAs ExecuteAttack
  Goto XStickMovement
  Return
endif

if Equal currGoal cg_edgeguard_ledge
  Goto WDBackGrabLedge
  Return
endif

#let hitFrame = var3
#let xRange = var4
if !(Equal lastAttack -1)
  GET_MOVE_DATA(globTempVar, globTempVar, globTempVar, xRange, globTempVar, hitFrame, anotherTempVar, globTempVar, globTempVar, globTempVar, globTempVar, globTempVar)
  anotherTempVar *= 0.5
  hitFrame += anotherTempVar
  anotherTempVar = OWidth * 0.5
  xRange += anotherTempVar
else
  hitFrame = 9
  xRange = 10
endif

#let techSkill = var18
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
immediateTempVar = XSpeed * hitFrame * globTempVar
GetYDistFloorOffset globTempVar immediateTempVar 110 0
GetYDistFloorOffset immediateTempVar immediateTempVar 3 0
if globTempVar > 0
  immediateTempVar = TopNY + 3 - immediateTempVar
  globTempVar = TopNY + 100 - globTempVar
  if currGoal <= cg_attack && currGoal <= calc(cg_attack + 1)
  elif immediateTempVar < globTempVar && !(CalledFrom BoardPlatform)
    #let platChance = var0
    platChance = PT_PLATCHANCE
    if Rnd < platChance
      label empty_0
      Goto PFC
      Seek empty_0
      if Rnd < techSkill
        CallI BoardPlatform
      endif
      Return
    elif globTempVar < goalY && Rnd < platChance
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

Goto XStickMovement

GetAttribute globTempVar attr_jumpXVelGroundMult 0
immediateTempVar = XSpeed * hitFrame * globTempVar + TopNX
immediateTempVar -= goalX
Abs immediateTempVar
if immediateTempVar <= xRange || Equal CurrSubaction JumpSquat && TopNY < goalY
  #let totalJumpHeight = var1
  #let djumpHeight = var2
  GET_CHAR_TRAIT(djumpHeight, chr_cs_djumpHeight)
  immediateTempVar = goalY - TopNY
  totalJumpHeight = djumpHeight * NumJumps * 1.2
  if immediateTempVar < totalJumpHeight
    if Equal AirGroundState 1 
      #let shortHopHeight = var1
      GET_CHAR_TRAIT(shortHopHeight, chr_cs_shortHopHeight)
      immediateTempVar = goalY
      globTempVar = shortHopHeight + TopNY
      if Equal CurrSubaction JumpSquat && goalY > globTempVar
        Goto jumpPreCheck
      elif TopNY < goalY && !(Equal CurrSubaction JumpSquat)
        Goto jumpPreCheck
      endif
    elif AnimFrame > 3
      anotherTempVar = TopNY + djumpHeight - 5
      if YSpeed > 0
        immediateTempVar = YSpeed / Gravity
        EstYCoord anotherTempVar immediateTempVar
      endif
      if anotherTempVar < goalY
        #let isAerialAttack = var0
        GET_CHAR_TRAIT(isAerialAttack, chr_chk_isAerialAttack)
        if Equal isAerialAttack 1 || Equal lastAttack -1
          Button X
          Goto jumpDirHandler
        endif
      endif
    endif
  endif
elif immediateTempVar <= 15 && TopNY > goalY && Equal IsOnPassableGround 1
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
label XStickMovement
if Equal CurrSubaction JumpSquat
  Goto jumpDirHandler
else
  Goto stickMovement
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
  
  immediateTempVar = 0
  GET_CHAR_TRAIT(immediateTempVar, chr_chk_isAerialAttack)

  anotherTempVar = XSpeed * hitFrame + TopNX
  if currGoal < cg_attack || Equal immediateTempVar 0
    anotherTempVar = TopNX
  endif
  
  if anotherTempVar > goalX
    AbsStick -1
  else
    AbsStick 1
  endif
  if Equal AirGroundState 1 && Equal immediateTempVar 0
    anotherTempVar -= goalX
    Abs anotherTempVar
    if Equal CurrAction hex(0x3) && anotherTempVar < 20
      ClearStick
    elif anotherTempVar < 10
      ClearStick
    endif
  endif

  globTempVar = TopNX + Width * Direction * 0.5
  anotherTempVar = XSpeed * 2 + 3 * Direction
  anotherTempVar += globTempVar
  GetColDistPosAbs anotherTempVar globTempVar globTempVar CenterY anotherTempVar CenterY 0
  if !(Equal anotherTempVar -1)
    ClearStick
    Button X
    Goto jumpDirHandler
  endif 
  anotherTempVar = TopNX - goalX
  Abs anotherTempVar
  if anotherTempVar < 20 && Equal AirGroundState 1 && !(Equal CurrAction hex(0xA))
    if Equal CurrAction hex(0x3) || Equal CurrAction hex(0x16) || Equal CurrAction hex(0x17) || Equal CurrAction hex(0x18) 
      ClearStick
    endif
    if !(Equal currGoal cg_attack_wall)
      if TopNX > goalX
        AbsStick -0.65
      else
        AbsStick 0.65
      endif
    endif
  elif Equal CurrAction hex(0x1) && XDistBackEdge < -10 && XDistFrontEdge > 10
    ClearStick
  endif
  
  if Equal AirGroundState 1
    if Equal currGoal cg_edgeguard
      anotherTempVar = OPos * 15
      GetYDistFloorOffset anotherTempVar anotherTempVar 15 0
      globTempVar = XSpeed * OPos
      if Equal anotherTempVar -1
        if Equal immediateTempVar 0
          if globTempVar > 0.1
            scriptVariant = sv_wavedash_neutral
            if XDistFrontEdge < 5
              scriptVariant = sv_wavedash_awayFromLedge
            endif
            CallI Wavedash
          else
            ClearStick
          endif
        elif True
          GetYDistFloorAbsPos anotherTempVar goalX TopNY
          if anotherTempVar < 0
            ClearStick
          endif
          globTempVar = TopNX - goalX
          Abs globTempVar
          if globTempVar <= 80
            #let djumpHeight = var2
            GET_CHAR_TRAIT(djumpHeight, chr_cs_djumpHeight)
            immediateTempVar = OTopNY - TopNY + OHurtboxSize
            if immediateTempVar > djumpHeight || globTempVar > 60
              if !(Equal CurrSubaction JumpSquat)
                Goto jumpPreCheck
              else
                Button X
                Goto jumpDirHandler
              endif
            elif immediateTempVar > -15 && !(Equal CurrSubaction JumpSquat) && globTempVar > 30
              Goto jumpPreCheck
            endif
          endif
        endif
      endif
    elif True
      immediateTempVar = Direction * 15
      GetYDistFloorOffset immediateTempVar immediateTempVar 5 0
      globTempVar = XSpeed * Direction
      if Equal immediateTempVar -1 && globTempVar > 0.05
        ClearStick
        if CurrAction >= hex(0x2) && CurrAction <= hex(0x9)
          scriptVariant = sv_wavedash_neutral
          if XDistFrontEdge < 10
            scriptVariant = sv_wavedash_awayFromLedge
          endif
          CallI Wavedash
        endif
      endif
    endif
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
  GET_CHAR_TRAIT(isAerialAttack, chr_chk_isAerialAttack)
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
if Equal AirGroundState 1
  GetAttribute globTempVar attr_jumpXVelGroundMult 0
  immediateTempVar = XSpeed * hitFrame * globTempVar + TopNX
  ClearStick
  
  immediateTempVar -= goalX
  globTempVar = immediateTempVar
  Abs globTempVar

  if LevelValue >= LV7 && Rnd < 0.9 && Equal CurrAction hex(0x3) && AnimFrame >= cs_dashForceTurnFrame 
  elif globTempVar < 4
  elif immediateTempVar < 0
    AbsStick 1
  else
    AbsStick -1
  endif
else 
  ClearStick
  GetAttribute globTempVar attr_airXTermVel 0
  immediateTempVar = goalX - TopNX
  immediateTempVar *= 10
  immediateTempVar = immediateTempVar * 1 / globTempVar
  AbsStick immediateTempVar
endif
Return
label handleWaveland
globTempVar = 1
if XDistFrontEdge < 3 || XDistBackEdge > -3
  globTempVar = -0.3
elif XDistFrontEdge < 10 || XDistBackEdge > -10
  globTempVar = 0.3
elif XDistFrontEdge < 30 && XDistBackEdge > -30
  globTempVar = 0.6
endif
if TopNX < goalX
  AbsStick globTempVar (-1)
else
  globTempVar *= -1
  AbsStick globTempVar (-1)
endif
immediateTempVar = goalX * Direction
if XDistFrontEdge < 7 && XDistFrontEdge > 3 && immediateTempVar < 0
  ClearStick
  Stick globTempVar (-1)
elif XDistBackEdge > -7  && XDistFrontEdge < -3 && immediateTempVar > 0
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
label WDBackGrabLedge
if !(Equal AirGroundState 3)
  #let nearCliffX = var0
  GetNearestCliff nearCliffX  
  nearCliffX = TopNX - nearCliffX
  if Equal IsOnStage 1 && !(Equal DistBackEdge DistFrontEdge)
    // wavedash back to ledge?
    immediateTempVar = XSpeed
    Abs immediateTempVar
    immediateTempVar = 20 + immediateTempVar 
    globTempVar = nearCliffX
    Abs globTempVar
    if globTempVar < immediateTempVar
      globTempVar = nearCliffX * Direction
      LOGVAL_NL globTempVar
      if globTempVar < 20 && globTempVar > 0
        Stick -1
        Return
      elif globTempVar > -5 && globTempVar < 0
        Stick 1
        Return
      elif YDistBackEdge > -1 && InAir && globTempVar < -5 && Equal IsOnStage 1
        Button R
        GetAttribute immediateTempVar attr_groundFriction 0
        globTempVar *= immediateTempVar
        if globTempVar > -0.3
          globTempVar = -0.3
        endif
        Stick globTempVar (-0.75)
      elif globTempVar < 0 && !(Equal CurrAction hex(0x0A)) && Equal IsOnStage 1
        if CurrAction >= hex(0x16) && CurrAction <= hex(0x19)
        else
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
Return