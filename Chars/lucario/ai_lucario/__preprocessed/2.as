// COMBO HUB
// a place for determining the next best attack when an opponent is in hitstun
#include <Definition_AIMain.h>
id 0x8002

unk 0x0

// each var20 corresponds to a move routine... so like 6031 means jab
// was the last move used...


ClearStick
var21 = 32770


if OIsCharOf Bowser
  var8 = 113
  var0 = 0.13
elif OIsCharOf Falcon
  var8 = 104
  var0 = 0.13
elif OIsCharOf Lizardon // Charizard
  var8 = 106
  var0 = 0.105
elif OIsCharOf Diddy
  var8 = 85
  var0 = 0.12
elif OIsCharOf Donkey
  var8 = 109
  var0 = 0.1
elif OIsCharOf Falco
  var8 = 80
  var0 = 0.17
elif OIsCharOf Fox
  var8 = 75
  var0 = 0.23
  // 2.8
elif OIsCharOf Gamewatch
  var8 = 75
  var0 = 0.095
elif OIsCharOf Ganondorf
  var8 = 109
  var0 = 0.13
// GIGA BOWSER WOULD GO HERE
// elif OIsCharOf Bowser
//   var8 = 113
//   var0 = 0.13
elif OIsCharOf Nana || OIsCharOf Popo
  var8 = 88
  var0 = 0.1
elif OIsCharOf Ike
  var8 = 100
  var0 = 0.103
elif OIsCharOf Fushigisou // Ivysaur
  var8 = 85
  var0 = 0.075
elif OIsCharOf Purin // Jigglypuff
  var8 = 62
  var0 = 0.064
elif OIsCharOf DDD // King Dedede
  var8 = 107
  var0 = 0.095
elif OIsCharOf Kirby
  var8 = 74
  var0 = 0.08
elif OIsCharOf Knuckles
  var8 = 90
  var0 = 0.14
elif OIsCharOf Link
  var8 = 104
  var0 = 0.11
elif OIsCharOf Lucario
  var8 = 94
  var0 = 0.125
elif OIsCharOf Lucas
  var8 = 80
  var0 = 0.125
elif OIsCharOf Luigi
  var8 = 100
  var0 = 0.069 // nice
  // 1.6
elif OIsCharOf Mario
  var8 = 100
  var0 = 0.095 // 1.7
elif OIsCharOf Marth
  var8 = 87
  var0 = 0.085
elif OIsCharOf Metaknight
  var8 = 79
  var0 = 0.11
elif OIsCharOf Mewtwo
  var8 = 90
  var0 = 0.082
elif OIsCharOf Ness
  var8 = 94
  var0 = 0.09
elif OIsCharOf Pikmin // Olimar
  var8 = 90
  var0 = 0.09
elif OIsCharOf Peach
  var8 = 90
  var0 = 0.08
elif OIsCharOf Pikachu
  var8 = 80
  var0 = 0.11
elif OIsCharOf Pit
  var8 = 80
  var0 = 0.095
elif OIsCharOf Robot // ROB
  var8 = 104
  var0 = 0.09
elif OIsCharOf Roy
  var8 = 85
  var0 = 0.114
elif OIsCharOf Samus
  var8 = 110
  var0 = 0.66
elif OIsCharOf Shiek
  var8 = 90
  var0 = 0.12
elif OIsCharOf Snake
  var8 = 105
  var0 = 0.098
elif OIsCharOf Sonic
  var8 = 82
  var0 = 0.122
elif OIsCharOf Zenigame // Squirtle
  var8 = 85
  var0 = 0.126
elif OIsCharOf Toonlink
  var8 = 85
  var0 = 0.11
elif OIsCharOf Wario
  var8 = 102
  var0 = 0.112
// WARIO MAN GOES HERE
// elif OIsCharOf Bowser
//   var8 = 113
//   var0 = 0.13
elif OIsCharOf Wolf
  var8 = 85
  var0 = 0.16
elif OIsCharOf Yoshi
  var8 = 108
  var0 = 0.093
elif OIsCharOf Zelda
  var8 = 90
  var0 = 0.073
elif OIsCharOf ZSS // Zero Suit Samus
  var8 = 85
  var0 = 0.135
endif

var8 = var8 - 200
var8 *= -1
var8 /= 100
var8 *= ODamage

