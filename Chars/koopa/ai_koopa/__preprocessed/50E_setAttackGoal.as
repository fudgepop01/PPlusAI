#include <Definition_AIMain.h>
id 0x850E
unk 0x0

XReciever
Cmd30

Goto shouldOffset
var2 = var23
// updateOffset = (1 - (LevelValue / 100)) * 30 + 1
// MOD updateOffset AnimFrame updateOffset
// updateOffset = 0


  var22 = 19
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 7 0
STACK_PUSH 0 0
STACK_PUSH 8 0
STACK_PUSH 9 0
STACK_PUSH 10 0
STACK_PUSH 11 0
STACK_PUSH 17 0
  XGoto GetChrSpecific
  XReciever
if !(True) || Equal var20 22 || Equal var20 23 || Equal var20 24 || Equal var20 25 || Equal var20 26
  var7 = 1
endif
var7 += var0

var0 = var13
var1 = var14

// if True
//   var22 = OTopNX - TopNX
//   var17 = OTopNY - TopNY
//   Norm var17 var22 var17
//   Abs var17

//   var17 -= 30
//   if var17 < 0
//     var17 = 0
//   endif
//   var17 *= 0.1
// endif
var17 = var7

// if OFramesHitstun > 0 && OFramesHitstun > var7
//   var17 = OFramesHitstun
// endif

if !(True) || Equal var20 15|| Equal var20 16|| Equal var20 27|| Equal var20 28|| Equal var20 29|| Equal var20 30|| Equal var20 31|| Equal var20 32|| Equal var20 33
  if Equal AirGroundState 1
    GetAttribute var23 940; 0
    var17 += var23
  endif
endif
// var17 *= 0.5

var23 = var17
var13 = OTopNX + OTotalXSpeed * var23
DrawDebugRectOutline var13 OTopNY 5 5 255 255 0 136
if Equal var2 1 
  predictOOption var23 8 LevelValue
  if !(Equal var23 1) || Equal var21 16.3
    var13 = OTopNX
  endif
endif

if !(True) || Equal var20 15|| Equal var20 16|| Equal var20 27|| Equal var20 28|| Equal var20 29|| Equal var20 30|| Equal var20 31|| Equal var20 32|| Equal var20 33
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

if !(True) || Equal var20 15|| Equal var20 16|| Equal var20 27|| Equal var20 28|| Equal var20 29|| Equal var20 30|| Equal var20 31|| Equal var20 32|| Equal var20 33
if !(True) || Equal var20 29 || Equal var20 30
  var22 = -1
elif !(True) || Equal var20 15 || Equal var20 16 || Equal var20 27 || Equal var20 31 || Equal var20 32 || Equal var20 33
  var22 = 0
elif !(True) || Equal var20 28
  var22 = 1
endif
  if Equal var22 -1
    var23 = var11
    if Equal AirGroundState 1
      var23 *= Direction
    endif
  endif

if !(True)
    var23 *= OPos
elif !(True) || Equal var20 15 || Equal var20 16
    var23 *= OPos
elif !(True)
    var23 *= OPos
elif !(True)
    var23 *= OPos
  else
    var23 *= Direction
  endif
else
  var23 *= OPos
endif

// var23 *= 0.5
var13 -= var23
var13 += TopNX

var22 = var13 - OTopNX
var22 *= OPos
var22 -= var11
var22 += var9 + -30
if var22 > 0 && !(XDistLE 20)
  var20 = -1
  Return
endif

// CalcYChange var14 var17 OTotalYSpeed OGravity OMaxFallSpeed OFastFallSpeed 0
// var14 *= -1
// var14 += OSCDBottom
if OAnimFrame <= 3 || AnimFrame <= 3
  if OYSpeed > 0
    var14 = OYSpeed * var17 - OGravity * var17 * var17
  else
    var14 = OYSpeed * var17
  endif
  var14 += OSCDBottom
else
  EstOYCoord var14 var17
endif

