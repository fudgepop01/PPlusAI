#include <Definition_AIMain.h>
id 0x8503
unk 0x0

//= XReciever
NoRepeat

// FIXME debug thing maybe
// SetDebugMode 0
// yep, move choice is COOOOOMPLICATED lmao

// #let priority = var11
// if !(Equal var20 -1)
//   PAUSE
// endif

predictOOption var22 8 
var23 = 0
if OCurrAction >= 66 && OCurrAction <= 100 && !(Equal OCurrAction 73)
  var23 = 1
endif
if !(Equal var22 2) && var21 < 16.7 && Equal var21 16 && !(Equal var16 2) && OFramesHitstun <= 0 && Equal var23 0 && YDistFloor < 25
  predictOOption var23 7 
  Goto checkOInCombo
  predictionConfidence var17 7
  var17 *= 2
  if Equal var22 1
  elif !(Equal var23 3) && Rnd < var17 && CHANCE_MUL_LE PT_WALL_CHANCE 1.2 && SamePlane
    var20 = -1
    var21 = 16.3
  endif
endif

if Equal var21 16.3 && YDistFloor > 25
  var21 = 16
elif Equal var21 16.3 && YDistFloor < 0
  var21 = 16
elif var21 >= 16 && var21 <= 17
elif Equal var16 2 || Equal var21 10.1 || Equal var21 10.2
else
  var21 = 16
endif
// if OFramesHitstun >= 1 && var21 < 16.7
//   var21 = 16
// endif

// // ///////////////////////////////////////////////////////////////
// // prioritization
// // ///////////////////////////////////////////////////////////////

// #const priority_kill = 0
// #const priority_combo = 1
// #const priority_techchase = 2
// // https://fightinggameglossary.net/index/pressure
// #const priority_pressure = 3 
// #const priority_breakCC = 4
// #const priority_escapeCorner = 5
// #const priority_launch = 6
// // https://fightinggameglossary.net/index/poke
// #const priority_poke = 7 
// // I might not implement this idk
// #const priority_camp = 8 
// #const priority_edgeguard = 9
// // https://fightinggameglossary.net/index/anti-air
// #const priority_antiAir = 10 
// // https://fightinggameglossary.net/index/conversion
// #const priority_conversion = 11 
// // https://fightinggameglossary.net/index/frame-trap
// #const priority_frameTrap = 12 
// // https://fightinggameglossary.net/index/cross-up
// #const priority_crossUp = 13 
// // https://fightinggameglossary.net/index/otg
// #const priority_jabReset = 14 

// DynamicDiceClear 0
// DynamicDiceClear 1

// // universal:
// // - breakCC
// // - antiAir
//   // predict the chance that the opponent will crouch
//   PredictOMov var22 6
//   if OCurrAction >= 17 && OCurrAction <= 21
//     var22 += 1.5
//   endif
//   DynamicDiceAdd 0 priority_breakCC var22

//   // if they're in the air and are likely to attack then an anti-air is a good option
//   var22 = OTopNY - TopNY - HurtboxSize
//   if XDistLE var17 && var22 > 10
//     PredictOMov var22 14
//     if var22 > 0.4 && CHANCE_MUL_LE PT_AGGRESSION 1.3 && OFramesHitstun < 15
//       var23 = PT_AGGRESSION * 0.5
//       DynamicDiceAdd 0 priority_antiAir var23
//     endif
//   endif
// // neutral:
// // - kill
// // - poke
// // - breakCC
// // - crossUp
// // - antiAir
// // - launch

// // getting approximate width of the main stage platform
// Goto approxStageWidth

// Norm var22 TopNX TopNY 
// Norm var23 OTopNX OTopNY
// Abs var22
// Abs var23

// // if the distance between the players is less than about 7/20ths of the stage width
// var17 *= 0.35
// if var22 < var17
//   // ...and neither player is 7/20th stage lengths away from the ledge
//   var17 *= OPos
//   GetYDistFloorOffset var22 var17 5 1
//   var17 *= -1
//   GetYDistFloorOffset var23 var17 5 0
//   if !(Equal var22 -1) && !(Equal var23 -1) 
//     Goto neutral_priorities
//   endif
// endif

// if !(True)
//   label neutral_priorities
//     // the greater the damage, the more incentive there is to go for a kill
//     // however, approaching can be unsafe, and so is determined by aggression
//     var17 = PT_AGGRESSION + 0.15
//     var22 = ODamage * (100 + OWeight - 100) / 2000
//     var22 *= var17
//     DynamicDiceAdd 0 priority_kill var22