if Equal var18 255
  Seek contCombo
  Jump
endif
var18 = 0
var16 = 0

var1 = OTopNY - TopNY



if Equal var16 -1
  var16 = 65535
endif

LOGSTR 1398030592 1381236736 0 0 0

  // if Equal var20 24636
  //   if Equal var19 4
  //     // if var8 > 50
  //     //   if XDistLE 20
  //     //     Call FAir
  //     //   else
  //     //     Call UAir
  //     //   endif
  //     // elif var1 > 25
  //     //   Call UAir
  //     // else
  //     //   Call NAir
  //     // endif
  //   elif Equal var19 2
  //     if var8 > 50 && var1 > 25
  //       Call FAir
  //     elif var1 > 25 && OYSpeed > 0.15
  //       Call UAir
  //     endif
  //     var0 = Rnd * 3
  //     if var8 > 40 && var0 < 2
  //       Call DAir
  //     else
  //       var19 = 1
  //       Call Grab
  //     endif
  //   endif
  // endif
  if !(Equal var16 255) && Equal HitboxConnected 1
    LOGSTR 1667329536 1667591168 0 0 0
    LOGVAL var20
    label _begin_immediates
    var18 = 1
    var7 = 10
    if Equal var20 24625 || Equal var20 24638
      var7 = 8
      label _tilts
      var1 = Rnd * 6
      LOGVAL var7
      LOGSTR 1953065984 1953693696 0 0 0
      if var1 < 1
        Goto dtilt
      elif var1 < 2
        Goto ftilt
      elif var1 < 3
        Goto utilt
      else
        Goto clear
      endif
      Goto analyze
      var7 -= 1
      if var7 <= 0
        Seek _smEntry
      else
        Seek _tilts
      endif
      Jump
    endif
    if var20 >= 24626 && var20 <= 24628
      label _smEntry
      var7 = 8
      label _smashes
      LOGVAL var7
      LOGSTR 1936548096 1936221440 1929379840 0 0
      var1 = Rnd * 6
      if var1 < 1
        Goto fsmash
      elif var1 < 2
        Goto dsmash
      elif var1 < 3
        Goto usmash
        if Rnd < 0.7
          var19 = 1
        endif
      else
        Goto clear
      endif
      Goto analyze
      var7 -= 1
      if var7 <= 0
        Seek _spEntry
      else
        Seek _smashes
      endif
      Jump
    endif
    if var20 >= 24641 && var20 <= 24645
      Seek _spEntry
      Jump
    endif
    if var20 >= 24629 && var20 <= 24631
      label _spEntry
      var7 = 10
      LOGVAL var7
      label _specials
      var19 = 0
      var1 = Rnd * 18
      if var1 < 2
        Goto nspecial      
      elif var1 < 6
        if Equal Direction 1 && OKBXSpeed > 0.7
          Call DSpecial
        elif Equal Direction -1 && OKBXSpeed < -0.7
          Call DSpecial
        else
          Goto clear
        endif
      elif var1 < 8
        Goto sspecial
        if var8 > 80 && Equal AirGroundState 1
          var19 = 1
        elif var8 > 40 && Equal AirGroundState 2 && Equal OIsOnStage 0
          var19 = 2
        endif
      elif var1 < 11 && OKBSpeed > 2.95 && OKBYSpeed > 0 && OKBXSpeed >= -2 && OKBXSpeed <= 2 && !(Equal OXDistBackEdge OXDistFrontEdge)
        Call USpecial
      else
        Goto clear
      endif
      Goto analyze
      var7 -= 1
      if var7 <= 0
        if LevelValue >= 48 && Rnd < 0.1
          var19 = 1
          Goto nspecial
          Call NSpecial
        elif LevelValue >= 42 && NumFrames >= 5
          var19 = 1
          Goto nspecial
          Call NSpecial
        endif
        if NumFrames < 5
          Seek _begin_immediates
          Return
        else
          Seek _end
        endif
      else
        Seek _specials
      endif
      Jump
    endif
  endif
  label _end
  var18 = 0
  if Equal var16 255
    var6 = 15
    var18 = 1
    Seek contCombo
    Jump
  endif

LOGSTR 1095128064 1598903040 1124073472 0 0

