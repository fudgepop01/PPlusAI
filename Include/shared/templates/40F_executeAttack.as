#include <Definition_AIMain.h>
id 0x840F
unk 0x0

XReciever

label start
#let techSkill = var7
techSkill = LevelValue * 0.01
if techSkill < 0.2
  techSkill = 0.2
endif

XGoto PerFrameChecks
XReciever
Seek start

if Equal AirGroundState 1
  GET_CHAR_TRAIT(immediateTempVar, chr_get_moveDir)

  if immediateTempVar < 0 && Equal Direction OPos
    immediateTempVar = OPos * -1
    AbsStick immediateTempVar
    Return
  elif immediateTempVar > 0 && !(Equal Direction OPos)
    immediateTempVar = OPos
    AbsStick immediateTempVar
    Return
  endif
endif

ACTIONABLE_ON_GROUND

$ifAerialAttack()
  if Equal AirGroundState 1
    if !(Equal CurrSubaction JumpSquat)
      Button X
    endif
    Return
  endif
endif

if Rnd > techSkill
  Return
endif
#let lastHitFrame = var6
if Equal AirGroundState 1
  Seek
  Return
endif
label
Cmd30
ClearStick
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
    XGoto MoveToGoal
    XReciever
  endif
Return
label common_checks
  XGoto PerFrameChecks
  XReciever

  if Equal CanCancelAttack 1 && CurrAction >= hex(0x24) && CurrAction <= hex(0x34)
    Seek finish
    Jump
  elif CurrAction <= hex(0x20)
    Seek finish
    Jump
  endif

  if Equal OFramesHitlag 1
    ADJUST_PERSONALITY idx_aggression 0.002
    if currGoal >= cg_circleCamp && currGoal < calc(cg_circleCamp + 1)
      ADJUST_PERSONALITY idx_circleCampChance 0.015
      if Equal currGoal cg_camp_attack
        ADJUST_PERSONALITY idx_aggression 0.002
      endif
    elif currGoal >= cg_attack && currGoal < calc(cg_attack + 1)
      ADJUST_PERSONALITY idx_baitChance -0.04
      ADJUST_PERSONALITY idx_aggression 0.002
      if Equal currGoal cg_attack_reversal
        ADJUST_PERSONALITY idx_aggression 0.005
      elif Equal currGoal cg_attack_overshoot || Equal currGoal cg_attack_undershoot
        ADJUST_PERSONALITY idx_baitChance 0.01
      elif Equal currGoal cg_attack_wall
        ADJUST_PERSONALITY idx_baitChance 0.005
        ADJUST_PERSONALITY idx_circleCampChance 0.025
      endif
    elif Equal currGoal cg_bait_attack
      ADJUST_PERSONALITY idx_baitChance 0.01
    endif

    if Equal AirGroundState 2
      ADJUST_PERSONALITY idx_jumpiness 0.003
      if Rnd < 0.3
        ADJUST_PERSONALITY idx_djumpiness 0.002
      endif
    else
      ADJUST_PERSONALITY idx_jumpiness -0.002
      ADJUST_PERSONALITY idx_djumpiness -0.002
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
  endif

  // L cancel
  if !(Equal CanCancelAttack 1) && Equal AirGroundState 2 && YSpeed < -0.3 && YDistFloor < 7 && Equal CurrAction hex(0x33)
    Button R
  endif

  // just for those with FSM
  immediateTempVar = AnimFrame * 0.8
  if Equal scriptVariant sv_execute_fastfall && Equal AirGroundState 2 && YSpeed <= 0
    AbsStick 0 (-1)
    scriptVariant = sv_none
  elif Equal IsOnStage 1 && immediateTempVar > lastHitFrame && LevelValue >= LV8 && Equal AirGroundState 2
    immediateTempVar = EndFrame - AnimFrame 
    if YSpeed <= 0 && immediateTempVar > 20 && Equal CurrAction hex(0x33)
      AbsStick 0 (-1)
    endif
  endif
  {COMMON_EXTENSION}
Return
label finish
  lastAttack = -1
  scriptVariant = sv_none
  if Equal HitboxConnected 1 || OFramesHitlag > 0 || OFramesHitstun > 0 || Equal currGoal cg_attack || CHANCE_MUL_LE PT_AGGRESSION 0.25
    XGoto CalcAttackGoal
    XReciever
    skipMainInit = mainInitSkip
    currGoal = cg_attack_reversal
  elif CHANCE_MUL_LE PT_BAITCHANCE 0.75
    skipMainInit = mainInitSkip
    currGoal = cg_bait_dashdance
  endif
  CallI MainHub
Return
Return