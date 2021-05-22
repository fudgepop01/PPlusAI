#include <Definition_AIMain.h>
//TrueID=0x0
id 0x8000
unk 0x0

label begin



if Equal var18 255 || Equal var18 255
  var18 = 0
endif

if Equal CurrAction 276 || Equal CurrAction 16
  Call RecoveryHub
endif

if LevelValue <= 48
  if Rnd < 0.2
    Return
  endif
endif

if CurrAction >= 26 && CurrAction <= 29
  Call OOSHub
endif

if Equal var16 9
  Seek _reroll
  Jump
endif

if Equal CurrAction 73 || Equal var17 1111573504
  Seek Hitstun_End
  Jump
endif

if Equal LevelValue 100
  if CurrAction >= 30 && CurrAction <= 32
    Stick 0 (-1)
    Return
  elif CurrAction >= 78 && CurrAction <= 83
    Stick 0 (-1)
    Return
  elif CurrAction >= 96 && CurrAction <= 97
    Stick 0 (-1)
    Return
  endif
endif

//______________________________________
// Rand DI / tech "smart" implementation
// randomly DIs unless conditions are met for survival DI

// if in hitstun...
if FramesHitstun > 0 || FramesHitlag > 0
  label hitstunHandler
  var21 = 32768
  if LevelValue >= 60
    var0 = Rnd * 2 * OPos * -1
    if KBAngle > 90 && KBAngle < 170
      var0 *= -1
    endif  
    if Rnd < 0.2
      var0 *= -1
    endif
  else
    var0 = (Rnd * 2) - 1
  endif
  var1 = Rnd - 1
  if Rnd < 0.2
    var1 *= -1
  endif
  var2 = 1
  var3 = Rnd * 5 + 15
  var5 = 0
  // makes it loop from here each frame
  label
  Cmd30

  if FramesHitlag > 0 && Equal LevelValue 100 
    if Rnd < 0.75
      var17 = OPos * -1
      if XDistBackEdge > -10
        var17 = OPos
      endif
      var22 = Rnd * 2 - 1
      AbsStick var17 var22
    endif
    Return
  endif
endif

if FramesHitstun > 1 && CurrAction >= 68 && CurrAction <= 69 && Equal AirGroundState 2 
  LOGSTR 1751741440 1936982016 0 0 0
  LOGVAL KBAngle
  if KBAngle >= 80 && KBAngle <= 100
    LOGSTR 1668247040 1680932864 0 0 0
    var17 = OPos * -1
    if KBAngle > 90
      var17 *= -1
    endif
    if Rnd < 0.2
      var17 *= -1
    endif
    AbsStick var17 (-1)
  elif Equal IsOnStage 0 || KBSpeed > 4
    LOGSTR 1668247040 1680998400 0 0 0
    // if offstage with high damage, switch to survival DI
    var0 = TopNX * -1
    AbsStick var0 1
  else
    LOGSTR 1668247040 1681063936 0 0 0
    AbsStick var0 var1
  endif
  if Equal LevelValue 75 && YDistBackEdge > -5 && Equal IsOnStage 1
    ClearStick
    AbsStick var0 (-1)
  endif
  // until hitstun is 0
  if LevelValue >= 60
    Goto _checkMeteorCancel
  endif
  if LevelValue >= 21
    Goto _checkTech
  endif
  Return
endif

if FramesHitstun > 1 && CurrAction >= 67 && CurrAction <= 69 && LevelValue >= 75
  var17 = OPos * -1
  if XDistBackEdge > -10
    var17 = OPos
  endif
  Stick var17 (-1)
  Return
endif

if FramesHitstun > 0 && CurrAction <= 16
  Seek
  Jump
elif FramesHitstun > 0 && var5 > 3 && LevelValue >= 42
  label
  var0 = Damage / 100
  var0 *= 0.75
  if Rnd < var0
    var18 = 1
    Call FakeOutHub
  endif
  
  if Equal AirGroundState 1
    Stick -1
  elif Rnd < 0.2 && CanJump
    Button X
    var18 = 0
    Call DAir
  else
    Seek Hitstun_End
    Return
  endif
  Seek
  Jump
