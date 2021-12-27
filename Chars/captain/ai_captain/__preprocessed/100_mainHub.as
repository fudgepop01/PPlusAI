#include <Definition_AIMain.h>
id 0x8100
unk 0x0

XReciever
SetAutoDefend 0
SetDisabledSwitch 1
SetDebugMode 0

if ODistLE 180
  SetDisabledMd 6
else
  SetDisabledMd -1
endif

label start

DisableDebugOverlay
if Equal var21 3
  CallI RecoveryHub
elif Equal var21 16.5
  Seek navigateToGoal
  Jump
endif

// JUMP_HEIGHT_TEST

Goto PFC
Seek start

GetIsTeammateCloser var3
if Equal var3 1
  var15 = -100
endif

if Equal var15 -1
  var15 = -100
  if OCurrAction >= 66 && OCurrAction <= 89
    var21 = 16
  elif Equal HitboxConnected 1 || Equal PrevAction 60
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
elif Equal var21 16.3 && Rnd < 1.0499999999999998 && Rnd > 0.24499999999999997 && OCurrAction <= 21
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

  if Rnd < 0.1 && Rnd < 0.75
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
elif Equal var21 7.1 && Rnd < 0.5850000000000001 && Rnd < 0.76
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

var16 = 0
var20 = -1

DynamicDiceClear
if Rnd < 0.45
  DynamicDiceAdd 7
endif
if Rnd < 0.85
  DynamicDiceAdd 10
  DynamicDiceAdd 10.5
endif
if Rnd < 0.76
  predictionConfidence var22 9 LevelValue
  if var22 > 0.4 || Rnd < 0.26599999999999996
    DynamicDiceAdd 16
  endif
endif
DynamicDiceRoll var21
if Equal var3 1
  var21 = 7
elif Equal HitboxConnected 1 || Equal PrevAction 60
  var21 = 16
elif OCurrAction >= 66 && OCurrAction <= 89
  var21 = 16
endif
var9 = BBoundary
if Equal var21 -1
  Call MainHub
elif Equal var21 16
  var9 = BBoundary
endif

label initial
Goto PFC
XReciever
Seek initial
if Equal var8 0 && Equal var9 0
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
  // if Rnd < 0.75 && Rnd < 0.7
  //   Seek setupWallDelay
  //   Jump
  // endif
  if var4 <= 0 || !(Equal var21 10.4)
    var21 = 16
    Seek selectGoal
  endif
  Return
elif Equal var9 BBoundary
  Seek selectGoal
  if Rnd < 0.1
    var21 = 10.5
  endif
  Return
elif Equal var21 16 && Equal var20 -1
  Seek selectGoal
  Return
endif
LOGSTR 1936026624 1701016576 1701052416 0 0
label navigateToGoal
LOGSTR 1129665024 1380273664 1411401472 1329679360 973078528
LOGVAL var21
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

Goto PFC
XReciever
XGoto MoveToGoal
XReciever
Seek selectGoal
Return
label PFC
XGoto PerFrameChecks
XReciever
Return
Return
