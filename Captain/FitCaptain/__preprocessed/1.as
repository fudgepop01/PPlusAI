// APPROACH HUB
// controls which approach to use when pursuing a target location
#include <Definition_AIMain.h>
id 0x8001

unk 0x0

SetTimeout 400

  var12 = var12 + OHurtboxSize
  var0 = (100 - LevelValue) / 3
  var9 = var9 + (Rnd * var0 * 2) - (var0)
  var10 = var10 + (Rnd * var0 * 2) - (var0)
  var0 = (100 - LevelValue) / 5
  var11 = var11 + (Rnd * var0)
  var12 = var12 + (Rnd * var0)
  var0 = (100 - LevelValue) / 15
  var13 = var13 + (Rnd * var0) - (var0 / 2)
  var0 = (100 - LevelValue) / 25
  var14 = var14 + (Rnd * var0)

// this is used to detect when the target x position has passed through falcon, such as when changing direction or something

var7 = 65535

label
// these work together to only dashdance if not in a tech-chase situation
  if Equal OCurrAction 78 || Equal OCurrAction 80 || Equal OCurrAction 82 || Equal OCurrAction 96 || Equal OCurrAction 97
elif Equal var21 36608
else
  var0 = (120 - LevelValue) / 100
  var0 = (Rnd * 10) - 10 * var0
  var1 = (Rnd * 15) + 3
  label _dashdance
  if Equal AirGroundState 1 && var0 > 0 && Equal OFramesHitstun 0 && DistFrontEdge > 7 && !(ODistLE 4)
    if NumFrames >= var1 && Equal CurrAction 3
      SetFrame 0
      var0 = var0 - 1
      Stick (-1)
      var1 = (Rnd * 15) + 3
    else
      Stick 1
      if !(CurrAction < 1) && !(Equal CurrAction 7)
        ClearStick
      endif
    endif
  endif
  label _dashdanceEnd
endif

label

var21 = 32769

// literally an edge case
if Equal OAirGroundState 3 && TopNY > OTopNY && !(Equal var19 255)
  Call EdgeguardHub
endif

// nothing else uses it YET so I GUESS IT WORKS FOR NOW......



// clacs distance to the target
  // DrawDebugPoint TopNX TopNY 255 0 0 85
  var5 = TopNX + (var9 * Direction)
  var6 = TopNY - var10
  // DrawDebugPoint var5 var6 255 0 255 255
  // var6
  var6 = OHurtboxSize
  var5 = HurtboxSize
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
  var17 = var13
  var6 = 0
  var3 = OTotalYSpeed
  Goto _oCalc
  if !(True)
    label _oCalc
    var6 += var3
    var17 -= 1
    var3 += var4 // gravity
    if var3 > OMaxFallSpeed
      var3 = OMaxFallSpeed
    endif
    if var17 < 1
      Return
    endif
    Goto _oCalc
  endif
    var17 = var6 * -1
    if OYDistBackEdge < var17 && Equal OIsOnStage 1
      var6 = OYDistBackEdge * -1
    endif
  endif
  if InAir
  var17 = var13
  var5 = 0
  var3 = TotalYSpeed
  Goto _sCalc
  if !(True)
    label _sCalc
    var5 += var3
    var17 -= 1
    var3 += 0.13 // gravity
    if var3 > MaxFallSpeed
      var3 = MaxFallSpeed
    endif
    if var17 < 1
      Return
    endif
    Goto _sCalc
  endif
    var17 = var5 * -1
    if YDistBackEdge < var17 && Equal IsOnStage 1
      var5 = YDistBackEdge * -1
    endif
  endif
  var6 = OTopNY + var10 + (OHurtboxSize) + (var6 - var5)
  if TopNY > OTopNY
    var6 *= -1
  endif
  // var5
  if Equal CurrAction 7
    var5 = OTopNX + (var9 * Direction)
  else
    var5 = OTopNX + (var9 * Direction * -1)
  endif
  var5 = var5 + (OXSpeed * var13) - (XSpeed * var13)
  // if Equal PlayerNum 0
  //   DrawDebugRectOutline var5 var6 var11 var12 255 0 0 85
  // elif Equal PlayerNum 1
  //   DrawDebugRectOutline var5 var6 var11 var12 0 0 255 85
  // elif Equal PlayerNum 2
  //   DrawDebugRectOutline var5 var6 var11 var12 255 255 0 85
  // elif Equal PlayerNum 3
  //   DrawDebugRectOutline var5 var6 var11 var12 0 255 0 85
  // else
  //   DrawDebugRectOutline var5 var6 var11 var12 0 0 0 85
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
  // this "var17" is only "defined" locally within this scope

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
  var17 = var5 + (XSpeed * var13)
  Abs var17
  if Equal AirGroundState 1 && CurrAction <= 9
    if var17 <= var11 && var20 >= 24641 && var20 <= 24655 && var6 >= 0
      Button X
    elif var2 <= var11 && var20 >= 24641 && var20 <= 24655 && var6 >= 0
      Button X
    elif Rnd <= 0.02 && var20 >= 24625 && var20 <= 24639 && XDistLE 20 40 && Equal OFramesHitstun 0 && var6 >= 0
      // randomly perform tomhawk stuff if using a grounded move and not comboing
      Call mix_tomhawkJump
    elif Rnd <= 0.02 && Equal var20 32776 && var6 >= 0
      Call mix_tomhawkJump
    endif
  elif CanJump && Rnd <= 0.02 && var20 >= 24641 && var20 <= 24655 && Equal IsOnStage 1 && TopNY > OTopNY
    // randomly double-jump aerial instead of going straight for the aerial
    Call mix_doubleJump
  elif CanJump && Rnd <= 0.01 && Equal var20 32776 && TopNY > OTopNY
    Call mix_doubleJump
  endif

  if var0 <= var11
    Goto XDistCheckPassed
    var17 = TopNY - OTopNY
    Abs var17
    if XDistLE 35 && var17 <= 40 && OAttacking && Equal AirGroundState 1
      Call Unk3020
    endif
  elif var2 <= var11
    Goto XDistCheckPassed
  endif
