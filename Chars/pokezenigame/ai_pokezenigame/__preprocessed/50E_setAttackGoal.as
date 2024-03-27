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
if Equal var23 0 || OAnimFrame < var17
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
if Equal var20 18 || Equal var20 19 || Equal var20 20 || Equal var20 21 || Equal var20 22
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

// frame addition to account for reaction time
var22 = (1 - (LevelValue / 100)) * 60 + 10
var22 *= PT_REACTION_TIME
var13 = OTotalXSpeed * var22
LOGSTR 1381263616 1835335680 0 0 0
LOGVAL var13

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
// globTempVar *= 0.5

if var12 < 0

  if OCurrAction > 32 && OAnimFrame > 3
    EstOXCoord var23 var7
  else
    var23 = OTopNX + OTotalXSpeed * var7
  endif

  if OYDistBackEdge > 20
    var23 = ODirection * OXDistFrontEdge + OTopNX
  endif

  var13 += var23


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
    LOGSTR 1635021824 1912602624 0 0 0
    LOGVAL var22
    PredictOMov var23 14
    var23 *= var22
    var23 *= OPos * -1
    if Equal var21 16.3 || Equal var21 10.1 
      var13 -= var23
    endif
    var13 -= var23
    
    var23 = OTopNY
    // PredictOMov immediateTempVar mov_jump
    // PredictOMov globTempVar mov_djump
    // if globTempVar > 0.22
    //   if ONumJumps > 0
    //     GetAttribute immediateTempVar attr_jumpYInitVel 1
    //     CalcYChange immediateTempVar move_hitFrame immediateTempVar OGravity OMaxFallSpeed OFastFallSpeed 0
    //     estOYPos += immediateTempVar
    //   endif      
    // endif

  endif
  // if OYDistBackEdge > 5
  //   if estOYPos < 0
  //     estOYPos = 0
  //   endif
  //   tempYRange += estOYPos
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
  OXGoto GetChrSpecific
  if Equal var22 -123456789
    STACK_TOSS 3
    EstOXCoord var22 var17
    EstOYCoord var23 var17
  endif
  var6 = STACK_POP
  var5 = STACK_POP
  var4 = STACK_POP
  var3 = STACK_POP
  var2 = STACK_POP
  var1 = STACK_POP
  var0 = STACK_POP

  if OYDistBackEdge > 20
    var22 = ODirection * OXDistFrontEdge + OTopNX 
  endif

  var13 += var22
  Goto adjustPosIfInGround
  var14 = var23
endif

LOGSTR 1164862464 0 0 0 0
LOGVAL var13
PRINTLN


// if var3 < 1 || OYDistBackEdge > 20 && YDistFloor > 0
//   GetYDistFloorAbsPos immediateTempVar goalX CenterY
//   if immediateTempVar < 0
//     goalX = TopNX
//     anotherTempVar = XDistBackEdge * Direction * OPos
//     if anotherTempVar < 0
//       anotherTempVar = XDistFrontEdge * Direction
//     endif
//     goalX += anotherTempVar
//   endif
// endif

// if Equal AirGroundState 2
//   CalcYChange anotherTempVar move_hitFrame immediateTempVar Gravity MaxFallSpeed FastFallSpeed 0
//   goalY += anotherTempVar
// endif

if Equal OCurrAction 84
  var14 = OCenterY
endif

DrawDebugRectOutline var13 var14 3 3 0 255 0 221


var22 = var9 + var11 
// move_centerX *= 0.5
if  var20 >= 23 && var20 <= 30
  var22 *= Direction
else
  var22 *= OPos
endif
var13 -= var22

if AnimFrame > 2
  var3 = LevelValue * 0.0125
  var22 = TotalXSpeed * var7
  var22 *= var3
if Equal var20 11 || Equal var20 13 || Equal var20 17
  else
  // goalX -= immediateTempVar
  endif

  var22 = TotalYSpeed * var7
  // immediateTempVar *= multiplier
if Equal var20 11 || Equal var20 13 || Equal var20 15 || Equal var20 17
  else
  var14 -= var22
  endif
endif
// $tempVar(OWidthOffset,immediateTempVar)
// OWidthOffset = OPos * 0.5 * OWidth
// goalX += OWidthOffset

// goalY += move_yOffset
// immediateTempVar = OHurtboxSize + move_yRange
var22 = var8 - var10
// immediateTempVar *= 0.5
var14 -= var22
// if Equal AirGroundState 2 && YDistFloor > 5 || YDistFloor < 0
//   immediateTempVar = move_yRange * 0.5 + OHurtboxSize * 0.3
//   goalY += immediateTempVar
// endif

