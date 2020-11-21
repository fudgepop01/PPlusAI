#include <Definition_AIMain.h>
//TrueID=0x6040
id 0x6040

//Set Unknown
unk 0x00000

//Strings

// sets up offsets to get to target position
if Equal var18 0
  if CalledAs NAir
    var20 = 24641
    var9 = 17
    var10 = -2
    var11 = 10
    var12 = 10
    var13 = 14
  elif CalledAs FAir
    var20 = 24642
    var9 = 8
    var10 = -4
    var11 = 6
    var12 = 4
    var13 = 23
  elif CalledAs BAir
    var20 = 24643
    var9 = -7
    var10 = -5
    var11 = 10
    var12 = 4
    var13 = 10
  elif CalledAs UAir
    var20 = 24644
    var9 = 5
    var10 = -13
    var11 = 10
    var12 = 15
    var13 = 6
  elif CalledAs DAir
    var20 = 24645
    var9 = 0
    var10 = 7
    var11 = 10
    var12 = 3
    var13 = 16
  else
    Call AIHub
  endif
  if Equal var21 2 && OFramesHitstun < 1
    Call DefendHub
  else
    Call ApproachHub
  endif
elif Equal AirGroundState 2 && Equal var18 1
  ClearStick
  var14 = 45
  if CalledAs FAir
    var14 = 36
    Stick (0.5) 0
  elif CalledAs BAir
    var14 = 29
    Stick (-0.5) 0
  elif CalledAs UAir
    var14 = 30
    Stick 0 (0.5)
  elif CalledAs DAir
    var14 = 38
    Stick 0 (-0.5)
  endif
  Button A
  SetFrame 0
  Seek ExecuteAttack
else
  Call AIHub
endif
Return

label ExecuteAttack
if FrameGE 1
  // DrawDebugPoint TopNX TopNY 255 0 0 85
  var5 = TopNX + (var9 * Direction)
  var6 = TopNY - var10
  // DrawDebugPoint var5 var6 255 0 255 255
  // var6
  var6 = OHurtboxSize
  var5 = HurtboxSize
if OIsCharOf Bowser
  var0 = 113
  var1 = 0.13
elif OIsCharOf Falcon
  var0 = 104
  var1 = 0.13
elif OIsCharOf Lizardon // Charizard
  var0 = 106
  var1 = 0.105
elif OIsCharOf Diddy
  var0 = 85
  var1 = 0.12
elif OIsCharOf Donkey
  var0 = 109
  var1 = 0.1
elif OIsCharOf Falco
  var0 = 80
  var1 = 0.17
elif OIsCharOf Fox
  var0 = 75
  var1 = 0.23
elif OIsCharOf Gamewatch
  var0 = 75
  var1 = 0.095
elif OIsCharOf Ganondorf
  var0 = 109
  var1 = 0.13
// GIGA BOWSER WOULD GO HERE
// elif OIsCharOf Bowser
//   var0 = 113
//   var1 = 0.13
elif OIsCharOf Nana || OIsCharOf Popo
  var0 = 88
  var1 = 0.1
elif OIsCharOf Ike
  var0 = 100
  var1 = 0.103
elif OIsCharOf Fushigisou // Ivysaur
  var0 = 85
  var1 = 0.075
elif OIsCharOf Purin // Jigglypuff
  var0 = 62
  var1 = 0.064
elif OIsCharOf DDD // King Dedede
  var0 = 107
  var1 = 0.095
elif OIsCharOf Kirby
  var0 = 74
  var1 = 0.08
elif OIsCharOf Knuckles
  var0 = 90
  var1 = 0.14
elif OIsCharOf Link
  var0 = 104
  var1 = 0.11
elif OIsCharOf Lucario
  var0 = 94
  var1 = 0.125
elif OIsCharOf Lucas
  var0 = 80
  var1 = 0.125
elif OIsCharOf Luigi
  var0 = 100
  var1 = 0.069 // nice
elif OIsCharOf Mario
  var0 = 100
  var1 = 0.095
elif OIsCharOf Marth
  var0 = 87
  var1 = 0.085
elif OIsCharOf Metaknight
  var0 = 79
  var1 = 0.11
elif OIsCharOf Mewtwo
  var0 = 90
  var1 = 0.082
elif OIsCharOf Ness
  var0 = 94
  var1 = 0.09
elif OIsCharOf Pikmin // Olimar
  var0 = 90
  var1 = 0.09
