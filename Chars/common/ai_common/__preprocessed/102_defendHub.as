#include <Definition_AIMain.h>
id 0x8102
unk 0x0

XReciever
EnableDebugOverlay 
SetDebugOverlayColor 221 221 0 136
var21 = 13
label begin
XGoto PerFrameChecks
XReciever

var0 = PT_AGGRESSION

var1 = PT_BAITCHANCE

var22 = var0 * 0.3
PredictOMov var17 15 LevelValue
var17 *= 3
if Rnd < var22 || Rnd < var17
  var22 *= 2
  if !(Equal var20 -1) && Rnd < var22
    var15 = -2
    CallI MainHub
  elif Rnd < var22 && Rnd < var22 && Rnd < 0.45
    XGoto CalcAttackGoal
    XReciever
    var15 = -1
    CallI MainHub
  endif 
endif

if Equal AirGroundState 1
  predictOOption var22 7 LevelValue
  predictionConfidence var17 7 LevelValue
  var17 *= 2
  if CHANCE_MUL_GE PT_AGGRESSION 0.35 && Rnd < var17 && Equal var22 1
    PredictOMov var22 15 LevelValue
    var22 *= 2.5
    if var22 < 0.20
      CallI Shield
    endif
  endif

  var22 = var0 * 0.2
  if Rnd < 0.5
    var21 = 10
  else
    var21 = 10.5
  endif
  var15 = -1
  if Rnd < var22 && Rnd < var22
    var21 = 16.4
    var15 = -1
  endif

  predictAverage var2 10 LevelValue
  var23 = var2 + 15

  var3 = PT_BAIT_DASHAWAYCHANCE

  GetAttribute var22 40; 0

  if Equal IsOnPassableGround 1 && Rnd <= 0.20 && LevelValue >= 60
    CallI Shield
  elif var22 > 0.7 && CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 1.25 && LevelValue >= 42 && Rnd < 0.85 && ODistLE var23
    var16 = 3
    CallI DashScr
  endif

  var22 = OTopNX * TopNX
  if var22 >= 0
    var22 = TopNX
    var17 = OTopNX
    Abs var22
    Abs var17
    if var22 < var17 && Rnd < 0.1
      if Rnd < 0.1
        var16 = 1
        CallI Roll
      endif
      GetAttribute var22 40; 0
      var22 *= 8
      if Rnd < 0.1 && var22 > var2
        var16 = 5
        CallI DashScr
      endif
    elif Rnd < 0.2
      var0 = PT_DJUMPINESS
      if Rnd < 0.2
        var16 = 1
        CallI Roll
      elif Rnd < 0.4 && Rnd < var0
        var16 = 1
        var16 += 0.1
        CallI JumpScr
      endif
      GetAttribute var22 40; 0
      var22 *= 8
      if Rnd < 0.2 && var22 > var2
        var16 = 5
        CallI DashScr
      endif
    endif
  endif

  var0 = PT_BAIT_WDASHAWAYCHANCE

  GetAttribute var22 940; 0
  var22 *= 0.1
  var22 = 0.7 - var22
  if Rnd < var22 && Rnd < var0
    var16 = 2
    CallI Wavedash
  endif

  var0 = PT_BAIT_DASHAWAYCHANCE

  GetAttribute var22 40; 0
  var22 *= 5
  var17 = OTopNX - TopNX
  Abs var17
  var22 += var17

  if var2 < var22 && Rnd < var0 && Rnd < 0.6
    var16 = 2
    CallI DashScr
  endif
endif

// maybe make driftAway based on air mobility?
predictAverage var0 10 LevelValue
var0 += 15
if Rnd < 0.35
  var22 = PT_JUMPINESS
  if Rnd < var22 
    if NumJumps > 0 && Rnd < 0.4
      var16 = 1
      var16 += 0.1
      CallI JumpScr
    elif NumJumps > 0 && Rnd < 0.1
      var16 = 3
      var16 += 0.1
      CallI JumpScr
    elif Rnd < 0.4 && YDistFloor > 25
      var16 = 2
      CallI AerialDrift
    endif
  endif
endif

PredictOMov var22 15 LevelValue
var22 *= 2
if var22 < 0.30 && Rnd > var22
  if Equal AirGroundState 1
    CallI Shield
  endif
elif True
  if !(Equal var20 -1)
    var15 = -2
    CallI MainHub
  else
    XGoto CalcAttackGoal
    XReciever
    var15 = -1
    CallI MainHub
  endif 
endif
Return
Return
