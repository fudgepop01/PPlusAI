#include <Definition_AIMain.h>
id 0x8503
unk 0x0

str "*"
str "SELECT MOVE"
str "move"
str "priority"

predictOOption var22 8 LevelValue 
var23 = 0
if OCurrAction >= 66 && OCurrAction <= 100
  var23 = 1
endif
if !(Equal var22 2) && !(CalledAs FastAerial) && Equal var21 16 && OFramesHitstun <= 0 && Equal var23 0
  predictOOption var22 7 LevelValue 
  predictionConfidence var17 7 LevelValue
  var17 *= 2
  if OCurrAction >= 66 && OCurrAction <= 89
  elif Equal HitboxConnected 1 || Equal PrevAction 60
  elif !(Equal var22 3) && Rnd < var17 && Rnd < 0.54 && SamePlane
    var21 = 16.3
  endif
endif

if var21 >= 16 && var21 <= 17
elif Equal var21 7.1 || Equal var21 10.1 || Equal var21 10.2 || Equal var21 13
elif !(Equal var21 16.3)
  var21 = 16
endif
if OFramesHitstun >= 1
  var21 = 16
endif


DynamicDiceClear

if ODamage >= 40
  DynamicDiceAdd 13
  if ODamage >= 70
    DynamicDiceAdd 13
    DynamicDiceAdd 1
    DynamicDiceAdd 1
  endif
endif
var22 = OTopNY - TopNY
if Equal var21 16.4
  DynamicDiceAdd 2
  DynamicDiceAdd 2
  DynamicDiceAdd 2
  DynamicDiceAdd 13
  DynamicDiceAdd 8
elif OCurrAction >= 26 && OCurrAction <= 29
  DynamicDiceAdd 5
  DynamicDiceAdd 5
elif OFramesHitstun <= 0 && var22 < 30 && Equal HitboxConnected 0
  predictAverage var22 10 LevelValue
  if !(ODistLE var22) && OYDistBackEdge > -35 
    DynamicDiceAdd 9
    DynamicDiceAdd 11
  endif

  if 17 <= OCurrAction && OCurrAction <= 21
    DynamicDiceAdd 6
    DynamicDiceAdd 6
    DynamicDiceAdd 6
  endif
  GetYDistFloorOffset var22 13 5 1
  GetYDistFloorOffset var17 (-13) 5 1
  if Equal var22 -1 || Equal var17 -1
    var17 = TopNX
    var22 = OTopNX
    Abs var17
    Abs var22
    if var17 > var22
      DynamicDiceAdd 7
    endif
  else 
    DynamicDiceAdd 2
  endif
  if Rnd < 0.6
    DynamicDiceAdd 5
    DynamicDiceAdd 8
  else
    DynamicDiceAdd 9
  endif
  if Rnd < 0.65
    DynamicDiceAdd 11
  else
    DynamicDiceAdd 5
  endif
  if Rnd < 0.45
    DynamicDiceAdd 9
  else
    DynamicDiceAdd 5
  endif
  DynamicDiceAdd 2
  DynamicDiceAdd 2
  DynamicDiceAdd 2
  DynamicDiceAdd 8
  DynamicDiceAdd 5
  DynamicDiceAdd 13
elif True
  if ODamage >= 60
    DynamicDiceAdd 1
    DynamicDiceAdd 1
    DynamicDiceAdd 13
    DynamicDiceAdd 13
    if ODamage >= 100
      DynamicDiceAdd 1
      DynamicDiceAdd 1
      DynamicDiceAdd 1
      DynamicDiceAdd 13
      DynamicDiceAdd 13
      DynamicDiceAdd 13
    endif
  endif
  DynamicDiceAdd 2
  DynamicDiceAdd 2
  DynamicDiceAdd 2
  DynamicDiceAdd 2
  DynamicDiceAdd 3
  DynamicDiceAdd 8
  DynamicDiceAdd 5
  GetYDistFloorOffset var22 40 5 1
  GetYDistFloorOffset var17 (-40) 5 1
  if Equal var22 -1 || Equal var17 -1
    DynamicDiceAdd 8
    DynamicDiceAdd 1
    DynamicDiceAdd 13
    DynamicDiceAdd 13
  endif

  if OKBAngle >= 70 && OKBAngle <= 110
    DynamicDiceAdd 3
    DynamicDiceAdd 8
    DynamicDiceAdd 8
  elif OKBAngle >= 180 
    DynamicDiceAdd 3
    DynamicDiceAdd 8
    DynamicDiceAdd 2
  endif

  if OYDistBackEdge > -26.5
    DynamicDiceAdd 2
    DynamicDiceAdd 2
    DynamicDiceAdd 2
    DynamicDiceAdd 3
    DynamicDiceAdd 8
  elif Equal OIsOnStage 1 && ODamage >= 70
    GetAttribute var17 33 0
    if var17 > 2
      DynamicDiceAdd 2
    endif
  endif
endif

if OYDistBackEdge < -14
  DynamicDiceAdd 3
  if OFramesHitstun > 0
    DynamicDiceAdd 3
    DynamicDiceAdd 3
  endif
  DynamicDiceAdd 2
  if OYDistBackEdge < -35
    DynamicDiceAdd 3
    DynamicDiceAdd 1
  endif