//     // pokes are used in neutral often to try and get at the target from a safe distance
//     var23 = (PT_AGGRESSION + 1) * (PT_BAITCHANCE + 1)
//     DynamicDiceAdd 0 priority_poke var23

//     if Equal AirGroundState 1
//       // if the opponent is unlikely to attack or grab
//       PredictOMov var22 14
//       PredictOMov var17 15
//       var23 = (PT_AGGRESSION + 1) * (PT_BAITCHANCE + 1) * (1.5 - var22) * (1.5 - var17)
//       if var22 < 0.2 && var17 < 0.2
//         // then consider crossing them up
//         DynamicDiceAdd 0 priority_crossUp var23
//       endif
//       // otherwise if they're high in the air and nearby
//       $tempVar(OYDist, var22)
//       OYDist = OTopNY - TopNY - HurtboxSize
//       predictAverage var17 10
//       var17 += 10
//       if XDistLE var17 && OYDist > 25
//         // then maybe crossing up is still a good option
//         var23 *= 0.85 * PT_AGGRESSION
//         DynamicDiceAdd 0 priority_crossUp var23
//       endif
//     endif

//     // if they're close then a launcher (as-in combo starter) is an idea
//     predictAverage var17 10
//     var17 += Width + OWidth
//     if ODistLE var17
//       var23 = 2 * (0.4 + PT_AGGRESSION) * (0.4 + PT_BRAVECHANCE)
//       DynamicDiceAdd 0 priority_launch var23
//     endif
//   Return
// endif

// // advantage options
// $tempVar(OYDist, var22)
// OYDist = OTopNY - TopNY - HurtboxSize
// if OYDist > 40
//   Goto advantage_priorities
// elif True
//   // otherwise if the opponent is 4/10ths of the way to the ledge relative to their direction from you
//   Goto approxStageWidth
//   var17 *= 0.4 * OPos
//   // take aggression and bravery into account
//   var23 = (0.5 + PT_AGGRESSION) * (0.5 + PT_BRAVECHANCE)
//   var17 *= var23
//   GetYDistFloorOffset var22 var17 5 1
//   if Equal var22 -1
//     Goto advantage_priorities
//   elif True
//     // then if the target is stuck in their shield...
//     if OCurrAction >= 26 && OCurrAction <= 29 && XDistLE 35
//       Goto advantage_priorities
//     endif
//   endif
// endif

// if !(True)
//   label advantage_priorities
//     // the greater the damage, the more incentive there is to go for a kill
//     var22 = ODamage * (100 + OWeight - 100) / 2000
//     DynamicDiceAdd 0 priority_kill var22

//     var22 = 2 * PT_AGGRESSION
//     DynamicDiceAdd 0 priority_pressure var22
//     if OCurrAction >= 26 && OCurrAction <= 29
//       DynamicDiceAdd 0 priority_pressure 2.5
//     endif
//     var22 *= 0.65
//     DynamicDiceAdd 0 priority_combo var22
//     var23 = 1 + PT_BRAVECHANCE
//     var22 *= var23
//     DynamicDiceAdd 0 priority_launch var22

//     var22 = PT_BAITCHANCE * 5
//     DynamicDiceAdd 0 priority_frameTrap var22
//   Return
// endif

// // if the target is caught in a combo of some sort
// // exclude if they can act freely
// GET_CHAR_TRAIT(var22, 200)
// if Equal var22 1
//   Goto punish_priorities
// endif
// if !(True)
//   label punish_priorities
//     // the greater the damage, the more incentive there is to go for a kill
//     var22 = ODamage * (100 + OWeight - 100) / 900
//     DynamicDiceAdd 0 priority_kill var22

//     // calculate if we can arrive to the target's position as their hitstun ends
//     if OFramesHitstun > 0
//       // var23 = OFramesHitstun

//       // EstOXCoord var22 var23

//       // if Equal AirGroundState 1
//       //   GetAttribute var17 40 0
//       // else
//       //   GetAttribute var17 136 0
//       // endif
//       // var17 = var17 * var23
//       // var17 *= OPos
//       // var17 += TopNX

//       // if var17 < var22 && OPos < 0
//       //   DynamicDiceAdd 0 priority_combo 15
//       // elif var17 > var22 && OPos > 0
//         DynamicDiceAdd 0 priority_combo 15
//       // endif
//     elif OCurrAction >= 77 && OCurrAction <= 100
//       DynamicDiceAdd 0 priority_techchase 4
//     else
//       // otherwise see if we can make a conversion
//       // var23 = 20

