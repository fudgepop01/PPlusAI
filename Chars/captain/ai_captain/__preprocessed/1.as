// APPROACH HUB
// controls which approach to use when pursuing a target location
#include <Definition_AIMain.h>
id 0x8001

unk 0x0

SetTimeout 400

var18 = 0

  var17 = 0
  SAFE_INJECT_2 var17
  if !(Equal var17 0)
    Seek CallAttacks
    Jump
  endif

if NoOpponent
  Return
endif

if FramesHitstun > 0 || Equal var11 0
  Call AIHub
endif

if !(Equal var21 36609) && !(Equal var21 36608) && !(Equal var21 32769)
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
  var17 = var11 * 0.75
  var9 -= var17
  var11 = var11 + var17
  var17 = var12 * 0.75
  var10 += var17
  var12 = var12 + var17

  if Equal var16 3 && var20 < 24640
    var11 *= 1.1
    var10 = var10 + (var12 * 1.5)
  endif 
endif
// this is used to detect when the target x position has passed through falcon, such as when changing direction or something

var7 = 65535

label

// these work together to only dashdance if not in a tech-chase or combo situation
  if Equal OCurrAction 78 || Equal OCurrAction 80 || Equal OCurrAction 82 || Equal OCurrAction 96 || Equal OCurrAction 97

elif Equal var21 36608 || Equal var21 8288 || Equal var21 32770 || OYDistBackEdge < -20
elif Equal var16 4 && Rnd < 0.3
else
  var0 = (120 - LevelValue) / 100
  var0 = (Rnd * 10) - 10 * var0
  var1 = (Rnd * 10) + 3
  label _dashdance
  if Equal CurrAction 10 || Equal CurrAction 22
    Return
  elif InAir && YDistBackEdge > -5 && YDistBackEdge < 0 && !(Equal XDistFrontEdge XDistBackEdge)
    if XDistBackEdge < -10 && XDistFrontEdge > 10
      Button R
      if ODistLE 30
        Stick -1 (-1)
      else
        Stick 1 (-1)
      endif
      Return
    endif
  elif Equal AirGroundState 1 && var0 > 0 && Equal OFramesHitstun 0
    if Equal CurrAction 1 && !(Equal CurrAction 7)
      ClearStick
    elif NumFrames >= var1 && Equal CurrAction 3
      Goto _ddSubr
    elif AnimFrame >= 27 && Equal CurrAction 3
      Goto _ddSubr
    elif Equal CurrAction 4
      ClearStick
    elif Rnd < 0.7 && Equal CurrAction 3 && !(XDistFrontEdge <= 10)
      Return
    elif XDistFrontEdge <= 10 || ODistLE 15
      SetFrame 0
      Stick (-1)
      var0 -= 1
    else
      Stick 1
    endif
    Return
  endif
  ClearStick
  Seek _dashdanceEnd
  Jump
  Return
  label _ddSubr
  SetFrame 0
  if Equal Direction OPos && Rnd < 0.1 && XDistFrontEdge > 10 && XDistBackEdge < -10
    Button X
  endif
  var0 = var0 - 1
  if (var0 > 0)
    Stick (-1)
  endif
  var1 = (Rnd * 10) + 3
  Return
  label _dashdanceEnd
endif

label BEGIN_MAIN

if Equal OAirGroundState 1 && Equal var16 3
  Call AIHub
endif

  if Equal CurrAction 276
    Call RecoveryHub
  endif
  if OYSpeed < 0 && OYDistBackEdge > -5 && Equal OCurrAction 73
    Call AIHub
  endif
if OCurrAction > 69 && Equal var20 24636 && !(Equal var19 1)
  if Rnd < 0.4
    Call AIHub
  else
    var18 = 0
    var19 = 1
    Call Grab
  endif
endif

if FramesHitstun > 0
  Call AIHub
endif

var21 = 32769

// literally an edge case
if Equal OAirGroundState 3 && TopNY > OTopNY && !(Equal var16 3)
  Call EdgeguardHub
endif


var17 = OXDistBackEdge
Abs var17
if MeteoChance
  if var17 > 70 && Equal IsOnStage 1
    Goto approachEdge
    Return
  elif OYDistBackEdge < -50 && Equal IsOnStage 1
    Goto approachEdge
    Return
  elif Equal var16 3 && var20 < 24640 && Equal IsOnStage 1
    Goto approachEdge
    Return
  elif Equal AirGroundState 1 && var17 > 40 && OYDistBackEdge < -1 && OYDistBackEdge > -50 && !(Equal XSpeed 0) && var20 >= 24640
    Button X
  elif !(Equal CurrSubaction JumpSquat) && Equal AirGroundState 1 && OYDistBackEdge < 10 && OYDistBackEdge > -50 && var20 >= 24640
    Button X
  elif OYDistBackEdge > -10 && !(Equal var16 3)
    Call EdgeguardHub
  endif

  if CanJump && YDistBackEdge > 70
    Call RecoveryHub
  elif !(CanJump) && YDistBackEdge > 50
    Call RecoveryHub
  endif
