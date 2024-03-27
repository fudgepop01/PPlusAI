#include <Definition_AIMain.h>
id 0x8503
unk 0x0

//= XReciever
NoRepeat
RESET_LTF_STACK_PTR

if !(Equal DEBUG_VALUE 0)
  if var21 < 16.7
    var21 = 16
  endif
  SeekNoCommit debug_value_latk
endif

// FIXME debug thing maybe
// SetDebugMode false
// yep, move choice is COOOOOMPLICATED lmao
// #let move_hitFrame = var2

// #let priority = var11
// if !(Equal lastAttack -1)
//   PAUSE
// endif

predictOOption var22 8 
var23 = 0
if OCurrAction >= 66 && OCurrAction <= 100 && !(Equal OCurrAction 73)
  var23 = 1
endif
// if !(Equal immediateTempVar op_baitdir_overshoot) && currGoal < cg_edgeguard && Equal currGoal cg_attack && !(Equal scriptVariant sv_campAttack) && OFramesHitstun <= 0 && Equal anotherTempVar 0 && YDistFloor < 25
//   predictOOption anotherTempVar man_ODefendOption 
//   Goto checkOInCombo
//   predictionConfidence globTempVar man_ODefendOption
//   globTempVar *= 2
//   if Equal immediateTempVar 1
//   elif !(Equal anotherTempVar op_defend_shield) && Rnd < globTempVar && CHANCE_MUL_LE PT_WALL_CHANCE 1.2 && SamePlane
//     lastAttack = -1
//     currGoal = cg_attack_wall
//   endif
// endif

if Equal var21 16.3 && YDistFloor > 25
  var21 = 16
elif Equal var21 16.3 && YDistFloor < 0
  var21 = 16
elif var21 >= 16 && var21 <= 17
elif Equal var16 2 || Equal var21 10.1 || Equal var21 10.2
else
  var21 = 16
endif
// if OFramesHitstun >= 1 && currGoal < cg_edgeguard
//   currGoal = cg_attack
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

// DynamicDiceClear dslot0
// DynamicDiceClear dslot1

// // universal:
// // - breakCC
// // - antiAir
//   if OCurrAction >= hex(0x11) && OCurrAction <= hex(0x15)
//     immediateTempVar += 1.5
//   endif
//   DynamicDiceAdd dslot0 priority_breakCC immediateTempVar

//   // if they're in the air and are likely to attack then an anti-air is a good option
//   immediateTempVar = OTopNY - TopNY - HurtboxSize
//   if XDistLE globTempVar && immediateTempVar > 10
//     PredictOMov immediateTempVar mov_attack
//     if immediateTempVar > 0.4 && CHANCE_MUL_LE PT_AGGRESSION 1.3 && OFramesHitstun < 15
//       anotherTempVar = PT_AGGRESSION * 0.5
//       DynamicDiceAdd dslot0 priority_antiAir anotherTempVar
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

// Norm immediateTempVar TopNX TopNY 
// Norm anotherTempVar OTopNX OTopNY
// Abs immediateTempVar
// Abs anotherTempVar

// // if the distance between the players is less than about 7/20ths of the stage width
// globTempVar *= 0.35
// if immediateTempVar < globTempVar
//   // ...and neither player is 7/20th stage lengths away from the ledge
//   globTempVar *= OPos
//   GetYDistFloorOffset immediateTempVar globTempVar 5 1
//   globTempVar *= -1
//   GetYDistFloorOffset anotherTempVar globTempVar 5 0
//   if !(Equal immediateTempVar -1) && !(Equal anotherTempVar -1) 
//     Goto neutral_priorities
//   endif
// endif

// if !(True)
//   label neutral_priorities
//     // the greater the damage, the more incentive there is to go for a kill
//     // however, approaching can be unsafe, and so is determined by aggression
//     globTempVar = PT_AGGRESSION + 0.15
//     immediateTempVar = ODamage * (100 + OWeight - 100) / 2000
//     immediateTempVar *= globTempVar
//     DynamicDiceAdd dslot0 priority_kill immediateTempVar

