#include <Definition_AIMain.h>
id 0x840F
unk 0x0

//= XReciever

label start
var15 = 0
var7 = LevelValue * 0.01
if var7 < 0.2
  var7 = 0.2
endif

XGoto PerFrameChecks
//= XReciever
Seek start

{SKIP_CHECKS}

if Equal AirGroundState 1
  if Equal CurrAction 3 && AnimFrame < 2
    Return
  endif

  var22 = 0.001
  XGoto GetChrSpecific
  //= XReciever
  Seek start

  if var22 < 0 && Equal Direction OPos
    var22 = OPos * -1
    AbsStick var22
    Return
  elif var22 >= 0 && !(Equal Direction OPos)
    var22 = OPos
    AbsStick var22
    Return
  endif
endif

if CurrAction >= 52 && CurrAction <= 57
  label grabHandler
  Goto common_checks
  Seek grabHandler
  Return
endif

if Equal CurrSubaction JumpSquat
if Equal var20 7
    Seek
    Jump
elif Equal var20 9
    Seek
    Jump
  endif
endif

  var22 = 300
  XGoto GetChrSpecific
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
    MOD var22 AnimFrame 3
    if !(Equal CurrSubaction JumpSquat) && var22 <= 1
      Button X
    endif
    Return
  endif
elif Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18 || Equal var20 19 || Equal var20 20
  if !(Equal AirGroundState 1)
    Return
  endif
elif !(Equal AirGroundState 1) || Equal CurrSubaction JumpSquat
  Return
endif

if Equal var20 2
  Seek execDA
  Jump
elif Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18 || Equal var20 19 || Equal var20 20
  MOD var22 AnimFrame 3
  if !(Equal CurrSubaction JumpSquat) && !(Equal CurrAction 6) && var22 <= 1
    Button X
    Return
  endif
elif Rnd > var7
  Return
endif
if Equal AirGroundState 1
  Seek
  Return
endif

  var22 = 19
STACK_PUSH 18 0
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
  XGoto GetChrSpecific
  //= XReciever

label
Cmd30
ClearStick
{SKIP_EXEC}

if Equal var20 0
Button A
Seek
Return
elif Equal var20 1
Button A
Seek
Return
elif Equal var20 2
Goto execDA
Seek
Return
elif Equal var20 3
Button A
Goto getHeight
Stick 0.7 var22
Seek
Return
elif Equal var20 4
Button A
Stick 0 0.7
Seek
Return
elif Equal var20 5
Button A
Stick 0 (-0.7)
Seek
Return
elif Equal var20 6
Button A
Goto getHeight
Stick 1
Seek
Return
elif Equal var20 7
Button A
Stick 0 1
Seek
Return
elif Equal var20 8
Button A
Stick 0 (-1)
Seek
Return
elif Equal var20 9
Button B
Stick 0 1
Seek
Return
elif Equal var20 10
Button B
Stick 0 1
Seek
Return
elif Equal var20 11
Button B
AbsStick OPos
Seek
Return
elif Equal var20 12
Button B
AbsStick OPos
Seek
Return
elif Equal var20 13
Button B
AbsStick OPos
Seek
Return
elif Equal var20 14
Button B
AbsStick OPos
Seek
Return
elif Equal var20 15
Button R|A
Seek
Return
elif Equal var20 16
Button R|A
Seek
Return
elif Equal var20 17
Button R|A
Seek
Return
elif Equal var20 18
Button R|A
Seek
Return
elif Equal var20 19
Button R|A
Seek
Return
elif Equal var20 20
Button R|A
Seek
Return
elif Equal var20 21
Button A
Seek
Return
elif Equal var20 22
Button A
Seek
Return
elif Equal var20 23
Button A
Goto getHeight
Stick 1
Seek
Return
elif Equal var20 24
Button A
Goto getHeight
Stick 1
Seek
Return
elif Equal var20 25
Button A
Stick (-1) 0
Seek
Return
elif Equal var20 26
Button A
Stick 0 1
Seek
Return
elif Equal var20 27
Button A
Stick 0 (-0.6)
Seek
Return
endif
// IMPLEMENTATIONS
if !(True)
label jab123
Goto PFC
{JAB123}
Goto common_checks
Seek jab123
Return
label jab123_2
Goto PFC
{JAB123_2}
Goto common_checks
Seek jab123_2
Return
label dashattack
Goto PFC
{DASHATTACK}
Goto common_checks
Seek dashattack
Return
label ftilt
Goto PFC
{FTILT}
Goto common_checks
Seek ftilt
Return
label utilt
Goto PFC
{UTILT}
Goto common_checks
Seek utilt
Return
label dtilt
Goto PFC
{DTILT}
Goto common_checks
Seek dtilt
Return
label fsmash
Goto PFC
{FSMASH}
Goto common_checks
Seek fsmash
Return
label usmash
Goto PFC
{USMASH}
Goto common_checks
Seek usmash
Return
label dsmash
Goto PFC
{DSMASH}
Goto common_checks
Seek dsmash
Return
label uspecial
Goto PFC
if AnimFrame >= 2 && AnimFrame <= 7 && !(Equal Direction OPos)
  AbsStick OPos
endif
{USPECIAL}
Goto common_checks
Seek uspecial
Return
label uspecialair
Goto PFC
if AnimFrame >= 2 && AnimFrame <= 7 && !(Equal Direction OPos)
  AbsStick OPos