endif
if !(True)
  label approachEdge
  GetNearestCliff var2
  var2 -= TopNX
  Abs var2
  if var2 < 10
    var2 = OPos * -0.5
    AbsStick var2
    Return
  elif var2 < 20
    var17 = var9 + (var11 * 2)
    var17 /= 2
    if var17 > 1 && !(Equal Direction OPos)
      Stick -0.5
    endif
    if OYDistBackEdge > -50
      if OYDistBackEdge < 40 && var20 >= 24640
        Button X
      endif
      Seek edgeguardMovementComplete
      Jump
      ClearStick
    endif
    Return
  else
    AbsStick OPos
    if Equal CurrAction 1
      ClearStick
    endif
  endif
  Return
endif

label edgeguardMovementComplete


if var20 > 24655
  var14 = var13
endif

var8 = 0 //(var14 - var13) + 1

if var8 < 1
  var8 = 1
endif

if !(Equal YSpeed 0)
  Seek LOOP_DIST_CHECK
  Jump
elif Equal AirGroundState 1
  Seek LOOP_DIST_CHECK
  Jump
endif
label LOOP_DIST_EXIT
if !(True)
  label LOOP_DIST_CHECK
  // clacs distance to the target
  if var20 >= 24625 && var20 <= 24631
    if Equal AirGroundState 1 && Equal CurrAction 3 && !(Equal var20 24636) && !(Equal var20 24630)
      var4 = 4
    elif Equal AirGroundState 2
      var4 = 0
    else
      var4 = 0
    endif
  elif var20 >= 24641 && var20 <= 24655
    var4 = 0
    if Equal AirGroundState 1
      var4 = 4
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
  var17 = var13 + var4
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
  var22 = var13 + var4
  var4 = 0
  if !(CalledAs ComboHub) // because this involves a label
    // calculate Opponent change in 0.13 (used later)
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
  var22 = var13
  var5 = 0
  var6 = OCharYSpeed + OKBYSpeed
  var6 *= -1
  Seek _MID_CALC_O_GRAV
  Jump
  if !(True)
    label _MID_CALC_O_GRAV
    var5 += var6
    var22 -= 1
    var6 += var4 // 0.13
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
  var22 = AirTime + var13
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
  //   var17 = var13 - var8
  //   var5 = var5 + OXSpeed * var17 * -2
  // endif

  // var5 and var6 come from the macro
  var0 = var5
  var1 = var6
  Abs var0
  Abs var1
  // if we're not jumping

  if !(Equal CurrSubaction JumpSquat)
    var2 = 0

    // if one is negative and one is positive, and it's <= var11
    // then we likely passed through it at some point within the last frame
    var2 = var7 + var5
    Abs var2

  if Equal AirGroundState 2 && var0 <= var11 && LevelValue >= 75
    // SAFE_INJECT_E var1
  var17 = var13 + var8 - 2 //+ 3
  if YSpeed > 0
    var3 = YSpeed
    label _ffCalc
    var3 -= 0.13
    var4 += var3
    var17 -= 1
    if var3 <= 0 || var17 <= 0
      Seek
    else
      Seek _ffCalc
    endif
    Jump
  endif
  label
  if Equal AirGroundState 2
    var17 = var17 * 3.5
    var2 = var4 - var17
  else
    var2 = 0
  endif
  var3 = var13 + var8 - 2
  var3 /= 60
  var3 /= 2
  EstOYCoord var3 var3
  var3 = var3 + ExactOYCoord - OTopNY
  // LOGSTR 2122219008 2122219008 2113929216 0 0
  // LOGVAL OTopNY
  // LOGVAL var3
  // LOGVAL OYDistBackEdge
  // LOGVAL var12
  var17 = OYDistBackEdge + OTopNY
  var17 *= -1
  if var3 < var17
    var17 = var3 - var17
    var3 -= var17
  endif
  // if Equal var8 1 || Equal var18 1
  //   var5 += TopNX
  //   var17 = TopNY + var2
  //   DrawDebugRectOutline var5 var17 var11 var12 0 255 255 136
  //   var17 = var3
  //   DrawDebugRectOutline var5 var17 var11 var12 255 0 255 136
  //   var5 -= TopNX
  // endif
  var17 = var3 - TopNY - var2
  // LOGSTR 2122194944 1986097664 941653504 2113929216 0
  // LOGVAL var8
  // LOGVAL TopNY
  // LOGVAL OTopNY
  // LOGVAL var3
  // LOGVAL var2
  // LOGVAL var17
  var22 = YDistBackEdge + 10
  if var17 <= var12 && var17 > 0 && !(var2 < var22)
    var2 = 1
    // var2 = 0
  else
    var2 = 0
  endif
    // var1 = var6
    // Abs var1
    if Equal var2 1
      Seek CallAttacks
      Jump
    endif
  endif

    if var0 <= var11
      var2 = 0
      Goto XDistCheckPassed
      if Equal var2 1
        var2 = 0
        Seek CallAttacks
        Jump
      elif Equal var2 2
        Seek BEGIN_MAIN
        Return
      endif
      var17 = TopNY - OTopNY
      Abs var17
      if XDistLE 35 && var17 <= 40 && OAttacking && Equal AirGroundState 1 && !(Equal CurrSubaction JumpSquat)
        Call Unk3020
      endif
    elif var2 <= var11
      var2 = 0
      Goto XDistCheckPassed
      if Equal var2 1
        var2 = 0
        Seek CallAttacks
        Jump
      elif Equal var2 2
        Seek BEGIN_MAIN
        Return
      endif
    endif
    if CanJump && YDistBackEdge > 70
      Call RecoveryHub
    elif !(CanJump) && YDistBackEdge > 50
      Call RecoveryHub
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

