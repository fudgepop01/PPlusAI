#include <Definition_AIMain.h>
id 0x840F
unk 0x0

//= XReciever

label start
#let techSkill = var7
#let lastHitFrame = var6
#let framesAfterHitlag = var15
framesAfterHitlag = 0
#let moveAngle = var18
techSkill = LevelValue * 0.01
if techSkill < 0.2
  techSkill = 0.2
endif

XGoto PerFrameChecks
//= XReciever
Seek start

{SKIP_CHECKS}

if Equal AirGroundState 1
  if Equal CurrAction hex(0x3) && AnimFrame < 2
    Return
  endif

  GET_CHAR_TRAIT(immediateTempVar, chr_get_moveDir)
  Seek start

  if immediateTempVar < 0 && Equal Direction OPos
    immediateTempVar = OPos * -1
    AbsStick immediateTempVar
    Return
  elif immediateTempVar >= 0 && !(Equal Direction OPos)
    immediateTempVar = OPos
    AbsStick immediateTempVar
    Return
  endif
endif

if CurrAction >= hex(0x34) && CurrAction <= hex(0x39)
  label grabHandler
  Goto common_checks
  Seek grabHandler
  Return
endif

if Equal CurrSubaction JumpSquat
  $ifLastOrigin(usmash,false)
    Seek
    Jump
  $ifLastOrigin(uspecial,true)
    Seek
    Jump
  endif
endif

ACTIONABLE_ON_GROUND(start)

IF_AERIAL_ATTACK(var0)
  if Equal AirGroundState 1
    MOD immediateTempVar AnimFrame 3
    if !(Equal CurrSubaction JumpSquat) && immediateTempVar <= 1
      Button X
    endif
    Return
  endif
$ifLastOrigin(grab,true)
  if !(Equal AirGroundState 1)
    Return
  endif
elif !(Equal AirGroundState 1) || Equal CurrSubaction JumpSquat
  Return
endif

$ifLastOrigin(dashattack,false)
  Seek execDA
  Jump
$ifLastOrigin(grab,true)
  MOD immediateTempVar AnimFrame 3
  if !(Equal CurrSubaction JumpSquat) && !(Equal CurrAction hex(0x6)) && immediateTempVar <= 1
    Button X
    Return
  endif
elif Rnd > techSkill
  Return
endif
if Equal AirGroundState 1
  Seek
  Return
endif

GET_MOVE_DATA(moveAngle, globTempVar, globTempVar, globTempVar, globTempVar, globTempVar, globTempVar, globTempVar, globTempVar, globTempVar, globTempVar, globTempVar)

label
Cmd30
ClearStick
{SKIP_EXEC}

$WARIOMAN_MOVE_SNIPPETS()

label _thing_
Goto PFC
$ifLastAttack(sspecial)
  PredictOMov immediateTempVar mov_jump
  if immediateTempVar >= 0.15
    $setLastAttack(sspecial_jump)
  endif
$elifLastAttack(sspecial_jump)
  label sspJump
  if Equal CurrSubaction hex(0x1e6) && AnimFrame >= 4 && Rnd <= 0.8 && immediateTempVar >= 0.15 && XDistLE 25
    Button X
  endif
  Goto common_checks
  Seek sspJump
  Return
$elifLastAttack(jab123_2)
  if Equal CurrSubaction hex(0x48) && AnimFrame >= 7 && Rnd <= 0.8
    Button A
  endif
endif
Goto common_checks
Seek _thing_
Return

label execDA
  Goto PFC
  Seek execDA
  if Equal CurrAction hex(0x1)
    ClearStick
  elif Equal CurrAction hex(0x04)
    Button A
    Stick 1
    Seek dashattack
    Jump
  elif Equal CurrAction hex(0x03) && AnimFrame > 3
    Button A
    Stick 1
    Seek dashattack
    Jump
  elif CurrAction <= hex(0x09)
    Stick 1
  else
    Goto common_checks
  endif
  Return
label getHeight
  immediateTempVar = 0
  if Equal OCurrAction hex(0x4A) || Equal OCurrAction hex(0x4D) || Equal OCurrAction hex(0x53) || Equal OCurrAction hex(0x54)
    immediateTempVar = -0.5
  elif OCurrAction >= hex(0x44) && OCurrAction <= hex(0x49) || Equal OCurrAction hex(0x42)
    if OYDistBackEdge > -8 && OYSpeed < 0
      immediateTempVar = -0.5
    endif
  endif 
  Return