endif
{USPECIALAIR}
Goto common_checks
Seek uspecialair
Return
label sspecial
Goto PFC
if AnimFrame >= 2 && AnimFrame <= 7 && !(Equal Direction OPos)
  AbsStick OPos
endif
{SSPECIAL}
Goto common_checks
Seek sspecial
Return
label sspecial_mid
Goto PFC
if AnimFrame >= 2 && AnimFrame <= 7 && !(Equal Direction OPos)
  AbsStick OPos
endif
{SSPECIAL_MID}
Goto common_checks
Seek sspecial_mid
Return
label sspecial_jump
Goto PFC
if AnimFrame >= 2 && AnimFrame <= 7 && !(Equal Direction OPos)
  AbsStick OPos
endif
{SSPECIAL_JUMP}
Goto common_checks
Seek sspecial_jump
Return
label sspecialair
Goto PFC
if AnimFrame >= 2 && AnimFrame <= 7 && !(Equal Direction OPos)
  AbsStick OPos
endif
{SSPECIALAIR}
Goto common_checks
Seek sspecialair
Return
label grab
Goto PFC
{GRAB}
Goto common_checks
Seek grab
Return
label grab_dash
Goto PFC
{GRAB_DASH}
Goto common_checks
Seek grab_dash
Return
label fthrow
Goto PFC
{FTHROW}
Goto common_checks
Seek fthrow
Return
label dthrow
Goto PFC
{DTHROW}
Goto common_checks
Seek dthrow
Return
label bthrow
Goto PFC
{BTHROW}
Goto common_checks
Seek bthrow
Return
label uthrow
Goto PFC
{UTHROW}
Goto common_checks
Seek uthrow
Return
label nair
Goto PFC
{NAIR}
Goto common_checks
Seek nair
Return
label nair_fall
Goto PFC
{NAIR_FALL}
Goto common_checks
Seek nair_fall
Return
label fair
Goto PFC
{FAIR}
Goto common_checks
Seek fair
Return
label fair_fall
Goto PFC
{FAIR_FALL}
Goto common_checks
Seek fair_fall
Return
label bair
Goto PFC
{BAIR}
Goto common_checks
Seek bair
Return
label uair
Goto PFC
{UAIR}
Goto common_checks
Seek uair
Return
label dair
Goto PFC
{DAIR}
Goto common_checks
Seek dair
Return
endif

label _thing_
Goto PFC
if Equal var20 11
  PredictOMov var22 7
  if var22 >= 0.15
var20 = 13
  endif
elif Equal var20 13
  label sspJump
  if Equal CurrSubaction 486 && AnimFrame >= 4 && Rnd <= 0.8 && var22 >= 0.15 && XDistLE 25
    Button X
  endif
  Goto common_checks
  Seek sspJump
  Return
elif Equal var20 1
  if Equal CurrSubaction 72 && AnimFrame >= 7 && Rnd <= 0.8
    Button A
  endif
endif
Goto common_checks
Seek _thing_
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
    Jump
  elif Equal CurrAction 3 && AnimFrame > 3
    Button A
    Stick 1
    Seek dashattack
    Jump
  elif CurrAction <= 9
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
if  Equal var20 21 || Equal var20 22 || Equal var20 23 || Equal var20 24 || Equal var20 25 || Equal var20 26 || Equal var20 27
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
Return
label common_checks
  XGoto PerFrameChecks
  //= XReciever

  if Equal CanCancelAttack 1
    Seek finish
    Jump
  elif Equal HitboxConnected 1 && HasCurry
    Seek finish
    Jump
  elif CurrAction <= 32 && !(Equal CurrAction 24)
    Seek finish
    Jump
  endif

  if OFramesHitlag <= 0 && OFramesHitstun > 0
    var15 += 1
    if Equal var15 2
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

  // grabs
  if Equal CurrAction 57
if Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18 || Equal var20 19 || Equal var20 20
    else
      XGoto CalcAttackGoal
    endif
if Equal var20 17
      Stick 1 0
elif Equal var20 18
      Stick 0 (-1)
elif Equal var20 19
      Stick -1 0
elif Equal var20 20
      Stick 0 1
    endif
  endif

  // just for those with FSM
  if Equal AirGroundState 2
    var22 = AnimFrame * 0.8
    if Equal var16 1 && YSpeed < 0 && FramesHitlag <= 0
      AbsStick 0 (-1)
      var16 = 0
    elif Equal IsOnStage 1 && var22 > var6 && LevelValue >= 75 && Equal AirGroundState 2
      var22 = EndFrame - AnimFrame 
      if YSpeed <= 0 && var22 > 5
        AbsStick 0 (-1)
      endif
    endif
  endif
  {COMMON_EXTENSION}
Return
label finish
  var16 = 0
  var15 = -100
  var20 = -1
  if Equal var21 16.3 && CHANCE_MUL_GE PT_WALL_CHANCE 0.15
    var21 = 16
  endif
  if Equal HitboxConnected 1 || OFramesHitlag > 0 || OFramesHitstun > 0 || CHANCE_MUL_LE PT_AGGRESSION 0.1
    if XDistLE 40 && Equal HitboxConnected 0
      var21 = 16.3
    else
      var21 = 16.4
    endif
    XGoto CalcAttackGoal
    var15 = -1
  endif
  CallI MainHub
Return
Return
