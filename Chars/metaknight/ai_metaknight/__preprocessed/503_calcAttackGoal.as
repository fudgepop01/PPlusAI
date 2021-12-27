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
  elif !(Equal var22 3) && Rnd < var17 && Rnd < 0.6 && SamePlane
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
  if Rnd < 0.8
    DynamicDiceAdd 5
    DynamicDiceAdd 8
  else
    DynamicDiceAdd 9
  endif
  if Rnd < 0.75
    DynamicDiceAdd 11
  else
    DynamicDiceAdd 5
  endif
  if Rnd < 0.5
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
    if Rnd < 0.8 && Rnd < 0.8 && Rnd < 0.5
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
Goto dashattack
Goto check_hub
var20 = 2
Goto dashattack
Goto dashattack_weak
Goto check_hub
var20 = 3
Goto ftilt
Goto check_hub
var20 = 4
Goto ftilt
Goto ftilt2
Goto check_hub
var20 = 5
Goto ftilt
Goto ftilt3
Goto check_hub
var20 = 6
Goto utilt
Goto check_hub
var20 = 7
Goto dtilt
Goto check_hub
var20 = 8
Goto fsmash
Goto check_hub
var20 = 9
Goto usmash
Goto check_hub
var20 = 10
Goto dsmash
Goto check_hub
var20 = 11
Goto dsmash
Goto dsmash_hit2
Goto check_hub
var20 = 12
Goto dspecial
Goto check_hub
var20 = 13
Goto dspecial
Goto check_hub
var20 = 15
Goto grab
Goto fthrow
Goto check_hub
var20 = 16
Goto grab
Goto dthrow
Goto check_hub
var20 = 17
Goto grab
Goto bthrow
Goto check_hub
var20 = 18
Goto grab
Goto uthrow
Goto check_hub
var20 = 19
Goto nair
Goto check_hub
var20 = 20
Goto nair
Goto nair_med
Goto check_hub
var20 = 21
Goto nair
Goto nair_weak
Goto check_hub
var20 = 22
Goto fair
Goto check_hub
var20 = 23
Goto bair
Goto check_hub
var20 = 24
Goto uair
Goto check_hub
var20 = 25
Goto dair
Goto check_hub
  Return
endif

if !(True)
  label gen_aerial_checks
var20 = 19
Goto nair
Goto check_hub
var20 = 20
Goto nair
Goto nair_med
Goto check_hub
var20 = 21
Goto nair
Goto nair_weak
Goto check_hub
var20 = 22
Goto fair
Goto check_hub
var20 = 23
Goto bair
Goto check_hub
var20 = 24
Goto uair
Goto check_hub
var20 = 25
Goto dair
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
//   {BREAKCC_MOVES}
elif Equal var7 7
//   {ESCAPE_MOVES}
elif Equal var7 8
//   {LAUNCH_MOVES}
elif Equal var7 13
//   {POWER_MOVES}
elif Equal var7 9
//   {SPACING_MOVES}

  if Rnd < 0.6 && OYDistBackEdge > -30 && OFramesHitstun <= 0 && Equal HitboxConnected 0 && SamePlane && OFramesHitstun <= 0
    var21 = 16.3
  endif
elif Equal var7 10
//   {PANIC_MOVES}
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
if !(True) || Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25
  // if OYDistBackEdge < -50
  //   var20 = -1
  // endif
elif YDistBackEdge < -45 || OYDistBackEdge < -20
  var20 = -1 
elif Rnd < var22 && Equal var17 3
if Equal var20 18
elif Equal var20 17
elif Equal var20 15
elif Equal var20 16
  else
    var20 = -1
  endif
endif

