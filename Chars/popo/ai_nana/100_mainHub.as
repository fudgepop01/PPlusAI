#include <Definition_AIMain.h>
id 0x8100
unk 0x0

$genPersonalityStrings()

// SetDebugMode 1
// label loop
// OXGoto CalcORecPos
// Seek loop
// LOGSTR_NL str("BACK")
// Return

SetAutoDefend 0
SetDisabledSwitch 1
SetDebugMode TEMP_DEBUG_TOGGLE

XGoto PerFrameChecks

LOGSTR str("NANA REC; AC/SA")
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

// DrawDebugRectOutline OCenterX OCenterY OWidth OHurtboxSize color(0xFF00FFDD)

// #let aimX = var0
// #let aimY = var1
// immediateTempVar = OTopNX - TopNX
// anotherTempVar = OWidth * 0.5
// Abs immediateTempVar
// if immediateTempVar > anotherTempVar
//   immediateTempVar = anotherTempVar
// endif
// aimX = OCenterX - OPos * immediateTempVar

// immediateTempVar = TopNY - OTopNY
// if immediateTempVar > OHurtboxSize
//   immediateTempVar = OHurtboxSize
// elif immediateTempVar < 0
//   immediateTempVar = 0
// endif
// aimY = OTopNY + immediateTempVar

// DrawDebugRectOutline aimX aimY 5 5 color(0x00FF00DD)

// Return


// SetDebugMode 1
// // var0 = 0
// label loop
// Seek loop
// LOGSTR str("============")
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
// LOGSTR str("fSShield")
// LOGVAL FramesSinceShield
// PRINTLN
// Return


// Return

// var0 += 0.5
// var1 = var0
// if ODistLE var0
//   DrawDebugCircle TopNX TopNY var1 color(0x00FF00DD)  
//   // DrawDebugRectOutline TopNX CenterY var1 10 color(0x00FF00DD)  
// else
//   DrawDebugCircle TopNX TopNY var1 color(0xFF0000DD)  
//   // DrawDebugRectOutline TopNX CenterY var1 10 color(0xFF0000DD)  
// endif
// DrawDebugRectOutline OCenterX OCenterY OWidth OHurtboxSize color(0xFF8800DD)  
// if var0 >= 200
//   var0 = 0
// endif
// Return

// SetDebugMode 1
// label thing
// Seek thing
// GetLaBasic globTempVar 91 1
// if globTempVar < 1
//   DrawDebugRectOutline OCenterX OCenterY OWidth OHurtboxSize color(0x888888DD)
// else
//   DrawDebugRectOutline OCenterX OCenterY OWidth OHurtboxSize color(0x88FF88DD)
// endif
// Return

// DrawDebugRectOutline OCenterX OCenterY OWidth OHurtboxSize color(0xFF00FFDD)
// Return

// XGoto PerFrameChecks
//= XReciever


// // SetDebugMode 1

// SetDisabledMd -1

// LOGSTR str("cg mainStart")
// LOGVAL currGoal
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
//   ADJUST_PERSONALITY idx_aggression -100 1
//   ADJUST_PERSONALITY idx_bait_dashAwayChance -100 1
//   ADJUST_PERSONALITY idx_bait_wdashAwayChance -100 1
//   ADJUST_PERSONALITY idx_baitChance -100 1
//   ADJUST_PERSONALITY idx_braveChance -100 1
//   ADJUST_PERSONALITY idx_circleCampChance -100 1
//   // ADJUST_PERSONALITY idx_djumpiness -100 1
//   // ADJUST_PERSONALITY idx_jumpiness -100 1
//   // ADJUST_PERSONALITY idx_platChance -100 1
//   // ADJUST_PERSONALITY idx_SDIChance  1
//   ADJUST_PERSONALITY idx_wall_chance -100 1
//   // ADJUST_PERSONALITY idx_reaction_time 100 1
  