//     // pokes are used in neutral often to try and get at the target from a safe distance
//     anotherTempVar = (PT_AGGRESSION + 1) * (PT_BAITCHANCE + 1)
//     DynamicDiceAdd dslot0 priority_poke anotherTempVar

//     if Equal AirGroundState 1
//       // if the opponent is unlikely to attack or grab
//       PredictOMov immediateTempVar mov_attack
//       PredictOMov globTempVar mov_grab
//       anotherTempVar = (PT_AGGRESSION + 1) * (PT_BAITCHANCE + 1) * (1.5 - immediateTempVar) * (1.5 - globTempVar)
//       if immediateTempVar < 0.2 && globTempVar < 0.2
//         // then consider crossing them up
//         DynamicDiceAdd dslot0 priority_crossUp anotherTempVar
//       endif
//       // otherwise if they're high in the air and nearby
//       $tempVar(OYDist, immediateTempVar)
//       OYDist = OTopNY - TopNY - HurtboxSize
//       predictAverage globTempVar man_OXHitDist
//       globTempVar += 10
//       if XDistLE globTempVar && OYDist > 25
//         // then maybe crossing up is still a good option
//         anotherTempVar *= 0.85 * PT_AGGRESSION
//         DynamicDiceAdd dslot0 priority_crossUp anotherTempVar
//       endif
//     endif

//     // if they're close then a launcher (as-in combo starter) is an idea
//     predictAverage globTempVar man_OXHitDist
//     globTempVar += Width + OWidth
//     if ODistLE globTempVar
//       anotherTempVar = 2 * (0.4 + PT_AGGRESSION) * (0.4 + PT_BRAVECHANCE)
//       DynamicDiceAdd dslot0 priority_launch anotherTempVar
//     endif
//   Return
// endif

// // advantage options
// $tempVar(OYDist, immediateTempVar)
// OYDist = OTopNY - TopNY - HurtboxSize
// if OYDist > 40
//   Goto advantage_priorities
// elif True
//   // otherwise if the opponent is 4/10ths of the way to the ledge relative to their direction from you
//   Goto approxStageWidth
//   globTempVar *= 0.4 * OPos
//   // take aggression and bravery into account
//   anotherTempVar = (0.5 + PT_AGGRESSION) * (0.5 + PT_BRAVECHANCE)
//   globTempVar *= anotherTempVar
//   GetYDistFloorOffset immediateTempVar globTempVar 5 1
//   if Equal immediateTempVar -1
//     Goto advantage_priorities
//   elif True
//     // then if the target is stuck in their shield...
//     if OCurrAction >= hex(0x1A) && OCurrAction <= hex(0x1D) && XDistLE 35
//       Goto advantage_priorities
//     endif
//   endif
// endif

// if !(True)
//   label advantage_priorities
//     // the greater the damage, the more incentive there is to go for a kill
//     immediateTempVar = ODamage * (100 + OWeight - 100) / 2000
//     DynamicDiceAdd dslot0 priority_kill immediateTempVar

//     immediateTempVar = 2 * PT_AGGRESSION
//     DynamicDiceAdd dslot0 priority_pressure immediateTempVar
//     if OCurrAction >= hex(0x1A) && OCurrAction <= hex(0x1D)
//       DynamicDiceAdd dslot0 priority_pressure 2.5
//     endif
//     immediateTempVar *= 0.65
//     DynamicDiceAdd dslot0 priority_combo immediateTempVar
//     anotherTempVar = 1 + PT_BRAVECHANCE
//     immediateTempVar *= anotherTempVar
//     DynamicDiceAdd dslot0 priority_launch immediateTempVar

//     immediateTempVar = PT_BAITCHANCE * 5
//     DynamicDiceAdd dslot0 priority_frameTrap immediateTempVar
//   Return
// endif

