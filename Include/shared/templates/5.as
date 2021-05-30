// DEFEND HUB
// controls move execution pathing when on the defensive
#include <Definition_AIMain.h>
id 0x8005

unk 0x0

Cmd30
if OutOfStage
  Call RecoveryHub
endif

lastScript = hex(0x8005)

#let actionType = var0
#let tempVar = var1
#let tempVar2 = var2

globTempVar = move_xOffset + (move_xRange * 2)

tempVar = TopNX
tempVar2 = OTopNX
Abs tempVar
Abs tempVar2
// if closer to center stage, then don't give up positional advantage
if tempVar < tempVar2
  actionType = (Rnd * 0.8 ) + 0.21
else
  actionType = Rnd
endif
// LOGSTR str("actionType")
// LOGVAL actionType

SAFE_INJECT_2 actionType
if XDistLE 20 && lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F)
  label
  Goto trackOMoves
  if CurrAction <= hex(0x9)
    if globTempVar <= 0 && Equal OPos Direction
      Stick -1
    elif globTempVar > 0 && !(Equal OPos Direction)
      Stick -1
    else
      Button X
    endif
  endif
  if Equal CurrSubaction JumpSquat 
    immediateTempVar = OPos * -1
    AbsStick immediateTempVar
  endif
  if InAir
    Seek execute
    Jump
  endif
  Return
endif
label _handlers
if lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F)
  Goto trackOMoves

  if actionType <= 0.2
  // Retreating RAR aerial (if possible without going offstage)
    if Equal AirGroundState 1
      if XDistFrontEdge > edgeRange && XDistBackEdge < -edgeRange
        tempVar = OPos * -1
        AbsStick tempVar
        if Equal CurrAction hex(0x01)
          ClearStick
          Return
        endif
        if CurrAction >= hex(0x04) && CurrAction <= hex(0x09) && !(Equal CurrAction hex(0x06))
          Goto turnFaceJump
        endif
      elif !(Equal CurrAction hex(0x0A))
        if !(Equal OPos Direction) && !(Equal lastAttack hex(0x6043))
          tempVar = OPos * 0.5
          AbsStick tempVar
        elif CurrAction <= hex(0x09)
          Button X
        endif
      endif
    endif
  elif actionType <= 0.55
    // dash away aerial
    if XDistFrontEdge > edgeRange && XDistBackEdge < -edgeRange
      tempVar = OPos * -1
      AbsStick tempVar
      if Equal CurrAction hex(0x01) || Equal CurrAction hex(0x0A)
        ClearStick
        Return
      endif
      if Equal CurrAction hex(0x03)
        if Rnd < 0.5
          if globTempVar <= 0 && CurrAction < hex(0x09)
            Button X
          else
            ClearStick
            AbsStick OPos
            Return
          endif
        endif
      elif Equal CurrAction hex(0x07) || Equal CurrAction hex(0x06) 
        if Equal Direction OPos
          Button X
        endif
      elif Equal CurrAction hex(0x04)
        actionType = 0
        Return
      endif
    elif !(InAir)
      if !(Equal OPos Direction) && !(Equal lastAttack hex(0x6043))
        tempVar = OPos * 0.5
        AbsStick tempVar
      elif CurrAction <= hex(0x09)
        Button X
      endif
    endif
  elif actionType <= 0.85
    // aerial in-place
    if XDistFrontEdge > edgeRange && XDistBackEdge < -edgeRange && !(InAir)
      if XSpeed > 0.4 || XSpeed < -0.4
        ClearStick
        Return
      endif
      if Equal OPos Direction && !(Equal CurrAction hex(0x0A))
        if CurrAction <= hex(0x09)
          Button X
        endif
      elif !(Equal CurrAction hex(0x0A))
        if globTempVar <= 0 && CurrAction <= hex(0x09)
          Button X
        else
          Stick -1
        endif
      endif
    elif globTempVar <= 0
      if Equal OPos Direction
        Stick -1
      endif
      if !(Equal OPos Direction) && !(Equal CurrAction hex(0xA)) && CurrAction <= hex(0x02)
        Button X
      endif
    else
      actionType = 1
      Return
    endif
  elif True
  // approach
    if globTempVar <= 0
      actionType = 0.85
      Return
    else
      Call ApproachHub
    endif
  endif

  if InAir
    if Rnd <= 0.4 || YSpeed <= 0
      Seek execute
      Jump
    endif
  endif