//       // EstOXCoord var22 var23

//       // if Equal AirGroundState 1
//       //   GetAttribute var17 40 0
//       // else
//       //   GetAttribute var17 136 0
//       // endif
//       // var17 = var17 * var23
//       // var17 *= OPos
//       // var17 += TopNX

//       // if var17 < var22 && OPos < 0
//       //   DynamicDiceAdd 0 priority_conversion 5
//       // elif var17 > var22 && OPos > 0
//         DynamicDiceAdd 0 priority_conversion 8
//       // endif
//     endif

//     if OYDistFloor > 1 && OYDistFloor < 8
//       DynamicDiceAdd 0 priority_techchase 2.5
//     endif

//     var22 = PT_BAITCHANCE
//     if OCurrAction >= 26 && OCurrAction <= 29
//       var22 *= 2.5
//     endif
//     DynamicDiceAdd 0 priority_frameTrap var22
//   Return
// endif

// // disadvantage (very similar to advantage - basically just reversed)
// if OFramesHitstun <= 0
//   $tempVar(OYDist, var22)
//   OYDist = TopNY - OTopNY - OHurtboxSize
//   if OYDist > 40
//     Goto disadvantage_priorities
//   elif True
//     // otherwise if the opponent is 4/10ths of the way to the ledge relative to their direction from you
//     Goto approxStageWidth
//     var17 *= -0.4 * OPos
//     // take aggression and bravery into account
//     // var23 = (0.5 + PT_AGGRESSION) * (0.5 + PT_BRAVECHANCE) + 1
//     // var17 /= var23
//     GetYDistFloorOffset var22 var17 5 1
//     var23 = OTopNX + var17
//     DrawDebugLine OTopNX OCenterY var23 OCenterY 255 0 0 221
//     if Equal var22 -1
//       Goto disadvantage_priorities
//     endif
//   endif
// endif
// if !(True)
//   label disadvantage_priorities
//     // the greater the damage, the more incentive there is to go for a kill (less so than pure advantage)
//     var22 = ODamage * (100 + OWeight - 100) / 4000
//     DynamicDiceAdd 0 priority_kill var22
    
//     // perhaps try to wall them out
//     var22 = (1 - PT_AGGRESSION) * 4
//     DynamicDiceAdd 0 priority_poke var22

//     var22 = PT_BRAVECHANCE * 4
//     DynamicDiceAdd 0 priority_crossUp var22

//     var22 = PT_AGGRESSION * 4
//     DynamicDiceAdd 0 priority_escapeCorner var22
//   Return
// endif
// // edgeguard
// if !(True)
//   label edgeguard_priorities
//     // the greater the damage, the more incentive there is to go for a kill (less so than pure advantage)
//     var22 = ODamage * (100 + OWeight - 100) / 2000
//     DynamicDiceAdd 0 priority_kill var22
    
//     DynamicDiceAdd 0 priority_edgeguard 12
//   Return
// endif

// DynamicDiceRoll 0 priority 0



// ///////////////////////////////////////////////////////////////
// priority results
// ///////////////////////////////////////////////////////////////

DynamicDiceClear 0

// ///////////////////////////////////////////////////////////////
// attack rolls
// ///////////////////////////////////////////////////////////////
var22 = OFramesHitstun * 0.75
EstOYCoord var22 var22
var23 = OHurtboxSize
var22 -= TopNY 
var22 -= var23

var12 = 1
// PredictOMov var23 7
// var23 *= 0.2
if CurrAction >= 26 && CurrAction <= 29
elif Equal CurrSubaction JumpSquat || CalledFrom Shield
elif YDistFloor > 20 || OYDistFloor > 45
elif var22 > 5
elif YDistFloor > 8 && XDistLE 15
elif OCurrAction >= 66 && OCurrAction <= 100 && var22 > 20
else
  var12 = 0
endif

// if var21 >= 16.7 && OXDistBackEdge < 50 && OYDistBackEdge < 20
//   var12 = 1
// el
if Equal YDistFloor -1
  var12 = 1
endif

DynamicDiceClear 0
if CurrAction >= 52 && CurrAction <= 58 

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
DynamicDiceAdd 0 11 1
DynamicDiceAdd 0 12 1
DynamicDiceAdd 0 13 1
endif

if Equal HitboxConnected 1 && HasCurry
  {TURBO_ROUTINES}
