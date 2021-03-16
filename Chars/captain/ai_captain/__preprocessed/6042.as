// Knee

#include <Definition_AIMain.h>
//TrueID=0x6031
id 0x6031

//Set Unknown
unk 0x0


if Equal var18 0
  var9 = 1
  var10 = -1.450
  var11 = 5.3
  var12 = 5
  var13 = 14
  var14 = 16
  var15 = 36
  var20 = 24642

  if Equal var19 1
    var13 = 17
    var14 = 30
  endif

  if Equal var16 2 && OFramesHitstun < 1
    Call DefendHub
  else
    Call ApproachHub
  endif
elif True
  var15 = 36
  Stick 1 0
  Button A
  SetFrame 0
  var16 = -1
  Seek executeAttack
endif
Return

label executeAttack
var1 = 0
  if var20 >= 24625 && var20 <= 24631
    if Equal AirGroundState 1 && Equal CurrAction 3 && !(Equal var20 24636) && !(Equal var20 24630)
      var1 = 4
    elif Equal AirGroundState 2
      var1 = 0
    else
      var1 = 0
    endif
  elif var20 >= 24641 && var20 <= 24655
    var1 = 0
    if Equal AirGroundState 1
      var1 = 4
    endif
  elif Equal var20 25000
    var1 = OFramesHitstun 
  endif
  
  if var8 < 1
    var8 = 1
  endif
  SAFE_INJECT_4 var9
  SAFE_INJECT_5 var10
  SAFE_INJECT_6 var11
  SAFE_INJECT_7 var12
  // calculate own estimated position
  var17 = var13 - NumFrames + var1
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
  EstOPosVecR var0 var17 var17
  var22 = ExactOXCoord - ExactXCoord
  var22 = var22 - (OTopNX - TopNX)
  var0 -= var22
  var22 = ExactOYCoord - ExactYCoord
  var22 = var22 - (OSCDBottom - TopNY)
  var17 -= var22
  var0 += TopNX
  var17 += TopNY
  var0 -= OTopNX
  var0 *= -2
  var22 = var5 - OTopNX
  var0 += var22
  var0 += TopNX
  var17 -= OSCDBottom
  var17 *= -2
  var22 = var6 - OSCDBottom
  var17 += var22
  var17 += TopNY
  // estimate target position separately  
  var22 = var13 - NumFrames + var1
  var1 = 0
  if !(CalledAs ComboHub) // because this involves a label
    // calculate Opponent change in 0.13 (used later)
if OIsCharOf Bowser
  var1 = 113
  var1 = 0.13
elif OIsCharOf Falcon
  var1 = 104
  var1 = 0.13
elif OIsCharOf Lizardon // Charizard
  var1 = 106
  var1 = 0.105
elif OIsCharOf Diddy
  var1 = 85
  var1 = 0.12
elif OIsCharOf Donkey
  var1 = 109
  var1 = 0.1
elif OIsCharOf Falco
  var1 = 80
  var1 = 0.17
elif OIsCharOf Fox
  var1 = 75
  var1 = 0.23
  // 2.8
elif OIsCharOf Gamewatch
  var1 = 75
  var1 = 0.095
elif OIsCharOf Ganondorf
  var1 = 109
  var1 = 0.13
// GIGA BOWSER WOULD GO HERE
// elif OIsCharOf Bowser
//   var1 = 113
//   var1 = 0.13
elif OIsCharOf Nana || OIsCharOf Popo
  var1 = 88
  var1 = 0.1
elif OIsCharOf Ike
  var1 = 100
  var1 = 0.103
elif OIsCharOf Fushigisou // Ivysaur
  var1 = 85
  var1 = 0.075
elif OIsCharOf Purin // Jigglypuff
  var1 = 62
  var1 = 0.064
elif OIsCharOf DDD // King Dedede
  var1 = 107
  var1 = 0.095
elif OIsCharOf Kirby
  var1 = 74
  var1 = 0.08
elif OIsCharOf Knuckles
  var1 = 90
  var1 = 0.14
elif OIsCharOf Link
  var1 = 104
  var1 = 0.11
elif OIsCharOf Lucario
  var1 = 94
  var1 = 0.125
elif OIsCharOf Lucas
  var1 = 80
  var1 = 0.125
elif OIsCharOf Luigi
  var1 = 100
  var1 = 0.069 // nice
  // 1.6
elif OIsCharOf Mario
  var1 = 100
  var1 = 0.095 // 1.7
elif OIsCharOf Marth
  var1 = 87
  var1 = 0.085
elif OIsCharOf Metaknight
  var1 = 79
  var1 = 0.11
elif OIsCharOf Mewtwo
  var1 = 90
  var1 = 0.082
