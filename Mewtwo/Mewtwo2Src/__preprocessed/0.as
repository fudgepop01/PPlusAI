#include <Definition_AIMain.h>
//TrueID=0x0
id 0x8000

//Set Unknown
unk 0x00000

label begin

  if Equal CurrAction 288
    Button X
    Call ChrSpecific1 // mewtwo hover handler
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
if FramesHitstun > 0 && CurrAction >= 67 && CurrAction <= 69
  //...pick a random direction for the control stick
  var0 = Rnd - 1
  var1 = Rnd - 1
  var2 = 1
  var3 = Rnd * 5 + 15
  // label to make this loop each frame...
  label
  if Equal IsOnStage 0 || Damage > 80
    // if offstage with high damage, switch to survival DI
    var0 = TopNX * -1
    AbsStick var0 1
  else
    AbsStick var0 var1
  endif
  // until hitstun is 0
  if Equal FramesHitstun 0
  if Equal AirGroundState 1
    if Equal LevelValue 100
      var18 = 1
      Call DTilt
    else
      Stick -1
    endif
  elif Rnd < 0.5
    var18 = 0
    if Rnd < 0.4 && CanJump
      Button X
      Stick 0 (-1)
      Call NAir
    else
      Call NAir
    endif      
  endif
    Seek begin
    Return
  endif
  if LevelValue >= 60
    Goto _checkMeteorCancel
  endif
  if LevelValue >= 21
    Goto _checkTech
  endif
  Return
endif

if FramesHitstun > 0 && Equal CurrAction 67 && LevelValue >= 75
  Stick 0 (-1)
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
  GetNearestCliff var0
  var17 = 15
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

if Equal CurrAction 24
  Seek _main
  Return
endif

// where RecoveryHub (4.as) is called
if Equal var0 2 && Equal AirGroundState 2
  var18 = 0
  Call RecoveryHub
endif

if Equal var0 0 && YDistBackEdge > -15 && Equal CurrAction 51 && LevelValue >= 60
  if CanJump && Rnd < 0.5 && LevelValue >= 75
    Button X
    Return
  else
    {L_CANCEL}
  endif
endif

if MeteoChance && !(Equal var0 2)
  var18 = 0
  Call EdgeguardHub
endif

// if we're going to go over an edge of a stage while performing a move,
// we hold the control stick in the opposite direction

label
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
if Equal HitboxConnected 1 && !(Equal var19 256) && LevelValue >= 42
  if Equal CurrAction 24
    Seek _main
    Return
  endif
  Call ComboHub
elif OFramesHitstun > 0 && LevelValue >= 42
  Call ComboHub
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

// GetIsTeammateCloser var6
// if Equal var6 1
//   if XDistLE 60 && XDistFrontEdge > 10 && XDistBackEdge < -10
//     var17 = OPos * -1
//     if Equal Direction var17 && XDistFrontEdge > 10
//       Stick 1
//     elif !(Equal Direction var17) && XDistBackEdge < -10
//       Stick -1
//     endif
//   endif
//   if !(XDistLE 100)
//     if Equal Direction OPos && XDistFrontEdge > 10
//       Stick 1
//     elif !(Equal Direction OPos) && XDistBackEdge < -10
//       Stick -1
//     endif
//   endif
//   Seek _main
//   Return
// endif

var19 = 0
var18 = 0
var16 = -1

