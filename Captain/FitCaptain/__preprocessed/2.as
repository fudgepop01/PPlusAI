// COMBO HUB
// a place for determining the next best attack when an opponent is in hitstun
#include <Definition_AIMain.h>
id 0x8002

unk 0x0

// each var20 corresponds to a move routine... so like 6031 means jab
// was the last move used...

ClearStick
var18 = 0

var21 = 32770

var1 = OTopNY - TopNY




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
elif OIsCharOf Mario
  var8 = 100
  var0 = 0.095
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

var8 /= 100
var8 *= ODamage

if Equal var16 -1
  var16 = 65535
endif

  if Equal var20 24636
    // LOGSTR 1735549440 1131241984 1862270976 0 0
    if Equal var19 4
      if var8 > 50
        if XDistLE 20
          Call FAir
        else
          Call UAir
        endif
      elif var1 > 25
        Call UAir
      else
        Call NAir
      endif
    elif Equal var19 2
      if var8 > 50 && var1 > 25
        Call FAir
      elif var1 > 25 && OYSpeed > 0.15
        Call UAir
      endif
      var0 = Rnd * 3
      if var8 > 40 && var0 < 2
        Call DAir
      else
        var19 = 1
        Call Grab
      endif
    endif
  endif
  if var16 < 4
    Goto grab
    var7 = 8
    if OYDistBackEdge < -5
      var19 = 1
    endif
    Goto analyze
  endif
  if var8 > 50
    Goto fair
    var7 = 2
  else
    Goto dair
    var7 = 2
  endif
  Goto analyze

if OYDistBackEdge > -5 && Equal OCurrAction 73 && Rnd < 0.7
  Seek techChase_wait
  Jump
endif
Seek contCombo
Jump
Return

label techChase_wait
  SetTimeout 300
  var0 = Rnd * 100
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

GetNearestCliff var0
var0 = TopNX - var0
var0 *= -1

var17 = OTopNX - (TopNX + var0) 
Abs var0
Abs var17

if var17 < var0 && OYDistBackEdge > -60 && var17 < 20
  var6 = 10
  label edgeguard
  var17 = Rnd * 8
  if var17 < 1
    Goto ftilt
  elif var17 < 2
    Goto utilt
  elif var17 < 3
    Goto fsmash
  elif var17 < 4
    Goto dtilt
  elif var17 < 5
    Goto nair
  elif var17 < 6
    Goto fair
    var7 = 5
  elif var17 < 7
    Goto uair
    var7 = 10
  elif var17 < 8
    Goto dair
  endif
  Seek edgeguard
elif Equal OIsOnStage 1 && OYDistBackEdge > -90
  if var8 < 80
    var6 = 10
    label combo
  var17 = Rnd * 6
  if var17 < 1
    Goto dtilt
    var7 = 5
  elif var17 < 2
    Goto uair
    var7 = 10
  elif var17 < 3
    Goto nair
  elif var17 < 4
    Goto dair
  elif var17 < 5
    Goto usmash
  elif var17 < 6
    Goto grab
  endif
    Seek combo
  else
    var6 = 10
    label kill
  var17 = Rnd * 4
  if var17 < 1
    Goto fsmash
  elif var17 < 2
    Goto fair
  elif var17 < 3
    Goto usmash
  elif var17 < 4
    Goto dair
  endif
    Seek kill
  endif
else
  var6 = 10
  label juggle
  var17 = Rnd * 3
  if var17 < 1
    Goto uair
  elif var17 < 2
    Goto fair
  elif var17 < 3
    Goto usmash
  endif
  Seek juggle
endif
Goto analyze
var6 -= 1
if var6 <= 0
  Seek NCombo
  Jump
endif
Jump
Return

label NCombo

var19 = 256
Call AIHub
Return

label jab123
  var20 = 24625
  var9 = 1
  var10 = -9
  var11 = 8
  var12 = 2
  var13 = 3
  var14 = 5
  var15 = 14
Return

label ftilt
  var20 = 24626
  var9 = 1
  var10 = -9
  var11 = 9
  var12 = 3
  var13 = 9
  var14 = 11
  var15 = 30
Return

label utilt
  var20 = 24627
  var9 = 1
  var10 = 2
  var11 = 7
  var12 = 13
  var13 = 17
  var14 = 22
  var15 = 38
Return

label dtilt
  var20 = 24628
  var9 = 1
  var10 = 0
  var11 = 10
  var12 = 5
  var13 = 10
  var14 = 15
  var15 = 35
Return

label fsmash
  var20 = 24629
  var9 = 3
  var10 = -7
  var11 = 8
  var12 = 3
  var13 = 19
  var14 = 21
  var15 = 49
Return

