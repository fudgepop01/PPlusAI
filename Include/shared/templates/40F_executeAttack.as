#include <Definition_AIMain.h>
id 0x840F
unk 0x0

XReciever

LOGSTR_NL str("EXEC CALLED")
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
XReciever
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
if currGoal < cg_edgeguard && Equal IsOnStage 0
  CallI RecoveryHub
endif

ACTIONABLE_ON_GROUND

$ifAerialAttack()
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
  if !(Equal CurrSubaction JumpSquat) && !(Equal CurrAction hex(0x6))
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
LOGSTR_NL str("EXECUTING")
{SKIP_EXEC}

$generateMoveSnippets()

Call MainHub
Return 
label execDA
  label
  Goto PFC
  if Equal CurrAction hex(0x1)
    ClearStick
  elif Equal CurrAction hex(0x04)
    Button A
    Stick 1
    Seek
  elif Equal CurrAction hex(0x03) && AnimFrame > 3
    Button A
    Stick 1
    Seek
  elif CurrAction <= hex(0x09)
    Stick 1
  else
    Call MainHub
  endif
  Seek execDA
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
  XReciever
  $ifAerialAttack()
    XGoto SetAttackGoal
    XReciever
    if Equal currGoal cg_attack_reversal
      XGoto MoveToGoal
      XReciever
    elif Equal currGoal cg_attack_wall
      immediateTempVar = XSpeed * -2
      AbsStick immediateTempVar
    else
      XGoto MoveToGoal
      XReciever
    endif
  endif
Return
label common_checks
  XGoto PerFrameChecks
  XReciever

  if Equal CanCancelAttack 1 && CurrAction >= hex(0x18) && CurrAction <= hex(0x34)
    Seek finish
    Jump
  elif CurrAction <= hex(0x20) && !(Equal CurrAction hex(0x18))
    Seek finish
    Jump
  endif

  if OFramesHitlag <= 0 && OFramesHitstun > 0
    framesAfterHitlag += 1
    if Equal framesAfterHitlag 2
      immediateTempVar = (1 - (LevelValue / 50)) * 1.3

      ADJUST_PERSONALITY idx_aggression 0.002 immediateTempVar
      if currGoal >= cg_circleCamp && currGoal < calc(cg_circleCamp + 1)
        ADJUST_PERSONALITY idx_circleCampChance 0.0015 immediateTempVar
        if Equal currGoal cg_camp_attack
          ADJUST_PERSONALITY idx_aggression 0.002 immediateTempVar
        endif
      elif currGoal >= cg_attack && currGoal < calc(cg_attack + 1)
        ADJUST_PERSONALITY idx_baitChance -0.001 immediateTempVar
        ADJUST_PERSONALITY idx_aggression 0.001 immediateTempVar
        if Equal currGoal cg_attack_reversal
          ADJUST_PERSONALITY idx_aggression 0.005 immediateTempVar
        elif Equal currGoal cg_attack_overshoot || Equal currGoal cg_attack_undershoot
          ADJUST_PERSONALITY idx_baitChance 0.001 immediateTempVar
        elif Equal currGoal cg_attack_wall
          ADJUST_PERSONALITY idx_baitChance 0.002 immediateTempVar
          ADJUST_PERSONALITY idx_circleCampChance 0.002 immediateTempVar
        endif
      elif Equal currGoal cg_bait_attack
        ADJUST_PERSONALITY idx_baitChance 0.001 immediateTempVar
      endif

      if OKBSpeed > 3
        if CHANCE_MUL_LE PT_AGGRESSION 0.6
          currGoal = cg_attack
        else
          currGoal = cg_bait_dashdance
        endif
      else
        currGoal = cg_attack
      endif  

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

  // just for those with FSM
  immediateTempVar = AnimFrame * 0.8
  if Equal scriptVariant sv_execute_fastfall && Equal AirGroundState 2 && YSpeed < 0 && FramesHitlag <= 0
    AbsStick 0 (-1)
    scriptVariant = sv_none
  elif Equal IsOnStage 1 && immediateTempVar > lastHitFrame && LevelValue >= LV8 && Equal AirGroundState 2
    immediateTempVar = EndFrame - AnimFrame 
    if YSpeed <= 0 && immediateTempVar > 5 && Equal CurrAction hex(0x33)
      AbsStick 0 (-1)
    endif
  endif
  {COMMON_EXTENSION}
Return
label finish
  lastAttack = -1
  scriptVariant = sv_none
  skipMainInit = -100
  currGoal = -1
  if Equal HitboxConnected 1 || OFramesHitlag > 0 || OFramesHitstun > 0 || CHANCE_MUL_LE PT_AGGRESSION 0.1
    XGoto CalcAttackGoal
    XReciever
    if XDistLE 40 && OFramesHitstun <= 1
      currGoal = cg_attack_wall
    else
      skipMainInit = mainInitSkip
      currGoal = cg_attack_reversal
    endif
  elif CHANCE_MUL_LE PT_BAITCHANCE 0.2
    skipMainInit = mainInitSkip
    currGoal = cg_bait_dashdance
  endif
  CallI MainHub
Return
Return