// DEFEND HUB
// controls move execution pathing when on the defensive
#include <Definition_AIMain.h>
id 0x8005

unk 0x0

var21 = 32773


var1 = TopNX
var2 = OTopNX
Abs var1
Abs var2
// if closer to center stage, then don't give up positional advantage
if var1 < var2
  var0 = (Rnd * 0.8 ) + 0.21
else
  var0 = Rnd
endif
// LOGSTR 1986097664 805306368 0 0 0
// LOGVAL var0
// SAFE_INJECT_2 var0
var0 = 0.3
label
if var20 >= 24641 && var20 <= 24655
  if var0 <= 0.2
  // Retreating RAR aerial (if possible without going offstage)
    if Equal AirGroundState 1
      if XDistFrontEdge > 25 && XDistBackEdge < -25
        var1 = OPos * -1
        AbsStick var1
        if Equal CurrAction 1
          ClearStick
          Return
        endif
        if CurrAction >= 4 && CurrAction <= 9 && !(Equal CurrAction 6)
          Goto turnFaceJump
        endif
      elif !(Equal CurrAction 10)
        if !(Equal OPos Direction) && !(Equal var20 24643)
          var1 = OPos * 0.5
          AbsStick var1
        elif CurrAction <= 9
          Button X
        endif
      endif
    endif
  elif var0 <= 0.55
  // dash away aerial
    if XDistFrontEdge > 25 && XDistBackEdge < -25
      var1 = OPos * -1
      AbsStick var1
      if Equal CurrAction 1 || Equal CurrAction 10
        ClearStick
        Return
      endif
      if Equal CurrAction 3
        if Rnd < 0.1
          if var9 <= -3 && CurrAction < 9
            Button X
          else
            ClearStick
            Stick -1
          endif
        endif
      elif Equal CurrAction 7 || Equal CurrAction 6 
        if Equal Direction OPos
          Button X
        endif
      elif Equal CurrAction 4
        var0 = 0.1
        Return
      endif
    elif !(InAir)
      if !(Equal OPos Direction) && !(Equal var20 24643)
        var1 = OPos * 0.5
        AbsStick var1
      elif CurrAction <= 9
        Button X
      endif
    endif
  elif var0 <= 0.85
  // aerial in-place
    if XDistFrontEdge > 20 && XDistBackEdge < -20 && !(InAir)
      if XSpeed > 0.4 || XSpeed < -0.4
        ClearStick
        Return
      endif
      if Equal OPos Direction && !(Equal CurrAction 10)
        if CurrAction <= 9
          Button X
        endif
      elif !(Equal CurrAction 10)
        if var9 <= -3 && CurrAction <= 9
          Button X
        else
          Stick -1
        endif
      endif
    elif var9 <= -3
      if Equal OPos Direction
        Stick -0.5
      endif
      if !(Equal OPos Direction) && Idling && !(Equal CurrAction 10)
        Button X
      endif
    else
      var0 = 1
      Return
    endif
  else
  // approach
    if var9 <= -3
      var0 = 0.85
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
else
  Call ApproachHub
endif
Return

label turnFaceJump
  if !(Equal CurrAction 10) && !(Equal var20 24643)
    ClearStick
    AbsStick OPos
  endif
  if Equal CurrAction 5 && !(Equal OPos Direction)
    Button X
  elif Equal CurrAction 6 || Equal CurrAction 8 || Equal CurrAction 9 || Idling
    if Equal OPos Direction
      Button X
      Return
    endif
  endif
Return

label execute
ClearStick
// sets var18 to 1 so we know to actually perform the move instead
// of loading the move data and getting within the move's range -- we
// just did that in this script!
var18 = 1
if Equal var20 24625
  Call Jab123
elif Equal var20 24626
  Call FTilt
elif Equal var20 24627
  Call UTilt
elif Equal var20 24628
  Call DTilt
elif Equal var20 24629
  Call FSmash
elif Equal var20 24630
  Call USmash
elif Equal var20 24631
  Call DSmash
elif Equal var20 24632
  Call NSpecial
elif Equal var20 24633
  Call SSpecial
elif Equal var20 24634
  Call USpecial
elif Equal var20 24635
  Call DSpecial
elif Equal var20 24636
  Call Grab
elif Equal var20 24641
  Call NAir
elif Equal var20 24642
  Call FAir
elif Equal var20 24643
  Call BAir
elif Equal var20 24644
  Call UAir
elif Equal var20 24645
  Call DAir
elif Equal var20 24646
  Call NSpecialAir
elif Equal var20 24647
  Call SSpecialAir
elif Equal var20 24648
  Call USpecialAir
elif Equal var20 24649
  Call DSpecialAir
endif
Return
Return