label usmash
  var20 = 24630
  var9 = -1
  var10 = -3
  var11 = 6
  var12 = 13
  var13 = 22
  var14 = 29
  var15 = 41
Return

label dsmash
  var20 = 24631
  var9 = 9999.9999
  var10 = 9999.9999
  var11 = 9999.9999
  var12 = 9999.9999
  var13 = 9999.9999
  var14 = 9999.9999
  var15 = 9999.9999
Return

label nspecial
  var20 = 24632
  var9 = 9999.9999
  var10 = 9999.9999
  var11 = 9999.9999
  var12 = 9999.9999
  var13 = 9999.9999
  var14 = 9999.9999
  var15 = 9999.9999
Return

label sspecial
  var20 = 24633
  var9 = 0
  var10 = 0
  var11 = 20
  var12 = 10
  var13 = 20
  var14 = 20
  var15 = 26
Return

label uspecial
  var20 = 24634
  var9 = 9999.9999
  var10 = 9999.9999
  var11 = 9999.9999
  var12 = 9999.9999
  var13 = 9999.9999
  var14 = 9999.9999
  var15 = 9999.9999
Return

label dspecial
  var20 = 24635
  var9 = 9999.9999
  var10 = 9999.9999
  var11 = 9999.9999
  var12 = 9999.9999
  var13 = 9999.9999
  var14 = 9999.9999
  var15 = 9999.9999
Return

label grab
  var20 = 24636
  var9 = 1
  var10 = -6
  var11 = 3
  var12 = 4
  var13 = 7
  var14 = 8
  var15 = 32
Return

label nair
  var20 = 24641
  var9 = -4
  var10 = -3
  var11 = 10
  var12 = 3
  var13 = 7
  var14 = 12
  var15 = 45
Return

label fair
  var20 = 24642
  var9 = 1
  var10 = 0
  var11 = 6
  var12 = 6
  var13 = 14
  var14 = 16
  var15 = 36
Return

label bair
  var20 = 24643
  var9 = -15
  var10 = -2
  var11 = 7
  var12 = 4
  var13 = 10
  var14 = 17
  var15 = 29
Return

label uair
  var20 = 24644
  var9 = 0
  var10 = -3
  var11 = 8
  var12 = 8
  var13 = 6
  var14 = 10
  var15 = 30
Return

label dair
  var20 = 24645
  var9 = -4
  var10 = 10
  var11 = 5
  var12 = 12
  var13 = 16
  var14 = 20
  var15 = 38
Return

label analyze

var17 = OFramesHitstun + var7
if var17 < var13
  var7 = 0
  Return
endif

if var20 >= 24641 && var20 <= 24655
  if !(InAir)
    var13 += 4
  endif
endif

var3 = 0
  SAFE_INJECT_4 var9
  SAFE_INJECT_5 var10
  SAFE_INJECT_6 var11
  SAFE_INJECT_7 var12
  var17 = OTopNY + OHurtboxSize
  var2 = var12 / 2
  var2 = TopNY - var10 + var2
  if var2 > var17
    var2 = OHurtboxSize * -1
  elif var2 < OTopNY
    var2 = 0
  else
    var17 = (var17 - var2)
    var17 = var17 * -1
    var2 = OHurtboxSize / var17
  endif
  // if Equal var8 0 || Equal var8 1 || Equal var18 1
  //   var0 = TopNX + (var9 * Direction)
  //   var0 = var0 + (var11 * Direction)
  //   var1 = TopNY - var10 + var12
  //   DrawDebugRectOutline var0 var1 var11 var12 255 68 68 153
  //   var1 += var2
  //   if var10 > -2 && var20 >= 24641 && var20 <= 24655
  //     var1 = var1 + var10 + 2 - var2
  //   endif
  //   if Equal PlayerNum 0
  //     DrawDebugRectOutline var0 var1 var11 var12 255 68 68 153
  //   elif Equal PlayerNum 1
  //     DrawDebugRectOutline var0 var1 var11 var12 68 68 255 153
  //   elif Equal PlayerNum 2
  //     DrawDebugRectOutline var0 var1 var11 var12 255 255 68 153
  //   elif Equal PlayerNum 3
  //     DrawDebugRectOutline var0 var1 var11 var12 68 255 68 153
  //   else
  //     DrawDebugRectOutline var0 var1 var11 var12 68 68 68 153
  //   endif
  //   var3 = OHurtboxSize / 2
  //   var17 = OTopNY + var3
  //   DrawDebugRectOutline OTopNX var17 var11 var3 68 255 68 153
  // endif
  var17 = 0
 // SAFE_INJECT_1 var17
  var17 = var13 + var3 + var17
  var17 /= 60
  EstOPosVecR var0 var1 var17
  // convert the values to use TopN X and Y instead of character's coordinates
  var17 = ExactOXCoord - ExactXCoord
  var17 = var17 - (OTopNX - TopNX)
  var0 = var0 - var17
  var17 = ExactOYCoord - ExactYCoord
  var17 = var17 - (OTopNY - TopNY)
  var1 = var1 - var17
  var0 += TopNX
  var17 = var9 + (var11 * 2)
  var17 /= 2
  if var17 <= -1
    var0 = var0 - (var11 * OPos * -1)
    var0 = var0 - (var9 * OPos * -1)
  else
    var0 = var0 - (var11 * Direction)
    var0 = var0 - (var9 * Direction)
  endif
  var1 += TopNY
  var17 = var2 * 2
  var1 -= var17
  var1 = var1 - var12
  var1 += var10
  // if Equal var8 0 || Equal var8 1 || Equal var18 1
  //   DrawDebugRectOutline var0 var1 var11 var12 255 0 0 136
  // endif
  var0 -= TopNX
  var1 -= TopNY

