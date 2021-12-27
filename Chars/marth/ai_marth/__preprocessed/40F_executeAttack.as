#include <Definition_AIMain.h>
id 0x840F
unk 0x0

XReciever

label start
var7 = LevelValue * 0.01
if var7 < 0.2
  var7 = 0.2
endif

XGoto PerFrameChecks
XReciever
Seek start

if Equal AirGroundState 1
  var22 = var10 + var12
  if var22 < -3 && Equal Direction OPos
    var22 = OPos * -1
    AbsStick var22
    Return
  elif var22 > -3 && !(Equal Direction OPos)
    var22 = OPos
    AbsStick var22
    Return
  endif
endif

if OAnimFrame < 23
  if OCurrAction >= 78 && OCurrAction <= 82
    Return
  elif OCurrAction >= 96 && OCurrAction <= 97
    Return
  endif
endif
if !(True) || Equal var20 29 || Equal var20 30 || Equal var20 31 || Equal var20 32 || Equal var20 33
  if Equal OCurrAction 74 || Equal OCurrAction 77 || Equal OCurrAction 83 || Equal OCurrAction 84
    Return
  endif
endif

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

if !(True) || Equal var20 34|| Equal var20 35|| Equal var20 36|| Equal var20 37|| Equal var20 38|| Equal var20 39|| Equal var20 40|| Equal var20 41|| Equal var20 42|| Equal var20 43|| Equal var20 44|| Equal var20 45|| Equal var20 46|| Equal var20 47|| Equal var20 48|| Equal var20 49
  if Equal AirGroundState 1
    if !(Equal CurrSubaction JumpSquat)
      Button X
    endif
    Return
  endif
endif

if Rnd > var7
  Return
endif
var6 = ODamage
Cmd30
ClearStick
// {SKIP_EXEC}

