#include <Definition_AIMain.h>
//TrueID=0x6030
id 0x6030

//Set Unknown
unk 0x0

//Strings



// sets up offsets to get to target position
if Equal var18 0
  if CalledAs Jab123
var20 = 24625
var15 = 19
var9 = 0
var10 = -4
var11 = 7.4
var12 = 3.85
var13 = 6
var14 = 7
  elif CalledAs DashAttack
var20 = 24638
var15 = 38
var9 = -1
var10 = -4
var11 = 8.4
var12 = 3.85
var13 = 6
var14 = 15
  elif CalledAs FTilt
    // LOGSTR 1718905088 1819541504 0 0 0
var20 = 24626
var15 = 27
var9 = 1
var10 = -5.650
var11 = 8.4
var12 = 3.850
var13 = 10
var14 = 0
  elif CalledAs UTilt
    // LOGSTR 1970563328 1819541504 0 0 0
var20 = 24627
var15 = 28
var9 = -12
var10 = 1
var11 = 12.4
var12 = 12.85
var13 = 5
var14 = 14
  elif CalledAs DTilt
    // LOGSTR 1685350656 1819541504 0 0 0
var20 = 24628
var15 = 26
var9 = 1
var10 = 1
var11 = 8.55
var12 = 3.85
var13 = 5
var14 = 8
  elif CalledAs FSmash
    // LOGSTR 1718840576 1634953216 0 0 0
var20 = 24629
var15 = 51
var9 = 6
var10 = -2
var11 = 10.55
var12 = 6
var13 = 20
var14 = 24
  elif CalledAs USmash
    // LOGSTR 1970498816 1634953216 0 0 0
var20 = 24630
var15 = 26
var9 = 1
var10 = 0
var11 = 4.55
var12 = 19.6
var13 = 11
var14 = 24
if Equal var19 1
endif
  elif CalledAs DSmash
    // LOGSTR 1970498816 1634953216 0 0 0
var20 = 24631
var15 = 52
var9 = -17
var10 = -1
var11 = 16
var12 = 4.6
var13 = 13
var14 = 18
  elif CalledAs NSpecial
    // LOGSTR 1970498816 1634953216 0 0 0
var20 = 24632
var15 = 26
var9 = 8
var10 = -3
var11 = 69 // nice
var12 = 5
var13 = 8
var14 = 8
var20 = 24632
var10 = 5
var11 = 90
var12 = 10
var20 = 24632
var9 = 0
var10 = 4
var12 = 10
  elif CalledAs SSpecial
    // LOGSTR 1970498816 1634953216 0 0 0
var20 = 24633
var15 = 58
var9 = 0.5
var10 = -5
var11 = 7.5
var12 = 3.6
var13 = 12
var14 = 14
if Equal var19 1
endif
  elif CalledAs USpecial
    // LOGSTR 1970498816 1634953216 0 0 0

  elif CalledAs DSpecial
    // LOGSTR 1970498816 1634953216 0 0 0
var20 = 24635
var15 = 30
var9 = 0
var10 = 0
var11 = 25
var12 = 10
var13 = 10
var14 = 10
if Equal var19 1
endif
  elif CalledAs Grab
    // LOGSTR 1970498816 1634953216 0 0 0
var20 = 24636
var15 = 31
var9 = 1
var10 = -3
var11 = 6
var12 = 3
var13 = 7
var14 = 8
if Equal var19 1
endif
if Equal var19 2
endif
if Equal var19 3
endif
if Equal var19 4
endif
  else
    Call AIHub
  endif
 // SAFE_INJECT_4 var9
 // SAFE_INJECT_5 var11
  if Equal var16 2 && OFramesHitstun < 1
    Call DefendHub
  else
    Call ApproachHub
  endif