if OCurrAction >= 66 && OCurrAction <= 89
elif Equal HitboxConnected 1 || Equal PrevAction 60
elif Rnd < 0.5 && Equal var21 16 && SamePlane && OFramesHitstun <= 0
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
var2 = 8
var9 = 14
var3 = 0
var4 = 0
var10 = -19.07
CalcKnockback var0 ODamage 3 40 100 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label dashattack
LOGSTR 1684108032 1751217152 1952539392 1795162112 0
var2 = 4
var9 = 3
var3 = 1
var4 = 0
var10 = 21.54
CalcKnockback var0 ODamage 8 40 88 OWeight 0
LOGVAL var0
var8 = 60
Goto __ANGLE_FIX__
Return
label dashattack_weak
LOGSTR 1684108032 1751217152 1952539392 1801418496 1700883200
var2 = 8
var9 = 6
var3 = 1
var4 = 0
var10 = 35.269999999999996
CalcKnockback var0 ODamage 3 20 88 OWeight 0
LOGVAL var0
var8 = 80
Goto __ANGLE_FIX__
Return
label ftilt
LOGSTR 1718905088 1819541504 0 0 0
var2 = 3
var9 = 1
var3 = 1
var4 = 0
var10 = 20.25
CalcKnockback var0 ODamage 4 0 100 OWeight 0
LOGVAL var0
var8 = 70
Goto __ANGLE_FIX__
Return
label ftilt2
LOGSTR 1718905088 1819554304 0 0 0
var2 = 10
var9 = 1
var3 = 1
var4 = 0
var10 = 17.5
CalcKnockback var0 ODamage 3 0 100 OWeight 0
LOGVAL var0
var8 = 70
Goto __ANGLE_FIX__
Return
label ftilt3
LOGSTR 1718905088 1819554560 0 0 0
var2 = 18
var9 = 1
var3 = 1
var4 = 0
var10 = 19.96
CalcKnockback var0 ODamage 5 50 113 OWeight 0
LOGVAL var0
var8 = 65
Goto __ANGLE_FIX__
Return
label utilt
LOGSTR 1970563328 1819541504 0 0 0
var2 = 8
var9 = 10
var3 = 0
var4 = 1
var10 = -9.71
CalcKnockback var0 ODamage 7 35 145 OWeight 0
LOGVAL var0
var8 = 85
Goto __ANGLE_FIX__
Return
label dtilt
LOGSTR 1685350656 1819541504 0 0 0
var2 = 6
var9 = 1
var3 = 1
var4 = 0
var10 = 22.810000000000002
CalcKnockback var0 ODamage 5 20 116 OWeight 0
LOGVAL var0
var8 = 37
Goto __ANGLE_FIX__
Return
label fsmash
LOGSTR 1718840576 1634953216 0 0 0
var2 = 25
var9 = 1
var3 = 1
var4 = 0
var10 = 18.78
CalcKnockback var0 ODamage 16 30 110 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label usmash
LOGSTR 1970498816 1634953216 0 0 0
var2 = 9
var9 = 11
var3 = 0
var4 = 1
var10 = -19.03
CalcKnockback var0 ODamage 5 40 185 OWeight 0
LOGVAL var0
var8 = 70
Goto __ANGLE_FIX__
Return
label dsmash
LOGSTR 1685286144 1634953216 0 0 0
var2 = 6
var9 = 1
var3 = 1
var4 = 0
var10 = 18.569999999999997
CalcKnockback var0 ODamage 13 50 80 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label dsmash_hit2
LOGSTR 1685286144 1634953216 1600678144 1949433856 0
var2 = 15
var9 = 1
var3 = -1
var4 = 0
var10 = -24.57
CalcKnockback var0 ODamage 13 50 93 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label dspecial
LOGSTR 1685286912 1701013760 1634467840 0 0
var2 = 26
var9 = 1
var3 = -1
var4 = 0
var10 = -17.11
CalcKnockback var0 ODamage 14 35 114 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label dspecialair
LOGSTR 1685286912 1701013760 1634492672 1769078784 0
var2 = 26
var9 = 1
var3 = -1
var4 = 0
var10 = -17.11
CalcKnockback var0 ODamage 14 35 114 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label grab
LOGSTR 1735549184 1644167168 0 0 0
var2 = 7
var9 = 0
var3 = 1
var4 = 0
var10 = 10
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
var10 = 10
CalcKnockback var0 ODamage 3 50 140 OWeight 0
LOGVAL var0
var8 = 65
Goto __ANGLE_FIX__
Return
label dthrow
LOGSTR 1685350400 1919907584 0 0 0
var2 = 7
var9 = 0
var3 = 1
var4 = 0
var10 = 10
CalcKnockback var0 ODamage 1 20 220 OWeight 0
LOGVAL var0
var8 = 52
Goto __ANGLE_FIX__
Return
label bthrow
LOGSTR 1651795968 1919907584 0 0 0
var2 = 7
var9 = 0
var3 = 1
var4 = 0
var10 = 10
CalcKnockback var0 ODamage 3 60 140 OWeight 0
LOGVAL var0
var8 = 135
Goto __ANGLE_FIX__
Return
label uthrow
LOGSTR 1970563072 1919907584 0 0 0
var2 = 7
var9 = 0
var3 = 1
var4 = 0
var10 = 10
CalcKnockback var0 ODamage 10 69 70 OWeight 0
LOGVAL var0
var8 = 90
Goto __ANGLE_FIX__
Return
label nair
LOGSTR 1851877632 1912602624 0 0 0
var2 = 3
var9 = 3
var3 = 0
var4 = 0
var10 = -9
CalcKnockback var0 ODamage 12 30 100 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label nair_med
LOGSTR 1851877632 1918856448 1701052416 0 0
var2 = 7
var9 = 8
var3 = 0
var4 = 0
var10 = -14.23
CalcKnockback var0 ODamage 9 15 100 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label nair_weak
LOGSTR 1851877632 1918859008 1700883200 0 0
var2 = 16
var9 = 12
var3 = 0
var4 = 0
var10 = -11.63
CalcKnockback var0 ODamage 4 10 100 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label fair
LOGSTR 1717659904 1912602624 0 0 0
var2 = 6
var9 = 8
var3 = 1
var4 = 0
var10 = 11.15
CalcKnockback var0 ODamage 4 30 130 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label bair
LOGSTR 1650551040 1912602624 0 0 0
var2 = 10
var9 = 1
var3 = -1
var4 = 0
var10 = -16
CalcKnockback var0 ODamage 14 30 100 OWeight 0
LOGVAL var0
var8 = -181
Goto __ANGLE_FIX__
Return
label uair
LOGSTR 1969318144 1912602624 0 0 0
var2 = 5
var9 = 1
var3 = -1
var4 = 1
var10 = -19.8
CalcKnockback var0 ODamage 8 40 105 OWeight 0
LOGVAL var0
var8 = 78
Goto __ANGLE_FIX__
Return
label dair
LOGSTR 1684105472 1912602624 0 0 0
var2 = 12
var9 = 1
var3 = 0
var4 = -1
var10 = -9.5
CalcKnockback var0 ODamage 14 30 80 OWeight 0
LOGVAL var0
var8 = 35
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
if !(True) || Equal var20 19 || Equal var20 20 || Equal var20 21
      GetAttribute var22 65 0
elif !(True) || Equal var20 22
      GetAttribute var22 66 0
elif !(True) || Equal var20 25
      GetAttribute var22 69 0
elif !(True) || Equal var20 23
      GetAttribute var22 67 0
elif !(True) || Equal var20 24
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
if !(True) || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18
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
if !(True) || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18
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
if !(True) || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18
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
elif !(True) || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18
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
if !(True) || Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25
    var22 = var16
  else
    var22 = var16 - (var2 + var9)
  endif

  if var2 <= 7 && var22 <= 10
    Goto dirCheck
  elif var2 <= 14 && var22 <= 10 && var9 >= 10
    Goto dirCheck
  elif var2 <= 11 && var22 <= 16
    if Rnd < 0.8
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