// // if the target is caught in a combo of some sort
// // exclude if they can act freely
// GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
// if Equal immediateTempVar 1
//   Goto punish_priorities
// endif
// if !(True)
//   label punish_priorities
//     // the greater the damage, the more incentive there is to go for a kill
//     immediateTempVar = ODamage * (100 + OWeight - 100) / 900
//     DynamicDiceAdd dslot0 priority_kill immediateTempVar

//     // calculate if we can arrive to the target's position as their hitstun ends
//     if OFramesHitstun > 0
//       // anotherTempVar = OFramesHitstun

//       // EstOXCoord immediateTempVar anotherTempVar

//       // if Equal AirGroundState 1
//       //   GetAttribute globTempVar attr_dashInitVel 0
//       // else
//       //   GetAttribute globTempVar attr_airXTermVel 0
//       // endif
//       // globTempVar = globTempVar * anotherTempVar
//       // globTempVar *= OPos
//       // globTempVar += TopNX

//       // if globTempVar < immediateTempVar && OPos < 0
//       //   DynamicDiceAdd dslot0 priority_combo 15
//       // elif globTempVar > immediateTempVar && OPos > 0
//         DynamicDiceAdd dslot0 priority_combo 15
//       // endif
//     elif OCurrAction >= hex(0x4D) && OCurrAction <= hex(0x64)
//       DynamicDiceAdd dslot0 priority_techchase 4
//     else
//       // otherwise see if we can make a conversion
//       // anotherTempVar = 20

//       // EstOXCoord immediateTempVar anotherTempVar

//       // if Equal AirGroundState 1
//       //   GetAttribute globTempVar attr_dashInitVel 0
//       // else
//       //   GetAttribute globTempVar attr_airXTermVel 0
//       // endif
//       // globTempVar = globTempVar * anotherTempVar
//       // globTempVar *= OPos
//       // globTempVar += TopNX

//       // if globTempVar < immediateTempVar && OPos < 0
//       //   DynamicDiceAdd dslot0 priority_conversion 5
//       // elif globTempVar > immediateTempVar && OPos > 0
//         DynamicDiceAdd dslot0 priority_conversion 8
//       // endif
//     endif

//     if OYDistFloor > 1 && OYDistFloor < 8
//       DynamicDiceAdd dslot0 priority_techchase 2.5
//     endif

//     immediateTempVar = PT_BAITCHANCE
//     if OCurrAction >= hex(0x1A) && OCurrAction <= hex(0x1D)
//       immediateTempVar *= 2.5
//     endif
//     DynamicDiceAdd dslot0 priority_frameTrap immediateTempVar
//   Return
// endif

// // disadvantage (very similar to advantage - basically just reversed)
// if OFramesHitstun <= 0
//   $tempVar(OYDist, immediateTempVar)
//   OYDist = TopNY - OTopNY - OHurtboxSize
//   if OYDist > 40
//     Goto disadvantage_priorities
//   elif True
//     // otherwise if the opponent is 4/10ths of the way to the ledge relative to their direction from you
//     Goto approxStageWidth
//     globTempVar *= -0.4 * OPos
//     // take aggression and bravery into account
//     // anotherTempVar = (0.5 + PT_AGGRESSION) * (0.5 + PT_BRAVECHANCE) + 1
//     // globTempVar /= anotherTempVar
//     GetYDistFloorOffset immediateTempVar globTempVar 5 1
//     anotherTempVar = OTopNX + globTempVar
//     DrawDebugLine OTopNX OCenterY anotherTempVar OCenterY color(0xFF0000DD)
//     if Equal immediateTempVar -1
//       Goto disadvantage_priorities
//     endif
//   endif
// endif
// if !(True)
//   label disadvantage_priorities
//     // the greater the damage, the more incentive there is to go for a kill (less so than pure advantage)
//     immediateTempVar = ODamage * (100 + OWeight - 100) / 4000
//     DynamicDiceAdd dslot0 priority_kill immediateTempVar
    
