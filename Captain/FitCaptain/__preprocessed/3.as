// EDGEGUARD HUB
// a place to figure out how to edgeguard the opponent
#include <Definition_AIMain.h>
id 0x8003

unk 0x0

// LOGSTR 1667329024 1818584064 0 0 0

// risky - some macros use var5, but we aren't using any macros here so it should be fine

// I don't know why this is necessary but I hate the fact that
// it is with a burning passion
if Equal CurrAction 276
  Call RecoveryHub
endif

SetVec var1 Zero
GetNearestCliff var1

var1 = TopNX - var1
var1 *= -1
var2 = var2 - TopNY * -1

var0 = var1
Abs var0
var5 = OXDistFrontEdge
Abs var5

// if it's not worth going for an edgeguard, don't bother
if Equal OIsOnStage 1
  var18 = 255
  Call RecoveryHub
elif Equal IsOnStage 0 && YSpeed < 0.15 && YDistFrontEdge > 50 && !(Equal CurrAction 121)
  var18 = 255
  Call RecoveryHub
elif LevelValue <= 42
  var18 = 255
  Call RecoveryHub
endif

if OYDistFrontEdge > 0 && var5 > 30 && var0 > 5
  var3 = 1
else
  var3 = Rnd * 8
  if Equal IsOnStage 0
    var3 += 1
  endif
endif
// var3 = 1
LOGSTR 1701257216 1954115584 1694498816 0 0
LOGVAL var3
label
SetVec var1 Zero
GetNearestCliff var1

DrawDebugRectOutline var1 var2 50 25 255 0 0 136
var1 = TopNX - var1
var1 *= -1
var2 = var2 - TopNY * -1

var0 = var1
Abs var0
var5 = OXDistFrontEdge
Abs var5

// LOGSTR 1986097664 855638016 0 0 0
// LOGVAL var3

if Damage < 130 && var2 < -25
  var18 = 255
  Call RecoveryHub
endif

if Equal OAirGroundState 3 && LevelValue >= 60
  var18 = 0
  var19 = 255
  Call DAir
endif

if var3 <= 1 && LevelValue >= 48 && NoOneHanging
  LOGSTR 1010638848 822083584 0 0 0
  if !(Equal AirGroundState 3)
    if Equal IsOnStage 1
      // wavedash back to ledge?
      if var0 < 10
        var0 = var1 * Direction
        LOGSTR 1951817984 1912602624 0 0 0
        LOGVAL var0
        if var0 < -5
          Stick -1
          Return
        elif InAir && var0 > 2 && Equal IsOnStage 1
          Button R
          Stick -0.6 (-0.75)
        elif var0 > 0 && !(Equal CurrAction 10)
          LOGSTR 1786080512 1885957632 1732198144 0 0
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
  elif var5 < 10 && OYDistFrontEdge < 10
    Button R
    Call AIHub
  endif
  Return
elif var3 <= 5 && OYDistFrontEdge < 30 && LevelValue >= 42
  if var1 < 50 && var1 > -50 && var2 > -25
    var18 = 0
    if Equal AirGroundState 1
      var19 = 255
      Call FAir
    elif OTopNY > TopNY
      var19 = 255
      Call UAir
    elif YSpeed > 0.15
      var19 = 255
      Call FAir
    else
      var19 = 255
      Call UAir
    endif
  else
    var18 = 255
    Call RecoveryHub
  endif
  Return
else
  LOGSTR 1701606144 1694498816 0 0 0
  if !(MeteoChance)
    Call AIHub
  endif
  if Equal AirGroundState 1 && Idling
    var3 = Rnd * 3

    Button X
    var19 = 255
    var18 = 0
    var0 = OTopNY - TopNY
    LOGSTR 1953915136 1912602624 0 0 0
    LOGVAL var0
    if var0 > 30 && var0 < 120 && !(XDistLE 30)
      Call FAir
    if var0 > 40 && var0 < 120
      Call UAir
    elif var0 < 20
      Call DAir
    else
      Call NAir
    endif
    Return
  endif
endif
Return

label performEdgeguard1
var19 = 255
if Equal AirGroundState 1
  Call FAir
else
  Call UAir
endif
Return
Return