endif
{COMBO_ROUTINES}

// EstOTopNY
var22 = OTotalYSpeed / OGravity
if OTotalYSpeed < 0
  var22 = 10
endif
EstOYCoord var17 var22
STACK_PUSH var17 1

// EstOYDistFloor
var17 -= OTopNY
var17 += OYDistFloor
if var17 < 0
  var17 = 0
endif
Goto checkOInCombo
if var22 > 0
  var17 += 7
endif
STACK_PUSH var17 1

GetAttribute var22 40 0
GetAttribute var17 136 0
// XTerminalVelocity
if var17 > var22
  STACK_PUSH var17 1
else
  STACK_PUSH var22 1
endif

// jumpVelocity
GetAttribute var22 72 0
STACK_PUSH var22 1

// OEndLag
Goto getOEndlag
STACK_PUSH var22 1

// EstOTopNX
GetAttribute var22 140 1
var23 = OTotalXSpeed
Abs var23
var23 /= var22
var23 *= OTotalXSpeed
if Equal OAirGroundState 1
  var23 = OTotalXSpeed * 4
endif
var23 += OTopNX
STACK_PUSH var23 1 
// stageWidth
Goto approxStageWidth
STACK_PUSH var17 1 // stageWidth

var18 = 20
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
STACK_PUSH 1 0
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
  if CurrAction >= 52 && CurrAction <= 58
    var20 = -1
    Return
  elif Equal OAirGroundState 1
    // predict the chance that the opponent will crouch
    PredictOMov var22 6
    if var22 > 0.10
      var4 *= 0.67
      var6 *= 0.67
    endif
  endif
  if Equal var12 1
    if Equal CurrSubaction JumpSquat || Equal CurrAction 27 || Equal CurrAction 28 || Equal CurrAction 29
if Equal var20 7
        Return
elif !(True)
        Return
      endif
    endif
  STACK_PUSH var22 0
  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var11 = var22
  var22 = STACK_POP
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
  // elif Equal var10 0
  //   if Equal var21 10.1 || Equal var21 16.3
  //   else
  //     var20 = -1
  //     Return
  //   endif
  elif Equal var21 16.3 && var9 > 120
    var20 = -1
    Return
  endif
  if Equal HitboxConnected 1 && HasCurry
    {TURBO_FILTERS}
  endif
  {ADDITIONAL_FILTERS}
  Return
endif

if !(True)
  label __DI_ANGLE__
  predictOOption var22 5
  predictionConfidence var23 5
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

// SetDebugMode TEMP_DEBUG_TOGGLE

// SetDebugMode 1
LOGVAL var20
LOGSTR 1128812288 1397050880 541152256 1413563136 1258291200
  var22 = 19.1
  XGoto GetChrSpecific
  //= XReciever
PRINTLN
// SetDebugMode 0

// SETTER
// $setLastAttack(fsmash)

DynamicDiceClear 0
DynamicDiceClear 1

if Equal HitboxConnected 1 && HasCurry
  {TURBO_ACTIONS}
endif

XGoto SetAttackGoal
Return

// ///////////////////////////////////////////////////////////////
// check hub/types/adder
// ///////////////////////////////////////////////////////////////

label check_hub

  var15 = 0

  if YDistFloor < 20 && !(Equal YDistFloor -1) 
    var22 = 0
if Equal var20 9
      GetAttribute var22 300 0
elif Equal var20 10
      GetAttribute var22 304 0
elif Equal var20 13
      GetAttribute var22 316 0
elif Equal var20 11
      GetAttribute var22 308 0
