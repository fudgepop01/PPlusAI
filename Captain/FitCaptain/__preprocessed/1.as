// APPROACH HUB
// controls which approach to use when pursuing a target location
#include <Definition_AIMain.h>
id 0x8001

unk 0x0

SetTimeout 400

if FramesHitstun > 0 || Equal var11 0
  Call AIHub
endif

if !(Equal var21 36609) && !(Equal var21 36608)
  var0 = (100 - LevelValue) / 3
  var9 = var9 + (Rnd * var0 * 2) - (var0)
  var10 = var10 + (Rnd * var0 * 2) - (var0)
  var0 = (100 - LevelValue) / 5
  var11 = var11 + (Rnd * var0)
  var12 = var12 + (Rnd * var0)
  var0 = (100 - LevelValue) / 15
  var13 = var13 + (Rnd * var0) - (var0 / 2)
  var0 = (100 - LevelValue) / 25
  var15 = var15 + (Rnd * var0)
endif
// this is used to detect when the target x position has passed through falcon, such as when changing direction or something

var7 = 65535

label

// these work together to only dashdance if not in a tech-chase or combo situation
  if Equal OCurrAction 78 || Equal OCurrAction 80 || Equal OCurrAction 82 || Equal OCurrAction 96 || Equal OCurrAction 97
elif Equal var21 36608 || Equal var21 32770 || OYDistBackEdge < -20
elif Equal var21 253 && Rnd < 0.3
else
  var0 = (120 - LevelValue) / 100
  var0 = (Rnd * 10) - 10 * var0
  var1 = (Rnd * 10) + 3
  label _dashdance
  if Equal AirGroundState 1 && var0 > 0 && Equal OFramesHitstun 0 && !(ODistLE 4)
    if Equal CurrAction 1 && !(Equal CurrAction 7)
        ClearStick
    elif NumFrames >= var1 && Equal CurrAction 3
      Goto _ddSubr
    elif AnimFrame >= 27 && Equal CurrAction 3
      Goto _ddSubr
    elif Equal CurrAction 4
      ClearStick
    elif Rnd < 0.7 && Equal CurrAction 3 && !(XDistFrontEdge <= 10)
    elif XDistFrontEdge <= 10
      SetFrame 0
      Stick -1
      var0 -= 1
    else
      Stick 1
    endif
    Return
  endif
  ClearStick
  Seek _dashdanceEnd
  Jump
  label _ddSubr
  SetFrame 0
  var0 = var0 - 1
  if (var0 > 0)
    Stick (-1)
  endif
  var1 = (Rnd * 10) + 3
  Return
  label _dashdanceEnd
endif

label BEGIN_MAIN

if FramesHitstun > 0
  Call AIHub
endif

var21 = 32769

// literally an edge case
if Equal OAirGroundState 3 && TopNY > OTopNY && !(Equal var19 255)
  Call EdgeguardHub
endif


var17 = OXDistBackEdge
Abs var17
if MeteoChance
  if var17 > 70 && Equal IsOnStage 1
    Goto approachEdge
    Return
  elif Equal var19 255 && var20 < 24640 && Equal IsOnStage 1
    Goto approachEdge
    Return
  elif Equal AirGroundState 1 && var17 > 40 && OYDistBackEdge < -1 && !(Equal XSpeed 0) && var20 >= 24640
    Button X
  elif !(Equal CurrSubaction JumpSquat) && Equal AirGroundState 1 && OYDistBackEdge < 10 && var20 >= 24640
    Button X
  elif OYDistBackEdge > -10 && !(Equal var19 255)
    Call EdgeguardHub
  endif

  if var2 < OTopNY && Equal IsOnStage 0 && Equal var19 255 && OXDistFrontEdge < 20 && YDistBackEdge > 30
    Call RecoveryHub
  endif