elif Equal FramesHitstun 1 && LevelValue >= 42
  label
  GetNearestCliff var0
  var17 = 15
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
  if !(Equal var0 0)
    Seek begin
    Return
  endif

  var0 = Damage / 100
  var0 *= 0.75
  if Rnd < var0
    Call FakeOutHub
  endif

  if Equal AirGroundState 1
    Stick -1
  elif Rnd < 0.2 && CanJump
    Button X
    var18 = 0
    Call DAir
  else
    Seek Hitstun_End
    Return
  endif
  Seek begin
  Return
endif

if CurrAction >= 17 && CurrAction <= 23
  var5 += 1
endif

if FramesHitstun > 0 || FramesHitlag > 0
  Return
endif
Seek _main
Jump
Return

// Goto statements will return back to where they came
// from if there isn't a label, making this possible
//
// makes the AI input R every 41 frames 80% (base) of the time
label _checkTech
if var2 <= 0
  if CurrAction >= 69 && CurrAction <= 77 && FramesSinceShield > 40
    var4 = (100 - LevelValue) / 100 * -1
    var4 += 0.8
    if Equal IsOnStage 0 && Equal CurrAction 69 && FramesHitlag <= 1
      if Rnd < var4
        Button R
      endif
      var2 = 41
    elif Equal IsOnStage 1 && YDistBackEdge > -7 && YSpeed < 0
      if Rnd < var4
        Button R
      endif
      var2 = 41
    endif
  endif
endif
var2 -= 1
Return

// meteor cancels when applicable 90% (base) of the time with
// a jump 50% of the time (if possible), otherwise with upB
label _checkMeteorCancel
if KBAngle >= 260 && KBAngle <= 280 && var3 <= 0 && Equal IsOnStage 0 && YDistFrontEdge > 0
  var4 = (100 - LevelValue) / 100
  var4 = 0.9 - var4
  if Rnd < 0.9
    if CanJump && Rnd < 0.5
      Button X
    elif CanJump && YDistFrontEdge > 40
      Button X
    else
      Stick 0 0.7
      Button B
      Call RecoveryHub
    endif
  endif
  var3 = 41
endif
var3 -= 1
Return

// the stuff here happens when not in hitstun.
label _main
var6 = 0

// for efficiency, we just use a label here so we don't need to call the
// stuff above every frame we're in here
label
Cmd30
  GetNearestCliff var0
  var17 = 15
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

if Equal CurrAction 24 && !(Equal HitboxConnected 1)
  Seek _main
  Return
endif

// where RecoveryHub (4.as) is called
if Equal var0 2 && !(Equal AirGroundState 1)
  var18 = 0
  Call RecoveryHub
endif

if !(True)
  label Hitstun_End
  if YDistBackEdge > -25 || LevelValue <= 42
    Seek _main
    Return
  endif
  label
  if !(Equal AirGroundState 1) && Rnd <= 0.95 && !(Equal XDistFrontEdge XDistBackEdge) && YDistBackEdge < -50
    GetRndPointOnStage var2
    if Rnd < 0.03 && CanJump
      Button X
    endif
    var2 = TopNX - var2
    AbsStick var2 // the stick X var
    if YDistBackEdge > -3 && Rnd < 0.4 && Equal CurrAction 73
      Button R
    endif
    Return
  endif
  Seek _main
  Return
endif

if Equal var0 0 && YDistBackEdge > -15 && Equal CurrAction 51 && LevelValue >= 60
  if CanJump && Rnd < 0.3 && LevelValue >= 75
    Button X
    Return
  elif True
    var18 = 1 // var2
    var19 = 2 // moveMode
    Call Landing
  endif
endif

if MeteoChance && !(Equal var0 2)
  var18 = 0
  Call EdgeguardHub
endif

// if we're going to go over an edge of a stage while performing a move,
// we hold the control stick in the opposite direction

label
if FramesHitstun > 1
  Seek hitstunHandler
  Jump
  Return
endif
if !(Equal var0 0)
  if InAir || Equal CurrAction 3
    var0 = XSpeed * -10
    AbsStick var0 0
    Return
  endif
