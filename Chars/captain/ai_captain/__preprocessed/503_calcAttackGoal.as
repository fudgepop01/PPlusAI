#include <Definition_AIMain.h>
id 0x8503
unk 0x0

str "*"
str "SELECT MOVE"
str "move"
str "priority"

var21 = 16


DynamicDiceClear

DynamicDiceAdd 1
if ODamage >= 40
  DynamicDiceAdd 1
  if ODamage >= 70
    DynamicDiceAdd 1
    if ODamage >= 100
      DynamicDiceAdd 1
      if ODamage >= 130
        DynamicDiceAdd 1
      endif
    endif
  endif
endif
var22 = OTopNY - TopNY
if OCurrAction >= 26 && OCurrAction <= 29
  DynamicDiceAdd 5
  DynamicDiceAdd 5
  DynamicDiceAdd 5
elif OFramesHitstun <= 0 && var22 < 30 && Equal HitboxConnected 0
  predictAverage var22 10 LevelValue
  var22 += 15
  if !(ODistLE var22) && OYDistBackEdge > -35 
    DynamicDiceAdd 9
    DynamicDiceAdd 9
    DynamicDiceAdd 5
  endif

  if 17 <= OCurrAction && OCurrAction <= 21
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
      DynamicDiceAdd 7
    endif
  else 
    DynamicDiceAdd 8
    DynamicDiceAdd 8
    DynamicDiceAdd 1
    DynamicDiceAdd 2
    DynamicDiceAdd 2
    DynamicDiceAdd 2
  endif
  DynamicDiceAdd 2
  DynamicDiceAdd 3
else
  DynamicDiceAdd 2
  DynamicDiceAdd 2
  DynamicDiceAdd 1
  GetYDistFloorOffset var22 40 5 1
  GetYDistFloorOffset var17 (-40) 5 1
  if Equal var22 -1 || Equal var17 -1
    DynamicDiceAdd 8
    DynamicDiceAdd 1
  endif
  if OYDistBackEdge < -42
    DynamicDiceAdd 3
    DynamicDiceAdd 3
    DynamicDiceAdd 1
    if OYDistBackEdge < -56
      DynamicDiceAdd 3
      DynamicDiceAdd 1
      DynamicDiceAdd 1
    endif
  endif
  if OYDistBackEdge > -29
    DynamicDiceAdd 2
    DynamicDiceAdd 3
    DynamicDiceAdd 3
    DynamicDiceAdd 8
  elif Equal OIsOnStage 1 && ODamage >= 70
    GetAttribute var17 33 0
    if var17 > 2
      DynamicDiceAdd 2
      DynamicDiceAdd 2
    endif
  endif
endif

if FramesHitstun > 0 || Equal CurrAction 73
  predictAverage var22 10 LevelValue
  var22 += 10
  if Equal AirGroundState 2 && ODistLE var22
    DynamicDiceClear
    DynamicDiceAdd 10
  endif
elif CalledAs FastAerial
  DynamicDiceClear
  DynamicDiceAdd 10
endif

DynamicDiceRoll var7

DynamicDiceClear


var20 = 0
Goto dashattack
Goto check_hub
var20 = 1
Goto ftilt
Goto check_hub
var20 = 2
Goto utilt
Goto check_hub
var20 = 3
Goto dtilt
Goto check_hub
var20 = 4
Goto fsmash
Goto check_hub
var20 = 5
Goto usmash
Goto check_hub
var20 = 6
Goto dsmash
Goto check_hub
var20 = 7
Goto dsmash
Goto dsmash_late
Goto check_hub
var20 = 8
Goto sspecial
Goto check_hub
var20 = 10
Goto grab
Goto fthrow
Goto check_hub
var20 = 11
Goto grab
Goto dthrow
Goto check_hub
var20 = 12
Goto grab
Goto bthrow
Goto check_hub
var20 = 13
Goto grab
Goto uthrow
Goto check_hub
var20 = 14
Goto nair
Goto check_hub
var20 = 15
Goto nair
Goto nair_hit2
Goto check_hub
var20 = 16
Goto fair
Goto check_hub
var20 = 17
Goto fair
Goto fair_weak
Goto check_hub
var20 = 18
Goto bair
Goto check_hub
var20 = 19
Goto uair
Goto check_hub
var20 = 20
Goto uair
Goto uair_tipman
Goto check_hub
var20 = 21
Goto dair
Goto check_hub
var20 = 22
Goto dair
Goto dair_spike
Goto check_hub

