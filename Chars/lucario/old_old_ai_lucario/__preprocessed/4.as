// RECOVERY HUB
// a place for determining the possible recoveries available
#include <Definition_AIMain.h>
id 0x8004

unk 0x0

label
Cmd30

SetDisabledMd -1

if CurrAction >= 66 && CurrAction <= 69 && !(OutOfStage)
  Call OnGotDamaged
endif

  var22 = 0
  GetYDistFloorOffset var22 var22 5 0
  if var22 < 4 && !(Equal var22 -1)
    var22 = 0
  elif Equal DistBackEdge DistFrontEdge
    var22 = 2
  elif Equal var22 -1
    if XSpeed <= 0
      var22 = 1
    elif XSpeed > 0
      var22 = -1
    endif
  else
    var22 = 0
  endif
if !(Equal var22 2) && Equal var21 32769
  Call ApproachHub
elif Equal var16 8
elif Equal var21 32769 && MeteoChance && Equal var16 3 && !(NoOpponent)
  Call ApproachHub
endif

if !(OutOfStage) && !(Equal var16 5)
  Call AIHub
endif
if Equal var16 8
  Call LedgeHang
endif

if Equal var18 255
  Seek
  Jump
endif

// {PREREQ_CHECKS}

var6 = 0
label
var9 = 0
var10 = Rnd
var8 = 0
label _main
if !(OutOfStage) && !(Equal var16 5)
  Call AIHub
endif
if FramesHitstun > 0 && CurrAction < 11 && CurrAction > 16
  Call OnGotDamaged
endif
Cmd30

// detects if below stage

GetNearestCliff var0
GetReturnGoal var1

// {NCXOFFS_REDEFINE}

var17 = var1 - var0 
var7 = 0
if var17 < 10 && var17 > -10
  if var17 < 0
    var2 = 5
  else
    var2 = -5
  endif
elif var1 < TopNX && TopNX < var0
elif var0 < TopNX && TopNX < var1  
elif TopNY < var2
  if var17 < 0
    var2 = 7
  else
    var2 = -7
  endif
  var7 = 1
endif


// gets nearest cliff coordinates relative to position

  GetNearestCliff var0
  var0 = TopNX - var0
  var0 *= -1
  var1 *= -1
  var1 = var1 - (TopNY * -1)

var0 += var2

if !(NoOneHanging)
  var1 -= 20 
endif

// var0 -= TopNX
// var0 *= -1
// var1 -= TopNY
// DrawDebugRectOutline var0 var1 50 85 255 0 0 136
// DrawDebugRectOutline var0 var1 50 70 255 136 0 136
// DrawDebugRectOutline var0 var1 50 20 255 255 0 136
// DrawDebugRectOutline var0 var1 5 5 0 255 0 221
// var0 *= -1
// var0 += TopNX
// var1 += TopNY

if FramesHitstun > 0 && CurrAction < 11 && CurrAction > 16
  Call AIHub
endif
LOGSTR 1097887744 1417244672 1694498816 0 0
LOGVAL var16
if Equal var16 5
  var17 = 4
  label 
  if var17 > 0
    var22 = var0 * -1
    AbsStick var0
    Button X
  else
    var16 = 0
    ClearStick
    Stick 0 0.7
    Button B
    var8 = 1
    Seek _main
  endif
  var17 -= 1
  Return
endif

// LOGSTR 1633907712 796090624 1668546560 0 0
// LOGVAL CurrAction
// LOGVAL CurrSubaction
  if Equal CurrAction 16 
  Goto handleSFall
  Return
  elif Equal CurrAction 276 || Equal CurrAction 283 || Equal CurrAction 284
  Goto handleUSpecial
  Return
  elif Equal CurrAction 274
  Goto handleNSpecial
  Return
  elif Equal CurrAction 275
  Goto handleSSpecial
  Return
  elif Equal CurrAction 277
  Goto handleDSpecial
  Return
endif

  var17 = 15
  var3 = XSpeed * var17
  GetYDistFloorOffset var2 var3 5 0
  // var22 = TopNY - var2 
  // DrawDebugLine TopNX TopNY TopNX var22 255 0 0 221
  if !(Equal var2 -1) 
    var2 = 0
  elif Equal DistBackEdge DistFrontEdge
    var2 = 2
  elif Equal var2 -1
    if var3 < 0
      var2 = 1
    elif var3 > 0
      var2 = -1
    endif
  else
    var2 = 0
  endif

if Equal var2 0 || Equal AirGroundState 1
  Call AIHub
endif


if Equal CurrAction 51 && AnimFrame <= var15
  Return
endif

if CanJump && NumJumps > 0
  var2 = 85
elif !(CanJump)
  var2 = 20
else
  var2 = 70
endif

if Equal OIsOnStage 0 && Equal var16 3 && !(NoOpponent) && YDistBackEdge < var2
  Call ApproachHub
endif

if Equal OIsOnStage 0 && var0 <= 50 && var0 >= -50 && var1 >= var17 && !(Equal var18 255) && !(Equal var16 5)
  var18 = 0
  Call EdgeguardHub
endif

// drift towards goal
var17 = var0 * -1
ClearStick
AbsStick var17

var6 -= 1
if var6 > 0
  Return
endif

  var22 = var0 
  var17 = var1
  Norm var22 var22 var17
  var2 = var22 - 50

var3 = var0
Abs var3
var22 = TopNY - BBoundary
if var22 < 10
  if NumJumps > 0
    Button X
  else 
    Stick 0 0.7
    Button B
  endif