elif Equal var20 12
      GetAttribute var22 312 0
    endif
    if !(Equal var22 0) 
      if Equal AirGroundState 2
        var22 *= 0.5
      else
        GetAttribute var23 940 0
        var7 += var23 + 2
        GetAttribute var23 112 0
        if var23 > 0.06
          var22 *= 0.5
        endif
        var22 += var7
        var23 = var9 * 0.4
        var22 += var23
      endif

      if var22 <= var9
        var9 = var22
      endif
    endif
  endif

  {FILTER_CHECKS}

  // ENABLE DEBUG THING
  // if Equal var21 10.1
  //   SetDebugMode 1
  // endif
  var22 = 19.1
  XGoto GetChrSpecific
  //= XReciever
  // PRINTLN

  // if Equal priority priority_jabReset
  //   Goto jabreset_check
  if var10 <= 0
    var22 = TopNX - OTopNX
    Abs var22
    var22 += 1
    var15 = var22 * var3 * 0.05
    // if var23 > 100
    //   var23 = 100
    // endif
    // var15 += var23
    GetAttribute var23 40 1 
    var23 *= 0.25
    var23 *= var9
    predictAverage var17 10
    // LOGSTR 1684632320 1950574592 1795162112 0 0
    // LOGVAL var17
    // LOGVAL var22
    if Equal var21 7.1
      var15 *= 2
    endif
    if YDistFloor < 0
      PRINTLN
      Return
    elif Equal var10 0
      if var9 <= 10
        var15 *= 3
      endif
      var15 *= 15
      Goto addMove
      PRINTLN
      Return
    elif var22 < var23 || var22 < var17 
      PRINTLN
      Return
    endif
    Goto aftDirs
    PRINTLN
    Return 
  elif !(Equal var21 7.1) 
    // $ifLastOrigin(grab,0)
    //   if var1 > 180
    //     var15 = ODamage * 0.5 * Rnd
    //     Goto dirCheck
    //     PRINTLN
    //     Return
    //   endif
    // endif    
    if !(Equal var21 16.3) && !(Equal var21 16.41)
      // "lol" said the programmer, "lmao"
      RESET_LTF_STACK_PTR
      
      // EstOTopNY
      var23 = LTF_STACK_READ
      // EstOYDistFloor
      var22 = LTF_STACK_READ
  STACK_PUSH var22 0
  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var11 = var22
  var22 = STACK_POP
  if Equal var11 1
      elif OYDistFloor < 0
        var23 = TopNY - YDistFloor
        var22 = 0
      else 
        var23 = OTopNY - OYDistFloor
      endif
      // rollWeightVariable ODamage OWeight moveAngle moveBaseKnockback moveKnockbackGrowth moveHitFrame moveDuration moveIASA moveDamage moveIsWeightDependent          XTerminalVelocity jumpVelocity   OEndLag        EstOTopNX      TopNX TopBZ     xBZ       stageWidth     EstOTopNY      EstOYDistFloor
      CalcMoveWeight var15 ODamage OWeight var1 var4 var6 var7 var8 var9 var10 var13 LTF_STACK_READ LTF_STACK_READ LTF_STACK_READ LTF_STACK_READ TopNX TBoundary RBoundary LTF_STACK_READ var23 var22
