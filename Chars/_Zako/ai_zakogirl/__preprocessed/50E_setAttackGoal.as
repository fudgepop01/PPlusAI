#include <Definition_AIMain.h>
id 0x850E
unk 0x0

//= XReciever
Cmd30
NoRepeat

var23 = 1
if OCurrAction >= 77 && OCurrAction <= 82
  var23 = 0
elif OCurrAction >= 96 && OCurrAction <= 97
  var23 = 0
elif Equal OCurrSubaction 217 || Equal OCurrSubaction 48 || Equal OCurrSubaction 222 || Equal OCurrSubaction 221
  var13 = ODirection * 30 * OScale + OTopNX
  var14 = OHurtboxSize + OTopNY 
  Return
endif
var17 = 30 - LevelValue * 0.021
if Equal var23 0 && OAnimFrame < var17
  Return
endif


// updateOffset = (1 - (LevelValue / 100)) * 30 + 1
// MOD updateOffset AnimFrame updateOffset
// updateOffset = 0

  var22 = 19
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 2 0
STACK_PUSH 17 0
STACK_PUSH 0 0
STACK_PUSH 7 0
STACK_PUSH 8 0
STACK_PUSH 9 0
STACK_PUSH 10 0
STACK_PUSH 11 0
  XGoto GetChrSpecific
  //= XReciever
var11 *= Scale
var10 *= Scale
var9 *= Scale
var8 *= Scale

if var2 <= 0
  var13 = TopNX
  if OYDistFloor > 0
    var13 = OTopNX
    predictAverage var22 10
    var22 += 10
    var22 *= OPos
    var13 -= var22
    GetYDistFloorAbsPos var22 var13 TopNY
    if var22 < 0
      var13 = OTopNX
    endif
  endif
  var14 = TopNY
  Return
endif
if !(True)
  var0 = 1
endif
if var0 > 10
  var0 = 10
endif

  var22 = 23
  XGoto GetChrSpecific
  //= XReciever
var2 = var22

var12 = -1
if OCurrAction >= 256

  var22 = OCurrAction + 256
  RetrieveFullATKD var3 var22 var22 var22 var22 var22 var22 var22 1
  if var3 >= 0
    var7 += var0
    var2 = 0
    var12 = var3
  endif
endif

var17 = var7

if OFramesHitstun > 0 && OFramesHitstun < var7
  var7 = OFramesHitstun
endif

  STACK_PUSH var22 0
  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var3 = var22
  var22 = STACK_POP
  if Equal var3 1
  if Equal AirGroundState 1
    GetAttribute var23 940 0
    var7 += var23
  endif
endif
// var17 *= 0.5

if var12 < 0

  if OCurrAction > 32 && OAnimFrame > 3
    EstOXCoord var23 var7
  else
    var23 = OTopNX + OTotalXSpeed * var7
  endif
  var13 = var23


  if Equal OAirGroundState 2
    if OAnimFrame <= 3 
      var23 = OYCoord
      if !(Equal OTotalYSpeed 0)
        var23 = OYCoord + OCharYSpeed * var7 - OGravity * var7 * var7
      endif
    else
      EstOYCoord var23 var7
    endif
  else

    GetAttribute var22 40 1
    PredictOMov var23 14
    var23 *= var22
    var23 *= OPos * -1
    if Equal var21 16.3 || Equal var21 10.1 
      var13 += var23
    endif
    var13 += var23
    
    var23 = OTopNY
    PredictOMov var22 7
    PredictOMov var17 8
    if var17 > 0.22
      if ONumJumps > 0
        GetAttribute var22 72 1
        CalcYChange var22 var7 var22 OGravity OMaxFallSpeed OFastFallSpeed 0
        var23 += var22
      endif      
    endif

  endif
  // if OYDistBackEdge > 5
  //   if var23 < 0
  //     var23 = 0
  //   endif
  //   tempYRange += var23
  // endif
  Goto adjustPosIfInGround
  var14 = var23
elif True


  var22 = OTopNX
  var23 = OTopNY
  var17 = var7
  STACK_PUSH var0 0
  STACK_PUSH var1 0
  STACK_PUSH var2 0
  STACK_PUSH var3 0
  STACK_PUSH var4 0
  STACK_PUSH var5 0
  STACK_PUSH var6 0