elif var1 > 20 && Rnd < 0.03 && Equal var7 0 && NumJumps > 0 && !(Equal var18 255)
  GetRndPointOnStage var0
  var17 = var0 - TopNX
  AbsStick var17
  if var3 < 10 && Equal var7 0
    var17 *= -1
  endif
  Button X
  var6 = 30
  Return
elif var1 < -20 && Rnd < 0.03 && Equal var7 0 && NumJumps > 0 && !(Equal var18 255)
  GetRndPointOnStage var0
  var17 = var0 - TopNX
  AbsStick var17
  if var3 < 10 && Equal var7 0
    var17 *= -1
  endif
  Button X
  var6 = 30
  Return
elif var1 < -85 && NumJumps > 0
  Button X
  var6 = 30
  Return
elif var1 > -70 && var1 <= -66
  if var2 > 0 && NumJumps > 0
    GetRndPointOnStage var0
    var17 = var0 - TopNX
    if var3 < 10 && Equal var7 0
      var17 *= -1
    endif
    AbsStick var17
    Button X
    var6 = 30
  elif Equal var8 0 
    if YDistBackEdge < -50
      Return
    endif
    ClearStick
    Stick 0 0.7
    Button B
    var8 = 1
  endif
  Return
endif
var22 = OTopNY + 30
if YDistBackEdge > 0 && Equal var8 0 && TopNY < var22 && var1 > -70 && Equal OIsOnStage 0 && Equal var7 0 && XDistLE 10 && var3 > 10 && var2 < 0
  ClearStick
  Stick 0 0.7
  Button B
  var8 = 1
  Return
endif
if var2 < 0 && Equal var8 0 && Equal NumJumps 0 && Equal var7 0 && YSpeed < 0 && var2 > -10
  if YDistBackEdge < -50
    Return
  endif
  ClearStick
  Stick 0 0.7
  Button B
  var8 = 1
elif var1 > -15 && Equal var7 0 && var2 < 0 && Equal var8 0 && NumJumps > 0 && !(Equal var18 255)
  GetRndPointOnStage var0
  var17 = var0 - TopNX
  AbsStick var17
  Button X
  var6 = 30
endif
if var1 > 15 && var3 > 25 && Equal var9 0 && var10 <= 0.3
  ClearStick
  var17 = TopNX * -1
  AbsStick var17 (-0.7)
  Button B
  var9 = 1
elif var1 > 15 && var3 > 70 && Equal var9 0
  ClearStick
  var17 = TopNX * -1
  AbsStick var17 (-0.7)
  Button B
  var9 = 1
elif var1 > -50 && var17 > 15 && var17 < 0 && Equal var8 0 && var10 <= 0.6
  ClearStick
  Stick 0 0.7
  Button B
  var8 = 1
endif

Seek _main
Return


label handleNSpecial

Return

label handleSSpecial

Return

label handleUSpecial
  var8 = 0
  if Equal IsOnStage 1
    Call USpecial
  endif
  if !(Equal CurrAction 276) && !(Equal CurrAction 16) && !(Equal CurrAction 283)
    if Equal AirGroundState 1 || Equal CurrAction 14 || Equal CurrAction 15 || FramesHitstun > 0
      Call AIHub
    endif
  endif
  if Equal var7 1
    if var0 > TopNX
      var0 += 5
    else
      var0 -= 5
    endif
  endif
  if !(Equal CurrSubaction 476) && !(Equal CurrSubaction 477)
    if !(NoOneHanging)
      LOGSTR 1751215616 1734962688 1728053248 0 0
      var1 -= 25
      if var0 > 0
        var0 += 15
      else
        var0 -= 15
      endif
    else
      // var1 += 10
    endif
    if Equal var7 0
        LOGSTR 1852797952 543319296 1819244288 0 0
      if XSpeed < 0 && var0 < 0 
        var0 -= 50
        LOGSTR 1277177088 759046144 1375731712 0 0
      elif XSpeed > 0 && var0 > 0
        var0 += 50
        LOGSTR 1377840384 759046144 1275068416 0 0
      endif
    endif
    LOGSTR 1768840960 1313036544 0 0 0
    LOGVAL var1
    var17 = var0
    Abs var17
    if var17 < 5 && var1 > -3 && var1 < 5 && YSpeed < 0
      ClearStick
    else
      var4 = var0
      var3 = var1
      Norm var17 var0 var1
      var0 /= var17
      var1 /= var17
      var0 *= -1
      var1 *= -1
      Abs var4
      var17 = XSpeed
      Abs var17
      if var3 < 0 && var4 < 30 && var17 > 2
        LOGSTR 1668641280 1986354944 822083584 0 0
        var1 -= 1
      elif var3 < 20 && var4 < 30 && YSpeed > 0
        LOGSTR 1668641280 1986354944 838860800 0 0
        var1 -= 1
      endif
      if 0.1 < var0 && var0 < 0.25
        AbsStick 0.3 var1
      elif -0.25 < var0 && var0 < -0.1
        AbsStick -0.3 var1
      else
        AbsStick var0 var1
      endif
    endif
  else
    var17 = TopNX * -1
    AbsStick var17
  endif
Return

label handleDSpecial
Button A
Stick 0 (-1)
Return

label handleSFall
  var17 = var0 * -1
  AbsStick var17
Return

label handleJumpToStage
  SetFrame 0
  label
  if CanJump && CurrAction <= 16
    Button X
  endif
  var17 = var0 * -1
  AbsStick var17
  if Equal IsOnStage 1 || FrameGE 30 || FramesHitstun > 0
    Call AIHub
  elif FrameGE 2 && YSpeed < 0
    Call AIHub
  elif FrameGE 20 && !(MeteoChance)
    Call AIHub
  endif
Return
Return