if Equal var7 1
//   {KILL_MOVES}
  LOGSTR 1263094784 1275068416 0 0 0
elif Equal var7 2
//   {COMBO_MOVES}
  LOGSTR 1129270528 1112473600 0 0 0
elif Equal var7 3
//   {JUGGLE_MOVES}
  LOGSTR 1247102720 1196180736 0 0 0
elif Equal var7 4
//   {TECHCHASE_MOVES}
  LOGSTR 1413825280 1212368896 1095976192 0 0
elif Equal var7 5
//   {PRESSURE_MOVES}
  LOGSTR 1347568896 1397970176 1380253696 0 0
elif Equal var7 6
//   {BREAKCC_MOVES}
  LOGSTR 1112687872 1095451392 1124073472 0 0
elif Equal var7 7
//   {ESCAPE_MOVES}
  LOGSTR 1163084544 1095779584 0 0 0
elif Equal var7 8
//   {LAUNCH_MOVES}
  LOGSTR 1279350016 1313032192 0 0 0
elif Equal var7 9
    
//   {SPACING_MOVES}
  LOGSTR 1397768448 1128595456 0 0 0

  if Rnd < 0.6000000000000001 && OYDistBackEdge > -30 && OFramesHitstun <= 0 && Equal HitboxConnected 0
    var21 = 16.3
  endif
elif Equal var7 10
var20 = 14
Goto nair
Goto fastCheck
var20 = 15
Goto nair
Goto nair_hit2
Goto fastCheck
var20 = 16
Goto fair
Goto fastCheck
var20 = 17
Goto fair
Goto fair_weak
Goto fastCheck
var20 = 18
Goto bair
Goto fastCheck
var20 = 19
Goto uair
Goto fastCheck
var20 = 20
Goto uair
Goto uair_tipman
Goto fastCheck
var20 = 21
Goto dair
Goto fastCheck
var20 = 22
Goto dair
Goto dair_spike
Goto fastCheck
//   {PANIC_MOVES}
  LOGSTR 1346457088 1229127680 0 0 0
endif

DynamicDiceRoll var20

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
if !(True) || Equal var20 14|| Equal var20 15|| Equal var20 16|| Equal var20 17|| Equal var20 18|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22
  // if OYDistBackEdge < -56
  //   var20 = -1
  // endif
elif YDistBackEdge < -45 || OYDistBackEdge < -20
  var20 = -1 
elif Rnd < var22 && Equal var17 3
if Equal var20 13
elif Equal var20 12
elif Equal var20 10
elif Equal var20 11
  else
    var20 = -1
  endif
endif

if Rnd < 0.4 && Equal var21 16 && Equal var23 0
  var22 = TopNX
  var17 = OTopNX
  Abs var22
  Abs var17

  if var22 < var17 && var8 > 8
    var21 = 16.3
  endif
endif

XGoto SetAttackGoal
XReciever
Return


