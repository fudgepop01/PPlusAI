#include <Definition_AIMain.h>
id 0x840F
unk 0x0

XReciever

if Equal IsOnStage 0
  Call MainHub
  Return
endif

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

Cmd30
ClearStick
$generateMoveSnippets()

Call MainHub
Return 
label execDA
  label
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
  if Equal CanCancelAttack 1 && CurrAction >= hex(0x24) && CurrAction <= hex(0x34)
    Call MainHub
  elif CurrAction <= hex(0x20)
    Call MainHub
  endif
Return
Return