if OYDistBackEdge > -5 && Equal OCurrAction 73 && Rnd < 0.3 && !(Equal OXDistFrontEdge OXDistBackEdge) && Equal OIsOnStage 1
  LOGSTR 1413699328 0 0 0 0
  Seek techChase_wait
  Jump
endif
LOGSTR 1129270784 1412300800 0 0 0
Seek contCombo
Jump
Return

label techChase_wait
  SetTimeout 300
  var0 = Rnd * 60
  var1 = 0
  if Damage < 80
    var2 = 10
  else
    var2 = 25
  endif
  var17 = Rnd
  label
  if !(XDistLE var2)
    // walk-up
    var3 = OPos
    AbsStick var3 (-0.4)
    if Equal CurrAction 1
      ClearStick
    endif
  elif Equal AirGroundState 1
    // force crouch cancel
    Stick 0 (-1)
    if var0 <= 20
      if var17 < 0.3 && var20 >= 24641 && var20 <= 24655
        Button X
      elif var17 < 0.6 && XDistBackEdge < -25 && var0 >= 19
        ClearStick
        Stick -1 0
      elif var17 >= 0.6
        Button R
      endif
    endif
  endif
  var4 = 0
  var5 = OCurrAction
  if Equal var5 96 || Equal var5 81
    if OAnimFrame < 15
      var4 = 1
    endif
  endif
  if Equal var5 30 || Equal var5 31 || Equal var5 32 || Equal var5 78 || Equal var5 80 || Equal var5 82 || Equal var5 83 || Equal var5 97
    if OAnimFrame < 21
      var4 = 1
    endif
  endif
  if Equal var4 1
    var1 = 1
  endif
  var0 -= 1
  if OCurrAction < 69
    Seek contCombo
    Jump
  elif Equal var1 1 && Equal var4 0
    Seek _AIHub
    Jump
  elif var0 <= 0
    Seek _AIHub
    Jump
  elif Equal OIsOnStage 0 && Equal OCurrAction 73
    Seek contCombo
    Jump
  elif OYDistBackEdge < -20 && Equal OFramesHitstun 0
    Seek _AIHub
    Jump
  endif
  Return

label _AIHub
Call AIHub

label contCombo

var3 = OTopNY - TopNY

GetNearestCliff var0
var0 = TopNX - var0
var0 *= -1
var1 = 0

var17 = OTopNX - (TopNX + var0) 
Abs var0
Abs var17

Goto clear
if var17 < var0 && var3 < 70 && var17 < 20 && Equal OXDistBackEdge OXDistFrontEdge
  var6 = 10
  label edgeguard
  LOGSTR 1701078784 1701278976 1634886656 0 0
  var16 = 3
  var17 = Rnd * 7
  if var17 < 1
    Goto fair
  elif var17 < 2
    Goto dtilt
  elif var17 < 3
    Goto fsmash
  elif var17 < 4
    Goto dsmash
  elif var17 < 5
    Goto bair
  elif var17 < 6
    Goto dair
  elif var17 < 7
    Goto sspecial
    var19 = 2
  endif
  Seek edgeguard
elif Equal OIsOnStage 1 && var3 < 65 && Rnd < 0.8 && var8 > 20
  if Equal LevelValue 100 
    var6 = 50
  else
    var6 = 40
  endif
  label combo
  LOGSTR 1668246784 1651441664 0 0 0
  var1 = 1
  Seek killOptions
  Jump 
  label kill_end
  if var6 < 20
    Goto analyze
    Goto clear
    Seek comboOptions
    Jump
    label combo_end
  endif
  Seek combo
elif True
  if Equal LevelValue 100 
    var6 = 50
  else
    var6 = 40
  endif
  label juggle
  LOGSTR 1786078976 1735156992 0 0 0
  var1 = 2
  Seek killOptions
  Jump 
  label kill_high_end
  if var6 < 25
    Goto analyze
    Goto clear
    Seek juggleOptions
    Jump
    label juggle_end
  endif
  Seek juggle
endif
Goto analyze
var6 -= 1
if var6 <= 0
  Seek NCombo
endif
var7 = 8
if Equal var18 255
  var7 = 15
endif
LOGSTR 1027423488 1027407872 0 0 0
Goto clear
Jump
Return

label NCombo
if Equal var18 255 
  var19 = 256
  LOGSTR 1852776448 1668246784 1651441664 0 0
  Call AIHub
else
  Goto TBD
  LOGSTR 1413628928 0 0 0 0
  Call ApproachHub