elif OIsCharOf Peach
  var0 = 90
  var1 = 0.08
elif OIsCharOf Pikachu
  var0 = 80
  var1 = 0.11
elif OIsCharOf Pit
  var0 = 80
  var1 = 0.095
elif OIsCharOf Robot // ROB
  var0 = 104
  var1 = 0.09
elif OIsCharOf Roy
  var0 = 85
  var1 = 0.114
elif OIsCharOf Samus
  var0 = 110
  var1 = 0.66
elif OIsCharOf Shiek
  var0 = 90
  var1 = 0.12
elif OIsCharOf Snake
  var0 = 105
  var1 = 0.098
elif OIsCharOf Sonic
  var0 = 82
  var1 = 0.122
elif OIsCharOf Zenigame // Squirtle
  var0 = 85
  var1 = 0.126
elif OIsCharOf Toonlink
  var0 = 85
  var1 = 0.11
elif OIsCharOf Wario
  var0 = 102
  var1 = 0.112
// WARIO MAN GOES HERE
// elif OIsCharOf Bowser
//   var0 = 113
//   var1 = 0.13
elif OIsCharOf Wolf
  var0 = 85
  var1 = 0.16
elif OIsCharOf Yoshi
  var0 = 108
  var1 = 0.093
elif OIsCharOf Zelda
  var0 = 90
  var1 = 0.073
elif OIsCharOf ZSS // Zero Suit Samus
  var0 = 85
  var1 = 0.135
endif
  var17 = 0
  if OInAir && !(Equal OYSpeed 0) && !(Equal OCurrAction 84)
  var17 = var13
  var6 = 0
  var0 = OTotalYSpeed
  Goto _oCalc
  if !(True)
    label _oCalc
    var6 += var0
    var17 -= 1
    var0 += var1 // gravity
    if var0 > OMaxFallSpeed
      var0 = OMaxFallSpeed
    endif
    if var17 < 1
      Return
    endif
    Goto _oCalc
  endif
    var17 = var6 * -1
    if OYDistBackEdge < var17 && Equal OIsOnStage 1
      var6 = OYDistBackEdge * -1
    endif
  endif
  if InAir
  var17 = var13
  var5 = 0
  var0 = TotalYSpeed
  Goto _sCalc
  if !(True)
    label _sCalc
    var5 += var0
    var17 -= 1
    var0 += 0.13 // gravity
    if var0 > MaxFallSpeed
      var0 = MaxFallSpeed
    endif
    if var17 < 1
      Return
    endif
    Goto _sCalc
  endif
    var17 = var5 * -1
    if YDistBackEdge < var17 && Equal IsOnStage 1
      var5 = YDistBackEdge * -1
    endif
  endif
  var6 = OTopNY + var10 + (OHurtboxSize) + (var6 - var5)
  if TopNY > OTopNY
    var6 *= -1
  endif
  // var5
  if Equal CurrAction 7
    var5 = OTopNX + (var9 * Direction)
  else
    var5 = OTopNX + (var9 * Direction * -1)
  endif
  var5 = var5 + (OXSpeed * var13) - (XSpeed * var13)
  // if Equal PlayerNum 0
  //   DrawDebugRectOutline var5 var6 var11 var12 255 0 0 85
  // elif Equal PlayerNum 1
  //   DrawDebugRectOutline var5 var6 var11 var12 0 0 255 85
  // elif Equal PlayerNum 2
  //   DrawDebugRectOutline var5 var6 var11 var12 255 255 0 85
  // elif Equal PlayerNum 3
  //   DrawDebugRectOutline var5 var6 var11 var12 0 255 0 85
  // else
  //   DrawDebugRectOutline var5 var6 var11 var12 0 0 0 85
  // endif
  // DrawDebugPoint var5 var6 255 0 0 85
  var5 = var5 - TopNX
  var6 = var6 - TopNY

  if Equal AirGroundState 1 || Equal IsOnStage 0 || FrameGE var14
    Call AIHub
  endif

if Equal HitboxConnected 1 && OFramesHitstun > 0
  var15 = AnimFrame
endif

  if var5 < 0
    AbsStick (-1)
  else
    AbsStick 1
  endif


  if YSpeed < 0 && YDistBackEdge > -10 && YDistBackEdge <= 0
    var19 = 2
    var18 = 1
    Call Landing
  endif
endif
Return
Return
