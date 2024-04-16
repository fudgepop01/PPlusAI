#include <Definition_AIMain.h>
id 0x8100
unk 0x0

str "PERSONALITY"
str "1"
str "1"
str "1"
str "1"
str "1"
str "1"
str "0.2"
str "0.4"
str "0.3"
str "1"
str "0.5"
str "0.35"

// SetDebugMode 1
// label loop
// OXGoto CalcORecPos
// Seek loop
// LOGSTR_NL 1111573248 1258291200 0 0 0
// Return

SetAutoDefend 0
SetDisabledSwitch 1
SetDebugMode TEMP_DEBUG_TOGGLE
LOGSTR_NL 1312902656 1092635904 1095323136 1213547008 0

XGoto PerFrameChecks

LOGSTR 1312902656 1092637184 1162033920 541147904 793985280
LOGVAL CurrAction
LOGVAL CurrSubaction
PRINTLN
if YDistFloor < 0
  Call RecoveryHub
endif
SetAIMD 0x79 0

// SetDebugMode 1
// // var0 = 0
// label loop
// Seek loop

// DrawDebugRectOutline OCenterX OCenterY OWidth OHurtboxSize 255 0 255 221

// #let aimX = var0
// #let aimY = var1
// var22 = OTopNX - TopNX
// var23 = OWidth * 0.5
// Abs var22
// if var22 > var23
//   var22 = var23
// endif
// aimX = OCenterX - OPos * var22

// var22 = TopNY - OTopNY
// if var22 > OHurtboxSize
//   var22 = OHurtboxSize
// elif var22 < 0
//   var22 = 0
// endif
// aimY = OTopNY + var22

// DrawDebugRectOutline aimX aimY 5 5 0 255 0 221

// Return


// SetDebugMode 1
// // var0 = 0
// label loop
// Seek loop
// LOGSTR 1027423488 1027423488 1027423488 1027423488 0
// LOGVAL GameTimer
// PRINTLN
// LOGVAL_NL GetJumpLength
// LOGVAL_NL GetJumpHeight

// LOGVAL_NL OCharXSpeed
// LOGVAL_NL OCharYSpeed
// LOGVAL_NL OTotalXSpeed
// LOGVAL_NL OTotalYSpeed
// LOGVAL_NL OXSpeed
// LOGVAL_NL OYSpeed
// Return

// SetDebugMode 1
// label loop
// Seek loop
// if Rnd < 0.01
//   Button R
// endif
// LOGSTR 1716736768 1751737600 1818492928 0 0
// LOGVAL FramesSinceShield
// PRINTLN
// Return


// Return

// var0 += 0.5
// var1 = var0
// if ODistLE var0
//   DrawDebugCircle TopNX TopNY var1 0 255 0 221  
//   // DrawDebugRectOutline TopNX CenterY var1 10 0 255 0 221  
// else
//   DrawDebugCircle TopNX TopNY var1 255 0 0 221  
//   // DrawDebugRectOutline TopNX CenterY var1 10 255 0 0 221  
// endif
// DrawDebugRectOutline OCenterX OCenterY OWidth OHurtboxSize 255 136 0 221  
// if var0 >= 200
//   var0 = 0
// endif
// Return

// SetDebugMode 1
// label thing
// Seek thing
// GetLaBasic var17 91 1
// if var17 < 1
//   DrawDebugRectOutline OCenterX OCenterY OWidth OHurtboxSize 136 136 136 221
// else
//   DrawDebugRectOutline OCenterX OCenterY OWidth OHurtboxSize 136 255 136 221
// endif
// Return

// DrawDebugRectOutline OCenterX OCenterY OWidth OHurtboxSize 255 0 255 221
// Return

// XGoto PerFrameChecks
//= XReciever


// // SetDebugMode 1

// SetDisabledMd -1

// LOGSTR 1667702784 1835100416 1850962944 1634890752 0
// LOGVAL var21
// PRINTLN

// // label marthThing
// //   XGoto PerFrameChecks
// //   $setLastAttack(fsmash)
// //   XGoto SetAttackGoal
// //   XGoto CheckAttackWillHit
// //   Seek marthThing
// //   AbsStick 0 -1
// //   Return
  