endif
Return

label comboOptions
LOGVAL var8
var22 = 0.3
if !(SamePlane) || OYDistBackEdge < -10
var22 = 0.15
endif
if True && 206 <= var8 && Rnd < 0.3
var19 = 1
Goto dair_weak
Goto dair_weak
endif
if True && 48 <= var8 && var8 <= 334 && Rnd < 0.3
var19 = 2
Goto nair_weak
Goto nair_weak
endif
if True && 35 <= var8 && var8 <= 380 && Rnd < 0.3
Goto fair
endif
if True && 35 <= var8 && var8 <= 380 && Rnd < 0.3
var19 = 1
Goto fair_scoop
Goto fair_scoop
endif
if True && 29 <= var8 && var8 <= 253 && Rnd < 0.3
var19 = 1
Goto nair_mid
Goto nair_mid
endif
if True && 28 <= var8 && var8 <= 402 && Rnd < 0.3
Goto jab123
endif
if True && 27 <= var8 && var8 <= 329 && Rnd < 0.3
Goto uair
endif
if True && 26 <= var8 && var8 <= 419 && Rnd < 0.3
Goto dtilt
endif
if True && 24 <= var8 && var8 <= 373 && Rnd < 0.3
Goto utilt
endif
if True && 18 <= var8 && var8 <= 214 && Rnd < 0.3
Goto bair
endif
if True && 15 <= var8 && var8 <= 200 && Rnd < 0.3
Goto nair
endif
if True && 7 <= var8 && Rnd < 0.3
var19 = 1
Goto usmash_cancel
Goto usmash_cancel
endif
if True && 3 <= var8 && var8 <= 228 && Rnd < 0.3
var19 = 1
Goto uair_strong
Goto uair_strong
endif
if True && var8 <= 280 && Rnd < 0.3
Goto dair
endif
if True && var8 <= 214 && Rnd < 0.3
Goto usmash
endif
Seek combo_end
Jump
Return

label juggleOptions
LOGVAL var8
var17 = Rnd * 12
if var17 < 1
Goto utilt
elif 1 < var17 && var17 < 2
Goto dtilt
elif 2 < var17 && var17 < 3
Goto usmash
elif 3 < var17 && var17 < 4
var19 = 1
Goto usmash_cancel
Goto usmash_cancel
elif 4 < var17 && var17 < 5
Goto sspecial
elif 5 < var17 && var17 < 6
var19 = 1
Goto sspecial_power
Goto sspecial_power
elif 6 < var17 && var17 < 7
var19 = 2
Goto dthrow
Goto dthrow
elif 7 < var17 && var17 < 8
var19 = 4
Goto uthrow
Goto uthrow
elif 8 < var17 && var17 < 9
var19 = 2
Goto nair_weak
Goto nair_weak
elif 9 < var17 && var17 < 10
Goto uair
elif 10 < var17 && var17 < 11
var19 = 1
Goto uair_strong
Goto uair_strong
elif 11 < var17 && var17 < 12
var19 = 1
Goto dair_weak
Goto dair_weak
endif
Seek juggle_end
Jump
Return

