#include <Definition_AIMain.h>
id 0x8503
unk 0x0

//= XReciever
NoRepeat

// yep, move choice is COOOOOMPLICATED lmao

// #let priority = var11
// if !(Equal var20 -1)
//   PAUSE
// endif

predictOOption var22 8 LevelValue 
var23 = 0
if OCurrAction >= 66 && OCurrAction <= 100 && !(Equal OCurrAction 73)
  var23 = 1
endif
if !(Equal var22 2) && var21 < 16.7 && Equal var21 16 && !(Equal var16 2) && OFramesHitstun <= 0 && Equal var23 0
  predictOOption var23 7 LevelValue 
  var22 = 200
  XGoto GetChrSpecific
  //= XReciever
  predictionConfidence var17 7 LevelValue
  var17 *= 2
  if Equal var22 1
  elif !(Equal var23 3) && Rnd < var17 && CHANCE_MUL_LE PT_WALL_CHANCE 1.2 && SamePlane
    var21 = 16.3
  endif
endif

if var21 >= 16 && var21 <= 17
elif Equal var16 2 || Equal var21 10.1 || Equal var21 10.2
else
  var21 = 16
endif

DynamicDiceClear 0

// ///////////////////////////////////////////////////////////////
// attack rolls
// ///////////////////////////////////////////////////////////////

EstOYCoord var22 OFramesHitstun
var23 = OHurtboxSize * 2
var22 -= TopNY 
var22 -= var23

var12 = 1
PredictOMov var23 7 LevelValue
var23 *= 0.2
if CurrAction >= 26 && CurrAction <= 29
elif Equal CurrSubaction JumpSquat || CalledFrom Shield
elif YDistFloor > 20 || OYDistFloor > 45
elif var22 > 15
elif YDistFloor > 8 && XDistLE 15
elif OCurrAction >= 66 && OCurrAction <= 100 && var22 > 20
else
  var12 = 0
endif

// if var21 >= 16.7 && OXDistBackEdge < 70 && OYDistBackEdge < 20
//   var12 = 1
// el
if Equal YDistFloor -1
  var12 = 1
endif

DynamicDiceClear 0
if CurrAction >= 52 && CurrAction <= 58 
DynamicDiceAdd 1 15 0.16666666666666666
DynamicDiceAdd 1 16 0.16666666666666666
DynamicDiceAdd 1 17 0.16666666666666666
DynamicDiceAdd 1 18 0.16666666666666666
DynamicDiceAdd 1 19 0.16666666666666666
DynamicDiceAdd 1 20 0.16666666666666666
else
DynamicDiceClear 0
DynamicDiceAdd 0 0 0.5
DynamicDiceAdd 0 1 0.5
DynamicDiceAdd 0 2 1
DynamicDiceAdd 0 3 1
DynamicDiceAdd 0 4 1
DynamicDiceAdd 0 5 1
DynamicDiceAdd 0 6 1
DynamicDiceAdd 0 7 1
DynamicDiceAdd 0 8 1
DynamicDiceAdd 0 9 1
DynamicDiceAdd 0 10 1
DynamicDiceAdd 0 11 0.3333333333333333
DynamicDiceAdd 0 12 0.3333333333333333
DynamicDiceAdd 0 13 0.3333333333333333
DynamicDiceAdd 0 14 1
DynamicDiceAdd 0 16 0.16666666666666666
DynamicDiceAdd 0 17 0.16666666666666666
DynamicDiceAdd 0 18 0.16666666666666666
DynamicDiceAdd 0 19 0.16666666666666666
DynamicDiceAdd 0 20 0.16666666666666666
DynamicDiceAdd 0 21 0.5
DynamicDiceAdd 0 22 0.5
DynamicDiceAdd 0 23 0.5
DynamicDiceAdd 0 24 0.5
DynamicDiceAdd 0 25 1
DynamicDiceAdd 0 26 1
DynamicDiceAdd 0 27 1
endif
// ///////////////////////////////////////////////////////////////
// hardcoded situations
// ///////////////////////////////////////////////////////////////
{COMBO_ROUTINES}

