// COMBO HUB
// a place for determining the next best attack when an opponent is in hitstun
#include <Definition_AIMain.h>
id 0x8002

unk 0x0

// each var20 corresponds to a move routine... so like 6031 means jab
// was the last move used...


ClearStick
var21 = 32770


if OIsCharOf Bowser
  var8 = 113
  var0 = 0.13
elif OIsCharOf Falcon
  var8 = 104
  var0 = 0.13
elif OIsCharOf Lizardon // Charizard
  var8 = 106
  var0 = 0.105
elif OIsCharOf Diddy
  var8 = 85
  var0 = 0.12
elif OIsCharOf Donkey
  var8 = 109
  var0 = 0.1
elif OIsCharOf Falco
  var8 = 80
  var0 = 0.17
elif OIsCharOf Fox
  var8 = 75
  var0 = 0.23
  // 2.8
elif OIsCharOf Gamewatch
  var8 = 75
  var0 = 0.095
elif OIsCharOf Ganondorf
  var8 = 109
  var0 = 0.13
// GIGA BOWSER WOULD GO HERE
// elif OIsCharOf Bowser
//   var8 = 113
//   var0 = 0.13
elif OIsCharOf Nana || OIsCharOf Popo
  var8 = 88
  var0 = 0.1
elif OIsCharOf Ike
  var8 = 100
  var0 = 0.103
elif OIsCharOf Fushigisou // Ivysaur
  var8 = 85
  var0 = 0.075
elif OIsCharOf Purin // Jigglypuff
  var8 = 62
  var0 = 0.064
elif OIsCharOf DDD // King Dedede
  var8 = 107
  var0 = 0.095
elif OIsCharOf Kirby
  var8 = 74
  var0 = 0.08
elif OIsCharOf Knuckles
  var8 = 90
  var0 = 0.14
elif OIsCharOf Link
  var8 = 104
  var0 = 0.11
elif OIsCharOf Lucario
  var8 = 94
  var0 = 0.125
elif OIsCharOf Lucas
  var8 = 80
  var0 = 0.125
elif OIsCharOf Luigi
  var8 = 100
  var0 = 0.069 // nice
  // 1.6
elif OIsCharOf Mario
  var8 = 100
  var0 = 0.095 // 1.7
elif OIsCharOf Marth
  var8 = 87
  var0 = 0.085
elif OIsCharOf Metaknight
  var8 = 79
  var0 = 0.11
elif OIsCharOf Mewtwo
  var8 = 90
  var0 = 0.082
elif OIsCharOf Ness
  var8 = 94
  var0 = 0.09
elif OIsCharOf Pikmin // Olimar
  var8 = 90
  var0 = 0.09
elif OIsCharOf Peach
  var8 = 90
  var0 = 0.08
elif OIsCharOf Pikachu
  var8 = 80
  var0 = 0.11
elif OIsCharOf Pit
  var8 = 80
  var0 = 0.095
elif OIsCharOf Robot // ROB
  var8 = 104
  var0 = 0.09
elif OIsCharOf Roy
  var8 = 85
  var0 = 0.114
elif OIsCharOf Samus
  var8 = 110
  var0 = 0.66
elif OIsCharOf Shiek
  var8 = 90
  var0 = 0.12
elif OIsCharOf Snake
  var8 = 105
  var0 = 0.098
elif OIsCharOf Sonic
  var8 = 82
  var0 = 0.122
elif OIsCharOf Zenigame // Squirtle
  var8 = 85
  var0 = 0.126
elif OIsCharOf Toonlink
  var8 = 85
  var0 = 0.11
elif OIsCharOf Wario
  var8 = 102
  var0 = 0.112
// WARIO MAN GOES HERE
// elif OIsCharOf Bowser
//   var8 = 113
//   var0 = 0.13
elif OIsCharOf Wolf
  var8 = 85
  var0 = 0.16
elif OIsCharOf Yoshi
  var8 = 108
  var0 = 0.093
