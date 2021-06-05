// DEFEND HUB
// controls move execution pathing when on the defensive
#include <Definition_AIMain.h>
id 0x8005

unk 0x0

Cmd30
if OutOfStage
  Call RecoveryHub
endif

var21 = 32773


var17 = var9 + (var11 * 2)
// if closer to center stage, then don't give up positional advantage
var0 = Rnd
// LOGSTR 1986097664 805306368 0 0 0
// LOGVAL var0

SAFE_INJECT_2 var0
if XDistLE 20 && var20 >= 24641 && var20 <= 24655
  label
  Goto trackOMoves
  if CurrAction <= 9
    if var17 <= 0 && Equal OPos Direction
      Stick -1
    elif var17 > 0 && !(Equal OPos Direction)
      Stick -1
    else
      Button X
    endif
  endif
  if Equal CurrSubaction JumpSquat 
    var22 = OPos * -1
    AbsStick var22
  endif
  if InAir
    Seek execute
    Jump
  endif
  Return
endif
label _handlers
if var20 >= 24641 && var20 <= 24655
  var1 = TopNX
  var2 = OTopNX
  Abs var1
  Abs var2
  if var1 < var2
    var0 = (Rnd * 0.3) + 0.6
  endif
  label
  
  Goto trackOMoves
  Goto defend_from_o

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
        if Rnd < 0.5
          if var17 <= 0 && CurrAction < 9
            Button X
          else
            ClearStick
            AbsStick OPos
            Return
          endif
        endif
      elif Equal CurrAction 7 || Equal CurrAction 6 
        if Equal Direction OPos
          Button X
        endif
      elif Equal CurrAction 4
        var0 = 0
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
    if XDistFrontEdge > 25 && XDistBackEdge < -25 && !(InAir)
      if XSpeed > 0.4 || XSpeed < -0.4
        ClearStick
        Return
      endif
      if Equal OPos Direction && !(Equal CurrAction 10)
        if CurrAction <= 9
          Button X
        endif
      elif !(Equal CurrAction 10)
        if var17 <= 0 && CurrAction <= 9
          Button X
        else
          Stick -1
        endif
      endif
    elif var17 <= 0
      if Equal OPos Direction
        Stick -1
      endif
      if !(Equal OPos Direction) && !(Equal CurrAction 10) && CurrAction <= 2
        Button X
      endif
    else
      var0 = 1
      Return
    endif
  elif True
  // approach
    if var17 <= 0
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
elif True
  // dash away ==> attack
  Goto trackOMoves
  Goto defend_from_o
  if var0 < 0.3
    if XDistFrontEdge < 10 || Equal CurrAction 4 || Equal CurrAction 3
      Seek turnExecute
      Jump
    endif
    var22 = OPos * -1
    AbsStick var22
    if Equal CurrAction 1
      ClearStick
    endif
  elif var0 < 0.6
    var3 = Rnd * 60 + 10
    label
    Stick 0 (-1)
    var3 -= 1
    if var3 <= 0 || XDistLE 25
      if XDistLE 40
        Seek turnExecute
        Jump
      endif
    endif
    var22 = OTopNY - TopNY
    predictAverage var17 4 LevelValue
    var17 += 10
    if var22 > 15 && XDistLE var17
      Call FakeOutHub
    endif
    Return
  elif True
    if Equal OIsOnStage 1 && !(XDistLE 55)
      AbsStick OPos
    else
      var0 = 0.5
    endif
  endif
endif
Return

label trackOMoves
  if ODistLE 45 && Equal OAnimFrame 5
    if OCurrAction >= 26 && OCurrAction <= 33 && Rnd < 0.7
      trackOAction 8 2
    elif OCurrAction >= 52 && OCurrAction <= 56 && Rnd < 0.7
      trackOAction 8 3
    elif OAttacking && Rnd < 0.7
      trackOAction 8 1
    elif Rnd < 0.1
      trackOAction 8 0
    endif

    predictOOption var17 8 LevelValue
    predictionConfidence var22 8 LevelValue

    if Equal var17 1 && Rnd < var22
      Call Unk3020
    elif Equal var17 2 && Rnd < var22
      var18 = 0
      var21 = 32770
      Call Grab
    elif Equal var17 3 && Rnd < var22
      Seek turnExecute
      Jump
    endif
  endif 
