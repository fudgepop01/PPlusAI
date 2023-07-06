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
  var22 = 200
  XGoto GetChrSpecific
  //= XReciever
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
//       //   GetAttribute var17 40; 0
//       // else
//       //   GetAttribute var17 136; 0
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
//       //   GetAttribute var17 40; 0
//       // else
//       //   GetAttribute var17 136; 0
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
var23 = OHurtboxSize * 2
var22 -= TopNY 
var22 -= var23

var12 = 1
PredictOMov var23 7
var23 *= 0.2
if CurrAction >= 26 && CurrAction <= 29
elif Equal CurrSubaction JumpSquat || CalledFrom Shield
elif YDistFloor > 20 || OYDistFloor > 45
elif var22 > 5
elif YDistFloor > 8 && XDistLE 15
elif OCurrAction >= 66 && OCurrAction <= 100 && var22 > 20
else
  var12 = 0
endif

// if var21 >= 16.7 && OXDistBackEdge < 100 && OYDistBackEdge < 20
//   var12 = 1
// el
if Equal YDistFloor -1
  var12 = 1
endif

DynamicDiceClear 0
if CurrAction >= 52 && CurrAction <= 58 
DynamicDiceAdd 1 13 0.2
DynamicDiceAdd 1 14 0.2
DynamicDiceAdd 1 15 0.2
DynamicDiceAdd 1 16 0.2
DynamicDiceAdd 1 17 0.2
else
DynamicDiceClear 0
DynamicDiceAdd 0 0 1
DynamicDiceAdd 0 1 0.5
DynamicDiceAdd 0 2 0.5
DynamicDiceAdd 0 3 0.5
DynamicDiceAdd 0 4 0.5
DynamicDiceAdd 0 5 1
DynamicDiceAdd 0 6 1
DynamicDiceAdd 0 7 0.5
DynamicDiceAdd 0 8 0.5
DynamicDiceAdd 0 9 1
DynamicDiceAdd 0 10 1
DynamicDiceAdd 0 11 1
DynamicDiceAdd 0 12 1
DynamicDiceAdd 0 14 0.2
DynamicDiceAdd 0 15 0.2
DynamicDiceAdd 0 16 0.2
DynamicDiceAdd 0 17 0.2
DynamicDiceAdd 0 18 1
DynamicDiceAdd 0 19 0.3333333333333333
DynamicDiceAdd 0 20 0.3333333333333333
DynamicDiceAdd 0 21 0.3333333333333333
DynamicDiceAdd 0 22 0.5
DynamicDiceAdd 0 23 0.5
DynamicDiceAdd 0 24 1
DynamicDiceAdd 0 25 0.3333333333333333
DynamicDiceAdd 0 26 0.3333333333333333
DynamicDiceAdd 0 27 0.3333333333333333
endif

if Equal HitboxConnected 1 && HasCurry
//   {TURBO_ROUTINES}
endif
// {COMBO_ROUTINES}

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
LOGSTR_NL 1684628224 1696623616 1869574144 0 0
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
if !(True) || Equal var20 13 || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17
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
if !(True) || Equal var20 9
        Return
elif !(True) || Equal var20 12
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
  elif Equal var21 16.3 && var9 > 120
    var20 = -1
    Return
  endif
  if Equal HitboxConnected 1 && HasCurry
  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var11 = var22
  if Equal var11 1
  endif
  if CurrAction >= 42 && CurrAction <= 50 && Equal var11 1
    var20 = -1
    Return
  elif Equal var11 0 && YSpeed < 0
    var20 = -1
    Return  
  endif
  endif
//   {ADDITIONAL_FILTERS}
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

// {POST_CHOICE_FILTER}

SetDebugMode TEMP_DEBUG_TOGGLE

LOGVAL var20
LOGSTR 1128812288 1397050880 541152256 1413563136 1258291200
  var22 = 19.1
  XGoto GetChrSpecific
  //= XReciever
PRINTLN

// SETTER
// $setLastAttack(fsmash)

DynamicDiceClear 0
DynamicDiceClear 1

if Equal HitboxConnected 1 && HasCurry
  if CurrAction >= 36 && CurrAction <= 51
    var22 = 1
    if CurrAction <= 38
      Stick 1
    elif CurrAction <= 41
    elif CurrAction <= 50
      var22 = 0
    endif
  endif
  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var11 = var22
  if Equal var11 1
    if OKBYSpeed >= 2
      Button X
    endif
    Call ExecuteAttack
elif !(True) || Equal var20 1 || Equal var20 2
elif !(True)
  elif Equal AirGroundState 1
    CallI ExecuteAttack
  elif Equal IsOnStage 1
    Stick 0 -1
    var15 = -2
  endif
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
if !(True) || Equal var20 18
      GetAttribute var22 300; 0
elif !(True) || Equal var20 19 || Equal var20 20 || Equal var20 21
      GetAttribute var22 304; 0
elif !(True) || Equal var20 25 || Equal var20 26 || Equal var20 27
      GetAttribute var22 316; 0
elif !(True) || Equal var20 22 || Equal var20 23
      GetAttribute var22 308; 0