//     // perhaps try to wall them out
//     immediateTempVar = (1 - PT_AGGRESSION) * 4
//     DynamicDiceAdd dslot0 priority_poke immediateTempVar

//     immediateTempVar = PT_BRAVECHANCE * 4
//     DynamicDiceAdd dslot0 priority_crossUp immediateTempVar

//     immediateTempVar = PT_AGGRESSION * 4
//     DynamicDiceAdd dslot0 priority_escapeCorner immediateTempVar
//   Return
// endif
// // edgeguard
// if !(True)
//   label edgeguard_priorities
//     // the greater the damage, the more incentive there is to go for a kill (less so than pure advantage)
//     immediateTempVar = ODamage * (100 + OWeight - 100) / 2000
//     DynamicDiceAdd dslot0 priority_kill immediateTempVar
    
//     DynamicDiceAdd dslot0 priority_edgeguard 12
//   Return
// endif

// DynamicDiceRoll dslot0 priority 0



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
// PredictOMov anotherTempVar mov_jump
// anotherTempVar *= 0.2
if CurrAction >= 26 && CurrAction <= 29
elif Equal CurrSubaction JumpSquat || CalledFrom Shield
elif YDistFloor > 5 && YSpeed > -0.25 && CurrAction <= 32 || OYDistFloor > 45
elif var22 > 5
elif YDistFloor > 8 && XDistLE 15
elif OCurrAction >= 66 && OCurrAction <= 100 && var22 > 20
elif CurrAction >= 115 && CurrAction <= 123
else
  var12 = 0
endif

// if currGoal >= cg_edgeguard && OXDistBackEdge < calc(cs_recoveryDistX + 10) && OYDistBackEdge < 20
//   aerialChecks = 1
// el
if Equal YDistFloor -1
  var12 = 1
endif

DynamicDiceClear 0
if CurrAction >= 52 && CurrAction <= 58 
DynamicDiceAdd 1 16 0.25
DynamicDiceAdd 1 17 0.25
DynamicDiceAdd 1 18 0.25
DynamicDiceAdd 1 19 0.25
else
DynamicDiceClear 0
DynamicDiceAdd 0 0 0.5
DynamicDiceAdd 0 1 0.5
DynamicDiceAdd 0 2 0.5
DynamicDiceAdd 0 3 0.5
DynamicDiceAdd 0 4 1
DynamicDiceAdd 0 5 1
DynamicDiceAdd 0 6 1
DynamicDiceAdd 0 7 0.5
DynamicDiceAdd 0 8 0.5
DynamicDiceAdd 0 9 1
DynamicDiceAdd 0 10 1
DynamicDiceAdd 0 11 1
DynamicDiceAdd 0 12 1
DynamicDiceAdd 0 13 1
DynamicDiceAdd 0 14 1
DynamicDiceAdd 0 16 0.2
DynamicDiceAdd 0 17 0.2
DynamicDiceAdd 0 18 0.2
DynamicDiceAdd 0 19 0.2
DynamicDiceAdd 0 20 0.5
DynamicDiceAdd 0 21 0.5
DynamicDiceAdd 0 22 0.5
DynamicDiceAdd 0 23 0.5
DynamicDiceAdd 0 24 1
DynamicDiceAdd 0 25 1
DynamicDiceAdd 0 26 1
endif

if Equal HitboxConnected 1 && HasCurry
//   {TURBO_ROUTINES}
endif
// {COMBO_ROUTINES}

// perform these expensive calculations once for efficiency

// Recovery Distance
  var22 = 18
  XGoto GetChrSpecific
  //= XReciever
var23 = var22
STACK_PUSH var23 1

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
var23 = var17
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
var23 -= OHurtboxSize
if var23 > 21.63 && !(HasCurry)
  var22 = 0
endif
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


var18 = 30 * ((6 - PlayerCount) * 0.25)
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

  RESET_LTF_STACK_PTR
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
  var17 = LTF_STACK_READ
if Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18 || Equal var20 19
    if Equal CurrAction 60 
      Return
    endif
    if Equal var16 2 || Equal var21 10.1 || Equal var21 16.3 || OIsCharOf GigaBowser
      var20 = -1
      Return
    endif
  elif CurrAction >= 52 && CurrAction <= 58
    var20 = -1
    Return
  elif Equal OAirGroundState 1
    // predict the chance that the opponent will crouch
    PredictOMov var22 6
    if var22 > 0.07
      var4 *= 0.67
      var6 *= 0.67
    endif
  endif
  if Equal var12 1
    if Equal CurrSubaction JumpSquat || Equal CurrAction 27 || Equal CurrAction 28 || Equal CurrAction 29
if Equal var20 9
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

    if YDistFloor < 0
      CalcYChange var23 var9 YSpeed Gravity MaxFallSpeed FastFallSpeed 0
      var23 += TopNY
      if var23 < var17
        var20 = -1
        Return
      endif
    endif
  endif

  if Equal var16 2 && var9 > 60
    if var10 > 0
      var20 = -1
    endif
  // elif Equal move_damage 0
  //   if Equal currGoal cg_bait_attack || Equal currGoal cg_attack_wall
  //   elif XDistLE 15
  //     lastAttack = -1
  //     Return
  //   endif
  elif Equal var21 16.3 && var9 > 120
    var20 = -1
    Return
  endif
  if Equal HitboxConnected 1 && HasCurry
  STACK_PUSH var22 0
  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var11 = var22
  var22 = STACK_POP
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
// SETTER
// $setLastAttack(uair)
// fixme
if !(True)
  label debug_value_latk
  var20 = DEBUG_VALUE - 1
endif

LOGVAL var20
LOGSTR 1128812288 1397050880 541152256 1413563136 1258291200
  var22 = 19.1
  XGoto GetChrSpecific
  //= XReciever
PRINTLN

// Goto getOEndlag
// LOGSTR str("OENDL")
// LOGVAL immediateTempVar
// PRINTLN

DynamicDiceClear 0
DynamicDiceClear 1

if Equal var20 -1 && YDistFloor < 0
  CallI RecoveryHub
endif

if Equal HitboxConnected 1 && HasCurry
  if YDistBackEdge > -15 && Equal IsOnStage 0
    Button X
  endif
  var15 = -10
  var21 = 16.5
  CallI MainHub
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
if Equal var20 20 || Equal var20 21
      GetAttribute var22 300 0
elif Equal var20 22 || Equal var20 23
      GetAttribute var22 304 0
elif Equal var20 26
      GetAttribute var22 316 0
elif Equal var20 24
      GetAttribute var22 308 0
elif Equal var20 25
      GetAttribute var22 312 0
    endif
    if !(Equal var22 0) 
      var23 = OWidth + Width + var3
      if Equal AirGroundState 2 && XDistLE var23
        var22 *= 0.5
      else
        GetAttribute var23 940 0
        var7 += var23
        var7 += 2
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

