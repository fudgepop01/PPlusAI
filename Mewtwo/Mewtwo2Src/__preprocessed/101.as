// HOVER HUB
// controls how mewtwo behaves during hover

id 0x8101

unk 0x00000

var21 = 33025

if !(Equal CurrAction 288)
  Call AIHub
endif

// to keep hover going
Button X

if YDistBackEdge > 60
  Call ChrSpecific3
endif

if !(Equal XDistBackEdge XDistFrontEdge)
  var18 = 0
  var16 = 255


if OIsCharOf Bowser
  var2 = 113
  var1 = 0.13
elif OIsCharOf Falcon
  var2 = 104
  var1 = 0.13
elif OIsCharOf Lizardon // Charizard
  var2 = 106
  var1 = 0.105
elif OIsCharOf Diddy
  var2 = 85
  var1 = 0.12
elif OIsCharOf Donkey
  var2 = 109
  var1 = 0.1
elif OIsCharOf Falco
  var2 = 80
  var1 = 0.17
elif OIsCharOf Fox
  var2 = 75
  var1 = 0.23
elif OIsCharOf Gamewatch
  var2 = 75
  var1 = 0.095
elif OIsCharOf Ganondorf
  var2 = 109
  var1 = 0.13
// GIGA BOWSER WOULD GO HERE
// elif OIsCharOf Bowser
//   var2 = 113
//   var1 = 0.13
elif OIsCharOf Nana || OIsCharOf Popo
  var2 = 88
  var1 = 0.1
elif OIsCharOf Ike
  var2 = 100
  var1 = 0.103
elif OIsCharOf Fushigisou // Ivysaur
  var2 = 85
  var1 = 0.075
elif OIsCharOf Purin // Jigglypuff
  var2 = 62
  var1 = 0.064
elif OIsCharOf DDD // King Dedede
  var2 = 107
  var1 = 0.095
elif OIsCharOf Kirby
  var2 = 74
  var1 = 0.08
elif OIsCharOf Knuckles
  var2 = 90
  var1 = 0.14
elif OIsCharOf Link
  var2 = 104
  var1 = 0.11
elif OIsCharOf Lucario
  var2 = 94
  var1 = 0.125
elif OIsCharOf Lucas
  var2 = 80
  var1 = 0.125
elif OIsCharOf Luigi
  var2 = 100
  var1 = 0.069 // nice
elif OIsCharOf Mario
  var2 = 100
  var1 = 0.095
elif OIsCharOf Marth
  var2 = 87
  var1 = 0.085
elif OIsCharOf Metaknight
  var2 = 79
  var1 = 0.11
elif OIsCharOf Mewtwo
  var2 = 90
  var1 = 0.082
elif OIsCharOf Ness
  var2 = 94
  var1 = 0.09
elif OIsCharOf Pikmin // Olimar
  var2 = 90
  var1 = 0.09
elif OIsCharOf Peach
  var2 = 90
  var1 = 0.08
elif OIsCharOf Pikachu
  var2 = 80
  var1 = 0.11
elif OIsCharOf Pit
  var2 = 80
  var1 = 0.095
elif OIsCharOf Robot // ROB
  var2 = 104
  var1 = 0.09
elif OIsCharOf Roy
  var2 = 85
  var1 = 0.114
elif OIsCharOf Samus
  var2 = 110
  var1 = 0.66
elif OIsCharOf Shiek
  var2 = 90
  var1 = 0.12
elif OIsCharOf Snake
  var2 = 105
  var1 = 0.098
elif OIsCharOf Sonic
  var2 = 82
  var1 = 0.122
elif OIsCharOf Zenigame // Squirtle
  var2 = 85
  var1 = 0.126
elif OIsCharOf Toonlink
  var2 = 85
  var1 = 0.11
elif OIsCharOf Wario
  var2 = 102
  var1 = 0.112
// WARIO MAN GOES HERE
// elif OIsCharOf Bowser
//   var2 = 113
//   var1 = 0.13
elif OIsCharOf Wolf
  var2 = 85
  var1 = 0.16
elif OIsCharOf Yoshi
  var2 = 108
  var1 = 0.093
elif OIsCharOf Zelda
  var2 = 90
  var1 = 0.073
elif OIsCharOf ZSS // Zero Suit Samus
  var2 = 85
  var1 = 0.135
endif

  var2 /= 100
  var2 *= ODamage

  if var2 > 60 && OYDistBackEdge < -5 && Equal OIsOnStage 1 && XDistLE 30
    var19 = 1
    Call NAir
  elif Equal Direction OPos
    Call FAir
  else
    Call BAir
  endif

  Call NAir
endif

Return
Return