elif OIsCharOf Zelda
  var8 = 90
  var0 = 0.073
elif OIsCharOf ZSS // Zero Suit Samus
  var8 = 85
  var0 = 0.135
endif

var8 = var8 - 200
var8 *= -1
var8 /= 100
var8 *= ODamage

if Equal var18 255
  Seek contCombo
  Jump
endif
var18 = 0
var16 = 0

var1 = OTopNY - TopNY

// {DEBUG_START}

if Equal var16 -1
  var16 = 65535
endif

LOGSTR 1398030592 1381236736 0 0 0

// {MOVE_SPECIFIC_COMBOS}

LOGSTR 1095128064 1598903040 1124073472 0 0

if OYDistBackEdge > -5 && Equal OCurrAction 73 && Rnd < 0.3 && !(Equal OXDistFrontEdge OXDistBackEdge) && Equal OIsOnStage 1
  LOGSTR 1413699328 0 0 0 0
  Seek techChase_wait
  Jump
endif
LOGSTR 1129270784 1412300800 0 0 0
Seek contCombo
Jump
Return

label techChase_wait
  SetTimeout 300
  var0 = Rnd * 60
  var1 = 0
  if Damage < 80
    var2 = 9999.9999
  else
    var2 = 9999.9999
  endif
  var17 = Rnd
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
    if var0 <= 20
      if var17 < 0.3 && var20 >= 24641 && var20 <= 24655
        Button X
      elif var17 < 0.6 && XDistBackEdge < -25 && var0 >= 19
        ClearStick
        Stick -1 0
      elif var17 >= 0.6
        Button R
      endif
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

var3 = OTopNY - TopNY

GetNearestCliff var0
var0 = TopNX - var0
var0 *= -1
var1 = 0

var17 = OTopNX - (TopNX + var0) 
Abs var0
Abs var17

Goto clear
if var17 < var0 && var3 < 70 && var17 < 20
  var6 = 10
  LOGSTR 1701078784 1701278976 1634886656 0 0
  label edgeguard
  var16 = 3
//   {EDGEGUARD_OPTIONS}
  Seek edgeguard
elif Equal OIsOnStage 1 && var3 < 80
  if Equal LevelValue 100 
    var6 = 50
  else
    var6 = 40
  endif
  LOGSTR 1668246784 1651441664 0 0 0
  label combo
  var1 = 1
  Seek killOptions
  Jump 
  label kill_end
  if var6 < 20
    Goto analyze
    Goto clear
    Seek comboOptions
    Jump
    label combo_end
  endif
  Seek combo
elif True
  if Equal LevelValue 100 
    var6 = 50
  else
    var6 = 40
  endif
  LOGSTR 1786078976 1735156992 0 0 0
  label juggle
  var1 = 2
  Seek killOptions
  Jump 
  label kill_high_end
  if var6 < 25
    Goto analyze
    Goto clear
    Seek juggleOptions
    Jump
    label juggle_end
  endif
  Seek juggle
endif
Goto analyze
var6 -= 1
if var6 <= 0
  Seek NCombo
endif
var7 = 2
LOGSTR 1027423488 1027407872 0 0 0
Goto clear
Jump
Return

label NCombo
if Equal var18 255 
  var19 = 256
  LOGSTR 1852776448 1668246784 1651441664 0 0
  Call AIHub
else
  Goto TBD
  LOGSTR 1413628928 0 0 0 0
  Call ApproachHub
endif
Return

label comboOptions
LOGVAL var8

Seek combo_end
Jump
Return

label juggleOptions
LOGVAL var8

Seek juggle_end
Jump
Return

label killOptions

if Equal var1 1 
  Seek kill_end
elif Equal var1 2
  Seek kill_high_end
else
  Seek NCombo
endif
Jump
Return



label clear
var11 = 0
var12 = 0
var13 = -1
Return

label TBD
  // LOGSTR 1734700544 0 0 0 0
  var20 = 25000
  var9 = -30
  var10 = 40
  var11 = 30
  var12 = 40
  var13 = 1
  var14 = 1
  var15 = 1
