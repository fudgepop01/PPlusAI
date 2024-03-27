#include <Definition_AIMain.h>
id 0x840F
unk 0x0

//= XReciever

LOGSTR_NL 1163412736 1126187776 1095519232 1162084352 0
if Equal var16 1
  LOGSTR_NL 1397247744 1431061504 541476352 0 0
endif
if Equal var21 16.41
  var21 = 16.4
endif

label start
var15 = 0
var7 = LevelValue * 0.01
if var7 < 0.05
  var7 = 0.05
endif

XGoto PerFrameChecks
//= XReciever
Seek start

// {SKIP_CHECKS}
Seek start

if Equal CurrSubaction JumpSquat
if Equal var20 7
    Seek execGeneral
    Jump
elif !(True)
    Seek execGeneral
    Jump
  endif
endif

if CurrAction >= 52 && CurrAction <= 57
  label grabHandler
  Goto common_checks
  Seek grabHandler
  Return
endif

if Equal AirGroundState 1
  if Equal CurrAction 3 && AnimFrame < 2
    Return
  elif Equal CurrAction 6 && AnimFrame < 3
    Return
  elif Equal CurrAction 10
if Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18
      Seek execGeneral
      Jump
    endif
    XGoto MoveToGoal
    Seek start
    Return
  endif

  var22 = 0.001
  XGoto GetChrSpecific
  //= XReciever
  Seek start

  if var22 < 0 && Equal Direction OPos
    ClearStick
    var22 = OPos * -1
    if !(Equal CurrAction 17)
      AbsStick var22
    endif
    Return
  elif var22 > 0 && !(Equal Direction OPos)
    ClearStick
    var22 = OPos
    if !(Equal CurrAction 17)
      AbsStick var22
    endif
    Return
  endif
endif

  var22 = 300
  XGoto GetChrSpecific
  Seek start
  if Equal var22 0 
    Return
  endif

  STACK_PUSH var22 0
  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var0 = var22
  var22 = STACK_POP
  if Equal var0 1
  if Equal AirGroundState 1
    MOD var22 GameTimer 3
    if !(Equal CurrSubaction JumpSquat) && var22 <= 1
      Button X
    endif
    Return
  endif
elif Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18
  if !(Equal AirGroundState 1)
    Return
  endif
elif !(Equal AirGroundState 1) || Equal CurrSubaction JumpSquat
  Return
endif

if Equal var20 1
  Seek execDA
  Jump
elif Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18
  MOD var22 GameTimer 3
  if !(Equal CurrSubaction JumpSquat) && !(Equal CurrAction 6)
    if var22 <= 1
      Button X
    endif
    Return
  endif
elif Rnd > var7
  Return
endif

if Equal AirGroundState 1
  Seek execGeneral
  Return
endif


label execGeneral

  var22 = 19
STACK_PUSH 18 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 6 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
  XGoto GetChrSpecific
  //= XReciever

Cmd30
ClearStick
// {SKIP_EXEC}

if Equal var20 0
Button A
Seek jab123
Return
elif Equal var20 1
Goto execDA
Seek dashattack
Return
elif Equal var20 2
Button A
Goto getHeight
var23 = OPos * 0.7
AbsStick var23 var22
Seek ftilt
Return
elif Equal var20 3
Button A
Stick 0 0.7
Seek utilt
Return
elif Equal var20 4
Button A
Stick 0 0.7
Seek utilt_late
Return
elif Equal var20 5
Button A
Stick 0 (-0.7)
Seek dtilt
Return
elif Equal var20 6
Button A
Goto getHeight
AbsStick OPos var22
Seek fsmash
Return
elif Equal var20 7
Button A
Stick 0 1
Seek usmash
Return
elif Equal var20 8
Button A
Stick 0 (-1)
Seek dsmash
Return
elif Equal var20 9
Button A
Stick 0 (-1)
Seek dsmash_hit2
Return
elif Equal var20 10
Button B
Seek nspecial
Return
elif Equal var20 11
Button B
Seek nspecialair
Return
elif Equal var20 12
Button B
AbsStick OPos
Seek sspecial
Return
elif Equal var20 13
Button B
AbsStick OPos
Seek sspecialair
Return
elif Equal var20 14
Button R|A
Seek grab
Return
elif Equal var20 15
Button R|A
Seek fthrow
Return
elif Equal var20 16
Button R|A
Seek dthrow
Return
elif Equal var20 17
Button R|A
Seek bthrow
Return
elif Equal var20 18
Button R|A
Seek uthrow
Return
elif Equal var20 19
Button A
Seek nair
Return
elif Equal var20 20
Button A
Stick 1
Seek fair
Return
elif Equal var20 21
Button A
Stick 1
Seek fair_weak
Return
elif Equal var20 22
Button A
Stick (-1) 0
Seek bair
Return
elif Equal var20 23
Button A
Stick (-1) 0
Seek bair_weak
Return
elif Equal var20 24
Button A
Stick 0 1
Seek uair
Return
elif Equal var20 25
Button A
Stick 0 (-0.6)
Seek dair
Return
elif Equal var20 26
Button A
Stick 0 (-0.6)
Seek dair_weak
Return
endif
// IMPLEMENTATIONS
if !(True)
label jab123
Goto PFC
Goto common_checks
Seek jab123
Return
label dashattack
Goto PFC
Goto common_checks
Seek dashattack
Return
label ftilt
Goto PFC
Goto common_checks
Seek ftilt
Return
label utilt
Goto PFC
Goto common_checks
Seek utilt
Return
label utilt_late
Goto PFC
Goto common_checks
Seek utilt_late
Return
label dtilt
Goto PFC
Goto common_checks
Seek dtilt
Return
label fsmash
Goto PFC
Goto common_checks
Seek fsmash
Return
label usmash
Goto PFC
Goto common_checks
Seek usmash
Return
label dsmash
Goto PFC
Goto common_checks
Seek dsmash
Return
label dsmash_hit2
Goto PFC
Goto common_checks
Seek dsmash_hit2
Return
label nspecial
Goto PFC
if AnimFrame >= 2 && AnimFrame <= 7 && !(Equal Direction OPos)
  AbsStick OPos
