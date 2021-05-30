#include <Definition_AIMain.h>
//TrueID=0x6040
id 0x6040

//Set Unknown
unk 0x0

//Strings

Cmd30

// {PRE_SCRIPT_HOOKS}

if CalledAs NAir
  Goto _NAir
elif CalledAs FAir
  Goto _FAir
elif CalledAs BAir
  Goto _BAir
elif CalledAs UAir
  Goto _UAir
elif CalledAs DAir
  Goto _DAir
elif CalledAs NSpecialAir
  Goto _NSpecialAir
elif CalledAs SSpecialAir
  Goto _SSpecialAir
elif CalledAs USpecialAir
  Goto _USpecialAir
elif CalledAs DSpecialAir
  Goto _DSpecialAir
else
  Call AIHub
endif

if Equal var18 0
  if Equal var16 2 && OFramesHitstun < 1
    Call DefendHub
  else
    Call ApproachHub
  endif
endif

if !(Equal AirGroundState 2)
  Call AIHub
endif

ClearStick
if CalledAs NAir
  Button A
elif CalledAs FAir
  Button A
  Stick 1 0
elif CalledAs BAir
  Button A
  Stick -1
elif CalledAs UAir
  Button A
  Stick 0 0.7
elif CalledAs DAir
  Button A
  Stick 1 (-0.7)
elif CalledAs NSpecialAir
  Button B
elif CalledAs SSpecialAir
  Button B
  Stick 1 0
elif CalledAs USpecialAir
  Button B
  Stick 0 0.7
elif CalledAs DSpecialAir
  Button B
  Stick 0 (-1)
endif
label
Seek 
Return
label
if OAttacking && Rnd < 0.7
  trackOAction 8 1
elif OCurrAction >= 26 && OCurrAction <= 33
  trackOAction 8 2
elif OCurrAction >= 52 && OCurrAction <= 56
  trackOAction 8 3
elif Rnd < 0.8
  trackOAction 8 0
endif

var3 = -1
label _begin
Goto checks
Goto CTD
Goto movement

// {PRE_HOOKS}

if CalledAs NAir
  Goto _NAir_impl
elif CalledAs FAir
  Goto _FAir_impl
elif CalledAs BAir
  Goto _BAir_impl
elif CalledAs UAir
  Goto _UAir_impl
elif CalledAs DAir
  Goto _DAir_impl
elif CalledAs NSpecialAir
  Goto _NSpecialAir_impl
elif CalledAs SSpecialAir
  Goto _SSpecialAir_impl
elif CalledAs USpecialAir
  Goto _USpecialAir_impl
elif CalledAs DSpecialAir
  Goto _DSpecialAir_impl
endif

  if Equal HitboxConnected 1
    if CalledAs DAir
      if var3 >= 11 || Equal var19 1
        Call ComboHub
      endif
    else
      Call ComboHub
    endif
  endif

Seek _begin
Return

label _NAir_impl
//   {NAir}
Return

label _FAir_impl
//   {FAir}
Return

label _BAir_impl
//   {BAir}
Return

label _UAir_impl
//   {UAir}
Return

label _DAir_impl
//   {DAir}
Return

label _NSpecialAir_impl
//   {NSpecialAir}
Return

label _SSpecialAir_impl
//   {SSpecialAir}
Return

label _USpecialAir_impl
//   {USpecialAir}
Return

label _DSpecialAir_impl
//   {DSpecialAir}
Return