label killOptions
var22 = 0.3
if !(SamePlane) || OYDistBackEdge < -10
var22 = 0.15
endif
if True && 730 <= var8 && Rnd < 0.3
var19 = 1
Goto dair_weak
Goto dair_weak
endif
if True && 447 <= var8 && Rnd < 0.3
Goto ftilt
endif
if True && 327 <= var8 && Rnd < 0.12 && OCurrAction <= 69
var19 = 2
Goto dthrow
Goto dthrow
endif
if True && 269 <= var8 && Rnd < 0.3
var19 = 1
Goto usmash_cancel
Goto usmash_cancel
endif
if True && 263 <= var8 && Rnd < 0.3
Goto dashattack
endif
if True && 222 <= var8 && Rnd < 0.3
Goto dtilt
endif
if True && 215 <= var8 && Rnd < 0.3
Goto jab123
endif
if True && 207 <= var8 && Rnd < 0.3
Goto fair
endif
if True && 207 <= var8 && Rnd < 0.3
var19 = 1
Goto fair_scoop
Goto fair_scoop
endif
if True && 201 <= var8 && Rnd < 0.12 && OCurrAction <= 69
var19 = 3
Goto bthrow
Goto bthrow
endif
if True && 199 <= var8 && Rnd < 0.3
Goto utilt
endif
if True && 193 <= var8 && Rnd < 0.12 && OCurrAction <= 69
var19 = 4
Goto uthrow
Goto uthrow
endif
if True && 191 <= var8 && var8 <= 476 && Rnd < 0.3
var19 = 2
Goto nair_weak
Goto nair_weak
endif
if True && 183 <= var8 && var8 <= 474 && Rnd < 0.12 && OCurrAction <= 69
var19 = 1
Goto fthrow
Goto fthrow
endif
if True && 178 <= var8 && var8 <= 480 && Rnd < 0.3
Goto uair
endif
if True && 141 <= var8 && var8 <= 365 && Rnd < 0.3
var19 = 1
Goto nair_mid
Goto nair_mid
endif
if True && 137 <= var8 && var8 <= 423 && Rnd < 0.3
Goto dair
endif
if True && 135 <= var8 && var8 <= 432 && Rnd < 0.3
Goto sspecial
endif
if True && 116 <= var8 && var8 <= 313 && Rnd < 0.3
Goto fsmash
endif
if True && 116 <= var8 && var8 <= 313 && Rnd < 0.3
Goto bair
endif
if True && 115 <= var8 && var8 <= 340 && Rnd < 0.3
var19 = 1
Goto uair_strong
Goto uair_strong
endif
if True && 112 <= var8 && var8 <= 308 && Rnd < 0.3
Goto dsmash
endif
if True && 108 <= var8 && var8 <= 293 && Rnd < 0.3
Goto nair
endif
if True && 101 <= var8 && var8 <= 326 && Rnd < 0.3
Goto usmash
endif
if True && 67 <= var8 && var8 <= 272 && Rnd < 0.3
var19 = 1
Goto sspecial_power
Goto sspecial_power
endif
if Equal var1 1 
  Seek kill_end
elif Equal var1 2
  Seek kill_high_end
else
  Seek NCombo
endif
Jump
Return