if Equal var20 0
Button A
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1784766976 825373440 0 0 0
Seek jab123
Return
elif Equal var20 1
Button A
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1784766976 825373440 1601401856 1919905280 1728053248
Seek jab123_strong
Return
elif Equal var20 2
Goto execDA
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1684108032 1751217152 1952539392 1795162112 0
Seek dashattack
Return
elif Equal var20 3
Goto execDA
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1684108032 1751217152 1952539392 1801415936 1768161280
Seek dashattack_mid
Return
elif Equal var20 4
Goto execDA
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1684108032 1751217152 1952539392 1801417472 1953656576
Seek dashattack_strong
Return
elif Equal var20 5
Button A
Stick 0.7
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1718905088 1819541504 0 0 0
Seek ftilt
Return
elif Equal var20 6
Button A
Stick 0.7
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1718905088 1819565824 1937011200 1869506304 0
Seek ftilt_strong
Return
elif Equal var20 7
Button A
Stick 0 0.7
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1970563328 1819541504 0 0 0
Seek utilt
Return
elif Equal var20 8
Button A
Stick 0 0.7
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1970563328 1819565824 1937006848 1920229120 1869968384
Seek utilt_start_outer
Return
elif Equal var20 9
Button A
Stick 0 0.7
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1970563328 1819565824 1701733376 1600744960 1852142080
Seek utilt_end_inner
Return
elif Equal var20 10
Button A
Stick 0 0.7
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1970563328 1819565824 1701733376 1601139968 1952805376
Seek utilt_end_outer
Return
elif Equal var20 11
Button A
Stick 0 (-0.7)
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1685350656 1819541504 0 0 0
Seek dtilt
Return
elif Equal var20 12
Button A
Stick 0 (-0.7)
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1685350656 1819565824 1768844800 1701969920 0
Seek dtilt_inner
Return
elif Equal var20 13
Button A
Stick 0 (-0.7)
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1685350656 1819565824 1869968384 1701969920 0
Seek dtilt_outer
Return
elif Equal var20 14
Button A
Stick 1
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1718840576 1634953216 0 0 0
Seek fsmash
Return
elif Equal var20 15
Button A
Stick 1
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1718840576 1634953216 1601139968 1952805376 0
Seek fsmash_outer
Return
elif Equal var20 16
Button A
Stick 0 1
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1970498816 1634953216 0 0 0
Seek usmash
Return
elif Equal var20 17
Button A
Stick 0 1
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1970498816 1634953216 1601005824 1677721600 0
Seek usmash_mid
Return
elif Equal var20 18
Button A
Stick 0 1
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1970498816 1634953216 1601401856 1919905280 1728053248
Seek usmash_strong
Return
elif Equal var20 19
Button A
Stick 0 (-1)
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1685286144 1634953216 0 0 0
Seek dsmash
Return
elif Equal var20 20
Button A
Stick 0 (-1)
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1685286144 1634953216 1600678144 1949392640 1768844800
Seek dsmash_hit1_inner
Return
elif Equal var20 21
Button A
Stick 0 (-1)
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1685286144 1634953216 1600678144 1949392640 1869968384
Seek dsmash_hit1_outer
Return
elif Equal var20 22
Button A
Stick 0 (-1)
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1685286144 1634953216 1600678144 1949458176 1835623424
Seek dsmash_hit2_mid
Return
elif Equal var20 23
Button A
Stick 0 (-1)
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1685286144 1634953216 1600678144 1949458176 1768844800
Seek dsmash_hit2_inner
Return
elif Equal var20 24
Button A
Stick 0 (-1)
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1685286144 1634953216 1600678144 1949458176 1869968384
Seek dsmash_hit2_outer
Return
elif Equal var20 25
Button B
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1853059072 1701013760 1634467840 0 0
Seek nspecial
Return
elif Equal var20 26
Button B
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1853059072 1701013760 1634492160 1835623424 0
Seek nspecial_mid
Return
elif Equal var20 27
Button B
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1853059072 1701013760 1634492160 1937011200 1869506304
Seek nspecial_strong
Return
elif Equal var20 28
Button B
AbsStick OPos
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1936945152 1701013760 1634467840 0 0
Seek sspecial
Return
elif Equal var20 29
Button R|A
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1735549184 1644167168 0 0 0
Seek grab
Return
elif Equal var20 30
Button R|A
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1718904832 1919907584 0 0 0
Seek fthrow
Return
elif Equal var20 31
Button R|A
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1685350400 1919907584 0 0 0
Seek dthrow
Return
elif Equal var20 32
Button R|A
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1651795968 1919907584 0 0 0
Seek bthrow
Return
elif Equal var20 33
Button R|A
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1970563072 1919907584 0 0 0
Seek uthrow
Return
elif Equal var20 34
Button A
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1851877632 1912602624 0 0 0
Seek nair
Return
elif Equal var20 35
Button A
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1851877632 1918855168 1769222400 1601401856 1919905280
Seek nair_hit1_strong
Return
elif Equal var20 36
Button A
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1851877632 1918855168 1769222656 1600744960 1852142080
Seek nair_hit2_inner
Return
elif Equal var20 37
Button A
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1851877632 1918855168 1769222656 1601401856 1919905280
Seek nair_hit2_strong
Return
elif Equal var20 38
Button A
Stick 1
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1717659904 1912602624 0 0 0
Seek fair
Return
elif Equal var20 39
Button A
Stick 1
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1717659904 1918856448 1768161280 0 0
Seek fair_mid
Return
elif Equal var20 40
Button A
Stick 1
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1717659904 1918856960 1970562304 1912602624 0
Seek fair_outer
Return
elif Equal var20 41
Button A
Stick (-1) 0
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1650551040 1912602624 0 0 0
Seek bair
Return
elif Equal var20 42
Button A
Stick (-1) 0
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1650551040 1918856448 1768161280 0 0
Seek bair_mid
Return
elif Equal var20 43
Button A
Stick (-1) 0
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1650551040 1918856960 1970562304 1912602624 0
Seek bair_outer
Return
elif Equal var20 44
Button A
Stick 0 1
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1969318144 1912602624 0 0 0
Seek uair
Return
elif Equal var20 45
Button A
Stick 0 1
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1969318144 1918856448 1768161280 0 0
Seek uair_mid
Return
elif Equal var20 46
Button A
Stick 0 1
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1969318144 1918856960 1970562304 1912602624 0
Seek uair_outer
Return
elif Equal var20 47
Button A
Stick 0 (-0.6)
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1684105472 1912602624 0 0 0
Seek dair
Return
elif Equal var20 48
Button A
Stick 0 (-0.6)
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1684105472 1918856448 1768161280 0 0
Seek dair_mid
Return
elif Equal var20 49
Button A
Stick 0 (-0.6)
LOGSTR 757935360 757935360 754974720 0 0
LOGVAL PlayerNum
LOGSTR 1684105472 1918856960 1970562304 1912602624 0
Seek dair_outer
Return
endif
// IMPLEMENTATIONS
if !(True)
label jab123
Goto PFC
Goto common_checks
Seek jab123
Return
label jab123_strong
Goto PFC
Goto common_checks
Seek jab123_strong
Return
label dashattack
Goto PFC
Goto common_checks
Seek dashattack
Return
label dashattack_mid
Goto PFC
Goto common_checks
Seek dashattack_mid
Return
label dashattack_strong
Goto PFC
Goto common_checks
Seek dashattack_strong
Return
label ftilt
Goto PFC
Goto common_checks
Seek ftilt
Return
label ftilt_strong
Goto PFC
Goto common_checks
Seek ftilt_strong
Return
label utilt
Goto PFC
Goto common_checks
Seek utilt
Return
label utilt_start_outer
Goto PFC
Goto common_checks
Seek utilt_start_outer
Return
label utilt_end_inner
Goto PFC
Goto common_checks
Seek utilt_end_inner
Return
label utilt_end_outer
Goto PFC
Goto common_checks
Seek utilt_end_outer
Return
label dtilt
Goto PFC
Goto common_checks
Seek dtilt
Return
label dtilt_inner
Goto PFC
Goto common_checks
Seek dtilt_inner
Return
label dtilt_outer
Goto PFC
Goto common_checks
Seek dtilt_outer
Return
label fsmash
Goto PFC
Goto common_checks
Seek fsmash
Return
label fsmash_outer
Goto PFC
Goto common_checks
Seek fsmash_outer
Return
label usmash
Goto PFC
Goto common_checks
Seek usmash
Return
label usmash_mid
Goto PFC
Goto common_checks
Seek usmash_mid
Return
label usmash_strong
Goto PFC
Goto common_checks
Seek usmash_strong
Return
label dsmash
Goto PFC
Goto common_checks
Seek dsmash
Return
label dsmash_hit1_inner
Goto PFC
Goto common_checks
Seek dsmash_hit1_inner
Return
label dsmash_hit1_outer
Goto PFC
Goto common_checks
Seek dsmash_hit1_outer
Return
label dsmash_hit2_mid
Goto PFC
Goto common_checks
Seek dsmash_hit2_mid
Return
label dsmash_hit2_inner
Goto PFC
Goto common_checks
Seek dsmash_hit2_inner
Return
label dsmash_hit2_outer
Goto PFC
Goto common_checks
Seek dsmash_hit2_outer
Return
label nspecial
Goto PFC
if AnimFrame <= 7
  AbsStick OPos
