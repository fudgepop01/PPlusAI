#include <Definition_AIMain.h>
//TrueID=0x6038
id 0x6038

//Set Unknown
unk 0x0

if Equal var18 0
  var20 = 24632
  var9 = 8
  var10 = 5
  var11 = 90
  var12 = 10
  var13 = 8
  var14 = 8
  Call ApproachHub
else
  var15 = 26
  var10 = -3
  var11 = 69 // nice
  var12 = 5
  ClearStick
  Button B
  SetFrame 0
  Seek
endif
Return

label 
var1 = 50 + Rnd * 100
label ExecuteAttack
if CurrAction <= 9 || !(Equal AirGroundState 1)
  Call AIHub
endif

var0 = 20

Seek 
Jump
if !(True)
  label

  var4 = 0
  if var20 >= 24625 && var20 <= 24631
    if Equal AirGroundState 1 && Equal CurrAction 3 && !(Equal var20 24636) && !(Equal var20 24630)
      var4 = 5
    elif Equal AirGroundState 2
      var4 = 0
    else
      var4 = 0
    endif
  elif var20 >= 24641 && var20 <= 24655
    var4 = 0
    if Equal AirGroundState 1
      var4 = 5
    endif
  elif Equal var20 25000
    var4 = OFramesHitstun 
  endif
  
  if var8 < 1
    var8 = 1
  endif
  SAFE_INJECT_4 var9
  SAFE_INJECT_5 var10
  SAFE_INJECT_6 var11
  SAFE_INJECT_7 var12
  // calculate own estimated position
  var17 = var13 + var0 + var4
  // if using a grounded attack then own offset will be very small
  if var20 >= 24625 && var20 <= 24631
    var17 -= var13 
    var17 -= var8
  endif
  var17 += 1
  EstOXCoord var5 var17
  EstOYCoord var6 var17
  var17 -= 1
  var17 /= 60
  EstOPosVecR var3 var17 var17
  var22 = ExactOXCoord - ExactXCoord
  var22 = var22 - (OTopNX - TopNX)
  var3 -= var22
  var22 = ExactOYCoord - ExactYCoord
  var22 = var22 - (OSCDBottom - TopNY)
  var17 -= var22
  var3 += TopNX
  var17 += TopNY
  var3 -= OTopNX
  var3 *= -2
  var22 = var5 - OTopNX
  var3 += var22
  var3 += TopNX
  var17 -= OSCDBottom
  var17 *= -2
  var22 = var6 - OSCDBottom
  var17 += var22
  var17 += TopNY
  // estimate target position separately  
  var22 = var13 + var0 + var4
  var4 = 0
  if !(CalledAs ComboHub) // because this involves a label
    // calculate Opponent change in 0.082 (used later)
if OIsCharOf Bowser
  var4 = 113
  var4 = 0.13
elif OIsCharOf Falcon
  var4 = 104
  var4 = 0.13
elif OIsCharOf Lizardon // Charizard
  var4 = 106
  var4 = 0.105
elif OIsCharOf Diddy
  var4 = 85
  var4 = 0.12
elif OIsCharOf Donkey
  var4 = 109
  var4 = 0.1
elif OIsCharOf Falco
  var4 = 80
  var4 = 0.17
elif OIsCharOf Fox
  var4 = 75
  var4 = 0.23
  // 2.8
elif OIsCharOf Gamewatch
  var4 = 75
  var4 = 0.095
elif OIsCharOf Ganondorf
  var4 = 109
  var4 = 0.13
// GIGA BOWSER WOULD GO HERE
// elif OIsCharOf Bowser
//   var4 = 113
//   var4 = 0.13
elif OIsCharOf Nana || OIsCharOf Popo
  var4 = 88
  var4 = 0.1
elif OIsCharOf Ike
  var4 = 100
  var4 = 0.103
elif OIsCharOf Fushigisou // Ivysaur
  var4 = 85
  var4 = 0.075
elif OIsCharOf Purin // Jigglypuff
  var4 = 62
  var4 = 0.064
