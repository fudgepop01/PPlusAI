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

// var17 = 15
// DrawDebugRectOutline TopNX TopNY var17 var17 255 255 255 221
// var17 += 15
// DrawDebugRectOutline TopNX TopNY var17 var17 255 170 170 221
// var17 += 15
// DrawDebugRectOutline TopNX TopNY var17 var17 255 119 119 221
// var17 += 15
// DrawDebugRectOutline TopNX TopNY var17 var17 255 68 68 221
// var17 += 15
// DrawDebugRectOutline TopNX TopNY var17 var17 255 0 0 221


if OIsCharOf Bowser
  var2 = 113
  var0 = 0.13
elif OIsCharOf Falcon
  var2 = 104
  var0 = 0.13
elif OIsCharOf Lizardon // Charizard
  var2 = 106
  var0 = 0.105
elif OIsCharOf Diddy
  var2 = 85
  var0 = 0.12
elif OIsCharOf Donkey
  var2 = 109
  var0 = 0.1
elif OIsCharOf Falco
  var2 = 80
  var0 = 0.17
elif OIsCharOf Fox
  var2 = 75
  var0 = 0.23
elif OIsCharOf Gamewatch
  var2 = 75
  var0 = 0.095
elif OIsCharOf Ganondorf
  var2 = 109
  var0 = 0.13
// GIGA BOWSER WOULD GO HERE
// elif OIsCharOf Bowser
//   var2 = 113
//   var0 = 0.13
elif OIsCharOf Nana || OIsCharOf Popo
  var2 = 88
  var0 = 0.1
elif OIsCharOf Ike
  var2 = 100
  var0 = 0.103
elif OIsCharOf Fushigisou // Ivysaur
  var2 = 85
  var0 = 0.075
elif OIsCharOf Purin // Jigglypuff
  var2 = 62
  var0 = 0.064
elif OIsCharOf DDD // King Dedede
  var2 = 107
  var0 = 0.095
elif OIsCharOf Kirby
  var2 = 74
  var0 = 0.08
elif OIsCharOf Knuckles
  var2 = 90
  var0 = 0.14
elif OIsCharOf Link
  var2 = 104
  var0 = 0.11
elif OIsCharOf Lucario
  var2 = 94
  var0 = 0.125
elif OIsCharOf Lucas
  var2 = 80
  var0 = 0.125
elif OIsCharOf Luigi
  var2 = 100
  var0 = 0.069 // nice
elif OIsCharOf Mario
  var2 = 100
  var0 = 0.095
elif OIsCharOf Marth
  var2 = 87
  var0 = 0.085
elif OIsCharOf Metaknight
  var2 = 79
  var0 = 0.11
elif OIsCharOf Mewtwo
  var2 = 90
  var0 = 0.082
elif OIsCharOf Ness
  var2 = 94
  var0 = 0.09
elif OIsCharOf Pikmin // Olimar
  var2 = 90
  var0 = 0.09
elif OIsCharOf Peach
  var2 = 90
  var0 = 0.08
elif OIsCharOf Pikachu
  var2 = 80
  var0 = 0.11
elif OIsCharOf Pit
  var2 = 80
  var0 = 0.095
elif OIsCharOf Robot // ROB
  var2 = 104
  var0 = 0.09
elif OIsCharOf Roy
  var2 = 85
  var0 = 0.114
elif OIsCharOf Samus
  var2 = 110
  var0 = 0.66
elif OIsCharOf Shiek
  var2 = 90
  var0 = 0.12
elif OIsCharOf Snake
  var2 = 105
  var0 = 0.098
elif OIsCharOf Sonic
  var2 = 82
  var0 = 0.122
elif OIsCharOf Zenigame // Squirtle
  var2 = 85
  var0 = 0.126
elif OIsCharOf Toonlink
  var2 = 85
  var0 = 0.11
elif OIsCharOf Wario
  var2 = 102
  var0 = 0.112
// WARIO MAN GOES HERE
// elif OIsCharOf Bowser
//   var2 = 113
//   var0 = 0.13
elif OIsCharOf Wolf
  var2 = 85
  var0 = 0.16
elif OIsCharOf Yoshi
  var2 = 108
  var0 = 0.093
elif OIsCharOf Zelda
  var2 = 90
  var0 = 0.073
elif OIsCharOf ZSS // Zero Suit Samus
  var2 = 85
  var0 = 0.135
endif

var2 /= 100
var2 *= ODamage

if Equal var16 -1
  var16 = 65535
endif