Return

label analyze

var17 = OFramesHitstun + var7
if var17 < var13 || Equal var13 -1
  var7 = 0
  Return
endif

if var20 >= 24641 && var20 <= 24655
  if !(InAir)
    var13 += 9999.9999
  endif
elif var20 <= 24631 || Equal var20 24636 || Equal var20 24638
  if var3 > 20
    var7 = 0
    Return
  endif
endif

var4 = 0

var5 = var13
  if var20 >= 24625 && var20 <= 24631
    if Equal AirGroundState 1 && Equal CurrAction 3 && !(Equal var20 24636) && !(Equal var20 24630)
      var4 = 9999.9999
    elif Equal AirGroundState 2
      var4 = 0
    else
      var4 = 0
    endif
  elif var20 >= 24641 && var20 <= 24655
    var4 = 0
    if Equal AirGroundState 1
      var4 = 9999.9999
    endif
  elif Equal var20 25000
    var4 = OFramesHitstun 
  endif
  
  if var4 < 1
    var4 = 1
  endif
  SAFE_INJECT_4 var9
  SAFE_INJECT_5 var10
  SAFE_INJECT_6 var11
  SAFE_INJECT_7 var12
  // calculate own estimated position
  var17 = var5 + var4
  // if using a grounded attack then own offset will be very small
  if var20 >= 24625 && var20 <= 24631
    var17 -= var13 
    var17 -= var4
  endif
  var17 += 1
  EstOXCoord var0 var17
  EstOYCoord var1 var17
  var17 -= 1
  var17 /= 60
  EstOPosVecR var2 var17 var17
  var22 = ExactOXCoord - ExactXCoord
  var22 = var22 - (OTopNX - TopNX)
  var2 -= var22
  var22 = ExactOYCoord - ExactYCoord
  var22 = var22 - (OSCDBottom - TopNY)
  var17 -= var22
  var2 += TopNX
  var17 += TopNY
  var2 -= OTopNX
  var2 *= -2
  var22 = var0 - OTopNX
  var2 += var22
  var2 += TopNX
  var17 -= OSCDBottom
  var17 *= -2
  var22 = var1 - OSCDBottom
  var17 += var22
  var17 += TopNY
  // estimate target position separately  
  var22 = var5 + var4
  var4 = 0
  if !(CalledAs ComboHub) // because this involves a label
    // calculate Opponent change in 9999.9999 (used later)
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
  var22 = var5
  var0 = 0
  var1 = OCharYSpeed + OKBYSpeed
  var1 *= -1
  Seek _MID_CALC_O_GRAV
  Jump
  if !(True)
    label _MID_CALC_O_GRAV
    var0 += var1
    var22 -= 1
    var1 += var4 // 9999.9999
    if var1 > OMaxFallSpeed
      var1 = OMaxFallSpeed
    endif
    if var22 < 1
      Seek
    else
      Seek _MID_CALC_O_GRAV
    endif
    Jump
  endif
  label
    var4 = var0
  endif
  EstOYCoord var1 var22
  // if the opponent is in an actionable state, lower the estimate of
  // their x offset to prevent dashdancing from setting it off when very far away
  // if OCurrAction <= 21
  //   var22 /= 3
  // endif
  EstOXCoord var0 var22
  var1 = var1 - (OSCDBottom - OTopNY)
  // var0 = estimated target x position
  // var1 = estimated target y position
  // var2 = estimated own x position
  // var17 = estimated own y position
  // var22 = temporary variable
  // correct if estimated y positions go beyond ground level
  // target
  var22 = OYDistBackEdge + OTopNY
  if var1 < var22 && Equal OIsOnStage 1
    var22 -= var1
    var1 += var22
    var17 -= var22
  elif Equal OCurrAction 70 || Equal OCurrAction 74 || Equal OCurrAction 84 || Equal OCurrAction 85
    var22 -= var1
    var1 += var22
  elif Equal OAirGroundState 1
    var17 -= var4
  endif
  // self (dependent on target)
  var22 = YDistBackEdge + TopNY
  if var17 < var22 && Equal IsOnStage 1
    // if CalledAs ApproachHub && Equal var4 1 && var20 >= 24641 && var20 <= 24645 && InAir
    //   Call AIHub
    // endif 
    var22 -= var17
    var17 += var22
  endif
  // if !(CalledAs ComboHub)
  //   if Equal var4 1 || Equal var18 1
  //     // self
  //     DrawDebugRectOutline var2 var17 5 5 255 0 0 136
  //     // target
  //     DrawDebugRectOutline var0 var1 5 5 0 0 255 136
  //   endif
  // endif
  // calculate difference between the two
  
  var0 = var2 - var0
  var1 = var17 - var1
  // adjust for the move parameters
  if !(InAir)
    var17 = var9 + (var11 * 2)
    var17 /= 2
    if var17 <= 0
      var0 = var0 + (var9 * OPos)
    else 
      var0 = var0 - (var11 * OPos)
      var0 = var0 - (var9 * OPos)
    endif 
  else
    var0 = var0 - (var11 * Direction)
    var0 = var0 - (var9 * Direction)
  endif
  var1 += var10
  var1 -= var12
  var22 = AirTime + var5
  if var22 > 10 && var20 >= 24640
    var1 += 5
  endif
  // // adjust for opponent position (aim towards nearest blastzone)
  // if OTopNX > 0
  //   var0 += var11
  // else
  //   var0 -= var11
  // endif
  // account for target height
  var22 = 0
  SAFE_INJECT_D var22
  var17 = OSCDBottom + OHurtboxSize // top of target
  var2 = TopNY - var10 + var12 + var22 // center of move detection
  if var2 >= var17 
    // self is above
    var2 = OHurtboxSize
  elif var2 <= OSCDBottom 
    // self is below
    var2 = 0 // OHurtboxSize * -1
  else 
    // self is between
    var17 -= var2
    var2 = OHurtboxSize - var17
    // var2 = var22
  endif
  // var2 *= -1
  var1 += var2
  // if !(CalledAs ComboHub)
  //   if Equal var4 1 || Equal var18 1
  //     var0 += TopNX
  //     var1 += TopNY
  //     DrawDebugRectOutline var0 var1 var11 var12 0 255 0 136
  //     var0 -= TopNX
  //     var1 -= TopNY
  //     var17 = TopNY - var10 + var12 + var22
  //     DrawDebugRectOutline TopNX var17 10 0 0 255 255 136
  //     var22 = (var9 + var11)
  //     var22 *= Direction
  //     var22 += TopNX
  //     var17 = TopNY - var10 + var12
  //     DrawDebugRectOutline var22 var17 var11 var12 136 136 136 136
  //     var17 += var2
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
  //   var17 = var5 - var4
  //   var0 = var0 + OXSpeed * var17 * -2
  // endif
  var2 = var11
  var3 = var12
  var2 *= 2
  var3 *= 2
  Abs var0
  Abs var1
  if Equal AirGroundState 1
    var2 = var2 + var5 * 9999.9999
  else
    var2 = var2 + var5 * XSpeed
  endif
  if NumJumps > 0
    if var20 >= 24641 && var20 <= 24655 || Equal var20 25000 
      var17 = GetJumpHeight * 2
      var3 += var17 
    endif
  endif
  if var0 <= var2 && var1 <= var3
    // var0 += OTopNX
    // var1 += OTopNY
    // DrawDebugRectOutline var0 var1 var2 var3 255 0 0 136
    // var0 -= OTopNX 
    // var0 += TopNX
    // var1 -= OTopNY
    // var1 += TopNY
    // DrawDebugRectOutline var0 var1 var2 var3 0 0 255 136
    Seek callMove
    Jump
  endif

