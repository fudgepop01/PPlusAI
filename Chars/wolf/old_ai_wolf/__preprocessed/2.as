// COMBO HUB
// a place for determining the next best attack when an opponent is in hitstun
#include <Definition_AIMain.h>
id 0x8002

unk 0x0

// each var20 corresponds to a move routine... so like 6031 means jab
// was the last move used...


var21 = 32770

if Equal CurrAction 4 || Equal CurrAction 3
  Stick 1
endif

// #let comboLeniency = var7

var4 = OWeight

var4 = var4 - 200
var4 *= -1
var4 /= 100
var4 *= ODamage

if Equal var18 255 || Equal var16 10
  Seek contCombo
  Jump
endif
var18 = 0
var16 = 0

var1 = OTopNY - TopNY



LOGSTR 1398030592 1381236736 0 0 0


  // if Equal var20 24636
  //   // LOGSTR 1735549440 1131241984 1862270976 0 0
  //   if Equal var19 5
  //     if var4 > 50
  //       if XDistLE 20
  //         Call FAir
  //       else
  //         Call UAir
  //       endif
  //     elif var1 > 25
  //       Call UAir
  //     else
  //       Call NAir
  //     endif
  //   elif Equal var19 3
  //     if var4 > 50 && var1 > 25
  //       Call FAir
  //     elif var1 > 25 && OYSpeed > 0.15
  //       Call UAir
  //     endif
  //     var0 = Rnd * 3
  //     if var4 > 40 && var0 < 2
  //       Call DAir
  //     else
  //       var19 = 1
  //       Call Grab
  //     endif
  //   endif
  // endif
  // if var16 < 4
  //   Goto grab
  //   comboLeniency = 8
  //   if OYDistBackEdge < -5
  //     var19 = 1
  //   endif
  //   Goto analyze
  // endif
  // if var4 > 50
  //   Goto fair
  //   comboLeniency = 2
  //   Goto analyze
  // // else
  // //   Goto dair
  // //   comboLeniency = 2
  // endif
  if OFramesHitstun > 10 && Rnd < 0.5 && YDistBackEdge > -10 && OYDistBackEdge > -15
    Call Grab
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
  var0 = Rnd * 50
  var1 = 0
  if Damage < 80
    var2 = 20
  else
    var2 = 40
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
    if OAnimFrame < 17
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
var21 = -1

var17 = OTopNX - (TopNX + var0) 
Abs var0
Abs var17
var7 = 1
Goto clear
if var17 < var0 && var3 < 70 && var17 < 20 && Equal OXDistBackEdge OXDistFrontEdge
  var6 = 10
  label edgeguard
  LOGSTR 1701078784 1701278976 1634886656 0 0
  var16 = 3
var17 = Rnd * 6
if var17 < 1  && YDistBackEdge > -3 
Goto ftilt
elif 1 < var17 && var17 < 2 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto dtilt
elif 2 < var17 && var17 < 3 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto dsmash
elif 3 < var17 && var17 < 4 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto nspecial
elif 4 < var17 && var17 < 5 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto sspecial
elif 5 < var17 && var17 < 6  
Goto dair
endif
  Seek edgeguard
elif Equal OIsOnStage 1 && var3 < 65 && Rnd < 0.8
  if Equal LevelValue 100 
    var6 = 15
  else
    var6 = 10
  endif
  label combo
  if var7 <= 3
    var21 = 2
    Goto killOptions
  elif Rnd <= 0.3 && OYDistBackEdge < -20 && !(Equal OAirGroundState 1)
    var21 = 3
    Goto downwardOptions
  else
    var21 = 0
    Goto comboOptions
  endif
  Seek combo
elif True
  if Equal LevelValue 100 
    var6 = 15
  else
    var6 = 10
  endif
  label juggle
  if var7 <= 3
    var21 = 2
    Goto killOptions
  elif Rnd <= 0.3 && OYDistBackEdge > -30 && !(Equal OAirGroundState 1)
    var21 = 3
    Goto downwardOptions
  else
    var21 = 1
    Goto juggleOptions
  endif
  Seek juggle
endif
Goto analyze
var6 -= 1
if var6 <= 0
  if var7 < 6
    var7 += 1
    // LOGSTR 1027423488 1027423488 1023410176 0 0
    LOGSTR 1346912512 1397039104 1431321088 0 0
    LOGVAL var7
    // LOGSTR 1027423488 1027423488 1023410176 0 0
    var6 = 10
    Jump
  else
    Seek NCombo
  endif
endif
// comboLeniency = 8
// if Equal var18 255
//   comboLeniency = 15
// endif
// LOGSTR 1027423488 1027407872 0 0 0
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
  EstOYCoord var17 OFramesHitstun
  var17 -= OTopNY
  GetYDistFloorOffset var17 0 var17 1
  // LOGSTR 2036622848 1862270976 0 0 0
  // LOGVAL var17
  if var17 < 30
