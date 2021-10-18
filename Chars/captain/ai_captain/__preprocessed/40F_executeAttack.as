#include <Definition_AIMain.h>
id 0x840F
unk 0x0

XReciever

if Equal AirGroundState 1
  var22 = var10 + var12
  if var22 < 0 && Equal Direction OPos
    var22 = OPos * -0.65
    AbsStick var22
    Return
  elif var22 > 3 && !(Equal Direction OPos)
    var22 = OPos * 0.65
    AbsStick var22
    Return
  endif
endif

Cmd30
ClearStick
if Equal var20 0
Goto execDA
Seek dashattack
Return
elif Equal var20 1
Button A
Stick 0.7
Seek ftilt
Return
elif Equal var20 2
Button A
Stick 0 0.7
Seek utilt
Return
elif Equal var20 3
Button A
Stick 0 (-0.7)
Seek dtilt
Return
elif Equal var20 4
Button A
Stick 1
Seek fsmash
Return
elif Equal var20 5
Button A
Stick 0 1
Seek usmash
Return
elif Equal var20 6
Button A
Stick 0 (-1)
Seek dsmash
Return
elif Equal var20 7
Button A
Stick 0 (-1)
Seek dsmash_late
Return
elif Equal var20 8
Button B
Stick 1
Seek sspecial
Return
elif Equal var20 9
Button R|A
Seek grab
Return
elif Equal var20 10
Button R|A
Seek fthrow
Return
elif Equal var20 11
Button R|A
Seek dthrow
Return
elif Equal var20 12
Button R|A
Seek bthrow
Return
elif Equal var20 13
Button R|A
Seek uthrow
Return
elif Equal var20 14
Button A
Seek nair
Return
elif Equal var20 15
Button A
Seek nair_hit2
Return
elif Equal var20 16
Button A
Stick 1
Seek fair
Return
elif Equal var20 17
Button A
Stick 1
Seek fair_weak
Return
elif Equal var20 18
Button A
Stick (-1) 0
Seek bair
Return
elif Equal var20 19
Button A
Stick 0 1
Seek uair
Return
elif Equal var20 20
Button A
Stick 0 1
Seek uair_tipman
Return
elif Equal var20 21
Button A
Stick 0 (-0.6)
Seek dair
Return
elif Equal var20 22
Button A
Stick 0 (-0.6)
Seek dair_spike
Return
endif
// IMPLEMENTATIONS
if !(True)
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
label dsmash_late
Goto PFC
Goto common_checks
Seek dsmash_late
Return
label sspecial
Goto PFC
Goto common_checks
Seek sspecial
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
XGoto UpdateGoal
XReciever
XGoto MoveToGoal
XReciever
Goto common_checks
Seek nair
Return
label nair_hit2
Goto PFC
XGoto UpdateGoal
XReciever
XGoto MoveToGoal
XReciever
Goto common_checks
Seek nair_hit2
Return
label fair
Goto PFC
XGoto UpdateGoal
XReciever
XGoto MoveToGoal
XReciever
Goto common_checks
Seek fair
Return
label fair_weak
Goto PFC
XGoto UpdateGoal
XReciever
XGoto MoveToGoal
XReciever
Goto common_checks
Seek fair_weak
Return
label bair
Goto PFC
XGoto UpdateGoal
XReciever
XGoto MoveToGoal
XReciever
Goto common_checks
Seek bair
Return
label uair
Goto PFC
XGoto UpdateGoal
XReciever
XGoto MoveToGoal
XReciever
Goto common_checks
Seek uair
Return
label uair_tipman
Goto PFC
XGoto UpdateGoal
XReciever
XGoto MoveToGoal
XReciever
Goto common_checks
Seek uair_tipman
Return
label dair
Goto PFC
XGoto UpdateGoal
XReciever
XGoto MoveToGoal
XReciever
Goto common_checks
Seek dair
Return
label dair_spike
Goto PFC
XGoto UpdateGoal
XReciever
XGoto MoveToGoal
XReciever
Goto common_checks
Seek dair_spike
Return
endif

Call MainHub
Return 
label execDA
  label
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
  Return
label PFC
  XGoto PerFrameChecks
  XReciever
Return
label common_checks
  if Equal CanCancelAttack 1 && CurrAction >= 36 && CurrAction <= 52
    Call MainHub
  elif CurrAction <= 32
    Call MainHub
  endif
Return
Return