//   ClearStick
//   if Equal TRAINING_MODE_OPTION TRAIN_ATTACK
//     ADJUST_PERSONALITY idx_aggression 100 1
//     ADJUST_PERSONALITY idx_braveChance 100 1
//     Seek initHitPredictValues
//   elif Equal TRAINING_MODE_OPTION TRAIN_RUN
//     ADJUST_PERSONALITY idx_circleCampChance 100 1
//     ADJUST_PERSONALITY idx_baitChance 100 1
//     Seek initHitPredictValues
//   elif Equal TRAINING_MODE_OPTION TRAIN_SHIELD
//     Button R
//   elif Equal TRAINING_MODE_OPTION TRAIN_CROUCH
//     AbsStick 0 -1
//   elif Equal TRAINING_MODE_OPTION TRAIN_WALK
//     if Equal CurrAction hex(0x7C) || Equal CurrAction hex(0x7D)
//       Stick -0.7
//     else
//       Stick 0.7
//     endif 
//   elif Equal TRAINING_MODE_OPTION TRAIN_JUMP
//     if Equal AirGroundState 1 && CurrAction <= hex(0xA)
//       Button X
//     endif
//   endif
//   Return
// endif

// label initHitPredictValues
// getCurrentPredictValue immediateTempVar man_OXHitDist
// if Equal immediateTempVar 0
//   trackOAction man_OXHitDist 20
//   trackOAction man_OXSwingDist 40
//   trackOAction man_OFramesPostHitstun 250
//   Seek initHitPredictValues
//   Jump
// endif

// label start

// DisableDebugOverlay
// if Equal currGoal cg_recover && Equal YDistFloor -1 || Equal CurrAction hex(0x10)
//   CallI RecoveryHub
// elif currGoal >= cg_edgeguard
//   lastAttack = -1
//   Seek navigateToGoal
//   Jump
// endif

// XGoto PerFrameChecks
// //= XReciever
// Seek start

// #let teamCloser = var3
// GetIsTeammateCloser teamCloser
// if Equal teamCloser 1
//   skipMainInit = -100
// endif

// if Equal skipMainInit mainInitSkip
//   skipMainInit = -100
//   GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
//   if Equal immediateTempVar 1
//     currGoal = cg_attack_reversal
//   endif
//   if !(Equal lastAttack -1)
//     XGoto SetAttackGoal
//     //= XReciever

//     IF_AERIAL_ATTACK(var0)
//     $ifLastOrigin(usmash,true)
//     $ifLastOrigin(uspecial,true)
//     elif Equal CurrSubaction JumpSquat
//       scriptVariant = sv_wavedash_in
//       Call Wavedash      
//     endif
//   endif
//   Seek initial
//   Jump
// elif Equal skipMainInit sm_execAttack
//   label empty_0
//   XGoto PerFrameChecks
//   //= XReciever
//   Seek empty_0

//   if Equal CurrAction hex(0x3) || Equal CurrAction hex(0x4)
//     $ifLastOrigin(dashattack, false)
//     elif True
//       if Equal currGoal cg_defend
//         scriptVariant = sv_wavedash_out
//       endif
//       scriptVariant = sv_wavedash_neutral
//       CallI Wavedash 
//     endif
//   endif
//   Goto isActionable
//   Seek empty_0
//   if Equal immediateTempVar 0
//     Return
//   endif
//   skipMainInit = -100

//   CallI ExecuteAttack
// elif Equal currGoal cg_attack_wall && CHANCE_MUL_LE PT_WALL_CHANCE 0.45 
//   if YDistFloor > 25
//     currGoal = cg_nothing
//     lastAttack = -1
//     Seek rollTactics
//     Jump
//   endif
//   label empty_1
//   XGoto PerFrameChecks
//   //= XReciever
//   Seek empty_1

//   Goto isActionable
//   if Equal immediateTempVar 0
//     Return
//   endif
//   label setupWallDelay
//   XGoto PerFrameChecks
//   //= XReciever

//   if Rnd < 0.1 && CHANCE_MUL_LE PT_WALL_CHANCE 1
//     XGoto CalcAttackGoal
//   elif Equal lastAttack -1 
//     XGoto CalcAttackGoal
//   endif
//   Seek setupWallDelay
  
