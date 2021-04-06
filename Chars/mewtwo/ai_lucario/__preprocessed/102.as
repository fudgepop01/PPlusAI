// HOVER APPROACH HUB
// controls how mewtwo approaches to attack during hover

id 0x8102

unk 0x00000

SetTimeout 400

if !(Equal var21 36609) && !(Equal var21 36608) && !(Equal var21 32769) && !(Equal var21 33026)
  if LevelValue <= 60
    var17 = (100 - LevelValue) / 3
    var9 = var9 + (Rnd * var17 * 2) - (var17)
    var10 = var10 + (Rnd * var17 * 2) - (var17)
    var17 = (100 - LevelValue) / 5
    var11 = var11 + (Rnd * var17)
    var12 = var12 + (Rnd * var17)
    var17 = (100 - LevelValue) / 15
    var13 = var13 + (Rnd * var17) - (var17 / 2)
    var17 = (100 - LevelValue) / 25
    var15 = var15 + (Rnd * var17)
  else
    // var17 = var13 * 0.5
    // var9 = var9 - var17
    // var11 = var11 + var17 * 2
    // var10 = var10 - var17
    // var12 = var12 + var17 * 2
  endif
  // if !(Equal var21 32770) 
    var17 = var11 * 0.0
    var9 -= var17
    var11 = var11 + var17
    var17 = var12 * 0.0
    var10 += var17
    var12 = var12 + var17
  // endif

  if Equal var16 3 && var20 < 24640
    var11 *= 1.1
    var10 = var10 + (var12 * 1.5)
  endif 
endif

var21 = 33026

label

if !(Equal CurrAction 288) && CanJump
  if Equal AirGroundState 1
    if Equal var20 24643
      if Equal AirGroundState 1 && Equal OPos Direction
        Stick -1
        Return
      elif Equal OPos Direction
        Call AIHub
      endif
    elif Equal var20 24642
      if Equal AirGroundState 1 && !(Equal OPos Direction)
        Stick -1
        Return
      elif !(Equal OPos Direction)
        Call AIHub
      endif
    endif 
    if CurrAction <= 9
      Button X
    endif
    AbsStick OPos
  else
    Button X
    AbsStick OPos (-1)
  endif
  Return
endif

label Begin

if !(Equal CurrAction 288)
  Call ApproachHub
endif

// keeps hover going
Button X


if var20 > 24655
  var14 = var13
endif

var8 = (var14 - var13) + 1

var8 = 1

Seek LOOP_DIST_CHECK
Jump
label LOOP_DIST_EXIT
if !(True)
  label LOOP_DIST_CHECK
  // this prevents it from auto-attacking.
  // this issue persisted for... 9 months
  Cmd30
  if var20 >= 24625 && var20 <= 24631
    if Equal AirGroundState 1 && Equal CurrAction 3 && !(Equal var20 24636) && !(Equal var20 24630)
      var3 = 0
    elif Equal AirGroundState 2
      var3 = 0
    else
      var3 = 0
    endif
  elif var20 >= 24641 && var20 <= 24655
    var3 = 0
    if Equal AirGroundState 1
      var3 = 0
    endif
  elif Equal var20 25000
    var3 = OFramesHitstun 
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
  var17 = var13 + var8 + var3
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
  // invert them because sometimes that happens
  // if var1 > var17 && TopNY < OTopNY
  //   var22 = var17
  //   var17 = var1
  //   var1 = var22
  // elif var1 < var17 && TopNY > OTopNY
  //   var22 = var17
  //   var17 = var1
  //   var1 = var22
  // endif 
  // if var0 > var2 && TopNX > OTopNX
  //   var22 = var2
  //   var2 = var0
  //   var0 = var22
  // elif var0 < var2 && TopNX < OTopNX
  //   var22 = var2
  //   var2 = var0
  //   var0 = var22
  // endif
  // no need to do this for the X axis (trust me i've tried)
  var2 -= OTopNX
  var2 *= -2
  var22 = var0 - OTopNX
  var2 += var22
  var2 += TopNX
  // estimate target position separately  
  var22 = var13 + var8 + var3
  var3 = 0
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
  var22 = var13 + var8
  var1 = 0
  if Equal CurrSubaction JumpSquat
    var3 = -1.482
  else
    var3 = YSpeed * -1
  endif
  Seek _MID_CALC_GRAV
  Jump
  if !(True)
    label _MID_CALC_GRAV
    var1 += var3
    var22 -= 1
    var3 += 0.082 // 0.082
    if var3 > 2.3
      var3 = 2.3
    elif var3 > MaxFallSpeed
      var3 = MaxFallSpeed
    endif
    if var22 < 1
      Seek
    else
      Seek _MID_CALC_GRAV
    endif
    Jump
  endif
  label
    var17 = TopNY - var1
    // calculate Opponent change in 0.082 (used later)