label PFC
  XGoto PerFrameChecks
  //= XReciever
  $ifAerialAttackNotSpecial()
    if Equal IsOnStage 0 && NumJumps < 1 && TotalYSpeed < -0.5
      immediateTempVar = TopNX * -1
      AbsStick immediateTempVar
    elif True
      if Equal currGoal cg_attack_wall
        PredictOMov immediateTempVar mov_attack
        if immediateTempVar > 0.25 && XDistLE 50
          immediateTempVar = OPos * -1
          AbsStick immediateTempVar
          Return
        endif
      endif
      XGoto SetAttackGoal
      //= XReciever
      if Equal currGoal cg_attack_reversal
        XGoto MoveToGoal
        //= XReciever
      elif Equal currGoal cg_attack_wall
        immediateTempVar = XSpeed * -2
        AbsStick immediateTempVar
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
  elif CurrAction <= hex(0x20) && !(Equal CurrAction hex(0x18))
    Seek finish
    Jump
  endif

  if OFramesHitlag <= 0 && OFramesHitstun > 0
    framesAfterHitlag += 1
    if Equal framesAfterHitlag 2
      if !(True)
        label correctMoveAngle
      endif
      if moveAngle > 90
        moveAngle -= 90
        if moveAngle > 90
          SeekNoCommit correctMoveAngle
        endif
      endif

      immediateTempVar = moveAngle + 3
      anotherTempVar = moveAngle - 3
      if OKBAngle > immediateTempVar
        trackOAction man_ODIAngle op_DI_in
      elif OKBAngle < anotherTempVar
        trackOAction man_ODIAngle op_DI_out
      elif Rnd < 0.5
        trackOAction man_ODIAngle op_DI_neutral
      endif
    endif
  endif

  // L cancel
  if Equal CurrAction hex(0x33)
    RetrieveFullATKD immediateTempVar globTempVar globTempVar globTempVar globTempVar globTempVar globTempVar CurrSubaction 0
    if Equal immediateTempVar 0
      immediateTempVar = 999
    endif 
    immediateTempVar -= 2
    if !(Equal CanCancelAttack 1) && Equal AirGroundState 2 && YSpeed < -0.2 && YDistFloor < 10 && immediateTempVar > AnimFrame
      Button R
    endif
  endif

  // grabs
  if Equal CurrAction hex(0x39)
    $ifLastOrigin(grab,false)
    else
      XGoto CalcAttackGoal
    endif
    $ifLastAttack(fthrow)
      Stick 1 0
    $elifLastAttack(dthrow)
      Stick 0 (-1)
    $elifLastAttack(bthrow)
      Stick -1 0
    $elifLastAttack(uthrow)
      Stick 0 1
    endif
  endif

  // just for those with FSM
  if Equal AirGroundState 2
    immediateTempVar = AnimFrame * 0.8
    if Equal scriptVariant sv_execute_fastfall && YSpeed < 0 && FramesHitlag <= 0
      AbsStick 0 (-1)
      scriptVariant = sv_none
    elif Equal IsOnStage 1 && immediateTempVar > lastHitFrame && LevelValue >= LV8 && Equal AirGroundState 2
      immediateTempVar = EndFrame - AnimFrame 
      if YSpeed <= 0 && immediateTempVar > 5
        AbsStick 0 (-1)
      endif
    endif
  endif
  {COMMON_EXTENSION}
Return
label finish
  scriptVariant = sv_none
  skipMainInit = -100
  lastAttack = -1
  if Equal currGoal cg_attack_wall && CHANCE_MUL_GE PT_WALL_CHANCE 0.15
    currGoal = cg_attack
  endif
  if Equal HitboxConnected 1 || OFramesHitlag > 0 || OFramesHitstun > 0 || CHANCE_MUL_LE PT_AGGRESSION 0.1
    if XDistLE 40 && Equal HitboxConnected 0
      currGoal = cg_attack_wall
    else
      currGoal = cg_attack_reversal
    endif
    XGoto CalcAttackGoal
    skipMainInit = mainInitSkip
  endif
  CallI MainHub
Return
Return