elif InAir && YDistBackEdge > -5 && Equal IsOnStage 1
  if !(Idling) && !(Lying)
    Return
  endif
  var4 = OPos * -1
  AbsStick var4
  if Equal CurrAction 1
    ClearStick
  endif
  if Dashing || XDistFrontEdge < 20
    Seek _main
  endif
  Return
endif

// if we reach here then it's time to choose an attack to perform
// if the opponent is in hitstun and we want to combo, we'll go to the
// ComboHub (2.as)
if !(Equal var19 256)
  if Equal HitboxConnected 1 && LevelValue >= 42
    // if Equal CurrAction 24
    //   Seek _main
    //   Return
    // endif
    Call ComboHub
  elif OFramesHitstun > 0 && LevelValue >= 42
    Call ComboHub
  endif
endif

ClearStick
if Equal AirGroundState 1
  if XDistBackEdge > -15 && XDistFrontEdge > 20
    Stick 1
    Return
  elif XDistFrontEdge < 15 && XDistBackEdge < -20
    Stick -1
    Return
  endif
endif

GetIsTeammateCloser var6
if Equal var6 1
  if XDistLE 60 && XDistFrontEdge > 10 && XDistBackEdge < -10
    var17 = OPos * -1
    if Equal Direction var17 && XDistFrontEdge > 10
      Stick 1
    elif !(Equal Direction var17) && XDistBackEdge < -10
      Stick -1
    endif
  endif
  if !(XDistLE 100)
    if Equal Direction OPos && XDistFrontEdge > 10
      Stick 1
    elif !(Equal Direction OPos) && XDistBackEdge < -10
      Stick -1
    endif
  endif
  Seek _main
  Return
endif

var16 = 0
var19 = 0
var18 = 0
var16 = -1

if OYSpeed < 0 && OYDistBackEdge > -5 && Equal OCurrAction 73
  SetTimeout 300
  var0 = Rnd * 50 + 25
  var1 = 0
  if Damage < 80
    var2 = 20
  else
    var2 = 40
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
    Seek _afterTCS
    Jump
  elif Equal var1 1 && Equal var4 0
    Seek _afterTCS
    Jump
  elif var0 <= 0
    Seek _afterTCS
    Jump
  elif Equal OIsOnStage 0 && Equal OCurrAction 73
    Seek _afterTCS
    Jump
  elif OYDistBackEdge < -20 && Equal OFramesHitstun 0
    Seek _afterTCS
    Jump
  endif
  Return
endif

  var0 = 0
  var1 = OCurrAction
  if Equal var1 96 || Equal var1 81
    if OAnimFrame < 15
      var0 = 1
    endif
  endif
  if Equal var1 30 || Equal var1 31 || Equal var1 32 || Equal var1 78 || Equal var1 80 || Equal var1 82 || Equal var1 83 || Equal var1 97
    if OAnimFrame < 21
      var0 = 1
    endif
  endif

if Equal var0 0
  label _afterTCS


  var0 = 0
  SAFE_INJECT_0 var0
  SAFE_INJECT_1 var19
  // because we don't want to set the var0 again if we revisit
  // this, we place a label here to jump to
  label callers
  if var0 >= 1
    var21 = 32768
    if var0 < 2
      Call Jab123
    elif var0 < 3
      Call DashAttack
    elif var0 < 4
      Call FTilt
    elif var0 < 5
      Call UTilt
    elif var0 < 6
      Call DTilt
    elif var0 < 7
      Call FSmash
    elif var0 < 8
      Call USmash
    elif var0 < 9
      Call DSmash
    elif var0 < 10
      Call NSpecial
    elif var0 < 11
      Call SSpecial
    elif var0 < 12
      Call DSpecial
    elif var0 < 13
      Call Grab
    elif var0 < 14
      Call NAir
    elif var0 < 15
      Call FAir
    elif var0 < 16
      Call BAir
    elif var0 < 17
      Call UAir
    elif var0 < 18
      Call DAir
    elif var0 < 19
      Call NSpecialAir
    elif var0 < 20
      Call SSpecialAir
    elif var0 < 21
      Call USpecialAir
    elif var0 < 22
      Call DSpecialAir
    endif
  elif YDistBackEdge > -40

    if OCurrAction >= 26 && OCurrAction <= 28 && Rnd < 0.7 && XDistLE 25
      Call Grab
    endif

    if OCurrAction >= 85 && OCurrAction <= 93