// if TRAINING_MODE_OPTION >= 0
//   XGoto PerFrameChecks
//   ADJUST_PERSONALITY 0 -100 1
//   ADJUST_PERSONALITY 1 -100 1
//   ADJUST_PERSONALITY 2 -100 1
//   ADJUST_PERSONALITY 3 -100 1
//   ADJUST_PERSONALITY 4 -100 1
//   ADJUST_PERSONALITY 5 -100 1
//   // ADJUST_PERSONALITY 6 -100 1
//   // ADJUST_PERSONALITY 7 -100 1
//   // ADJUST_PERSONALITY 8 -100 1
//   // ADJUST_PERSONALITY 10  1
//   ADJUST_PERSONALITY 11 -100 1
//   // ADJUST_PERSONALITY 9 100 1
  
//   ClearStick
//   if Equal TRAINING_MODE_OPTION 1
//     ADJUST_PERSONALITY 0 100 1
//     ADJUST_PERSONALITY 4 100 1
//     Seek initHitPredictValues
//   elif Equal TRAINING_MODE_OPTION 5
//     ADJUST_PERSONALITY 5 100 1
//     ADJUST_PERSONALITY 3 100 1
//     Seek initHitPredictValues
//   elif Equal TRAINING_MODE_OPTION 6
//     Button R
//   elif Equal TRAINING_MODE_OPTION 7
//     AbsStick 0 -1
//   elif Equal TRAINING_MODE_OPTION 4
//     if Equal CurrAction 124 || Equal CurrAction 125
//       Stick -0.7
//     else
//       Stick 0.7
//     endif 
//   elif Equal TRAINING_MODE_OPTION 0
//     if Equal AirGroundState 1 && CurrAction <= 10
//       Button X
//     endif
//   endif
//   Return
// endif

// label initHitPredictValues
// getCurrentPredictValue var22 10
// if Equal var22 0
//   trackOAction 10 20
//   trackOAction 11 40
//   trackOAction 4 250
//   Seek initHitPredictValues
//   Jump
// endif

// label start

// DisableDebugOverlay
// if Equal var21 3 && Equal YDistFloor -1 || Equal CurrAction 16
//   CallI RecoveryHub
// elif var21 >= 16.7
//   var20 = -1
//   Seek navigateToGoal
//   Jump
// endif

// XGoto PerFrameChecks
// //= XReciever
// Seek start

// #let teamCloser = var3
// GetIsTeammateCloser teamCloser
// if Equal teamCloser 1
//   var15 = -100
// endif

// if Equal var15 -10
//   var15 = -100
//   GET_CHAR_TRAIT(var22, 200)
//   if Equal var22 1
//     var21 = 16.4
//   endif
//   if !(Equal var20 -1)
//     XGoto SetAttackGoal
//     //= XReciever

//     IF_AERIAL_ATTACK(var0)
//     $ifLastOrigin(usmash,1)
//     $ifLastOrigin(uspecial,1)
//     elif Equal CurrSubaction JumpSquat
//       var16 = 1
//       Call Wavedash      
//     endif
//   endif
//   Seek initial
//   Jump
// elif Equal var15 -20
//   label empty_0
//   XGoto PerFrameChecks
//   //= XReciever
//   Seek empty_0

//   if Equal CurrAction 3 || Equal CurrAction 4
//     $ifLastOrigin(dashattack, 0)
//     elif True
//       if Equal var21 13
//         var16 = 2
//       endif
//       var16 = 3
//       CallI Wavedash 
//     endif
//   endif
//   Goto isActionable
//   Seek empty_0
//   if Equal var22 0
//     Return
//   endif
//   var15 = -100

//   CallI ExecuteAttack
// elif Equal var21 16.3 && CHANCE_MUL_LE PT_WALL_CHANCE 0.45 
//   if YDistFloor > 25
//     var21 = 0
//     var20 = -1
//     Seek rollTactics
//     Jump
//   endif
//   label empty_1
//   XGoto PerFrameChecks
//   //= XReciever
//   Seek empty_1

