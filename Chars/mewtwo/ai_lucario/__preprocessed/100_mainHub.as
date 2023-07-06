#include <Definition_AIMain.h>
id 0x8100
unk 0x0

str "PERSONALITY"
str "1.25"
str "0.05"
str "0.45"
str "0.9"
str "0.65"
str "0.15"
str "0.45"
str "0.04"
str "0.1"
str "0.1"
str "1"
str "0.5"
str "0.4"

//= XReciever

// XGoto PerFrameChecks
//= XReciever

SetAutoDefend 0
SetDisabledSwitch 1
SetDebugMode TEMP_DEBUG_TOGGLE
// SetDebugMode 1

SetDisabledMd -1

LOGSTR 1667702784 1835100416 1850962944 1634890752 0
LOGVAL var21
PRINTLN

if TRAINING_MODE_OPTION >= 0
  XGoto PerFrameChecks
  ADJUST_PERSONALITY 0 -100 1
  ADJUST_PERSONALITY 1 -100 1
  ADJUST_PERSONALITY 2 -100 1
  ADJUST_PERSONALITY 3 -100 1
  ADJUST_PERSONALITY 4 -100 1
  ADJUST_PERSONALITY 5 -100 1
  // ADJUST_PERSONALITY 6 -100 1
  // ADJUST_PERSONALITY 7 -100 1
  // ADJUST_PERSONALITY 8 -100 1
  // ADJUST_PERSONALITY 9  1
  ADJUST_PERSONALITY 10 -100 1
  // ADJUST_PERSONALITY 11 100 1
  
  ClearStick
  if Equal TRAINING_MODE_OPTION 1
    ADJUST_PERSONALITY 0 100 1
    ADJUST_PERSONALITY 4 100 1
    Seek initHitPredictValues
  elif Equal TRAINING_MODE_OPTION 5
    ADJUST_PERSONALITY 5 100 1
    ADJUST_PERSONALITY 3 100 1
    Seek initHitPredictValues
  elif Equal TRAINING_MODE_OPTION 6
    Button R
  elif Equal TRAINING_MODE_OPTION 7
    AbsStick 0 -1
  elif Equal TRAINING_MODE_OPTION 4
    if Equal CurrAction 124 || Equal CurrAction 125
      Stick -0.7
    else
      Stick 0.7
    endif 
  elif Equal TRAINING_MODE_OPTION 0
    if Equal AirGroundState 1 && CurrAction <= 10
      Button X
    endif
  endif
  Return
endif

label initHitPredictValues
getCurrentPredictValue var22 10
if Equal var22 0
  trackOAction 10 15
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

if Equal var15 -1
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
  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var0 = var22
  if Equal var0 1
    elif Equal CurrSubaction JumpSquat
      var16 = 1
      Call Wavedash      
    endif
  endif
  Seek initial
  Jump
elif Equal var15 -2
  label empty_0
  XGoto PerFrameChecks
  //= XReciever
  Seek empty_0

  if Equal CurrAction 3 || Equal CurrAction 4
if !(True) || Equal var20 1 || Equal var20 2
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
elif Equal var21 16.3 && CHANCE_MUL_LE PT_WALL_CHANCE 0.45 && !(XDistLE 25) 
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
  LOGSTR_NL 1414089984 1163001856 0 0 0
  LOGVAL_NL var0
  if var0 > 120
    var21 = 0
    Call MainHub
    Return
  endif
  var0 *= 0.35
  label wallDelay
  XGoto PerFrameChecks 
  //= XReciever
  Seek wallDelay
  if var0 <= 0
    CallI ExecuteAttack
  endif
  var0 -= 1
  Return
elif Equal var21 7.1 && CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 1.3 && CHANCE_MUL_LE PT_AGGRESSION 1
  label empty_2
  XGoto PerFrameChecks
  //= XReciever
  Seek empty_2

  Goto isActionable
  if Equal var22 0
    Return
  endif
  Seek initial
  Jump
elif Equal var21 10.4
  Seek waitSetup
  Jump
endif

label rollTactics

XGoto PerFrameChecks
//= XReciever

var16 = 0
var20 = -1