label jab123
LOGSTR 1784766976 825373440 0 0 0
var20 = 24625
var15 = 19
var9 = 0
var10 = -4
var11 = 7.4
var12 = 3.85
var13 = 6
var14 = 7
Return
label dashattack
LOGSTR 1684108032 1751217152 1952539392 1795162112 0
var20 = 24638
var15 = 38
var9 = -1
var10 = -4
var11 = 8.4
var12 = 3.85
var13 = 6
var14 = 15
Return
label ftilt
LOGSTR 1718905088 1819541504 0 0 0
var20 = 24626
var15 = 27
var9 = 1
var10 = -5.650
var11 = 8.4
var12 = 3.850
var13 = 10
var14 = 0
Return
label utilt
LOGSTR 1970563328 1819541504 0 0 0
var20 = 24627
var15 = 28
var9 = -12
var10 = 1
var11 = 12.4
var12 = 12.85
var13 = 5
var14 = 14
Return
label dtilt
LOGSTR 1685350656 1819541504 0 0 0
var20 = 24628
var15 = 26
var9 = 1
var10 = 1
var11 = 8.55
var12 = 3.85
var13 = 5
var14 = 8
Return
label fsmash
LOGSTR 1718840576 1634953216 0 0 0
var20 = 24629
var15 = 51
var9 = 6
var10 = -2
var11 = 10.55
var12 = 6
var13 = 20
var14 = 24
Return
label usmash
LOGSTR 1970498816 1634953216 0 0 0
var20 = 24630
var15 = 26
var9 = 1
var10 = 0
var11 = 4.55
var12 = 19.6
var13 = 11
var14 = 24
Return
label usmash_cancel
LOGSTR 1970498816 1634953216 1600348416 1852007680 1811939328
Return
label dsmash
LOGSTR 1685286144 1634953216 0 0 0
var20 = 24631
var15 = 52
var9 = -17
var10 = -1
var11 = 16
var12 = 4.6
var13 = 13
var14 = 18
Return
label nspecial
LOGSTR 1853059072 1701013760 1634467840 0 0
var20 = 24632
var15 = 26
var9 = 8
var10 = -3
var11 = 69 // nice
var12 = 5
var13 = 8
var14 = 8
Return
label nspecial_start
LOGSTR 1853059072 1701013760 1634492160 1937006848 1920204800
var10 = 5
var11 = 90
var12 = 10
Return
label nspecial_aurabomb
LOGSTR 1853059072 1701013760 1634492160 1635086848 1633840896
var9 = 0
var10 = 4
var12 = 10
Return
label sspecial
LOGSTR 1936945152 1701013760 1634467840 0 0
var20 = 24633
var15 = 58
var9 = 0.5
var10 = -5
var11 = 7.5
var12 = 3.6
var13 = 12
var14 = 14
Return
label sspecial_power
LOGSTR 1936945152 1701013760 1634492160 1886353152 1701969920
Return
label dspecial
LOGSTR 1685286912 1701013760 1634467840 0 0
var20 = 24635
var15 = 30
var9 = 0
var10 = 0
var11 = 25
var12 = 10
var13 = 10
var14 = 10
Return
label dspecial_cancel
LOGSTR 1685286912 1701013760 1634492160 1667329536 1667591168
Return
label grab
LOGSTR 1735549184 1644167168 0 0 0
var20 = 24636
var15 = 31
var9 = 1
var10 = -3
var11 = 6
var12 = 3
var13 = 7
var14 = 8
Return
label fthrow
LOGSTR 1718904832 1919907584 0 0 0
Return
label dthrow
LOGSTR 1685350400 1919907584 0 0 0
Return
label bthrow
LOGSTR 1651795968 1919907584 0 0 0
Return
label uthrow
LOGSTR 1970563072 1919907584 0 0 0
Return
label nair
LOGSTR 1851877632 1912602624 0 0 0
var20 = 24641
var15 = 54
var9 = -10
var10 = -1.5
var11 = 9.5
var12 = 4.6
var13 = 9
var14 = 15
Return
label nair_mid
LOGSTR 1851877632 1918856448 1768161280 0 0
var13 = 16
var14 = 28
Return
label nair_weak
LOGSTR 1851877632 1918859008 1700883200 0 0
var13 = 29
var14 = 41
Return
label fair
LOGSTR 1717659904 1912602624 0 0 0
var20 = 24642
var15 = 31
var9 = 0
var10 = 1
var11 = 7.5
var12 = 4.6
var13 = 6
var14 = 12
Return
label fair_scoop
LOGSTR 1717659904 1918857984 1668247296 1879048192 0
var9 = 0
var10 = 3
var11 = 3.5
var12 = 7.6
var13 = 4
var14 = 5
Return
label bair
LOGSTR 1650551040 1912602624 0 0 0
var20 = 24643
var15 = 33
var9 = -16
var10 = 0
var11 = 7
var12 = 5
var13 = 10
var14 = 13
Return
label uair
LOGSTR 1969318144 1912602624 0 0 0
var20 = 24644
var15 = 29
var9 = -4
var10 = -12
var11 = 4
var12 = 3
var13 = 7
var14 = 10
Return
label uair_strong
LOGSTR 1969318144 1918857984 1953656576 1852243968 0
Return
label dair
LOGSTR 1684105472 1912602624 0 0 0
var20 = 24645
var15 = 29
var9 = -4
var10 = 10
var11 = 4
var12 = 7
var13 = 4
var14 = 12
Return
label dair_weak
LOGSTR 1684105472 1918859008 1700883200 0 0
var14 = 5
Return

label clear
var11 = 0
var12 = 0
var13 = -1
Return

label TBD
  // LOGSTR 1734700544 0 0 0 0
  var20 = 25000
  var9 = -50
  var10 = 60
  var11 = 50
  var12 = 60
  var13 = 1
  var14 = 1
  var15 = 1
Return

label analyze

var17 = OFramesHitstun + var7
if var17 < var13 || Equal var13 -1
  var7 = 0
  Return
endif

if var20 >= 24641 && var20 <= 24655
  if !(InAir)
    var13 += 3
  endif
elif var20 <= 24631 || Equal var20 24636 || Equal var20 24638
  if var3 > 20
    var7 = 0
    Return
  endif
endif

var4 = 0

