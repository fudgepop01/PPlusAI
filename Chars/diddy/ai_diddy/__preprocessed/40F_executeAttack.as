#include <Definition_AIMain.h>
id 0x840F
unk 0x0

XReciever

label start
var16 = 0
var7 = LevelValue * 0.01
if var7 < 0.2
  var7 = 0.2
endif

XGoto PerFrameChecks
XReciever
Seek start

if Equal AirGroundState 1
  var22 = 0.001
  XGoto GetChrSpecific
  XReciever

  if var22 < 0 && Equal Direction OPos
    var22 = OPos * -1
    AbsStick var22
    Return
  elif var22 > 0 && !(Equal Direction OPos)
    var22 = OPos
    AbsStick var22
    Return
  endif
endif
if var21 < 16.7 && Equal IsOnStage 0
  CallI RecoveryHub
endif

  if Equal CurrAction 22 
    if Equal PrevAction 33
      Return
    elif AnimFrame <= 3
      Return
    endif
  elif CurrAction >= 66 && CurrAction <= 73
  elif Equal CanCancelAttack 1
  elif CurrAction >= 24
    Return
  endif

if !(True) || Equal var20 15|| Equal var20 17|| Equal var20 23|| Equal var20 24|| Equal var20 25|| Equal var20 26|| Equal var20 27|| Equal var20 28|| Equal var20 29|| Equal var20 30
  if Equal AirGroundState 1
    MOD var22 AnimFrame 3
    if !(Equal CurrSubaction JumpSquat) && var22 <= 1
      Button X
    endif
    Return
  endif
elif !(Equal AirGroundState 1) || Equal CurrSubaction JumpSquat
  Return
endif

if !(True) || Equal var20 3 || Equal var20 4
  Seek execDA
  Jump
elif Rnd > var7
  Return
endif
if Equal AirGroundState 1
  Seek
  Return
endif

  var22 = 19
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 18 0
  XGoto GetChrSpecific
  XReciever

label
Cmd30
ClearStick
  // $ifLastAttack(nspecialair)
  //   Seek nspecialair
  //   Jump
  // endif