endif

  GetNearestCliffR var2
  var3 = XSpeed * 4
  var3 += TopNX
  if Equal IsOnStage 1 && var2 < 0
    var2 += var3
    if var2 >= 0
      var2 = 1
    endif
  elif Equal IsOnStage 1 && var2 > 0
    var2 += var3
    if var2 <= 0
      var2 = -1
    endif
  endif
  if !(Equal var2 1) || !(Equal var2 -1)
    if Equal IsOnStage 0
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
  Call RecoveryHub
elif MeteoChance && !(Equal var19 255) && Equal IsOnStage 1
  Call BlockRecovery
endif


if YSpeed < 0.2 && YDistBackEdge < -1 && YDistBackEdge > -10 && var20 >= 24625 && var20 <= 24631 && var17 < 6 && !(Equal var17 -1)
  var17 = var5 / 10
  AbsStick var17 (-1)
  Button R
endif

// now that the calculations using these are over with, we'll store them
// for the next frame
var7 = var5

// if we're not in jumpsquat, we want to dash to the location
if var0 > var11 && Equal AirGroundState 1 && !(Equal CurrSubaction JumpSquat)
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

// if we're landing or something, we call upon the landing routine (59.as)
// if YSpeed < 0 && YDistFloor < 10 && YDistFloor > -1
//   var19 = 2
//   var18 = 1
//   Call Landing
// endif
Return

label JumpIfInRange
  if MeteoChance && var6 > 10 && var6 < 45 && Equal IsOnStage 0 && YSpeed < 0.01
    Button X
  endif
  if var6 > 15 && Equal AirGroundState 1 && CurrAction <= 9
    Button X
  endif
  if var6 > 26 && Equal CurrSubaction JumpSquat
    Button X
  endif
  if var6 > 35 && var6 < 55 && Equal AirGroundState 2 && YDistBackEdge > 20 && CanJump
    Button X
  endif
Return

label XDistCheckPassed
if var1 <= var12
  var17 = var14
  var4 = 0
  var3 = TotalYSpeed
  Goto l_test
  if !(True)
    label l_test
    var4 += var3
    var17 -= 1
    var3 += 0.13 // gravity
    if var3 > MaxFallSpeed
      var3 = MaxFallSpeed
    endif
    if var17 < 1
      Return
    endif
    Goto l_test
  endif
  var4 = (YDistFrontEdge * -1) - var4

  GetNearestCliffR var2
  var3 = XSpeed * var14
  var3 += TopNX
  if Equal IsOnStage 1 && var2 < 0
    var2 += var3
    if var2 >= 0
      var2 = 1
    endif
  elif Equal IsOnStage 1 && var2 > 0
    var2 += var3
    if var2 <= 0
      var2 = -1
    endif
  endif
  if !(Equal var2 1) || !(Equal var2 -1)
    if Equal IsOnStage 0
      var2 = 2
    else
      var2 = 0
    endif
  endif


  if var20 >= 24641 && var20 <= 24655
    if CanJump && !(Equal var2 0) && var4 < -80
      // DrawDebugRectOutline TopNX TopNY 5 25 255 255 0 136
    elif !(Equal var2 0) && var4 < -52
      // DrawDebugRectOutline TopNX TopNY 5 25 255 0 255 136
    else
      Goto CallAttacks
    endif
  elif Equal AirGroundState 1
    // otherwise we just straight-up go to the attack performing section if
    // we're in range
    Goto CallAttacks
  endif
endif
Return

label CallAttacks

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
  if !(Equal Direction OPos)
    var17 = OPos * 0.5
    AbsStick var17
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
