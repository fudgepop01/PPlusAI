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
  predictAverage var0 10 LevelValue

  GetAttribute var22 4 0
  if Equal IsOnPassableGround 1 && Rnd <= 0.35 && LevelValue >= 60
    CallI Shield
  elif var22 > 0.8 && Rnd < 0.75 && Rnd < 0.75
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
    elif Rnd < 0.8
      if Rnd < 0.4
        var16 = 1
        CallI Roll
      elif Rnd < 0.6
        var16 = 1
        CallI JumpScr
      endif
      GetAttribute var22 4 0
      var22 *= 8
      if Rnd < 0.7 && var22 > var0
        var16 = 4
        CallI DashScr
      endif
    endif
  endif

  GetAttribute var22 12 0
  var22 *= 0.1
  var22 = 0.8 - var22
  if Rnd < var22
    var16 = 2
    CallI Wavedash
  endif

  GetAttribute var22 4 0
  var22 *= 5
  var17 = OTopNX - TopNX
  Abs var17
  var22 += var17
  if var0 < var22
    var16 = 2
    CallI DashScr
  endif

  CallI Shield
endif

// maybe make driftAway based on air mobility?
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

// CallI FastAerial

Return
Return