else
  ClearStick
  if CalledAs Jab123
    var15 = 19
    var20 = 24625
    Button A
  elif CalledAs FTilt
    var15 = 27
    var20 = 24626
    Stick (0.5) 0
    Button A
  elif CalledAs UTilt
    var15 = 28
    var20 = 24627
    Stick 0 0.7
    Button A
  elif CalledAs DTilt
    var15 = 26
    var20 = 24628
    Stick 0 (-0.7)
    Button A
  elif CalledAs FSmash
    var15 = 51
    var20 = 24629
    Stick 1 0
    Button A
  elif CalledAs USmash
    var15 = 26
    var20 = 24630
    Stick 0 1
    Button A
  elif CalledAs DSmash
    var15 = 52
    var20 = 24631
    Stick 0 (-1)
    Button A
  elif CalledAs NSpecial
    var15 = 26
    var20 = 24632
    Button B
  elif CalledAs SSpecial
    var15 = 58
    var20 = 24633
    Stick 1 0
    Button B
  elif CalledAs USpecial
    var15 = 50
    var20 = 24634
    Stick 0 1
    Button B
  elif CalledAs DSpecial
    var15 = 30
    var20 = 24635
    Stick 0 (-1)
    Button B
  elif CalledAs Grab
    var15 = 31
    var20 = 24636
    Button R|A
  elif CalledAs DashAttack
    var15 = 38
    var20 = 24638
    Button A
  endif
  SetFrame 0
  var16 = -1
  Seek ExecuteAttack
endif
Return