elif OIsCharOf DDD // King Dedede
  var4 = 107
  var4 = 0.095
elif OIsCharOf Kirby
  var4 = 74
  var4 = 0.08
elif OIsCharOf Knuckles
  var4 = 90
  var4 = 0.14
elif OIsCharOf Link
  var4 = 104
  var4 = 0.11
elif OIsCharOf Lucario
  var4 = 94
  var4 = 0.125
elif OIsCharOf Lucas
  var4 = 80
  var4 = 0.125
elif OIsCharOf Luigi
  var4 = 100
  var4 = 0.069 // nice
  // 1.6
elif OIsCharOf Mario
  var4 = 100
  var4 = 0.095 // 1.7
elif OIsCharOf Marth
  var4 = 87
  var4 = 0.085
elif OIsCharOf Metaknight
  var4 = 79
  var4 = 0.11
elif OIsCharOf Mewtwo
  var4 = 90
  var4 = 0.082
elif OIsCharOf Ness
  var4 = 94
  var4 = 0.09
elif OIsCharOf Pikmin // Olimar
  var4 = 90
  var4 = 0.09
elif OIsCharOf Peach
  var4 = 90
  var4 = 0.08
elif OIsCharOf Pikachu
  var4 = 80
  var4 = 0.11
elif OIsCharOf Pit
  var4 = 80
  var4 = 0.095
elif OIsCharOf Robot // ROB
  var4 = 104
  var4 = 0.09
elif OIsCharOf Roy
  var4 = 85
  var4 = 0.114
elif OIsCharOf Samus
  var4 = 110
  var4 = 0.66
elif OIsCharOf Shiek
  var4 = 90
  var4 = 0.12
elif OIsCharOf Snake
  var4 = 105
  var4 = 0.098
elif OIsCharOf Sonic
  var4 = 82
  var4 = 0.122
elif OIsCharOf Zenigame // Squirtle
  var4 = 85
  var4 = 0.126
elif OIsCharOf Toonlink
  var4 = 85
  var4 = 0.11
elif OIsCharOf Wario
  var4 = 102
  var4 = 0.112
// WARIO MAN GOES HERE
// elif OIsCharOf Bowser
//   var4 = 113
//   var4 = 0.13
elif OIsCharOf Wolf
  var4 = 85
  var4 = 0.16
elif OIsCharOf Yoshi
  var4 = 108
  var4 = 0.093
elif OIsCharOf Zelda
  var4 = 90
  var4 = 0.073
elif OIsCharOf ZSS // Zero Suit Samus
  var4 = 85
  var4 = 0.135