endif

if FramesHitstun > 0 || Equal CurrAction 73
  predictAverage var22 10 LevelValue
  var22 += 10
  if Equal AirGroundState 2 && ODistLE var22
    DynamicDiceClear
    DynamicDiceAdd 10
  endif
endif

DynamicDiceRoll var7

if Equal var21 13
  var7 = -1
endif

if CalledAs FastAerial
  var7 = 10
elif True
  if Equal var21 16.3 && Rnd < 0.65
    var7 = 9 
  elif Equal var21 10.1
    if Rnd < 0.65 && Rnd < 0.6 && Rnd < 0.5
      var7 = 5
    else
      var7 = 11
    endif
  elif Equal var21 7.1
    var7 = 12
  endif
endif
DynamicDiceClear

// #let disjointY = var11

if Equal var7 5
  if Equal AirGroundState 2
    Goto gen_aerial_checks
  else
    Goto gen_checks
  endif
elif Equal var7 10
  Goto gen_aerial_checks
elif YDistBackEdge < -15 || YSpeed > 0
  Goto gen_aerial_checks
elif OYDistBackEdge < -35 && OCurrAction >= 66 && OCurrAction <= 100 && OYSpeed > 0
  Goto gen_aerial_checks
else
  Goto gen_checks
endif

if !(True)
  label gen_checks
var20 = 0
Goto jab123
Goto check_hub
var20 = 1
Goto jab123
Goto jab123_strong
Goto check_hub
var20 = 2
Goto dashattack
Goto check_hub
var20 = 3
Goto dashattack
Goto dashattack_mid
Goto check_hub
var20 = 4
Goto dashattack
Goto dashattack_strong
Goto check_hub
var20 = 5
Goto ftilt
Goto check_hub
var20 = 6
Goto ftilt
Goto ftilt_strong
Goto check_hub
var20 = 7
Goto utilt
Goto check_hub
var20 = 8
Goto utilt
Goto utilt_start_outer
Goto check_hub
var20 = 9
Goto utilt
Goto utilt_end_inner
Goto check_hub
var20 = 10
Goto utilt
Goto utilt_end_outer
Goto check_hub
var20 = 11
Goto dtilt
Goto check_hub
var20 = 12
Goto dtilt
Goto dtilt_inner
Goto check_hub
var20 = 13
Goto dtilt
Goto dtilt_outer
Goto check_hub
var20 = 14
Goto fsmash
Goto check_hub
var20 = 15
Goto fsmash
Goto fsmash_outer
Goto check_hub
var20 = 16
Goto usmash
Goto check_hub
var20 = 17
Goto usmash
Goto usmash_mid
Goto check_hub
var20 = 18
Goto usmash
Goto usmash_strong
Goto check_hub
var20 = 19
Goto dsmash
Goto check_hub
var20 = 20
Goto dsmash
Goto dsmash_hit1_inner
Goto check_hub
var20 = 21
Goto dsmash
Goto dsmash_hit1_outer
Goto check_hub
var20 = 22
Goto dsmash
Goto dsmash_hit2_mid
Goto check_hub
var20 = 23
Goto dsmash
Goto dsmash_hit2_inner
Goto check_hub
var20 = 24
Goto dsmash
Goto dsmash_hit2_outer
Goto check_hub
var20 = 25
Goto nspecial
Goto check_hub
var20 = 26
Goto nspecial
Goto nspecial_mid
Goto check_hub
var20 = 27
Goto nspecial
Goto nspecial_strong
Goto check_hub
var20 = 28
Goto sspecial
Goto check_hub
var20 = 30
Goto grab
Goto fthrow
Goto check_hub
var20 = 31
Goto grab
Goto dthrow
Goto check_hub
var20 = 32
Goto grab
Goto bthrow
Goto check_hub
var20 = 33
Goto grab
Goto uthrow
Goto check_hub
var20 = 34
Goto nair
Goto check_hub
var20 = 35
Goto nair
Goto nair_hit1_strong
Goto check_hub
var20 = 36
Goto nair
Goto nair_hit2_inner
Goto check_hub
var20 = 37
Goto nair
Goto nair_hit2_strong
Goto check_hub
var20 = 38
Goto fair
Goto check_hub
var20 = 39
Goto fair
Goto fair_mid
Goto check_hub
var20 = 40
Goto fair
Goto fair_outer
Goto check_hub
var20 = 41
Goto bair
Goto check_hub
var20 = 42
Goto bair
Goto bair_mid
Goto check_hub
var20 = 43
Goto bair
Goto bair_outer
Goto check_hub
var20 = 44
Goto uair
Goto check_hub
var20 = 45
Goto uair
Goto uair_mid
Goto check_hub
var20 = 46
Goto uair
Goto uair_outer
Goto check_hub
var20 = 47
Goto dair
Goto check_hub
var20 = 48
Goto dair
Goto dair_mid
Goto check_hub
var20 = 49
Goto dair
Goto dair_outer
Goto check_hub
  Return
endif

if !(True)
  label gen_aerial_checks
