// Knee

#include <Definition_AIMain.h>
//TrueID=0x6031
id 0x6031

//Set Unknown
unk 0x0

if Equal var18 0
  var9 = 8
  var10 = -4
  var11 = 6
  var12 = -3
  var13 = 14
  var20 = 24642
  if Equal var21 2 && OFramesHitstun < 1
    Call DefendHub
  else
    Call ApproachHub
  endif
elif True
  if Equal var19 254 && OYDistBackEdge > -10
    if YSpeed < 0
      Stick 0 (-1)
    endif
    if YDistBackEdge < -15 || YSpeed > 0
      Call ApproachHub
    endif
  endif
  var15 = 36
  Stick 1 0
  Button A
  SetFrame 0
  var16 = -1
  Seek executeAttack
endif
Return

label executeAttack
  // if Equal var8 var14
  //   DrawDebugPoint TopNX TopNY 255 0 255 255
  // endif
  var5 = TopNX + (var9 * Direction)
  var6 = TopNY - var10
  // if Equal var8 0 || Equal var8 1
  //   var6 += OHurtboxSize
  //   var17 = var12 + OHurtboxSize
  //   if Equal PlayerNum 0
  //     DrawDebugRectOutline var5 var6 var11 var17 255 68 68 85
  //   elif Equal PlayerNum 1
  //     DrawDebugRectOutline var5 var6 var11 var17 68 68 255 85
  //   elif Equal PlayerNum 2
  //     DrawDebugRectOutline var5 var6 var11 var17 255 255 68 85
  //   elif Equal PlayerNum 3
  //     DrawDebugRectOutline var5 var6 var11 var17 68 255 68 85
  //   else
  //     DrawDebugRectOutline var5 var6 var11 var17 68 68 68 85
  //   endif
  //   DrawDebugPoint var5 var6 255 0 255 255
  // endif
  // var6
  var6 = 0
  var5 = 0
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
  var0 = OCharYSpeed + OKBYSpeed
  var0 *= -1
  Seek _oCalc
  Jump
  if !(True)
    label _oCalc
    var6 += var0
    var17 -= 1
    var0 += var1 // gravity
    if var0 > OMaxFallSpeed
      var0 = OMaxFallSpeed
    endif
    if var17 < 1
      Seek
    else
      Seek _oCalc
    endif
    Jump
  endif
  label
    var6 *= -1
    if OYDistBackEdge > var6 && Equal OIsOnStage 1
      var6 = OYDistBackEdge
    endif
    var6 *= -1
    // var17 = OTopNY - var6
    // DrawDebugPoint OTopNX var17 255 0 0 255
  endif
  if InAir
  var17 = var13
  var5 = 0
  var0 = YSpeed * -1
  Seek _sCalc
  Jump
  if !(True)
    label _sCalc
    var5 += var0
    var17 -= 1
    var0 += 0.13 // gravity
    if var0 > MaxFallSpeed
      var0 = MaxFallSpeed
    endif
    if var17 < 1
      Seek
    else
      Seek _sCalc
    endif
    Jump
  endif
  label
    var5 *= -1
    if YDistBackEdge > var5 && Equal IsOnStage 1
      var5 = YDistBackEdge
    endif
    var5 *= -1
    // var17 = TopNY - var5
    // DrawDebugPoint TopNX var17 255 0 0 255
  endif
  // if TopNY > OTopNY
  //   var6 = OTopNY - var10 + (var6 - var5)
  // else
  // endif
    var6 = OTopNY + var10 - (var6 - var5)
    var6 += OHurtboxSize
  // var5
  if Equal CurrAction 7
    var5 = OTopNX + (var9 * Direction)
  else
    var5 = OTopNX + (var9 * Direction * -1)
  endif
  if var20 >= 24641 && var20 <= 24655
    if InAir || Equal var8 1
      var17 = var13
      if Equal AirGroundState 1
        var17 -= 3
      endif
      var5 = var5 + (OTotalXSpeed * var17) - (XSpeed * var17)
    endif
    // var5 = var5 + (TotalXSpeed * var17)
  else
    var17 = var11 / 3
    var5 = var5 + (OTotalXSpeed * var17) - (XSpeed * var17)
  endif
  // if Equal var8 0 || Equal var8 1 || Equal var8 var14
  //   var17 = var12 + OHurtboxSize
  //   if Equal PlayerNum 0
  //     DrawDebugRectOutline var5 var6 var11 var17 255 0 0 85
  //   elif Equal PlayerNum 1
  //     DrawDebugRectOutline var5 var6 var11 var17 0 0 255 85
  //   elif Equal PlayerNum 2
  //     DrawDebugRectOutline var5 var6 var11 var17 255 255 0 85
  //   elif Equal PlayerNum 3
  //     DrawDebugRectOutline var5 var6 var11 var17 0 255 0 85
  //   else
  //     DrawDebugRectOutline var5 var6 var11 var17 0 0 0 85
  //   endif
  // endif
  // DrawDebugPoint var5 var6 255 0 0 85
  var5 = var5 - TopNX
  var6 = var6 - TopNY

if Equal AirGroundState 1 || Equal IsOnStage 0 || FrameGE var15
  Call AIHub
endif

if var5 < 0
  AbsStick (-1)
else
  AbsStick 1
endif

if Equal HitboxConnected 1 && OKBSpeed > var16 && OFramesHitstun > 0
  var16 = OKBSpeed
endif

Abs var5
Abs var6
if YSpeed < 0 && YDistBackEdge > -10 && YDistBackEdge <= 0
  var19 = 2
  var18 = 1
  if var5 <= var11 && var6 <= var12 && Equal var16 16777215
    Return
  endif
  Call Landing
endif
Return
Return

