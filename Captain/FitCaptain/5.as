// DEFEND HUB
// controls move execution pathing when on the defensive
#include <Definition_AIMain.h>
id 0x8005

unk 0x0

lastScript = hex(0x8005)

#let actionType = var0
#let tempVar = var1
#let tempVar2 = var2

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
// SAFE_INJECT_2 actionType
label
if lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F)
  if actionType <= 0.2
  // Retreating RAR aerial (if possible without going offstage)
    if Equal AirGroundState 1
      if XDistFrontEdge > 30 && XDistBackEdge < -30
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
    if XDistFrontEdge > 30 && XDistBackEdge < -30
      tempVar = OPos * -1
      AbsStick tempVar
      if Equal CurrAction hex(0x01) || Equal CurrAction hex(0x0A)
        ClearStick
        Return
      endif
      if Equal CurrAction hex(0x03)
        if Rnd < 0.1
          if move_xOffset <= -3 && CurrAction < hex(0x09)
            Button X
          else
            ClearStick
            Stick -1
          endif
        endif
      elif Equal CurrAction hex(0x07) && Equal Direction OPos
        Button X
      elif Equal CurrAction hex(0x04)
        actionType = 0.1
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
    if XDistFrontEdge > 20 && XDistBackEdge < -20
      if XSpeed > 0.4 || XSpeed < -0.4
        ClearStick
        Return
      endif
      if Equal OPos Direction && !(Equal CurrAction hex(0x0A))
        if CurrAction <= hex(0x09)
          Button X
        endif
      elif !(Equal CurrAction hex(0x0A))
        if move_xOffset <= -3 && CurrAction <= hex(0x09)
          Button X
        else
          Stick -1
        endif
      endif
    elif move_xOffset <= -3
      if Equal OPos Direction
        Stick -0.5
      endif
      if !(Equal OPos Direction) && Idling && !(Equal CurrAction hex(0xA))
        Button X
      endif
    else
      actionType = 1
      Return
    endif
  else
  // approach
    if move_xOffset <= -3
      actionType = 0.85
      Return
    else
      Call ApproachHub
    endif
  endif

  if InAir
    if Rnd <= 0.4 || YSpeed < 0
      Seek execute
      Jump
    endif
  endif
else
  Call ApproachHub
endif
Return

label turnFaceJump
  // yes, for some reason it needs to be here twice to RAR properly...
  if !(Equal CurrAction hex(0x0A)) && !(Equal lastAttack hex(0x6043))
    AbsStick OPos
  endif
  if Equal CurrAction hex(0x05) && !(Equal OPos Direction)
    Button X
  elif Equal CurrAction hex(0x06) || Equal CurrAction hex(0x08) || Equal CurrAction hex(0x09) || Idling
    if Equal OPos Direction
      Button X
      Return
    endif
  endif
  // ... no I don't know why
  if !(Equal CurrAction hex(0x0A)) && !(Equal lastAttack hex(0x6043))
    AbsStick OPos
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
endif
Return
Return