label CTD
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
      var1 = 3
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
  var17 = var14 - var3 + var1
  // if using a grounded attack then own offset will be very small
  if var20 >= 24625 && var20 <= 24631
    var17 = 0
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
  // estimate target position separately  
  var22 = var14 - var3 + var1
  var1 = 0
  if CalledAs ApproachHub // because this involves a label
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
  var22 = var14 - var3
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
  var22 = var14 - var3 + var1
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
  var22 = var14 - var3 
  if var20 >= 24625 && var20 <= 24631
    if Equal AirGroundState 1 && Equal CurrAction 3 && !(Equal var20 24636) && !(Equal var20 24630)
      var22 += 0
    endif
  elif var20 >= 24641 && var20 <= 24655
    if Equal AirGroundState 1
      var22 += 3
    endif
  elif Equal var20 25000
    var22 += OFramesHitstun 
  endif
  EstOYCoord var6 var22
  // if the opponent is in an actionable state, lower the estimate of
  // their x offset to prevent dashdancing from setting it off when very far away
  if OCurrAction <= 9 && var20 < 24641
    var22 *= 0.3
  endif
  EstOXCoord var5 var22
  var6 = var6 - (OSCDBottom - OTopNY)
  if LevelValue >= 75 && !(Equal var16 6) && OCurrAction <= 15 && Equal OIsOnStage 1
    predictOOption var22 14 LevelValue
    var22 = 30 * OPos
    if Equal var22 1
      var5 += var22
    elif Equal var22 3
      var5 -= var22
    endif
  endif
  if LevelValue >= 48
    if var20 >= 24641 && var20 <= 24649
      var22 = var13 + 3 + 3
    else
      var22 = var13
    endif
    EstOYCoord var22 var22
    var1 = TopNY + YDistBackEdge
    if SamePlane && var22 <= var1 
      var22 = 1
    else
      var22 = 0
    endif
    if Equal OCurrAction 97 || Equal OCurrAction 96
      Seek
      Jump
    elif OCurrAction >= 68 && OCurrAction <= 73 && Equal var22 1
      label
      if Equal OCurrAction 97 && OAnimFrame > 18
      elif Equal OCurrAction 96
      else
        var1 = -9999.9999
      endif 
      predictOOption var22 10 LevelValue
      if Equal var22 1
        LOGSTR 1414485760 1095910400 1392508928 0 0
        var22 = 21
        if Equal OCurrAction 97
          var22 -= OAnimFrame
        endif
        var22 *= 2 * OPos
        var5 -= var22
      elif Equal var22 3
        LOGSTR 1096237312 1493172224 0 0 0
        var22 = 21
        if Equal OCurrAction 97
          var22 -= OAnimFrame
        endif
        var22 *= 2 * OPos
        var5 += var22
      endif
    endif
  endif
  // var5 = estimated target x position
  // var6 = estimated target y position
  // var0 = estimated own x position
  // var17 = estimated own y position
  // var22 = temporary variable
  // var1 = by some miracle, another temporary variable
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
  //   if Equal var8 1 || var18 >= 1
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
  // var17 = var17 - OHurtboxSize * 0.5
  
  // adjust for the move parameters
  if !(InAir)
    var22 = var9 + (var11 * 2)
    var22 /= 2
    if var22 <= 2
      var0 = var0 - (var9 * OPos)
    else 
      var0 = var0 + (var11 * OPos)
      var0 = var0 + (var9 * OPos)
    endif 
  else
    var0 = var0 + (var11 * Direction)
    var0 = var0 + (var9 * Direction)
  endif
  // if !(Equal SCDBottom TopNY) && var20 >= 24640
  //   var22 = SCDBottom - TopNY
  //   var17 -= var22
  // endif
  // if Equal AirGroundState 2
  //   var17 -= OHurtboxSize
  // endif
  
  // if !(CalledAs ComboHub)
  //   if Equal var8 1 || var18 >= 1
  //     // self
  //     DrawDebugRectOutline var0 var17 var11 var12 255 187 0 136
  //   endif
  // endif
  // calculate difference between the two
  
  var5 = var0 - var5
  var6 = var6 - var17
  // adjust for opponent position (aim towards nearest blastzone)
  if !(Equal var20 32776) && !(Equal var20 25000)
    var22 = 0
    var17 = LBoundary - (TopNX + var5) 
    if var17 < 90 && Equal Direction (-1)
      var17 = 0.0 + 1
      var17 = var11 * (1/var17)
      var17 /= 2
      var22 += var17
    endif
    var17 = RBoundary - (TopNX + var5)
    if var17 > -90 && Equal Direction 1
      var17 = 0.0 + 1
      var17 = var11 * (1/var17)
      var17 /= 2
      var22 -= var17
    endif
    var5 += var22
    if Equal var22 0
      var22 = Direction
      var17 = 0.0 + 1
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
  var0 = var6 * -1
  if var0 >= OHurtboxSize
    // self is above
    var0 = OHurtboxSize
  elif var0 <= 0 
    // self is below
    var0 = 0 // OHurtboxSize * -1
  else 
    // self is between
    var17 = var0 - OHurtboxSize
    // var0 -= var17
    // var0 = var22
  endif
  
  // if Equal AirGroundState 2
    
  //   if Equal OAirGroundState 1
  //     // var0 = var0 + OHurtboxSize * 0.5
  //     var0 += OHurtboxSize
  //   endif
  // endif
  var6 += var0
  if Equal AirGroundState 1 && Equal OAirGroundState 1 && var20 >= 24641 && var20 <= 24645 && SamePlane
    var6 = 0
  endif
  // if !(CalledAs ComboHub)
  //   if Equal var8 1 || var18 >= 1
  //     var5 += TopNX
  //     var6 += TopNY
  //     DrawDebugRectOutline var5 var6 var11 var12 0 255 0 136
  //     var5 -= TopNX
  //     var6 -= TopNY
  //     var17 = 0.0 + 1
  //     var17 = var11 * (1/var17)
  //     var11 = var17
  //     var9 = var9 + var17 * 0.0
  //     var17 = 0.0 + 1
  //     var17 = var12 * (1/var17)
  //     var12 = var17
  //     var10 = var10 - var17 * 0.0
  //     // var17 = TopNY - var10 + var12 + var22
  //     // DrawDebugRectOutline TopNX var17 10 0 0 255 255 136
  //     if CalledAs ApproachHub
  //       var11 -= 2.5
  //       var9 += 5
  //     endif
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
      
  //     if CalledAs ApproachHub
  //       var11 += 2.5
  //       var9 -= 5
  //     endif
  //     var17 = var11 * 0.0
  //     var9 -= var17
  //     var11 = var11 + var17
  //     var17 = var12 * 0.0
  //     var10 += var17
  //     var12 = var12 + var17
  //   endif
  // endif
  // if !(CalledAs ComboHub) && LevelValue >= 60 && !(Equal var16 6) 
  //   var17 = var14 - var3 - var8
  //   var5 = var5 + OXSpeed * var17 * -2
  // endif