var20 = 34
Goto nair
Goto check_hub
var20 = 35
Goto nair
Goto nair_hit1_strong
Goto check_hub
var20 = 36
Goto nair
Goto nair_hit2_inner
Goto check_hub
var20 = 37
Goto nair
Goto nair_hit2_strong
Goto check_hub
var20 = 38
Goto fair
Goto check_hub
var20 = 39
Goto fair
Goto fair_mid
Goto check_hub
var20 = 40
Goto fair
Goto fair_outer
Goto check_hub
var20 = 41
Goto bair
Goto check_hub
var20 = 42
Goto bair
Goto bair_mid
Goto check_hub
var20 = 43
Goto bair
Goto bair_outer
Goto check_hub
var20 = 44
Goto uair
Goto check_hub
var20 = 45
Goto uair
Goto uair_mid
Goto check_hub
var20 = 46
Goto uair
Goto uair_outer
Goto check_hub
var20 = 47
Goto dair
Goto check_hub
var20 = 48
Goto dair
Goto dair_mid
Goto check_hub
var20 = 49
Goto dair
Goto dair_outer
Goto check_hub
  Return
endif

if Equal var7 1
//   {KILL_MOVES}
elif Equal var7 2

elif Equal var7 3
//   {JUGGLE_MOVES}
elif Equal var7 4
//   {TECHCHASE_MOVES}
elif Equal var7 5

elif Equal var7 6

elif Equal var7 7
//   {ESCAPE_MOVES}
elif Equal var7 8

elif Equal var7 13
//   {POWER_MOVES}
elif Equal var7 9
//   {SPACING_MOVES}

  if Rnd < 0.54 && OYDistBackEdge > -30 && OFramesHitstun <= 0 && Equal HitboxConnected 0 && SamePlane && OFramesHitstun <= 0
    var21 = 16.3
  endif
elif Equal var7 10

  LOGSTR 1346457088 1229127680 0 0 0
elif Equal var7 11
//   {BAIT_MOVES}
  LOGSTR 1111574784 1409286144 0 0 0
elif Equal var7 12
//   {CAMP_MOVES}
  LOGSTR 1128353024 1342177280 0 0 0
endif

DynamicDiceRoll var20

// {ADDITIONAL_FILTERS}

if Equal var7 12
  Return
elif Equal var7 11
  Return
elif Equal var7 10 || Equal var21 13
  if !(Equal var20 -1)
    var15 = -1
    var21 = 16.4
  endif
  CallI MainHub
endif

predictionConfidence var22 9 LevelValue
predictOOption var17 9 LevelValue
var23 = 0
if OCurrAction >= 66 && OCurrAction <= 100
  var23 = 1
endif
if Rnd < var22 && Equal var17 1 && Equal var21 16 && OYDistBackEdge > -20 && OFramesHitstun <= 0 && Equal HitboxConnected 0 && Equal var23 0 
  predictOOption var22 8 LevelValue 
  if Equal var22 2
    var21 = 16.1
  elif Equal var22 3
    var21 = 16.2
  endif
endif

var22 *= 2
if !(True) || Equal var20 34|| Equal var20 35|| Equal var20 36|| Equal var20 37|| Equal var20 38|| Equal var20 39|| Equal var20 40|| Equal var20 41|| Equal var20 42|| Equal var20 43|| Equal var20 44|| Equal var20 45|| Equal var20 46|| Equal var20 47|| Equal var20 48|| Equal var20 49
  // if OYDistBackEdge < -50
  //   var20 = -1
  // endif
elif YDistBackEdge < -45 || OYDistBackEdge < -20
  var20 = -1 
elif Rnd < var22 && Equal var17 3
if Equal var20 33
elif Equal var20 32
elif Equal var20 30
elif Equal var20 31
  else
    var20 = -1
  endif
endif

if OCurrAction >= 66 && OCurrAction <= 89
elif Equal HitboxConnected 1 || Equal PrevAction 60
elif Rnd < 0.45 && Equal var21 16 && SamePlane && OFramesHitstun <= 0
  var22 = TopNX
  var17 = OTopNX
  Abs var22
  Abs var17

  if var22 < var17 && var9 > 4
    var21 = 16.3
  endif
endif

XGoto SetAttackGoal
XReciever
Return