var17 = Rnd * 20
if var17 < 1  && YDistBackEdge > -3 
Goto jab123
elif 1 < var17 && var17 < 2 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto dashattack
elif 2 < var17 && var17 < 3 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto ftilt
elif 3 < var17 && var17 < 4 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto utilt
elif 4 < var17 && var17 < 5 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto dtilt
elif 5 < var17 && var17 < 6 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto nspecial
elif 6 < var17 && var17 < 7  && OYDistBackEdge < -5
Goto nspecialair
elif 7 < var17 && var17 < 8 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto dspecial
elif 8 < var17 && var17 < 9  
Goto dspecialair
elif 9 < var17 && var17 < 10  && OYDistBackEdge < -5
Goto sspecialair
elif 10 < var17 && var17 < 11 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto grab
elif 11 < var17 && var17 < 12 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 2
Goto grab
Goto fthrow
elif 12 < var17 && var17 < 13 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 3
Goto grab
Goto dthrow
elif 13 < var17 && var17 < 14 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 4
Goto grab
Goto bthrow
elif 14 < var17 && var17 < 15 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 5
Goto grab
Goto uthrow
elif 15 < var17 && var17 < 16  
Goto nair
elif 16 < var17 && var17 < 17  
Goto fair
elif 17 < var17 && var17 < 18  
Goto bair
elif 18 < var17 && var17 < 19  
Goto uair
elif 19 < var17 && var17 < 20  
Goto dair
endif
  else
var17 = Rnd * 8
if var17 < 1  && OYDistBackEdge < -5
Goto nspecialair
elif 1 < var17 && var17 < 2  
Goto dspecialair
elif 2 < var17 && var17 < 3  && OYDistBackEdge < -5
Goto sspecialair
elif 3 < var17 && var17 < 4  
Goto nair
elif 4 < var17 && var17 < 5  
Goto fair
elif 5 < var17 && var17 < 6  
Goto bair
elif 6 < var17 && var17 < 7  
Goto uair
elif 7 < var17 && var17 < 8  
Goto dair
endif
  endif
Return

label juggleOptions
  EstOYCoord var17 OFramesHitstun
  var17 -= OTopNY
  GetYDistFloorOffset var17 0 var17 1
  // LOGSTR 2036622848 1862270976 0 0 0
  // LOGVAL var17
  if var17 < 30
var17 = Rnd * 24
if var17 < 1  && YDistBackEdge > -3 
Goto jab123
elif 1 < var17 && var17 < 2 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto dashattack
elif 2 < var17 && var17 < 3 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto ftilt
elif 3 < var17 && var17 < 4 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto utilt
elif 4 < var17 && var17 < 5 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto dtilt
elif 5 < var17 && var17 < 6 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto fsmash
elif 6 < var17 && var17 < 7 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto usmash
elif 7 < var17 && var17 < 8 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto dsmash
elif 8 < var17 && var17 < 9 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 1
Goto dsmash
Goto dsmash_hit2
elif 9 < var17 && var17 < 10 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto nspecial
elif 10 < var17 && var17 < 11  && OYDistBackEdge < -5
Goto nspecialair
elif 11 < var17 && var17 < 12 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto dspecial
elif 12 < var17 && var17 < 13  
Goto dspecialair
elif 13 < var17 && var17 < 14 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto sspecial
elif 14 < var17 && var17 < 15  && OYDistBackEdge < -5
Goto sspecialair
elif 15 < var17 && var17 < 16 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto grab
elif 16 < var17 && var17 < 17 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 2
Goto grab
Goto fthrow
elif 17 < var17 && var17 < 18 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 3
Goto grab
Goto dthrow
elif 18 < var17 && var17 < 19 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 4
Goto grab
Goto bthrow
elif 19 < var17 && var17 < 20 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 5
Goto grab
Goto uthrow
elif 20 < var17 && var17 < 21  
Goto nair
elif 21 < var17 && var17 < 22  
Goto fair
elif 22 < var17 && var17 < 23  
Goto bair
elif 23 < var17 && var17 < 24  
Goto uair
endif
  else
var17 = Rnd * 7
if var17 < 1  && OYDistBackEdge < -5
Goto nspecialair
elif 1 < var17 && var17 < 2  
Goto dspecialair
elif 2 < var17 && var17 < 3  && OYDistBackEdge < -5
Goto sspecialair
elif 3 < var17 && var17 < 4  
Goto nair
elif 4 < var17 && var17 < 5  
Goto fair
elif 5 < var17 && var17 < 6  
Goto bair
elif 6 < var17 && var17 < 7  
Goto uair
endif
  endif
Return

label killOptions
  EstOYCoord var17 OFramesHitstun
  var17 -= OTopNY
  GetYDistFloorOffset var17 0 var17 1
  // LOGSTR 2036622848 1862270976 0 0 0
  // LOGVAL var17
  if var17 < 30
