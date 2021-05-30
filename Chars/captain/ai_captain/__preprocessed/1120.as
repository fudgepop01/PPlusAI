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

label _begin

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

ClearStick
label
if CurrAction < 52 || CurrAction > 60
  Call AIHub
elif Equal CurrAction 57
  if var0 > 0
    Button A
    var0 -= 1
    Return
  elif True

    if Equal Direction 1
      var2 = RBoundary - TopNX
      var3 = LBoundary - TopNX
    else
      var3 = RBoundary - TopNX
      var2 = LBoundary - TopNX
    endif
    var4 = TBoundary - TopNY


    LOGSTR 1717726976 1970168832 0 0 0
    if var2 < 120
var5 = 215
var8 = 363
var6 = 193
var7 = 192

      var4 = 5
      label
      var4 -= 1
      if var4 < 0
        Seek
        Jump
      endif
      if var5 < var1 && Rnd < 0.4
        Goto fthrow
        Seek _begin
      elif var7 < var1 && Rnd < 0.4
        Goto uthrow
        Seek _begin
      elif var8 < var1 && Rnd < 0.4
        Goto dthrow
        Seek _begin
      elif var6 < var1 && Rnd < 0.4
        Goto bthrow
        Seek _begin
      endif
      Return
      label
      if Rnd < 0.7
        if Rnd < 0.5
          Goto dthrow
        else
          Goto fthrow
        endif
        Seek _begin 
        Return
      endif
    endif
    LOGSTR 1650618112 1970168832 0 0 0
    if var3 < 120
var5 = 215
var8 = 363
var6 = 193
var7 = 192

      var4 = 5
      label
      var4 -= 1
      if var4 < 0
        Seek
        Jump
      endif
      if var6 < var1 && Rnd < 0.4
        Goto fthrow
        Seek _begin
      elif var7 < var1 && Rnd < 0.4
        Goto uthrow
        Seek _begin
      elif var8 < var1 && Rnd < 0.4
        Goto dthrow
        Seek _begin
      elif var5 < var1 && Rnd < 0.4
        Goto bthrow
        Seek _begin
      endif
      label
      if Rnd < 0.7
        if Rnd < 0.5
          Goto uthrow
        else
          Goto bthrow
        endif
        Seek _begin 
        Return
      endif
      Return
    endif
    LOGSTR 1969385216 1970168832 0 0 0
    if var4 < 350
var5 = 351
var8 = 643
var6 = 302
var7 = 355

      var4 = 5
      label
      var4 -= 1
      if var4 < 0
        Seek
        Jump
      endif
      if var6 < var1 && Rnd < 0.4
        Goto fthrow
        Seek _begin
      elif var7 < var1 && Rnd < 0.4
        Goto uthrow
        Seek _begin
      elif var8 < var1 && Rnd < 0.4
        Goto dthrow
        Seek _begin
      elif var5 < var1 && Rnd < 0.4
        Goto bthrow
        Seek _begin
      endif
    endif
    label

    LOGSTR 1634495488 544175360 1946157056 0 0
var5 = 34
var8 = -10
var6 = 46
var7 = -26

    Seek _begin

    if var1 < var8 && Rnd < 0.5
      Goto dthrow
      Return
    elif var1 < var7 && Rnd < 0.8
      Goto uthrow
      Return
    endif

    if var2 < var3
      Goto fthrow
      Return
    else
      Goto bthrow
      Return
    endif
    LOGSTR 1701733376 0 0 0 0
  endif
  Return
endif
Return

label fthrow
  Stick 1 0
  var19 = 2
Return

label bthrow
  Stick (-1) 0
  var19 = 4
Return

label uthrow
  Stick 0 1
  var19 = 5
Return

label dthrow
  Stick 0 (-1)
  var19 = 3
Return
Return
Return

