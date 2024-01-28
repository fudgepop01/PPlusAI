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
if Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18 || Equal var20 19 || Equal var20 20
  var0 = 1
endif

// #let shouldOffsetRes = var2
// Goto shouldOffset
// shouldOffsetRes = var23

var12 = -1
if OCurrAction >= 256

  var22 = OCurrAction + 256
  RetrieveFullATKD var3 var22 var22 var22 var22 var22 var22 var22 1
  if var3 >= 0
    var7 += var0
    // shouldOffsetRes = 0
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
    GetAttribute var23 940; 0
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
    if OAnimFrame <= 3 && !(Equal OYSpeed 0)
      var23 = OYCoord + OTotalYSpeed * var7 - OGravity * var7 * var7
    else
      EstOYCoord var23 var7
    endif
  else

    GetAttribute var22 40; 1
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

// DrawDebugRectOutline var13 var14 3 3 0 255 0 221


var22 = var11 + var9
if  Equal var20 21 || Equal var20 22 || Equal var20 23 || Equal var20 24 || Equal var20 25 || Equal var20 26 || Equal var20 27
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
var22 = var8 * 0.5
var14 -= var22

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
  var22 = (TopNY - YDistFloor) + 12.03
  if !(Equal OYDistFloor -1) && SamePlane && OYDistFloor < var8 && Equal AirGroundState 1
    if var14 < var22
      var23 = var14 - 40.83 * 0.5
      if var23 < var22
        var14 = TopNY + 40.83
      elif !(Equal CurrAction 10)
        var14 = TopNY + 12.03
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
          var15 = -1
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

// shouldOffsetRes = 0
if !(CalledFrom ExecuteAttack)
  if Equal OCurrAction 77
    predictOOption var17 12
    predictionConfidence var22 12
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
  STACK_PUSH var22 0
  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var3 = var22
  var22 = STACK_POP
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
  endif
endif
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