label dashattack
LOGSTR 1684108032 1751217152 1952539392 1795162112 0
var2 = 7
var8 = -9
var3 = 1
var4 = 1
CalcKnockback var0 ODamage 10 22 90 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label ftilt
LOGSTR 1718905088 1819541504 0 0 0
var2 = 9
var8 = -2
var3 = 1
var4 = 1
CalcKnockback var0 ODamage 11 10 100 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label utilt
LOGSTR 1970563328 1819541504 0 0 0
var2 = 17
var8 = -5
var3 = 1
var4 = 1
CalcKnockback var0 ODamage 13 50 80 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label dtilt
LOGSTR 1685350656 1819541504 0 0 0
var2 = 10
var8 = -5
var3 = 1
var4 = 0
CalcKnockback var0 ODamage 12 25 75 OWeight 0
LOGVAL var0
var8 = 70
Goto __ANGLE_FIX__
Return
label fsmash
LOGSTR 1718840576 1634953216 0 0 0
var2 = 19
var8 = -2
var3 = 1
var4 = 1
CalcKnockback var0 ODamage 20 24 100 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label usmash
LOGSTR 1970498816 1634953216 0 0 0
var2 = 22
var8 = -7
var3 = 1
var4 = 1
CalcKnockback var0 ODamage 13 30 126 OWeight 0
LOGVAL var0
var8 = 90
Goto __ANGLE_FIX__
Return
label dsmash
LOGSTR 1685286144 1634953216 0 0 0
var2 = 20
var8 = -3
var3 = 1
var4 = 1
CalcKnockback var0 ODamage 18 30 100 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label dsmash_late
LOGSTR 1685286144 1634953216 1600938240 1952776192 0
var2 = 30
var8 = -2
var3 = -1
var4 = 1
CalcKnockback var0 ODamage 16 20 100 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label sspecial
LOGSTR 1936945152 1701013760 1634467840 0 0
var2 = 4
var8 = -4
var3 = 1
var4 = 1
CalcKnockback var0 ODamage 7 78 80 OWeight 0
LOGVAL var0
var8 = 90
Goto __ANGLE_FIX__
Return
label grab
LOGSTR 1735549184 1644167168 0 0 0
var2 = 7
var8 = 0
var3 = 0
var4 = 1
CalcKnockback var0 ODamage 0 0 0 OWeight 0
LOGVAL var0
var8 = 0
Goto __ANGLE_FIX__
Return
label fthrow
LOGSTR 1718904832 1919907584 0 0 0
var2 = 7
var8 = 0
var3 = 0
var4 = 1
CalcKnockback var0 ODamage 4 45 105 OWeight 0
LOGVAL var0
var8 = 45
Goto __ANGLE_FIX__
Return
label dthrow
LOGSTR 1685350400 1919907584 0 0 0
var2 = 7
var8 = 0
var3 = 0
var4 = 1
CalcKnockback var0 ODamage 7 75 34 OWeight 0
LOGVAL var0
var8 = 65
Goto __ANGLE_FIX__
Return
label bthrow
LOGSTR 1651795968 1919907584 0 0 0
var2 = 7
var8 = 0
var3 = 0
var4 = 1
CalcKnockback var0 ODamage 4 30 130 OWeight 0
LOGVAL var0
var8 = 135
Goto __ANGLE_FIX__
Return
label uthrow
LOGSTR 1970563072 1919907584 0 0 0
var2 = 7
var8 = 0
var3 = 0
var4 = 1
CalcKnockback var0 ODamage 3 70 105 OWeight 0
LOGVAL var0
var8 = 85
Goto __ANGLE_FIX__
Return
label nair
LOGSTR 1851877632 1912602624 0 0 0
var2 = 20
var8 = 8
var3 = 1
var4 = 0
CalcKnockback var0 ODamage 6 40 100 OWeight 1
LOGVAL var0
var8 = 74
Goto __ANGLE_FIX__
Return
label nair_hit2
LOGSTR 1851877632 1918855168 1769222656 0 0
var2 = 20
var8 = -9
var3 = 1
var4 = 1
CalcKnockback var0 ODamage 7 40 100 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label fair
LOGSTR 1717659904 1912602624 0 0 0
var2 = 14
var8 = 14
var3 = 1
var4 = 0
CalcKnockback var0 ODamage 18 24 100 OWeight 0
LOGVAL var0
var8 = 32
Goto __ANGLE_FIX__
Return
label fair_weak
LOGSTR 1717659904 1918859008 1700883200 0 0
var2 = 17
var8 = -13
var3 = 1
var4 = 0
CalcKnockback var0 ODamage 6 35 80 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label bair
LOGSTR 1650551040 1912602624 0 0 0
var2 = 10
var8 = -3
var3 = -1
var4 = 1
CalcKnockback var0 ODamage 14 0 100 OWeight 0
LOGVAL var0
var8 = -181
Goto __ANGLE_FIX__
Return
label uair
LOGSTR 1969318144 1912602624 0 0 0
var2 = 6
var8 = -4
var3 = 1
var4 = 1
CalcKnockback var0 ODamage 12 10 100 OWeight 0
LOGVAL var0
var8 = 361
Goto __ANGLE_FIX__
Return
label uair_tipman
LOGSTR 1969318144 1918858240 1768975616 1634598912 0
var2 = 11
var8 = -2
var3 = -1
var4 = 1
CalcKnockback var0 ODamage 10 8 80 OWeight 0
LOGVAL var0
var8 = 150
Goto __ANGLE_FIX__
Return
label dair
LOGSTR 1684105472 1912602624 0 0 0
var2 = 16
var8 = -4
var3 = 0
var4 = -1
CalcKnockback var0 ODamage 16 40 100 OWeight 0
LOGVAL var0
var8 = 270
Goto __ANGLE_FIX__
Return
label dair_spike
LOGSTR 1684105472 1918857984 1885956864 1694498816 0
var2 = 16
var8 = -4
var3 = 0
var4 = 1
CalcKnockback var0 ODamage 16 40 100 OWeight 0
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
    Goto breakCC_check
    LOGSTR 1112687872 1095451392 1124073472 0 0
  elif Equal var7 7
    Goto escapeCorner_check
    LOGSTR 1163084544 1095779584 0 0 0
  elif Equal var7 8
    Goto launch_check
    LOGSTR 1279350016 1313032192 0 0 0
  elif Equal var7 10
    Goto fastCheck
  endif
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
  Goto KCheck
  if !(True)
    label KCheck
    // LOGSTR 1262708736 1799643392 1952514048 0 0
    COS var22 var8
    var22 *= var0
    var22 *= OPos
    var22 *= 1
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
    var22 *= 1
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
    DynamicDiceAdd var20
    Goto fastCheck
    Goto dirCheck
  endif
