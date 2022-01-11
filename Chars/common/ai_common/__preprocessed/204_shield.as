#include <Definition_AIMain.h>
id 0x8204
unk 0x0

XReciever
label setup

var0 = 0
var2 = 0

var4 = 0
var17 = PT_AGGRESSION
var17 *= 0.65
if Rnd < var17
  var4 = 1
endif

var3 = Rnd * 35 + 5
if Equal var21 10.2
  var22 = 60 * Rnd + 20
  var3 += var22
endif
Seek shield
Return
label shield
var21 = 13

XGoto PerFrameChecks
XReciever
Seek shield

if !(Equal AirGroundState 1)
  Return
endif

var2 += 1
Button R

  var22 = 0.004
  XGoto GetChrSpecific
  XReciever
var1 = var22
Seek shield

if Equal LevelValue 100
  var22 = OPos * 0.5
  var17 = OTopNY - TopNY
  if var17 > 0.5
    var17 = 0.5
  else
    var17 = -0.5
  endif
  AbsStick var22 var17
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

MOD var17 var2 3
if Equal CurrAction 27 && Equal var17 0 
  GetShieldRemain var17
  var22 = var0 * 0.03
  if var17 < 40 || var1 > 8 || Rnd <= var22 || !(ODistLE 45)
    Seek pickOption
    Jump
  elif Equal var4 1 && ODistLE 45 && Rnd < 0.4
    Seek pickOption
    Jump
  elif var2 >= var3 && !(ODistLE 15) 
    Seek pickOption
    Jump
  endif
endif
Return
label pickOption

predictAverage var22 10 LevelValue
var22 += 35
if var1 > 7 && CHANCE_MUL_LE PT_AGGRESSION 0.7
  Button X
  var21 = 16.4
  XGoto CalcAttackGoal
  XReciever
  var15 = -1
  CallI MainHub
elif Rnd < 0.4 && XDistLE var22
  Button X
  Call FastAerial
elif Rnd < 0.6 && Equal var4 1
  Button X
  var21 = 16.4
  XGoto CalcAttackGoal
  XReciever
  var15 = -1
  CallI MainHub
endif

var22 -= 20
if var1 > 24 && Rnd < 0.7
  var16 = 1
  var21 = 16.4
  CallI Wavedash
elif var1 > 14 && Rnd < 0.7
  var16 = 2
  var21 = 16.4
  CallI Wavedash
elif Equal OPos Direction && ODistLE var22
  if var1 > 5 && Rnd < 0.75 || Equal var4 1
    Button A
    Call Grab
  endif
endif

if Rnd < 0.3
  predictionConfidence var22 7 LevelValue
  predictOOption var17 7 LevelValue 
  if Rnd < var22
    if Equal var17 1
      if Rnd < 1
        var16 = 3
        if XDistBackEdge > -15
          var16 = 1
          var16 += 0.1
        endif
        CallI JumpScr
      endif
      Seek shield
      Return
    elif Equal var17 2
      var16 = 1
      if XDistBackEdge > -10 && XDistFrontEdge < 10
        var16 = 4
      endif
      CallI Wavedash
    elif Equal var17 3
      var16 = 1
      if XDistBackEdge > -10 && XDistFrontEdge < 10
        var16 = 4
      endif
      CallI Wavedash
    endif
  endif
endif

if Rnd < 0.2
  if Rnd < 0.3
    var16 = 3
    CallI JumpScr
  elif Rnd < 0.2
    var16 = 2
    CallI Wavedash
  elif Rnd < 0.2
    AbsStick OPos
  elif Rnd < 0.2
    var22 = OPos * -1
    AbsStick var22
  elif Rnd < 0.6
    AbsStick 0 (-1)
  endif
endif
Seek shield
Return
Return