endif
if !(True)
  label approachEdge
  GetNearestCliff var2
  var2 -= TopNX
  Abs var2
  if var2 < 10
    var2 = OPos * -1 / 2
    AbsStick var2
    Return
  elif var2 < 20
    if !(Equal Direction OPos)
      Stick -0.5
    else
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
  var14 = 1
endif

var8 = var14

Seek LOOP_DIST_CHECK
Jump
label LOOP_DIST_EXIT
if !(True)
  label LOOP_DIST_CHECK
  // clacs distance to the target
  if Equal var8 var14
    // DrawDebugPoint TopNX TopNY 255 0 255 255
  endif
  var5 = TopNX + (var9 * Direction)
  var6 = TopNY - var10
  if Equal var8 var14
    // DrawDebugPoint var5 var6 255 0 255 255
  endif
  // var6
  var6 = 0
  var5 = 0
if OIsCharOf Bowser
  var3 = 113
  var4 = 0.13
elif OIsCharOf Falcon
  var3 = 104
  var4 = 0.13
elif OIsCharOf Lizardon // Charizard
  var3 = 106
  var4 = 0.105
elif OIsCharOf Diddy
  var3 = 85
  var4 = 0.12
elif OIsCharOf Donkey
  var3 = 109
  var4 = 0.1
elif OIsCharOf Falco
  var3 = 80
  var4 = 0.17
elif OIsCharOf Fox
  var3 = 75
  var4 = 0.23
elif OIsCharOf Gamewatch
  var3 = 75
  var4 = 0.095
elif OIsCharOf Ganondorf
  var3 = 109
  var4 = 0.13
// GIGA BOWSER WOULD GO HERE
// elif OIsCharOf Bowser
//   var3 = 113
//   var4 = 0.13
elif OIsCharOf Nana || OIsCharOf Popo
  var3 = 88
  var4 = 0.1
elif OIsCharOf Ike
  var3 = 100
  var4 = 0.103
elif OIsCharOf Fushigisou // Ivysaur
  var3 = 85
  var4 = 0.075
elif OIsCharOf Purin // Jigglypuff
  var3 = 62
  var4 = 0.064
elif OIsCharOf DDD // King Dedede
  var3 = 107
  var4 = 0.095
elif OIsCharOf Kirby
  var3 = 74
  var4 = 0.08
elif OIsCharOf Knuckles
  var3 = 90
  var4 = 0.14
elif OIsCharOf Link
  var3 = 104
  var4 = 0.11
elif OIsCharOf Lucario
  var3 = 94
  var4 = 0.125
elif OIsCharOf Lucas
  var3 = 80
  var4 = 0.125
elif OIsCharOf Luigi
  var3 = 100
  var4 = 0.069 // nice
elif OIsCharOf Mario
  var3 = 100
  var4 = 0.095
elif OIsCharOf Marth
  var3 = 87
  var4 = 0.085
elif OIsCharOf Metaknight
  var3 = 79
  var4 = 0.11
elif OIsCharOf Mewtwo
  var3 = 90
  var4 = 0.082
elif OIsCharOf Ness
  var3 = 94
  var4 = 0.09
elif OIsCharOf Pikmin // Olimar
  var3 = 90
  var4 = 0.09
elif OIsCharOf Peach
  var3 = 90
  var4 = 0.08
elif OIsCharOf Pikachu
  var3 = 80
  var4 = 0.11
elif OIsCharOf Pit
  var3 = 80
  var4 = 0.095
elif OIsCharOf Robot // ROB
  var3 = 104
  var4 = 0.09
elif OIsCharOf Roy
  var3 = 85
  var4 = 0.114
elif OIsCharOf Samus
  var3 = 110
  var4 = 0.66
elif OIsCharOf Shiek
  var3 = 90
  var4 = 0.12
elif OIsCharOf Snake
  var3 = 105
  var4 = 0.098
elif OIsCharOf Sonic
  var3 = 82
  var4 = 0.122
elif OIsCharOf Zenigame // Squirtle
  var3 = 85
  var4 = 0.126
