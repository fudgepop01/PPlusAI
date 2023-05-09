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
endif
var17 = 30 - LevelValue * 0.021
if Equal var23 0 && OAnimFrame < var17
  Return
endif

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
STACK_PUSH 22 0
STACK_PUSH 17 0
STACK_PUSH 0 0
STACK_PUSH 7 0
STACK_PUSH 8 0
STACK_PUSH 9 0
STACK_PUSH 10 0
STACK_PUSH 11 0
  XGoto GetChrSpecific
  //= XReciever


if var22 <= 0
  var13 = TopNX
  if OYDistFloor > 0
    var13 = OTopNX
  endif
  var14 = TopNY
  Return
endif
if !(True) || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18
  var0 = 1
endif

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

  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var3 = var22
  if Equal var3 1
  if Equal AirGroundState 1
    GetAttribute var23 940; 0
    var7 += var23
  endif
endif
// var17 *= 0.5

if var12 < 0

  var23 = OTopNX + OTotalXSpeed * var7
  var13 = var23


  if Equal OAirGroundState 2
    if OAnimFrame <= 3 && !(Equal OYSpeed 0)
      var23 = OSCDBottom + OTotalYSpeed * var7 - OGravity * var7 * var7
    else
      EstOYCoord var23 var7
    endif
  else
    var23 = OTopNY
    PredictOMov var22 7 LevelValue
    PredictOMov var17 8 LevelValue
    if var17 > 0.65
      if ONumJumps > 0
        GetAttribute var22 72; 1
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

if Equal OCurrAction 84
  var14 = OTopNY
endif

DrawDebugRectOutline var13 var14 3 3 0 255 0 221

var22 = var11
if !(True) || Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25
  if Equal AirGroundState 2
    var22 *= Direction
  else
    var22 *= OPos
  endif
else
  var22 *= OPos
endif
var13 -= var22
var22 = var9 - OWidth
var22 *= OPos * 0.5
var13 -= var22

var14 -= var10
// var22 = OHurtboxSize + var8
var22 = var8
var14 += var22

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

  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var3 = var22
  if Equal var3 1
  var22 = (TopNY - YDistFloor) + 13.39
  if !(Equal OYDistFloor -1) && SamePlane && OYDistFloor < var8 && Equal AirGroundState 1
    if var14 < var22
      var23 = var14 + 34.59 * 0.5
      if var23 < var22
        var14 = TopNY + 34.59
      elif !(Equal CurrAction 10)
        var14 = TopNY + 13.39
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
  predictionConfidence var22 15 LevelValue
  if var22 >= 0.3
    predictOOption var22 15 LevelValue
    if Equal var22 1 && ONumJumps > 0
      var22 = OHurtboxSize * 3
      var14 += var22
    elif Equal var22 2 && XDistLE 20 && Equal AirGroundState 1
      var23 = OTopNY - 30
      if TopNY < var23
        if CHANCE_MUL_LE PT_BAITCHANCE 0.3
          var15 = -1
          var16 = 3
          Call JumpScr
        endif
      elif True
  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var3 = var22
  if Equal var3 1
          XGoto CalcAttackGoal
        endif
      endif
    endif
  endif
endif

// var2 = 0
if !(CalledFrom ExecuteAttack)
  if Equal OCurrAction 77
    predictOOption var17 12 LevelValue
    predictionConfidence var22 12 LevelValue
    if var22 >= 0.3
      var23 = OPos * 20
      if Equal var17 1
        var13 -= var17
      elif Equal var17 3
        var13 += var17
      elif Equal var17 2 && XDistLE 15 && Equal AirGroundState 1 && SamePlane
        if CHANCE_MUL_LE PT_AGGRESSION 0.25
          var21 = 16.4
          var16 = 1.1
  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var3 = var22
  if Equal var3 1
          else
            XGoto CalcAttackGoal
          endif
          var15 = -1
          Call JumpScr
        else
          var21 = 13
          Call Shield
        endif
      endif
    endif
  elif OCurrAction >= 96 && OCurrAction <= 97
    predictOOption var17 13 LevelValue
    predictionConfidence var22 13 LevelValue
    if var22 >= 0.3
      var23 = OPos * 20
      if Equal var17 1
        var13 -= var17
      elif Equal var17 3
        var13 += var17
      endif
    endif
  elif Equal var2 1
    GetAttribute var22 40; 1
  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var3 = var22
  if Equal var3 1
      if var7 > 10
        var7 = 10
      endif
    endif
    var22 *= 0.4 * var7 * OPos
    predictOOption var17 9 LevelValue
    predictionConfidence var23 9 LevelValue  

    if Equal var17 1 && var23 >= 0.3
      predictOOption var23 8 LevelValue 
      predictAverage var17 10 LevelValue
      var17 += Width + OWidth
      var17 *= OPos
      if Equal var21 16.3
      elif Equal var23 3
        // LOGSTR_NL 1431192576 1163023104 1213157120 1409286144 0
        var23 = OXSpeed
        var23 *= OPos
        if OCurrAction >= 2 && OCurrAction <= 25 && var23 >= 0
        else
          var22 *= 5
        endif
        var13 += var17
        var13 += var22
      elif Equal var23 2
        // LOGSTR_NL 1331053824 1381189632 1330598912 0 0
        var22 = OPos * 25
        GetYDistFloorOffset var22 var22 5 1
        if !(Equal var22 -1)
          var22 *= 5
          var13 -= var17
          var13 -= var22
        endif
      endif
    // else
    //   LOGSTR_NL 1313166592 1414676736 1275068416 0 0
    endif
  endif
endif

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
label shouldOffset
  var22 = 200
  XGoto GetChrSpecific
  //= XReciever
  var2 = 0
  if Equal var22 1
  elif OYDistBackEdge < -10
  elif !(Equal var21 16.4) && var21 < 16.7
    var22 = OTopNY - TopNY
    if var22 <= 30
      var2 = 1
      Return
    endif
  endif
  var22 = 0.003
  XGoto GetChrSpecific
  //= XReciever
var0 = var22
  if var0 >= 10
    var2 = 1
  endif
Return
label adjustPosIfInGround

  if OYDistFloor > 0
    var22 = OTopNY - var23
    if var22 > OYDistFloor
      var23 = OTopNY - OYDistFloor
    endif
  endif
Return
Return