//       {PUNISH_BROKEN_SHIELD}
    endif

    RetrieveATKD var0 OCurrSubaction 1

    var7 = 0
    SAFE_INJECT_1 var7
    if LevelValue >= 48 && Equal var6 0 && Equal var7 0 && !(SamePlane) && TopNY < OTopNY && Equal OAirGroundState 1
  Call UAir
    endif 

    if LevelValue >= 60 && Equal var6 0 && var7 <= 1
      if Equal var7 1
        Call FakeOutHub
      elif var1 < OAnimFrame || Equal OCurrAction 37
        if OAttacking && Rnd < 0.8 && !(Equal var21 32776) && XDistLE var3
          var18 = 1
          Call FakeOutHub
        endif
      elif OAttacking && var1 > OAnimFrame && !(Equal var0 -1) && Rnd < 0.5 && Equal AirGroundState 1 && LevelValue >= 75 && !(Equal OCurrAction 27)
  if Rnd < 0.8
    Call SSpecial
  else
    Call Grab
  endif
      elif Rnd < 0.1 && !(Equal var21 32776) 
        Call FakeOutHub
      endif
    endif

    var21 = 32768

    var3 = Damage - ODamage
    var3 /= 200

    if LevelValue >= 42 && Equal var6 0 && var7 <= 2

      var2 = var3 * 0.1

      if XDistLE 30 && Rnd < 0.4 && Equal AirGroundState 1
        if Rnd < var2 || Rnd < 0.04
          var16 = 2
        endif
        Call NeutralHub
      elif Equal var7 2
        Call NeutralHub
      endif
    endif

    if LevelValue >= 60 && Equal var6 0 && var7 <= 2
      var2 = var3 * 0.10
      Abs var2
      if Rnd < var2
        Call FakeOutHub
      endif
    endif

    if Equal var6 0 && var7 <= 3
      var2 = var3 * 0.1
      if Rnd < var3 || Rnd < 0.05 || Equal var7 3
        var16 = 2
  if OYDistBackEdge < -20
    Call UAir
  endif
  if Rnd < 0.8 && !(Equal Direction OPos)
    Call BAir
  else
    var19 = 2
    Call NAir
  endif
      endif
    endif
    var16 = 1 // default

    // if the opponent is lying there doing nothing
    if LevelValue >= 48 && Equal var6 0
      if Equal OCurrAction 74 || Equal OCurrAction 77
  if Equal AirGroundState 1 && Rnd < 0.3
    Call DTilt
  elif Equal AirGroundState 1 && Rnd < 0.3
    Call SSpecial
  else
    Call DAir
  endif
      endif
    endif

    if LevelValue >= 42 && Equal OAirGroundState 3
      Call EdgeguardHub
    endif

  if LevelValue >= 60 && Rnd < 0.2
    var16 = 4
    if XDistLE 10
      Call Jab123
    else
      Call NAir
    endif
  endif

    if Equal OCurrAction 37 && !(Equal ODirection Direction)
      Seek callers
      Jump
    endif

if OIsCharOf Bowser
  var2 = 113
  var1 = 0.13
elif OIsCharOf Falcon
  var2 = 104
  var1 = 0.13
elif OIsCharOf Lizardon // Charizard
  var2 = 106
  var1 = 0.105
elif OIsCharOf Diddy
  var2 = 85
  var1 = 0.12
elif OIsCharOf Donkey
  var2 = 109
  var1 = 0.1
elif OIsCharOf Falco
  var2 = 80
  var1 = 0.17
elif OIsCharOf Fox
  var2 = 75
  var1 = 0.23
  // 2.8
elif OIsCharOf Gamewatch
  var2 = 75
  var1 = 0.095
elif OIsCharOf Ganondorf
  var2 = 109
  var1 = 0.13
// GIGA BOWSER WOULD GO HERE
// elif OIsCharOf Bowser
//   var2 = 113
//   var1 = 0.13
elif OIsCharOf Nana || OIsCharOf Popo
  var2 = 88
  var1 = 0.1
