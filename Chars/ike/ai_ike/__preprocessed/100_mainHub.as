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



// SetAutoDefend 0
// SetDisabledSwitch 1
// SetDebugMode TEMP_DEBUG_TOGGLE
// label loop
// Seek loop
// XGoto PerFrameChecks
// if XDistFrontEdge > 5
//   Stick 1
// elif Equal CurrAction hex(0x7C) || Equal CurrAction hex(0x7D)
//   Stick -1
// else
//   Taunt utaunt
// endif
// Return

// Call Shield
// SetDebugMode 1
// label loop
// Seek loop
// CalcYChange anotherTempVar 10 OYSpeed OGravity OMaxFallSpeed OFastFallSpeed 0
// CalcYChange immediateTempVar 10 OYSpeed OGravity OMaxFallSpeed OFastFallSpeed 1
// LOGSTR str("no ff; ff")
// LOGVAL anotherTempVar
// LOGVAL immediateTempVar
// PRINTLN
// Return

// SetDebugMode 1
// var0 = 0
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
//   DrawDebugRectOutline TopNX CenterY var1 10 color(0x00FF00DD)  
// else
//   DrawDebugCircle TopNX TopNY var1 color(0xFF0000DD)  
//   DrawDebugRectOutline TopNX CenterY var1 10 color(0xFF0000DD)  
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

SetAutoDefend 0
SetDisabledSwitch 1
SetDebugMode TEMP_DEBUG_TOGGLE
// SetDebugMode 1

SetDisabledMd -1

if Equal var21 -1
  var21 = 0
endif

LOGSTR 1667702784 1835100416 1850962944 1634890752 0
LOGVAL var21
LOGVAL var15
PRINTLN

// label marthThing
//   XGoto PerFrameChecks
//   $setLastAttack(fsmash)
//   XGoto SetAttackGoal
//   XGoto CheckAttackWillHit
//   Seek marthThing
//   AbsStick 0 -1
//   Return
  

if TRAINING_MODE_OPTION >= 0
  XGoto PerFrameChecks
  ADJUST_PERSONALITY 0 -100 1
  ADJUST_PERSONALITY 1 -100 1
  ADJUST_PERSONALITY 2 -100 1
  ADJUST_PERSONALITY 3 -100 1
  ADJUST_PERSONALITY 4 -100 1
  ADJUST_PERSONALITY 5 -100 1
  // ADJUST_PERSONALITY idx_djumpiness -100 1
  // ADJUST_PERSONALITY idx_jumpiness -100 1
  // ADJUST_PERSONALITY idx_platChance -100 1
  // ADJUST_PERSONALITY idx_SDIChance  1
  ADJUST_PERSONALITY 11 -100 1
  // ADJUST_PERSONALITY idx_reaction_time 100 1
  
  ClearStick
  if Equal TRAINING_MODE_OPTION 1
    ADJUST_PERSONALITY 0 100 1
    ADJUST_PERSONALITY 4 100 1
    Seek initHitPredictValues
  elif Equal TRAINING_MODE_OPTION 5
    ADJUST_PERSONALITY 5 100 1
    ADJUST_PERSONALITY 3 100 1
    Seek initHitPredictValues
  elif Equal TRAINING_MODE_OPTION 6
    Button R
  elif Equal TRAINING_MODE_OPTION 7
    AbsStick 0 -1
  elif Equal TRAINING_MODE_OPTION 4
    if Equal CurrAction 124 || Equal CurrAction 125
      Stick -0.7
    else
      Stick 0.7
    endif 
  elif Equal TRAINING_MODE_OPTION 0
    if Equal AirGroundState 1 && CurrAction <= 10
      Button X
    endif
  endif
  Return
endif

label initHitPredictValues
getCurrentPredictValue var22 10
if Equal var22 0
  trackOAction 10 20
  trackOAction 11 40
  trackOAction 4 250
  Seek initHitPredictValues
  Jump
endif

label start

if {Equal var21 3 && Equal YDistFloor -1} || Equal CurrAction 16
  CallI RecoveryHub
elif var21 >= 16.7
  var20 = -1
  Seek navigateToGoal
  Jump
endif

XGoto PerFrameChecks
//= XReciever
Seek start

GetIsTeammateCloser var3
if Equal var3 1
  var15 = -100
endif

if Equal var15 -10
  var15 = -100
  var22 = 200
  XGoto GetChrSpecific
  //= XReciever
  if Equal var22 1
    var21 = 16.4
  endif
  if !(Equal var20 -1)
    XGoto SetAttackGoal
    //= XReciever

  STACK_PUSH var22 0
  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var0 = var22
  var22 = STACK_POP
  if Equal var0 1