label ExecuteAttack
var1 = 0
  // this prevents it from auto-attacking.
  // this issue persisted for... 9 months
  Cmd30
  if var20 >= 24625 && var20 <= 24631
    if Equal AirGroundState 1 && Equal CurrAction 3 && !(Equal var20 24636) && !(Equal var20 24630)
      var1 = 0
    elif Equal AirGroundState 2
      var1 = 0
    else
      var1 = 0
    endif
  elif var20 >= 24641 && var20 <= 24655
    var1 = 0
    if Equal AirGroundState 1
      var1 = 0
    endif
  elif Equal var20 25000
    var1 = OFramesHitstun 
  endif
  
  if var8 < 1
    var8 = 1
  endif
  SAFE_WRITE_4 var9
  SAFE_WRITE_5 var10
  SAFE_WRITE_6 var11
  SAFE_WRITE_7 var12  
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
  // invert them because sometimes that happens
  // if var6 > var17 && TopNY < OTopNY
  //   var22 = var17
  //   var17 = var6
  //   var6 = var22
  // elif var6 < var17 && TopNY > OTopNY
  //   var22 = var17
  //   var17 = var6
  //   var6 = var22
  // endif 
  // if var5 > var0 && TopNX > OTopNX
  //   var22 = var0
  //   var0 = var5
  //   var5 = var22
  // elif var5 < var0 && TopNX < OTopNX
  //   var22 = var0
  //   var0 = var5
  //   var5 = var22
  // endif
  // no need to do this for the X axis (trust me i've tried)
  var0 -= OTopNX
  var0 *= -2
  var22 = var5 - OTopNX
  var0 += var22
  var0 += TopNX
  // estimate target position separately  
  var22 = var13 - NumFrames + var1
  var1 = 0
  if !(CalledAs ComboHub) // because this involves a label
  if Equal var20 24625
    LOGSTR 1247896064 825373440 0 0 0
  elif Equal var20 24638
    LOGSTR 1147237120 1749120000 1952539392 1795162112 0
  elif Equal var20 24626
    LOGSTR 1179937024 1819541504 0 0 0
  elif Equal var20 24627
    LOGSTR 1431595264 1819541504 0 0 0
  elif Equal var20 24628
    LOGSTR 1146382592 1819541504 0 0 0
  elif Equal var20 24629
    LOGSTR 1179872512 1634953216 0 0 0
  elif Equal var20 24630
    LOGSTR 1431530752 1634953216 0 0 0
  elif Equal var20 24631
    LOGSTR 1146318080 1634953216 0 0 0
  elif Equal var20 24632
    LOGSTR 1314091008 1701013760 1634467840 0 0
  elif Equal var20 24633
    LOGSTR 1397977088 1701013760 1634467840 0 0
  elif Equal var20 24634
    LOGSTR 1431531520 1701013760 1634467840 0 0
  elif Equal var20 24635
    LOGSTR 1146318848 1701013760 1634467840 0 0
  elif Equal var20 24636
    LOGSTR 1198678272 1644167168 0 0 0
  elif Equal var20 24641
    LOGSTR 1312909568 1912602624 0 0 0
  elif Equal var20 24642
    LOGSTR 1178691840 1912602624 0 0 0
  elif Equal var20 24643
    LOGSTR 1111582976 1912602624 0 0 0
  elif Equal var20 24644
    LOGSTR 1430350080 1912602624 0 0 0
  elif Equal var20 24645
    LOGSTR 1145137408 1912602624 0 0 0
  elif Equal var20 24646
    LOGSTR 1314091008 1701013760 1634484480 1769078784 0
  elif Equal var20 24647
    LOGSTR 1397977088 1701013760 1634484480 1769078784 0
  elif Equal var20 24648
    LOGSTR 1431531520 1701013760 1634484480 1769078784 0
  elif Equal var20 24649
    LOGSTR 1146318848 1701013760 1634484480 1769078784 0
  elif Equal var20 32776
    LOGSTR 1180789504 1699706112 1950905600 1644167168 0
  elif Equal var20 25000
    LOGSTR 1131375872 1651460096 1969356800 0 0
  endif
    // calculate own Y coord because I can't figure out the !@$% EstOPosVecR thing
  var22 = var13 - NumFrames
  var6 = 0
  if Equal CurrSubaction JumpSquat
    var1 = -1.95
  else
    var1 = YSpeed * -1
  endif
  Seek _MID_CALC_GRAV
  Jump
  if !(True)
    label _MID_CALC_GRAV
    var6 += var1
    var22 -= 1
    var1 += 0.125 // 0.125
    if var1 > 2.5
      var1 = 2.5
    elif var1 > MaxFallSpeed
      var1 = MaxFallSpeed
    endif
    if var22 < 1
      Seek
    else
      Seek _MID_CALC_GRAV
    endif
    Jump
  endif
  label
    var17 = TopNY - var6
    // calculate Opponent change in 0.125 (used later)
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
  var22 = var13 - NumFrames + var1
  var5 = 0
  var6 = OCharYSpeed + OKBYSpeed
  var6 *= -1
  Seek _MID_CALC_O_GRAV
  Jump
  if !(True)
    label _MID_CALC_O_GRAV
    var5 += var6
    var22 -= 1
    var6 += var1 // 0.125
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
  // it's awful, I know, but i'm all out of variables and this was the only way lol
  var22 = var13 - NumFrames 
  if var20 >= 24625 && var20 <= 24631
    if Equal AirGroundState 1 && Equal CurrAction 3 && !(Equal var20 24636) && !(Equal var20 24630)
      var22 += 0
    endif
  elif var20 >= 24641 && var20 <= 24655
    if Equal AirGroundState 1
      var22 += 0 
    endif
  elif Equal var20 25000
    var22 += OFramesHitstun 
  endif
  EstOYCoord var6 0
  // if the opponent is in an actionable state, lower the estimate of
  // their x offset to prevent dashdancing from setting it off when very far away
  var22 = 0
  if OCurrAction <= 9 && var20 < 24641
    var22 = -5
  endif
  EstOXCoord var5 var22
  var6 = var6 - (OSCDBottom - OTopNY)
  // var5 = estimated target x position
  // var6 = estimated target y position
  // var0 = estimated own x position
  // var17 = estimated own y position
  // var22 = temporary variable
    if Equal var20 24645
        var17 = TopNY
    endif
  // correct if estimated y positions go beyond ground level
  // target
  // var17 += var22
  // var17 -= var1
  // if var1 > 0 && Equal OAirGroundState 2
  //   var17 -= var1
  // endif
  // var22 = OTopNY - var1
  // DrawDebugLine OTopNX OTopNY OTopNX var22 255 0 0 221
  var22 = OYDistBackEdge + OTopNY
  if var6 < var22 && Equal OIsOnStage 1
    var22 -= var6
    var6 += var22
  elif Equal OCurrAction 70 || Equal OCurrAction 74 || Equal OCurrAction 84 || Equal OCurrAction 85
    var22 -= var6
    var6 += var22
  elif Equal OAirGroundState 1
    // var17 -= var1
  endif
  // self (dependent on target)
  var22 = YDistBackEdge + TopNY
  if var17 < var22 && Equal IsOnStage 1 && Equal AirGroundState 1
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
  // adjust for move parameters
  if var20 >= 24641 && var20 <= 24645
    if Equal AirGroundState 2
      var17 -= var10
      var17 += var12
    endif
  else
    var17 -= var10
    var17 += var12
  endif
  // adjust for the move parameters
  if !(InAir)
    var22 = var9 + (var11 * 2)
    var22 /= 2
    if var22 <= 0
      var0 = var0 - (var9 * OPos)
    else 
      var0 = var0 + (var11 * OPos)
      var0 = var0 + (var9 * OPos)
    endif 
  else
    var0 = var0 + (var11 * Direction)
    var0 = var0 + (var9 * Direction)
  endif
  if Equal SCDBottom TopNY && var20 >= 24640
    var17 += 5
  endif
  if Equal AirGroundState 2
    var22 = OHurtboxSize / 2
    var17 -= var22
  endif
  
  // if !(CalledAs ComboHub)
  //   if Equal var8 1 || Equal var18 1
  //     // self
  //     DrawDebugRectOutline var0 var17 var11 var12 255 187 0 136
  //   endif
  // endif
  // calculate difference between the two
  
  var5 = var0 - var5
  var6 = var6 - var17
  // adjust for opponent position (aim towards nearest blastzone)
  if !(Equal var20 32776) && !(Equal var20 25000)
    var17 = LBoundary - (TopNX + var5) 
    var22 = 0
    if var17 < 90 && Equal Direction (-1)
      var17 = 0.8 + 1
      var17 = var11 * (1/var17)
      var17 /= 2
      var22 += var17
    endif
    var17 = RBoundary - (TopNX + var5)
    if var17 > -90 && Equal Direction 1
      var17 = 0.8 + 1
      var17 = var11 * (1/var17)
      var17 /= 2
      var22 -= var17
    endif
    var5 += var22
    if Equal var22 0
      var22 = OPos * Direction
      var17 = 0.8 + 1
      var17 = var11 * (1/var17)
      var22 *= var17
      var22 /= 2
      var5 -= var22
    endif
  endif
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
  //     var17 = 0.8 + 1
  //     var17 = var11 * (1/var17)
  //     var11 = var17
  //     var9 = var9 + var17 * 0.8
  //     var17 = 0.8 + 1
  //     var17 = var12 * (1/var17)
  //     var12 = var17
  //     var10 = var10 - var17 * 0.8
  //     var17 = TopNY - var10 + var12 + var22
  //     DrawDebugRectOutline TopNX var17 10 0 0 255 255 136
  //     var22 = (var9 + var11)
  //     var22 *= Direction
  //     var22 += TopNX
  //     var17 = TopNY - var10 + var12
  //     DrawDebugRectOutline var22 var17 var11 var12 136 136 136 136
  //     var17 += var0
  //     // if OTopNX > 0
  //     //   var22 += var11
  //     // else
  //     //   var22 -= var11
  //     // endif 
  //     DrawDebugRectOutline var22 var17 var11 var12 255 255 255 136
  //     var22 = OHurtboxSize / 2
  //     var17 = var22 + OSCDBottom
  //     DrawDebugRectOutline OTopNX var17 5 var22 255 255 0 221
      
  //     var17 = var11 * 0.8
  //     var9 -= var17
  //     var11 = var11 + var17
  //     var17 = var12 * 0.8
  //     var10 += var17
  //     var12 = var12 + var17
  //   endif
  // endif
  // if !(CalledAs ComboHub) && LevelValue >= 60 && !(Equal var16 6) 
  //   var17 = var13 - NumFrames - var8
  //   var5 = var5 + OXSpeed * var17 * -2
  // endif

if Equal HitboxConnected 1 && OKBSpeed > var16 && OFramesHitstun > 0
  var16 = OKBSpeed
endif

if CalledAs USmash
  AbsStick OPos
  if Equal NumFrames 4 && Equal var19 1
    var18 = 1
    var19 = 1
    Button B
    Call NSpecial
  endif 
endif

if Equal HitboxConnected 1
  Call ComboHub
elif FrameGE var15 || CurrAction <= 9 || !(Equal AirGroundState 1)
  Call AIHub
endif
Return
Return