if !(Equal CurrSubaction JumpSquat)

  // if one is negative and one is positive, and it's <= var11
  // then we likely passed through it at some point within the last frame
  var2 = var7 + var5
  Abs var2

  if Equal var7 65535
    // just makes sure this isn't affected by other variables
    var2 = 65535
  endif
  // if we want to perform an aerial, jump with respect to the
  // var13 to attempt to get there by the time the move's hitbox is out
  var17 = var5 //+ (TotalXSpeed * (var13 + 4) * -1) + TopNX
  var2 = var5 //+ (XSpeed * (var13 + 4)) + TopNX
  // var17 -= TopNX
  // var2 -= TopNX
  Abs var17
  Abs var2

  if Equal AirGroundState 1 && CurrAction <= 9 && Equal IsOnStage 1
    if var17 <= var11 && var20 >= 24641 && var20 <= 25000
      if MeteoChance
        if OYDistBackEdge < -5
          Button X
        endif
      elif var6 <= 90
        var17 = var9 + (var11 * 2)
        var17 /= 2
        label
        if var17 <= 0 && Equal Direction OPos
          Stick -1
          Return
        elif var17 > 0 && !(Equal Direction OPos)
          Stick -1
          Return
        endif
        Button X
      else
        ClearStick 0
      endif
    elif var2 <= var11 && var20 >= 24641 && var20 <= 25000
      if MeteoChance
        if OYDistBackEdge < -5
          Button X
        endif
      elif var6 <= 90
        var17 = var9 + (var11 * 2)
        var17 /= 2
        label
        if var17 <= 0 && Equal Direction OPos
          Stick -1
          Return
        elif var17 > 0 && !(Equal Direction OPos)
          Stick -1
          Return
        endif
        Button X
      else
        ClearStick 0
      endif
    elif Rnd <= 0.02 && var20 >= 24625 && var20 <= 24631 && XDistLE 80 100 && !(Equal var16 6) && !(Equal var16 3)
      // randomly perform tomhawk stuff if using a grounded move and not comboing
      Call mix_tomhawkJump
    elif Rnd <= 0.02 && Equal var20 32776 && !(Equal var16 6) && !(Equal var16 3)
      Call mix_tomhawkJump
    endif
  elif CanJump && Rnd <= 0.01 && var20 >= 24641 && var20 <= 24655 && Equal IsOnStage 1 && TopNY > OTopNY && !(Equal var16 6)
    Call mix_doubleJump
  elif CanJump && Rnd <= 0.01 && Equal var20 32776 && TopNY > OTopNY && !(Equal var16 6)
    Call mix_doubleJump

  endif

  if Equal var16 4
    if Rnd < 0.3 && var20 >= 24641 && var20 <= 24655 && Equal AirGroundState 1 && !(Equal CurrSubaction JumpSquat)
      var17 = var9 + (var11 * 2)
      var17 /= 2
      label
      if var17 <= 0 && Equal Direction OPos
        Stick -1
        Return
      elif var17 > 0 && !(Equal Direction OPos)
        Stick -1
        Return
      endif
      Button X
    endif
    if Rnd < 0.2 && var20 >= 24641 && var20 <= 24655 && InAir
      Seek CallAttacks
      Jump
    elif Rnd < 0.2 && var20 >= 24625 && var20 <= 24631 && !(InAir)
      Seek CallAttacks
      Jump
    endif
    label
  endif