Return
label combo_check
  if OFramesHitstun > 0
    var23 = var2 + OFramesHitstun
    EstOXCoord var5 var23
    EstOYCoord var6 var23
  else
    var5 = OTopNX
    var6 = OTopNY
  endif
  Goto KBCheck
  if !(True)
    label KBCheck
    if var0 < 65
      var1 = 0
      Return
    endif
    COS var22 var8
    var22 *= var0
    Abs var22
    var17 = 0
    var23 = 125
    if var22 < var17 || var23 < var22
      var1 = 0
      Return
    endif
    SIN var22 var8
    var22 *= var0
    var17 = 0
    var23 = 185
    if var22 < var17 || var23 < var22
      var1 = 0
      Return
    endif
    var1 = 1
    Return
  endif
  if Equal var1 1
    DynamicDiceAdd var20
    if var8 < 180 && OYDistBackEdge > -15
      DynamicDiceAdd var20
    endif
    Goto fastCheck
    Goto dirCheck
  elif var8 > 180 && OYDistBackEdge > -30
    DynamicDiceAdd var20
  endif
Return
label juggle_check
  if OFramesHitstun > 0
    var23 = var2 + OFramesHitstun
    EstOXCoord var5 var23
    EstOYCoord var6 var23
  else
    var5 = OTopNX
    var6 = OTopNY
  endif
  if var8 >= 50 && var8 <= 130
  Goto KBCheck
  if !(True)
    label KBCheck
    if var0 < 30
      var1 = 0
      Return
    endif
    COS var22 var8
    var22 *= var0
    Abs var22
    var17 = 0
    var23 = 60
    if var22 < var17 || var23 < var22
      var1 = 0
      Return
    endif
    SIN var22 var8
    var22 *= var0
    var17 = 0
    var23 = 185
    if var22 < var17 || var23 < var22
      var1 = 0
      Return
    endif
    var1 = 1
    Return
  endif
    if Equal var1 1
      DynamicDiceAdd var20
      Goto fastCheck
      Goto dirCheck
    endif
  endif
