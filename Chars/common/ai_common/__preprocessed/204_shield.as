#include <Definition_AIMain.h>
id 0x8204
unk 0x0

//= XReciever
label setup

var0 = 0

var3 = 0
PredictOMov var22 15 LevelValue
if CHANCE_MUL_LE PT_AGGRESSION 0.35 || var22 > 0.4
  var3 = 1
endif

var2 = Rnd * 35 + 5
PredictOMov var22 14 LevelValue
if Equal var21 10.2 || var22 > 0.36
  var22 = 30 * Rnd + 10
  var2 += var22
endif
if Equal var21 13.1
  var2 *= 0.5
endif
label shield
XGoto PerFrameChecks
//= XReciever
Seek shield

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
  GetCommitPredictChance var22 LevelValue
  PredictOMov var23 15 LevelValue
  if Rnd < 0.1 && var22 > 0.125
    Goto rollOption
  elif var23 > 0.125
    Goto rollOption
  endif
endif

Seek shield
// LOGSTR_NL 1701733376 1811939328 0 0 0
// LOGVAL_NL var1

if Equal CurrAction 29
  MOD var17 var2 14
  if Equal var17 0
    if var1 >= 25
      AbsStick OPos
    else
      var22 = OPos * -1
      AbsStick var22
    endif
  endif 
  var0 += 1
endif
  var22 = 0.004
  XGoto GetChrSpecific
  //= XReciever
var1 = var22
if OCurrAction >= 36 && OCurrAction <= 52 || OCurrAction >= 274 && Equal var1 -1
  var2 += 1
  Return
endif

MOD var17 var2 3
if Equal var17 0 || var2 <= 0
  if Equal CurrAction 27 || Equal CurrAction 17 || Equal CurrAction 18
    GetShieldRemain var17
    var22 = var0 * 0.05
    GetCommitPredictChance var23 LevelValue
    if var17 < 40 || var1 > 6 || !(XDistLE 50)
      Seek pickOption
      Jump
    elif var23 > 0.20 && Rnd <= 0.85 && Equal var3 0
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
predictAverage var22 10 LevelValue
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
    GetCommitPredictChance var22 LevelValue
    if !(Equal var21 13.1)
      Button X
      Seek jumpExec
      // LOGSTR_NL 1786080512 1885957632 1728053248 0 0
      Return
    endif
    label jumpExec
    // LOGSTR_NL 1702388992 1667853824 1728053248 0 0
    XGoto CalcAttackGoal
    //= XReciever
    var16 = 0
    XGoto SetAttackGoal
    //= XReciever
    var15 = -1
    var21 = 16.4
    CallI MainHub
  endif

  var22 -= 10
  if Equal OPos Direction && XDistLE 10
    if var1 > 5 && Rnd < 0.75 || Equal var3 1
      Button A
      Call ExecuteAttack
    endif
  endif
endif

if !(Equal var21 13.1)
  // LOGSTR_NL 2003062784 1818321664 1694498816 0 0
  if var1 > 15 && Rnd < 0.75
    Goto wdPunish
  elif var1 > 4 && Rnd < 0.4
    var16 = 2
    var21 = 0
    CallI Wavedash
  endif

  if Rnd < 0.3
    predictionConfidence var22 7 LevelValue
    predictOOption var17 7 LevelValue 
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
if XDistBackEdge > -10 && XDistFrontEdge < 10
  var16 = 4
endif
var15 = -1
var21 = 16.4
CallI Wavedash
label rollOption
if Rnd < 0.03333333333333333
  AbsStick OPos
elif Rnd < 0.06666666666666667
  var22 = OPos * -1
  AbsStick var22
elif Rnd < 0.1
  AbsStick 0 (-1)
endif
Return
Return