//   Goto isActionable
//   if Equal var22 0
//     Return
//   endif
//   label setupWallDelay
//   XGoto PerFrameChecks
//   //= XReciever

//   if Rnd < 0.1 && CHANCE_MUL_LE PT_WALL_CHANCE 1
//     XGoto CalcAttackGoal
//   elif Equal var20 -1 
//     XGoto CalcAttackGoal
//   endif
//   Seek setupWallDelay
  
//   #let timer = var0
//   var17 = OTopNX - TopNX 
//   var22 = OTopNY - TopNY
//   Norm timer var17 var22
//   Abs timer
//   LOGSTR_NL 1414089984 1163001856 0 0 0
//   LOGVAL_NL timer
//   if timer > 120
//     var21 = 0
//     Call MainHub
//     Return
//   endif
//   timer *= 0.4 * Rnd
//   label wallDelay
//   XGoto PerFrameChecks 
//   //= XReciever
//   Seek wallDelay
//   if timer <= 0
//     CallI ExecuteAttack
//   endif
//   timer -= 1
//   Return
// elif Equal var21 7.1 && CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 1.3 && CHANCE_MUL_LE PT_AGGRESSION 1
//   label empty_2
//   XGoto PerFrameChecks
//   //= XReciever
//   Seek empty_2

//   Goto isActionable
//   if Equal var22 0
//     Return
//   endif
//   Seek initial
//   Jump
// elif Equal var21 10.4
//   Seek waitSetup
//   Jump
// endif

// label rollTactics

// XGoto PerFrameChecks
// //= XReciever

// var16 = 0
// var20 = -1

// DynamicDiceClear 0
// var23 = TopNX - OTopNX
// Abs var23
// var22 = PT_CIRCLECAMPCHANCE * var23 * 0.025
// DynamicDiceAdd 0 10.1 var22
// var22 *= 3

// GetCommitPredictChance var23
// var23 -= 0.25
// var23 *= -6 * var22 
// DynamicDiceAdd 0 7 var23
// // var23 *= 1.25 * PT_BAITCHANCE
// // DynamicDiceAdd 0 10.4 var23

// // Functions = things that give a value
// // Requirements = stuff that go in an if condition
// // Commands = controls logic flow and interacts with game itself

// var22 = PT_BAITCHANCE
// DynamicDiceAdd 0 10 var22
// var22 += PT_AGGRESSION
// DynamicDiceAdd 0 10.1 var22
// var22 = PT_BAIT_DASHAWAYCHANCE * 2
// DynamicDiceAdd 0 10.5 var22

// if LevelValue >= 75
//   var22 = 300 - GameTimer
//   if var22 > 0
//     var22 *= 0.1
//     DynamicDiceAdd 0 10.4 var22
//     DynamicDiceAdd 0 7 var22
//   endif
// endif
// var23 = LevelValue * 0.0075
// if Equal HitboxConnected 0 && CHANCE_MUL_LE PT_AGGRESSION 0.2
//   SeekNoCommit attack_roll
// elif CHANCE_MUL_LE PT_AGGRESSION var23
//   SeekNoCommit attack_roll
// endif
// var22 = LevelValue * 0.0075
// var23 = 1 - var22
// PredictOMov var22 14
// var22 *= var23
// if var22 < 0.02 && CHANCE_MUL_LE PT_AGGRESSION 0.02
//   SeekNoCommit attack_roll
// elif Equal HitboxConnected 1
//   if !(True)
//     label attack_roll
//   endif
//   var22 = PT_BAIT_DASHAWAYCHANCE
//   DynamicDiceAdd 0 10.5 var22
//   predictionConfidence var22 9
//   if var22 > 0.4 || CHANCE_MUL_LE PT_AGGRESSION 0.35
//     DynamicDiceAdd 0 16 2
//   endif
//   var22 = PT_AGGRESSION * 4
//   DynamicDiceAdd 0 16 var22
//   GetCommitPredictChance var22
//   if YDistFloor < 25
//     var22 *= 8 * PT_WALL_CHANCE
//     DynamicDiceAdd 0 16.3 var22
//   endif
//   var22 = 5 - var22
//   DynamicDiceAdd 0 16.4 var22
// endif