if OIsCharOf Bowser
  var3 = 113
  var3 = 0.13
elif OIsCharOf Falcon
  var3 = 104
  var3 = 0.13
elif OIsCharOf Lizardon // Charizard
  var3 = 106
  var3 = 0.105
elif OIsCharOf Diddy
  var3 = 85
  var3 = 0.12
elif OIsCharOf Donkey
  var3 = 109
  var3 = 0.1
elif OIsCharOf Falco
  var3 = 80
  var3 = 0.17
elif OIsCharOf Fox
  var3 = 75
  var3 = 0.23
  // 2.8
elif OIsCharOf Gamewatch
  var3 = 75
  var3 = 0.095
elif OIsCharOf Ganondorf
  var3 = 109
  var3 = 0.13
// GIGA BOWSER WOULD GO HERE
// elif OIsCharOf Bowser
//   var3 = 113
//   var3 = 0.13
elif OIsCharOf Nana || OIsCharOf Popo
  var3 = 88
  var3 = 0.1
elif OIsCharOf Ike
  var3 = 100
  var3 = 0.103
elif OIsCharOf Fushigisou // Ivysaur
  var3 = 85
  var3 = 0.075
elif OIsCharOf Purin // Jigglypuff
  var3 = 62
  var3 = 0.064
elif OIsCharOf DDD // King Dedede
  var3 = 107
  var3 = 0.095
elif OIsCharOf Kirby
  var3 = 74
  var3 = 0.08
elif OIsCharOf Knuckles
  var3 = 90
  var3 = 0.14
elif OIsCharOf Link
  var3 = 104
  var3 = 0.11
elif OIsCharOf Lucario
  var3 = 94
  var3 = 0.125
elif OIsCharOf Lucas
  var3 = 80
  var3 = 0.125
elif OIsCharOf Luigi
  var3 = 100
  var3 = 0.069 // nice
  // 1.6
elif OIsCharOf Mario
  var3 = 100
  var3 = 0.095 // 1.7
elif OIsCharOf Marth
  var3 = 87
  var3 = 0.085
elif OIsCharOf Metaknight
  var3 = 79
  var3 = 0.11
elif OIsCharOf Mewtwo
  var3 = 90
  var3 = 0.082
elif OIsCharOf Ness
  var3 = 94
  var3 = 0.09
elif OIsCharOf Pikmin // Olimar
  var3 = 90
  var3 = 0.09
elif OIsCharOf Peach
  var3 = 90
  var3 = 0.08
elif OIsCharOf Pikachu
  var3 = 80
  var3 = 0.11
elif OIsCharOf Pit
  var3 = 80
  var3 = 0.095
elif OIsCharOf Robot // ROB
  var3 = 104
  var3 = 0.09
elif OIsCharOf Roy
  var3 = 85
  var3 = 0.114
elif OIsCharOf Samus
  var3 = 110
  var3 = 0.66
elif OIsCharOf Shiek
  var3 = 90
  var3 = 0.12
elif OIsCharOf Snake
  var3 = 105
  var3 = 0.098
elif OIsCharOf Sonic
  var3 = 82
  var3 = 0.122
elif OIsCharOf Zenigame // Squirtle
  var3 = 85
  var3 = 0.126
elif OIsCharOf Toonlink
  var3 = 85
  var3 = 0.11
elif OIsCharOf Wario
  var3 = 102
  var3 = 0.112
