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
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 7 0
STACK_PUSH 8 0
STACK_PUSH 9 0
STACK_PUSH 10 0
STACK_PUSH 11 0
STACK_PUSH 17 0
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
var17 += var7
// if OFramesHitstun > 0 && OFramesHitstun > var7
//   var17 = OFramesHitstun
// endif

if !(True) || Equal var20 15|| Equal var20 17|| Equal var20 23|| Equal var20 24|| Equal var20 25|| Equal var20 26|| Equal var20 27|| Equal var20 28|| Equal var20 29|| Equal var20 30
  if Equal AirGroundState 1
    GetAttribute var23 940; 0
    var17 += var23
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
// if OAnimFrame <= 3
  var13 = OTopNX + OTotalXSpeed * var23
  DrawDebugRectOutline var13 OTopNY 5 5 255 255 0 136
// endif
// var13 = OTopNX

if !(True) || Equal var20 15|| Equal var20 17|| Equal var20 23|| Equal var20 24|| Equal var20 25|| Equal var20 26|| Equal var20 27|| Equal var20 28|| Equal var20 29|| Equal var20 30
  var23 = var17
  // if Equal CurrAction 6 || Equal CurrAction 7
  //   var23 *= 0.35
  // elif Equal PrevAction 6 || Equal PrevAction 7
  //   if Equal CurrAction 3 && AnimFrame < 4
  //     var23 *= 0.35
  //   endif
  // endif
  // if AnimFrame <= 3
    var23 = TopNX //+ TotalXSpeed * var23
    DrawDebugRectOutline var23 TopNY 5 5 0 255 255 136
  // endif
  // var23 *= -1
elif True
  var23 = TopNX
endif
// var13 += OTopNX
// var23 -= TopNX
var13 -= var23
var23 = var11 + var9

if !(True) || Equal var20 15|| Equal var20 17|| Equal var20 23|| Equal var20 24|| Equal var20 25|| Equal var20 26|| Equal var20 27|| Equal var20 28|| Equal var20 29|| Equal var20 30
if !(True) || Equal var20 15
    var23 *= OPos
elif !(True) || Equal var20 17
    var23 *= OPos
elif !(True)
    var23 *= OPos
elif !(True)
    var23 *= OPos
  else
    var23 *= Direction
  endif

if !(True) || Equal var20 27 || Equal var20 29
  var22 = -1
elif !(True) || Equal var20 17 || Equal var20 23 || Equal var20 24 || Equal var20 30
  var22 = 0
elif !(True) || Equal var20 15 || Equal var20 25 || Equal var20 26 || Equal var20 28
  var22 = 1
endif

  if Equal var22 -1
    var23 *= -1
  endif
else
  var23 *= OPos
endif

var23 *= 0.5
var13 -= var23
var13 += TopNX

if Equal var16 3
  var17 -= var2
  var17 += 1
endif
// CalcYChange var14 var17 OTotalYSpeed OGravity OMaxFallSpeed OFastFallSpeed 0
// var14 *= -1
// var14 += OSCDBottom
if OAnimFrame <= 3 && !(Equal OYSpeed 0)
  if OTotalYSpeed > 0
    var14 = OSCDBottom + OTotalYSpeed * var17 - OGravity * var17 * var17
  else
    var14 = OSCDBottom + OTotalYSpeed * var17
  endif
else
  EstOYCoord var14 var17
endif
var22 = OTopNY - var14
if Equal OCurrAction 84
  var14 = OTopNY
endif
if Equal var16 3
  var17 -= 1
  var17 += var2
endif

  if AnimFrame < 2
    if TotalYSpeed > 0
      var23 = TopNY + TotalYSpeed * var17 - Gravity * var17 * var17
    else
      var23 = TopNY + TotalYSpeed * var17
    endif
  else
    EstYCoord var23 var17
  endif
  if Equal CurrAction 33 || Equal AirGroundState 1
    var23 = TopNY
  endif
  LOGSTR 1197015040 0 0 0 0
  LOGVAL var14
  LOGSTR 1096046080 1634861056 0 0 0
  LOGVAL var23
  PRINTLN
  var14 -= var23
var14 += TopNY

// if OYDistBackEdge < -30
//   var14 -= 5
// endif

// var17 = TopNY + YDistBackEdge
// if SamePlane && var14 <= var17 && !(MeteoChance)
//   var14 = var17
// endif

var23 = (var10 * -1) + var8
var23 *= 0.5
var14 -= var23

var22 = OTopNY - var14
if var22 > OYDistFloor && !(Equal OYDistFloor -1) 
  var14 = OTopNY - OYDistFloor
endif

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

if !(True) || Equal var20 15|| Equal var20 17|| Equal var20 23|| Equal var20 24|| Equal var20 25|| Equal var20 26|| Equal var20 27|| Equal var20 28|| Equal var20 29|| Equal var20 30
  var22 = (TopNY - YDistFloor) + 8
  if var14 < var22 && Equal AirGroundState 1 && !(Equal CurrAction 10) && SamePlane && OYDistFloor < var8
    var14 = TopNY + 8
  endif

  if SamePlane && OYDistFloor < var8 && Equal AirGroundState 1 && !(Equal CurrAction 10)
    var14 = TopNY + 8
  endif

  var17 = OTopNY + OHurtboxSize
  if TopNY > var17
    if OCurrAction >= 10 && OCurrAction <= 11 && OAnimFrame < 10
      var14 = OTopNY - OYDistFloor
    endif
  endif

  // if Equal AirGroundState 1
  //   var14 = TopNY + 8 * 4
  // endif
endif
  var22 = 200
  XGoto GetChrSpecific
  XReciever
var17 = OTopNY - TopNY
if Equal var22 1
elif var17 > 30 || OYDistBackEdge < -35
elif !(Equal var21 16.4) && var21 < 16.7 && OYDistFloor < 30
  predictAverage var22 10 LevelValue
  if var22 < 7
    var22 = 7
  endif
  predictOOption var23 8 LevelValue 
  if Equal var21 16.3
    var22 *= OPos * 3
    var13 -= var22
  elif Equal var23 2
    if OXDistBackEdge > -20 && OXDistFrontEdge < 20
      var17 = OXSpeed * OPos
      if OCurrAction >= 2 && OCurrAction <= 25 && var17 > 0
      else
        var22 *= OPos * 2
        var13 -= var22
      endif
    endif
  elif Equal var23 3
    var22 *= OPos * 2
    var13 += var22
  endif
endif

GetYDistFloorOffset var22 50 10 1
if Equal var22 -1 && Equal OPos -1
  var13 -= 20 
endif
GetYDistFloorOffset var22 -50 10 1
if Equal var22 -1 && Equal OPos 1
  var13 += 20 
endif

// LOGSTR 1196376320 1280846848 542703616 0 0
// LOGVAL var13
// LOGVAL var14
// LOGSTR 1398169856 1919508736 1853095936 0 0
// LOGVAL var16
// PRINTLN

// if CalledFrom UpdateGoal
//   if Equal CurrAction 10 || Equal var16 1
//     var13 = var0
//   elif Equal var16 2
//     var14 = var1
//   endif
// endif

Cmd30
Return
Return