//   #let timer = var0
//   globTempVar = OTopNX - TopNX 
//   immediateTempVar = OTopNY - TopNY
//   Norm timer globTempVar immediateTempVar
//   Abs timer
//   LOGSTR_NL str("TIMER")
//   LOGVAL_NL timer
//   if timer > 120
//     currGoal = cg_nothing
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
// elif Equal currGoal cg_camp_attack && CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 1.3 && CHANCE_MUL_LE PT_AGGRESSION 1
//   label empty_2
//   XGoto PerFrameChecks
//   //= XReciever
//   Seek empty_2

//   Goto isActionable
//   if Equal immediateTempVar 0
//     Return
//   endif
//   Seek initial
//   Jump
// elif Equal currGoal cg_bait_wait
//   Seek waitSetup
//   Jump
// endif

// label rollTactics

// XGoto PerFrameChecks
// //= XReciever

// scriptVariant = sv_none
// lastAttack = -1

// DynamicDiceClear dslot0
// anotherTempVar = TopNX - OTopNX
// Abs anotherTempVar
// immediateTempVar = PT_CIRCLECAMPCHANCE * anotherTempVar * 0.025
// DynamicDiceAdd dslot0 cg_bait_attack immediateTempVar
// immediateTempVar *= 3

// GetCommitPredictChance anotherTempVar
// anotherTempVar -= 0.25
// anotherTempVar *= -6 * immediateTempVar 
// DynamicDiceAdd dslot0 cg_circleCamp anotherTempVar
// // anotherTempVar *= 1.25 * PT_BAITCHANCE
// // DynamicDiceAdd dslot0 cg_bait_wait anotherTempVar

// // Functions = things that give a value
// // Requirements = stuff that go in an if condition
// // Commands = controls logic flow and interacts with game itself

// immediateTempVar = PT_BAITCHANCE
// DynamicDiceAdd dslot0 cg_bait immediateTempVar
// immediateTempVar += PT_AGGRESSION
// DynamicDiceAdd dslot0 cg_bait_attack immediateTempVar
// immediateTempVar = PT_BAIT_DASHAWAYCHANCE * 2
// DynamicDiceAdd dslot0 cg_bait_dashdance immediateTempVar

// if LevelValue >= LV8
//   immediateTempVar = 300 - GameTimer
//   if immediateTempVar > 0
//     immediateTempVar *= 0.1
//     DynamicDiceAdd dslot0 cg_bait_wait immediateTempVar
//     DynamicDiceAdd dslot0 cg_circleCamp immediateTempVar
//   endif
// endif
// anotherTempVar = LevelValue * 0.0075
// if Equal HitboxConnected 0 && CHANCE_MUL_LE PT_AGGRESSION 0.2
//   SeekNoCommit attack_roll
// elif CHANCE_MUL_LE PT_AGGRESSION anotherTempVar
//   SeekNoCommit attack_roll
// endif
// immediateTempVar = LevelValue * 0.0075
// anotherTempVar = 1 - immediateTempVar
// PredictOMov immediateTempVar mov_attack
// immediateTempVar *= anotherTempVar
// if immediateTempVar < 0.02 && CHANCE_MUL_LE PT_AGGRESSION 0.02
//   SeekNoCommit attack_roll
// elif Equal HitboxConnected 1
//   if !(True)
//     label attack_roll
//   endif
//   immediateTempVar = PT_BAIT_DASHAWAYCHANCE
//   DynamicDiceAdd dslot0 cg_bait_dashdance immediateTempVar
//   predictionConfidence immediateTempVar man_OBaitOption
//   if immediateTempVar > 0.4 || CHANCE_MUL_LE PT_AGGRESSION 0.35
//     DynamicDiceAdd dslot0 cg_attack 2
//   endif
//   immediateTempVar = PT_AGGRESSION * 4
//   DynamicDiceAdd dslot0 cg_attack immediateTempVar
//   GetCommitPredictChance immediateTempVar
//   if YDistFloor < 25
//     immediateTempVar *= 8 * PT_WALL_CHANCE
//     DynamicDiceAdd dslot0 cg_attack_wall immediateTempVar
//   endif
//   immediateTempVar = 5 - immediateTempVar
//   DynamicDiceAdd dslot0 cg_attack_reversal immediateTempVar
// endif