// DynamicDiceRoll 0 var21 0

// LOGSTR 1735352576 1811939328 0 0 0
// LOGVAL var21
// PRINTLN

// GET_CHAR_TRAIT(var22, 200)
// if Equal teamCloser 1
//   var21 = 7
// elif Equal HitboxConnected 1 || Equal PrevAction 60
//   var21 = 16.4
// elif Equal var22 1
//   var21 = 16.4
// endif
// var14 = BBoundary
// if Equal var21 -1
//   Call MainHub
// elif Equal var21 16
//   var14 = BBoundary
// endif

// label initial
// XGoto PerFrameChecks
// //= XReciever
// Seek initial
// // if Equal var13 0 && Equal var14 0
// //   XGoto GoalChoiceHub
// //   //= XReciever
// //   Seek initial
// // endif
// Goto isActionable
// if Equal var22 0
//   Seek initial
//   Return
// endif

// #let techSkill = var0
// techSkill = LevelValue * 0.01
// if techSkill <= 0.1
//   techSkill = 0.1
// endif
// label tskillWait
// XGoto PerFrameChecks
// Seek tskillWait
// if Rnd < techSkill
//   Seek selectGoal
//   Jump
// endif
// Return
// label selectGoal
// XGoto PerFrameChecks
// Cmd30

//   if Equal var21 16.3 && LevelValue <= 42
//     var21 = 16
//   endif

//   XGoto UpdateGoal
//   LOGSTR 1667706112 1886352128 1948275968 1883504640 0
//   LOGVAL var21

// PRINTLN

// Seek selectGoal
// if Equal var21 10.4 && LevelValue >= 42
//   label waitSetup
//   #let timer = var4
//   timer = Rnd * 55 + 5
//   label baitWait
//   LOGSTR_NL 1111574784 1415534336 1095324672 0 0
//   STACK_PUSH timer 0
//   XGoto PerFrameChecks
//   XGoto UpdateGoal
//   if Equal CurrAction 73
//     XGoto AttackedHub
//   endif
//   timer = STACK_POP
//   timer -= 1
//   Seek baitWait
//   predictAverage var22 10
//   var22 *= 0.5
//   if XDistLE var22 && Rnd <= 0.02
//     CallI DefendHub
//   endif
//   var22 *= 3
//   var22 += 20
//   if XDistLE var22 && CHANCE_MUL_LE PT_AGGRESSION 0.05
//     var20 = -1
//     var21 = 16.3
//     Seek selectGoal
//     Jump
//   endif
//   if LevelValue >= 75
//     Stick 0 -1
//   endif
//   if timer <= 0 || !(Equal var21 10.4)
//     var21 = 0
//     var15 = -100
//     Call MainHub
//   endif
//   Return
// elif Equal var14 BBoundary
//   Return
// elif Equal var21 16 && Equal var20 -1
//   Return
// endif
// if !(True)
//   label navigateToGoal
// endif
// Seek selectGoal
// {NAVIGATION_OVERRIDE}
// if Equal var16 -99
//   var16 = 0
//   Return
// endif
// XGoto PerFrameChecks
// Goto isActionable
// Seek selectGoal
// if Equal var22 0
//   Return
// endif

// XGoto MoveToGoal
// Seek selectGoal
// Return
// label isActionable
// {ISACTIONABLE_OVERRIDE}
// var22 = 0

// if Equal CanCancelAttack 1
// elif Equal HitboxConnected 1 && HasCurry
// elif CurrAction >= 103 && CurrAction <= 109
// elif Equal CurrAction 22 
//   if Equal PrevAction 33
//     Return
//   elif AnimFrame <= 3
//     Return
//   endif
// elif CurrAction >= 24 && !(Equal CurrAction 73) && !(Equal CurrAction 103) && !(Equal CurrAction 108)
//   Return
// endif

// var22 = 1
Return
Return