var5 = var14
  if var20 >= 24625 && var20 <= 24631
    if Equal AirGroundState 1 && Equal CurrAction 3 && !(Equal var20 24636) && !(Equal var20 24630)
      var4 = 9999.9999
    elif Equal AirGroundState 2
      var4 = 0
    else
      var4 = 0
    endif
  elif var20 >= 24641 && var20 <= 24655
    var4 = 0
    if Equal AirGroundState 1
      var4 = 9999.9999
    endif
  elif Equal var20 25000
    var4 = OFramesHitstun 
  endif
  
  if var4 < 1
    var4 = 1
  endif
  SAFE_INJECT_4 var9
  SAFE_INJECT_5 var10
  SAFE_INJECT_6 var11
  SAFE_INJECT_7 var12
  // calculate own estimated position
  var17 = var5 + var4
  // if using a grounded attack then own offset will be very small
  if var20 >= 24625 && var20 <= 24631
    var17 -= var13 
    var17 -= var4
  endif
  var17 += 1
  EstOXCoord var0 var17
  EstOYCoord var1 var17
  var17 -= 1
  var17 /= 60
  EstOPosVecR var2 var17 var17
  var22 = ExactOXCoord - ExactXCoord
  var22 = var22 - (OTopNX - TopNX)
  var2 -= var22
  var22 = ExactOYCoord - ExactYCoord
  var22 = var22 - (OSCDBottom - TopNY)
  var17 -= var22
  var2 += TopNX
  var17 += TopNY
  var2 -= OTopNX
  var2 *= -2
  var22 = var0 - OTopNX
  var2 += var22
  var2 += TopNX
  var17 -= OSCDBottom
  var17 *= -2
  var22 = var1 - OSCDBottom
  var17 += var22
  var17 += TopNY
  // estimate target position separately  
  var22 = var5 + var4
  var4 = 0
  if !(CalledAs ComboHub) // because this involves a label
    // calculate Opponent change in 9999.9999 (used later)
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
  var22 = var5
  var0 = 0
  var1 = OCharYSpeed + OKBYSpeed
  var1 *= -1
  Seek _MID_CALC_O_GRAV
  Jump
  if !(True)
    label _MID_CALC_O_GRAV
    var0 += var1
    var22 -= 1
    var1 += var4 // 9999.9999
    if var1 > OMaxFallSpeed
      var1 = OMaxFallSpeed
    endif
    if var22 < 1
      Seek
    else
      Seek _MID_CALC_O_GRAV
    endif
    Jump
  endif
  label
    var4 = var0
  endif
  EstOYCoord var1 var22
  // if the opponent is in an actionable state, lower the estimate of
  // their x offset to prevent dashdancing from setting it off when very far away
  // if OCurrAction <= 21
  //   var22 /= 3
  // endif
  EstOXCoord var0 var22
  var1 = var1 - (OSCDBottom - OTopNY)
  // var0 = estimated target x position
  // var1 = estimated target y position
  // var2 = estimated own x position
  // var17 = estimated own y position
  // var22 = temporary variable
  // correct if estimated y positions go beyond ground level
  // target
  var22 = OYDistBackEdge + OTopNY
  if var1 < var22 && Equal OIsOnStage 1
    var22 -= var1
    var1 += var22
    var17 -= var22
  elif Equal OCurrAction 70 || Equal OCurrAction 74 || Equal OCurrAction 84 || Equal OCurrAction 85
    var22 -= var1
    var1 += var22
  elif Equal OAirGroundState 1
    var17 -= var4
  endif
  // self (dependent on target)
  var22 = YDistBackEdge + TopNY
  if var17 < var22 && Equal IsOnStage 1
    // if CalledAs ApproachHub && Equal var4 1 && var20 >= 24641 && var20 <= 24645 && InAir
    //   Call AIHub
    // endif 
    var22 -= var17
    var17 += var22
  endif
  // if !(CalledAs ComboHub)
  //   if Equal var4 1 || Equal var18 1
  //     // self
  //     DrawDebugRectOutline var2 var17 5 5 255 0 0 136
  //     // target
  //     DrawDebugRectOutline var0 var1 5 5 0 0 255 136
  //   endif
  // endif
  // calculate difference between the two
  
  var0 = var2 - var0
  var1 = var17 - var1
  // adjust for the move parameters
  if !(InAir)
    var17 = var9 + (var11 * 2)
    var17 /= 2
    if var17 <= 0
      var0 = var0 + (var9 * OPos)
    else 
      var0 = var0 - (var11 * OPos)
      var0 = var0 - (var9 * OPos)
    endif 
  else
    var0 = var0 - (var11 * Direction)
    var0 = var0 - (var9 * Direction)
  endif
  var1 += var10
  var1 -= var12
  var22 = AirTime + var5
  if var22 > 10 && var20 >= 24640
    var1 += 5
  endif
  // // adjust for opponent position (aim towards nearest blastzone)
  // if OTopNX > 0
  //   var0 += var11
  // else
  //   var0 -= var11
  // endif
  // account for target height
  var22 = 0
  SAFE_INJECT_D var22
  var17 = OSCDBottom + OHurtboxSize // top of target
  var2 = TopNY - var10 + var12 + var22 // center of move detection
  if var2 >= var17 
    // self is above
    var2 = OHurtboxSize
  elif var2 <= OSCDBottom 
    // self is below
    var2 = 0 // OHurtboxSize * -1
  else 
    // self is between
    var17 -= var2
    var2 = OHurtboxSize - var17
    // var2 = var22
  endif
  // var2 *= -1
  var1 += var2
  // if !(CalledAs ComboHub)
  //   if Equal var4 1 || Equal var18 1
  //     var0 += TopNX
  //     var1 += TopNY
  //     DrawDebugRectOutline var0 var1 var11 var12 0 255 0 136
  //     var0 -= TopNX
  //     var1 -= TopNY
  //     var17 = TopNY - var10 + var12 + var22
  //     DrawDebugRectOutline TopNX var17 10 0 0 255 255 136
  //     var22 = (var9 + var11)
  //     var22 *= Direction
  //     var22 += TopNX
  //     var17 = TopNY - var10 + var12
  //     DrawDebugRectOutline var22 var17 var11 var12 136 136 136 136
  //     var17 += var2
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
  //   var17 = var5 - var4
  //   var0 = var0 + OXSpeed * var17 * -2
  // endif
  var2 = var11
  var3 = var12
  var2 *= 2
  var3 *= 2
  Abs var0
  Abs var1
  if Equal AirGroundState 1
    var2 = var2 + var5 * 9999.9999
  else
    var2 = var2 + var5 * XSpeed
  endif
  if NumJumps > 0
    if var20 >= 24641 && var20 <= 24655 || Equal var20 25000 
      var17 = GetJumpHeight * 2
      var3 += var17 
    endif
  endif
  if var0 <= var2 && var1 <= var3
    // var0 += OTopNX
    // var1 += OTopNY
    // DrawDebugRectOutline var0 var1 var2 var3 255 0 0 136
    // var0 -= OTopNX 
    // var0 += TopNX
    // var1 -= OTopNY
    // var1 += TopNY
    // DrawDebugRectOutline var0 var1 var2 var3 0 0 255 136
    Seek callMove
    Jump
  endif