endif

if !(SamePlane) && Rnd < 0.8
  if Equal AirGroundState 1 && var6 < 0
    var17 = 4
    Seek platformDrop
    Jump
  endif
endif

if !(True)
  label platformDrop
  ClearStick
  if CurrAction <= 5 && !(Equal CurrAction 3)
    AbsStick 0 (-1)
  elif Equal CurrAction 17
    AbsStick 0 (-1)
  else
    Return
  endif

  var17 -= 1

  if var17 <= 0
    Seek
  else
    Seek platformDrop
  endif
  Return
endif
label

  GetNearestCliff var2
  var17 = var15
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

GetNearestCliff var3
var3 = TopNX - var3

if var3 > 50 || var3 < -50 
  if Equal var2 2 && !(Equal var16 3)
    var18 = 0
    Call RecoveryHub
  endif
endif

// now that the calculations using these are over with, we'll store them
// for the next frame
var7 = var5

// if we're not in jumpsquat, we want to dash to the location
if Equal var16 3 && var20 < 24640
elif Equal AirGroundState 1 && !(Equal CurrSubaction JumpSquat)
  var17 = var5
  if var0 <= 1
    ClearStick
  elif var0 <= 10
    if CurrAction < 3 || CurrAction > 4
      ClearStick
      if var5 > 0
        AbsStick 0.6
      else
        AbsStick -0.6
      endif
    else
      AbsStick var17
    endif
  else
    AbsStick var17
  endif
  // to ensure we dash, we clear the stick if we're walking for whatever reason
  if Equal CurrAction 1 && LevelValue > 21 && 10 < var0
    ClearStick
  endif

  if !(SamePlane) && var0 <= 10 && !(Equal CurrSubaction JumpSquat)
    Goto JumpIfInRange
  endif
elif Equal CurrSubaction JumpSquat
  var17 = var5
  if var0 <= 1
    ClearStick
  elif var0 <= 10
    if CurrAction < 3 || CurrAction > 4
      ClearStick
      if var5 > 0
        AbsStick 0.6
      else
        AbsStick -0.6
      endif
    else
      AbsStick var17
    endif
  else
    AbsStick var17
  endif

  // adjusts the trajectory of the jump if the
  // target is moving
  var3 -= TopNX
  var17 = OXSpeed * 2
  if OXSpeed > 0.3
    ClearStick 0
    AbsStick var17 0
  elif OXSpeed < -0.3
    ClearStick 0
    AbsStick var17 0
  endif

  if var3 >= -25 && var3 <= 25
    if var3 > 0
      ClearStick 0
      if XSpeed > 0.1
        AbsStick -1
      endif
    elif var3 < 0
      ClearStick 0
      if XSpeed < -0.1
        AbsStick 1
      endif
    endif
  endif

  Goto JumpIfInRange
else
  // otherwise...
  var17 = var5 / 10
  if var17 > 0.1 && var17 < 0.3
    var17 = 0.3
  elif var17 < -0.1 && var17 > -0.3
    var17 = -0.3
  endif
  
  if XDistFrontEdge < 25 && Equal OPos Direction
    var17 /= 2
  elif XDistBackEdge > -25 && !(Equal OPos Direction)
    var17 /= 2
  endif
  AbsStick var17

  if !(Equal var2 0) && !(Equal var16 3)
    ClearStick 0
    var0 = XSpeed * -10
    AbsStick var0 0
  endif 

  if var20 >= 24641 && var20 <= 24655
    Goto JumpIfInRange
  elif Equal var20 25000
    Goto JumpIfInRange
  elif !(SamePlane)
    Goto JumpIfInRange
  endif
endif

Seek BEGIN_MAIN
if var2 > 0
  Return
endif
ClearStick 1
// without this it may fastfall automatically, which we don't want
Stick 0 0.5
Return

label JumpIfInRange
  var17 = var6
  if MeteoChance && Equal IsOnStage 0 && YSpeed < 0.01 && var17 > 35 && var17 < 55
    Button X
  endif
  if var17 > 15 && var17 < 90 && Equal AirGroundState 1 && CurrAction <= 9
    Button X
  endif
  if var17 > 20 && var17 < 90 && Equal CurrSubaction JumpSquat
    Button X
  endif
  if var17 > 35 && var17 < 55 && Equal AirGroundState 2 && CanJump && Equal IsOnStage 1 && YSpeed < 0.1
    Button X
  endif
