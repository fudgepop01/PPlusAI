// THROW HANDLER
// is ALWAYS called whenever a successfully grab occurs
#include <Definition_AIMain.h>
//TrueID=0x1120
id 0x1120

//Set Unknown
unk 0x0

if ODamage > 160
  var0 = 4
elif ODamage > 120
  var0 = 3
elif ODamage > 80
  var0 = 2
elif ODamage > 40
  var0 = 1
else
  var0 = 0
endif

if OIsCharOf Bowser
  var1 = 113
  var2 = 0.13
elif OIsCharOf Falcon
  var1 = 104
  var2 = 0.13
elif OIsCharOf Lizardon // Charizard
  var1 = 106
  var2 = 0.105
elif OIsCharOf Diddy
  var1 = 85
  var2 = 0.12
elif OIsCharOf Donkey
  var1 = 109
  var2 = 0.1
elif OIsCharOf Falco
  var1 = 80
  var2 = 0.17
elif OIsCharOf Fox
  var1 = 75
  var2 = 0.23
  // 2.8
elif OIsCharOf Gamewatch
  var1 = 75
  var2 = 0.095
elif OIsCharOf Ganondorf
  var1 = 109
  var2 = 0.13
// GIGA BOWSER WOULD GO HERE
// elif OIsCharOf Bowser
//   var1 = 113
//   var2 = 0.13
elif OIsCharOf Nana || OIsCharOf Popo
  var1 = 88
  var2 = 0.1
elif OIsCharOf Ike
  var1 = 100
  var2 = 0.103
elif OIsCharOf Fushigisou // Ivysaur
  var1 = 85
  var2 = 0.075
elif OIsCharOf Purin // Jigglypuff
  var1 = 62
  var2 = 0.064
elif OIsCharOf DDD // King Dedede
  var1 = 107
  var2 = 0.095
elif OIsCharOf Kirby
  var1 = 74
  var2 = 0.08
elif OIsCharOf Knuckles
  var1 = 90
  var2 = 0.14
elif OIsCharOf Link
  var1 = 104
  var2 = 0.11
elif OIsCharOf Lucario
  var1 = 94
  var2 = 0.125
elif OIsCharOf Lucas
  var1 = 80
  var2 = 0.125
elif OIsCharOf Luigi
  var1 = 100
  var2 = 0.069 // nice
  // 1.6
elif OIsCharOf Mario
  var1 = 100
  var2 = 0.095 // 1.7
elif OIsCharOf Marth
  var1 = 87
  var2 = 0.085
elif OIsCharOf Metaknight
  var1 = 79
  var2 = 0.11
elif OIsCharOf Mewtwo
  var1 = 90
  var2 = 0.082
elif OIsCharOf Ness
  var1 = 94
  var2 = 0.09
elif OIsCharOf Pikmin // Olimar
  var1 = 90
  var2 = 0.09
elif OIsCharOf Peach
  var1 = 90
  var2 = 0.08
elif OIsCharOf Pikachu
  var1 = 80
  var2 = 0.11
elif OIsCharOf Pit
  var1 = 80
  var2 = 0.095
elif OIsCharOf Robot // ROB
  var1 = 104
  var2 = 0.09
elif OIsCharOf Roy
  var1 = 85
  var2 = 0.114
elif OIsCharOf Samus
  var1 = 110
  var2 = 0.66
elif OIsCharOf Shiek
  var1 = 90
  var2 = 0.12
elif OIsCharOf Snake
  var1 = 105
  var2 = 0.098
elif OIsCharOf Sonic
  var1 = 82
  var2 = 0.122
elif OIsCharOf Zenigame // Squirtle
  var1 = 85
  var2 = 0.126
elif OIsCharOf Toonlink
  var1 = 85
  var2 = 0.11
elif OIsCharOf Wario
  var1 = 102
  var2 = 0.112
// WARIO MAN GOES HERE
// elif OIsCharOf Bowser
//   var1 = 113
//   var2 = 0.13
elif OIsCharOf Wolf
  var1 = 85
  var2 = 0.16
elif OIsCharOf Yoshi
  var1 = 108
  var2 = 0.093
elif OIsCharOf Zelda
  var1 = 90
  var2 = 0.073
elif OIsCharOf ZSS // Zero Suit Samus
  var1 = 85
  var2 = 0.135
endif

var1 = var1 - 200
var1 *= -1
var1 /= 100
var1 *= ODamage

label
ClearStick
if CurrAction < 52 || CurrAction > 60
  Call AIHub
elif Equal CurrAction 57
  if var0 > 0
    Button A
    var0 -= 1
    Return
  elif True
    if DistFrontEdge < 25
      if ODamage > 60 && Rnd < 0.5
        Stick 0 1
        var19 = 5
      elif ODamage > 20
        Stick 1
        var19 = 2
      else
        Stick 0 (-1)
        var19 = 3
      endif
    elif DistBackEdge < 25
      if ODamage > 60 && Rnd < 0.5
        Stick 0 1
        var19 = 5
      else
        Stick (-1)
        var19 = 4
      endif
    elif ODamage > 80
      Stick 0 1
      var19 = 5
    elif ODamage > 30
      var1 = Rnd * 2
      if var1 < 1
        Stick 0 1
        var19 = 5
      else
        Stick 0 (-1)
        var19 = 3
      endif
    else
      Stick 0 (-1)
      var19 = 3
    endif
  endif
  Return
endif
Return
Return