endif
Goto common_checks
Seek nspecial
Return
label nspecial_mid
Goto PFC
if AnimFrame <= 7
  AbsStick OPos
endif
Goto common_checks
Seek nspecial_mid
Return
label nspecial_strong
Goto PFC
if AnimFrame <= 7
  AbsStick OPos
endif
Goto common_checks
Seek nspecial_strong
Return
label sspecial
Goto PFC
if AnimFrame <= 7
  AbsStick OPos
endif
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
label nair_hit1_strong
Goto PFC
Goto common_checks
Seek nair_hit1_strong
Return
label nair_hit2_inner
Goto PFC
Goto common_checks
Seek nair_hit2_inner
Return
label nair_hit2_strong
Goto PFC
Goto common_checks
Seek nair_hit2_strong
Return
label fair
Goto PFC
Goto common_checks
Seek fair
Return
label fair_mid
Goto PFC
Goto common_checks
Seek fair_mid
Return
label fair_outer
Goto PFC
Goto common_checks
Seek fair_outer
Return
label bair
Goto PFC
Goto common_checks
Seek bair
Return
label bair_mid
Goto PFC
Goto common_checks
Seek bair_mid
Return
label bair_outer
Goto PFC
Goto common_checks
Seek bair_outer
Return
label uair
Goto PFC
Goto common_checks
Seek uair
Return
label uair_mid
Goto PFC
Goto common_checks
Seek uair_mid
Return
label uair_outer
Goto PFC
Goto common_checks
Seek uair_outer
Return
label dair
Goto PFC
Goto common_checks
Seek dair
Return
label dair_mid
Goto PFC
Goto common_checks
Seek dair_mid
Return
label dair_outer
Goto PFC
Goto common_checks
Seek dair_outer
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
if !(True) || Equal var20 34|| Equal var20 35|| Equal var20 36|| Equal var20 37|| Equal var20 38|| Equal var20 39|| Equal var20 40|| Equal var20 41|| Equal var20 42|| Equal var20 43|| Equal var20 44|| Equal var20 45|| Equal var20 46|| Equal var20 47|| Equal var20 48|| Equal var20 49
    XGoto SetAttackGoal
    XReciever
    XGoto MoveToGoal
    XReciever
  endif
Return
label common_checks
  XGoto PerFrameChecks
  XReciever

  if Equal CanCancelAttack 1 && CurrAction >= 36 && CurrAction <= 52
    var20 = -1
    var16 = 0
    Call MainHub
  elif CurrAction <= 32
    var20 = -1
    var16 = 0
    Call MainHub
  endif

  if Equal var16 1 && Equal AirGroundState 2 && YSpeed <= 0
    AbsStick 0 (-1)
    var16 = 0
  elif Equal IsOnStage 1 && !(Equal ODamage var6) && LevelValue >= 75 && Equal AirGroundState 2
    var6 = ODamage + 1
    if YSpeed <= 0
      AbsStick 0 (-1)
    endif
  else
    var6 = ODamage
  endif
//   {COMMON_EXTENSION}
Return
Return
