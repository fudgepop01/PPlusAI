// COMBO HUB
// a place for determining the next best attack when an opponent is in hitstun
#include <Definition_AIMain.h>
id 0x8002

unk 0x0

// each var20 corresponds to a move routine... so like 6031 means jab
// was the last move used...

ClearStick
var21 = 32770

if Equal var18 255
  Seek contCombo
  Jump
endif
var18 = 0

var1 = OTopNY - TopNY




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

var8 /= 100
var8 *= ODamage

if Equal var16 -1
  var16 = 65535
endif

LOGSTR 1398030592 1381236736 0 0 0

  // if Equal var20 24636
  //   if Equal var19 4
  //     // if var8 > 50
  //     //   if XDistLE 20
  //     //     Call FAir
  //     //   else
  //     //     Call UAir
  //     //   endif
  //     // elif var1 > 25
  //     //   Call UAir
  //     // else
  //     //   Call NAir
  //     // endif
  //   elif Equal var19 2
  //     if var8 > 50 && var1 > 25
  //       Call FAir
  //     elif var1 > 25 && OYSpeed > 0.15
  //       Call UAir
  //     endif
  //     var0 = Rnd * 3
  //     if var8 > 40 && var0 < 2
  //       Call DAir
  //     else
  //       var19 = 1
  //       Call Grab
  //     endif
  //   endif
  // endif
  if !(Equal var16 255) && Equal HitboxConnected 1
    var18 = 1
    if Equal var20 24625 || Equal var20 24638
      var7 = 8
      label _tilts
      var1 = Rnd * 10
      if var1 < 1
        Goto dtilt
      elif var1 < 2
        Goto ftilt
      elif var1 < 3
        Goto utilt
      else
        Goto clear
      endif
      Goto analyze
      var7 -= 1
      if var7 <= 0
        Seek _smEntry
      else
        Seek _tilts
      endif
      Jump
    endif
    if var20 >= 24626 && var20 <= 24628
      label _smEntry
      var7 = 8
      label _smashes
      var1 = Rnd * 10
      if var1 < 1
        Goto fsmash
      elif var1 < 2
        Goto dsmash
      elif var1 < 3
        Goto usmash
        if Rnd < 0.7
          var19 = 1
        endif
      else
        Goto clear
      endif
      Goto analyze
      var7 -= 1
      if var7 <= 0
        Seek _spEntry
      else
        Seek _smashes
      endif
      Jump
    endif
    if var20 >= 24641 && var20 <= 24645
      Seek _spEntry
      Jump
    endif
    if var20 >= 24629 && var20 <= 24631
      label _spEntry
      var7 = 10
      label _specials
      var19 = 0
      var1 = Rnd * 9
      if var1 < 1
        Goto nspecial      
      elif var1 < 3
        if Equal Direction 1 && OKBXSpeed > 1.5
          Goto dspecial
        elif Equal Direction -1 && OKBXSpeed < -1.5
          Goto dspecial
        else
          Goto clear
        endif
      elif var1 < 5
        Goto sspecial
        if var8 > 80 && Equal AirGroundState 1
          var19 = 1
        elif var8 > 40 && Equal AirGroundState 2 && Equal OIsOnStage 0
          var19 = 2
        endif
      elif var1 < 7 && OKBSpeed > 2.95 && OKBYSpeed > 0 && OKBXSpeed >= -2 && OKBXSpeed <= 2 && !(Equal OXDistBackEdge OXDistFrontEdge)
        Call USpecial
      else
        Goto clear
      endif
      Goto analyze
      var7 -= 1
      if var7 <= 0
        if LevelValue >= 48
          var19 = 1
          Goto nspecial
          Call NSpecial
        endif
        Seek _end
      else
        Seek _specials
      endif
      Jump
    endif
  endif
  label _end
  var18 = 0
  if Equal var16 255
    var6 = 15
    var18 = 1
    if var8 > 70
      Seek kill
    else
      Seek combo
    endif
    Jump
  endif

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
    var2 = 10
  else
    var2 = 25
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

var17 = OTopNX - (TopNX + var0) 
Abs var0
Abs var17