Return

label XDistCheckPassed

var2 = 0

var17 = HurtboxSize
// if var6 < var17 && Equal AirGroundState 1 && Equal YSpeed 0 && !(Equal CurrAction 10)
//   var17 = 65535
// else
  var17 = var12 //+ (OHurtboxSize / 2)
// endif
if var1 <= var17
  var22 = var15
  var4 = 0
  var3 = YSpeed * -1
  Seek l_test
  Jump
  if !(True)
    label l_test
    var4 += var3
    var22 -= 1
    var3 += 0.13 // 0.13
    if var3 > 3.5
      var3 = 3.5
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

  if var20 >= 24632 && var20 <= 24635 && InAir
    Seek
    Jump
  endif

  if var20 >= 24641 && var20 <= 24655
    label
    if Equal AirGroundState 1 && CurrAction <= 23
      var17 = var9 + (var11 * 2)
      var17 /= 2
      if var17 > 0 && !(Equal Direction OPos)
        ClearStick
        Stick (-1)
        var2 = 2
        Return
      elif var17 <= 0 && Equal Direction OPos
        ClearStick
        Stick (-1)
        var2 = 2
        Return
      endif
      Button X
      Return
    elif Equal AirGroundState 1
      Return
    elif CanJump && Equal var2 2 && var4 < -70
      var19 = 0
      var16 = 0
      Call AIHub
    elif !CanJump && Equal var2 2 && var4 < -50
      var19 = 0
      var16 = 0
      Call AIHub

    else
      var2 = 1
    endif
  elif Equal AirGroundState 1
    var2 = 1
  endif
endif
Return

label CallAttacks

// {ADDITIONAL_IDLE_HOOK}

// if the action requires us to be stopped,
if var20 >= 24625 && var20 <= 24631
  label makeIdle
  Seek CallAttacks
  if Equal CurrAction 3
    // stops the dash
    ClearStick
    Button X
    Return
  endif
  if Equal CurrAction 4
    // interrupts run with crouch for one frame
    ClearStick
    Stick 0 (-1)
    Return
  endif
  if Equal CurrAction 10 || Equal CurrSubaction JumpSquat
    Return
  endif

  GetNearestCliff var2
  var17 = 4
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

  if InAir && YDistBackEdge > -10 && YDistBackEdge <= 0 && Equal var2 0
    ClearStick
    var17 = var5 / 10
    if XDistBackEdge < -5
      var17 = 0.4
    elif XDistFrontEdge < 5
      var17 = -0.4
    endif
    if LevelValue <= 60
      if Rnd < 0.4
        Button R
        AbsStick var17 (-1)
      endif
    else
      Button R
      AbsStick var17 (-1)
    endif
    if XDistBackEdge > -10 || XDistFrontEdge < 10
      ClearStick
      AbsStick 0 (-1)
    endif
    Return
  elif !(Equal AirGroundState 1)
    Call AIHub
  endif
  var17 = var9 + (var11 * 2)
  var17 /= 2
  if var17 > 0 && !(Equal Direction OPos)
    ClearStick
    Stick (-0.7)
    Return
  elif var17 <= 0 && Equal Direction OPos
    ClearStick
    Stick (-0.7)
    Return
  endif
  if CurrAction > 21
    Return
  endif
elif Equal CurrSubaction JumpSquat
  Return
elif var20 >= 24640 && var20 <= 24655 && Equal AirGroundState 1
  var17 = var9 + (var11 * 2)
  var17 /= 2
  if var17 > 0 && !(Equal Direction OPos)
    ClearStick
    Stick (-0.7)
    Return
  elif var17 <= 0 && Equal Direction OPos
    ClearStick
    Stick (-0.7)
    Return
  endif
  if AnimFrame >= var15 || CurrAction <= 23
    Button X
  endif
  Return
endif
// BReversing
if var20 >= 24632 && var20 <= 24635
  var17 = var9 + (var11 * 2)
  var17 /= 2
  if var17 > 0 && !(Equal Direction OPos)
    ClearStick
    Stick (-0.7)
  elif var17 <= 0 && Equal Direction OPos
    ClearStick
    Stick (-0.7)
  else
    var22 = OPos * 0.7
    ClearStick
    AbsStick var22
  endif
endif

// sets var18 to 1 so we know to actually perform the move instead
// of loading the move data and getting within the move's range -- we
// just did that in this script!
var18 = 1
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
elif Equal var20 32776
  Call FakeOutHub
elif Equal var20 25000
  var18 = 255
  Call ComboHub
endif
Return
Return
