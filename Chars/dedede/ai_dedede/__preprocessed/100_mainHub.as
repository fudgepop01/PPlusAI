#include <Definition_AIMain.h>
id 0x8100
unk 0x0

str "PERSONALITY"
str "0.85"
str "0.15"
str "0.75"
str "0.65"
str "0.65"
str "0.35"
str "0.04"
str "0.05"
str "0.05"
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

label start

DisableDebugOverlay
if Equal var21 3
  CallI RecoveryHub
elif var21 >= 16.7
  Seek navigateToGoal
  Jump
endif

Goto PFC
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
    var21 = 16
  elif Rnd < 0.45 && !(Equal var21 16.4) && OFramesHitstun <= 0
    var21 = 10.5
  endif
  Seek initial
  Jump
elif Equal var15 -2
  label empty_0
  Goto PFC
  XReciever
  Seek empty_0

  if Equal CurrAction 3 || Equal CurrAction 4
if !(True) || Equal var20 1
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
  elif CurrAction >= 66 && CurrAction <= 73
  elif Equal CanCancelAttack 1
  elif CurrAction >= 24
    Return
  endif
  var15 = -100

  CallI ExecuteAttack
elif Equal var21 16.3 && CHANCE_MUL_LE PT_WALL_CHANCE 1.4 && CHANCE_MUL_GE PT_BRAVECHANCE 0.35 && OCurrAction <= 21
  label empty_1
  Goto PFC
  XReciever
  Seek empty_1

  if Equal CurrAction 22 
    if Equal PrevAction 33
      Return
    elif AnimFrame <= 3
      Return
    endif
  elif CurrAction >= 66 && CurrAction <= 73
  elif Equal CanCancelAttack 1
  elif CurrAction >= 24
    Return
  endif
  label setupWallDelay
  Goto PFC
  XReciever
  Seek setupWallDelay

  if Rnd < 0.1 && CHANCE_MUL_LE PT_WALL_CHANCE 1
    XGoto CalcAttackGoal
    XReciever
  endif
  
  var17 = OTopNX - TopNX 
  var22 = OTopNY - TopNY
  Norm var0 var17 var22
  if var0 > 55
    Return
  endif
  var0 *= Rnd * 0.2
  label wallDelay
  Goto PFC 
  XReciever
  Seek wallDelay
  if var0 <= 0
    CallI ExecuteAttack
  endif
  var0 -= 1
  Return
elif Equal var21 7.1 && CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 1.3 && CHANCE_MUL_LE PT_AGGRESSION 1
  label empty_2
  Goto PFC
  XReciever
  Seek empty_2

  if Equal CurrAction 22 
    if Equal PrevAction 33
      Return
    elif AnimFrame <= 3
      Return
    endif
  elif CurrAction >= 66 && CurrAction <= 73
  elif Equal CanCancelAttack 1
  elif CurrAction >= 24
    Return
  endif
  Seek initial
  Jump
elif Equal var21 10.4
  Seek waitSetup
  Jump
endif

Goto PFC
XReciever

var16 = 0
var20 = -1

DynamicDiceClear 0
if CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 1
  DynamicDiceAdd 0 7 1
endif
if CHANCE_MUL_LE PT_BAITCHANCE 1
  DynamicDiceAdd 0 10 1
  DynamicDiceAdd 0 10.5 4
endif
if CHANCE_MUL_LE PT_AGGRESSION 1
  predictionConfidence var22 9 LevelValue
  if var22 > 0.4 || CHANCE_MUL_LE PT_AGGRESSION 0.35
    DynamicDiceAdd 0 16 2
  endif
endif
DynamicDiceRoll 0 var21 0

  var22 = 200
  XGoto GetChrSpecific
  XReciever
if Equal var3 1
  var21 = 7
elif Equal HitboxConnected 1 || Equal PrevAction 60
  var21 = 16
elif Equal var22 1
  var21 = 16
endif
var14 = BBoundary
if Equal var21 -1
  Call MainHub
elif Equal var21 16
  var14 = BBoundary
endif

label initial
Goto PFC
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
Goto PFC
XReciever
Seek tskillWait
if Rnd < var0
  Seek selectGoal
  Return
endif
LOGSTR 2002872576 1953066496 1728053248 0 0
Return
label selectGoal
Goto PFC
XReciever
XGoto UpdateGoal
XReciever

if Equal var21 10.4
  label waitSetup
  var4 = Rnd * 55 + 5
  label baitWait
  Goto PFC
  XReciever
  XGoto UpdateGoal
  XReciever
  Seek baitWait
  var4 -= 1
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
Goto PFC
XReciever
Seek selectGoal
  if Equal CurrAction 22 
    if Equal PrevAction 33
      Return
    elif AnimFrame <= 3
      Return
    endif
  elif CurrAction >= 66 && CurrAction <= 73
  elif Equal CanCancelAttack 1
  elif CurrAction >= 24
    Return
  endif

XGoto MoveToGoal
XReciever
Seek selectGoal
Return
label PFC
XGoto PerFrameChecks
XReciever
Return
Return