if !(Equal var18 255)
  var7 = 0
  Return
endif

var5 = OFramesHitstun
  if var20 >= 24625 && var20 <= 24631
    if Equal AirGroundState 1 && Equal CurrAction 3 && !(Equal var20 24636) && !(Equal var20 24630)
      var4 = 9999.9999
    elif Equal AirGroundState 2
      var4 = 0
    else
      var4 = 0
    endif
  elif var20 >= 24641 && var20 <= 24655
    var4 = 0
    if Equal AirGroundState 1
      var4 = 9999.9999
    endif
  elif Equal var20 25000
    var4 = OFramesHitstun 
  endif
  
  if var4 < 1
    var4 = 1
  endif
  SAFE_INJECT_4 var9
  SAFE_INJECT_5 var10
  SAFE_INJECT_6 var11
  SAFE_INJECT_7 var12
  // calculate own estimated position
  var17 = var5 + var4
  // if using a grounded attack then own offset will be very small
  if var20 >= 24625 && var20 <= 24631
    var17 -= var13 
    var17 -= var4
  endif
  var17 += 1
  EstOXCoord var0 var17
  EstOYCoord var1 var17
  var17 -= 1
  var17 /= 60
  EstOPosVecR var2 var17 var17
  var22 = ExactOXCoord - ExactXCoord
  var22 = var22 - (OTopNX - TopNX)
  var2 -= var22
  var22 = ExactOYCoord - ExactYCoord
  var22 = var22 - (OSCDBottom - TopNY)
  var17 -= var22
  var2 += TopNX
  var17 += TopNY
  var2 -= OTopNX
  var2 *= -2
  var22 = var0 - OTopNX
  var2 += var22
  var2 += TopNX
  var17 -= OSCDBottom
  var17 *= -2
  var22 = var1 - OSCDBottom
  var17 += var22
  var17 += TopNY
  // estimate target position separately  
  var22 = var5 + var4
  var4 = 0
  if !(CalledAs ComboHub) // because this involves a label
    // calculate Opponent change in 9999.9999 (used later)
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
  var22 = var5
  var0 = 0
  var1 = OCharYSpeed + OKBYSpeed
  var1 *= -1
  Seek _MID_CALC_O_GRAV
  Jump
  if !(True)
    label _MID_CALC_O_GRAV
    var0 += var1
    var22 -= 1
    var1 += var4 // 9999.9999
    if var1 > OMaxFallSpeed
      var1 = OMaxFallSpeed
    endif
    if var22 < 1
      Seek
    else
      Seek _MID_CALC_O_GRAV
    endif
    Jump
  endif
  label
    var4 = var0
  endif
  EstOYCoord var1 var22
  // if the opponent is in an actionable state, lower the estimate of
  // their x offset to prevent dashdancing from setting it off when very far away
  // if OCurrAction <= 21
  //   var22 /= 3
  // endif
  EstOXCoord var0 var22
  var1 = var1 - (OSCDBottom - OTopNY)
  // var0 = estimated target x position
  // var1 = estimated target y position
  // var2 = estimated own x position
  // var17 = estimated own y position
  // var22 = temporary variable
  // correct if estimated y positions go beyond ground level
  // target
  var22 = OYDistBackEdge + OTopNY
  if var1 < var22 && Equal OIsOnStage 1
    var22 -= var1
    var1 += var22
    var17 -= var22
  elif Equal OCurrAction 70 || Equal OCurrAction 74 || Equal OCurrAction 84 || Equal OCurrAction 85
    var22 -= var1
    var1 += var22
  elif Equal OAirGroundState 1
    var17 -= var4
  endif
  // self (dependent on target)
  var22 = YDistBackEdge + TopNY
  if var17 < var22 && Equal IsOnStage 1
    // if CalledAs ApproachHub && Equal var4 1 && var20 >= 24641 && var20 <= 24645 && InAir
    //   Call AIHub
    // endif 
    var22 -= var17
    var17 += var22
  endif
  // if !(CalledAs ComboHub)
  //   if Equal var4 1 || Equal var18 1
  //     // self
  //     DrawDebugRectOutline var2 var17 5 5 255 0 0 136
  //     // target
  //     DrawDebugRectOutline var0 var1 5 5 0 0 255 136
  //   endif
  // endif
  // calculate difference between the two
  
  var0 = var2 - var0
  var1 = var17 - var1
  // adjust for the move parameters
  if !(InAir)
    var17 = var9 + (var11 * 2)
    var17 /= 2
    if var17 <= 0
      var0 = var0 + (var9 * OPos)
    else 
      var0 = var0 - (var11 * OPos)
      var0 = var0 - (var9 * OPos)
    endif 
  else
    var0 = var0 - (var11 * Direction)
    var0 = var0 - (var9 * Direction)
  endif
  var1 += var10
  var1 -= var12
  var22 = AirTime + var5
  if var22 > 10 && var20 >= 24640
    var1 += 5
  endif
  // // adjust for opponent position (aim towards nearest blastzone)
  // if OTopNX > 0
  //   var0 += var11
  // else
  //   var0 -= var11
  // endif
  // account for target height
  var22 = 0
  SAFE_INJECT_D var22
  var17 = OSCDBottom + OHurtboxSize // top of target
  var2 = TopNY - var10 + var12 + var22 // center of move detection
  if var2 >= var17 
    // self is above
    var2 = OHurtboxSize
  elif var2 <= OSCDBottom 
    // self is below
    var2 = 0 // OHurtboxSize * -1
  else 
    // self is between
    var17 -= var2
    var2 = OHurtboxSize - var17
    // var2 = var22
  endif
  // var2 *= -1
  var1 += var2
  // if !(CalledAs ComboHub)
  //   if Equal var4 1 || Equal var18 1
  //     var0 += TopNX
  //     var1 += TopNY
  //     DrawDebugRectOutline var0 var1 var11 var12 0 255 0 136
  //     var0 -= TopNX
  //     var1 -= TopNY
  //     var17 = TopNY - var10 + var12 + var22
  //     DrawDebugRectOutline TopNX var17 10 0 0 255 255 136
  //     var22 = (var9 + var11)
  //     var22 *= Direction
  //     var22 += TopNX
  //     var17 = TopNY - var10 + var12
  //     DrawDebugRectOutline var22 var17 var11 var12 136 136 136 136
  //     var17 += var2
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
  //   var17 = var5 - var4
  //   var0 = var0 + OXSpeed * var17 * -2
  // endif
  var2 = var11
  var3 = var12
  var2 *= 2
  var3 *= 2
  Abs var0
  Abs var1
  if Equal AirGroundState 1
    var2 = var2 + var5 * 9999.9999
  else
    var2 = var2 + var5 * XSpeed
  endif
  if NumJumps > 0
    if var20 >= 24641 && var20 <= 24655 || Equal var20 25000 
      var17 = GetJumpHeight * 2
      var3 += var17 
    endif
  endif
  if var0 <= var2 && var1 <= var3
    // var0 += OTopNX
    // var1 += OTopNY
    // DrawDebugRectOutline var0 var1 var2 var3 255 0 0 136
    // var0 -= OTopNX 
    // var0 += TopNX
    // var1 -= OTopNY
    // var1 += TopNY
    // DrawDebugRectOutline var0 var1 var2 var3 0 0 255 136
    Seek callMove
    Jump
  endif

var7 = 0
Return

label callMove

if Equal CurrAction 24
  Return
endif

if Equal var18 255
  var18 = 0
endif
if Equal var16 0 
  var16 = 6
endif
if Equal var20 24625
  Call Jab123
elif Equal var20 24638
  Call DashAttack
elif Equal var20 24626
  Call FTilt
elif Equal var20 24627
  Call UTilt
elif Equal var20 24628
  Call DTilt
elif Equal var20 24629
  Call FSmash
elif Equal var20 24630
  Call USmash
elif Equal var20 24631
  Call DSmash
elif Equal var20 24632
  Call NSpecial
elif Equal var20 24633
  Call SSpecial
elif Equal var20 24634
  Call USpecial
elif Equal var20 24635
  Call DSpecial
elif Equal var20 24636
  Call Grab
elif Equal var20 24641
  Call NAir
elif Equal var20 24642
  Call FAir
elif Equal var20 24643
  Call BAir
elif Equal var20 24644
  Call UAir
elif Equal var20 24645
  Call DAir
elif Equal var20 24646
  Call NSpecialAir
elif Equal var20 24647
  Call SSpecialAir
elif Equal var20 24648
  Call USpecialAir
elif Equal var20 24649
  Call DSpecialAir
endif

Return
Return
