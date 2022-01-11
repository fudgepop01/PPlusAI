#include <Definition_AIMain.h>
id 0x850E
unk 0x0

XReciever
Cmd30

var0 = var13
var1 = var14

// var2 = (1 - (LevelValue / 100)) * 30 + 1
// MOD var2 AnimFrame var2
var2 = 0


  var22 = 19
STACK_PUSH 17
STACK_PUSH 17
STACK_PUSH 17
STACK_PUSH 8
STACK_PUSH 8
STACK_PUSH 9
STACK_PUSH 10
STACK_PUSH 11
STACK_PUSH 17
  XGoto GetChrSpecific
  XReciever

if True
  var22 = OTopNX - TopNX
  var17 = OTopNY - TopNY
  Norm var17 var22 var17

  var17 -= 15
  if var17 < 0
    var17 = 0
  endif
  var17 *= 0.1
endif
var17 += var8
if OFramesHitstun > 0 && OFramesHitstun > var8
  var17 = OFramesHitstun
endif

if !(True) || Equal var20 10|| Equal var20 13|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25
  if Equal AirGroundState 1
    GetAttribute var23 940; 0
    var17 -= var23 - 1
  endif
endif
// var17 *= 0.5

var23 = var17
// if Equal OCurrAction 6 || Equal OCurrAction 7
//   var23 *= 0.35
// elif Equal OPrevAction 6 || Equal OPrevAction 7
//   if Equal OCurrAction 3 && OAnimFrame < 4
//     var23 *= 0.35
//   endif
// endif
if Equal var16 3
  var23 -= var2
  var23 += 1
endif
if OAnimFrame < 2
  var13 = OTopNX + OTotalXSpeed * var23
else
  EstOXCoord var13 var23
  DrawDebugRectOutline var13 OTopNY 5 5 255 255 0 136
endif
// var13 = OTopNX

if !(True) || Equal var20 10|| Equal var20 13|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25
  var23 = var17
  // if Equal CurrAction 6 || Equal CurrAction 7
  //   var23 *= 0.35
  // elif Equal PrevAction 6 || Equal PrevAction 7
  //   if Equal CurrAction 3 && AnimFrame < 4
  //     var23 *= 0.35
  //   endif
  // endif
  if AnimFrame < 2
    var23 = TopNX + TotalXSpeed * var23
  else
    EstXCoord var23 var23
    DrawDebugRectOutline var23 TopNY 5 5 0 255 255 136
  endif
elif True
  var23 = TopNX
endif
// var13 -= OTopNX
// var23 -= TopNX
var13 -= var23
var23 = var11 + var9

if !(True) || Equal var20 10|| Equal var20 13|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25
if !(True) || Equal var20 10
    var23 *= OPos
elif !(True)
    var23 *= OPos
elif !(True)
    var23 *= OPos
elif !(True) || Equal var20 13
    var23 *= OPos
  else
    var23 *= Direction
  endif

if !(True) || Equal var20 22 || Equal var20 23
  var22 = -1
elif !(True) || Equal var20 10 || Equal var20 19 || Equal var20 20 || Equal var20 24 || Equal var20 25
  var22 = 0
elif !(True) || Equal var20 13 || Equal var20 21
  var22 = 1
endif

  if Equal var22 -1
    var23 *= -1
  endif
else
  var23 *= OPos
endif

var13 -= var23
var13 += TopNX

// TODO: under/overshoot
if Equal var16 3
  var17 -= var2
  var17 += 1
endif
if OAnimFrame < 2 && !(Equal OYSpeed 0)
  var14 = OSCDBottom + OTotalYSpeed * var17 - OGravity * OGravity * var17
else
  EstOYCoord var14 var17
endif
var22 = OTopNY - var14
if var22 > OYDistFloor
  var14 = OTopNY - OYDistFloor
endif
if Equal OCurrAction 84
  var14 = OTopNY
endif
if Equal var16 3
  var17 -= 1
  var17 += var2
endif

  if AnimFrame < 2
    if TotalYSpeed > 0
      var23 = TopNY + TotalYSpeed * var17 - Gravity * var17 * Gravity
    else
      var23 = TopNY + TotalYSpeed * var17
    endif
  else
    EstYCoord var23 var17
  endif
  var14 -= var23
var14 += TopNY

// if OYDistBackEdge < -30
//   var14 -= 12
// endif

// var17 = TopNY + YDistBackEdge
// if SamePlane && var14 <= var17 && !(MeteoChance)
//   var14 = var17
// endif

var23 = (var10 * -1) + var8
var14 -= var23

// var23 = OHurtboxSize * 0.5
// tempYRange += var23
// var23 = OWidth * 0.5
// tempXRange += var23

// var23 = Width * 0.5
// tempGoalX -= var23
// var23 = HurtboxSize * 0.5
// tempGoalY += var23

// var23 = OTopNX - OCenterX
// var23 *= 1
// tempGoalX -= var23

// var23 = OTopNY - OTopNY
// var23 *= 1
// tempGoalY += var23

if !(True) || Equal var20 10|| Equal var20 13|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25
  var22 = (TopNY - YDistFloor) + 15
  if var14 < var22 && Equal AirGroundState 1 && !(Equal CurrAction 10) && SamePlane && OYDistFloor < var8
    var14 = TopNY + 15
  endif

  if SamePlane && OYDistFloor < var8 && Equal AirGroundState 1 && !(Equal CurrAction 10)
    var14 = TopNY + 15
  endif

  // if Equal AirGroundState 1
  //   var14 = TopNY + 15 * 4
  // endif
endif
  var22 = 200
  XGoto GetChrSpecific
  XReciever
var17 = OTopNY - TopNY
if Equal var22 1
elif var17 > 30 || OYDistBackEdge < -35
elif !(Equal var21 16.4) && !(Equal var21 16.5) && OYDistFloor < 30
  predictAverage var22 10 LevelValue
  if var22 < 7
    var22 = 7
  endif
  if Equal var21 16.1
    if OXDistBackEdge > -20 && OXDistFrontEdge < 20
      var17 = OXSpeed * OPos
      if OCurrAction >= 2 && OCurrAction <= 25 && var17 > 0
      else
        var22 *= OPos * 2
        var13 += var22
      endif
    endif
  elif Equal var21 16.3
    var22 *= OPos * 3
    var13 -= var22
  elif Equal var21 16.2
    var22 *= OPos * 2
    var13 -= var22
  endif 
endif

if Equal CurrAction 10 || Equal var16 1
  var13 = var0
elif Equal var16 2
  var14 = var1
endif

Cmd30
Return
Return