STACK_PUSH 23 0
STACK_PUSH 22 0
  STACK_PUSH var17 0
  var22 = 22
  XGoto GetChrSpecific
  var6 = STACK_POP
  var5 = STACK_POP
  var4 = STACK_POP
  var3 = STACK_POP
  var2 = STACK_POP
  var1 = STACK_POP
  var0 = STACK_POP

  var13 = var22
  Goto adjustPosIfInGround
  var14 = var23
endif

// if Equal AirGroundState 2
//   CalcYChange var23 var7 var22 Gravity MaxFallSpeed FastFallSpeed 0
//   var14 += var23
// endif

if Equal OCurrAction 84
  var14 = OTopNY
endif

DrawDebugRectOutline var13 var14 3 3 0 255 0 221


var22 = var11 + var9
if  var20 >= 8 && var20 <= 12
  var22 *= Direction
else
  var22 *= OPos
endif
var13 -= var22


var22 = OPos * 0.5 * OWidth
var13 += var22

// var14 += var10
// var22 = OHurtboxSize + var8
var22 = var8 - var10
var14 -= var22
if Equal AirGroundState 2 && YDistFloor > 5 || YDistFloor < 0
  var22 = var8 * 0.5 + OHurtboxSize * 0.3
  var14 += var22
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

// var22 = OHurtboxSize
// var14 += var22

  STACK_PUSH var22 0
  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var3 = var22
  var22 = STACK_POP
  if Equal var3 1
  var22 = (TopNY - YDistFloor) + 10.31
  if !(Equal OYDistFloor -1) && SamePlane && OYDistFloor < var8 && Equal AirGroundState 1
    if var14 < var22
      var23 = var14 - 35.57 * 0.5
      if var23 < var22
        var14 = TopNY + 35.57
      elif !(Equal CurrAction 10)
        var14 = TopNY + 10.31
      endif
    endif
  endif

  var17 = OTopNY + OHurtboxSize
  if TopNY > var17 && Equal AirGroundState 1
    if OCurrAction >= 10 && OCurrAction <= 11 && OAnimFrame < 10
      var14 = OTopNY - OYDistFloor
    endif
  endif
endif

if Equal OCurrAction 73 && !(CalledFrom ExecuteAttack)
  predictionConfidence var22 15
  if var22 >= 0.3
    predictOOption var22 15
    if Equal var22 1 && ONumJumps > 0
      var22 = OHurtboxSize * 3
      var14 += var22
    elif Equal var22 2 && XDistLE 20 && Equal AirGroundState 1
      var23 = OTopNY - 30
      if TopNY < var23
        if CHANCE_MUL_LE PT_BAITCHANCE 0.3
          var15 = -10
          var16 = 3
          Call JumpScr
        endif
      elif True
  STACK_PUSH var22 0
  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var3 = var22
  var22 = STACK_POP
  if Equal var3 1
          XGoto CalcAttackGoal
        endif
      endif
    endif
  endif
endif

var13 += var2
// if Equal OCurrAction 77
//   predictOOption var17 12
//   predictionConfidence var22 12
//   if var22 >= 0.3
//     var23 = OPos * 20
//     if Equal var17 1
//       var13 -= var17
//     elif Equal var17 3
//       var13 += var17
//     elif Equal var17 2 && XDistLE 15 && Equal AirGroundState 1 && SamePlane
//       if CHANCE_MUL_LE PT_AGGRESSION 0.25
//         var21 = 16.4
//         var16 = 1.1
//         IF_AERIAL_ATTACK(var3)
//         else
//           XGoto CalcAttackGoal
//         endif
//         var15 = -10
//         Call JumpScr
//       else
//         var21 = 13
//         Call Shield
//       endif
//     endif
//   endif

// var22 = var9 * 0.5 * OPos
// var13 += var22

// var22 = original_goalX - TopNX
// var23 = var13 - TopNX

// var22 -= var23
// Abs var22
// if var22 > 10
//   var23 = var13 + original_goalX
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
//     var13 = original_goalX
//   elif Equal var16 2
//     var14 = original_goalY
//   endif
// endif

DrawDebugRectOutline var13 var14 8 8 255 255 255 221

Return
label adjustPosIfInGround

  if OYDistFloor > 0
    var22 = ExactOYCoord - var23
    if var22 > OYDistFloor
      var23 = ExactOYCoord - OYDistFloor
    endif
  endif
Return
Return
