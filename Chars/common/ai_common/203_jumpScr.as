#include <Definition_AIMain.h>
id 0x8203
unk 0x0

//= XReciever

label setup
XGoto PerFrameChecks
//= XReciever
Seek setup

if CurrAction >= hex(0x1A) && CurrAction <= hex(0x1D)
elif True
  ACTIONABLE_ON_GROUND(setup)
endif

#let savedOPos = var0
savedOPos = OPos
#let shouldFullHop = var1
shouldFullHop = 0
OR globTempVar scriptVariant scriptVariant
shouldFullHop = scriptVariant - globTempVar
if !(Equal shouldFullHop 0)
  shouldFullHop = 1
  scriptVariant -= svp_jump_fullhop
  OR scriptVariant scriptVariant scriptVariant
else
  shouldFullHop = 0
endif
label jumpCommand
MOD globTempVar GameTimer 4
if Equal AirGroundState 2 || globTempVar <= 2 || Equal CurrSubaction JumpSquat
  Button X
endif
label locomotion
XGoto PerFrameChecks
//= XReciever
if !(Equal lastAttack -1) 
  NoRepeat
  STACK_PUSH scriptVariant st_function
  STACK_PUSH savedOPos st_function
  STACK_PUSH shouldFullHop st_function
  XGoto SetAttackGoal
  //= XReciever
  XGoto CheckAttackWillHit
  shouldFullHop = STACK_POP
  savedOPos = STACK_POP
  scriptVariant = STACK_POP

  //= XReciever
endif
Seek locomotion
if Equal shouldFullHop 1 && Equal CurrSubaction JumpSquat
  Button X
elif Equal YSpeed 0 && Equal AirGroundState 1
  Seek jumpCommand
endif

if Equal scriptVariant sv_jump_over
  globTempVar = OPos * 30
  GetYDistFloorOffset globTempVar globTempVar 10 1
  if Equal globTempVar -1
    scriptVariant = sv_jump_away
    Return
  endif
  if Equal AirGroundState 1
    if XSpeed > 1.5 || XSpeed < -1.5
      Stick -1
    endif
    Return
  endif
  AbsStick savedOPos
  if currGoal >= cg_attack && currGoal < calc(cg_attack + 1) || !(Equal savedOPos OPos) || YSpeed < 0
    if currGoal < cg_attack
      scriptVariant = sv_aerialdrift_away
      CallI AerialDrift
    endif
    CallI MainHub
  endif
elif Equal scriptVariant sv_jump_neutral
  if Equal AirGroundState 2
    CallI MainHub
  endif
elif Equal scriptVariant sv_jump_away
  immediateTempVar = OPos * -1
  globTempVar = immediateTempVar * 30
  GetYDistFloorOffset globTempVar globTempVar 10 0
  if Equal globTempVar -1
    if Rnd < 0.35
      scriptVariant = sv_jump_over
    else
      scriptVariant = sv_jump_neutral
    endif
    Return
  endif
  AbsStick immediateTempVar
  if YSpeed < 0 && Equal AirGroundState 2
    CallI MainHub
  endif
else
  CallI MainHub
endif
Return
Return