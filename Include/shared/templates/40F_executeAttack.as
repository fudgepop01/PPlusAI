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
  immediateTempVar = move_xOffset + move_xRange
  if immediateTempVar < DIRX_BACK && Equal Direction OPos
    immediateTempVar = OPos * -1
    AbsStick immediateTempVar
    Return
  elif immediateTempVar > DIRX_BACK && !(Equal Direction OPos)
    immediateTempVar = OPos
    AbsStick immediateTempVar
    Return
  endif
endif

if OAnimFrame < 23
  if OCurrAction >= hex(0x4E) && OCurrAction <= hex(0x52)
    Return
  elif OCurrAction >= hex(0x60) && OCurrAction <= hex(0x61)
    Return
  endif
endif
$ifLastOrigin(grab,false)
  if Equal OCurrAction hex(0x4A) || Equal OCurrAction hex(0x4D) || Equal OCurrAction hex(0x53) || Equal OCurrAction hex(0x54)
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
#let lastFrameDmg = var6
lastFrameDmg = ODamage
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
    lastAttack = -1
    scriptVariant = sv_none
    Call MainHub
  elif CurrAction <= hex(0x20)
    lastAttack = -1
    scriptVariant = sv_none
    Call MainHub
  endif

  if Equal scriptVariant sv_execute_fastfall && Equal AirGroundState 2 && YSpeed <= 0
    AbsStick 0 (-1)
    scriptVariant = sv_none
  elif Equal IsOnStage 1 && !(Equal ODamage lastFrameDmg) && LevelValue >= LV8 && Equal AirGroundState 2
    lastFrameDmg = ODamage + 1
    if YSpeed <= 0
      AbsStick 0 (-1)
    endif
  else
    lastFrameDmg = ODamage
  endif
  {COMMON_EXTENSION}
Return
Return