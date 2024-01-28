#include <Definition_AIMain.h>
id 0x8204
unk 0x0

//= XReciever
label setup

var0 = 0

var3 = 0
PredictOMov var22 15
if CHANCE_MUL_LE PT_AGGRESSION 0.35 || var22 > 0.4
  var3 = 1
endif

var2 = Rnd * 35 + 5
PredictOMov var22 14
if Equal var21 10.2 || var22 > 0.36
  var22 = 30 * Rnd + 10
  var2 += var22
endif
if Equal var21 13.1
  var2 *= 1.5
endif
label shield
XGoto PerFrameChecks
//= XReciever
Seek shield

  var22 = 0.004
  XGoto GetChrSpecific
  //= XReciever
var1 = var22
Seek shield
if CurrAction >= 30 && CurrAction <= 32
  Return
elif CurrAction <= 16 && PrevAction >= 30 && PrevAction <= 32
  var21 = 0
  CallI MainHub
endif

if Equal CurrAction 57
  var21 = 16.4
  CallI ExecuteAttack
elif !(Equal AirGroundState 1)
  Return
endif

var2 -= 1
if Equal var21 13.1
  AbsStick 0 (-0.7)
  if var2 <= 0
    CallI MainHub
  endif
else
  Button R
  predictAverage var17 10
  if XDistLE var17
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
    if !(Equal var21 10.2)
      GetCommitPredictChance var22
      PredictOMov var23 15
      if Rnd < 0.3 && var22 > 0.21
        Goto rollOption
      elif var23 > 0.12
        Goto rollOption
      endif
    endif
  endif
endif

Seek shield
// LOGSTR_NL str("endl")
// LOGVAL_NL OEndLag
if Equal CurrAction 29
  MOD var17 GameTimer 14
  if Equal var17 0
    if var1 >= 17
      AbsStick OPos
    else
      var22 = OPos * -1
      AbsStick var22
    endif
  endif 
  var0 += 1
endif
if OCurrAction >= 36 && OCurrAction <= 52 || OCurrAction >= 274 && Equal var1 -1 && CurrAction <= 30
  var2 += 1
  Return
endif

MOD var17 GameTimer 3
if Equal var17 0 || var2 <= 0
  if Equal CurrAction 27 || Equal CurrAction 17 || Equal CurrAction 18
    GetShieldRemain var17
    var22 = var0 * 0.05
    GetCommitPredictChance var23
    if var17 < 40 || var1 > 6 || !(XDistLE 50)
      Seek pickOption
      Jump
    elif var23 > 0.25 && Rnd <= 0.85 && Equal var3 0
      Return
    elif Equal var3 1 && XDistLE 40 && Rnd < 0.4
      Seek pickOption
      Jump
    elif OAttacking && var1 < 1
      Return
    elif Rnd <= var22
      Seek pickOption
      Jump
    elif var2 <= 0 && !(XDistLE 10)
      Seek pickOption
      Jump
    endif
  endif
endif
Return
label pickOption
var1 += 8
predictAverage var22 10
var22 += 10
if CHANCE_MUL_LE PT_AGGRESSION 0.35 || Equal var3 1 || var1 > 10
  if var1 > 10 && Rnd < 0.85
    Seek exec_attack
    Jump
  elif Rnd < 0.2 && XDistLE var22
    Seek exec_attack
    Jump
  elif Rnd < 0.6 && Equal var3 1
    Seek exec_attack
    Jump
  endif
  
  if !(True)
    label exec_attack
    if !(Equal var21 13.1)
      Button X
      Seek jumpExec
      // LOGSTR_NL str("jumping")
      Return
    endif
    label jumpExec
    // LOGSTR_NL str("execing")
    XGoto CalcAttackGoal
    //= XReciever
    var16 = 0
    XGoto SetAttackGoal
    //= XReciever
    var15 = -10
    var21 = 16.5
    CallI MainHub
  endif

  if Equal OPos Direction && XDistLE 10
    if var1 > 5 && Rnd < 0.75 || Equal var3 1
      Button A
      Call ExecuteAttack
    endif
  endif
endif

if !(Equal var21 13.1)
  // LOGSTR_NL str("wdPlace")
  if var1 > 15 && Rnd < 0.75
    Goto wdPunish
  elif var1 > 4 && Rnd < 0.4
    var16 = 2
    var21 = 0
    CallI Wavedash
  endif

  if Rnd < 0.3
    predictionConfidence var22 7
    predictOOption var17 7 
    if Rnd < var22
      if Equal var17 1 && Rnd < var22
        if Rnd < 0.3
          var16 = 3
          if XDistBackEdge > -15
            var16 = 1.1
          endif
          CallI JumpScr
        endif
        Seek shield
        Return
      elif True
        Goto wdPunish
      endif
    endif
  endif
endif
Seek shield
Return
label wdPunish
var16 = 1
if XDistBackEdge > -10 || XDistFrontEdge < 10
  var16 = 4
endif
var15 = -10
var21 = 16.5
CallI Wavedash
label rollOption
Seek RO_Exec
ClearStick
Return
label RO_Exec
Button R
var22 = Rnd
if var22 < 0.2
  AbsStick OPos
elif var22 < 0.4
  var22 = OPos * -1
  AbsStick var22
else
  AbsStick 0 (-1)
endif
Seek shield
Return
Return