elif Equal var20 6
elif !(True)
    elif Equal CurrSubaction JumpSquat
      var16 = 1
      Call Wavedash      
    endif
  endif
  Seek initial
  Jump
elif Equal var15 -20
  label empty_0
  XGoto PerFrameChecks
  //= XReciever
  Seek empty_0

  if Equal CurrAction 3 || Equal CurrAction 4
if Equal var20 1
    elif True
      if Equal var21 13
        var16 = 2
      endif
      var16 = 3
      CallI Wavedash 
    endif
  endif
  Goto isActionable
  Seek empty_0
  if Equal var22 0
    Return
  endif
  var15 = -100

  CallI ExecuteAttack
elif Equal var21 16.3 && CHANCE_MUL_LE PT_WALL_CHANCE 0.45 
  if YDistFloor > 25
    var21 = 0
    var20 = -1
    Seek rollTactics
    Jump
  endif
  label empty_1
  XGoto PerFrameChecks
  //= XReciever
  Seek empty_1

  Goto isActionable
  if Equal var22 0
    Return
  endif
  label setupWallDelay
  XGoto PerFrameChecks
  //= XReciever

  if Rnd < 0.1 && CHANCE_MUL_LE PT_WALL_CHANCE 1
    XGoto CalcAttackGoal
  elif Equal var20 -1 
    XGoto CalcAttackGoal
  endif
  Seek setupWallDelay
  
  var17 = OTopNX - TopNX 
  var22 = OTopNY - TopNY
  Norm var0 var17 var22
  Abs var0
  LOGSTR_NL 1414089984 1163001856 0 0 0
  LOGVAL_NL var0
  if var0 > 120
    var21 = 0
    Call MainHub
    Return
  endif
  var0 *= 0.4 * Rnd
  label wallDelay
  XGoto PerFrameChecks 
  //= XReciever
  Seek wallDelay
  if var0 <= 0
    CallI ExecuteAttack
  endif
  var0 -= 1
  Return
elif Equal var21 7.1 && CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 1.3 && CHANCE_MUL_LE PT_AGGRESSION 1
  label empty_2
  XGoto PerFrameChecks
  //= XReciever
  Seek empty_2

  Goto isActionable
  if Equal var22 0
    Return
  endif
  Seek initial
  Jump
elif Equal var21 10.4
  Seek waitSetup
  Jump
endif
DisableDebugOverlay

label rollTactics

XGoto PerFrameChecks
//= XReciever

var16 = 0
var20 = -1

DynamicDiceClear 0
var23 = TopNX - OTopNX
Abs var23
var22 = PT_CIRCLECAMPCHANCE * var23 * 0.025
DynamicDiceAdd 0 10.1 var22
var22 *= 3

GetCommitPredictChance var23
var23 -= 0.25
var23 *= -6 * var22 
DynamicDiceAdd 0 7 var23
// anotherTempVar *= 1.25 * PT_BAITCHANCE
// DynamicDiceAdd dslot0 cg_bait_wait anotherTempVar

// Functions = things that give a value
// Requirements = stuff that go in an if condition
// Commands = controls logic flow and interacts with game itself

var22 = PT_BAITCHANCE
DynamicDiceAdd 0 10 var22
var22 += PT_AGGRESSION
DynamicDiceAdd 0 10.1 var22
var22 = PT_BAIT_DASHAWAYCHANCE * 2
DynamicDiceAdd 0 10.5 var22

if LevelValue >= 75
  var22 = 300 - GameTimer
  if var22 > 0
    var22 *= 0.1
    DynamicDiceAdd 0 10.4 var22
    DynamicDiceAdd 0 7 var22
  endif
endif
var23 = LevelValue * 0.0075
if {Equal HitboxConnected 0 && CHANCE_MUL_LE PT_AGGRESSION 0.2} || CHANCE_MUL_LE PT_AGGRESSION var23
  SeekNoCommit attack_roll
endif
var22 = LevelValue * 0.0075
var23 = 1 - var22
PredictOMov var22 14
var22 *= var23
if var22 < 0.02 && CHANCE_MUL_LE PT_AGGRESSION 0.02
  SeekNoCommit attack_roll