if var17 < var0 && var3 < 70 && var17 < 20
  var6 = 10
  LOGSTR 1701078784 1701278976 1634886656 0 0
  label edgeguard
  var16 = 3
  var17 = Rnd * 7
  if var17 < 1
    Goto fair
  elif var17 < 2
    Goto dtilt
  elif var17 < 3
    Goto fsmash
  elif var17 < 4
    Goto dsmash
  elif var17 < 5
    Goto bair
  elif var17 < 6
    Goto dair
  elif var17 < 7
    Goto sspecial
    var19 = 2
  endif
  Seek edgeguard
elif Equal OIsOnStage 1 && var3 < 80
  if var8 < 70
    var6 = 10
    LOGSTR 1668246784 1651441664 0 0 0
    label combo
  var17 = Rnd * 6
  if var17 < 1
    Goto dtilt
  elif var17 < 2
    Goto fair
  elif var17 < 3
    Goto uair
  elif var17 < 4
    Goto grab
  elif var17 < 5
    Goto dashattack
  elif var17 < 6
    Goto usmash
    var19 = 1
  elif var17 < 6
    Goto sspecial
  endif
    Seek combo
  else
    var6 = 10
    LOGSTR 1802071040 1811939328 0 0 0
    label kill
  var17 = Rnd * 6
  if var17 < 1
    Goto fsmash
  elif var17 < 2
    Goto bair
  elif var17 < 3
    Goto nair
  elif var17 < 4
    Goto dsmash
  elif var17 < 5
    Goto usmash
  elif var17 < 6
    Goto sspecial
    var19 = 1
  endif
    Seek kill
  endif
else
  if var8 < 70
    var6 = 10
    LOGSTR 1786078976 1735156992 0 0 0
    label juggle
  var17 = Rnd * 3
  if var17 < 1
    Goto uair
  elif var17 < 2
    Goto usmash
  elif var17 < 2
    Goto utilt
  endif
    Seek juggle
  else 
    var6 = 10
    LOGSTR 1802071040 1818191872 1768384512 0 0
    label kill_high
  var17 = Rnd * 6
  if var17 < 1
    Goto fsmash
  elif var17 < 2
    Goto bair
  elif var17 < 3
    Goto nair
  elif var17 < 4
    Goto dsmash
  elif var17 < 5
    Goto usmash
  elif var17 < 6
    Goto sspecial
    var19 = 1
  endif
    Seek kill_high
  endif
endif
Goto analyze
var6 -= 1
if var6 <= 0
  Seek NCombo
endif
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

label jab123
  LOGSTR 1784766976 825373440 0 0 0
  var20 = 24625
  var9 = 0
  var10 = -4
  var11 = 7.4
  var12 = 3.85
  var13 = 6
  var14 = 7
  var15 = 19
Return

label dashattack
  LOGSTR 1145110528 0 0 0 0
  var20 = 24638
  var9 = -1
  var10 = -4
  var11 = 8.4
  var12 = 3.85
  var13 = 6
  var14 = 15
  var15 = 38
Return

label ftilt
  LOGSTR 1718905088 1819541504 0 0 0
  var20 = 24626
  var9 = 1
  var10 = -5.650
  var11 = 6.4
  var12 = 3.850
  var13 = 10
  var14 = 14
  var15 = 27
Return

label utilt
  LOGSTR 1970563328 1819541504 0 0 0
  var20 = 24627
  var9 = -12
  var10 = 1
  var11 = 12.4
  var12 = 12.85
  var13 = 5
  var14 = 14
  var15 = 28
Return

label dtilt
  LOGSTR 1685350656 1819541504 0 0 0
  var20 = 24628
  var9 = 1
  var10 = 1
  var11 = 8.55
  var12 = 3.85
  var13 = 5
  var14 = 8
  var15 = 26
Return

label fsmash
  LOGSTR 1718840576 1634953216 0 0 0
  var20 = 24629
  var9 = 6
  var10 = -2
  var11 = 10.55
  var12 = 6
  var13 = 20
  var14 = 24
  var15 = 51
Return

label usmash
  LOGSTR 1970498816 1634953216 0 0 0
  var20 = 24630
  var9 = 1
  var10 = 0
  var11 = 4.55
  var12 = 19.6
  var13 = 11
  var14 = 24
  var15 = 26
Return

label dsmash
  LOGSTR 1685286144 1634953216 0 0 0
  var20 = 24631
  var9 = -17
  var10 = -1
  var11 = 16
  var12 = 4.6
  var13 = 13
  var14 = 18
  var15 = 52