elif !(True) || Equal var20 24
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

//   {FILTER_CHECKS}

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
    var10 *= -1
    var23 = TopNX - OTopNX
    Abs var23
    var15 = var23 * 2
    if Equal var10 0
      var15 *= 2.25
      Goto addMove
      PRINTLN
      Return
    endif
    Goto aftDirs
    PRINTLN
    Return 
  elif !(Equal var21 7.1) 
if !(True) || Equal var20 13 || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17
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
elif !(True) || Equal var20 13 || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17
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

//   {MOVE_CALC_MODIFIERS}

  // O above

  var22 = 0.002
  XGoto GetChrSpecific
  //= XReciever
var17 = var22

  if !(Equal var17 0)
    var22 = 0
    if CurrAction >= 36
      var22 = AnimFrame - EndFrame
      if var22 > 30
        var22 = 30
      endif
    endif
    var23 = var22
    EstOYCoord var22 var23

    var11 = OYCoord - var22
    if OYDistFloor > 0 && OYDistFloor < 5
      var22 = OYCoord
    elif var11 > OYDistFloor && OYDistFloor > 0
      var22 = OYCoord - OYDistFloor
    endif

    EstYCoord var23 var23
    var11 = YCoord - var23
    if var11 > YDistFloor && YDistFloor > 0
      var23 = YCoord - YDistFloor
    endif
    // OEstPos - EstPos
    // pos = above
    // neg = below
    var22 -= var23
    var23 = var22
    var23 -= HurtboxSize

    if var23 > 0
      if var17 > 0
        var15 *= 2.5
      else
        var15 *= 0.1
      endif
    elif var17 > 0
      var15 *= 0.1
    endif

    // O below
    var23 = var22
    var23 += OHurtboxSize

    if var23 <= 0
      if Equal OIsOnStage 0
      elif var17 < 0
        var15 *= 1.85
      else
        var15 *= 0.1
      endif
    endif
    LOGSTR 1497647360 1381171200 0 0 0
    LOGVAL var15
  endif

  // O mid
  // var17 = TopNY - OTopNY
  // Abs var17
  // var23 = HurtboxSize + OHurtboxSize
  // var23 *= 0.5
  // if var17 <= var23
  //   if Equal var17 0 
  //     var15 *= 1.35
  //   else
  //     var15 *= 0.25
  //   endif
  // endif

  var23 = TopNY - OTopNY
  var17 = TopNX - OTopNX
  Abs var17
  if var17 > var23

  var22 = 0.001
  XGoto GetChrSpecific
  //= XReciever
    var23 = TopNX - OTopNX
    var17 = var7 * XSpeed
    var17 -= var23
    Abs var17
    if OFramesHitstun < 5
      var23 = var5
      Abs var23
      var23 += var3
      var23 += var3
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


        if Equal IsOnStage 1
          if Equal AirGroundState 1 || YDistFloor < OFramesHitstun
            if Equal Direction OPos && var22 >= 0 
              var15 *= 1.75
            elif !(Equal Direction OPos) && var22 < 0 
              var15 *= 1.75
            elif !(Equal var22 0)
              var15 *= 0.05
            endif
          endif
        endif
      else
        var15 *= 5
      endif
    endif
if !(True) || Equal var20 13 || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17
      if var17 < 35
  var22 = 200
  XGoto GetChrSpecific
  //= XReciever
        PredictOMov var17 10
        if var17 > 0.3 && OYDistFloor < 20 && OYDistFloor > -1
          if Equal var22 0
            var22 = var17 + 1
            var15 *= var22
          endif
          var15 *= 2.25
        endif
      endif
    endif

    LOGSTR 1480870144 1375731712 0 0 0
    LOGVAL var15
  endif
  if !(True)
    label aftDirs
  endif
  var22 = 200
  XGoto GetChrSpecific
  //= XReciever
  if !(Equal var21 16.3) && Equal var22 0
    Goto addIfFastHit
    LOGSTR 1179142400 1409286144 0 0 0
    LOGVAL var15
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
  LOGSTR 1329942016 1145831424 0 0 0
  LOGVAL var15
    
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
  // LOGSTR 1532698624 1327522816 1634953216 1231972608 1951819008
  // LOGVAL var23
  var23 *= 1.15
  var22 *= var23
  var23 *= var9
  // LOGSTR 1852779776 1918987776 1734680576 1986096128 0
  // LOGVAL var23
  // STACK_PUSH var23 0
  // var23 = TopNX - OTopNX
  // Abs var23
  // LOGSTR 1684632320 1952542208 1667571712 1566375936 0
  // LOGVAL var23
  // var23 = STACK_POP
  // if Equal var16 2
  //   var23 *= 0.75
  // endif
  if Equal var16 2 || Equal var21 10.1 || Equal var16 2
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
if Equal var20 13
elif !(True) || Equal var20 13 || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17
      PredictOMov var23 10
      if var23 > 0.2 && !(Equal var16 1)
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
  
  if !(True)
    label addMove
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
      var22 *= 0.65
    else
      GetCommitPredictChance var23
      if var23 > 0.25
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
Return
