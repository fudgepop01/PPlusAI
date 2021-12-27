#include <Definition_AIMain.h>
id 0x8102
unk 0x0

XReciever
EnableDebugOverlay 
SetDebugOverlayColor 221 221 0 136
if Equal var21 3
  var16 = 2
  CallI AerialDrift
  Return
endif
var21 = 13
label begin
XGoto PerFrameChecks
XReciever

if Equal AirGroundState 1
  var10 = 3
  XGoto GetChrSpecific
  XReciever
  var0 = var10

  var10 = 4
  XGoto GetChrSpecific
  XReciever
  var1 = var10

  var22 = var0 * 0.5
  if !(Equal OCurrAction 0) && Rnd < var22
    if !(Equal var20 -1) && Rnd < var0
      CallI ExecuteAttack
    elif Rnd < var0 && Rnd < var0 && Rnd < 0.45
      CallI CalcAttackGoal
    endif 
  endif

  predictOOption var22 7 LevelValue
  predictionConfidence var17 7 LevelValue
  var17 *= 2
  if Rnd > var0 && Rnd < var17 && Equal var22 1
    CallI Shield
  endif

  predictAverage var0 10 LevelValue
  var23 = var0 + 5

  GetAttribute var22 4 0

  var21 = 10.5
  var15 = -1

  var10 = 5
  XGoto GetChrSpecific
  XReciever
  var0 = var10
  if Equal IsOnPassableGround 1 && Rnd <= 0.20 && LevelValue >= 60
    CallI Shield
  elif var22 > 0.8 && Rnd < var0 && LevelValue >= 42 && Rnd < 0.85 && !(ODistLE var23)
    var16 = 2
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
      GetAttribute var22 4 0
      var22 *= 8
      if Rnd < 0.1 && var22 > var0
        var16 = 4
        CallI DashScr
      endif
    elif Rnd < 0.2
  var10 = 1
  XGoto GetChrSpecific
  XReciever
  var0 = var10
      if Rnd < 0.2
        var16 = 1
        CallI Roll
      elif Rnd < 0.4 && Rnd < var0
        var16 = 1
        CallI JumpScr
      endif
      GetAttribute var22 4 0
      var22 *= 8
      if Rnd < 0.2 && var22 > var0
        var16 = 4
        CallI DashScr
      endif
    endif
  endif

  GetAttribute var22 12 0
  var22 *= 0.1
  var22 = 0.7 - var22
  var10 = 6
  XGoto GetChrSpecific
  XReciever
  var0 = var10
  if Rnd < var22 && Rnd < var0
    var16 = 2
    CallI Wavedash
  endif

  GetAttribute var22 4 0
  var22 *= 5
  var17 = OTopNX - TopNX
  Abs var17
  var22 += var17
  var10 = 5
  XGoto GetChrSpecific
  XReciever
  var0 = var10

  if var0 < var22 && Rnd < var0 && Rnd < 0.6
    var16 = 2
    CallI DashScr
  endif
endif

// maybe make driftAway based on air mobility?
predictAverage var0 10 LevelValue
var0 += 15
if Rnd < 0.1 && !(ODistLE var0)
  if NumJumps > 0 && Rnd < 0.4
    var16 = 1
    CallI JumpScr
  elif NumJumps > 0 && Rnd < 0.4
    var16 = 3
    CallI JumpScr
  elif Rnd < 0.4 && !(OutOfStage) 
    var16 = 2
    CallI AerialDrift
  endif
endif

if Equal AirGroundState 1
  CallI Shield
endif
CallI FastAerial
Return
Return