elif OIsCharOf Toonlink
  var3 = 85
  var4 = 0.11
elif OIsCharOf Wario
  var3 = 102
  var4 = 0.112
// WARIO MAN GOES HERE
// elif OIsCharOf Bowser
//   var3 = 113
//   var4 = 0.13
elif OIsCharOf Wolf
  var3 = 85
  var4 = 0.16
elif OIsCharOf Yoshi
  var3 = 108
  var4 = 0.093
elif OIsCharOf Zelda
  var3 = 90
  var4 = 0.073
elif OIsCharOf ZSS // Zero Suit Samus
  var3 = 85
  var4 = 0.135
endif
  var17 = 0
  if OInAir && !(Equal OYSpeed 0) && !(Equal OCurrAction 84)
  var17 = var13 + var8
  var6 = 0
  var3 = OCharYSpeed + OKBYSpeed
  var3 *= -1
  Seek _oCalc
  Jump
  if !(True)
    label _oCalc
    var6 += var3
    var17 -= 1
    var3 += var4 // gravity
    if var3 > OMaxFallSpeed
      var3 = OMaxFallSpeed
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
  var17 = var13 + var8
  var5 = 0
  var3 = YSpeed * -1
  Seek _sCalc
  Jump
  if !(True)
    label _sCalc
    var5 += var3
    var17 -= 1
    var3 += 0.13 // gravity
    if var3 > MaxFallSpeed
      var3 = MaxFallSpeed
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
      if YSpeed < 0
        Call AIHub
      endif
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
  // var5
  if Equal CurrAction 7
    var5 = OTopNX + (var9 * Direction)
  else
    var5 = OTopNX + (var9 * Direction * -1)
  endif
  if var20 >= 24641 && var20 <= 24655
    if InAir || Equal var8 1
      var17 = var13 + var8
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
  // if Equal var8 1 || Equal var8 var14
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

  // var5 and var6 come from the macro
  var0 = var5
  var1 = var6
  Abs var0
  Abs var1
  // if we're not jumping

  if !(Equal CurrSubaction JumpSquat)

    // if one is negative and one is positive, and it's <= var11
    // then we likely passed through it at some point within the last frame
    var2 = var7 + var5
    Abs var2

    if var0 <= var11
      Goto XDistCheckPassed
      var17 = TopNY - OTopNY
      Abs var17
      if XDistLE 35 && var17 <= 40 && OAttacking && Equal AirGroundState 1 && !(Equal CurrSubaction JumpSquat)
        Call Unk3020
      endif
    elif var2 <= var11
      Goto XDistCheckPassed
    endif
    if YDistBackEdge > 30
      Call AIHub
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
  // var13 (that's a really poor name for it tbh lol)
  // to attempt to get there by the time the move's hitbox is out
  var17 = var5 + (TotalXSpeed * var13 * -1)
  var2 = var5 + (XSpeed * var13)
  Abs var17
  Abs var2

  if Equal AirGroundState 1 && CurrAction <= 9 && OFramesHitstun < 1 && Equal IsOnStage 1
    if var17 <= var11 && var20 >= 24641 && var20 <= 24655
      if MeteoChance
        if OYDistBackEdge < -5
          Button X
        endif
      else
        // Button X
      endif
    elif var2 <= var11 && var20 >= 24641 && var20 <= 24655
      if MeteoChance
        if OYDistBackEdge < -5
          Button X
        endif
      else
        // Button X
      endif
    elif Rnd <= 0.02 && var20 >= 24625 && var20 <= 24639 && XDistLE 40 60
      // randomly perform tomhawk stuff if using a grounded move and not comboing
      Call mix_tomhawkJump
    elif Rnd <= 0.02 && Equal var20 32776
      Call mix_tomhawkJump
    endif
  elif CanJump && Rnd <= 0.03 && var20 >= 24641 && var20 <= 24655 && Equal IsOnStage 1 && TopNY > OTopNY
    // randomly double-jump aerial instead of going straight for the aerial
    Call mix_doubleJump
  elif CanJump && Rnd <= 0.01 && Equal var20 32776 && TopNY > OTopNY
    Call mix_doubleJump
  endif

  if Equal var19 253
    if Rnd < 0.3 && var20 >= 24641 && var20 <= 24655 && Equal AirGroundState 1 && !(Equal CurrSubaction JumpSquat)
      Button X
    endif
    if Rnd < 0.2 && var20 >= 24641 && var20 <= 24655 && InAir && Equal Direction OPos
      Seek CallAttacks
      Jump
    elif Rnd < 0.2 && var20 >= 24625 && var20 <= 24639 && !(InAir)
      Seek CallAttacks
      Jump
    endif
  endif
