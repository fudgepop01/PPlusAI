// EDGEGUARD HUB
// a place to figure out how to edgeguard the opponent
#include <Definition_AIMain.h>
id 0x8003

unk 0x0

// LOGSTR 1667329024 1818584064 0 0 0
SetDisabledMd 4

if Equal var21 4384
  Call ComboHub
elif FramesHitstun > 0
  Call AIHub
  Return
endif



// I don't know why this is necessary but I hate the fact that
// it is with a burning passion
if Equal CurrAction 276
  Call RecoveryHub
endif

var17 = OTotalXSpeed
Abs var17
if Equal var21 32769 && XDistLE 30 && var5 < 10 && Equal var18 0 && OFramesHitstun > 0 && var17 < 4
  // var16 = 3
  Call ApproachHub
// elif Equal var21 32769 && Equal var18 0
//   Call ApproachHub
endif

var21 = 32771

SetVec var1 Zero
GetNearestCliff var1

var1 = TopNX - var1
var1 *= -1
var2 = var2 - TopNY * -1

var0 = var1
Abs var0
var4 = OXDistFrontEdge
Abs var4
var17 = OFramesHitstun / 60
EstOYCoord var5 var17
var5 = var2 - var5

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

if var5 > -10 && var4 > 45 && var0 > 5
  var3 = 1
else
  var3 = Rnd * 9
  if Equal IsOnStage 0
    var3 += 1
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

LOGSTR 1986097664 855638016 0 0 0
LOGVAL var3

if Damage < 130 && var2 < -25
  var18 = 255
  var16 = 3
  Call RecoveryHub
endif

if var4 < 20 && var5 > -10 && LevelValue >= 60
  var18 = 0
  var16 = 3
  if !(Equal OPos Direction)
  if Rnd < 0.3
    Call BAir
  else
    Call DAir
  endif
    Call BAir
  else
  if Rnd < 0.3
    Call DAir
  elif Rnd < 0.8
    Call FAir
  else
    Call NAir
  endif
    Call DAir
  endif
endif

// #let OConsecutiveLedgeGrabs = var5
// GetLaBasic var0 79 1
if var3 <= 3 && LevelValue >= 48 && NoOneHanging && var4 > 10
  var18 = 255
  Goto WDBackGrabLedge
  Return
elif Equal IsOnStage 1 && var3 <= 7
  var18 = 0
  var16 = 3
  if OYDistBackEdge < 0
    Call FTilt
  elif Rnd < 0.4
    Call DTilt
  elif Rnd < 0.6
    Call DSmash
  else
    Call FSmash
  endif
elif var3 <= 9 && var5 < -30 && LevelValue >= 42 && var4 > 5
  if var1 < 50 && var1 > -50 && var2 > -25
    var18 = 0
    var16 = 3
  if Rnd < 0.8
    Call NAir
  elif Rnd < 0.4
    Call BAir
  elif Rnd < 0.6
    Call FAir
  else
    Call DAir
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
    Call NAir
  elif var0 > 40 && var0 < 120
    Call FAir
  else
    Call DAir
  endif
    Return
  endif
endif
Return

label WDBackGrabLedge
if !(Equal AirGroundState 3)
  if Equal IsOnStage 1 && !(Equal DistBackEdge DistFrontEdge)
    // wavedash back to ledge?
    var22 = XSpeed
    Abs var22
    var22 = 20 + var22 
    if var0 < var22
      var0 = var1 * Direction
      LOGSTR 1852012544 539631616 1684632064 0 0
      LOGVAL var0
      if var0 < -10
        Stick -1
        Return
      elif var0 < 5
        Stick 1
        Return
      elif YDistBackEdge > -1 && InAir && var0 > 5 && Equal IsOnStage 1
        Button R
        var0 *= -0.06
        if var0 > -0.3
          var0 = -0.3
        endif
        Stick var0 (-0.75)
      elif var0 > 0 && !(Equal CurrAction 10) && Equal IsOnStage 1
        if CurrAction >= 22 && CurrAction <= 25
        else
          Button X
        endif
      endif
    else
      AbsStick OPos
      if Equal CurrAction 1
        ClearStick
      endif
    endif
  elif Equal IsFastfalling 1
    Stick 1
  else
    Stick 1 (-1)
  endif
// elif var4 < 10 && var5 < 10
//   Button R
//   Call AIHub
endif
Return
Return