var11 *= 2
var12 *= 2
Abs var0
Abs var1

var11 = var11 + var13 * 2.3
if var20 >= 24641 && var20 <= 24655
  var12 += 40
endif

if var0 <= var11 && var1 <= var12
  Seek callMove
  Jump
endif

  SAFE_INJECT_4 var9
  SAFE_INJECT_5 var10
  SAFE_INJECT_6 var11
  SAFE_INJECT_7 var12
  var17 = OTopNY + OHurtboxSize
  var2 = var12 / 2
  var2 = TopNY - var10 + var2
  if var2 > var17
    var2 = OHurtboxSize * -1
  elif var2 < OTopNY
    var2 = 0
  else
    var17 = (var17 - var2)
    var17 = var17 * -1
    var2 = OHurtboxSize / var17
  endif
  // if Equal var8 0 || Equal var8 1 || Equal var18 1
  //   var0 = TopNX + (var9 * Direction)
  //   var0 = var0 + (var11 * Direction)
  //   var1 = TopNY - var10 + var12
  //   DrawDebugRectOutline var0 var1 var11 var12 255 68 68 153
  //   var1 += var2
  //   if var10 > -2 && var20 >= 24641 && var20 <= 24655
  //     var1 = var1 + var10 + 2 - var2
  //   endif
  //   if Equal PlayerNum 0
  //     DrawDebugRectOutline var0 var1 var11 var12 255 68 68 153
  //   elif Equal PlayerNum 1
  //     DrawDebugRectOutline var0 var1 var11 var12 68 68 255 153
  //   elif Equal PlayerNum 2
  //     DrawDebugRectOutline var0 var1 var11 var12 255 255 68 153
  //   elif Equal PlayerNum 3
  //     DrawDebugRectOutline var0 var1 var11 var12 68 255 68 153
  //   else
  //     DrawDebugRectOutline var0 var1 var11 var12 68 68 68 153
  //   endif
  //   var3 = OHurtboxSize / 2
  //   var17 = OTopNY + var3
  //   DrawDebugRectOutline OTopNX var17 var11 var3 68 255 68 153
  // endif
  var17 = 0
 // SAFE_INJECT_1 var17
  var17 = OFramesHitstun + var3 + var17
  var17 /= 60
  EstOPosVecR var0 var1 var17
  // convert the values to use TopN X and Y instead of character's coordinates
  var17 = ExactOXCoord - ExactXCoord
  var17 = var17 - (OTopNX - TopNX)
  var0 = var0 - var17
  var17 = ExactOYCoord - ExactYCoord
  var17 = var17 - (OTopNY - TopNY)
  var1 = var1 - var17
  var0 += TopNX
  var17 = var9 + (var11 * 2)
  var17 /= 2
  if var17 <= -1
    var0 = var0 - (var11 * OPos * -1)
    var0 = var0 - (var9 * OPos * -1)
  else
    var0 = var0 - (var11 * Direction)
    var0 = var0 - (var9 * Direction)
  endif
  var1 += TopNY
  var17 = var2 * 2
  var1 -= var17
  var1 = var1 - var12
  var1 += var10
  // if Equal var8 0 || Equal var8 1 || Equal var18 1
  //   DrawDebugRectOutline var0 var1 var11 var12 255 0 0 136
  // endif
  var0 -= TopNX
  var1 -= TopNY

var11 *= 2
var12 *= 2
Abs var0
Abs var1

var11 = var11 + var13 * 2.3 / 2
if var20 >= 24641 && var20 <= 24655
  var12 += 10
endif

if var0 <= var11 && var1 <= var12
  Seek callMove
  Jump
endif
var7 = 0
Return

label callMove

var18 = 0
if Equal var20 24625
  Call Jab123
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