endif
Goto common_checks
Seek nspecial
Return
label nspecialair
Goto PFC
if AnimFrame >= 2 && AnimFrame <= 7 && !(Equal Direction OPos)
  AbsStick OPos
endif
Goto common_checks
Seek nspecialair
Return
label sspecial
Goto PFC
if AnimFrame >= 2 && AnimFrame <= 7 && !(Equal Direction OPos)
  AbsStick OPos
endif
Goto common_checks
Seek sspecial
Return
label sspecialair
Goto PFC
if AnimFrame >= 2 && AnimFrame <= 7 && !(Equal Direction OPos)
  AbsStick OPos
endif
Goto common_checks
Seek sspecialair
Return
label grab
Goto PFC
Goto common_checks
Seek grab
Return
label fthrow
Goto PFC
Goto common_checks
Seek fthrow
Return
label dthrow
Goto PFC
Goto common_checks
Seek dthrow
Return
label bthrow
Goto PFC
Goto common_checks
Seek bthrow
Return
label uthrow
Goto PFC
Goto common_checks
Seek uthrow
Return
label nair
Goto PFC
Goto common_checks
Seek nair
Return
label fair
Goto PFC
Goto common_checks
Seek fair
Return
label fair_weak
Goto PFC
Goto common_checks
Seek fair_weak
Return
label bair
Goto PFC
Goto common_checks
Seek bair
Return
label bair_weak
Goto PFC
Goto common_checks
Seek bair_weak
Return
label uair
Goto PFC
Goto common_checks
Seek uair
Return
label dair
Goto PFC
Goto common_checks
Seek dair
Return
label dair_weak
Goto PFC
Goto common_checks
Seek dair_weak
Return
endif

Call MainHub
Return 
label execDA
  Goto PFC
  Seek execDA
  if Equal CurrAction 1
    ClearStick
  elif Equal CurrAction 4
    Button A
    Stick 1
    Seek dashattack
    Return
  elif Equal CurrAction 3 && AnimFrame > 3
    Button A
    Stick 1
    Seek dashattack
    Return
  elif CurrAction <= 9 || Equal CurrAction 17 || Equal CurrAction 18
    Stick 1
  else
    Goto common_checks
  endif
  Return
label getHeight
  var22 = 0
  if Equal OCurrAction 74 || Equal OCurrAction 77 || Equal OCurrAction 83 || Equal OCurrAction 84
    var22 = -0.5
  elif OCurrAction >= 68 && OCurrAction <= 73 || Equal OCurrAction 66
    if OYDistBackEdge > -8 && OYSpeed < 0
      var22 = -0.5
    endif
  endif 
  Return
label PFC
  XGoto PerFrameChecks
  //= XReciever
  if !(Equal var21 7)
if  var20 >= 19 && var20 <= 26
      if Equal IsOnStage 0 && NumJumps < 1 && TotalYSpeed < -0.5
        var22 = TopNX * -1
        AbsStick var22
      elif True
        if Equal var21 16.3
          PredictOMov var22 14
          if var22 > 0.25 && XDistLE 50
            var22 = OPos * -1
            AbsStick var22
            Return
          endif
        endif
        XGoto SetAttackGoal
        //= XReciever
        if Equal var21 16.4
          XGoto MoveToGoal
          //= XReciever
        elif Equal var21 16.3
          var22 = XSpeed * -2
          AbsStick var22
        else
          XGoto MoveToGoal
          //= XReciever
        endif
      endif
    endif
  endif