var17 = Rnd * 25
if var17 < 1  && YDistBackEdge > -3 
Goto jab123
elif 1 < var17 && var17 < 2 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto dashattack
elif 2 < var17 && var17 < 3 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto ftilt
elif 3 < var17 && var17 < 4 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto utilt
elif 4 < var17 && var17 < 5 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto dtilt
elif 5 < var17 && var17 < 6 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto fsmash
elif 6 < var17 && var17 < 7 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto usmash
elif 7 < var17 && var17 < 8 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto dsmash
elif 8 < var17 && var17 < 9 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 1
Goto dsmash
Goto dsmash_hit2
elif 9 < var17 && var17 < 10 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto nspecial
elif 10 < var17 && var17 < 11  && OYDistBackEdge < -5
Goto nspecialair
elif 11 < var17 && var17 < 12 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto dspecial
elif 12 < var17 && var17 < 13  
Goto dspecialair
elif 13 < var17 && var17 < 14 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto sspecial
elif 14 < var17 && var17 < 15  && OYDistBackEdge < -5
Goto sspecialair
elif 15 < var17 && var17 < 16 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto grab
elif 16 < var17 && var17 < 17 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 2
Goto grab
Goto fthrow
elif 17 < var17 && var17 < 18 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 3
Goto grab
Goto dthrow
elif 18 < var17 && var17 < 19 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 4
Goto grab
Goto bthrow
elif 19 < var17 && var17 < 20 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 5
Goto grab
Goto uthrow
elif 20 < var17 && var17 < 21  
Goto nair
elif 21 < var17 && var17 < 22  
Goto fair
elif 22 < var17 && var17 < 23  
Goto bair
elif 23 < var17 && var17 < 24  
Goto uair
elif 24 < var17 && var17 < 25  
Goto dair
endif
  else
var17 = Rnd * 8
if var17 < 1  && OYDistBackEdge < -5
Goto nspecialair
elif 1 < var17 && var17 < 2  
Goto dspecialair
elif 2 < var17 && var17 < 3  && OYDistBackEdge < -5
Goto sspecialair
elif 3 < var17 && var17 < 4  
Goto nair
elif 4 < var17 && var17 < 5  
Goto fair
elif 5 < var17 && var17 < 6  
Goto bair
elif 6 < var17 && var17 < 7  
Goto uair
elif 7 < var17 && var17 < 8  
Goto dair
endif
  endif
Return

label downwardOptions
  EstOYCoord var17 OFramesHitstun
  var17 -= OTopNY
  GetYDistFloorOffset var17 0 var17 1
  // LOGSTR 2036622848 1862270976 0 0 0
  // LOGVAL var17
  if var17 < 30
var17 = Rnd * 1
if var17 < 1  
Goto dair
endif
  else
var17 = Rnd * 1
if var17 < 1  
Goto dair
endif
  endif
Return