if OYSpeed < 0 && OYDistBackEdge > -5 && Equal OCurrAction 73
  SetTimeout 300
  var0 = Rnd * 75 + 75
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
  // because we don't want to set the var0 again if we revisit
  // this, we place a label here to jump to
  label callers
  if var0 >= 1
    if var0 < 2
      Call Jab123
    elif var0 < 3
      Call FTilt
    elif var0 < 4
      Call UTilt
    elif var0 < 5
      Call DTilt
    elif var0 < 6
      Call FSmash
    elif var0 < 7
      Call USmash
    elif var0 < 8
      Call DSmash
    elif var0 < 9
      Call NSpecial
    elif var0 < 10
      Call SSpecial
    elif var0 < 11
      Call DSpecial
    elif var0 < 12
      Call Grab
    elif var0 < 13
      Call NAir
    elif var0 < 14
      Call FAir
    elif var0 < 15
      Call BAir
    elif var0 < 16
      Call UAir
    elif var0 < 17
      Call DAir
    elif var0 < 18
      Call NSpecialAir
    elif var0 < 19
      Call SSpecialAir
    elif var0 < 20
      Call USpecialAir
    elif var0 < 21
      Call DSpecialAir
    endif
  elif YDistBackEdge > -40
    if OCurrAction >= 85 && OCurrAction <= 93
      Call FSmash
    endif

    RetrieveATKD var0 OCurrSubaction 1

    var7 = 255
    SAFE_INJECT_1 var7

    if LevelValue >= 48 && Equal var6 0 && Equal var7 0 && !(SamePlane) && TopNY < OTopNY && Equal OAirGroundState 1
  var17 = OTopNY - TopNY
  if var17 < 30 && Rnd < 0.3
    Call UTilt
  else
    var16 = 255
    Call UAir
  endif
    endif 

    if LevelValue >= 60 && Equal var6 0 && var7 <= 1
      if var1 < OAnimFrame || Equal OCurrAction 37
        if OAttacking && Rnd < 0.8 && !(Equal var21 32776) && !(Equal ODirection OPos)
          var18 = 1
          Call FakeOutHub
        endif
      elif OAttacking && var1 > OAnimFrame && !(Equal var0 -1) && Rnd < 0.5 && Equal AirGroundState 1 && LevelValue >= 75 && !(Equal OCurrAction 27)
  if Rnd < 0.8
    Call Grab
  else
    var16 = 255
    Call FAir
  endif
      elif Rnd < 0.05 && !(Equal var21 32776)
        Call FakeOutHub
      elif Equal var7 1
        Call FakeOutHub
      endif
    endif

    var21 = -1

    var3 = Damage - ODamage
    var3 /= 200

    if LevelValue >= 42 && Equal var6 0 && var7 <= 2

      var2 = var3 * 0.2

      var0 = TopNX
      var1 = OTopNX
      Abs var0
      Abs var1
      if XDistLE 40 && Rnd < 0.15 && Equal AirGroundState 1 && var1 < var0
        if Rnd < var2 || Rnd < 0.1
          var16 = 2
        endif
        Call NeutralHub
      elif Equal var7 2
        Call NeutralHub
      endif
    endif

    if LevelValue >= 60 && Equal var6 0 && var7 <= 2
      var2 = var3 * 0.1
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
    Call NAir
  endif
      endif
    endif
    var16 = 1

    // if the opponent is lying there doing nothing
    if LevelValue >= 48 && Equal var6 0
      if Equal OCurrAction 74 || Equal OCurrAction 77
  if Equal AirGroundState 1 && Rnd < 0.3
    Call DTilt
  elif Equal AirGroundState 1 && Rnd < 0.3
    Call DSmash
  else
    var16 = 255
    var19 = 1
    Call NAir
  endif
      endif
    endif

    if LevelValue >= 42 && Equal OAirGroundState 3
      Call EdgeguardHub
    endif

  if !(XDistLE 40) && LevelValue >= 60 && Rnd < 0.3
    var16 = 255
    Call NAir
  endif
  if !(ODistLE 25) && Rnd < 0.3
    Call NSpecial
  endif

    if Equal OCurrAction 37 && !(Equal ODirection Direction)
      Seek callers
      Jump
    endif

    if LevelValue >= 21
  if OYDistBackEdge > -15
    var0 = Rnd * 105
    if var0 >= 100
      if var0 < 101
        Call DTilt
      elif var0 < 102
        Call FSmash
      elif var0 < 103
        var16 = 255
        var19 = 1
        Call NAir
      elif var0 < 104
        Call Grab
      else
        var0 = Rnd * 11 + 2
        Seek callers
        Jump
      endif
    else
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
elif OIsCharOf Mario
  var2 = 100
  var1 = 0.095
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
      var2 /= 100
      var2 *= ODamage
      if var2 >= 80
        if var0 < 20
          Call Grab
        elif var0 < 45 && !(XDistLE 20)
          Call NSpecial
        elif var0 < 60
          Call DTilt
        elif var0 < 85
          var16 = 255
          if !(ODistLE 40) && ODistLE 70 && Rnd < 0.5
            var16 = 0
          endif
          Call FAir
        else
          var16 = 255
          var19 = 1
          if !(ODistLE 40) && ODistLE 70 && Rnd < 0.5
            var16 = 0
            var19 = 0
          endif
          Call NAir
        endif
      elif var2 >= 50
        if var0 < 20
          Call Grab
        elif var0 < 30
          Call FTilt
        elif var0 < 50
          Call DTilt
        elif var0 < 65 && !(XDistLE 20)
          Call NSpecial
        elif var0 < 80
          var16 = 255
          if !(ODistLE 40) && ODistLE 70
            var16 = 0
          endif
          Call NAir
        else
          Call UTilt
        endif
      elif True
        if var0 < 30
          Call Grab
        elif var0 < 45 && !(XDistLE 20)
          Call NSpecial
        elif var0 < 75
          Call DTilt
        elif var0 < 90 && !(ODistLE 40) && ODistLE 70
          Call NAir              
        else
          var16 = 255
          Call NAir
        endif
      endif
      // LOGSTR 1852796416 1694498816 0 0 0
    endif
  endif
  if OYDistBackEdge <= -15
    var17 = TopNY - OTopNY
    Abs var17
    if TopNY < OTopNY && var17 < 30
      Call UTilt
    else
      var17 = TopNX - OTopNX
      Abs var17
      if var17 > 20
        if Equal Direction OPos
          Call FAir
        else
          Call BAir
        endif
      endif
      var16 = 255
      Call NAir
    endif
  endif
      var0 = Rnd * 5 + 12
      Seek callers
      Jump
    else
      var0 = Rnd * 17
      Seek callers
    endif
  elif True
  if Rnd < 0.4
    Call NAir
  elif Rnd < 0.2
    Call DAir
  elif Rnd < 0.3
    Call FAir
  elif Rnd < 0.3
    Call BAir
  else
    Call NAir
  endif
  endif
endif
Return
Return