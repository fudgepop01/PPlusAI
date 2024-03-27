#include <Definition_AIMain.h>
//TrueID=0x603C
id 0x603C

//Set Unknown
unk 0x0

if CurrAction >= 52 && CurrAction <= 60
  Call 0x1120
endif

if Equal var18 0
  // LOGSTR 1735549184 1644167168 0 0 0
  if Equal var19 1
    Seek techChase_wait
    Jump
  else
    Seek seekOpponent
    Jump
  endif
  Return
elif True
  if Equal CurrSubaction JumpSquat
    Button A|R
    Seek execute
  endif
  if !(Equal OPos Direction)
    Stick -0.8
    Return
  endif
  if Equal AirGroundState 1 && CurrAction <= 9
    Button X
  endif
endif
Return

label techChase_wait
  SetTimeout 300
  var0 = Rnd * 75 + 75
  var1 = 0
  if Damage < 80
    var2 = 10
  else
    var2 = 25
  endif
  var17 = Rnd
  label
  if !(XDistLE var2)
    // walk-up
    var3 = OPos
    AbsStick var3 (-0.4)
    if Equal CurrAction 1
      ClearStick
    endif
  elif Equal AirGroundState 1
    // force crouch cancel
    Stick 0 (-1)
    if var0 <= 20
      if var17 < 0.3 && var20 >= 24641 && var20 <= 24655
        Button X
      elif var17 < 0.6 && XDistBackEdge < -25 && var0 >= 19
        ClearStick
        Stick -1 0
      elif var17 >= 0.6
        Button R
      endif
    endif
  endif
  var4 = 0
  var5 = OCurrAction
  if Equal var5 96 || Equal var5 81
    if OAnimFrame < 15
      var4 = 1
    endif
  endif
  if Equal var5 30 || Equal var5 31 || Equal var5 32 || Equal var5 78 || Equal var5 80 || Equal var5 82 || Equal var5 83 || Equal var5 97
    if OAnimFrame < 21
      var4 = 1
    endif
  endif
  if Equal var4 1
    var1 = 1
  endif
  var0 -= 1
  if OCurrAction < 69
    Seek seekOpponent
    Jump
  elif Equal var1 1 && Equal var4 0
    Seek _AIHub
    Jump
  elif var0 <= 0
    Seek _AIHub
    Jump
  elif Equal OIsOnStage 0 && Equal OCurrAction 73
    Seek seekOpponent
    Jump
  elif OYDistBackEdge < -20 && Equal OFramesHitstun 0
    Seek _AIHub
    Jump
  endif
  Return

label _AIHub
Call AIHub

label seekOpponent
SetFrame 0
label
if Equal var19 1
  var0 = (100 - LevelValue) / 100
  if Rnd < var0 && !(FrameGE 15)
    Return
  endif
endif
var20 = 24636
var15 = 32
var9 = 1
var10 = -6
var11 = 3
var12 = 4
var13 = 7
var14 = 8
Call ApproachHub
Return

label execute
if CurrAction < 9 || Equal CurrAction 125
  Call AIHub
elif Equal CurrAction 55 || Equal CurrAction 53
  Call Unk1120
endif
Return
Return