DynamicDiceClear 0
var23 = TopNX - OTopNX
Abs var23
var22 = PT_CIRCLECAMPCHANCE * var23 * 0.025
DynamicDiceAdd 0 10.1 var22
var22 *= 2
DynamicDiceAdd 0 7 var22

// Functions = things that give a value
// Requirements = stuff that go in an if condition
// Commands = controls logic flow and interacts with game itself

var22 = PT_BAITCHANCE
DynamicDiceAdd 0 10 var22
var22 += PT_AGGRESSION
DynamicDiceAdd 0 10.1 var22
var22 = PT_BAIT_DASHAWAYCHANCE * 2
DynamicDiceAdd 0 10.5 var22

var23 = LevelValue * 0.0075
if Equal HitboxConnected 0 && CHANCE_MUL_LE PT_AGGRESSION 0.2
  SeekNoCommit attack_roll
elif CHANCE_MUL_LE PT_AGGRESSION var23
  SeekNoCommit attack_roll
endif
var22 = LevelValue * 0.0075
var23 = 1 - var22
PredictOMov var22 14
var22 *= var23
if var22 < 0.08
  SeekNoCommit attack_roll
elif Equal HitboxConnected 1
  if !(True)
    label attack_roll
  endif
  var22 = PT_BAIT_DASHAWAYCHANCE
  DynamicDiceAdd 0 10.5 var22
  predictionConfidence var22 9
  if var22 > 0.4 || CHANCE_MUL_LE PT_AGGRESSION 0.35
    DynamicDiceAdd 0 16 2
  endif
  var22 = PT_AGGRESSION * 4
  DynamicDiceAdd 0 16 var22
  GetCommitPredictChance var22
  if YDistFloor < 25
    var22 *= 2.5 * PT_WALL_CHANCE
    DynamicDiceAdd 0 16.3 var22
  endif
  var22 = 5 - var22
  DynamicDiceAdd 0 16.4 var22
endif

DynamicDiceRoll 0 var21 0

LOGSTR 1735352576 1811939328 0 0 0
LOGVAL var21
PRINTLN

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
//= XReciever
Seek initial
// if Equal var13 0 && Equal var14 0
//   XGoto GoalChoiceHub
//   //= XReciever
//   Seek initial
// endif
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
// if TEMP_DEBUG_TOGGLE > 0
//   var20 = Damage
//   var21 = 16.4
//   CALL_EVENT(19.1)
//   PRINTLN
//   XGoto SetAttackGoal
//   XGoto CheckAttackWillHit
// else
  XGoto UpdateGoal
  LOGSTR 1667706112 1886352128 1948275968 1883504640 0
  LOGVAL var21
// endif
PRINTLN

if Equal var21 10.4
  label waitSetup
  var4 = Rnd * 55 + 5
  label baitWait
  LOGSTR_NL 1111574784 1415534336 1095324672 0 0
  STACK_PUSH var4 0
  XGoto PerFrameChecks
  //= XReciever
  XGoto UpdateGoal
  //= XReciever
  if Equal CurrAction 73
    XGoto AttackedHub
  endif
  var4 = STACK_POP
  Seek baitWait
  var4 -= 1
  predictAverage var22 10
  var22 *= 0.5
  if XDistLE var22 && Rnd <= 0.02
    CallI DefendHub
  endif
  var22 *= 3
  var22 += 20
  if XDistLE var22 && CHANCE_MUL_LE PT_AGGRESSION 0.05
    var20 = -1
    var21 = 16.3
    Seek selectGoal
    Jump
  endif
  if LevelValue >= 75
    Stick 0 -1
  endif
  // if Rnd < 0.4 && Rnd < 0.65
  //   Seek setupWallDelay
  //   Jump
  // endif
  if var4 <= 0 || !(Equal var21 10.4)
    var21 = 0
    var15 = -100
    Call MainHub
  endif
  Return
elif Equal var14 BBoundary
  Seek selectGoal
  Return
elif Equal var21 16 && Equal var20 -1
  Seek selectGoal
  Return
endif
label navigateToGoal
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
var22 = 0
  var22 = 300
  XGoto GetChrSpecific
  if Equal var22 0 
    Return
  endif
var22 = 1
Return
Return
