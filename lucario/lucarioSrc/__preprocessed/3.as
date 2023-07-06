// EDGEGUARD HUB
// a place to figure out how to edgeguard the opponent
#include <Definition_AIMain.h>
id 0x8003

unk 0x0

// LOGSTR 1667329024 1818584064 0 0 0

if FramesHitstun > 0
  Call AIHub
  Return
endif


// I don't know why this is necessary but I hate the fact that
// it is with a burning passion
if Equal CurrAction 276
  Call RecoveryHub
endif

if Equal var21 32769 && XDistLE 20 && OYDistBackEdge < 0 && Equal var18 0 && OFramesHitstun > 0
  var16 = 3
  Call ApproachHub
endif

SetVec var1 Zero
GetNearestCliff var1

var1 = TopNX - var1
var1 *= -1
var2 = var2 - TopNY * -1

var0 = var1
Abs var0
var4 = OXDistFrontEdge
Abs var4

// if it's not worth going for an edgeguard, don't bother
if Equal OIsOnStage 1
  var18 = 255
  Call RecoveryHub
elif Equal IsOnStage 0 && YSpeed < 0.15 && YDistFrontEdge > 50 && !(Equal CurrAction 121)
  var18 = 255
  Call RecoveryHub
elif Equal IsOnStage 0 && YSpeed < 0.15 && YDistFrontEdge < -50 && !(Equal CurrAction 121)
  var18 = 255
  Call RecoveryHub
elif LevelValue <= 42
  var18 = 255
  Call RecoveryHub
endif

if OYDistFrontEdge > -10 && var4 > 45 && var0 > 5
  var3 = 1
else
  var3 = Rnd * 9
  if Equal IsOnStage 0
    var3 += 1
  endif
  if Damage < 60 && var3 > 7
    var3 = 7
  endif
endif
// SAFE_INJECT_2 var3
// LOGVAL var3
label
if YDistBackEdge >= 50
  Call RecoveryHub
endif

SetVec var1 Zero
GetNearestCliff var1

// DrawDebugRectOutline var1 var2 50 25 255 0 0 136
var1 = TopNX - var1
var1 *= -1
var2 *= -1
var2 = var2 + TopNY * -1

var0 = var1
Abs var0
var4 = OXDistFrontEdge
Abs var4

// LOGSTR 1986097664 855638016 0 0 0
// LOGVAL var3

if Damage < 130 && var2 < -25
  var18 = 255
  var16 = 3
  Call RecoveryHub
endif

if var4 < 20 && OYDistFrontEdge > -10 && LevelValue >= 60
  var18 = 0
  var16 = 3
  if !(Equal OPos Direction)
    Call BAir
  else
    Call DAir
  endif
endif

// #let OConsecutiveLedgeGrabs = var5
// GetLaBasic var0 79 1
if var3 <= 3 && LevelValue >= 48 && NoOneHanging && var4 > 10
  Goto WDBackGrabLedge
  Return
elif Equal IsOnStage 1 && var3 <= 7 && OYDistBackEdge > 30
  var18 = 0
  var16 = 3
  if OYDistBackEdge < 0
    Call UTilt
  elif Rnd < 0.3
    Call DTilt
  elif Rnd < 0.2
    Call UTilt
  elif Rnd < 0.3
    Call SSpecial
  else
    Call FSmash
  endif
elif var3 <= 9 && OYDistFrontEdge < -30 && LevelValue >= 42 && var4 > 5
  if var1 < 50 && var1 > -50 && var2 > -25
    var18 = 0
    if Equal AirGroundState 1
      var16 = 3
      Call FAir
    elif !(Equal OPos Direction)
      var16 = 3
      Call BAir
    elif OTopNY > TopNY
      var16 = 3
      if Rnd < 0.3
        Call SSpecial
      else
        Call FAir
      endif
    elif YSpeed > 0.15
      var16 = 3
      if Rnd < 0.3
        Call SSpecial
      else
        Call FAir
      endif
    else
      var16 = 3
      Call FAir
    endif
  else
    var18 = 255
    Call RecoveryHub
  endif
  Return
elif True
  if !(MeteoChance)
    Call AIHub
  endif
  if Equal AirGroundState 1 && Idling
    var3 = Rnd * 3

    Button X
    var16 = 3
    var18 = 0
    var0 = OTopNY - TopNY
    if var0 > 30 && var0 < 120 && !(XDistLE 30)
      Call FAir
    elif var0 > 40 && var0 < 120
      Call BAir
    else
      if Rnd < 0.5
        Call FAir
      else
        Call BAir
      endif
    endif
    Return
  endif
endif
Return

label WDBackGrabLedge
if !(Equal AirGroundState 3)
  if Equal IsOnStage 1 && !(Equal DistBackEdge DistFrontEdge)
    // wavedash back to ledge?
    if var0 < 15
      var0 = var1 * Direction
      // LOGSTR 1852012544 539631616 1684632064 0 0
      // LOGVAL var0
      if var0 < -5
        Stick -1
        Return
      elif InAir && var0 > 2.5 && Equal IsOnStage 1 && YDistBackEdge > -1.5
        Button R
        var0 *= -0.1
        Stick var0 (-0.75)
      elif var0 > 0 && !(Equal CurrAction 10) && Equal IsOnStage 1
        Button X
      endif
    else
      var0 = OPos*0.8
      AbsStick var0
    endif
  elif var0 > 3
    var18 = 255
    Call RecoveryHub
  endif
// elif var4 < 10 && OYDistFrontEdge < 10
//   Button R
//   Call AIHub
endif
Return
Return