if Equal var20 0
var6 = 4
Button A
Seek jab123
Return
elif Equal var20 1
var6 = 11
Button A
Seek jab123_2
Return
elif Equal var20 2
var6 = 23
Button A
Seek jab123_3
Return
elif Equal var20 3
var6 = 11
Goto execDA
Seek dashattack
Return
elif Equal var20 4
var6 = 22
Goto execDA
Seek dashattack_late
Return
elif Equal var20 5
var6 = 13
Button A
Goto getHeight
Stick 0.7 var22
Seek ftilt
Return
elif Equal var20 6
var6 = 13
Button A
Goto getHeight
Stick 0.7 var22
Seek ftilt_strong
Return
elif Equal var20 7
var6 = 13
Button A
Stick 0 0.7
Seek utilt
Return
elif Equal var20 8
var6 = 6
Button A
Stick 0 (-0.7)
Seek dtilt
Return
elif Equal var20 9
var6 = 6
Button A
Stick 0 (-0.7)
Seek dtilt_outer
Return
elif Equal var20 10
var6 = 20
Button A
Goto getHeight
Stick 1
Seek fsmash
Return
elif Equal var20 11
var6 = 26
Button A
Stick 0 1
Seek usmash
Return
elif Equal var20 12
var6 = 8
Button A
Stick 0 (-1)
Seek dsmash
Return
elif Equal var20 13
var6 = 18
Button A
Stick 0 (-1)
Seek dsmash_hit2
Return
elif Equal var20 14
var6 = 30
Button B
Seek nspecial
Return
elif Equal var20 15
var6 = 30
Button B
Seek nspecialair
Return
elif Equal var20 16
var6 = 19
Button B
Stick 0 (-0.7)
Seek dspecial
Return
elif Equal var20 17
var6 = 19
Button B
Stick 0 (-0.7)
Seek dspecialair
Return
elif Equal var20 18
var6 = 7
Button R|A
Seek grab
Return
elif Equal var20 19
var6 = 7
Button R|A
Seek fthrow
Return
elif Equal var20 20
var6 = 7
Button R|A
Seek dthrow
Return
elif Equal var20 21
var6 = 7
Button R|A
Seek bthrow
Return
elif Equal var20 22
var6 = 7
Button R|A
Seek uthrow
Return
elif Equal var20 23
var6 = 7
Button A
Seek nair
Return
elif Equal var20 24
var6 = 18
Button A
Seek nair_late
Return
elif Equal var20 25
var6 = 14
Button A
Goto getHeight
Stick 1
Seek fair
Return
elif Equal var20 26
var6 = 7
Button A
Goto getHeight
Stick 1
Seek fair_strong
Return
elif Equal var20 27
var6 = 8
Button A
Stick (-1) 0
Seek bair
Return
elif Equal var20 28
var6 = 7
Button A
Stick 0 1
Seek uair
Return
elif Equal var20 29
var6 = 9
Button A
Stick 0 1
Seek uair_late
Return
elif Equal var20 30
var6 = 12
Button A
Stick 0 (-0.6)
Seek dair
Return
endif
// IMPLEMENTATIONS
if !(True)
label jab123
Goto PFC
Goto common_checks
Seek jab123
Return
label jab123_2
Goto PFC
Goto common_checks
Seek jab123_2
Return
label jab123_3
Goto PFC
Goto common_checks
Seek jab123_3
Return
label dashattack
Goto PFC
Goto common_checks
Seek dashattack
Return
label dashattack_late
Goto PFC
Goto common_checks
Seek dashattack_late
Return
label ftilt
Goto PFC
Goto common_checks
Seek ftilt
Return
label ftilt_strong
Goto PFC
Goto common_checks
Seek ftilt_strong
Return
label utilt
Goto PFC
Goto common_checks
Seek utilt
Return
label dtilt
Goto PFC
Goto common_checks
Seek dtilt
Return
label dtilt_outer
Goto PFC
Goto common_checks
Seek dtilt_outer
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
if AnimFrame >= 2 && AnimFrame <= 7
  AbsStick OPos
endif
  // if !(ODistLE 70) && AnimFrame > 3 && Equal CurrSubaction 463
  //   Button B
  // endif
Goto common_checks
Seek nspecial
Return
label nspecialair
Goto PFC
if AnimFrame >= 2 && AnimFrame <= 7
  AbsStick OPos
endif
  // ClearStick
  // AbsStick OPos
  // Seek nspecialair
  // if !(Equal CurrSubaction 466) && Equal AirGroundState 2
  //   if !(Equal CurrSubaction JumpSquat) && AnimFrame >= 6 && Rnd < 0.8
  //     ClearStick
  //     Button B
  //   endif
  //   Return
  // elif True
  //   if AnimFrame >= 5 && Rnd <= var7 && Equal IsOnStage 1 && Equal AirGroundState 2
  //     var16 = 1
  //   endif
  // endif
Goto common_checks
Seek nspecialair
Return
label dspecial
Goto PFC
if AnimFrame >= 2 && AnimFrame <= 7
  AbsStick OPos
endif
  // if AnimFrame >= 6
  //   Button X
  //   var16 = 1
  //   CallI Wavedash
  // endif
Goto common_checks
Seek dspecial
Return
label dspecialair
Goto PFC
if AnimFrame >= 2 && AnimFrame <= 7
  AbsStick OPos
endif
  // if AnimFrame >= 6
  //   Button X
  //   CallI MainHub
  // endif
Goto common_checks
Seek dspecialair
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
label nair_late
Goto PFC
Goto common_checks
Seek nair_late
Return
label fair
Goto PFC
Goto common_checks
Seek fair
Return
label fair_strong
Goto PFC
Goto common_checks
Seek fair_strong
Return
label bair
Goto PFC
Goto common_checks
Seek bair
Return
label uair
Goto PFC
Goto common_checks
Seek uair
Return
label uair_late
Goto PFC
Goto common_checks
Seek uair_late
Return
label dair
Goto PFC
Goto common_checks
Seek dair
Return
endif