endif

  GetNearestCliff var2
  var3 = XSpeed * var15
  var3 += TopNX
  if var2 < 0
    if Equal IsOnStage 0 || Equal DistBackEdge DistFrontEdge
      var2 += var3
      if var2 >= 0
        var2 = 1
      endif
    endif
  elif var2 > 0
    if Equal IsOnStage 0 || Equal DistBackEdge DistFrontEdge
      var2 += var3
      if var2 <= 0
        var2 = -1
      endif
    endif
  endif
  if !(Equal var2 1) || !(Equal var2 -1)
    if Equal DistBackEdge DistFrontEdge || Equal IsOnStage 0
      var2 = 2
    else
      var2 = 0
    endif
  endif

GetNearestCliff var3
var4 *= -1
var4 = var4 - TopNY * -1
// before continuing, checks currently location and situation
// this prevents the AI from awkwardly running offstage
if !(Equal var2 0) && YSpeed < -1 && var4 < -20
  var18 = 0
  Call RecoveryHub
endif

if Equal var19 255 && var20 < 24640
elif YSpeed < 0.2 && YDistBackEdge < -1 && YDistBackEdge > -10 && var20 >= 24625 && var20 <= 24631 && YDistBackEdge > -6 && Equal IsOnStage 1
  var17 = var5 / 10
  AbsStick var17 (-1)
  Button R
endif

// now that the calculations using these are over with, we'll store them
// for the next frame
var7 = var5

// if we're not in jumpsquat, we want to dash to the location
if Equal var19 255 && var20 < 24640
elif var0 > var11 && Equal AirGroundState 1 && !(Equal CurrSubaction JumpSquat)
  var17 = var5
  AbsStick var17
  // to ensure we dash, we clear the stick if we're walking for whatever reason
  if Equal CurrAction 1 && LevelValue > 21
    ClearStick
  endif
else
  // otherwise...
  var17 = var5 / 10
  if XDistFrontEdge < 25 && Equal OPos Direction
    var17 /= 2
  elif XDistBackEdge > -25 && !(Equal OPos Direction)
    var17 /= 2
  endif
  AbsStick var17

  // adjusts the trajectory of the jump if the
  // target is moving
  if Equal CurrSubaction JumpSquat
    var17 = OXSpeed * 2
    if OXSpeed > 0.3
      ClearStick
      AbsStick var17 0
    elif OXSpeed < -0.3
      ClearStick
      AbsStick var17 0
    endif
  endif

  if var20 >= 24641 && var20 <= 24655
    Goto JumpIfInRange
  elif !(SamePlane)
    Goto JumpIfInRange
  endif
endif

// LOGSTR 1280265984 1346716672 1056964608 0 0
Seek BEGIN_MAIN
// if (OInAir) && !(Dashing) && !(OAttacking)
//   Jump
// endif
Return

label JumpIfInRange
  if MeteoChance && Equal IsOnStage 0 && YSpeed < 0.01 && var6 > 35 && var6 < 55
    Button X
  endif
  if var6 > 15 && var6 < 50 && Equal AirGroundState 1 && CurrAction <= 9
    Button X
  endif
  if var6 > 15 && var6 < 70 && Equal CurrSubaction JumpSquat
    Button X
  endif
  if var6 > 35 && var6 < 55 && Equal AirGroundState 2 && YDistBackEdge < -20 && CanJump && OTotalYSpeed <= 0.5
    Button X
  endif