Return

label nspecial
  LOGSTR 1853059072 1701013760 1634467840 0 0
  var20 = 24632
  var9 = 8
  var10 = -3
  var11 = 69
  var12 = 5
  var13 = 8
  var14 = 8
  var15 = 26
Return

label sspecial
  LOGSTR 1936945152 1701013760 1634467840 0 0
  var20 = 24633
  var9 = 0.5
  var10 = -5
  var11 = 7.5
  var12 = 3.6
  var13 = 12
  var14 = 14
  var15 = 58
Return

label uspecial
  LOGSTR 1970499584 1701013760 1634467840 0 0
  var20 = 24634
  var9 = -5
  var10 = -5
  var11 = 5
  var12 = 5
  var13 = 1
  var14 = 1
  var15 = 50
Return

label dspecial
  LOGSTR 1685286912 1701013760 1634467840 0 0
  var20 = 24635
  var9 = 0
  var10 = 0
  var11 = 25
  var12 = 10
  var13 = 10
  var14 = 10
  var15 = 30
Return

label grab
  LOGSTR 1735549184 1644167168 0 0 0
  var20 = 24636
  var9 = 1
  var10 = -3
  var11 = 6
  var12 = 3
  var13 = 7
  var14 = 8
  var15 = 31
Return

label nair
  LOGSTR 1851877632 1912602624 0 0 0
  var20 = 24641
  var9 = -10
  var10 = -1.5
  var11 = 9.5
  var12 = 4.6
  var13 = 9
  var14 = 15
  var15 = 54
Return

label fair
  LOGSTR 1717659904 1912602624 0 0 0
  var20 = 24642
  var9 = 0
  var10 = 1
  var11 = 7.5
  var12 = 4.6
  var13 = 6
  var14 = 12
  var15 = 31
Return

label bair
  LOGSTR 1650551040 1912602624 0 0 0
  var20 = 24643
  var9 = -16
  var10 = 0
  var11 = 7
  var12 = 5
  var13 = 10
  var14 = 13
  var15 = 33
Return

label uair
  LOGSTR 1969318144 1912602624 0 0 0
  var20 = 24644
  var9 = -4
  var10 = -6
  var11 = 4
  var12 = 7
  var13 = 7
  var14 = 10
  var15 = 29
Return

label dair
  LOGSTR 1684105472 1912602624 0 0 0
  var20 = 24645
  var9 = -4
  var10 = 10
  var11 = 4
  var12 = 7
  var13 = 4
  var14 = 12
  var15 = 29
Return

label clear
var11 = 0
var12 = 0
var13 = -1
Return

label TBD
  LOGSTR 1734700544 0 0 0 0
  var20 = 25000
  var9 = -20
  var10 = 30
  var11 = 20
  var12 = 30
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
    var13 += 3
  endif
elif var20 <= 24631 || Equal var20 24636 || Equal var20 24638
  if var3 > 20
    var7 = 0
    Return
  endif
endif

var4 = 0

