#include <Definition_AIMain.h>
id 0x840F
unk 0x0

XReciever

label
if Equal IsOnStage 0
  Call MainHub
  Return
endif

var0 = LevelValue * 0.01
if var0 < 0.2
  var0 = 0.2
endif

XGoto PerFrameChecks
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

if !(True) || Equal var20 14|| Equal var20 15|| Equal var20 16|| Equal var20 17|| Equal var20 18|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22
  if Equal AirGroundState 1
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

    if !(Equal CurrSubaction JumpSquat)
      Button X
    endif
    Return
  endif
endif

if Rnd > var0
  Return
endif

Cmd30
ClearStick
// {SKIP_EXEC}

if Equal var20 0
Goto execDA
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1684108032 1751217152 1952539392 1795162112 0
Seek dashattack
Return
elif Equal var20 1
Button A
Stick 0.7
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1718905088 1819541504 0 0 0
Seek ftilt
Return
elif Equal var20 2
Button A
Stick 0 0.7
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1970563328 1819541504 0 0 0
Seek utilt
Return
elif Equal var20 3
Button A
Stick 0 (-0.7)
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1685350656 1819541504 0 0 0
Seek dtilt
Return
elif Equal var20 4
Button A
Stick 1
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1718840576 1634953216 0 0 0
Seek fsmash
Return
elif Equal var20 5
Button A
Stick 0 1
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1970498816 1634953216 0 0 0
Seek usmash
Return
elif Equal var20 6
Button A
Stick 0 (-1)
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1685286144 1634953216 0 0 0
Seek dsmash
Return
elif Equal var20 7
Button A
Stick 0 (-1)
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1685286144 1634953216 1600938240 1952776192 0
Seek dsmash_late
Return
elif Equal var20 8
Button B
AbsStick OPos
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1936945152 1701013760 1634467840 0 0
Seek sspecial
Return
elif Equal var20 9
Button R|A
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1735549184 1644167168 0 0 0
Seek grab
Return
elif Equal var20 10
Button R|A
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1718904832 1919907584 0 0 0
Seek fthrow
Return
elif Equal var20 11
Button R|A
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1685350400 1919907584 0 0 0
Seek dthrow
Return
elif Equal var20 12
Button R|A
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1651795968 1919907584 0 0 0
Seek bthrow
Return
elif Equal var20 13
Button R|A
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1970563072 1919907584 0 0 0
Seek uthrow
Return
elif Equal var20 14
Button A
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1851877632 1912602624 0 0 0
Seek nair
Return
elif Equal var20 15
Button A
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1851877632 1918855168 1769222656 0 0
Seek nair_hit2
Return
elif Equal var20 16
Button A
Stick 1
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1717659904 1912602624 0 0 0
Seek fair
Return
elif Equal var20 17
Button A
Stick 1
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1717659904 1918859008 1700883200 0 0
Seek fair_weak
Return
elif Equal var20 18
Button A
Stick (-1) 0
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1650551040 1912602624 0 0 0
Seek bair
Return
elif Equal var20 19
Button A
Stick 0 1
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1969318144 1912602624 0 0 0
Seek uair
Return
elif Equal var20 20
Button A
Stick 0 1
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1969318144 1918858240 1768975616 1634598912 0
Seek uair_tipman
Return
elif Equal var20 21
Button A
Stick 0 (-0.6)
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1684105472 1912602624 0 0 0
Seek dair
Return
elif Equal var20 22
Button A
Stick 0 (-0.6)
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1684105472 1918857984 1885956864 1694498816 0
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
Goto common_checks
Seek nair
Return
label nair_hit2
Goto PFC
Goto common_checks
Seek nair_hit2
Return
label fair
Goto PFC
Goto common_checks
Seek fair
Return
label fair_weak
Goto PFC
Goto common_checks
Seek fair_weak
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
label uair_tipman
Goto PFC
Goto common_checks
Seek uair_tipman
Return
label dair
Goto PFC
Goto common_checks
Seek dair
Return
label dair_spike
Goto PFC
Goto common_checks
Seek dair_spike
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
label PFC
  XGoto PerFrameChecks
  XReciever
if !(True) || Equal var20 14|| Equal var20 15|| Equal var20 16|| Equal var20 17|| Equal var20 18|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22
    XGoto SetAttackGoal
    XReciever
    XGoto MoveToGoal
    XReciever
  endif
Return
label common_checks
  if Equal CanCancelAttack 1 && CurrAction >= 36 && CurrAction <= 52
    var16 = 0
    Call MainHub
  elif CurrAction <= 32
    var16 = 0
    Call MainHub
  endif

  if Equal var16 1 && Equal AirGroundState 2 && YSpeed <= 0
    AbsStick 0 (-1)
    var16 = 0
  endif
Return
Return
