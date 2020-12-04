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
if Equal var20 24625
  // ...thus we'll end up here
  if var2 > 20
    if var1 > 45
      Call UAir
    elif var1 > 15
      Call FAir
    else
      Call DAir
    endif
  endif
elif Equal var20 24626
  if var2 < 40 && Equal OAirGroundState 1
    var0 = Rnd * 2
    if var0 < 1
      Call Grab
    elif var0 < 2
      Call Jab123
    endif
  else
    Call DAir
  endif
// elif Equal var20 24627
elif Equal var20 24628
  if var2 < 50
    var0 = Rnd * 2
    if var0 < 1
      Call Grab
    elif var0 < 2
      Call Jab123
    endif
  elif var2 < 90
    var0 = Rnd * 2
    if var0 < 1
      Call DAir
    elif var0 < 2
      Call UAir
    endif
  else
    Call FAir
  endif
elif Equal var20 24636
  // LOGSTR 1735549440 1131241984 1862270976 0 0
  if Rnd < 0.05
    Call UAir
  endif
  if Equal var19 4
    if XDistLE 30
      Call FAir
    elif var1 > 20
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
elif Equal var20 24641
  if var16 < 2 && var1 < 30
    Call Grab
  endif
  if var1 < 25
    Call NAir
  else
    Call UAir
  endif
elif Equal var20 24642
  if var1 > 20
    Call FAir
  else
    Call UAir
  endif
elif Equal var20 24643
  if var2 > 60
    Call FAir
  else
    Call UAir
  endif
elif Equal var20 24644
  if var2 > 60 && var1 > 30 && var1 < 60
    Call FAir
  elif MeteoChance && var1 < 80
    Call FAir
  else
    Call UAir
  endif
elif Equal var20 24645
  if Equal OAirGroundState 1 && OCurrAction <= 32 || Equal OCurrAction 77 || Equal OFramesHitstun 0
    Call AIHub
  endif
  if OYSpeed <= 0.1
    Return
  endif

  // LOGSTR 1870226432 1769174016 0 0 0
  // LOGVAL var1
  if var2 > 70 && var1 > 40
    if Rnd < 0.8
      Call FAir
    else
      Call UAir
    endif
  elif var2 > 60 && var1 > 25
    if Rnd < 0.8
      Call FAir
    else
      Call UAir
    endif
  elif var1 > 35
    Call UAir
  elif True
    if Rnd < 0.9
      Call DAir
    else
      Call USmash
    endif
  endif
elif Equal var20 24633
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

var19 = 256
Call AIHub
Return
Return