Return

label turnExecute
  if Equal CurrAction 4
    Stick 0 (-1)
    Return
  elif Equal CurrAction 3
    Stick -1
    Return
  endif
  if var17 <= 0 && Equal OPos Direction
    Stick -0.5
  elif var17 > 0 && !(Equal OPos Direction)
    Stick -0.5
  else
    Seek execute
    Jump
  endif
Return

label turnFaceJump
  if !(Equal CurrAction 10) && !(Equal var20 24643)
    ClearStick
    AbsStick OPos
  endif
  if Equal CurrAction 5 && !(Equal OPos Direction)
    Button X
  elif Equal CurrAction 6 || Equal CurrAction 8 || Equal CurrAction 9
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
elif Equal var20 24638
  Call DashAttack
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
elif Equal var20 25001 && Equal AirGroundState 1
  var0 = 10 + Rnd * 15
  label
  Button R
  var0 -= 1
  if var0 <= 0
    Call OOSHub
  endif
  Return
else
  Call AIHub
endif
Return

label defend_from_o
  predictAverage var22 4 LevelValue
  predictAverage var17 5 LevelValue
  // DrawDebugRectOutline TopNX TopNY var22 var17 255 0 0 136
  if Equal AirGroundState 1 && OFramesHitstun < 1 && !(Equal var16 7)
    predictAverage var22 4 LevelValue
    var17 = OXSpeed * 5 * OPos * -1
    var22 += var17
    // LOGSTR 1868054784 1953784064 1667974144 1769174016 0
    // LOGVAL var22
    if XDistLE var22
      predictAverage var22 5 LevelValue
      var17 = OYSpeed * 5
      var22 += var17
      var17 = TopNY - OTopNY
      Abs var17
      // LOGSTR 1868120320 1953784064 1667974144 1769174016 0
      // LOGVAL var22
      if var17 <= var22
        if CalledAs DefendHub
          var22 = 8
        else
          var22 = 7
        endif
        
        if !(OAttacking) && Rnd <= 0.1
          trackOAction var22 0
          predictAverage var17 4 LevelValue
          var17 *= 0.5
          trackOAction 4 var17
        endif
        predictOOption var17 var22 LevelValue
        predictionConfidence var22 var22 LevelValue
        
        var22 *= 0.1
        if Equal var17 1 && Rnd <= var22
          var22 = OPos * OXSpeed
          if var22 < 0 
            LOGSTR 1684366848 1701733376 540082176 0 0
            Call Unk3020
          endif
        elif Equal var17 1 && Rnd <= var22 && Rnd < 0.2
          var18 = 1
          LOGSTR 1684366848 1701733376 540147712 0 0
          Call FakeOutHub
        endif
        if Equal var17 1 && Rnd <= var22 && OAttacking && OAnimFrame > 10 && OAnimFrame < 20
          var22 = OPos * OXSpeed
          if var22 < 0 
            LOGSTR 1684366848 1701733376 540213248 0 0
            Call Unk3020
          endif
        endif
      endif
    endif
  endif
if OAnimFrame > 1 && OAnimFrame <= 2 && ODistLE 80
  if OPrevAction >= 66 && OPrevAction <= 69 || Equal OPrevAction 73 || Equal var16 7
    if Equal OCurrAction 12 || Equal OCurrAction 13
      trackOAction 14 1
    elif OAttacking && Rnd < 0.6
      trackOAction 14 1
    elif Equal OCurrAction 14 || Equal OCurrAction 70 || Equal OCurrAction 74 || Equal OCurrAction 96 || Equal OCurrAction 97
      if OFramesHitstun <= 0 && Rnd < 0.5
        trackOAction 14 2
      endif
    endif
  endif
endif
// if OAttacking && OAnimFrame > 1 && OAnimFrame <= 2 && ODistLE 70
//   if YDistBackEdge > -3 && YDistBackEdge <= 3
//     var22 = TopNX - OTopNX
//     Abs var22
//     var22 += 10
//     if var22 > 126
//       var22 = 126
//     endif
//     trackOAction 4 var22
//     var22 = TopNY - OTopNY
//     Abs var22
//     var22 += 10
//     if var22 > 126
//       var22 = 126
//     endif
//     trackOAction 5 var22
//   endif
// endif
Return
Return