//   {FILTER_CHECKS}

  // ENABLE DEBUG THING
  // if Equal currGoal cg_bait_attack
  //   SetDebugMode true
  // endif
  LOGVAL var20
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
    var15 = var22 * var3 * 0.15
    var9 *= 0.5
    // if anotherTempVar > 100
    //   anotherTempVar = 100
    // endif
    // rollWeight += anotherTempVar
    GetAttribute var23 40 1 
    var23 *= 0.15
    var23 *= var9
    predictAverage var17 10
    // LOGSTR str("distChk")
    // LOGVAL globTempVar
    // LOGVAL immediateTempVar
    if Equal var21 7.1 || var21 >= 16.7
      var15 *= 3
    endif
    if YDistFloor < 0
      PRINTLN
      Return
    elif Equal var10 0
      if var9 <= 10
        var15 *= 1.5
      endif
      var15 *= 1.5
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
    // $ifLastOrigin(grab,false)
    //   if move_angle > 180
    //     rollWeight = ODamage * 0.5 * Rnd
    //     Goto dirCheck
    //     PRINTLN
    //     Return
    //   endif
    // endif    
    if !(Equal var21 16.3) && !(Equal var21 16.41)
      // "lol" said the programmer, "lmao"
      
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
elif Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18 || Equal var20 19
        var22 = 1
      elif OYDistFloor < 0
        var23 = TopNY - YDistFloor
        var22 = 0
      else 
        var23 = OTopNY - OYDistFloor
      endif
      // rollWeightVariable ODamage OWeight moveAngle moveBaseKnockback moveKnockbackGrowth moveHitFrame moveDuration moveIASA moveDamage moveIsWeightDependent          XTerminalVelocity jumpVelocity   OEndLag        EstOTopNX      TopNX TopBZ     xBZ       stageWidth     EstOTopNY      EstOYDistFloor
      CalcMoveWeight var15 ODamage OWeight var1 var4 var6 var7 var8 var9 var10 var13 LTF_STACK_READ LTF_STACK_READ LTF_STACK_READ LTF_STACK_READ TopNX TBoundary RBoundary LTF_STACK_READ var23 var22
elif Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18 || Equal var20 19
      Return
    else
      var15 = 20
    endif
  endif

  Goto dirCheck

  PRINTLN
Return
// label jabreset_check
//   if move_damage <= 7
//     rollWeight += 50
//   endif
// Return
label dirCheck
  LOGSTR 1111577344 1157627904 0 0 0
  LOGVAL var15

//   {MOVE_CALC_MODIFIERS}

  // O mid
  // globTempVar = TopNY - OTopNY
  // Abs globTempVar
  // anotherTempVar = HurtboxSize + OHurtboxSize
  // anotherTempVar *= 0.5
  // if globTempVar <= anotherTempVar
  //   if Equal dirY 0 
  //     rollWeight *= 1.35
  //   else
  //     rollWeight *= 0.25
  //   endif
  // endif

  var17 = TopNX - OTopNX
  Abs var17
  Goto getMaxXDist
  if var23 > var17
    var5 = 0
    var3 = var17 * 0.5
  endif

  var23 = TopNY - OTopNY
  Abs var23
  var23 *= 0.5
  if var17 > var23
    GetAttribute var22 52 0
    GetAttribute var23 40 0
    if var23 < var22
      var22 = var23
    endif
    if var22 > 0
      var22 *= 1.5
    else
      var22 *= 0.5
    endif
    var3 /= var22
    var5 /= var22

if  Equal var20 12 || Equal var20 14 || var20 >= 20 && var20 <= 26
      var23 = var22 * 1.5
      var23 += 1
      var3 *= var23
      var23 = var3 + var5
      Abs var23
      if var23 < Width
        var3 *= 0.25
      endif
    endif
    
    if OFramesHitstun < 5
      var22 = TopNX - OTopNX
      var17 = var7 * XSpeed
      var17 -= var22
      Abs var17
      Goto getMaxXDist
      if var17 >= var23
        var23 = var3 + var5
        var22 = var5
        Abs var22
        if var22 > var23
          var23 = var22
        endif
        // if anotherTempVar > 50
        //   anotherTempVar = 25
        // endif

        var23 *= 0.5 * var23 
        var15 += var23
        if Equal var21 16.3
          var15 += var23
        endif

        var23 *= 0.035
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
            elif !(Equal Direction OPos) && var22 <= 0 
              var15 *= 1.75
            elif !(Equal var22 0) && var23 < 30
              var15 *= 0.05
            endif
          endif
        endif
      else
        var15 *= 2.5
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

    LOGSTR 1480870144 1375731712 0 0 0
    LOGVAL var15
  endif
if Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18 || Equal var20 19
    PredictOMov var17 10
    if var17 > 0.15 && OYDistFloor < 20 && OYDistFloor > -1
      var15 *= 2
    endif
    var17 *= 3
    var17 += 0.8
    var15 *= var17
  endif
  if !(True)
    label aftDirs
  endif
  Goto checkOInCombo
  var23 = var22
  Goto getOEndlag
  if !(Equal var21 16.3) && Equal var23 0 && var22 < 10
    var23 = var22
    Goto addIfFastHit
    LOGSTR 1179142400 1409286144 0 0 0
    LOGVAL var15
  else 
    // globTempVar = move_xRange * 3
    // if anotherTempVar < globTempVar
      var23 = var22
      if var22 < 5
        var22 = 5
      endif
      // predictAverage globTempVar man_OXHitDist
      var22 -= var7
      var22 *= 0.05
      // if immediateTempVar < 0
      //   immediateTempVar *= 0.15
      // else
      // endif
      // itv = advantage * 0.05
      var22 += 3

      if var22 > 4
        var22 = 4
      elif var22 < 0
        var22 = 0
      endif

      if var22 > 1 || var10 > 0
        var15 *= var22
      endif

      LOGSTR 1329942016 1145831424 0 0 0
      LOGVAL var15
    // endif
  endif
    

  GetAttribute var17 52 0
  var22 = OTopNX - TopNX
  Abs var22
  var17 /= var22
  // frames to reach opponent
  var23 *= var17

  if var23 < var7 && var21 < 16.7 && !(Equal var21 12)
    Goto getEndlag
    // LOGVAL immediateTempVar
    // endlag - (OEndLag + 5)
    // immediateTempVar -= anotherTempVar
    GetAttribute var23 40 1
    var23 *= 0.5
    // ... *= OInitDashVel * 1.15
    var22 *= var23
    // OInitDashVel * 1.15 * move_IASA
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

    // mEndlag = dist covered by opponent during endlag
    // anotherTempVar = dist between self and opponent
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

    // LOGSTR str("mel;atv")
    // LOGVAL mEndlag
    // LOGVAL anotherTempVar
    // LOGVAL move_xRange
    // LOGVAL move_xOffset
    if var23 < var17 && Equal var22 0
      var17 -= var23
      var17 *= 0.005
      var17 += 1
      var15 /= var17
    endif

    LOGSTR 1398752512 1313098752 0 0 0
    LOGVAL var15
  endif

  if !(Equal var21 16.3)
if Equal var20 15
elif Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18 || Equal var20 19
      PredictOMov var23 10
      if var23 > 0.18 && !(Equal var16 1)
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
    LOGSTR 1196572928 1113541888 1329856512 0 0
    LOGVAL var15
  endif
  
  if !(True)
    label addMove
  endif
 
  
  if var10 <= 0
    var15 *= 5
  endif
  var22 = LevelValue / 100
  var23 = Rnd
  if var23 < var22
    var23 = var22
  endif
  if var15 < 0
    LOGSTR 1313163008 1096042752 1447362560 0 0
    Return
  endif
  var15 *= var23
  var15 *= 0.01
  var15 *= var15
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
  GetCommitPredictChance var23
  PredictOMov var17 10
  var23 += var17
if Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18 || Equal var20 19
    var22 *= 0.75
  elif var23 < 0.16 && OFramesHitstun < var7
    var22 *= 5
  endif
Return
label getOEndlag
  var22 = 0.003
  XGoto GetChrSpecific
  //= XReciever
  if var21 < 16.7 
    STACK_PUSH var22 0
    var22 = OTopNY - TopNY
    STACK_PUSH var22 0
    var22 = TopNX - OTopNX
    Abs var22
    var22 *= -0.015
    if STACK_POP < 20
      var22 *= 3
    endif
    var22 += STACK_POP
  endif
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
      var22 *= 0.6
    else
      GetCommitPredictChance var23
      if var23 < 0.11
        var22 *= 0.5
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
label checkOInCombo
  var22 = 200
  XGoto GetChrSpecific
  //= XReciever
Return
Return