elif OIsCharOf Ike
  var2 = 100
  var1 = 0.103
elif OIsCharOf Fushigisou // Ivysaur
  var2 = 85
  var1 = 0.075
elif OIsCharOf Purin // Jigglypuff
  var2 = 62
  var1 = 0.064
elif OIsCharOf DDD // King Dedede
  var2 = 107
  var1 = 0.095
elif OIsCharOf Kirby
  var2 = 74
  var1 = 0.08
elif OIsCharOf Knuckles
  var2 = 90
  var1 = 0.14
elif OIsCharOf Link
  var2 = 104
  var1 = 0.11
elif OIsCharOf Lucario
  var2 = 94
  var1 = 0.125
elif OIsCharOf Lucas
  var2 = 80
  var1 = 0.125
elif OIsCharOf Luigi
  var2 = 100
  var1 = 0.069 // nice
  // 1.6
elif OIsCharOf Mario
  var2 = 100
  var1 = 0.095 // 1.7
elif OIsCharOf Marth
  var2 = 87
  var1 = 0.085
elif OIsCharOf Metaknight
  var2 = 79
  var1 = 0.11
elif OIsCharOf Mewtwo
  var2 = 90
  var1 = 0.082
elif OIsCharOf Ness
  var2 = 94
  var1 = 0.09
elif OIsCharOf Pikmin // Olimar
  var2 = 90
  var1 = 0.09
elif OIsCharOf Peach
  var2 = 90
  var1 = 0.08
elif OIsCharOf Pikachu
  var2 = 80
  var1 = 0.11
elif OIsCharOf Pit
  var2 = 80
  var1 = 0.095
elif OIsCharOf Robot // ROB
  var2 = 104
  var1 = 0.09
elif OIsCharOf Roy
  var2 = 85
  var1 = 0.114
elif OIsCharOf Samus
  var2 = 110
  var1 = 0.66
elif OIsCharOf Shiek
  var2 = 90
  var1 = 0.12
elif OIsCharOf Snake
  var2 = 105
  var1 = 0.098
elif OIsCharOf Sonic
  var2 = 82
  var1 = 0.122
elif OIsCharOf Zenigame // Squirtle
  var2 = 85
  var1 = 0.126
elif OIsCharOf Toonlink
  var2 = 85
  var1 = 0.11
elif OIsCharOf Wario
  var2 = 102
  var1 = 0.112
// WARIO MAN GOES HERE
// elif OIsCharOf Bowser
//   var2 = 113
//   var1 = 0.13
elif OIsCharOf Wolf
  var2 = 85
  var1 = 0.16
elif OIsCharOf Yoshi
  var2 = 108
  var1 = 0.093
elif OIsCharOf Zelda
  var2 = 90
  var1 = 0.073
elif OIsCharOf ZSS // Zero Suit Samus
  var2 = 85
  var1 = 0.135
endif

    var2 = var2 - 200
    var2 *= -1
    var2 /= 100
    var2 *= ODamage

    if LevelValue >= 21
  if OYDistBackEdge > -45
  if Rnd < 0.2
    Call Grab
  endif
  if XDistLE 40 && Rnd < 0.35
    var3 = 3
    label _kill
    Goto killMoves
    var3 -= 1
    if var3 <= 0
      Seek
    else
      Seek _kill
    endif
    Jump
    label
    var3 = 3
    label _startCombo
    Goto comboStarters
    var3 -= 1
    if var3 <= 0
      Seek
    else
      Seek _startCombo
    endif
    Jump
    label
  endif
  var3 = 10
  label _neutralOption
  Goto neutralMoves
  var3 -= 1
  if var3 <= 0
    Seek
  else
    Seek _neutralOption
  endif
  Jump
  label
  endif
  if OYDistBackEdge <= -45
    var17 = TopNY - OTopNY
    Abs var17
    if TopNY < OTopNY && var17 < 30
      Call UAir
    else
      var17 = TopNX - OTopNX
      Abs var17
      if var17 > 20
        if Equal Direction OPos
          Call NAir
        else
          Call BAir
        endif
      endif
      Call DAir
    endif
  endif
      var0 = Rnd * 5 + 12
      Seek callers
      Jump
    else
      var0 = Rnd * 18
      Seek callers
    endif
  elif True
  var17 = TopNY - OTopNY
  var22 = TopNX - OTopNX
  if var17 > 20
    Call UAir
  elif var17 < -20
    Call DAir
  elif var22 > 20
