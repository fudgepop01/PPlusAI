#include <Definition_AIMain.h>
id 0x8204
unk 0x0

XReciever
label setup

var0 = 0
var2 = 0
var3 = Rnd * 35 + 5
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

  var1 = -1
  if Equal OCurrAction 51 && OYDistBackEdge > -25
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
    var17 *= 0.7
    var1 = var17
  elif Equal OCurrAction 24
    var1 = OEndFrame - OAnimFrame
  elif Equal OCurrAction 33 && OYDistBackEdge < -15
    var1 = 35
  elif Equal OCurrAction 26 || Equal OCurrAction 27 || Equal OCurrAction 16
    var17 = OTopNX - TopNX
    Abs var17
    var17 = 10 - var17
    var1 = 30 + var17
  elif OAttacking 
    RetrieveFullATKD var22 var17 var23 var23 var23 var23 var23 OCurrSubaction 1
    if Equal var22 0
      var22 = OEndFrame
    endif 
    // if OAnimFrame >= var17
      var1 = var22 - OAnimFrame
    // endif
  elif Rnd < 0.75 && Rnd < 0.75 && Rnd < 0.1
    var1 = 20
  endif
if OAttacking
  RetrieveFullATKD var22 var17 var23 var23 var23 var23 var23 OCurrSubaction 1
  if Equal var22 0
    var22 = OEndFrame
  endif 
  if OAnimFrame >= var17
    var1 = var22 - OAnimFrame
  else
    var1 = -1
  endif
endif

// if Equal LevelValue 100
//   var22 = OPos * 0.5
//   var17 = OTopNY - TopNY
//   if var17 > 0.5
//     var17 = 0.5
//   else
//     var17 = -0.5
//   endif
//   AbsStick var22 var17
// endif

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
  if var17 < 35 || var2 >= var3 || var1 > 8 || Rnd <= var22 || !(ODistLE 45)
    Seek pickOption
    Jump
  elif Equal OHitboxConnected 1 && OAttacking && Rnd < 0.3
    Seek pickOption
    Jump
  endif
endif
Return
label pickOption

predictAverage var22 10 LevelValue
var22 += 35
if Rnd < 0.4 && XDistLE var22
  Button X
  Call FastAerial
// elif XDistLE var22
//   predictionConfidence var22 7 LevelValue
//   predictOOption var17 7 LevelValue 
//   if Rnd < var22
//     Button X
//     Call FastAerial
//   endif
endif

if var1 > 24 && Rnd < 0.4
  var16 = 1
  CallI Wavedash
elif var1 > 18 && Rnd < 0.4
  var16 = 2
  CallI Wavedash
elif var1 > 6 && Rnd < 0.5 && Equal OPos Direction && ODistLE var22
  Button A
  Call Grab
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
Return