label ftilt
LOGSTR 1718905088 1819541504 0 0 0
var20 = 24626
var9 = 2
var10 = 0
var11 = 10
var12 = 7
var13 = 7
var14 = 10
CalcKnockback var15 ODamage 6 25 150 OWeight 0
var8 = 50
Goto __ANGLE_FIX__
Return
label dtilt
LOGSTR 1685350656 1819541504 0 0 0
var20 = 24628
var9 = 3
var10 = 1
var11 = 11
var12 = 5
var13 = 9
var14 = 10
CalcKnockback var15 ODamage 8 30 100 OWeight 0
var8 = 68
Goto __ANGLE_FIX__
Return
label dsmash
LOGSTR 1685286144 1634953216 0 0 0
var20 = 24631
var9 = -18
var10 = 2
var11 = 19.5
var12 = 14.5
var13 = 9
var14 = 10
CalcKnockback var15 ODamage 15 25 100 OWeight 0
var8 = 40
Goto __ANGLE_FIX__
Return
label nspecial
LOGSTR 1853059072 1701013760 1634467840 0 0
var20 = 24632
var9 = 11
var10 = -3
var11 = 42
var12 = 4
var13 = 15
var14 = 108
CalcKnockback var15 ODamage 3 5 100 OWeight 1
var8 = 361
Goto __ANGLE_FIX__
Return
label sspecial
LOGSTR 1936945152 1701013760 1634467840 0 0
var20 = 24633
var9 = 28
var10 = -14
var11 = 6
var12 = 8
var13 = 17
var14 = 20
CalcKnockback var15 ODamage 3 68 60 OWeight 0
var8 = 60
Goto __ANGLE_FIX__
Return
label dair
LOGSTR 1684105472 1912602624 0 0 0
var20 = 24645
var9 = -5
var10 = 10
var11 = 5.5
var12 = 7
var13 = 13
var14 = 15
CalcKnockback var15 ODamage 14 15 100 OWeight 0
var8 = 270
Goto __ANGLE_FIX__
Return
label jab123
LOGSTR 1784766976 825373440 0 0 0
var20 = 24625
var9 = 5
var10 = -1
var11 = 7.25
var12 = 5.5
var13 = 4
var14 = 5
CalcKnockback var15 ODamage 4 20 53 OWeight 0
var8 = 80
Goto __ANGLE_FIX__
Return
label dashattack
LOGSTR 1684108032 1751217152 1952539392 1795162112 0
var20 = 24637
var9 = 20
var10 = -2
var11 = 7.5
var12 = 3
var13 = 11
var14 = 15
CalcKnockback var15 ODamage 9 35 100 OWeight 0
var8 = 74
Goto __ANGLE_FIX__
Return
label utilt
LOGSTR 1970563328 1819541504 0 0 0
var20 = 24627
var9 = -3
var10 = 0
var11 = 7.5
var12 = 13.5
var13 = 6
var14 = 10
CalcKnockback var15 ODamage 9 30 110 OWeight 0
var8 = 80
Goto __ANGLE_FIX__
Return
label nspecialair
LOGSTR 1853059072 1701013760 1634492672 1769078784 0
var20 = 24646
var9 = 4
var10 = -2
var11 = 55
var12 = 8
var13 = 15
var14 = 108
CalcKnockback var15 ODamage 3 5 100 OWeight 1
var8 = 361
Goto __ANGLE_FIX__
Return
label dspecial
LOGSTR 1685286912 1701013760 1634467840 0 0
var20 = 24635
var9 = -8
var10 = 2
var11 = 8
var12 = 8
var13 = 1
var14 = 1
CalcKnockback var15 ODamage 8 110 50 OWeight 0
var8 = 84
Goto __ANGLE_FIX__
Return
label dspecialair
LOGSTR 1685286912 1701013760 1634492672 1769078784 0
var20 = 24649
var9 = -8
var10 = 2
var11 = 8
var12 = 8
var13 = 1
var14 = 1
CalcKnockback var15 ODamage 8 110 50 OWeight 0
var8 = 84
Goto __ANGLE_FIX__
Return
label sspecialair
LOGSTR 1936945152 1701013760 1634492672 1769078784 0
var20 = 24647
var9 = 28
var10 = -14
var11 = 6
var12 = 8
var13 = 17
var14 = 20
CalcKnockback var15 ODamage 3 68 60 OWeight 0
var8 = 60
Goto __ANGLE_FIX__
Return
label grab
LOGSTR 1735549184 1644167168 0 0 0
var20 = 24636
var9 = 2
var10 = -1
var11 = 5.5
var12 = 4.5
var13 = 7
var14 = 8
CalcKnockback var15 ODamage 0 0 0 OWeight 0
var8 = 0
Goto __ANGLE_FIX__
Return
label fthrow
LOGSTR 1718904832 1919907584 0 0 0
CalcKnockback var15 ODamage 2 54 135 OWeight 0
var8 = 45
Goto __ANGLE_FIX__
Return
label dthrow
LOGSTR 1685350400 1919907584 0 0 0
CalcKnockback var15 ODamage 3 70 50 OWeight 0
var8 = 55
Goto __ANGLE_FIX__
Return
label bthrow
LOGSTR 1651795968 1919907584 0 0 0
CalcKnockback var15 ODamage 5 70 58 OWeight 0
var8 = 60
Goto __ANGLE_FIX__
Return
label uthrow
LOGSTR 1970563072 1919907584 0 0 0
CalcKnockback var15 ODamage 2 70 100 OWeight 0
var8 = 77
Goto __ANGLE_FIX__
Return
label nair
LOGSTR 1851877632 1912602624 0 0 0
var20 = 24641
var9 = -6
var10 = 1
var11 = 6.5
var12 = 8
var13 = 7
var14 = 24
CalcKnockback var15 ODamage 4 20 0 OWeight 0
var8 = 0
Goto __ANGLE_FIX__
Return
label fair
LOGSTR 1717659904 1912602624 0 0 0
var20 = 24642
var9 = -6
var10 = 7
var11 = 10.5
var12 = 13.5
var13 = 11
var14 = 14
CalcKnockback var15 ODamage 15 25 100 OWeight 0
var8 = 70
Goto __ANGLE_FIX__
Return
label bair
LOGSTR 1650551040 1912602624 0 0 0
var20 = 24643
var9 = -16
var10 = -1
var11 = 8.5
var12 = 5.5
var13 = 7
var14 = 10
CalcKnockback var15 ODamage 14 22 102 OWeight 0
var8 = 361
Goto __ANGLE_FIX__
Return
label uair
LOGSTR 1969318144 1912602624 0 0 0
var20 = 24644
var9 = -13
var10 = -1
var11 = 14.5
var12 = 12
var13 = 7
var14 = 11
CalcKnockback var15 ODamage 11 20 100 OWeight 0
var8 = 57
Goto __ANGLE_FIX__
Return
label fsmash
LOGSTR 1718840576 1634953216 0 0 0
var20 = 24629
var9 = -2
var10 = 1
var11 = 20
var12 = 5.5
var13 = 11
var14 = 17
CalcKnockback var15 ODamage 13 40 90 OWeight 0
var8 = 361
Goto __ANGLE_FIX__
Return
label usmash
LOGSTR 1970498816 1634953216 0 0 0
var20 = 24630
var9 = -22
var10 = 0
var11 = 31
var12 = 13.5
var13 = 12
var14 = 17
CalcKnockback var15 ODamage 11 25 100 OWeight 0
var8 = 40
Goto __ANGLE_FIX__
Return
label dsmash_hit2
LOGSTR 1685286144 1634953216 1600678144 1949433856 0
var13 = 15
var14 = 16
CalcKnockback var15 ODamage 13 25 100 OWeight 0
var8 = 40
Goto __ANGLE_FIX__
Return
label __ANGLE_FIX__
if var8 > 180 && Equal OAirGroundState 1
  if Equal var8 361
    if var15 < 32
      var8 = 0
    else
      var8 = 44
    endif
  else
    var8 = 180 - var8
  endif
