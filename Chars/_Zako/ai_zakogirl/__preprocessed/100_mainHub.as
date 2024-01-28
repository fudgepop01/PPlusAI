#include <Definition_AIMain.h>
id 0x8100
unk 0x0

str "PERSONALITY"
str "10.00"
str "0.3"
str "0.5"
str "1.01"
str "0.45"
str "0.45"
str "0.15"
str "0.2"
str "0.23"
str "1"
str "0.5"
str "0.6"

//= XReciever

// XGoto PerFrameChecks
//= XReciever

SetAutoDefend 0
SetDisabledSwitch 1
SetDebugMode 0
// SetDebugMode 1

SetDisabledMd -1

label initHitPredictValues
getCurrentPredictValue var22 10
if Equal var22 0
  trackOAction 10 20
  trackOAction 11 40
  trackOAction 4 250
  Seek initHitPredictValues
  Jump
endif

label start

DisableDebugOverlay
if Equal var21 3 && Equal YDistFloor -1
  CallI RecoveryHub
elif var21 >= 16.7
  var20 = -1
  Seek navigateToGoal
  Jump
endif

XGoto PerFrameChecks
//= XReciever
Seek start

GetIsTeammateCloser var3
if Equal var3 1
  var15 = -100
endif

if Equal var15 -10
  var15 = -100
  var22 = 200
  XGoto GetChrSpecific
  //= XReciever
  if Equal var22 1
    var21 = 16.4
  endif
  if !(Equal var20 -1)
    XGoto SetAttackGoal
    //= XReciever
  STACK_PUSH var22 0
  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var0 = var22
  var22 = STACK_POP
  if Equal var0 1
elif Equal var20 6
elif !(True)
    elif Equal CurrSubaction JumpSquat
      var16 = 1
      Call Wavedash      
    endif
  endif
  Seek initial
  Jump
elif Equal var15 -20
  label empty_0
  XGoto PerFrameChecks
  //= XReciever
  Seek empty_0

  if Equal CurrAction 3 || Equal CurrAction 4
if Equal var20 1
    elif True
      if Equal var21 13
        var16 = 2
      endif
      var16 = 3
      CallI Wavedash 
    endif
  endif
  Goto isActionable
  Seek empty_0
  if Equal var22 0
    Return
  endif
  var15 = -100

  CallI ExecuteAttack
elif Equal var21 16.3 && CHANCE_MUL_LE PT_WALL_CHANCE 0.45
  if YDistFloor > 25
    var21 = 0
    var20 = -1
    Seek rollTactics
    Jump
  endif
  label empty_1
  XGoto PerFrameChecks
  //= XReciever
  Seek empty_1

  Goto isActionable
  if Equal var22 0
    Return
  endif
  label setupWallDelay
  XGoto PerFrameChecks
  //= XReciever

  if Rnd < 0.1 && CHANCE_MUL_LE PT_WALL_CHANCE 1
    XGoto CalcAttackGoal
  elif Equal var20 -1 
    XGoto CalcAttackGoal
  endif
  Seek setupWallDelay
  
  var17 = OTopNX - TopNX 
  var22 = OTopNY - TopNY
  Norm var0 var17 var22
  Abs var0
  if var0 > 120
    var21 = 0
    Call MainHub
    Return
  endif
  var0 *= 0.4 * Rnd
  label wallDelay
  XGoto PerFrameChecks 
  //= XReciever
  Seek wallDelay
  if var0 <= 0
    CallI ExecuteAttack
  endif
  var0 -= 1
  Return
endif

label rollTactics

XGoto PerFrameChecks
//= XReciever

var16 = 0
var20 = -1

DynamicDiceClear 0

predictionConfidence var22 9
if var22 > 0.4 || CHANCE_MUL_LE PT_AGGRESSION 0.35
  DynamicDiceAdd 0 16 2
endif
var22 = PT_AGGRESSION * 4
DynamicDiceAdd 0 16 var22
GetCommitPredictChance var22
if YDistFloor < 25
  var22 *= 8 * PT_WALL_CHANCE
  DynamicDiceAdd 0 16.3 var22
endif
var22 = 5 - var22
DynamicDiceAdd 0 16.4 var22

DynamicDiceRoll 0 var21 0

  var22 = 200
  XGoto GetChrSpecific
  //= XReciever
if Equal var3 1
  var21 = 7
elif Equal HitboxConnected 1 || Equal PrevAction 60
  var21 = 16.4
elif Equal var22 1
  var21 = 16.4
endif
var14 = BBoundary
if Equal var21 -1
  Call MainHub
elif Equal var21 16
  var14 = BBoundary
endif

label initial
XGoto PerFrameChecks
Seek initial
Goto isActionable
if Equal var22 0
  Seek initial
  Return
endif

var0 = LevelValue * 0.01
if var0 < 0
  var0 = 0.01
endif
label tskillWait
XGoto PerFrameChecks
Seek tskillWait
if Rnd < var0
  Seek selectGoal
  Jump
endif
Return
label selectGoal
XGoto PerFrameChecks
Cmd30
XGoto UpdateGoal

elif Equal var14 BBoundary
  Return
elif Equal var21 16 && Equal var20 -1
  Return
endif
if !(True)
  label navigateToGoal
endif
Seek selectGoal
{NAVIGATION_OVERRIDE}
if Equal var16 -99
  var16 = 0
  Return
endif
XGoto PerFrameChecks
Goto isActionable
Seek selectGoal
if Equal var22 0
  Return
endif

XGoto MoveToGoal
Seek selectGoal
Return
label isActionable
{ISACTIONABLE_OVERRIDE}
var22 = 0

if Equal CanCancelAttack 1
elif Equal HitboxConnected 1 && HasCurry
elif CurrAction >= 103 && CurrAction <= 109
elif Equal CurrAction 22 
  if Equal PrevAction 33
    Return
  elif AnimFrame <= 3
    Return
  endif
elif CurrAction >= 24 && !(Equal CurrAction 73) && !(Equal CurrAction 103) && !(Equal CurrAction 108)
  Return
endif

var22 = 1
Return
Return