endif
  var22 = var13 + var0
  var5 = 0
  var6 = OCharYSpeed + OKBYSpeed
  var6 *= -1
  Seek _MID_CALC_O_GRAV
  Jump
  if !(True)
    label _MID_CALC_O_GRAV
    var5 += var6
    var22 -= 1
    var6 += var4 // 0.082
    if var6 > OMaxFallSpeed
      var6 = OMaxFallSpeed
    endif
    if var22 < 1
      Seek
    else
      Seek _MID_CALC_O_GRAV
    endif
    Jump
  endif
  label
    var4 = var5
  endif
  EstOYCoord var6 var22
  // if the opponent is in an actionable state, lower the estimate of
  // their x offset to prevent dashdancing from setting it off when very far away
  // if OCurrAction <= 21
  //   var22 /= 3
  // endif
  EstOXCoord var5 var22
  var6 = var6 - (OSCDBottom - OTopNY)
  // var5 = estimated target x position
  // var6 = estimated target y position
  // var3 = estimated own x position
  // var17 = estimated own y position
  // var22 = temporary variable
  // correct if estimated y positions go beyond ground level
  // target
  var22 = OYDistBackEdge + OTopNY
  if var6 < var22 && Equal OIsOnStage 1
    var22 -= var6
    var6 += var22
    var17 -= var22
  elif Equal OCurrAction 70 || Equal OCurrAction 74 || Equal OCurrAction 84 || Equal OCurrAction 85
    var22 -= var6
    var6 += var22
  elif Equal OAirGroundState 1
    var17 -= var4
  endif
  // self (dependent on target)
  var22 = YDistBackEdge + TopNY
  if var17 < var22 && Equal IsOnStage 1
    // if CalledAs ApproachHub && Equal var8 1 && var20 >= 24641 && var20 <= 24645 && InAir
    //   Call AIHub
    // endif 
    var22 -= var17
    var17 += var22
  endif
  // if !(CalledAs ComboHub)
  //   if Equal var8 1 || Equal var18 1
  //     // self
  //     DrawDebugRectOutline var3 var17 5 5 255 0 0 136
  //     // target
  //     DrawDebugRectOutline var5 var6 5 5 0 0 255 136
  //   endif
  // endif
  // calculate difference between the two
  
  var5 = var3 - var5
  var6 = var17 - var6
  // adjust for the move parameters
  if !(InAir)
    var17 = var9 + (var11 * 2)
    var17 /= 2
    if var17 <= 0
      var5 = var5 + (var9 * OPos)
    else 
      var5 = var5 - (var11 * OPos)
      var5 = var5 - (var9 * OPos)
    endif 
  else
    var5 = var5 - (var11 * Direction)
    var5 = var5 - (var9 * Direction)
  endif
  var6 += var10
  var6 -= var12
  var22 = AirTime + var13 + var0
  if var22 > 10 && var20 >= 24640
    var6 += 5
  endif
  // // adjust for opponent position (aim towards nearest blastzone)
  // if OTopNX > 0
  //   var5 += var11
  // else
  //   var5 -= var11
  // endif
  // account for target height
  var22 = 0
  SAFE_INJECT_D var22
  var17 = OSCDBottom + OHurtboxSize // top of target
  var3 = TopNY - var10 + var12 + var22 // center of move detection
  if var3 >= var17 
    // self is above
    var3 = OHurtboxSize
  elif var3 <= OSCDBottom 
    // self is below
    var3 = 0 // OHurtboxSize * -1
  else 
    // self is between
    var17 -= var3
    var3 = OHurtboxSize - var17
    // var3 = var22
  endif
  // var3 *= -1
  var6 += var3
  // if !(CalledAs ComboHub)
  //   if Equal var8 1 || Equal var18 1
  //     var5 += TopNX
  //     var6 += TopNY
  //     DrawDebugRectOutline var5 var6 var11 var12 0 255 0 136
  //     var5 -= TopNX
  //     var6 -= TopNY
  //     var17 = TopNY - var10 + var12 + var22
  //     DrawDebugRectOutline TopNX var17 10 0 0 255 255 136
  //     var22 = (var9 + var11)
  //     var22 *= Direction
  //     var22 += TopNX
  //     var17 = TopNY - var10 + var12
  //     DrawDebugRectOutline var22 var17 var11 var12 136 136 136 136
  //     var17 += var3
  //     if OTopNX > 0
  //       var22 += var11
  //     else
  //       var22 -= var11
  //     endif 
  //     DrawDebugRectOutline var22 var17 var11 var12 255 255 255 136
  //     var22 = OHurtboxSize / 2
  //     var17 = var22 + OSCDBottom
  //     DrawDebugRectOutline OTopNX var17 5 var22 255 255 0 221
  //   endif
  // endif
  // if !(CalledAs ComboHub) && LevelValue >= 60 && !(Equal var16 6) 
  //   var17 = var13 + var0 - var8
  //   var5 = var5 + OXSpeed * var17 * -2
  // endif

  if var5 <= var11 && var6 <= var12
    Button B
  endif

  var0 -= 5
  if var0 <= 0
    Seek
    Jump
  endif
  Return
endif
label

if ODistLE 25 && Equal Direction OPos
  if Rnd < 0.7
    Button B
  elif Rnd < 0.3
    Button R
  elif Rnd < 0.5
    Stick 1 0
  else
    Stick -1 0
  endif
endif
var1 -= 1
if var1 <= 0
  Button R
  Call AIHub
endif
Seek ExecuteAttack
Return
Return