var5 = var13
  SAFE_INJECT_4 var9
  SAFE_INJECT_5 var10
  SAFE_INJECT_6 var11
  SAFE_INJECT_7 var12
  // calculate own estimated position
  var17 = var5 + var4
  // if using a grounded attack then own offset will be very small
  if var20 >= 24625 && var20 <= 24631
    var17 -= var13 
    var17 -= var8
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
  EstOYCoord var1 var22
  // if the opponent is in an actionable state, lower the estimate of
  // their x offset to prevent dashdancing from setting it off when very far away
  if OCurrAction <= 21
    var22 /= 3
  endif
  EstOXCoord var0 var22
  var1 = var1 - (OSCDBottom - OTopNY)
  // var0 = estimated target x position
  // var1 = estimated target y position
  // var2 = estimated own x position
  // var17 = estimated own y position
  // var22 = temporary variable
  // correct if estimated y positions go beyond ground level
  // self
  var22 = YDistBackEdge + TopNY
  if var17 < var22 && Equal IsOnStage 1
    var22 -= var17
    var17 += var22
  endif
  // target
  var22 = OYDistBackEdge + OTopNY
  if var1 < var22 && Equal OIsOnStage 1
    var22 -= var1
    var1 += var22
  endif
  // if !(CalledAs ComboHub)
  //   if Equal var8 1 || Equal var18 1
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
    var0 = var0 - (var11 * OPos)
    var0 = var0 - (var9 * OPos)
  else
    var0 = var0 - (var11 * Direction)
    var0 = var0 - (var9 * Direction)
  endif
  // account for target height
  var22 = 0
  SAFE_INJECT_E var22
  var17 = OSCDBottom + OHurtboxSize
  var2 = TopNY - var10 + var12 + var22
  if var2 >= var17 
    // above
    var2 = OHurtboxSize * -1
  elif var2 <= OSCDBottom 
    // below
    var2 = 0
  else 
    // middle
    var2 = OHurtboxSize - (var17 - var2)
  endif
  // var2 += OHurtboxSize
  var1 += var2
  // if !(CalledAs ComboHub)
  //   if Equal var8 1 || Equal var18 1
  //     var0 += TopNX
  //     var1 += TopNY
  //     DrawDebugRectOutline var0 var1 var11 var12 0 255 0 136
  //     var0 -= TopNX
  //     var1 -= TopNY
  //     var17 = TopNY - var10 + var12 + var22
  //     DrawDebugRectOutline TopNX var17 10 0 0 255 255 136
  //     var22 = var9 + TopNX
  //     var17 = TopNY - var10
  //     DrawDebugRectOutline var22 var17 var11 var12 0 0 0 136
  //     var17 += var2
  //     DrawDebugRectOutline var22 var17 var11 var12 255 255 255 136
  //     var22 = OHurtboxSize / 2
  //     var17 = var22 + OSCDBottom
  //     DrawDebugRectOutline OTopNX var17 5 var22 255 255 0 221
  //   endif
  // endif
  var2 = var11
  var3 = var12
  var2 *= 2
  var3 *= 2
  Abs var0
  Abs var1
  if Equal AirGroundState 1
    var2 = var2 + var5 * 1.85 / 2
  else
    var2 = var2 + var5 * XSpeed / 2
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
  SAFE_INJECT_4 var9
  SAFE_INJECT_5 var10
  SAFE_INJECT_6 var11
  SAFE_INJECT_7 var12
  // calculate own estimated position
  var17 = var5 + var4
  // if using a grounded attack then own offset will be very small
  if var20 >= 24625 && var20 <= 24631
    var17 -= var13 
    var17 -= var8
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
  EstOYCoord var1 var22
  // if the opponent is in an actionable state, lower the estimate of
  // their x offset to prevent dashdancing from setting it off when very far away
  if OCurrAction <= 21
    var22 /= 3
  endif
  EstOXCoord var0 var22
  var1 = var1 - (OSCDBottom - OTopNY)
  // var0 = estimated target x position
  // var1 = estimated target y position
  // var2 = estimated own x position
  // var17 = estimated own y position
  // var22 = temporary variable
  // correct if estimated y positions go beyond ground level
  // self
  var22 = YDistBackEdge + TopNY
  if var17 < var22 && Equal IsOnStage 1
    var22 -= var17
    var17 += var22
  endif
  // target
  var22 = OYDistBackEdge + OTopNY
  if var1 < var22 && Equal OIsOnStage 1
    var22 -= var1
    var1 += var22
  endif
  // if !(CalledAs ComboHub)
  //   if Equal var8 1 || Equal var18 1
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
    var0 = var0 - (var11 * OPos)
    var0 = var0 - (var9 * OPos)
  else
    var0 = var0 - (var11 * Direction)
    var0 = var0 - (var9 * Direction)
  endif
  // account for target height
  var22 = 0
  SAFE_INJECT_E var22
  var17 = OSCDBottom + OHurtboxSize
  var2 = TopNY - var10 + var12 + var22
  if var2 >= var17 
    // above
    var2 = OHurtboxSize * -1
  elif var2 <= OSCDBottom 
    // below
    var2 = 0
  else 
    // middle
    var2 = OHurtboxSize - (var17 - var2)
  endif
  // var2 += OHurtboxSize
  var1 += var2
  // if !(CalledAs ComboHub)
  //   if Equal var8 1 || Equal var18 1
  //     var0 += TopNX
  //     var1 += TopNY
  //     DrawDebugRectOutline var0 var1 var11 var12 0 255 0 136
  //     var0 -= TopNX
  //     var1 -= TopNY
  //     var17 = TopNY - var10 + var12 + var22
  //     DrawDebugRectOutline TopNX var17 10 0 0 255 255 136
  //     var22 = var9 + TopNX
  //     var17 = TopNY - var10
  //     DrawDebugRectOutline var22 var17 var11 var12 0 0 0 136
  //     var17 += var2
  //     DrawDebugRectOutline var22 var17 var11 var12 255 255 255 136
  //     var22 = OHurtboxSize / 2
  //     var17 = var22 + OSCDBottom
  //     DrawDebugRectOutline OTopNX var17 5 var22 255 255 0 221
  //   endif
  // endif
  var2 = var11
  var3 = var12
  var2 *= 2
  var3 *= 2
  Abs var0
  Abs var1
  if Equal AirGroundState 1
    var2 = var2 + var5 * 1.85 / 2
  else
    var2 = var2 + var5 * XSpeed / 2
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
  Return