label jab123
LOGSTR 1784766976 825373440 0 0 0
var2 = 4
var9 = 3
var3 = 1
var4 = 1
var10 = 17.259999999999998
CalcKnockback var0 ODamage 4 20 50 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label jab123_strong
LOGSTR 1784766976 825373440 1601401856 1919905280 1728053248
var2 = 4
var9 = 3
var3 = 1
var4 = 0
var10 = 23.21
CalcKnockback var0 ODamage 6 30 60 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label dashattack
LOGSTR 1684108032 1751217152 1952539392 1795162112 0
var2 = 12
var9 = 3
var3 = 1
var4 = 0
var10 = 37.59
CalcKnockback var0 ODamage 11 70 55 OWeight 0
LOGVAL var0
var8 = 110
Goto __ANGLE_FIX__
Return
label dashattack_mid
LOGSTR 1684108032 1751217152 1952539392 1801415936 1768161280
var2 = 12
var9 = 3
var3 = 1
var4 = 0
var10 = 31.93
CalcKnockback var0 ODamage 9 35 60 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label dashattack_strong
LOGSTR 1684108032 1751217152 1952539392 1801417472 1953656576
var2 = 12
var9 = 3
var3 = 1
var4 = -1
var10 = 44.209999999999994
CalcKnockback var0 ODamage 12 70 55 OWeight 0
LOGVAL var0
var8 = 110
Goto __ANGLE_FIX__
Return
label ftilt
LOGSTR 1718905088 1819541504 0 0 0
var2 = 7
var9 = 3
var3 = 1
var4 = 1
var10 = 19.35
CalcKnockback var0 ODamage 9 30 70 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label ftilt_strong
LOGSTR 1718905088 1819565824 1937011200 1869506304 0
var2 = 7
var9 = 3
var3 = 1
var4 = 1
var10 = 24.7
CalcKnockback var0 ODamage 13 60 70 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label utilt
LOGSTR 1970563328 1819541504 0 0 0
var2 = 6
var9 = 2
var3 = 1
var4 = 1
var10 = 8.860000000000001
CalcKnockback var0 ODamage 8 40 116 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label utilt_start_outer
LOGSTR 1970563328 1819565824 1937006848 1920229120 1869968384
var2 = 6
var9 = 2
var3 = 1
var4 = 1
var10 = 17.369999999999997
CalcKnockback var0 ODamage 12 50 100 OWeight 0
LOGVAL var0
var8 = 110
Goto __ANGLE_FIX__
Return
label utilt_end_inner
LOGSTR 1970563328 1819565824 1701733376 1600744960 1852142080
var2 = 9
var9 = 3
var3 = 0
var4 = 1
var10 = -4.29
CalcKnockback var0 ODamage 9 30 116 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label utilt_end_outer
LOGSTR 1970563328 1819565824 1701733376 1601139968 1952805376
var2 = 9
var9 = 3
var3 = 0
var4 = 1
var10 = -14.93
CalcKnockback var0 ODamage 13 50 100 OWeight 0
LOGVAL var0
var8 = 85
Goto __ANGLE_FIX__
Return
label dtilt
LOGSTR 1685350656 1819541504 0 0 0
var2 = 7
var9 = 2
var3 = 1
var4 = -1
var10 = 19.580000000000002
CalcKnockback var0 ODamage 9 40 40 OWeight 0
LOGVAL var0
var8 = 30
Goto __ANGLE_FIX__
Return
label dtilt_inner
LOGSTR 1685350656 1819565824 1768844800 1701969920 0
var2 = 7
var9 = 2
var3 = 1
var4 = 0
var10 = 12.850000000000001
CalcKnockback var0 ODamage 8 20 40 OWeight 0
LOGVAL var0
var8 = 30
Goto __ANGLE_FIX__
Return
label dtilt_outer
LOGSTR 1685350656 1819565824 1869968384 1701969920 0
var2 = 7
var9 = 2
var3 = 1
var4 = -1
var10 = 24.5
CalcKnockback var0 ODamage 10 50 40 OWeight 0
LOGVAL var0
var8 = 30
Goto __ANGLE_FIX__
Return
label fsmash
LOGSTR 1718840576 1634953216 0 0 0
var2 = 11
var9 = 3
var3 = 1
var4 = 1
var10 = 23.37
CalcKnockback var0 ODamage 14 60 70 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label fsmash_outer
LOGSTR 1718840576 1634953216 1601139968 1952805376 0
var2 = 11
var9 = 3
var3 = 1
var4 = 1
var10 = 28.200000000000003
CalcKnockback var0 ODamage 20 80 70 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label usmash
LOGSTR 1970498816 1634953216 0 0 0
var2 = 9
var9 = 4
var3 = 0
var4 = 0
var10 = -13.59
CalcKnockback var0 ODamage 8 100 100 OWeight 1
LOGVAL var0
var8 = 75
Goto __ANGLE_FIX__
Return
label usmash_mid
LOGSTR 1970498816 1634953216 1601005824 1677721600 0
var2 = 9
var9 = 4
var3 = 0
var4 = 1
var10 = -7.41
CalcKnockback var0 ODamage 15 30 80 OWeight 0
LOGVAL var0
var8 = 90
Goto __ANGLE_FIX__
Return
label usmash_strong
LOGSTR 1970498816 1634953216 1601401856 1919905280 1728053248
var2 = 9
var9 = 4
var3 = 0
var4 = 1
var10 = -7.31
CalcKnockback var0 ODamage 18 60 80 OWeight 0
LOGVAL var0
var8 = 90
Goto __ANGLE_FIX__
Return
label dsmash
LOGSTR 1685286144 1634953216 0 0 0
var2 = 6
var9 = 2
var3 = 1
var4 = 0
var10 = 18.63
CalcKnockback var0 ODamage 11 70 72 OWeight 0
LOGVAL var0
var8 = 75
Goto __ANGLE_FIX__
Return
label dsmash_hit1_inner
LOGSTR 1685286144 1634953216 1600678144 1949392640 1768844800
var2 = 6
var9 = 2
var3 = 1
var4 = 0
var10 = 12.780000000000001
CalcKnockback var0 ODamage 11 16 100 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label dsmash_hit1_outer
LOGSTR 1685286144 1634953216 1600678144 1949392640 1869968384
var2 = 6
var9 = 2
var3 = 1
var4 = -1
var10 = 22.98
CalcKnockback var0 ODamage 16 70 100 OWeight 0
LOGVAL var0
var8 = 70
Goto __ANGLE_FIX__
Return
label dsmash_hit2_mid
LOGSTR 1685286144 1634953216 1600678144 1949458176 1835623424
var2 = 21
var9 = 2
var3 = -1
var4 = -1
var10 = -20.54
CalcKnockback var0 ODamage 11 70 72 OWeight 0
LOGVAL var0
var8 = 75
Goto __ANGLE_FIX__
Return
label dsmash_hit2_inner
LOGSTR 1685286144 1634953216 1600678144 1949458176 1768844800
var2 = 21
var9 = 2
var3 = -1
var4 = 0
var10 = -14.89
CalcKnockback var0 ODamage 11 15 100 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label dsmash_hit2_outer
LOGSTR 1685286144 1634953216 1600678144 1949458176 1869968384
var2 = 21
var9 = 2
var3 = -1
var4 = -1
var10 = -24.89
CalcKnockback var0 ODamage 16 70 100 OWeight 0
LOGVAL var0
var8 = 75
Goto __ANGLE_FIX__
Return
label nspecial
LOGSTR 1853059072 1701013760 1634467840 0 0
var2 = 17
var9 = 5
var3 = 1
var4 = 0
var10 = 14.619999999999997
CalcKnockback var0 ODamage 7 30 100 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label nspecial_mid
LOGSTR 1853059072 1701013760 1634492160 1835623424 0
var2 = 17
var9 = 5
var3 = 0
var4 = 0
var10 = -4.05
CalcKnockback var0 ODamage 7 34 100 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label nspecial_strong
LOGSTR 1853059072 1701013760 1634492160 1937011200 1869506304
var2 = 17
var9 = 5
var3 = 1
var4 = 1
var10 = -4.02
CalcKnockback var0 ODamage 7 40 100 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label sspecial
LOGSTR 1936945152 1701013760 1634467840 0 0
var2 = 6
var9 = 2
var3 = 1
var4 = 1
var10 = 21.36
CalcKnockback var0 ODamage 4 55 25 OWeight 0
LOGVAL var0
var8 = 96
Goto __ANGLE_FIX__
Return
label grab
LOGSTR 1735549184 1644167168 0 0 0
var2 = 7
var9 = 0
var3 = 1
var4 = 0
var10 = 13.740000000000002
CalcKnockback var0 ODamage 0 0 0 OWeight 0
LOGVAL var0
var8 = 0
Goto __ANGLE_FIX__
Return
label fthrow
LOGSTR 1718904832 1919907584 0 0 0
var2 = 7
var9 = 0
var3 = 1
var4 = 0
var10 = 13.740000000000002
CalcKnockback var0 ODamage 4 70 45 OWeight 0
LOGVAL var0
var8 = 50
Goto __ANGLE_FIX__
Return
label dthrow
LOGSTR 1685350400 1919907584 0 0 0
var2 = 7
var9 = 0
var3 = 1
var4 = 0
var10 = 13.740000000000002
CalcKnockback var0 ODamage 5 65 50 OWeight 0
LOGVAL var0
var8 = 50
Goto __ANGLE_FIX__
Return
label bthrow
LOGSTR 1651795968 1919907584 0 0 0
var2 = 7
var9 = 0
var3 = 1
var4 = 0
var10 = 13.740000000000002
CalcKnockback var0 ODamage 4 70 60 OWeight 0
LOGVAL var0
var8 = 117
Goto __ANGLE_FIX__
Return
label uthrow
LOGSTR 1970563072 1919907584 0 0 0
var2 = 7
var9 = 0
var3 = 1
var4 = 0
var10 = 13.740000000000002
CalcKnockback var0 ODamage 4 60 130 OWeight 0
LOGVAL var0
var8 = 87
Goto __ANGLE_FIX__
Return
label nair
LOGSTR 1851877632 1912602624 0 0 0
var2 = 6
var9 = 1
var3 = 1
var4 = 1
var10 = -5.83
CalcKnockback var0 ODamage 4 30 40 OWeight 0
LOGVAL var0
var8 = 100
Goto __ANGLE_FIX__
Return
label nair_hit1_strong
LOGSTR 1851877632 1918855168 1769222400 1601401856 1919905280
var2 = 6
var9 = 1
var3 = 0
var4 = 0
var10 = -7.7
CalcKnockback var0 ODamage 4 30 40 OWeight 0
LOGVAL var0
var8 = 90
Goto __ANGLE_FIX__
Return
label nair_hit2_inner
LOGSTR 1851877632 1918855168 1769222656 1600744960 1852142080
var2 = 6
var9 = 15
var3 = 0
var4 = 1
var10 = -19.24
CalcKnockback var0 ODamage 10 50 80 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label nair_hit2_strong
LOGSTR 1851877632 1918855168 1769222656 1601401856 1919905280
var2 = 15
var9 = 6
var3 = 0
var4 = 0
var10 = -7.42
CalcKnockback var0 ODamage 10 50 80 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label fair
LOGSTR 1717659904 1912602624 0 0 0
var2 = 4
var9 = 3
var3 = 0
var4 = 0
var10 = -6.13
CalcKnockback var0 ODamage 9 20 70 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label fair_mid
LOGSTR 1717659904 1918856448 1768161280 0 0
var2 = 4
var9 = 3
var3 = 1
var4 = 0
var10 = 9.959999999999999
CalcKnockback var0 ODamage 10 30 70 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label fair_outer
LOGSTR 1717659904 1918856960 1970562304 1912602624 0
var2 = 4
var9 = 3
var3 = 1
var4 = 1
var10 = 15.329999999999998
CalcKnockback var0 ODamage 13 42 70 OWeight 0
LOGVAL var0
var8 = 67
Goto __ANGLE_FIX__
Return
label bair
LOGSTR 1650551040 1912602624 0 0 0
var2 = 7
var9 = 4
var3 = -1
var4 = 1
var10 = -16.32
CalcKnockback var0 ODamage 9 10 70 OWeight 0
LOGVAL var0
var8 = -181
Goto __ANGLE_FIX__
Return
label bair_mid
LOGSTR 1650551040 1918856448 1768161280 0 0
var2 = 7
var9 = 4
var3 = -1
var4 = 1
var10 = -21.28
CalcKnockback var0 ODamage 10 30 70 OWeight 0
LOGVAL var0
var8 = -181
Goto __ANGLE_FIX__
Return
label bair_outer
LOGSTR 1650551040 1918856960 1970562304 1912602624 0
var2 = 7
var9 = 4
var3 = -1
var4 = 1
var10 = -26.66
CalcKnockback var0 ODamage 13 30 70 OWeight 0
LOGVAL var0
var8 = -181
Goto __ANGLE_FIX__
Return
label uair
LOGSTR 1969318144 1912602624 0 0 0
var2 = 5
var9 = 3
var3 = 0
var4 = 1
var10 = -12.11
CalcKnockback var0 ODamage 9 18 70 OWeight 0
LOGVAL var0
var8 = 80
Goto __ANGLE_FIX__
Return
label uair_mid
LOGSTR 1969318144 1918856448 1768161280 0 0
var2 = 5
var9 = 3
var3 = 0
var4 = 1
var10 = -15.28
CalcKnockback var0 ODamage 10 30 70 OWeight 0
LOGVAL var0
var8 = 80
Goto __ANGLE_FIX__
Return
label uair_outer
LOGSTR 1969318144 1918856960 1970562304 1912602624 0
var2 = 5
var9 = 3
var3 = 0
var4 = 1
var10 = -17.71
CalcKnockback var0 ODamage 13 40 70 OWeight 0
LOGVAL var0
var8 = 90
Goto __ANGLE_FIX__
Return
label dair
LOGSTR 1684105472 1912602624 0 0 0
var2 = 6
var9 = 3
var3 = 0
var4 = 0
var10 = -11.79
CalcKnockback var0 ODamage 9 20 70 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label dair_mid
LOGSTR 1684105472 1918856448 1768161280 0 0
var2 = 6
var9 = 3
var3 = 0
var4 = -1
var10 = -16.58
CalcKnockback var0 ODamage 10 40 70 OWeight 0
LOGVAL var0
var8 = 80
Goto __ANGLE_FIX__
Return
label dair_outer
LOGSTR 1684105472 1918856960 1970562304 1912602624 0
var2 = 6
var9 = 3
var3 = 0
var4 = -1
var10 = -21
CalcKnockback var0 ODamage 13 40 70 OWeight 0
LOGVAL var0
var8 = 290
Goto __ANGLE_FIX__
Return
label __ANGLE_FIX__
if var8 > 180 && Equal OAirGroundState 1
  if Equal var8 361
    if var0 < 32
      var8 = 0
    else
      var8 = 44
    endif
  endif