Return

label checks
  if FramesHitstun > 0
    var22 = LevelValue * 0.01 - 0.1
    if LevelValue >= 60 && Rnd <= var22
      ClearStick
      Stick 0 (-1)
    endif
    Call OnGotDamaged
  endif
if var3 < 0 || var3 > var15
  var3 = -1
endif
Cmd30
var3 += 1
if Equal HitboxConnected 1 && OKBSpeed > var16 && OFramesHitstun > 0
  var16 = OKBSpeed
endif
if Equal var3 1
  if OAttacking && Rnd < 0.8
    trackOAction 12 1
  elif OCurrAction >= 26 && OCurrAction <= 33 && Rnd < 0.8
    trackOAction 12 2
  elif OCurrAction >= 52 && OCurrAction <= 56 && Rnd < 0.8
    trackOAction 12 3
  elif Rnd < 0.3
    trackOAction 12 0
  endif
endif
if Equal var3 10
  if OAttacking && Rnd < 0.7
    trackOAction 8 1
  elif OCurrAction >= 26 && OCurrAction <= 33 && Rnd < 0.7
    trackOAction 8 2
  elif OCurrAction >= 52 && OCurrAction <= 56 && Rnd < 0.7
    trackOAction 8 3
  elif Rnd < 0.2
    trackOAction 8 0
  endif