endif

var5 = OFramesHitstun
  SAFE_INJECT_4 var9
  SAFE_INJECT_5 var10
  SAFE_INJECT_6 var11
  SAFE_INJECT_7 var12
  // calculate own estimated position
  var17 = var5 + var4
  // if using a grounded attack then own offset will be very small
  if var20 >= 24625 && var20 <= 24631
    var17 -= var13 
    var17 -= var8
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
  EstOYCoord var1 var22
  // if the opponent is in an actionable state, lower the estimate of
  // their x offset to prevent dashdancing from setting it off when very far away
  if OCurrAction <= 21
    var22 /= 3
  endif
  EstOXCoord var0 var22
  var1 = var1 - (OSCDBottom - OTopNY)
  // var0 = estimated target x position
  // var1 = estimated target y position
  // var2 = estimated own x position
  // var17 = estimated own y position
  // var22 = temporary variable
  // correct if estimated y positions go beyond ground level
  // self
  var22 = YDistBackEdge + TopNY
  if var17 < var22 && Equal IsOnStage 1
    var22 -= var17
    var17 += var22
  endif
  // target
  var22 = OYDistBackEdge + OTopNY
  if var1 < var22 && Equal OIsOnStage 1
    var22 -= var1
    var1 += var22
  endif
  // if !(CalledAs ComboHub)
  //   if Equal var8 1 || Equal var18 1
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
    var0 = var0 - (var11 * OPos)
    var0 = var0 - (var9 * OPos)
  else
    var0 = var0 - (var11 * Direction)
    var0 = var0 - (var9 * Direction)
  endif
  // account for target height
  var22 = 0
  SAFE_INJECT_E var22
  var17 = OSCDBottom + OHurtboxSize
  var2 = TopNY - var10 + var12 + var22
  if var2 >= var17 
    // above
    var2 = OHurtboxSize * -1
  elif var2 <= OSCDBottom 
    // below
    var2 = 0
  else 
    // middle
    var2 = OHurtboxSize - (var17 - var2)
  endif
  // var2 += OHurtboxSize
  var1 += var2
  // if !(CalledAs ComboHub)
  //   if Equal var8 1 || Equal var18 1
  //     var0 += TopNX
  //     var1 += TopNY
  //     DrawDebugRectOutline var0 var1 var11 var12 0 255 0 136
  //     var0 -= TopNX
  //     var1 -= TopNY
  //     var17 = TopNY - var10 + var12 + var22
  //     DrawDebugRectOutline TopNX var17 10 0 0 255 255 136
  //     var22 = var9 + TopNX
  //     var17 = TopNY - var10
  //     DrawDebugRectOutline var22 var17 var11 var12 0 0 0 136
  //     var17 += var2
  //     DrawDebugRectOutline var22 var17 var11 var12 255 255 255 136
  //     var22 = OHurtboxSize / 2
  //     var17 = var22 + OSCDBottom
  //     DrawDebugRectOutline OTopNX var17 5 var22 255 255 0 221
  //   endif
  // endif
  var2 = var11
  var3 = var12
  var2 *= 2
  var3 *= 2
  Abs var0
  Abs var1
  if Equal AirGroundState 1
    var2 = var2 + var5 * 1.85 / 2
  else
    var2 = var2 + var5 * XSpeed / 2
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

if Equal var18 255
  var18 = 0
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