elif !(True)
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
  LOGSTR 1111577344 1157627904 0 0 0
  LOGVAL var15

  {MOVE_CALC_MODIFIERS}

  // O mid
  // var17 = TopNY - OTopNY
  // Abs var17
  // var23 = HurtboxSize + OHurtboxSize
  // var23 *= 0.5
  // if var17 <= var23
  //   if Equal dirY 0 
  //     var15 *= 1.35
  //   else
  //     var15 *= 0.25
  //   endif
  // endif

  var23 = TopNY - OTopNY
  var17 = TopNX - OTopNX
  Abs var23
  Abs var17
  if var17 > var23
    if OFramesHitstun < 5
      var23 = TopNX - OTopNX
      var17 = var7 * XSpeed
      var17 -= var23
      Abs var17
      Goto getMaxXDist
      if var17 >= var23
        var23 = var3 + var5
        var22 = var5
        Abs var22
        if var22 > var23
          var23 = var22
        endif
        if var23 > 30
          var23 = 20
        endif
        var23 *= 0.75
        var15 += var23
        var15 += var23
        var15 += var23
        if Equal var21 16.3
          var15 += var23
          var15 += var23
        endif

        var23 *= 0.35
        var23 += 1
        var15 *= var23


  var22 = 0.001
  XGoto GetChrSpecific
  //= XReciever
        if var21 < 16.7
          var23 = TopNX - OTopNX
          Abs var23
          if var11 > 0 && Equal AirGroundState 2 || YDistFloor < OFramesHitstun && YDistFloor > -1 && var23 < 35
            if Equal Direction OPos && var22 >= 0 
              var15 *= 1.75
            elif !(Equal Direction OPos) && var22 < 0 
              var15 *= 1.75
            elif !(Equal var22 0) && var23 < 30
              var15 *= 0.05
            endif
          endif
        endif
      else
        var15 *= 5
      endif
    else
      var22 = OTopNX + OTotalXSpeed * var7
      var23 = TopNX + TotalXSpeed * var7
      var22 -= var23
      Abs var22
      Goto getMaxXDist
      if var22 < var23
        var22 *= 0.15
        var15 += var22
        var15 *= 2
      endif
    endif
    if !(True)
      label getMaxXDist
      var23 = var5
      Abs var23
      var23 += var3
      var23 += var3
      Return
    endif

    // LOGSTR 1480870144 1375731712 0 0 0
    // LOGVAL var15
  endif
  if !(True)
    label aftDirs
  endif
  Goto checkOInCombo
  var23 = var22
  Goto getOEndlag
  if !(Equal var21 16.3) && Equal var23 0 && var22 < 10
    Goto addIfFastHit
    // LOGSTR 1179142400 1409286144 0 0 0
    // LOGVAL var15
  else 
    var23 = TopNX - OTopNX
    Abs var23
    var17 = var3 * 3
    if var23 > var17
      var23 = var22
      if var22 < 5
        var22 = 5
      endif
      // predictAverage var17 10
      var22 -= var7
      var22 *= 0.05
      // itv = advantage * 0.05
      var22 += 1

      if var22 > 1.5
        var22 = 1.5
      elif var22 < 0
        var22 = 0
      endif

      if var22 > 1 || var10 > 0
        var15 *= var22
      endif

      // LOGSTR 1329942016 1145831424 0 0 0
      // LOGVAL var15
    endif
  endif
    
  // if Equal var21 16.3
  //   if var8 <= 3
  //     var22 = var8 + 1
  //     var22 = var15 / var22
  //     var15 *= var22
  //   elif True
  //     var22 = var8 - 3
  //     var22 *= 0.15
  //     var15 *= var22
  //   endif
  //   // LOGSTR 1229870080 1163021568 0 0 0
  //   // LOGVAL var15
  //   // PAUSE
  // endif

  if var21 < 16.7
    Goto getEndlag
    // LOGVAL var22
    // endlag - (OEndLag + 5)
    // var22 -= var23
    GetAttribute var23 40 1
    var23 *= 0.5
    // ... *= OInitDashVel * 1.15
    var22 *= var23
    // OInitDashVel * 1.15 * var9
    var23 *= var9
    predictAverage var17 10
    var17 *= 0.5
    var23 += var17

    if Equal var16 2 || Equal var21 10.1
      if XDistLE var23
        Return
      endif
    endif
    if var10 < 0 && XDistLE var23
      Return
    endif



    var17 = var22

    // var17 = dist covered by opponent during endlag
    // var23 = dist between self and opponent
    var23 = var3 + var5
    var22 = OTopNX - TopNX
    Abs var22
    if Equal var21 16.3
      var22 -= 10
      var23 += var3
      var23 += OWidth
    endif
    if var22 < var23
      var23 = var22
    endif
  var22 = 200
  XGoto GetChrSpecific
  //= XReciever

    // LOGSTR 1835363328 996242432 1979711488 0 0
    // LOGVAL var17
    // LOGVAL var23
    // LOGVAL var3
    // LOGVAL var5
    if var23 < var17 && Equal var22 0
      var17 -= var23
      var17 *= 0.005
      var17 += 1
      var15 /= var17
    endif
    if !(Equal var21 16.3)
if Equal var20 -1
elif !(True)
        PredictOMov var23 10
        if var23 > 0.11 && !(Equal var16 1)
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

    LOGSTR 1398752512 1313098752 0 0 0
    LOGVAL var15
  endif
  
  if !(True)
    label addMove
  endif
  if var10 <= 0
    var15 *= 3.5
  endif
  var22 = LevelValue / 100
  var23 = Rnd
  if var23 < var22
    var23 = var22
  endif
  var15 *= var23
  LOGSTR 1179209216 1095499776 0 0 0
  LOGVAL var15
  if var15 > 0
    DynamicDiceAdd 1 var20 var15
  endif
Return
label getEndlag
  var17 = var7 + var8
  var22 = var9
  var22 -= var17
  STACK_PUSH var22 0
  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var11 = var22
  var22 = STACK_POP
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
  STACK_PUSH var22 0
  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var11 = var22
  var22 = STACK_POP
  if Equal var11 1
    if Equal AirGroundState 1
      var22 += 6
    endif
  endif
  if var22 < 0
    var22 = 15 - var7
    if Equal var16 1
      var22 *= 0.65
    else
      GetCommitPredictChance var23
      if var23 > 0.18
        var22 *= 0.8
      else 
        var22 *= 0.4
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
label checkOInCombo
  var22 = 200
  XGoto GetChrSpecific
  //= XReciever
Return
Return