// WARIO MAN GOES HERE
// elif OIsCharOf Bowser
//   var3 = 113
//   var3 = 0.13
elif OIsCharOf Wolf
  var3 = 85
  var3 = 0.16
elif OIsCharOf Yoshi
  var3 = 108
  var3 = 0.093
elif OIsCharOf Zelda
  var3 = 90
  var3 = 0.073
elif OIsCharOf ZSS // Zero Suit Samus
  var3 = 85
  var3 = 0.135
endif
  var22 = var13 + var8 + var3
  var0 = 0
  var1 = OCharYSpeed + OKBYSpeed
  var1 *= -1
  Seek _MID_CALC_O_GRAV
  Jump
  if !(True)
    label _MID_CALC_O_GRAV
    var0 += var1
    var22 -= 1
    var1 += var3 // 0.082
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
    var3 = var0
  endif
  // it's awful, I know, but i'm all out of variables and this was the only way lol
  var22 = var13 + var8 
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
  EstOYCoord var1 0
  // if the opponent is in an actionable state, lower the estimate of
  // their x offset to prevent dashdancing from setting it off when very far away
  var22 = 0
  if OCurrAction <= 9 && var20 < 24641
    var22 = -5
  endif
  EstOXCoord var0 var22
  var1 = var1 - (OSCDBottom - OTopNY)
  // var0 = estimated target x position
  // var1 = estimated target y position
  // var2 = estimated own x position
  // var17 = estimated own y position
  // var22 = temporary variable
  // correct if estimated y positions go beyond ground level
  // target
  // var17 += var22
  // var17 -= var3
  // if var3 > 0 && Equal OAirGroundState 2
  //   var17 -= var3
  // endif
  // var22 = OTopNY - var3
  // DrawDebugLine OTopNX OTopNY OTopNX var22 255 0 0 221
  var22 = OYDistBackEdge + OTopNY
  if var1 < var22 && Equal OIsOnStage 1
    var22 -= var1
    var1 += var22
  elif Equal OCurrAction 70 || Equal OCurrAction 74 || Equal OCurrAction 84 || Equal OCurrAction 85
    var22 -= var1
    var1 += var22
  elif Equal OAirGroundState 1
    // var17 -= var3
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
  //     DrawDebugRectOutline var2 var17 5 5 255 0 0 136
  //     // target
  //     DrawDebugRectOutline var0 var1 5 5 0 0 255 136
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
      var2 = var2 - (var9 * OPos)
    else 
      var2 = var2 + (var11 * OPos)
      var2 = var2 + (var9 * OPos)
    endif 
  else
    var2 = var2 + (var11 * Direction)
    var2 = var2 + (var9 * Direction)
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
  //     DrawDebugRectOutline var2 var17 var11 var12 255 187 0 136
  //   endif
  // endif
  // calculate difference between the two
  
  var0 = var2 - var0
  var1 = var1 - var17
  // adjust for opponent position (aim towards nearest blastzone)
  if !(Equal var20 32776) && !(Equal var20 25000)
    var17 = LBoundary - (TopNX + var0) 
    var22 = 0
    if var17 < 90 && Equal Direction (-1)
      var17 = 0.0 + 1
      var17 = var11 * (1/var17)
      var17 /= 2
      var22 += var17
    endif
    var17 = RBoundary - (TopNX + var0)
    if var17 > -90 && Equal Direction 1
      var17 = 0.0 + 1
      var17 = var11 * (1/var17)
      var17 /= 2
      var22 -= var17
    endif
    var0 += var22
    if Equal var22 0
      var22 = OPos * Direction
      var17 = 0.0 + 1
      var17 = var11 * (1/var17)
      var22 *= var17
      var22 /= 2
      var0 -= var22
    endif
  endif
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
  //   if Equal var8 1 || Equal var18 1
  //     var0 += TopNX
  //     var1 += TopNY
  //     DrawDebugRectOutline var0 var1 var11 var12 0 255 0 136
  //     var0 -= TopNX
  //     var1 -= TopNY
  //     var17 = 0.0 + 1
  //     var17 = var11 * (1/var17)
  //     var11 = var17
  //     var9 = var9 + var17 * 0.0
  //     var17 = 0.0 + 1
  //     var17 = var12 * (1/var17)
  //     var12 = var17
  //     var10 = var10 - var17 * 0.0
  //     var17 = TopNY - var10 + var12 + var22
  //     DrawDebugRectOutline TopNX var17 10 0 0 255 255 136
  //     var22 = (var9 + var11)
  //     var22 *= Direction
  //     var22 += TopNX
  //     var17 = TopNY - var10 + var12
  //     DrawDebugRectOutline var22 var17 var11 var12 136 136 136 136
  //     var17 += var2
  //     // if OTopNX > 0
  //     //   var22 += var11
  //     // else
  //     //   var22 -= var11
  //     // endif 
  //     DrawDebugRectOutline var22 var17 var11 var12 255 255 255 136
  //     var22 = OHurtboxSize / 2
  //     var17 = var22 + OSCDBottom
  //     DrawDebugRectOutline OTopNX var17 5 var22 255 255 0 221
      
  //     var17 = var11 * 0.0
  //     var9 -= var17
  //     var11 = var11 + var17
  //     var17 = var12 * 0.0
  //     var10 += var17
  //     var12 = var12 + var17
  //   endif
  // endif
  // if !(CalledAs ComboHub) && LevelValue >= 60 && !(Equal var16 6) 
  //   var17 = var13 + var8 - var8
  //   var0 = var0 + OXSpeed * var17 * -2
  // endif

  // var0 and var1 come from the macro
  var2 = var0
  var3 = var1
  Abs var2
  Abs var3

  if var2 <= var11
    var17 = var12 + (OHurtboxSize / 2)
    if var3 <= var17
  var22 = var15
  var4 = 0
  if Equal CurrSubaction JumpSquat
    var3 = -1.482
  else
    var3 = YSpeed * -1
  endif
  Seek l_test
  Jump
  if !(True)
    label l_test
    var4 += var3
    var22 -= 1
    var3 += 0.082 // 0.082
    if var3 > 2.3
      var3 = 2.3
    elif var3 > MaxFallSpeed
      var3 = MaxFallSpeed
    endif
    if var22 < 1
      Seek
    else
      Seek l_test
    endif
    Jump
  endif
  label
      var4 = (YDistFrontEdge * -1) - var4

  GetNearestCliff var2
  var17 = var15 + 3
  var3 = XSpeed * var17
  var3 += TopNX
  if var2 < 0
    if Equal IsOnStage 1 && !(Equal DistBackEdge DistFrontEdge)
      var2 -= var3
      if var2 >= 0
        var2 = 1
      endif
    endif
  elif var2 > 0
    if Equal IsOnStage 1 && !(Equal DistBackEdge DistFrontEdge)
      var2 -= var3
      if var2 <= 0
        var2 = -1
      endif
    endif
  endif
  if !(Equal var2 1) && !(Equal var2 -1)
    if Equal DistBackEdge DistFrontEdge || Equal IsOnStage 0
      var2 = 2
    else
      var2 = 0
    endif
  endif
      
      if !(Equal var2 0)
        if !(CanJump) && NumJumps > 0 && var4 < -30
          var19 = 0
          Call AIHub
        else
          Seek CallAttacks
          Jump
        endif
      else
        Seek CallAttacks
        Jump
      endif
    endif
  endif

  var8 -= 1
  if var8 < 1
    Seek LOOP_DIST_EXIT
    Jump
    Return
  endif
  Seek LOOP_DIST_CHECK
  Jump
endif

if CanJump && YDistBackEdge > 80
  Call RecoveryHub
elif !(CanJump) && YDistBackEdge > 45
  Call RecoveryHub
elif !(CanJump) && NumJumps > 0 && YDistBackEdge > 30
  Call RecoveryHub
endif

AbsStick var0 var1

if YDistBackEdge > -5 && Equal IsOnStage 1 && var1 < 0
  ClearStick 1
endif

Seek Begin
Return
label CallAttacks

var18 = 1
if Equal var20 24641
  Call NAir
elif Equal var20 24642
  Call FAir
elif Equal var20 24643
  Call BAir
elif Equal var20 24644
  Call UAir
elif Equal var20 24645
  Call DAir
endif

Return
Return