Return
label techchase_check
  if var8 >= 180 && var8 <= 360
    DynamicDiceAdd var20
    Goto dirCheck
  endif
Return
label pressure_check
  if var0 >= 25 && var0 <= 85
    DynamicDiceAdd var20
elif Equal var20 13
    DynamicDiceAdd var20
elif Equal var20 12
    DynamicDiceAdd var20
elif Equal var20 11
    DynamicDiceAdd var20
elif Equal var20 10
    DynamicDiceAdd var20
  elif var2 <= 12
    DynamicDiceAdd var20
  elif var8 > 180 && OYDistBackEdge > -30
    DynamicDiceAdd var20
  endif
Return
label breakCC_check
  if var0 >= 65 && var8 >= 0 && var8 <= 180 
    DynamicDiceAdd var20
    Goto fastCheck
    Goto dirCheck
  endif
Return
label space_check
  if var2 <= 10 && var0 >= 25
    DynamicDiceAdd var20
    Goto dirCheck
  endif
Return
label escapeCorner_check
  if var2 <= 10
    DynamicDiceAdd var20
    Goto dirCheck
  endif
Return
label launch_check
  if OFramesHitstun > 0
    var23 = var2 + OFramesHitstun
    EstOXCoord var5 var23
    EstOYCoord var6 var23
  else
    var5 = OTopNX
    var6 = OTopNY
  endif
  if var8 > 40 && var8 < 140
  Goto KBCheck
  if !(True)
    label KBCheck
    if var0 < 100
      var1 = 0
      Return
    endif
    COS var22 var8
    var22 *= var0
    Abs var22
    var17 = 0
    var23 = 100
    if var22 < var17 || var23 < var22
      var1 = 0
      Return
    endif
    SIN var22 var8
    var22 *= var0
    var17 = 50
    var23 = 250
    if var22 < var17 || var23 < var22
      var1 = 0
      Return
    endif
    var1 = 1
    Return
  endif
    if Equal var1 1
      DynamicDiceAdd var20
      Goto fastCheck
      Goto dirCheck
    endif
  endif
Return
label fastCheck
  if var2 <= 6
    DynamicDiceAdd var20
  endif
  if var2 <= 10 && var16 <= 35
    if Rnd < 0.3
      DynamicDiceAdd var20
    endif
  endif
Return
label dirCheck
  if Equal var3 0 && Equal var4 0
    DynamicDiceAdd var20
  elif Equal var3 OPos && Equal Direction OPos
    if Equal var4 0 
      DynamicDiceAdd var20
    elif Equal var4 1 && TopNY > OTopNX
      DynamicDiceAdd var20
      DynamicDiceAdd var20
    elif Equal var4 -1 && TopNY <= OTopNX
      DynamicDiceAdd var20
      DynamicDiceAdd var20
    endif 
  elif Equal var4 1 && TopNY > OTopNX
    if Equal var3 0
      DynamicDiceAdd var20
    elif Equal var3 OPos && Equal Direction OPos
      DynamicDiceAdd var20
    endif
  elif Equal var4 -1 && TopNY <= OTopNX
    if Equal var3 0
      DynamicDiceAdd var20
      DynamicDiceAdd var20
    elif Equal var3 OPos && Equal Direction OPos
      DynamicDiceAdd var20
      DynamicDiceAdd var20
    endif
  endif
Return
Return
