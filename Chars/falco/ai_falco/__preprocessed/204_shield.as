#include <Definition_AIMain.h>
id 0x8204
unk 0x0

XReciever
LOGSTR 1398030592 1381244928 1397246208 1162626048 0
label setup

var0 = 0
var2 = 0
var3 = Rnd * 100 + 50
label shield
var21 = 13

XGoto PerFrameChecks
XReciever
Seek shield

var2 += 1
Button R

var1 = -1
if Equal OCurrAction 51 && OYSpeed < 0 && OYDistBackEdge > -15
  if Equal OCurrSubaction AttackAirN
    GetAttribute var17 65 1
  elif Equal OCurrSubaction AttackAirF
    GetAttribute var17 66 1
  elif Equal OCurrSubaction AttackAirB
    GetAttribute var17 67 1
  elif Equal OCurrSubaction AttackAirHi
    GetAttribute var17 68 1
  elif Equal OCurrSubaction AttackAirLw
    GetAttribute var17 69 1
  endif
  var17 -= OYDistBackEdge
  var17 *= 0.5
  var1 = var17
elif OAttacking 
  var1 = OEndFrame - OAnimFrame
endif

if Equal CurrAction 29
  MOD var17 var2 14
  if Equal var17 0
    if var1 >= 35
      AbsStick OPos
    else
      var22 = OPos * -1
      AbsStick var22
    endif
  endif 
  var0 += 1
endif

MOD var17 var2 4
if Equal CurrAction 27 && Equal var17 0 
  GetShieldRemain var17
  var22 = var0 * 0.02
  if var17 < 35 || var2 >= var3 || var1 > 18 || Rnd <= var22 || !(ODistLE 45)
    Seek pickOption
    Jump
  endif
endif
Return
label pickOption
if var1 > 18 && Rnd < 0.4
  var16 = 1
  Call Wavedash
elif var1 > 13 && Rnd < 0.4
  var16 = 2
  CallI Wavedash
elif var1 > 8 && Rnd < 0.4 && Equal OPos Direction && XDistLE 12
  Button A
  Call Grab
endif

if Rnd < 0.4
  var16 = 3
  CallI JumpScr
elif Rnd < 0.4
  AbsStick OPos
elif Rnd < 0.4
  var22 = OPos * -1
  AbsStick var22
elif Rnd < 0.7
  AbsStick 0 (-1)
else
  Seek shield
  Return
endif
CallI MainHub
Return
Return