elif Equal var8 361
  var8 = 45
endif
Return
Return

label check_hub

  if YDistBackEdge >= -20
if !(True) || Equal var20 34 || Equal var20 35 || Equal var20 36 || Equal var20 37
      GetAttribute var22 65 0
elif !(True) || Equal var20 38 || Equal var20 39 || Equal var20 40
      GetAttribute var22 66 0
elif !(True) || Equal var20 47 || Equal var20 48 || Equal var20 49
      GetAttribute var22 69 0
elif !(True) || Equal var20 41 || Equal var20 42 || Equal var20 43
      GetAttribute var22 67 0
elif !(True) || Equal var20 44 || Equal var20 45 || Equal var20 46
      GetAttribute var22 68 0
    endif
    var22 *= 0.5

    if var22 <= var16
      var16 = var22
    endif
  endif

  if Equal var7 1
    Goto kill_check
    LOGSTR 1263094784 1275068416 0 0 0
  elif Equal var7 2
    Goto combo_check
    LOGSTR 1129270528 1112473600 0 0 0
  elif Equal var7 3
    Goto juggle_check
    LOGSTR 1247102720 1196180736 0 0 0
  elif Equal var7 4
    Goto techchase_check
    LOGSTR 1413825280 1212368896 1095976192 0 0
  elif Equal var7 5
    Goto pressure_check
    LOGSTR 1347568896 1397970176 1380253696 0 0
  elif Equal var7 6