elif Equal var8 361
  var8 = 45
endif
Return

label clear
var11 = 0
var12 = 0
var13 = -1
Return

label TBD
  // LOGSTR 1734700544 0 0 0 0
  var20 = 25000
  var9 = -70
  var10 = 50
  var11 = 70
  var12 = 50
  var13 = 10
  var14 = 10
  var15 = 1
Return

label analyze

if Equal var20 25000
  Return
endif

// var17 = OFramesHitstun + comboLeniency
// if var17 < var13 || Equal var13 -1
//   comboLeniency = 0
//   Return
// endif

if var20 >= 24641 && var20 <= 24655
  if !(InAir)
    var13 += 4
    var14 += 4
  endif
endif

var0 = OFramesHitstun + 5
if var0 < var13
  var2 = var0
  var1 = var13
  var0 = var14
elif var0 < var14
  var2 = var13
  var1 = var0
  var0 = var14
else
  var2 = var13
  var1 = var14
endif

  LOGSTR 1885888768 2053439488 0 0 0
  LOGVAL var7
if Equal var7 1 || Equal var7 4
  var5 = var2
elif Equal var7 2 || Equal var7 5
  var5 = var1
elif Equal var7 3 || Equal var7 6
  var5 = var0
endif

var5 += 3


Goto CTD

// {EXTRA_ANALYSIS}

// comboLeniency = 0
Return