// perform these expensive calculations once for efficiency
if LevelValue >= 60
  // EstOYDistFloor
  EstOYCoord var17 10 
  var17 -= OTopNY
  var17 += OYDistFloor
  if var17 < 0
    var17 = 0
  endif
  STACK_PUSH var17 1 

  GetAttribute var22 40; 0
  GetAttribute var17 136; 0
  // XTerminalVelocity
  if var17 > var22
    STACK_PUSH var17 1
  else
    STACK_PUSH var22 1
  endif

  // jumpVelocity
  GetAttribute var22 72; 0
  STACK_PUSH var22 1

  // OEndLag
  Goto getOEndlag
  STACK_PUSH var22 1
  
  var22 = OTopNX
  var23 = OTopNY
  // OTopNY
  STACK_PUSH var23 1 
  // OTopNX
  STACK_PUSH var22 1 
  // ESTOYDISTFLOOR AT START
  // TopNX
  STACK_PUSH TopNX 1
  // TopBZ
  STACK_PUSH TBoundary 1
  // nearXBZ
  if var22 > 0
    STACK_PUSH RBoundary 1
  else
    STACK_PUSH LBoundary 1
  endif
  // stageWidth
  Goto approxStageWidth
  STACK_PUSH var17 1 // stageWidth
endif

var18 = 60 * ((6 - PlayerCount) * 0.25)
SeekNoCommit __DICE_LOOP__
if !(True)
  label __DICE_LOOP__
  DynamicDiceRoll 0 var20 1
  if Equal var20 -1 
    var18 -= 1
    if var18 <= 0
      SeekNoCommit __DICE_LOOP_END__
    elif Equal var20 -1 
      SeekNoCommit __DICE_LOOP__
    endif
  endif 
  var22 = 19
STACK_PUSH 6 0
STACK_PUSH 4 0
STACK_PUSH 13 0
STACK_PUSH 10 0
STACK_PUSH 9 0
STACK_PUSH 8 0
STACK_PUSH 7 0
STACK_PUSH 0 0
STACK_PUSH 3 0
STACK_PUSH 0 0
STACK_PUSH 5 0
STACK_PUSH 1 0
  XGoto GetChrSpecific
  //= XReciever

  Goto __ADDITIONAL_FILTERS__
  if Equal var20 -1 
    SeekNoCommit __DICE_LOOP__
  endif
  if LevelValue >= 75
    Goto __DI_ANGLE__
  endif

  Goto check_hub
  var18 -= 1
  if var18 <= 0
    SeekNoCommit __DICE_LOOP_END__
  endif
  SeekNoCommit __DICE_LOOP__
  Return
  label __DICE_LOOP_END__
endif

if !(True)
  label __ADDITIONAL_FILTERS__
if !(True) || Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18 || Equal var20 19 || Equal var20 20
    if CurrAction >= 52 && CurrAction <= 58
      Return
    endif
    if Equal var16 2 || Equal var21 10.1 || Equal var21 16.3 
      var20 = -1
      Return
    endif
  elif CurrAction >= 52 && CurrAction <= 58
    var20 = -1
    Return
  endif
  if Equal var12 1
    if Equal CurrSubaction JumpSquat || Equal CurrAction 27 || Equal CurrAction 28 || Equal CurrAction 29
if !(True) || Equal var20 7
        Return
elif !(True) || Equal var20 9
        Return
      endif
    endif
  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var11 = var22
  if Equal var11 1
    else
      var20 = -1
      Return
    endif
  endif
  if Equal var16 2
    if var10 > 0
      var20 = -1
    endif
  elif Equal var10 0
    if Equal var21 10.1 || Equal var21 16.3
    else
      var20 = -1
      Return
    endif
  endif
  {ADDITIONAL_FILTERS}
  Return
endif

if !(True)
  label __DI_ANGLE__
  predictOOption var22 5 LevelValue
  predictionConfidence var23 5 LevelValue
  var23 *= 3
  if Rnd < var23
    if Equal var22 1
      if var1 > 90 && var1 < 180
        var1 += 8
      elif var1 > 270
        var1 += 8
      else
        var1 -= 8
      endif
    elif Equal var22 3
      if var1 > 90 && var1 < 180
        var1 -= 8
      elif var1 > 270
        var1 -= 8
      else
        var1 += 8
      endif
    endif
  endif
  Return
endif

DynamicDiceRoll 1 var20 0

{POST_CHOICE_FILTER}

// LOGVAL var20
// LOGSTR 1128812288 1397050880 541152256 1413563136 1258291200
// CALL_EVENT(19.1)
// PRINTLN

DynamicDiceClear 0
DynamicDiceClear 1
// Seek _ENDCALC_
// ///////////////////////////////////////////////////////////////
// attack post-processing
// ///////////////////////////////////////////////////////////////

XGoto SetAttackGoal
Return

// ///////////////////////////////////////////////////////////////
// check hub/types/adder
// ///////////////////////////////////////////////////////////////

label check_hub

  var15 = 0

  if YDistFloor < 20 && !(Equal YDistFloor -1) 
    var22 = 0