elif Equal HitboxConnected 1
  if !(True)
    label attack_roll
  endif
  var22 = PT_BAIT_DASHAWAYCHANCE
  DynamicDiceAdd 0 10.5 var22
  predictionConfidence var22 9
  if var22 > 0.4 || CHANCE_MUL_LE PT_AGGRESSION 0.35
    DynamicDiceAdd 0 16 2
  endif
  var22 = PT_AGGRESSION * 4
  DynamicDiceAdd 0 16 var22
  GetCommitPredictChance var22
  if YDistFloor < 25
    var22 *= 8 * PT_WALL_CHANCE
    DynamicDiceAdd 0 16.3 var22
  endif
  var22 = 5 - var22
  DynamicDiceAdd 0 16.4 var22

endif

DynamicDiceRoll 0 var21 0

LOGSTR 1735352576 1811939328 0 0 0
LOGVAL var21
PRINTLN

  var22 = 200
  XGoto GetChrSpecific
  //= XReciever
if Equal var3 1
  var21 = 7
elif {Equal HitboxConnected 1 || Equal PrevAction 60} || Equal var22 1
  var21 = 16.4
endif
var14 = BBoundary
if Equal var21 -1
  Call MainHub
elif Equal var21 16
  var14 = BBoundary
endif

label initial
XGoto PerFrameChecks
//= XReciever
Seek initial
// if Equal goalX 0 && Equal goalY 0
//   XGoto GoalChoiceHub
//   //= XReciever
//   Seek initial
// endif
Goto isActionable
if Equal var22 0
  Seek initial
  Return
endif

var0 = LevelValue * 0.01
if var0 <= 0.025
  var0 = 0.025
endif
label tskillWait
XGoto PerFrameChecks
Seek tskillWait
if Rnd < var0
  Seek selectGoal
  Jump
endif
Return
label selectGoal
XReciever
XGoto PerFrameChecks
Cmd30

  if Equal var21 16.3 && LevelValue <= 42
    var21 = 16
  endif

  XGoto UpdateGoal
  LOGSTR 1667706112 1886352128 1948275968 1883504640 0
  LOGVAL var21

PRINTLN

Seek selectGoal
if Equal var21 10.4 && LevelValue >= 42
  if CurrAction >= 3 && CurrAction <= 10
    var16 = 3
    CallI Wavedash
  endif
  label waitSetup
  var4 = Rnd * 55 + 5
  // LOGSTR_NL str("BAIT_WAIT")
  label baitWait
  // LOGSTR str("WAITING; T:")
  // LOGVAL timer
  // PRINTLN
  STACK_PUSH var4 0
  XGoto PerFrameChecks
  XGoto UpdateGoal
  if Equal CurrAction 73
    XGoto AttackedHub
  endif
  var4 = STACK_POP
  var4 -= 1
  // LOGSTR str("T:")
  // LOGVAL timer
  // PRINTLN
  Seek baitWait
  predictAverage var22 10
  var22 *= 0.4
  if XDistLE var22 && Rnd <= 0.02
    CallI DefendHub
  endif
  var22 *= 3
  var22 += 20
  if XDistLE var22 && CHANCE_MUL_LE PT_AGGRESSION 0.05
    var20 = -1
    var21 = 16.3
    Seek selectGoal
    Jump
  endif
  if LevelValue >= 75
    Stick 0 -0.7
  endif
  if var4 <= 0 || !(Equal var21 10.4)
    // LOGVAL 10003
    // LOGSTR str("time; goal")
    // LOGVAL timer
    // LOGVAL currGoal
    // PRINTLN
    var21 = 0
    var15 = -100
    Call MainHub
  endif
  Return
elif Equal var14 BBoundary
  Return
endif
if !(True)
  label navigateToGoal
endif
Seek selectGoal
// {NAVIGATION_OVERRIDE}
if Equal var16 -99
  var16 = 0
  Return
endif
XGoto PerFrameChecks
Goto isActionable
Seek selectGoal
if Equal var22 0
  Return
endif

XGoto MoveToGoal
Seek selectGoal
Return
label isActionable
// {ISACTIONABLE_OVERRIDE}
var22 = 0

if Equal CanCancelAttack 1 || {HasCurry && Equal HitboxConnected 1} || {CurrAction >= 103 && CurrAction <= 109}
elif Equal CurrAction 22 
  if Equal PrevAction 33
    Return
  elif AnimFrame <= 3
    Return
  endif
elif CurrAction >= 24 && !(Equal CurrAction 73) && !(Equal CurrAction 103) && !(Equal CurrAction 108)
  Return
endif

var22 = 1
Return
Return