var5 = var13
  var0 = 0
  var1 = 0
  var22 = var5
  EstOYCoord var1 var22
  // if the opponent is in an actionable state, lower the estimate of
  // their x offset to prevent dashdancing from setting it off when very far away
  if OCurrAction <= 9 && var20 < 24641
    var22 /= 3
  endif
  EstOXCoord var0 var22
  var1 = var1 - (OSCDBottom - OTopNY)
  // correct if estimated y positions go beyond ground level
  // target
  var22 = OYDistBackEdge + OTopNY
  if var1 < var22 && Equal OIsOnStage 1
    var22 -= var1
    var1 += var22
  elif Equal OCurrAction 70 || Equal OCurrAction 74 || Equal OCurrAction 84 || Equal OCurrAction 85
    var1 += var22
  endif
  // DrawDebugRectOutline var0 var1 5 5 136 255 136 221
  var0 -= TopNX
  var1 = TopNY - var1
  var2 = var11 * (1 + 0.8)
  var3 = var12 * (1 + 0.8)
  var2 *= 2
  var3 *= 2
  Abs var0
  Abs var1
  if Equal AirGroundState 1
    var2 = var2 + var5 * 1.85
  else
    var2 = var2 + var5 * XSpeed
  endif
  if NumJumps > 0
    if var20 >= 24641 && var20 <= 24655 || Equal var20 25000 
      var17 = GetJumpHeight * 2
      var3 += var17 
    endif
  endif
  if var0 <= var2 && var1 <= var3
    // var0 += OTopNX
    // var1 += OTopNY
    // DrawDebugRectOutline var0 var1 var2 var3 255 0 0 136
    // var0 -= OTopNX 
    // var0 += TopNX
    // var1 -= OTopNY
    // var1 += TopNY
    // DrawDebugRectOutline var0 var1 var2 var3 0 0 255 136
    Seek callMove
    Jump
  endif

var5 = var14
  var0 = 0
  var1 = 0
  var22 = var5
  EstOYCoord var1 var22
  // if the opponent is in an actionable state, lower the estimate of
  // their x offset to prevent dashdancing from setting it off when very far away
  if OCurrAction <= 9 && var20 < 24641
    var22 /= 3
  endif
  EstOXCoord var0 var22
  var1 = var1 - (OSCDBottom - OTopNY)
  // correct if estimated y positions go beyond ground level
  // target
  var22 = OYDistBackEdge + OTopNY
  if var1 < var22 && Equal OIsOnStage 1
    var22 -= var1
    var1 += var22
  elif Equal OCurrAction 70 || Equal OCurrAction 74 || Equal OCurrAction 84 || Equal OCurrAction 85
    var1 += var22
  endif
  // DrawDebugRectOutline var0 var1 5 5 136 255 136 221
  var0 -= TopNX
  var1 = TopNY - var1
  var2 = var11 * (1 + 0.8)
  var3 = var12 * (1 + 0.8)
  var2 *= 2
  var3 *= 2
  Abs var0
  Abs var1
  if Equal AirGroundState 1
    var2 = var2 + var5 * 1.85
  else
    var2 = var2 + var5 * XSpeed
  endif
  if NumJumps > 0
    if var20 >= 24641 && var20 <= 24655 || Equal var20 25000 
      var17 = GetJumpHeight * 2
      var3 += var17 
    endif
  endif
  if var0 <= var2 && var1 <= var3
    // var0 += OTopNX
    // var1 += OTopNY
    // DrawDebugRectOutline var0 var1 var2 var3 255 0 0 136
    // var0 -= OTopNX 
    // var0 += TopNX
    // var1 -= OTopNY
    // var1 += TopNY
    // DrawDebugRectOutline var0 var1 var2 var3 0 0 255 136
    Seek callMove
    Jump
  endif

if !(Equal var18 255)
  var7 = 0
  Return
endif