Call MainHub
Return 
label execDA
  label
  Goto PFC
  if Equal CurrAction 1
    ClearStick
  elif Equal CurrAction 4
    Button A
    Stick 1
    Seek
  elif Equal CurrAction 3 && AnimFrame > 3
    Button A
    Stick 1
    Seek
  elif CurrAction <= 9
    Stick 1
  else
    Call MainHub
  endif
  Seek execDA
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
  XReciever
if !(True) || Equal var20 15|| Equal var20 17|| Equal var20 23|| Equal var20 24|| Equal var20 25|| Equal var20 26|| Equal var20 27|| Equal var20 28|| Equal var20 29|| Equal var20 30
    XGoto SetAttackGoal
    XReciever
    if Equal var21 16.4
      XGoto MoveToGoal
      XReciever
    else
      GetCommitPredictChance var22 LevelValue
      if var22 >= 0.4 && XDistBackEdge < -10
        var22 = OPos * -1
        AbsStick var22
      endif
    endif
  endif
Return
label common_checks
  XGoto PerFrameChecks
  XReciever

  if Equal CanCancelAttack 1 && CurrAction >= 24 && CurrAction <= 52
    Seek finish
    Jump
  elif CurrAction <= 32 && !(Equal CurrAction 24)
    Seek finish
    Jump
  endif

  if OFramesHitlag <= 0 && OFramesHitstun > 0
    var16 += 1
    if Equal var16 2
      var22 = LevelValue * 0.25

      ADJUST_PERSONALITY 0 0.002 var22
      if var21 >= 7 && var21 < 8
        ADJUST_PERSONALITY 5 0.0015 var22
        if Equal var21 7.1
          ADJUST_PERSONALITY 0 0.002 var22
        endif
      elif var21 >= 16 && var21 < 17
        ADJUST_PERSONALITY 3 -0.004 var22
        ADJUST_PERSONALITY 0 0.002 var22
        if Equal var21 16.4
          ADJUST_PERSONALITY 0 0.005 var22
        elif Equal var21 16.1 || Equal var21 16.2
          ADJUST_PERSONALITY 3 0.001 var22
        elif Equal var21 16.3
          ADJUST_PERSONALITY 3 0.005 var22
          ADJUST_PERSONALITY 5 0.0025 var22
        endif
      elif Equal var21 10.1
        ADJUST_PERSONALITY 3 0.001 var22
      endif

      if OKBSpeed > 3
        if CHANCE_MUL_LE PT_AGGRESSION 0.6
          var21 = 16
        else
          var21 = 10.5
        endif
      else
        var21 = 16
      endif  

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
  if Equal CurrAction 51
    RetrieveFullATKD var22 var17 var17 var17 var17 var17 var17 CurrSubaction 0
    if Equal var22 0
      var22 = 999
    endif 
    var22 -= 2
    if !(Equal CanCancelAttack 1) && Equal AirGroundState 2 && YSpeed < -0.2 && YDistFloor < 10 && var22 > AnimFrame
      Button R
    endif
  endif

  // just for those with FSM
  var22 = AnimFrame * 0.8
  if Equal var16 1 && Equal AirGroundState 2 && YSpeed <= 0
    AbsStick 0 (-1)
    var16 = 0
  elif Equal IsOnStage 1 && var22 > var6 && LevelValue >= 75 && Equal AirGroundState 2
    var22 = EndFrame - AnimFrame 
    if YSpeed <= 0 && var22 > 20 && Equal CurrAction 51
      AbsStick 0 (-1)
    endif
  endif
//   {COMMON_EXTENSION}
Return
label finish
  var20 = -1
  var16 = 0
  if Equal HitboxConnected 1 || OFramesHitlag > 0 || OFramesHitstun > 0 || Equal var21 16 || CHANCE_MUL_LE PT_AGGRESSION 0.25
    XGoto CalcAttackGoal
    XReciever
    var15 = -1
    var21 = 16.4
  elif CHANCE_MUL_LE PT_BAITCHANCE 0.75
    var15 = -1
    var21 = 10.5
  endif
  CallI MainHub
Return
Return