Return
label common_checks
  XGoto PerFrameChecks
  
  if Equal CanCancelAttack 1
    Seek finish
    Jump
  elif Equal HitboxConnected 1 && HasCurry
    if OFramesHitstun > 1 && OFramesHitlag < 1 && OAnimFrame >= 3 || OFramesHitlag >= 8
      Seek finish
      Jump
    endif
  elif CurrAction <= 32 && !(Equal CurrAction 24)
    Seek finish
    Jump
  endif

  if OFramesHitlag <= 0 && OFramesHitstun > 0
    var15 += 1
    if Equal var15 2
      // immediateTempVar = (1 - (LevelValue / 50)) * 1.3
      // ADJUST_PERSONALITY idx_aggression 0.002 immediateTempVar
      // if currGoal >= cg_circleCamp && currGoal < calc(cg_circleCamp + 1)
      //   ADJUST_PERSONALITY idx_circleCampChance 0.0015 immediateTempVar
      //   if Equal currGoal cg_camp_attack
      //     ADJUST_PERSONALITY idx_aggression 0.002 immediateTempVar
      //   endif
      // elif currGoal >= cg_attack && currGoal < calc(cg_attack + 1)
      //   ADJUST_PERSONALITY idx_baitChance -0.001 immediateTempVar
      //   ADJUST_PERSONALITY idx_aggression 0.001 immediateTempVar
      //   if Equal currGoal cg_attack_reversal
      //     ADJUST_PERSONALITY idx_aggression 0.005 immediateTempVar
      //   elif Equal currGoal cg_attack_overshoot || Equal currGoal cg_attack_undershoot
      //     ADJUST_PERSONALITY idx_baitChance 0.001 immediateTempVar
      //   elif Equal currGoal cg_attack_wall
      //     ADJUST_PERSONALITY idx_baitChance 0.002 immediateTempVar
      //     ADJUST_PERSONALITY idx_circleCampChance 0.002 immediateTempVar
      //   endif
      // elif Equal currGoal cg_bait_attack
      //   ADJUST_PERSONALITY idx_baitChance 0.001 immediateTempVar
      // endif

      // if OKBSpeed > 3
      //   if CHANCE_MUL_LE PT_AGGRESSION 0.6
      //     currGoal = cg_attack
      //   else
      //     currGoal = cg_bait_dashdance
      //   endif
      // else
      //   currGoal = cg_attack
      // endif  

      if !(True)
        label correctMoveAngle
      endif
      if var18 > 90
        var18 -= 90
        if var18 > 90
          SeekNoCommit correctMoveAngle
        endif
      endif

      var22 = var18 + 3
      var23 = var18 - 3
      if OKBAngle > var22
        trackOAction 5 1
      elif OKBAngle < var23
        trackOAction 5 3
      elif Rnd < 0.5
        trackOAction 5 2
      endif
    endif
  endif

  // L cancel
  if Equal CurrAction 51 && YDistFloor > 0
    RetrieveFullATKD var22 var17 var17 var17 var17 var17 var17 CurrSubaction 0
    if Equal var22 0
      var22 = 999
    endif 
    var23 = var22 - AnimFrame
    EstYCoord var23 7
    var17 = TopNY - YDistFloor
    var22 -= 2
    if !(Equal CanCancelAttack 1) && Equal AirGroundState 2 && YSpeed < -0.2 && var23 < var17 && var22 > AnimFrame
      Button R
    endif
  endif

  // grabs
  if Equal CurrAction 57
if Equal var20 14
      XGoto CalcAttackGoal
elif Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18
    else
      XGoto CalcAttackGoal
    endif
if Equal var20 15
      Stick 1 0
elif Equal var20 16
      Stick 0 (-1)
elif Equal var20 17
      Stick -1 0
elif Equal var20 18
      Stick 0 1
    endif
  endif

  // just for those with FSM
  if Equal AirGroundState 2 && var21 < 16.7
    var22 = AnimFrame * 0.8
    LOGSTR 1937113088 0 0 0 0
    LOGVAL var16
    PRINTLN
    if Equal var16 1 && YSpeed < 0 && FramesHitlag <= 0
      AbsStick 0 (-1)
      var16 = 0
    elif var22 > var6 && LevelValue >= 75 && Equal AirGroundState 2 && Equal HitboxConnected 1 && YSpeed <= 0
      var22 = EndFrame - AnimFrame 
      if Equal var16 1 || var22 > 5 
        AbsStick 0 (-1)
      endif
    endif
  endif
//   {COMMON_EXTENSION}
Return
label finish
  var16 = 0
  var15 = -100
  var20 = -1
  if Equal var21 16.3 && CHANCE_MUL_GE PT_WALL_CHANCE 0.15
    var21 = 0
  endif
  if Equal HitboxConnected 1 || OFramesHitlag > 0 || OFramesHitstun > 0 || CHANCE_MUL_LE PT_AGGRESSION 0.1 || Equal OCurrAction 66
    if !(XDistLE 40) && OFramesHitstun <= 0 && OFramesHitstun <= 0 && !(Equal OCurrAction 66)
      var21 = 16.3
    else
      var21 = 16.4
    endif
    XGoto CalcAttackGoal
    var15 = -10
    //= XReciever
  elif CHANCE_MUL_LE PT_BAITCHANCE 0.2 && !(XDistLE 35)
    var15 = -10
    var21 = 10.5
  endif
  if !(XDistLE 65) && CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 0.15
    var15 = -10
    var21 = 7
  endif
  CallI MainHub
Return
Return