elif True
  // dash away ==> attack
  Goto trackOMoves
  if actionType < 0.3
    if XDistFrontEdge < shortEdgeRange || Equal CurrAction hex(0x04) || Equal CurrAction hex(0x03)
      Seek turnExecute
      Jump
    endif
    immediateTempVar = OPos * -1
    AbsStick immediateTempVar
    if Equal CurrAction hex(0x01)
      ClearStick
    endif
  elif actionType < 0.6
    #let timer = var3
    timer = Rnd * 60 + 10
    label
    Stick 0 (-1)
    timer -= 1
    if timer <= 0 || XDistLE 25
      Seek turnExecute
      Jump
    endif
    immediateTempVar = OTopNY - TopNY
    if immediateTempVar > 15 && XDistLE 35
      Call FakeOutHub
    endif
    Return
  elif True
    if Equal OIsOnStage 1 && !(XDistLE 55)
      AbsStick OPos
    else
      actionType = 0.5
    endif
  endif
endif
Return

label trackOMoves
  if ODistLE 45 && Equal OAnimFrame 5
    if OAttacking && Rnd < 0.7
      trackOAction man_defend op_attack
    elif OCurrAction >= hex(0x1A) && OCurrAction <= hex(0x21) && Rnd < 0.7
      trackOAction man_defend op_defend
    elif OCurrAction >= hex(0x34) && OCurrAction <= hex(0x38) && Rnd < 0.7
      trackOAction man_defend op_grab
    elif Rnd < 0.1
      trackOAction man_defend op_null
    endif

    predictOOption globTempVar man_defend LevelValue
    predictionConfidence immediateTempVar man_defend LevelValue

    if Equal globTempVar op_attack && Rnd < immediateTempVar
      Call Unk3020
    elif Equal globTempVar op_defend && Rnd < immediateTempVar
      movePart = 0
      lastScript = hex(0x8002)
      Call Grab
    elif Equal globTempVar op_grab && Rnd < immediateTempVar
      Seek turnExecute
      Jump
    endif
  endif 
Return

label turnExecute
  if Equal CurrAction hex(0x04)
    Stick 0 (-1)
    Return
  elif Equal CurrAction hex(0x03)
    Stick -1
    Return
  endif
  if globTempVar <= 0 && Equal OPos Direction
    Stick -0.5
  elif globTempVar > 0 && !(Equal OPos Direction)
    Stick -0.5
  else
    Seek execute
    Jump
  endif
Return

label turnFaceJump
  if !(Equal CurrAction hex(0x0A)) && !(Equal lastAttack hex(0x6043))
    ClearStick
    AbsStick OPos
  endif
  if Equal CurrAction hex(0x05) && !(Equal OPos Direction)
    Button X
  elif Equal CurrAction hex(0x06) || Equal CurrAction hex(0x08) || Equal CurrAction hex(0x09)
    if Equal OPos Direction
      Button X
      Return
    endif
  endif
Return

label execute
ClearStick
// sets movePart to 1 so we know to actually perform the move instead
// of loading the move data and getting within the move's range -- we
// just did that in this script!
movePart = 1
if Equal lastAttack hex(0x6031)
  Call Jab123
elif Equal lastAttack valDashAttack
  Call DashAttack
elif Equal lastAttack hex(0x6032)
  Call FTilt
elif Equal lastAttack hex(0x6033)
  Call UTilt
elif Equal lastAttack hex(0x6034)
  Call DTilt
elif Equal lastAttack hex(0x6035)
  Call FSmash
elif Equal lastAttack hex(0x6036)
  Call USmash
elif Equal lastAttack hex(0x6037)
  Call DSmash
elif Equal lastAttack hex(0x6038)
  Call NSpecial
elif Equal lastAttack hex(0x6039)
  Call SSpecial
elif Equal lastAttack hex(0x603A)
  Call USpecial
elif Equal lastAttack hex(0x603B)
  Call DSpecial
elif Equal lastAttack hex(0x603C)
  Call Grab
elif Equal lastAttack hex(0x6041)
  Call NAir
elif Equal lastAttack hex(0x6042)
  Call FAir
elif Equal lastAttack hex(0x6043)
  Call BAir
elif Equal lastAttack hex(0x6044)
  Call UAir
elif Equal lastAttack hex(0x6045)
  Call DAir
elif Equal lastAttack hex(0x6046)
  Call NSpecialAir
elif Equal lastAttack hex(0x6047)
  Call SSpecialAir
elif Equal lastAttack hex(0x6048)
  Call USpecialAir
elif Equal lastAttack hex(0x6049)
  Call DSpecialAir
elif Equal lastAttack valShield && Equal AirGroundState 1
  #let timer = var0
  timer = 10 + Rnd * 15
  label
  Button R
  timer -= 1
  if timer <= 0
    Call OOSHub
  endif
  Return
else
  Call AIHub
endif
Return
Return