var17 = Rnd * 2
if var17 < 1 && OYDistBackEdge > -10 
Call FAir
elif 1 < var17 && var17 < 2 && YDistBackEdge > -10 
Call DAir
endif
  elif var22 < -20
    Call BAir
  else
    Call DAir
  endif
  endif
endif
Return

label comboStarters

var17 = TopNY - OTopNY
Abs var17
if ODistLE 8 && var17 < 20 && Equal AirGroundState 1
  var16 = 8
endif
if True && 176 <= var2 && Rnd < 0.12 && OCurrAction <= 69
var19 = 3
Call Grab
endif
if True && 153 <= var2 && Rnd < 0.30
var19 = 1
Call FAir
endif
if True && 125 <= var2 && Rnd < 0.12 && OCurrAction <= 69
var19 = 2
Call Grab
endif
if True && 119 <= var2 && var2 <= 431 && Rnd < 0.12 && OCurrAction <= 69
var19 = 4
Call Grab
endif
if True && 115 <= var2 && var2 <= 332 && Rnd < 0.40
var19 = 1
Call UAir
endif
if True && 111 <= var2 && var2 <= 354 && Rnd < 0.30
Call Jab123
endif
if True && 102 <= var2 && var2 <= 333 && Rnd < 0.35
Call DTilt
endif
if True && 93 <= var2 && var2 <= 363 && Rnd < 0.30
var19 = 2
Call NAir
endif
if True && 83 <= var2 && Rnd < 0.12 && OCurrAction <= 69
var19 = 5
Call Grab
endif
if True && 78 <= var2 && var2 <= 240 && Rnd < 0.30
Call UAir
endif
if True && 63 <= var2 && var2 <= 214 && Rnd < 0.30
Call BAir
endif
if True && 42 <= var2 && var2 <= 163 && Rnd < 0.40
Call FAir
endif
if True && 5 <= var2 && var2 <= 172 && Rnd < 0.30
Call DAir
endif
Return

label killMoves
// $filterMoveEndlag(20)
if True && 550 <= var2 && Rnd < 0.12 && OCurrAction <= 69
var19 = 3
Call Grab
endif
if True && 332 <= var2 && Rnd < 0.30
var19 = 1
Call FAir
endif
if True && 306 <= var2 && Rnd < 0.12 && OCurrAction <= 69
var19 = 2
Call Grab
endif
if True && 300 <= var2 && Rnd < 0.12 && OCurrAction <= 69
var19 = 5
Call Grab
endif
if True && 266 <= var2 && Rnd < 0.12 && OCurrAction <= 69
var19 = 4
Call Grab
endif
if True && 226 <= var2 && Rnd < 0.30
Call Jab123
endif
if True && 220 <= var2 && Rnd < 0.30
var19 = 2
Call NAir
endif
if True && 217 <= var2 && var2 <= 473 && Rnd < 0.40
var19 = 1
Call UAir
endif
if True && 211 <= var2 && var2 <= 483 && Rnd < 0.35
Call DTilt
endif
if True && 181 <= var2 && var2 <= 400 && Rnd < 0.30
Call FTilt
endif
if True && 154 <= var2 && var2 <= 344 && Rnd < 0.30
Call UAir
endif
if True && 134 <= var2 && var2 <= 313 && Rnd < 0.30
Call BAir
endif
if True && 99 <= var2 && var2 <= 242 && Rnd < 0.40
Call FAir
endif
if True && 87 <= var2 && var2 <= 217 && Rnd < 0.30
Call FSmash
endif
if True && 69 <= var2 && var2 <= 259 && Rnd < 0.30
Call DAir
endif
Return

label neutralMoves
var16 = 4

var17 = TopNY - OTopNY
Abs var17
if ODistLE 8 && var17 < 20 && Equal AirGroundState 1
  var16 = 8
