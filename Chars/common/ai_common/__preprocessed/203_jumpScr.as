#include <Definition_AIMain.h>
id 0x8203
unk 0x0

//= XReciever

label setup
XGoto PerFrameChecks
//= XReciever
Seek setup

if CurrAction >= 26 && CurrAction <= 29
elif True
  var22 = 300
  XGoto GetChrSpecific
  Seek setup
  if Equal var22 0 
    Return
  endif
endif

var0 = OPos
var1 = 0
OR var17 var16 var16
var1 = var16 - var17
if !(Equal var1 0)
  var1 = 1
  var16 -= 0.1
  OR var16 var16 var16
else
  var1 = 0
endif
label jumpCommand
MOD var17 GameTimer 4
if Equal AirGroundState 2 || var17 <= 2 || Equal CurrSubaction JumpSquat
  Button X
endif
label locomotion
XGoto PerFrameChecks
//= XReciever
if !(Equal var20 -1) 
  NoRepeat
  STACK_PUSH var16 0
  STACK_PUSH var0 0
  STACK_PUSH var1 0
  XGoto SetAttackGoal
  //= XReciever
  XGoto CheckAttackWillHit
  var1 = STACK_POP
  var0 = STACK_POP
  var16 = STACK_POP

  //= XReciever
endif
Seek locomotion
if Equal var1 1 && Equal CurrSubaction JumpSquat
  Button X
elif Equal YSpeed 0 && Equal AirGroundState 1
  Seek jumpCommand
endif

if Equal var16 1
  var17 = OPos * 30
  GetYDistFloorOffset var17 var17 10 1
  if Equal var17 -1
    var16 = 3
    Return
  endif
  if Equal AirGroundState 1
    if XSpeed > 1.5 || XSpeed < -1.5
      Stick -1
    endif
    Return
  endif
  AbsStick var0
  if var21 >= 16 && var21 < 17
    JmpNextIfLabel
  elif !(Equal var0 OPos) || YSpeed < 0
    IfLabel
    if var21 < 16
      var16 = 2
      CallI AerialDrift
    endif
    CallI MainHub
  endif
elif Equal var16 2
  if Equal AirGroundState 2
    CallI MainHub
  endif
elif Equal var16 3
  var22 = OPos * -1
  var17 = var22 * 30
  GetYDistFloorOffset var17 var17 10 0
  if Equal var17 -1
    if Rnd < 0.35
      var16 = 1
    else
      var16 = 2
    endif
    Return
  endif
  AbsStick var22
  if YSpeed < 0 && Equal AirGroundState 2
    CallI MainHub
  endif
else
  CallI MainHub
endif
Return
Return