if !(True) || Equal var20 29 || Equal var20 30 || Equal var20 31 || Equal var20 32 || Equal var20 33
      Goto combo_check
    endif
    Goto combo_check
    LOGSTR 1112687872 1095451392 1124073472 0 0
  elif Equal var7 7
    Goto escapeCorner_check
    LOGSTR 1163084544 1095779584 0 0 0
  elif Equal var7 8
    Goto launch_check
    LOGSTR 1279350016 1313032192 0 0 0
  elif Equal var7 9
    Goto space_check
    LOGSTR 1397768448 1128595456 0 0 0
  elif Equal var7 13
    Goto power_check
    LOGSTR 1347376896 1163001856 0 0 0
  elif Equal var7 10 || Equal var21 13
if !(True) || Equal var20 29 || Equal var20 30 || Equal var20 31 || Equal var20 32 || Equal var20 33
    else
      Goto fastCheck
    endif
  elif Equal var7 11
    Goto bait_check
  endif

  PRINTLN
Return
label kill_check
  if OFramesHitstun > 0
    var23 = var2 + OFramesHitstun
    EstOXCoord var5 var23
    EstOYCoord var6 var23
  else
    var5 = OTopNX
    var6 = OTopNY
  endif
  Goto __KILL__
  if !(True)
    label __KILL__
    // LOGSTR 1262708736 1799643392 1952514048 0 0
    COS var22 var8
    var22 *= var0
    var22 *= OPos
    var22 *= 0.03
    var17 = RBoundary - (var5)
    // LOGSTR 1380057088 0 0 0 0
    // LOGVAL var22
    // LOGVAL var17
    if var22 > var17
      var1 = 1
      Return
    endif
    var17 = LBoundary - (var5)
    // LOGSTR 1279393792 0 0 0 0
    // LOGVAL var22
    // LOGVAL var17
    if var22 < var17
      var1 = 1
      Return
    endif
    var17 = TBoundary - (var6)
    SIN var22 var8
    var22 *= var0
    var22 *= 0.03
    // LOGSTR 1413611520 0 0 0 0
    // LOGVAL var22
    // LOGVAL var17
    if var22 > var17
      var1 = 1
      Return
    endif
    var1 = 0
    Return
  endif
  if Equal var1 1
    Goto dirCheck
    Goto dirCheck
  endif