if !(True) || Equal var20 21 || Equal var20 22
      GetAttribute var22 300; 0
elif !(True) || Equal var20 23 || Equal var20 24
      GetAttribute var22 304; 0
elif !(True) || Equal var20 27
      GetAttribute var22 316; 0
elif !(True) || Equal var20 25
      GetAttribute var22 308; 0
elif !(True) || Equal var20 26
      GetAttribute var22 312; 0
    endif
    if !(Equal var22 0) 
      if Equal AirGroundState 2
        var22 *= 0.5
      else
        GetAttribute var23 940; 0
        var7 += var23 + 1
        GetAttribute var23 112; 0
        if var23 > 0.06
          var22 *= 0.5
        endif
      endif

      if var22 <= var9
        var9 = var22
      endif
    endif
  endif

  {FILTER_CHECKS}

  // CALL_EVENT(19.1)
  // PRINTLN

  // if Equal priority priority_jabReset
  //   Goto jabreset_check
  if Equal var10 0 && var4 >= 0
    var15 = 350
  elif True
if !(True) || Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18 || Equal var20 19 || Equal var20 20
      if var1 > 180
        var15 = ODamage * 0.5 * Rnd
        Goto dirCheck
        PRINTLN
        Return
      endif
    endif    
    if !(Equal var21 16.3) && !(Equal var21 16.41)
      // "lol" said the programmer, "lmao"
      RESET_LTF_STACK_PTR
      
      var22 = LTF_STACK_READ
  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var11 = var22
  if Equal var11 1
      elif OYDistFloor < 0
        var22 = TopNY - YDistFloor
      else 
        var22 = OTopNY - OYDistFloor
      endif
      // rollWeightVariable ODamage OWeight moveAngle moveBaseKnockback moveKnockbackGrowth moveHitFrame moveDuration moveIASA moveDamage moveIsWeightDependent XTerminalVelocity jumpVelocity OEndLag OTopNY OTopNX EstOYDistFloor TopNX TopBZ NearXBZ stageWidth
      CalcMoveWeight var15 ODamage OWeight var1 var4 var6 var7 var8 var9 var10 var13 LTF_STACK_READ LTF_STACK_READ LTF_STACK_READ LTF_STACK_READ LTF_STACK_READ var22 LTF_STACK_READ LTF_STACK_READ LTF_STACK_READ LTF_STACK_READ
elif !(True) || Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18 || Equal var20 19 || Equal var20 20
      Return
    else
      var15 = 20
    endif
  endif

  Goto dirCheck

  PRINTLN
Return
label jabreset_check
  // I know, it's supposed to be moves that deal < 7% but at this
  // point i'm out of variables lmao
  if var10 <= 7
    var15 += 1000
  endif