endif
if Equal var3 var13 && !(Equal var16 4) && Equal var21 32769
  predictOOption var17 14 LevelValue
  var22 = OTopNX - TopNX
  if var22 < -15 && Equal HitboxConnected 0
    if Equal AirGroundState 2
      if XSpeed < -0.2
        if Equal var17 3
          trackOAction 14 2
        else
          trackOAction 14 1
        endif
      elif XSpeed > 0.2
        if Equal var17 1
          trackOAction 14 2
        else
          trackOAction 14 3
          trackOAction 14 3
        endif
      endif
    elif True
      if Equal OPos Direction
        if Equal var17 3
          trackOAction 14 2
        else
          trackOAction 14 1
        endif
      elif True
        if Equal var17 1
          trackOAction 14 2
        else
          trackOAction 14 3
          trackOAction 14 3
        endif
      endif
    endif
  elif var22 > 15 && Equal HitboxConnected 0
    if Equal AirGroundState 2
      if XSpeed < -0.2
        if Equal var17 1
          trackOAction 14 2
        else
          trackOAction 14 3
          trackOAction 14 3
        endif
      elif XSpeed > 0.2
        if Equal var17 3
          trackOAction 14 2
        else
          trackOAction 14 1
        endif
      endif
    elif True
      if Equal OPos Direction
        if Equal var17 3
          trackOAction 14 2
        else
          trackOAction 14 1
        endif
      elif True
        if Equal var17 1
          trackOAction 14 2
        else
          trackOAction 14 3
          trackOAction 14 3
        endif
      endif
    endif
  else
    trackOAction 14 var17
  endif
  var22 = Rnd * 7
  if var22 < 1
    trackOAction 14 1
  elif var22 < 2
    trackOAction 14 2
  elif var22 < 4
    trackOAction 14 3
  endif
  // HIGHLIGHT_GUESSES(14, LevelValue)
endif
if var3 >= var15 || CurrAction <= 9
  Call AIHub
endif
  if !(Equal AirGroundState 2)
    Call AIHub
  endif
Return

label movement
  ClearStick

  GetNearestCliff var0
  var17 = var15 - var3
  var1 = XSpeed * var17
  var0 -= TopNX
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
    if Equal XDistBackEdge XDistFrontEdge || Equal IsOnStage 0
      var0 = 2
    else
      var0 = 0
    endif
  endif

  if YSpeed <= 0 && Equal IsOnStage 1 && Equal var2 1 && Equal var0 0
    LOGSTR 1936224000 1970037760 1598440960 0 0
    Stick 0 (-1)
  else
    Stick 0 0.5
  endif

  if !(Equal var0 0) && !(Equal var0 2)
    AbsStick var0
  elif !(Equal var16 4)
    if var5 < 0
      AbsStick -1 0
    else
      AbsStick 1 0
    endif
  endif

  Abs var5
  Abs var6
  if YSpeed < 0 && YDistBackEdge > -10 && YDistBackEdge <= 0 && Equal IsOnStage 1 && var3 > var14
    var17 = var11 * 2
    if var5 <= var17 && Equal var16 (-1)
      Return
    elif !(Equal var0 0)
      Return
    endif
    var19 = 2
    var18 = 1
    Call Landing
  endif
Return

label _NAir
var20 = 24641
var15 = 54
var9 = -10
var10 = -1.5
var11 = 9.5
var12 = 4.6
var13 = 9
var14 = 15
if Equal var19 1
var13 = 16
var14 = 28
endif
if Equal var19 2
var13 = 29
var14 = 41
endif
Return

label _FAir
var20 = 24642
var15 = 31
var9 = 0
var10 = 1
var11 = 7.5
var12 = 4.6
var13 = 6
var14 = 12
if Equal var19 1
var9 = 0
var10 = 3
var11 = 3.5
var12 = 7.6
var13 = 4
var14 = 5
endif
Return

label _BAir
var20 = 24643
var15 = 33
var9 = -16
var10 = 0
var11 = 7
var12 = 5
var13 = 10
var14 = 13
Return

label _UAir
var20 = 24644
var15 = 29
var9 = -4
var10 = -12
var11 = 4
var12 = 3
var13 = 7
var14 = 10
if Equal var19 1
endif
Return

label _DAir
var20 = 24645
var15 = 29
var9 = -4
var10 = 10
var11 = 4
var12 = 7
var13 = 4
var14 = 12
if Equal var19 1
var14 = 5
endif
Return

label _NSpecialAir

Return

label _SSpecialAir

Return

label _USpecialAir

Return

label _DSpecialAir

Return
Return