Return

label XDistCheckPassed
if YDistFloor < 0.2 && var6 < 0 && !(SamePlane) && Equal AirGroundState 1
  ClearStick
  if CurrAction <= 5 && !(Equal CurrAction 3) || Equal CurrAction 17
    AbsStick 0 (-1)
  endif
  Return
endif

var17 = var12 + OHurtboxSize
if var1 <= var17
  var17 = var15
  var4 = 0
  var3 = YSpeed * -1
  Seek l_test
  Jump
  if !(True)
    label l_test
    var4 += var3
    var17 -= 1
    var3 += 0.13 // gravity
    if var3 > MaxFallSpeed
      var3 = MaxFallSpeed
    endif
    if var17 < 1
      Seek
    else
      Seek l_test
    endif
    Jump
  endif
  label
  var4 = (YDistFrontEdge * -1) - var4

  GetNearestCliff var2
  var3 = XSpeed * var15 + 3
  var3 += TopNX
  if var2 < 0
    if Equal IsOnStage 0 || Equal DistBackEdge DistFrontEdge
      var2 += var3
      if var2 >= 0
        var2 = 1
      endif
    endif
  elif var2 > 0
    if Equal IsOnStage 0 || Equal DistBackEdge DistFrontEdge
      var2 += var3
      if var2 <= 0
        var2 = -1
      endif
    endif
  endif
  if !(Equal var2 1) || !(Equal var2 -1)
    if Equal DistBackEdge DistFrontEdge || Equal IsOnStage 0
      var2 = 2
    else
      var2 = 0
    endif
  endif


  if var20 >= 24641 && var20 <= 24655
    if Equal AirGroundState 1 && !(Equal CurrSubaction JumpSquat) && CurrAction <= 9
      if var9 >= 3 && !(Equal Direction OPos)
        Stick -0.5
        Return
      endif
      Button X
    elif CanJump && !(Equal var2 0) && var4 < -70
      // DrawDebugRectOutline TopNX TopNY 5 5 255 255 0 170
      var19 = 0
      Call AIHub
    elif !CanJump && !(Equal var2 0) && var4 < -36
      // DrawDebugRectOutline TopNX TopNY 5 5 255 0 255 170
      var19 = 0
      Call AIHub
    else
      // LOGSTR 1634758656 1147761408 1946157056 0 0
      Seek CallAttacks
      Jump
    endif
  elif Equal AirGroundState 1
    // otherwise we just straight-up go to the attack performing section if
    // we're in range
    Seek CallAttacks
    Jump
  endif
endif
Return

label CallAttacks
label

// if the action requires us to be stopped,
if var20 >= 24625 && var20 <= 24631
  if Equal CurrAction 3
    // stops the dash
    Button X
    Return
  endif
  if Equal CurrAction 4
    // interrupts run with crouch for one frame
    Stick 0 (-1)
    Return
  endif
  if var9 >= 3 && !(Equal Direction OPos)
    Stick -0.5
    Return
  endif
  if Equal CurrAction 10 || Equal CurrAction 22
    Return
  endif
  if InAir && YDistBackEdge > -10 && YDistBackEdge <= 0
    if LevelValue <= 60
      if Rnd < 0.4
        Button R
        AbsStick var5 (-1)
      endif
    else
      Button R
      AbsStick var5 (-1)
    endif
    Return
  elif !(Equal AirGroundState 1)
    Call AIHub
  endif
  if !(CurrAction <= 9)
    Return
  endif
endif

// sets var18 to 1 so we know to actually perform the move instead
// of loading the move data and getting within the move's range -- we
// just did that in this script!
var18 = 1
if Equal var20 24625
  Call Jab123
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
endif
Return
Return