Return
label combo_check
  Goto kill_check

  var22 = var16 - (var2 + var9)
  var17 = var0 * 0.4
  if OYDistBackEdge > -4 && var0 <= 110
    var22 += 10 // leeway room (CC)
  else
    var22 += 0 // leeway room
  endif
  LOGSTR 1212765184 1398035712 1308622848 0 0
  LOGVAL var17
  LOGSTR 1279608064 1463900416 0 0 0
  LOGVAL var22
  PRINTLN
  if var22 < var17
    var23 = var0 * 0.4
    GetAttribute var22 33 0
    var22 *= var23
    GetAttribute var17 14 0
    var17 *= var23

    var23 = (var0 * 0.03)
    if var8 > 230 && var8 < 310
      if var22 > var23 || var17 > var23
        Goto dirCheck
      endif
    elif var8 > 65 && var8 < 115 && var17 > var23
      Goto dirCheck
    endif

    // var17 = var16 - (var2 + var9)
    GetAttribute var22 7 0
    var22 *= var0 * 0.4
    var23 = (var0 * 0.03)
    if var8 > 230 && var8 < 310
    elif var8 > 65 && var8 < 115
    elif var22 > var23
      Goto dirCheck
    endif
  endif
Return
label juggle_check
  var23 = OYDistBackEdge * -2
  if var8 > 230 && var8 < 310 && var23 < var0
    Goto dirCheck
  elif var8 > 65 && var8 < 115
    Goto dirCheck
  endif
Return
label techchase_check
  Goto dirCheck
Return
label pressure_check
if !(True) || Equal var20 29 || Equal var20 30 || Equal var20 31 || Equal var20 32 || Equal var20 33
    Goto combo_check
  elif var0 >= 35
    if var2 <= 12
      Goto fastCheck
    elif var8 > 180 && OYDistBackEdge > -60
      Goto fastCheck
    endif
  endif
Return
label breakCC_check
  if var0 >= 90
    Goto dirCheck
  endif
Return
label space_check
  var22 = var16 - (var2 + var9)
  if var0 < 55 || var22 >= 20
elif !(True) || Equal var20 29 || Equal var20 30 || Equal var20 31 || Equal var20 32 || Equal var20 33
  else
    Goto dirCheck
  endif
Return
label power_check
  Goto kill_check
  if var8 <= 65 && var0 >= 200
    Goto dirCheck
  endif