label CTD
  // this prevents it from auto-attacking.
  // this issue persisted for... 9 months
  Cmd30
  if var20 >= 24625 && var20 <= 24631
    if Equal AirGroundState 1 && Equal CurrAction 3 && !(Equal var20 24636) && !(Equal var20 24630)
      var3 = 0
    elif Equal AirGroundState 2
      var3 = 0
    else
      var3 = 0
    endif
  elif var20 >= 24641 && var20 <= 24655
    var3 = 0
    if Equal AirGroundState 1
      var3 = 0
    endif
  elif Equal var20 25000
    var3 = OFramesHitstun 
  endif
  // SAFE_WRITE_C var9
  // SAFE_WRITE_D var10
  // SAFE_WRITE_E var11
  // SAFE_WRITE_F var12  
  SAFE_INJECT_C var9
  SAFE_INJECT_D var10
  SAFE_INJECT_E var11
  SAFE_INJECT_F var12
  var2 = 0
  // calculate own estimated position
  var17 = var5 + var3
  // if using a grounded attack then own offset will be very small
  if var20 >= 24625 && var20 <= 24631
    var17 = 0
  endif
  var17 += 1
  if OAnimFrame <= 2
    var0 = OTopNX + OXSpeed * var17
  var17 = var5
  var23 = OYSpeed * -1
  CalcYChange var1 var17 var23 OGravity OMaxFallSpeed OFastFallSpeed 0
    var1 = OTopNY - var1
    // DrawDebugRectOutline OTopNX OTopNY 5 5 0 255 255 221
  else 
    EstOXCoord var0 var17
    EstOYCoord var1 var17
  endif
  var17 -= 1
  var17 /= 60
  EstOPosVecR var2 var17 var17
  if OAnimFrame > 2
    var22 = ExactOXCoord - ExactXCoord
    var22 = var22 - (OTopNX - TopNX)
    var2 -= var22
    var22 = ExactOYCoord - ExactYCoord
    var22 = var22 - (OSCDBottom - TopNY)
    var17 -= var22
  endif
    var2 += TopNX
    var17 += TopNY
    var2 -= OTopNX
    var2 *= -2
    var22 = var0 - OTopNX
    var2 += var22
    var2 += TopNX
  // estimate target position separately  
  var22 = var5 + var3
  // calculate own Y coord because I can't figure out the !@$% EstOPosVecR thing
  var17 = var5
  if Equal CurrSubaction JumpSquat
    var22 = -2
  else
    var22 = YSpeed * -1
  endif
  CalcYChange var1 var17 var22 Gravity MaxFallSpeed FastFallSpeed 0
  var17 = TopNY - var1
  // calculate Opponent change in 0.16 (used later)
  // if !(Equal OYSpeed 0) 
  //   O_CALC_SELF_Y_CHANGE_GRAVITY(var0, var5)
  // endif
  // it's awful, I know, but i'm all out of variables and this was the only way lol
  var22 = var5 
  if var20 >= 24625 && var20 <= 24631
    if Equal AirGroundState 1 && Equal CurrAction 3 && !(Equal var20 24636) && !(Equal var20 24630)
      var22 += 0
    endif
  elif var20 >= 24641 && var20 <= 24655
    if Equal AirGroundState 1
      var22 += 0
    endif
  elif Equal var20 25000
    var22 += OFramesHitstun 
  endif
  if OAnimFrame <= 2
  var17 = var22
  var23 = OYSpeed * -1
  CalcYChange var1 var17 var23 OGravity OMaxFallSpeed OFastFallSpeed 0
    var1 = OTopNY - var1
    var1 *= -1
    if OCurrAction <= 9 && var20 < 24641
      var22 *= 0.0
    endif
    var0 = OTopNX + OXSpeed * var22
    // DrawDebugRectOutline OTopNX OTopNY 5 5 0 255 255 221
    // DrawDebugRectOutline var0 var1 5 5 255 255 0 136
  else 
    EstOYCoord var1 var22
    // if the opponent is in an actionable state, lower the estimate of
    // their x offset to prevent dashdancing from setting it off when very far away
    if OCurrAction <= 9 && var20 < 24641
      var22 *= 0.0
    endif
    EstOXCoord var0 var22
    var1 = var1 + (OSCDBottom - OTopNY)
  endif
  var3 = TopNY + YDistBackEdge
  if SamePlane && var1 <= var3 && !(MeteoChance)
    var1 = var3
  endif
  if !(CalledAs ComboHub)
    // if Equal var16 4
    //   var22 = 20 * OPos
    //   var0 -= var22
    // elif Equal var16 5
    //   var22 = 20 * OPos
    //   var0 += var22
    // el
    if Equal var16 13
      // LOGSTR 1414025728 1161909248 1162758400 1313275904 0
      predictAverage var22 3 LevelValue
      var22 += 30
      var22 *= OPos
      var23 = OXSpeed
      Abs var23
      var23 *= 0.5
      var22 *= var23
      var0 -= var22
    endif
    if Equal var16 12
      predictAverage var22 3 LevelValue
      var22 += 15
      var22 *= OPos
      var23 = OXSpeed
      Abs var23
      var23 *= 0.5
      var22 *= var23
      var0 -= var22
    endif
    if LevelValue >= 75 && !(Equal var16 7) && OCurrAction <= 15 && Equal OIsOnStage 1
      predictOOption var22 13 LevelValue
      var22 = 30 * OPos
      if Equal var22 1
        var0 += var22
      elif Equal var22 3
        var0 -= var22
      endif
    endif
    if Equal var20 24636 || Equal var20 24630
      if CurrAction >= 3 && CurrAction <= 4
        var22 = 10 * OPos
        var0 += var22
      endif
    endif
    if LevelValue >= 48 && CalledAs ApproachHub
      predictOOption var22 15 LevelValue
      predictionConfidence var3 15 LevelValue
      if Equal var22 1 && Rnd < var3
        if var20 >= 24641 && var20 <= 24649
          var22 = var13 + 4 + 3
        else
          var22 = var13
        endif
        EstOYCoord var22 var22
        var3 = TopNY + YDistBackEdge
        if SamePlane && var22 <= var3 
          var22 = 1
        else
          var22 = 0
        endif
        if Equal OCurrAction 97 || Equal OCurrAction 96
          Seek
          Jump
        elif OCurrAction >= 68 && OCurrAction <= 73 && Equal var22 1
          label
          if Equal OCurrAction 97 && OAnimFrame > 18
          elif Equal OCurrAction 96
          else
            var3 = -9999.9999
          endif 
          predictOOption var22 9 LevelValue
          if Equal var22 1
            LOGSTR 1414485760 1095910400 1392508928 0 0
            var22 = 21
            if Equal OCurrAction 97
              var22 -= OAnimFrame
            endif
            var22 *= 2 * OPos
            var0 -= var22
          elif Equal var22 3
            LOGSTR 1096237312 1493172224 0 0 0
            var22 = 21
            if Equal OCurrAction 97
              var22 -= OAnimFrame
            endif
            var22 *= 2 * OPos
            var0 += var22
          endif
        endif
      endif
    endif
  endif
  // correct to be sure it's not senslessly offstage
  if Equal OIsOnStage 1 && Equal OFramesHitstun 0
    var22 = var0 - TopNX
    GetYDistFloorOffset var22 var22 0 0
    if Equal var22 -1
      var22 = OXDistBackEdge
      Abs var22
      if var22 > OXDistFrontEdge
        var22 = OXDistFrontEdge
      endif
      var0 = OTopNX + var22 
      // var0 *= OPos
    endif
  endif 
  // var0 = estimated target x position
  // var1 = estimated target y position
  // var2 = estimated own x position
  // var17 = estimated own y position
  // var22 = temporary variable
  // var3 = by some miracle, another temporary variable
  if Equal var20 24647 || Equal var20 24649
    var17 = TopNY
  endif
  // correct if estimated y positions go beyond ground level
  // target
  // var17 += var22
  // var17 -= var3
  // if var3 > 0 && Equal OAirGroundState 2
  //   var17 -= var3
  // endif
  // var22 = OTopNY - var3
  // DrawDebugLine OTopNX OTopNY OTopNX var22 255 0 0 221
  var22 = OYDistBackEdge + OTopNY
  if var1 < var22 && Equal OIsOnStage 1
    var22 -= var1
    var1 += var22
  elif Equal OCurrAction 70 || Equal OCurrAction 74 || Equal OCurrAction 84 || Equal OCurrAction 85
    var22 -= var1
    var1 += var22
  elif Equal OAirGroundState 1
    // var17 -= var3
  endif
  if Equal AirGroundState 1
    var17 = TopNY
  endif
  // if !(CalledAs ComboHub)
  //   // self
  //   DrawDebugRectOutline var2 var17 5 5 255 0 0 136
  //   // target
  //   DrawDebugRectOutline var0 var1 5 5 0 0 255 136
  // endif
  // adjust for move parameters
  if var20 >= 24641 && var20 <= 24645
    if Equal AirGroundState 2
      var17 -= var10
      var17 += var12
    endif
  else
    var17 -= var10
    var17 += var12
  endif
  // var17 = var17 - OHurtboxSize * 0.5
  
  // adjust for the move parameters
  if !(InAir) || var20 >= 24632 && var20 <= 24635
    var22 = var9 + (var11 * 2)
    var22 /= 2
    if var22 <= 2
      var2 = var2 - (var9 * OPos)
    else 
      var2 = var2 + (var11 * OPos)
      var2 = var2 + (var9 * OPos)
    endif 
  else
    var2 = var2 + (var11 * Direction)
    var2 = var2 + (var9 * Direction)
  endif
  // if !(Equal SCDBottom TopNY) && var20 >= 24640
  //   var22 = SCDBottom - TopNY
  //   var17 -= var22
  // endif
  // if Equal AirGroundState 2
  //   var17 -= OHurtboxSize
  // endif
  
  // if !(CalledAs ComboHub)
  //   if Equal index 1 || var18 >= 1
  //     // self
  //     DrawDebugRectOutline var2 var17 var11 var12 255 187 0 136
  //   endif
  // endif
  // calculate difference between the two
  
  var0 = var2 - var0
  var1 = var1 - var17
  // adjust for opponent position (aim towards nearest blastzone)
  // if !(Equal var20 32776) && !(Equal var20 25000) && !(CalledAs ComboHub)
  //   var22 = 0
  //   var17 = LBoundary - (TopNX + var0) 
  //   if var17 < 90 && Equal Direction (-1)
  //     var17 = 0.0 + 1
  //     var17 = var11 * (1/var17)
  //     var17 /= 2
  //     var22 += var17
  //   endif
  //   var17 = RBoundary - (TopNX + var0)
  //   if var17 > -90 && Equal Direction 1
  //     var17 = 0.0 + 1
  //     var17 = var11 * (1/var17)
  //     var17 /= 2
  //     var22 -= var17
  //   endif
  //   var0 += var22
  //   if Equal var22 0
  //     var22 = Direction
  //     var17 = 0.0 + 1
  //     var17 = var11 * (1/var17)
  //     var22 *= var17
  //     var22 /= 2
  //     var0 -= var22
  //   endif
  // endif
  // account for target height
  var22 = 0
  SAFE_INJECT_D var22
  var17 = OSCDBottom + OHurtboxSize // top of target
  var2 = var1 * -1
  if var2 >= OHurtboxSize
    // self is above
    var2 = OHurtboxSize
  elif var2 <= 0 
    // self is below
    var2 = 0 // OHurtboxSize * -1
  else 
    // self is between
    var17 = var2 - OHurtboxSize
    // var2 -= var17
    // var2 = var22
  endif
  
  // if Equal AirGroundState 2
    
  //   if Equal OAirGroundState 1
  //     // var2 = var2 + OHurtboxSize * 0.5
  //     var2 += OHurtboxSize
  //   endif
  // endif
  var1 += var2
  if Equal AirGroundState 1 && Equal OAirGroundState 1 && var20 >= 24641 && var20 <= 24645 && SamePlane
    var1 = 0
  endif
  // if !(CalledAs ComboHub)
  //   var0 += TopNX
  //   var1 += TopNY
  //   DrawDebugRectOutline var0 var1 var11 var12 0 255 0 136
  //   var0 -= TopNX
  //   var1 -= TopNY
  //   var17 = 0.0 + 1
  //   var17 = var11 * (1/var17)
  //   var11 = var17
  //   var9 = var9 + var17 * 0.0
  //   var17 = 0.0 + 1
  //   var17 = var12 * (1/var17)
  //   var12 = var17
  //   var10 = var10 - var17 * 0.0
  //   // var17 = TopNY - var10 + var12 + var22
  //   // DrawDebugRectOutline TopNX var17 10 0 0 255 255 136
  //   if CalledAs ApproachHub
  //     var11 -= 2.5
  //     var9 += 5
  //   endif
  //   var22 = (var9 + var11)
  //   var22 *= Direction
  //   var22 += TopNX
  //   var17 = TopNY - var10 + var12
  //   DrawDebugRectOutline var22 var17 var11 var12 136 136 136 136
  //   var17 += var2
    
  //   // if OTopNX > 0
  //   //   var22 += var11
  //   // else
  //   //   var22 -= var11
  //   // endif 
  //   DrawDebugRectOutline var22 var17 var11 var12 255 255 255 136
  //   var22 = OHurtboxSize / 2
  //   var17 = var22 + OSCDBottom
  //   DrawDebugRectOutline OTopNX var17 5 var22 255 255 0 221
    
  //   if CalledAs ApproachHub
  //     var11 += 2.5
  //     var9 -= 5
  //   endif
  //   var17 = var11 * 0.0
  //   var9 -= var17
  //   var11 = var11 + var17
  //   var17 = var12 * 0.0
  //   var10 += var17
  //   var12 = var12 + var17
  // endif
  // if !(CalledAs ComboHub) && LevelValue >= 60 && !(Equal var16 7) 
  //   var17 = var5 - index
  //   var0 = var0 + OXSpeed * var17 * -2
  // endif
  var2 = var11 * (1 + 0.0)
  var3 = var12 * (1 + 0.0)
  var2 *= 2
  var3 *= 2
  if Equal AirGroundState 1
    var2 = var2 + var5 * 2
  else
    var22 = XSpeed
    Abs var22
    var2 = var2 + var5 * var22
  endif
  if NumJumps > 0
    if var20 >= 24641 && var20 <= 24655 || Equal var20 25000 
      var17 = GetJumpHeight
      var3 += var17 
    endif
  endif
  // var0 += TopNX
  // var1 += TopNY
  // DrawDebugRectOutline var0 var1 var2 var3 0 255 0 136
  // var0 -= TopNX
  // var1 -= TopNY
  Abs var0
  Abs var1
  // LOGSTR 1415070720 539959296 1918987776 1734672384 0
  // LOGVAL var0
  // LOGVAL var2
  // LOGSTR 1415136256 539959296 1918987776 1734672384 0
  // LOGVAL var1
  // LOGVAL var3
  if var0 <= var2 && var1 <= var3
      Norm var22 TopNX TopNY
      Norm var17 OTopNX OTopNY
      if var17 > var22
        var2 = 50
      else
        var2 = 0
      endif
      EstOXCoord var0 var5
      EstOYCoord var1 var5
      LOGSTR 1262616576 0 0 0 0
      LOGVAL var15
      COS var17 var8
      var17 *= var15
      LOGVAL var17
      SIN var17 var8
      var17 *= var15
      LOGVAL var17
  Goto KCheck
  if !(True)
    label KCheck
    // LOGSTR 1262708736 1799643392 1952514048 0 0
    COS var22 var8
    var22 *= var15
    var22 *= Direction
    var22 *= 1.2
    var17 = RBoundary - (var0)
    // LOGSTR 1380057088 0 0 0 0
    // LOGVAL var22
    // LOGVAL var17
    if var22 > var17
      var2 = 1
      Return
    endif
    var17 = LBoundary - (var0)
    // LOGSTR 1279393792 0 0 0 0
    // LOGVAL var22
    // LOGVAL var17
    if var22 < var17
      var2 = 1
      Return
    endif
    var17 = TBoundary - (var1)
    SIN var22 var8
    var22 *= var15
    var22 *= 0.7
    // LOGSTR 1413611520 0 0 0 0
    // LOGVAL var22
    // LOGVAL var17
    if var22 > var17
      var2 = 1
      Return
    endif
    var2 = 0
    Return
  endif
      if Equal var2 1
        LOGSTR 1795162112 0 0 0 0
        Seek callMove
        Jump
      endif
      if Equal var21 0
        LOGSTR 1660944384 0 0 0 0
  Goto KBCheck
  if !(True)
    label KBCheck
    if var15 < 40
      var2 = 0
      Return
    endif
    COS var22 var8
    var22 *= var15
    Abs var22
    var17 = 0
    var23 = 120 + var2
    if var22 < var17 || var23 < var22
      var2 = 0
      Return
    endif
    SIN var22 var8
    var22 *= var15
    var17 = 0
    var23 = 120
    if var22 < var17 || var23 < var22
      var2 = 0
      Return
    endif
    var2 = 1
    Return
  endif
        if Equal var2 1
          // LOGSTR 1665360128 1819044096 1852243968 0 0
          Seek callMove
          Jump
        endif
      elif Equal var21 1
        LOGSTR 1778384896 0 0 0 0
  Goto KBCheck
  if !(True)
    label KBCheck
    if var15 < 30
      var2 = 0
      Return
    endif
    COS var22 var8
    var22 *= var15
    Abs var22
    var17 = 0
    var23 = 35 + var2
    if var22 < var17 || var23 < var22
      var2 = 0
      Return
    endif
    SIN var22 var8
    var22 *= var15
    var17 = 0
    var23 = 140
    if var22 < var17 || var23 < var22
      var2 = 0
      Return
    endif
    var2 = 1
    Return
  endif
        if Equal var2 1
          // LOGSTR 1782800640 1819044096 1852243968 0 0
          Seek callMove
          Jump
        endif
      elif Equal var21 3
        LOGSTR 1677721600 0 0 0 0
        if var8 >= 180 && var8 <= 360
          // LOGSTR 1682137344 1819044096 1852243968 0 0
          Seek callMove
          Jump
        endif
      endif
  endif
Return

label callMove

var21 = 32770

if Equal CurrAction 24
  Return
endif

if Equal var18 255
  var18 = 0
endif
if Equal var16 0 
  var16 = 7
endif
if Equal var20 24625
  Call Jab123
elif Equal var20 24637
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