// LOGSTR 1668246784 1651460096 1969356800 0 0
// if Equal var20 24625
//   if var2 > 20
//     if var1 > 30
//       Call UAir
//     elif var1 > 10
//       Call FAir
//     else
//       Call DAir
//     endif
//   endif
// elif Equal var20 24626
//   if var2 < 40 && Equal OAirGroundState 1
//     var0 = Rnd * 2
//     if var0 < 1
//       Call Grab
//     elif var0 < 2
//       Call Jab123
//     endif
//   else
//     Call DAir
//   endif
// elif Equal var20 24627
// if Equal var20 24628
//   if var2 < 50 && OYDistFloor > -20
//     var0 = Rnd * 3
//     if var0 < 1
//       Call Grab
//     elif var0 < 2
//       Call Jab123
//     else
//       Call DAir
//     endif
//   elif var2 < 80
//     var0 = Rnd * 2
//     if var0 < 1
//       Call DAir
//     elif var0 < 2
//       Call UAir
//     endif
//   elif True
//     if var1 < 15
//       Call DAir
//     else
//       Call FAir
//     endif
//   endif
if Equal var20 24636
  // LOGSTR 1735549440 1131241984 1862270976 0 0
  if Equal var19 4
    if var2 > 80
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
    if var2 > 60 && var1 > 25
      Call FAir
    elif var1 > 25 && OYSpeed > 0.15
      Call UAir
    endif
    var0 = Rnd * 3
    if var2 > 40 && var0 < 2
      Call DAir
    else
      var19 = 1
      Call Grab
    endif
  endif
endif
if Equal var20 24641
  if var16 < 4 && var1 < 30 && Rnd < 0.5 && OYDistFloor > -10 && SamePlane
    Call Grab
  endif
endif
// // elif Equal var20 24642
// //   if var1 > 20
// //     Call FAir
// //   else
// //     Call UAir
// //   endif
// // elif Equal var20 24643
// //   if var2 > 60
// //     Call FAir
// //   else
// //     Call UAir
// //   endif
if Equal var20 24644
  if MeteoChance
    Call FAir
  elif var1 < 20 && YDistBackEdge > -10 && var2 > 60
    Call FAir
  endif
endif
if Equal var20 24645
  if var2 > 100 && var1 > 30
    Call UAir
  elif var2 > 70 && var1 > 30
    if Rnd < 0.8
      Call FAir
    else
      Call UAir
    endif
  elif var2 > 60 && var1 > 18
    if Rnd < 0.8
      Call FAir
    else
      Call UAir
    endif
  elif var1 > 35
    Call UAir
  elif True
    if Rnd < 0.7
      Call DAir
    elif Rnd < 0.1 && OYDistFloor > -5
      Call Jab123
    elif Rnd < 0.3 && OYDistFloor > -8
      Call USmash
    endif
  endif
endif
if Equal var20 24633
  if var2 > 70
    Call FAir
  elif var2 > 30
    if Rnd < 0.2
      Call DAir
    elif Rnd < 0.2
      Call BAir
    else
      Call UAir
    endif
  endif
  Call NAir
endif

if OYDistBackEdge > -5 && Equal OCurrAction 73 && Rnd < 0.75
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
    if Rnd < 0.1 || Equal CurrAction 10
      Button X
    elif Rnd < 0.05 && YDistBackEdge < -25
      ClearStick
      Stick -1 0
    elif Rnd < 0.1
      Button R
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

var2 = OFramesHitstun
var2 += 0

if YDistBackEdge < -25
  if var1 < 0
    Call DAir
  elif var1 < 15
    Call FAir
  elif var1 < 30
    Call UAir
  endif
endif
if var1 < 15
  var0 = Rnd
  if var0 < 0.2 && var2 >= 20
    Call SSpecial
  elif var0 < 0.4 && var2 >= 16
    Call DAir
  elif var0 < 0.6 && var2 >= 10
    Call DTilt
  elif var0 < 0.8 && var2 >= 17
    Call UTilt
  else
    Call DAir
  endif
elif var1 < 30
  if XDistLE 30
    var0 = Rnd
    if var0 < 0.4
      Call Grab
    elif var0 < 0.45 && var2 >= 3
      Call Jab123
    elif var0 < 0.55 && var2 >= 10
      Call DTilt
    elif var0 < 0.75 && var2 >= 16
      Call DAir
    else
      Call NAir
    endif
  elif Rnd < 0.5
    Call NAir
  endif
elif var1 < 45
  if XDistLE 45
    if var2 > 70
      Call DAir
    else
      Call NAir
    endif
  elif True
    if var2 > 70
      Call FAir
    else
      Call NAir
    endif
  endif
elif var1 < 60
  if XDistLE 15
    if var2 > 70
      Call FAir
    else
      Call DAir
    endif
  elif XDistLE 30
    Call FAir
  else
    Call UAir
  endif
elif True
  if var2 > 70 && XDistLE 30
    Call FAir
  elif var2 > 20
    Call UAir
  else
    Call NAir
  endif
endif

var19 = 256
Call AIHub
Return
Return