Return
label dirCheck
  // LOGSTR 1111577344 1157627904 0 0 0
  // LOGVAL var15

  {MOVE_CALC_MODIFIERS}

  // O above
  // $tempVar(dirY, var17)
  // GET_CHAR_TRAIT(dirY, 0.002)

  // var23 = var7 + 5
  // if !(Equal dirY 0) && OFramesHitstun < var23
  //   EstOYCoord var22 var23
  //   var23 = var22
  //   var23 += HurtboxSize

  //   if var23 < OTopNY
  //     if dirY > 0
  //       var15 *= 1.75
  //     else
  //       var15 *= 0.1
  //     endif
  //   endif

  //   // O below
  //   var23 = var22
  //   if var23 >= TopNY
  //     if Equal OIsOnStage 0
  //     elif dirY < 0
  //       var15 *= 3.5
  //     else
  //       var15 *= 0.1
  //     endif
  //   endif
  //   // LOGSTR 1497647360 1381171200 0 0 0
  //   // LOGVAL var15
  // endif
  
  // $tempVar(dirX, var22)
  // GET_CHAR_TRAIT(dirX, 0.001)
  // var17 = var7 * XSpeed + TopNX - OTopNX
  // Abs var17
  // if OFramesHitstun < 5
  //   if var17 >= 20
  //     var23 = var3 + var5
  //     var22 = var5
  //     Abs var22
  //     if var22 > var23
  //       var23 = var22
  //     endif
  //     if var23 > 30
  //       var23 = 20
  //     endif
  //     var23 *= 0.75
  //     var15 += var23
  //     var15 += var23
  //     var15 += var23
  //     if Equal var21 16.3
  //       var15 += var23
  //       var15 += var23
  //     endif

  //     var23 *= 0.5
  //     var23 += 1
  //     var15 *= var23


  //     if Equal IsOnStage 1
  //       if Equal AirGroundState 1 || YDistFloor < OFramesHitstun
  //         if Equal Direction OPos && dirX >= 0 
  //           var15 *= 1.75
  //         elif !(Equal Direction OPos) && dirX < 0 
  //           var15 *= 1.75
  //         elif !(Equal dirX 0)
  //           var15 *= 0.05
  //         endif
  //       endif
  //     endif
  //   elif Equal dirX 0
  //     var15 *= 1.4
  //   endif
  // endif
  // $ifLastOrigin(grab,0)
  //   if var17 < 35
  //     GET_CHAR_TRAIT(var22, 200)
  //     PredictOMov var17 10 LevelValue
  //     if var17 > 0.2 && OYDistFloor < 20 && OYDistFloor > -1
  //       if Equal var22 0
  //         var22 = var17 + 1
  //         var15 *= var22
  //       endif
  //       var15 *= 2.25
  //     endif
  //   endif
  // endif
  //=

  // LOGSTR 1480870144 1375731712 0 0 0
  // LOGVAL var15
  if !(Equal var21 16.3) && Equal OFramesHitstun 0
    Goto addIfFastHit
    // LOGSTR 1179142400 1409286144 0 0 0
    // LOGVAL var15
  endif
  Goto getOEndlag
  var22 += 5
  var23 = var22
  if var7 <= var22 
    var22 -= var7
    var22 *= 0.1
    var22 += 1
    var15 *= var22
  endif
  // LOGSTR 1329942016 1145831424 0 0 0
  // LOGVAL var15
  if var15 < 3000
    if Equal var21 16.3
      if var8 <= 3
        var22 = var8 + 1
        var22 = var15 / var22
        var15 *= var22
      elif True
        var22 = var8 - 3
        var22 *= 0.15
        var15 *= var22
      endif
      // LOGSTR 1229870080 1163021568 0 0 0
      // LOGVAL var15
      // PAUSE
    endif

    Goto getEndlag
    var22 -= var23
    GetAttribute var23 40; 1
    var23 *= 1.2
    var22 *= var23
    var23 *= var8
    if Equal var16 2
      var23 *= 0.65
    endif
    if Equal var21 10.1 || Equal var16 2
      if XDistLE var23
        Return
      endif
    endif
    if Equal var4 -1 && XDistLE var23
      Return
    endif
    if var22 > 25 || Equal var21 16.3
      if Equal var21 16.3
        var22 *= 0.25
        var15 -= var22
        var22 *= 0.05
      else
        var22 -= 20
        var22 *= 0.025
      endif
      var22 += 1
      var15 /= var22
    endif
    if !(Equal var21 16.3)
if Equal var20 15
elif !(True) || Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18 || Equal var20 19 || Equal var20 20
        PredictOMov var23 10 LevelValue
        if var23 > 0.08 && !(Equal var16 1)
          var23 = 100 * var23
          var15 += var23
          var23 *= 0.1
          var15 *= var23
        endif
        if OCurrAction >= 26 && OCurrAction <= 29 && YDistFloor < 25
          var15 += 20
          var15 *= 3
        endif
      endif
    endif

    // LOGSTR 1398752512 1313098752 0 0 0
    // LOGVAL var15
  endif
    
  var22 = LevelValue / 100
  var23 = Rnd
  if var23 < var22
    var23 = var22
  endif
  var15 *= var23
  // LOGSTR 1179209216 1095499776 0 0 0
  // LOGVAL var15
  if var15 > 0
    DynamicDiceAdd 1 var20 var15
  endif
Return
label getEndlag
  var22 = var7 + var8
  var22 = var9 - var22
  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var11 = var22
  if Equal var11 1
    if Equal IsOnStage 1
      var22 = var9
    endif
  endif
Return
label getOEndlag
  var22 = 0.003
  XGoto GetChrSpecific
  //= XReciever
Return
label addIfFastHit
  var22 = var7
  var22 -= 15
  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var11 = var22
  if Equal var11 1
    if Equal AirGroundState 1
      var22 += 6
    endif
  endif
  if var22 < 0
    var22 = 15 - var7
    if Equal var16 1
      var22 *= 0.4
    else
      GetCommitPredictChance var23 LevelValue
      if var23 > 0.2
        var22 *= 0.6
      else 
        var22 *= 0.25
      endif
    endif
    var22 += 1
    var15 *= var22
  endif
Return
label approxStageWidth
  GetColDistPosAbs var22 var23 0 -5 -10000 -5 0
  GetColDistPosAbs var17 var23 var22 -5 10000 -5 0
  var17 -= var22
Return
Return