elif OIsCharOf Ness
  var1 = 94
  var1 = 0.09
elif OIsCharOf Pikmin // Olimar
  var1 = 90
  var1 = 0.09
elif OIsCharOf Peach
  var1 = 90
  var1 = 0.08
elif OIsCharOf Pikachu
  var1 = 80
  var1 = 0.11
elif OIsCharOf Pit
  var1 = 80
  var1 = 0.095
elif OIsCharOf Robot // ROB
  var1 = 104
  var1 = 0.09
elif OIsCharOf Roy
  var1 = 85
  var1 = 0.114
elif OIsCharOf Samus
  var1 = 110
  var1 = 0.66
elif OIsCharOf Shiek
  var1 = 90
  var1 = 0.12
elif OIsCharOf Snake
  var1 = 105
  var1 = 0.098
elif OIsCharOf Sonic
  var1 = 82
  var1 = 0.122
elif OIsCharOf Zenigame // Squirtle
  var1 = 85
  var1 = 0.126
elif OIsCharOf Toonlink
  var1 = 85
  var1 = 0.11
elif OIsCharOf Wario
  var1 = 102
  var1 = 0.112
// WARIO MAN GOES HERE
// elif OIsCharOf Bowser
//   var1 = 113
//   var1 = 0.13
elif OIsCharOf Wolf
  var1 = 85
  var1 = 0.16
elif OIsCharOf Yoshi
  var1 = 108
  var1 = 0.093
elif OIsCharOf Zelda
  var1 = 90
  var1 = 0.073
elif OIsCharOf ZSS // Zero Suit Samus
  var1 = 85
  var1 = 0.135
endif
  var22 = var13 - NumFrames
  var5 = 0
  var6 = OCharYSpeed + OKBYSpeed
  var6 *= -1
  Seek _MID_CALC_O_GRAV
  Jump
  if !(True)
    label _MID_CALC_O_GRAV
    var5 += var6
    var22 -= 1
    var6 += var1 // 0.13
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
    var1 = var5
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
  // var0 = estimated own x position
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
    var17 -= var1
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
  //     DrawDebugRectOutline var0 var17 5 5 255 0 0 136
  //     // target
  //     DrawDebugRectOutline var5 var6 5 5 0 0 255 136
  //   endif
  // endif
  // calculate difference between the two
  
  var5 = var0 - var5
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
  var22 = AirTime + var13 - NumFrames
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
  var0 = TopNY - var10 + var12 + var22 // center of move detection
  if var0 >= var17 
    // self is above
    var0 = OHurtboxSize
  elif var0 <= OSCDBottom 
    // self is below
    var0 = 0 // OHurtboxSize * -1
  else 
    // self is between
    var17 -= var0
    var0 = OHurtboxSize - var17
    // var0 = var22
  endif
  // var0 *= -1
  var6 += var0
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
  //     var17 += var0
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
  //   var17 = var13 - NumFrames - var8
  //   var5 = var5 + OXSpeed * var17 * -2
  // endif

  GetNearestCliff var0
  var17 = var15 - NumFrames
  var1 = XSpeed * var17
  var1 += TopNX
  if var0 < 0
    if Equal IsOnStage 1 && !(Equal DistBackEdge DistFrontEdge)
      var0 -= var1
      if var0 >= 0
        var0 = 1
      endif
    endif
  elif var0 > 0
    if Equal IsOnStage 1 && !(Equal DistBackEdge DistFrontEdge)
      var0 -= var1
      if var0 <= 0
        var0 = -1
      endif
    endif
  endif
  if !(Equal var0 1) && !(Equal var0 -1)
    if Equal DistBackEdge DistFrontEdge || Equal IsOnStage 0
      var0 = 2
    else
      var0 = 0
    endif
  endif

if Equal AirGroundState 1 || FrameGE var15
  Call AIHub
endif

if Equal HitboxConnected 1 && OKBSpeed > var16 && OFramesHitstun > 0
  var16 = OKBSpeed
endif

ClearStick

if YSpeed <= 0 && Equal IsOnStage 1 && Equal var2 1 && Equal var0 0
  Stick 0 (-1)
else
  Stick 0 0.5
endif

if !(Equal var0 0) && !(Equal var0 2)
  AbsStick var0
elif True
  if var5 < 0
    AbsStick -1 0
  else
    AbsStick 1 0
  endif
endif

Abs var5
Abs var6
Seek executeAttack
var3 += 1
if YSpeed < 0 && YDistBackEdge > -10 && YDistBackEdge <= 0 && Equal IsOnStage 1
  var19 = 2
  var18 = 1
  if var5 <= var11 && var6 <= var12 && Equal var16 16777215
    Return
  elif !(Equal var0 0)
    Return
  endif
  Call Landing
endif
Return
Return