var22 = OTopNY - var14
if var22 > OYDistFloor && !(Equal OYDistFloor -1) 
  var14 = OTopNY - OYDistFloor
endif

if Equal OCurrAction 84
  var14 = OTopNY
endif

DrawDebugRectOutline var13 var14 3 3 255 255 255 221


// {SELF_Y_ADJUST}
// var14 += TopNY

// if OYDistBackEdge < -30
//   var14 -= 8.51
// endif

// var17 = TopNY + YDistBackEdge
// if SamePlane && var14 <= var17 && !(MeteoChance)
//   var14 = var17
// endif

var23 = (var10 * -1) + var8
// var23 *= 0.5
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

var22 = OHurtboxSize
var14 += var22

if !(True) || Equal var20 15|| Equal var20 16|| Equal var20 27|| Equal var20 28|| Equal var20 29|| Equal var20 30|| Equal var20 31|| Equal var20 32|| Equal var20 33
  var22 = (TopNY - YDistFloor) + 11.51
  if !(Equal OYDistFloor -1) && SamePlane && OYDistFloor < var8 && Equal AirGroundState 1 && !(Equal CurrAction 10)
    if var14 < var22
      var14 = TopNY + 11.51
    endif
  endif

  var17 = OTopNY + OHurtboxSize
  if TopNY > var17
    if OCurrAction >= 10 && OCurrAction <= 11 && OAnimFrame < 10
      var14 = OTopNY - OYDistFloor
    endif
  endif

  if Equal OYDistFloor -1 && OYDistBackEdge > 5
    var22 = OPos * OWidth
    var13 += var22
  endif
endif
if Equal var2 1
  GetAttribute var22 40; 1
  var22 *= 0.3 * var7
  predictOOption var23 8 LevelValue 
  if Equal var21 16.3
    // LOGSTR_NL 1463897088 1275068416 0 0 0
    var23 = var11 + var9
    if var23 > 7
      var22 *= OPos * 1.35
      var13 -= var22
    endif
  elif Equal var23 3
    // LOGSTR_NL 1431192576 1163023104 1213157120 1409286144 0
    if OXDistBackEdge < -10 && OXDistFrontEdge > 10
      var17 = OXSpeed
      var22 *= OPos
      if OCurrAction >= 2 && OCurrAction <= 25 && var17 >= 0
      else
        var22 *= 1.2
      endif
      var13 -= var22
    endif
    var22 = TopNX - var0
    Abs var22
    if var22 <= 20
      var13 = var0
    endif
  elif Equal var23 2
    // LOGSTR_NL 1331053824 1381189632 1330598912 0 0
    var22 *= OPos
    var13 += var22
  // else
  //   LOGSTR_NL 1313166592 1414676736 1275068416 0 0
  endif
endif

// var22 = var9 * 0.5 * OPos
// var13 += var22

// var22 = var0 - TopNX
// var23 = var13 - TopNX

// var22 -= var23
// Abs var22
// if var22 > 10
//   var23 = var13 + var0
//   var23 *= 0.5
//   var13 = var23
// endif

// if Equal OIsOnStage 1
//   GetYDistFloorOffset var22 20 10 1
//   if Equal var22 -1 && Equal OPos -1
//     var13 -= 2 
//   endif
//   GetYDistFloorOffset var22 -20 10 1
//   if Equal var22 -1 && Equal OPos 1
//     var13 += 2
//   endif
// endif

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

DrawDebugRectOutline var13 var14 8 8 255 255 255 221

Cmd30
Return
label shouldOffset
  var22 = 200
  XGoto GetChrSpecific
  XReciever
  var23 = 0
  if Equal var22 1
  elif OYDistBackEdge < -10
  elif !(Equal var21 16.4) && var21 < 16.7
    var22 = OTopNY - TopNY
    if var22 <= 30
      var23 = 1
    endif
  endif
  if OCurrAction >= 78 && OCurrAction <= 82
    var23 = 0
  elif OCurrAction >= 96 && OCurrAction <= 97
    var23 = 0
  endif
Return
Return