Return
label escapeCorner_check
  if var2 <= 15
    Goto fastCheck
  endif
Return
label launch_check
  if var0 >= 250
    Goto dirCheck
  endif
Return
label bait_check
  var22 = var16 - (var2 + var9)
  if var22 < 25 && var2 < 35
    Goto fastCheck
  endif 
Return
label fastCheck
if !(True) || Equal var20 34|| Equal var20 35|| Equal var20 36|| Equal var20 37|| Equal var20 38|| Equal var20 39|| Equal var20 40|| Equal var20 41|| Equal var20 42|| Equal var20 43|| Equal var20 44|| Equal var20 45|| Equal var20 46|| Equal var20 47|| Equal var20 48|| Equal var20 49
    var22 = var16
  else
    var22 = var16 - (var2 + var9)
  endif

  if var2 <= 7 && var22 <= 10
    Goto dirCheck
  elif var2 <= 14 && var22 <= 10 && var9 >= 10
    Goto dirCheck
  elif var2 <= 11 && var22 <= 16
    if Rnd < 0.65
      Goto dirCheck
    endif
  endif
Return
label dirCheck
  var22 = OTopNY - TopNY
  if OFramesHitstun <= 0 && var22 < 30 && Equal HitboxConnected 0 && !(Equal var7 10)
    var10 *= var17
    var22 = OTopNX - TopNX
    Abs var22
    var22 *= 2
    if OYDistBackEdge > -35
      if var10 >= var22
        DynamicDiceAdd var20
        DynamicDiceAdd var20
      endif
      var22 *= -1
      if var10 <= var22
        DynamicDiceAdd var20
        DynamicDiceAdd var20
      endif
      if !(Equal var7 5)
        if var10 > 1 && Equal Direction OPos
          DynamicDiceAdd var20
          if var10 > 3
            DynamicDiceAdd var20
            if var10 > 5
              DynamicDiceAdd var20
              if var10 > 7
                DynamicDiceAdd var20
                if var10 > 9
                  DynamicDiceAdd var20
                  if var10 > 11
                    DynamicDiceAdd var20
                  endif
                endif
              endif
            endif
          endif
        elif var10 < -1 && !(Equal Direction OPos)
          DynamicDiceAdd var20
          if var10 < -3
            DynamicDiceAdd var20
            if var10 < -5
              DynamicDiceAdd var20
              if var10 < -7
                DynamicDiceAdd var20
                if var10 < -9
                  DynamicDiceAdd var20
                  if var10 < -11
                    DynamicDiceAdd var20
                  endif
                endif
              endif
            endif
          endif
        endif
      endif
    endif
    if var3 >= 0 && var8 > 230 && var8 < 310
      DynamicDiceAdd var20
      DynamicDiceAdd var20
      if var14 <= 15
        DynamicDiceAdd var20
        if var14 <= 10
          DynamicDiceAdd var20
          if var14 <= 5
            DynamicDiceAdd var20
          endif
        endif
      endif
    elif var8 > 65 && var8 < 115 && Equal var4 1 && TopNY < OTopNY && Equal var7 3
      DynamicDiceAdd var20
      if var14 <= 15
        DynamicDiceAdd var20
        if var14 <= 10
          DynamicDiceAdd var20
          if var14 <= 5
            DynamicDiceAdd var20
          endif
        endif
      endif
    endif
  else
    var22 = Direction * OPos
    if Equal var3 0 && Equal var4 0
      DynamicDiceAdd var20
      DynamicDiceAdd var20
    elif Equal var3 var22
      if Equal var4 0 
        DynamicDiceAdd var20
        DynamicDiceAdd var20
      elif Equal var4 1 && OTopNY > TopNY
        DynamicDiceAdd var20
        DynamicDiceAdd var20
      elif Equal var4 -1 && OTopNY <= TopNY
        DynamicDiceAdd var20
        DynamicDiceAdd var20
      endif
    elif Equal var4 1 && OTopNY > TopNY
      if Equal var3 0
        DynamicDiceAdd var20
        DynamicDiceAdd var20
      elif Equal var3 var22
        DynamicDiceAdd var20
        DynamicDiceAdd var20
      endif
    elif Equal var4 -1 && OTopNY <= TopNY
      if Equal var3 0
        DynamicDiceAdd var20
        DynamicDiceAdd var20
      elif Equal var3 var22
        DynamicDiceAdd var20
        DynamicDiceAdd var20
      endif
    endif
    if var3 >= 0 && var8 > 230 && var8 < 310
      DynamicDiceAdd var20
      DynamicDiceAdd var20
      if var14 <= 15
        DynamicDiceAdd var20
        if var14 <= 10
          DynamicDiceAdd var20
          if var14 <= 5
            DynamicDiceAdd var20
          endif
        endif
      endif
    elif var8 > 65 && var8 < 115 && Equal var4 1 && TopNY < OTopNY && Equal var7 3
      DynamicDiceAdd var20
      if var14 <= 15
        DynamicDiceAdd var20
        if var14 <= 10
          DynamicDiceAdd var20
          if var14 <= 5
            DynamicDiceAdd var20
          endif
        endif
      endif
    endif
  endif
Return
Return