// anotherTempVar = OHurtboxSize * 0.5
// tempYRange += anotherTempVar
// anotherTempVar = OWidth * 0.5
// tempXRange += anotherTempVar

// anotherTempVar = Width * 0.5
// tempGoalX -= anotherTempVar
// anotherTempVar = HurtboxSize * 0.5
// tempGoalY += anotherTempVar

// anotherTempVar = OTopNX - OCenterX
// anotherTempVar *= 1
// tempGoalX -= anotherTempVar

// anotherTempVar = OTopNY - OTopNY
// anotherTempVar *= 1
// tempGoalY += anotherTempVar

// immediateTempVar = OHurtboxSize
// goalY += immediateTempVar

if OTopNY > TopNY 
  if SamePlane
    var14 = TopNY
  else
    var14 = OTopNY
  endif
endif
// IF_AERIAL_ATTACK(var3)
//   immediateTempVar = (TopNY - YDistFloor) + cs_shortHopHeight
//   // LOGSTR str("gy; ph; jhh")
//   // LOGVAL goalY
//   // LOGVAL immediateTempVar
//   if !(Equal OYDistFloor -1) && SamePlane && OYDistFloor < move_yRange && Equal AirGroundState 1
//     if goalY < immediateTempVar
//       anotherTempVar = goalY - cs_jumpHeight * 0.5
//       LOGVAL anotherTempVar
//       if anotherTempVar < immediateTempVar
//         goalY = TopNY + cs_jumpHeight
//       elif !(Equal CurrAction hex(0xA))
//         goalY = TopNY + cs_shortHopHeight
//       endif
//     endif
//   endif
//   // PRINTLN

//   globTempVar = OTopNY + OHurtboxSize
//   if TopNY > globTempVar && Equal AirGroundState 1
//     if OCurrAction >= hex(0xA) && OCurrAction <= hex(0xB) && OAnimFrame < 10
//       goalY = OTopNY - OYDistFloor
//     endif
//   endif
// endif

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
  var22 = 0.003
  XGoto GetChrSpecific
  //= XReciever
if var22 < 5 && var21 < 16.7 && !(Equal var21 16.5) // && Equal DEBUG_VALUE 0 
  var13 += var2
endif
// if Equal OCurrAction hex(0x4D)
//   predictOOption globTempVar man_OGetupOption
//   predictionConfidence immediateTempVar man_OGetupOption
//   if immediateTempVar >= 0.3
//     anotherTempVar = OPos * 20
//     if Equal globTempVar op_getup_in
//       goalX -= globTempVar
//     elif Equal globTempVar op_getup_out
//       goalX += globTempVar
//     elif Equal globTempVar op_getup_attack && XDistLE 15 && Equal AirGroundState 1 && SamePlane
//       if CHANCE_MUL_LE PT_AGGRESSION 0.25
//         currGoal = cg_attack_reversal
//         scriptVariant = calc(sv_jump_over + svp_jump_fullhop)
//         IF_AERIAL_ATTACK(var3)
//         else
//           XGoto CalcAttackGoal
//         endif
//         skipMainInit = mainInitSkip
//         Call JumpScr
//       else
//         currGoal = cg_defend
//         Call Shield
//       endif
//     endif
//   endif

// immediateTempVar = move_xRange * 0.5 * OPos
// goalX += immediateTempVar

// immediateTempVar = original_goalX - TopNX
// anotherTempVar = goalX - TopNX

// immediateTempVar -= anotherTempVar
// Abs immediateTempVar
// if immediateTempVar > 10
//   anotherTempVar = goalX + original_goalX
//   anotherTempVar *= 0.5
//   goalX = anotherTempVar
// endif

// if Equal OIsOnStage 1
//   GetYDistFloorOffset immediateTempVar 20 10 1
//   if Equal immediateTempVar -1 && Equal OPos -1
//     goalX -= 2 
//   endif
//   GetYDistFloorOffset immediateTempVar -20 10 1
//   if Equal immediateTempVar -1 && Equal OPos 1
//     goalX += 2
//   endif
// endif

// LOGSTR str("GOALX, Y")
// LOGVAL goalX
// LOGVAL goalY
// LOGSTR str("SVariant")
// LOGVAL scriptVariant
// PRINTLN

// if CalledFrom UpdateGoal
//   if Equal CurrAction hex(0xA) || Equal scriptVariant sv_attackgoal_justy
//     goalX = original_goalX
//   elif Equal scriptVariant sv_attackgoal_justx
//     goalY = original_goalY
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
