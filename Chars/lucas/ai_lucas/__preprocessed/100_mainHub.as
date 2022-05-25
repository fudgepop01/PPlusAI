#include <Definition_AIMain.h>
id 0x8100
unk 0x0

str "PERSONALITY"
str "1.25"
str "0.30"
str "0.65"
str "0.9"
str "0.65"
str "0.65"
str "0.5"
str "0.03"
str "0.05"
str "0.23"
str "1"
str "0.5"
str "0.45"

XReciever
SetAutoDefend 0
SetDisabledSwitch 1
SetDebugMode TEMP_DEBUG_TOGGLE

if ODistLE 180
  SetDisabledMd 6
else
  SetDisabledMd -1
endif

label initHitPredictValues
getCurrentPredictValue var22 10
if Equal var22 0
  trackOAction 10 25
  Seek initHitPredictValues
  Jump
endif

label start

DisableDebugOverlay
if Equal var21 3
  CallI RecoveryHub
elif var21 >= 16.7
  Seek navigateToGoal
  Jump
endif

XGoto PerFrameChecks
XReciever
Seek start

GetIsTeammateCloser var3
if Equal var3 1
  var15 = -100
endif

if Equal var15 -1
  var15 = -100
  var22 = 200
  XGoto GetChrSpecific
  XReciever
  if Equal var22 1 
    var21 = 16.4
  elif Rnd < 0.45 && !(Equal var21 16.4) && OFramesHitstun <= 0
    var21 = 10.5
  endif
  Seek initial
  Jump
elif Equal var15 -2
  label empty_0
  XGoto PerFrameChecks
  XReciever
  Seek empty_0

  if Equal CurrAction 3 || Equal CurrAction 4
if !(True) || Equal var20 2 || Equal var20 3
    elif True
      if Equal var21 13
        var16 = 2
      endif
      var16 = 3
      CallI Wavedash 
    endif
  endif
  if Equal CurrAction 22 
    if Equal PrevAction 33
      Return
    elif AnimFrame <= 3
      Return
    endif
  elif Equal CanCancelAttack 1
  elif CurrAction >= 24 && !(Equal CurrAction 73)
    Return
  endif
  var15 = -100

  CallI ExecuteAttack
elif Equal var21 16.3 && CHANCE_MUL_LE PT_WALL_CHANCE 0.45 && !(XDistLE 25)
  label empty_1
  XGoto PerFrameChecks
  XReciever
  Seek empty_1

  if Equal CurrAction 22 
    if Equal PrevAction 33
      Return
    elif AnimFrame <= 3
      Return
    endif
  elif Equal CanCancelAttack 1
  elif CurrAction >= 24 && !(Equal CurrAction 73)
    Return
  endif
  label setupWallDelay
  XGoto PerFrameChecks
  XReciever

  if Rnd < 0.1 && CHANCE_MUL_LE PT_WALL_CHANCE 1
    XGoto CalcAttackGoal
    XReciever
  endif
  Seek setupWallDelay
  
  var17 = OTopNX - TopNX 
  var22 = OTopNY - TopNY
  Norm var0 var17 var22
  Abs var0
  LOGSTR_NL 1414089984 1163001856 0 0 0
  LOGVAL_NL var0
  if var0 > 100
    Return
  endif
  var0 *= Rnd * 0.2
  label wallDelay
  XGoto PerFrameChecks 
  XReciever
  Seek wallDelay
  if var0 <= 0
    CallI ExecuteAttack
  endif
  var0 -= 1
  Return
elif Equal var21 7.1 && CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 1.3 && CHANCE_MUL_LE PT_AGGRESSION 1
  label empty_2
  XGoto PerFrameChecks
  XReciever
  Seek empty_2

  if Equal CurrAction 22 
    if Equal PrevAction 33
      Return
    elif AnimFrame <= 3
      Return
    endif
  elif Equal CanCancelAttack 1
  elif CurrAction >= 24 && !(Equal CurrAction 73)
    Return
  endif
  Seek initial
  Jump
elif Equal var21 10.4
  Seek waitSetup
  Jump
endif

XGoto PerFrameChecks
XReciever

var16 = 0
var20 = -1

DynamicDiceClear 0
if CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 1
  DynamicDiceAdd 0 7 2
endif

var22 = PT_BAITCHANCE * 6
DynamicDiceAdd 0 10 var22
var22 = PT_BAIT_DASHAWAYCHANCE * 10
DynamicDiceAdd 0 10.5 var22

if Equal HitboxConnected 0 && CHANCE_MUL_LE PT_AGGRESSION 0.3
  SeekNoCommit attack_roll
elif CHANCE_MUL_LE PT_AGGRESSION 0.6
  SeekNoCommit attack_roll
elif Equal HitboxConnected 1
  if !(True)
    label attack_roll
  endif
  predictionConfidence var22 9 LevelValue
  if var22 > 0.4 || CHANCE_MUL_LE PT_AGGRESSION 0.35
    DynamicDiceAdd 0 16 2
  endif
  var22 = PT_AGGRESSION * 4
  DynamicDiceAdd 0 16 var22
  GetCommitPredictChance var22 LevelValue
  var22 *= 5
  DynamicDiceAdd 0 16.3 var22
  var22 = 5 - var22
  DynamicDiceAdd 0 16.4 var22
endif

DynamicDiceRoll 0 var21 0

  var22 = 200
  XGoto GetChrSpecific
  XReciever
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
XReciever
Seek initial
if Equal var13 0 && Equal var14 0
  XGoto GoalChoiceHub
  XReciever
  Seek initial
endif

var0 = LevelValue * 0.01
if var0 < 0
  var0 = 0.05
endif
label tskillWait
XGoto PerFrameChecks
XReciever
Seek tskillWait
if Rnd < var0
  Seek selectGoal
  Return
endif
LOGSTR 2002872576 1953066496 1728053248 0 0
Return
label selectGoal
XGoto PerFrameChecks
XReciever
Cmd30
XGoto UpdateGoal
XReciever

if Equal var21 10.4
  label waitSetup
  var4 = Rnd * 55 + 5
  label baitWait
  XGoto PerFrameChecks
  XReciever
  XGoto UpdateGoal
  XReciever
  Seek baitWait
  var4 -= 1
  predictAverage var22 10 LevelValue
  var22 *= 0.5
  if XDistLE var22 && Rnd <= 0.02
    CallI DefendHub
  endif
  if LevelValue >= 75
    Stick 0 -1
  endif
  // if Rnd < 0.45 && Rnd < 0.65
  //   Seek setupWallDelay
  //   Jump
  // endif
  if var4 <= 0 || !(Equal var21 10.4)
    var21 = 16
    Seek selectGoal
  endif
  Return
elif Equal var14 BBoundary
  Seek selectGoal
  if Rnd < 0.1
    var21 = 10.5
  endif
  Return
elif Equal var21 16 && Equal var20 -1
  Seek selectGoal
  Return
endif
label navigateToGoal
XGoto PerFrameChecks
XReciever
Seek selectGoal
  if Equal CurrAction 22 
    if Equal PrevAction 33
      Return
    elif AnimFrame <= 3
      Return
    endif
  elif Equal CanCancelAttack 1
  elif CurrAction >= 24 && !(Equal CurrAction 73)
    Return
  endif

XGoto MoveToGoal
XReciever
Seek selectGoal
Return
Return