// DynamicDiceRoll dslot0 currGoal 0

// LOGSTR str("goal")
// LOGVAL currGoal
// PRINTLN

// GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
// if Equal teamCloser 1
//   currGoal = cg_circleCamp
// elif Equal HitboxConnected 1 || Equal PrevAction hex(0x3C)
//   currGoal = cg_attack_reversal
// elif Equal immediateTempVar 1
//   currGoal = cg_attack_reversal
// endif
// goalY = BBoundary
// if Equal currGoal -1
//   Call MainHub
// elif Equal currGoal cg_attack
//   goalY = BBoundary
// endif

// label initial
// XGoto PerFrameChecks
// //= XReciever
// Seek initial
// // if Equal goalX 0 && Equal goalY 0
// //   XGoto GoalChoiceHub
// //   //= XReciever
// //   Seek initial
// // endif
// Goto isActionable
// if Equal immediateTempVar 0
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

//   if Equal currGoal cg_attack_wall && LevelValue <= LV5
//     currGoal = cg_attack
//   endif

//   XGoto UpdateGoal
//   LOGSTR str("cg-post UpD")
//   LOGVAL currGoal

// PRINTLN

// Seek selectGoal
// if Equal currGoal cg_bait_wait && LevelValue >= LV5
//   label waitSetup
//   #let timer = var4
//   timer = Rnd * 55 + 5
//   label baitWait
//   LOGSTR_NL str("BAIT_WAIT")
//   STACK_PUSH timer st_function
//   XGoto PerFrameChecks
//   XGoto UpdateGoal
//   if Equal CurrAction hex(0x49)
//     XGoto AttackedHub
//   endif
//   timer = STACK_POP
//   timer -= 1
//   Seek baitWait
//   predictAverage immediateTempVar man_OXHitDist
//   immediateTempVar *= 0.5
//   if XDistLE immediateTempVar && Rnd <= 0.02
//     CallI DefendHub
//   endif
//   immediateTempVar *= 3
//   immediateTempVar += 20
//   if XDistLE immediateTempVar && CHANCE_MUL_LE PT_AGGRESSION 0.05
//     lastAttack = -1
//     currGoal = cg_attack_wall
//     Seek selectGoal
//     Jump
//   endif
//   if LevelValue >= LV8
//     Stick 0 -1
//   endif
//   if timer <= 0 || !(Equal currGoal cg_bait_wait)
//     currGoal = cg_nothing
//     skipMainInit = -100
//     Call MainHub
//   endif
//   Return
// elif Equal goalY BBoundary
//   Return
// elif Equal currGoal cg_attack && Equal lastAttack -1
//   Return
// endif
// if !(True)
//   label navigateToGoal
// endif
// Seek selectGoal
// {NAVIGATION_OVERRIDE}
// if Equal scriptVariant sv_noNavigation
//   scriptVariant = 0
//   Return
// endif
// XGoto PerFrameChecks
// Goto isActionable
// Seek selectGoal
// if Equal immediateTempVar 0
//   Return
// endif

// XGoto MoveToGoal
// Seek selectGoal
// Return
// label isActionable
// {ISACTIONABLE_OVERRIDE}
// immediateTempVar = 0

// if Equal CanCancelAttack 1
// elif Equal HitboxConnected 1 && HasCurry
// elif CurrAction >= hex(0x67) && CurrAction <= hex(0x6D)
// elif Equal CurrAction hex(0x16) 
//   if Equal PrevAction hex(0x21)
//     Return
//   elif AnimFrame <= 3
//     Return
//   endif
// elif CurrAction >= hex(0x18) && !(Equal CurrAction hex(0x49)) && !(Equal CurrAction hex(0x67)) && !(Equal CurrAction hex(0x6C))
//   Return
// endif

// immediateTempVar = 1
Return
Return