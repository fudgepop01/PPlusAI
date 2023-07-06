#include <Definition_AIMain.h>
id 0x8102
unk 0x0

//= XReciever
EnableDebugOverlay 
SetDebugOverlayColor 221 221 0 136
if !(Equal var21 16.41)
  var21 = 13
endif
label begin
XGoto PerFrameChecks
//= XReciever

var0 = PT_AGGRESSION

var1 = 0.65

// var22 = var0 * 0.08
// var17 *= 1.75
// if !(CalledFrom AttackedHub)
//   GetCommitPredictChance var23"C:\Users\dareb\Documents\AIScriptCLA\bin\Debug\netcoreapp3.1\win-x86\publish\AIScriptCLA.exe" --compile --path "c:/Users/dareb/OneDrive/Desktop/Brawlmods/PPlusAi/Chars/common/ai_common/__preprocessed" --out "C:/Users/dareb/OneDrive/Desktop/Brawlmods/PPlusAi/Chars/common/out/Fighter.pac" --include "c:/Users/dareb/OneDrive/Desktop/Brawlmods/PPlusAi/Include"
//   if var23 > 0.45 && Rnd < var23 && CHANCE_MUL_LE var22 1
//     var16 = 1
//     XGoto CalcAttackGoal
//     //= XReciever
//     var15 = -1
//     CallI MainHub
//   endif
// endif

if Equal AirGroundState 1
  // LOGSTR_NL 1095193344 540098304 1056964608 0 0

  predictOOption var22 7
  predictionConfidence var17 7
  var17 *= 3.5
  if CHANCE_MUL_GE PT_AGGRESSION 0.15 && Rnd < var17 && Equal var22 1
    PredictOMov var22 15
    var22 *= 2.5
    if var22 < 0.25 || Equal OAirGroundState 2
      CallI Shield
    endif
  endif

  var22 = 10 * PT_AGGRESSION
  if CHANCE_MUL_LE PT_AGGRESSION 0.35 && Damage < var22 && CurrAction <= 32
    var21 = 13.1
    CallI Shield
  endif

  predictAverage var2 10

  var22 = TopNX
  var17 = OTopNX
  Abs var22
  Abs var17
  if var22 > var17 && Rnd < 0.2
    if Rnd < 0.3
      var16 = 1
      CallI Roll
    endif
    GetAttribute var22 40; 0
    var22 *= 8
    if Rnd < 0.1 && var22 > var2
      var16 = 5
      CallI DashScr
    endif
  elif var22 < var17 && Rnd < 0.2
    if Rnd < 0.3
      var16 = 2
      CallI Roll
    endif
    var16 = 2
    CallI DashScr
  elif Rnd < 0.05 && NumJumps > 0
    var3 = PT_DJUMPINESS
    if Rnd < 0.05
      var16 = 1
      CallI Roll
    elif Rnd < 0.4 && Rnd < var3
      var16 = 1.1
      CallI JumpScr
    endif
    GetAttribute var22 40; 0
    var22 *= 8
    if Rnd < 0.2 && var22 > var2
      var16 = 5
      CallI DashScr
    endif
  endif

  var22 = var0 * 0.08
  if Rnd < 0.5
    var21 = 10
  else
    var21 = 10.5
  endif
  var15 = -1
  if Rnd < var22 && Rnd < var22
    var21 = 16.4
    var15 = -1
  endif

  var23 = var2 + 15

  var3 = PT_BAIT_DASHAWAYCHANCE

  GetAttribute var22 40; 0

  if Equal IsOnPassableGround 1 && Rnd <= 0.20 && LevelValue >= 60
    CallI Shield
  elif var22 > 0.7 && CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.4 && LevelValue >= 42 && Rnd < 0.85 && ODistLE var23 && CHANCE_MUL_LE PT_AGGRESSION 1.5
    var16 = 3
    CallI DashScr
  endif

  var0 = PT_BAIT_WDASHAWAYCHANCE
  var0 *= 0.3

  GetAttribute var22 940; 0
  var22 *= 0.1
  var22 = 0.7 - var22
  if Rnd < var22 && Rnd < var0
    var16 = 2
    CallI Wavedash
  endif

  var0 = PT_BAIT_DASHAWAYCHANCE
  var0 *= 0.35

  GetAttribute var22 40; 0
  var22 *= 5
  var17 = OTopNX - TopNX
  Abs var17
  var22 += var17

  if var2 < var22 && Rnd < var0 && Rnd < 0.6
    var16 = 2
    CallI DashScr
  endif
endif

if Equal var21 16.41
  var22 = TopNY - OTopNY
  if CHANCE_MUL_LE PT_AGGRESSION 0.10 && var22 < 20
    XGoto CalcAttackGoal
    //= XReciever
    var15 = -1
    CallI MainHub
  endif
endif 

// maybe make driftAway based on air mobility?
predictAverage var0 10
var0 += 20
PredictOMov var22 14
var23 = TopNY - OTopNY
// LOGSTR_NL 1329681408 0 0 0 0
// LOGVAL_NL var0
if ODistLE var0 || var23 > 45
  if Equal var21 16.41 && OTopNY < TopNY && CHANCE_MUL_LE var22 8
    // LOGSTR_NL 1635213568 2035771648 1952991744 1970106368 0
    var16 = 3
    var15 = -1
    CallI AerialDrift
  elif CHANCE_MUL_LE var22 4
    if NumJumps > 0 && CHANCE_MUL_LE PT_BRAVECHANCE 0.1
      var16 = 1.1
      CallI JumpScr
    elif NumJumps > 0 && Rnd < 0.1
      var16 = 3.1
      CallI JumpScr
    elif Rnd < 0.75 && YDistFloor > 10
      // LOGSTR_NL 1635213568 2030043136 0 0 0
      var16 = 2
      CallI AerialDrift
    endif
  endif
endif

PredictOMov var22 15
var22 *= 2
if var22 < 0.30 && Rnd > var22 && Equal AirGroundState 1
  CallI Shield
endif
var21 = 16.4
if !(Equal var20 -1)
  var15 = -1
  CallI MainHub
else
  XGoto CalcAttackGoal
  //= XReciever
  var15 = -1
  CallI MainHub
endif 
Return
Return