var5 = OFramesHitstun
  var0 = 0
  var1 = 0
  var22 = var5
  EstOYCoord var1 var22
  // if the opponent is in an actionable state, lower the estimate of
  // their x offset to prevent dashdancing from setting it off when very far away
  if OCurrAction <= 9 && var20 < 24641
    var22 /= 3
  endif
  EstOXCoord var0 var22
  var1 = var1 - (OSCDBottom - OTopNY)
  // correct if estimated y positions go beyond ground level
  // target
  var22 = OYDistBackEdge + OTopNY
  if var1 < var22 && Equal OIsOnStage 1
    var22 -= var1
    var1 += var22
  elif Equal OCurrAction 70 || Equal OCurrAction 74 || Equal OCurrAction 84 || Equal OCurrAction 85
    var1 += var22
  endif
  // DrawDebugRectOutline var0 var1 5 5 136 255 136 221
  var0 -= TopNX
  var1 = TopNY - var1
  var2 = var11 * (1 + 0.8)
  var3 = var12 * (1 + 0.8)
  var2 *= 2
  var3 *= 2
  Abs var0
  Abs var1
  if Equal AirGroundState 1
    var2 = var2 + var5 * 1.85
  else
    var2 = var2 + var5 * XSpeed
  endif
  if NumJumps > 0
    if var20 >= 24641 && var20 <= 24655 || Equal var20 25000 
      var17 = GetJumpHeight * 2
      var3 += var17 
    endif
  endif
  if var0 <= var2 && var1 <= var3
    // var0 += OTopNX
    // var1 += OTopNY
    // DrawDebugRectOutline var0 var1 var2 var3 255 0 0 136
    // var0 -= OTopNX 
    // var0 += TopNX
    // var1 -= OTopNY
    // var1 += TopNY
    // DrawDebugRectOutline var0 var1 var2 var3 0 0 255 136
    Seek callMove
    Jump
  endif

if Equal var18 1 
  var5 = 3
  var0 = 0
  var1 = 0
  var22 = var5
  EstOYCoord var1 var22
  // if the opponent is in an actionable state, lower the estimate of
  // their x offset to prevent dashdancing from setting it off when very far away
  if OCurrAction <= 9 && var20 < 24641
    var22 /= 3
  endif
  EstOXCoord var0 var22
  var1 = var1 - (OSCDBottom - OTopNY)
  // correct if estimated y positions go beyond ground level
  // target
  var22 = OYDistBackEdge + OTopNY
  if var1 < var22 && Equal OIsOnStage 1
    var22 -= var1
    var1 += var22
  elif Equal OCurrAction 70 || Equal OCurrAction 74 || Equal OCurrAction 84 || Equal OCurrAction 85
    var1 += var22
  endif
  // DrawDebugRectOutline var0 var1 5 5 136 255 136 221
  var0 -= TopNX
  var1 = TopNY - var1
  var2 = var11 * (1 + 0.8)
  var3 = var12 * (1 + 0.8)
  var2 *= 2
  var3 *= 2
  Abs var0
  Abs var1
  if Equal AirGroundState 1
    var2 = var2 + var5 * 1.85
  else
    var2 = var2 + var5 * XSpeed
  endif
  if NumJumps > 0
    if var20 >= 24641 && var20 <= 24655 || Equal var20 25000 
      var17 = GetJumpHeight * 2
      var3 += var17 
    endif
  endif
  if var0 <= var2 && var1 <= var3
    // var0 += OTopNX
    // var1 += OTopNY
    // DrawDebugRectOutline var0 var1 var2 var3 255 0 0 136
    // var0 -= OTopNX 
    // var0 += TopNX
    // var1 -= OTopNY
    // var1 += TopNY
    // DrawDebugRectOutline var0 var1 var2 var3 0 0 255 136
    Seek callMove
    Jump
  endif
endif

var7 = 0
Return

label callMove

if Equal CurrAction 24
  Return
endif

if Equal var18 255
  var18 = 0
endif
if Equal var16 0 
  var16 = 6
endif
if Equal var20 24625
  Call Jab123
elif Equal var20 24638
  Call DashAttack
elif Equal var20 24626
  Call FTilt
elif Equal var20 24627
  Call UTilt
elif Equal var20 24628
  Call DTilt
elif Equal var20 24629
  Call FSmash
elif Equal var20 24630
  Call USmash
elif Equal var20 24631
  Call DSmash
elif Equal var20 24632
  Call NSpecial
elif Equal var20 24633
  Call SSpecial
elif Equal var20 24634
  Call USpecial
elif Equal var20 24635
  Call DSpecial
elif Equal var20 24636
  Call Grab
elif Equal var20 24641
  Call NAir
elif Equal var20 24642
  Call FAir
elif Equal var20 24643
  Call BAir
elif Equal var20 24644
  Call UAir
elif Equal var20 24645
  Call DAir
elif Equal var20 24646
  Call NSpecialAir
elif Equal var20 24647
  Call SSpecialAir
elif Equal var20 24648
  Call USpecialAir
elif Equal var20 24649
  Call DSpecialAir
endif

Return
Return
