#include <Definition_AIMain.h>
id 0x8100
unk 0x0

XReciever
SetAutoDefend 0
SetDisabledSwitch 1
SetDebugMode 1

if ODistLE 180
  SetDisabledMd 6
else
  SetDisabledMd -1
endif

label

DisableDebugOverlay
if Equal var21 3
  CallI RecoveryHub
endif

// JUMP_HEIGHT_TEST

if Equal var15 -1
  var15 = -100
  if Rnd < 0.45 && !(Equal var21 16.4)
    var21 = 10
  endif
  Seek initial
  Jump
elif Equal var15 -2

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
elif Equal var21 16.3 && Rnd < 0.9 && Rnd > 0.65 && OCurrAction <= 21

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

  if Rnd < 0.1 && Rnd < 0.45
    XGoto CalcAttackGoal
    XReciever
  endif
  
  var17 = OTopNX - TopNX 
  var22 = OTopNY - TopNY
  Norm var0 var17 var22
  if var0 > 45
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
endif

Goto PFC
XReciever


var16 = 0
var20 = -1

DynamicDiceClear
if Rnd < 0.00 && Rnd < 0.00
  DynamicDiceAdd 7
endif
if Rnd < 0.8
  DynamicDiceAdd 10
endif
if Rnd < 0.65
  predictionConfidence var22 9 LevelValue
  if var22 > 0.4 || Rnd < 0.65
    DynamicDiceAdd 16
  endif
endif
DynamicDiceRoll var21
if OFramesHitstun > 5 || ODistLE OHurtboxSize || Equal OCurrAction 73 || Equal HitboxConnected 1
  var21 = 16
endif
if Equal var21 -1
  Call MainHub
elif Equal var21 16
  var9 = BBoundary
endif

label initial
Goto PFC
Seek initial
if Equal var8 0 && Equal var9 0
  XGoto GoalChoiceHub
  XReciever
endif

var0 = LevelValue * 0.01
if var0 < 0
  var0 = 0.05
endif
LOGSTR 1414753024 1768713216 0 0 0
LOGVAL var0
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
XGoto UpdateGoal
XReciever
if Equal var9 BBoundary
  Seek selectGoal
  if Rnd < 0.5
    var21 = 16
  endif
  Return
elif Equal var21 16 && Equal var20 -1
  Seek selectGoal
  if Rnd < 0.5
    var21 = 16
  endif
  Return
endif
LOGSTR 1936026624 1701016576 1701052416 0 0
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