endif
var17 = Rnd * 12
if var17 < 1 && OYDistBackEdge > -10 
Call Jab123
elif 1 < var17 && var17 < 2 && YDistBackEdge > -10 
Call Grab
elif 2 < var17 && var17 < 3 && YDistBackEdge > -10 
var19 = 2
Call Grab
elif 3 < var17 && var17 < 4 && YDistBackEdge > -10 
var19 = 3
Call Grab
elif 4 < var17 && var17 < 5 && YDistBackEdge > -10 
var19 = 4
Call Grab
elif 5 < var17 && var17 < 6 && YDistBackEdge > -10 
var19 = 5
Call Grab
elif 6 < var17 && var17 < 7 && YDistBackEdge > -10 
Call NAir
elif 7 < var17 && var17 < 8 && YDistBackEdge > -10 
var19 = 1
Call NAir
elif 8 < var17 && var17 < 9 && YDistBackEdge > -10 
var19 = 2
Call NAir
elif 9 < var17 && var17 < 10 && YDistBackEdge > -10 
Call FAir
elif 10 < var17 && var17 < 11 && YDistBackEdge > -10 
var19 = 1
Call FAir
elif 11 < var17 && var17 < 12 && YDistBackEdge > -10 
Call DAir
endif
Return

label _reroll

if Rnd <= 0.25
  Seek _main 
  Jump
  Return
endif

var0 = 5
if Equal Direction OPos
  label rrFront


var17 = Rnd * 20
if var17 < 1 && OYDistBackEdge > -10 
Call Jab123
elif 1 < var17 && var17 < 2 && YDistBackEdge > -10 
Call FTilt
elif 2 < var17 && var17 < 3 && YDistBackEdge > -10 
Call UTilt
elif 3 < var17 && var17 < 4 && YDistBackEdge > -10 
Call DTilt
elif 4 < var17 && var17 < 5 && YDistBackEdge > -10 
Call FSmash
elif 5 < var17 && var17 < 6 && YDistBackEdge > -10 
Call USmash
elif 6 < var17 && var17 < 7 && YDistBackEdge > -10 
Call SSpecial
elif 7 < var17 && var17 < 8 && YDistBackEdge > -10 
Call Grab
elif 8 < var17 && var17 < 9 && YDistBackEdge > -10 
var19 = 2
Call Grab
elif 9 < var17 && var17 < 10 && YDistBackEdge > -10 
var19 = 3
Call Grab
elif 10 < var17 && var17 < 11 && YDistBackEdge > -10 
var19 = 4
Call Grab
elif 11 < var17 && var17 < 12 && YDistBackEdge > -10 
var19 = 5
Call Grab
elif 12 < var17 && var17 < 13 && YDistBackEdge > -10 
Call NAir
elif 13 < var17 && var17 < 14 && YDistBackEdge > -10 
var19 = 1
Call NAir
elif 14 < var17 && var17 < 15 && YDistBackEdge > -10 
var19 = 2
Call NAir
elif 15 < var17 && var17 < 16 && YDistBackEdge > -10 
Call FAir
elif 16 < var17 && var17 < 17 && YDistBackEdge > -10 
var19 = 1
Call FAir
elif 17 < var17 && var17 < 18 && YDistBackEdge > -10 
Call UAir
elif 18 < var17 && var17 < 19 && YDistBackEdge > -10 
var19 = 1
Call UAir
elif 19 < var17 && var17 < 20 && YDistBackEdge > -10 
Call DAir
endif
  if var0 <= 0
    Seek _main
  else
    Seek rrFront
  endif
  var0 -= 1
  Jump
  Return
elif True
  label rrBack


var17 = Rnd * 3
if var17 < 1 && OYDistBackEdge > -10 
Call BAir
elif 1 < var17 && var17 < 2 && YDistBackEdge > -10 
var19 = 1
Call UAir
elif 2 < var17 && var17 < 3 && YDistBackEdge > -10 
Call DAir
endif
  if var0 <= 0
    Seek _main
  else
    Seek rrBack
  endif
  var0 -= 1
  Jump
  Return
endif
Return
Return
