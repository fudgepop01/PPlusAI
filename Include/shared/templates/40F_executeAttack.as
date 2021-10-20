#include <Definition_AIMain.h>
id 0x840F
unk 0x0

XReciever

label
if Equal IsOnStage 0
  Call MainHub
  Return
endif

#let techSkill = var0
techSkill = LevelValue * 0.01
if techSkill < 0.2
  techSkill = 0.2
endif

XGoto PerFrameChecks
XReciever

if Equal AirGroundState 1
  immediateTempVar = move_xOffset + move_xRange
  if immediateTempVar < 0 && Equal Direction OPos
    immediateTempVar = OPos * -0.65
    AbsStick immediateTempVar
    Return
  elif immediateTempVar > 3 && !(Equal Direction OPos)
    immediateTempVar = OPos * 0.65
    AbsStick immediateTempVar
    Return
  endif
endif

$ifAerialAttack()
  if Equal AirGroundState 1
    ACTIONABLE_ON_GROUND

    if !(Equal CurrSubaction JumpSquat)
      Button X
    endif
    Return
  endif
endif

if Rnd > techSkill
  Return
endif

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
    scriptVariant = sv_none
    Call MainHub
  elif CurrAction <= hex(0x20)
    scriptVariant = sv_none
    Call MainHub
  endif

  if Equal scriptVariant sv_execute_fastfall && Equal AirGroundState 2 && YSpeed <= 0
    AbsStick 0 (-1)
    scriptVariant = sv_none
  endif
Return
Return