// var21 is the previous routine (set manually)
// var20 is the previous attack routine (set manually)

#include <Definition_AIMain.h>
//TrueID=0x0
id 0x8000

//Set Unknown
unk 0x0

//Strings

LOGSTR 1215652352 0 0 0 0

//______________________________________
// Rand DI / tech "smart" implementation
// randomly DIs unless conditions are met for survival DI

// if in hitstun...
if FramesHitstun > 0
  //...pick a random direction for the control stick
  var0 = Rnd - 1
  var1 = Rnd - 1
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
    ClearStick
    Seek _main
  endif
  Goto _checkTech
  Return
endif
Goto _main
Return

// Goto statements will return back to where they came
// from if there isn't a label, making this possible
//
// makes the AI input R every 41 frames 90% of the time
label _checkTech
if CurrAction >= 69 && CurrAction <= 77 && FramesSinceShield > 40
  if Rnd >= 0.1
    Button R
  endif
endif
Return

// the stuff here happens when not in hitstun.
label _main
// for efficiency, we just use a label here so we don't need to call the
// stuff above every frame we're in here
label

// where RecoveryHub (4.as) is called
if Equal IsOnStage 0 && InAir
  Call RecoveryHub
endif

if MeteoChance
  var18 = 0
  Call BlockRecovery
endif

// if we're going to go off the edge of a stage while performing a move,
// we hold the control stick in the opposite direction
var0 = XSpeed * 15
GetYDistFloorOffset var0 var0 0
if Equal var0 -1
  if InAir
    Stick Direction 0
  endif
  Return
endif

// not currently used, so I commented this out
// GET_WEIGHT_TABLE

// if we reach here then it's time to choose an attack to perform
// if the opponent is in hitstun and we want to combo, we'll go to the
// ComboHub (2.as)
if OFramesHitstun > 0 && !(Equal var19 255)
  Call ComboHub
endif

// EnableDebugOverlay
// SetDebugOverlayColor 0 0 0 200
ClearStick
var18 = 0

  var5 = 0
  var6 = OCurrAction
  if Equal var6 96 || Equal var6 81
    if OAnimFrame < 15
      var5 = 1
    endif
  endif
  if Equal var6 30 || Equal var6 31 || Equal var6 32 || Equal var6 78 || Equal var6 80 || Equal var6 82 || Equal var6 83 || Equal var6 97
    if OAnimFrame < 21
      var5 = 1
    endif
  endif


if Equal var5 0
  // CUSTOM_INJECT is a value that is adjustable on the fly
  // when debugging AI. Remove this or set it to 0 when it's time
  // to actually put the AI into production
  var0 = CUSTOM_INJECT

  // because we don't want to set the var0 again if we revisit
  // this, we place a label here to jump to
  label callers
  if !(Equal var0 0)
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
  else
    // this part is effectively falcon's whole entire neutral game.
    // if the opponent is close to the ground...
    if OYDistFloor < 15 && Equal OIsOnStage 1
      var0 = Rnd * 160
      // LOGSTR 1836021248 1699964160 1811939328 0 0
      // LOGVAL var0
      // these moves are pretty much always relevant
      if var0 >= 100
        if var0 < 110
          Call FAir
        elif var0 < 125
          Call DAir
        elif var0 < 140
          Call NAir
        elif var0 < 150
          Call Grab
        else
          var0 = Rnd * 11 + 2
          Goto callers
        endif
      else
        if ODamage >= 90
          // LOGSTR 1044193280 959447040 0 0 0
          if var0 < 20
            Call Grab
          elif var0 < 60
            Call FAir
          elif var0 < 65
            Call Jab123
          elif var0 < 80
            Call FSmash
          elif var0 < 95
            Call USmash
          else
            Call DAir
          endif
        elif ODamage >= 50
          // LOGSTR 1044193280 892338176 0 0 0
          if var0 < 30
            Call Grab
          else
            Call FTilt
          endif
        else
          // LOGSTR 1008743680 805306368 0 0 0
          if var0 < 50
            // LOGSTR 1667329024 1816621568 1644167168 0 0
            Call Grab
          else
            // LOGSTR 1667329024 1816420608 1769078784 0 0
            Call DAir
          endif
          // LOGSTR 1852797952 1165518080 1660944384 0 0
        endif
        // LOGSTR 1852796416 1694498816 0 0 0
      endif
    elif OYDistFloor < 45 && Equal OIsOnStage 1
      if Rnd < 0.5 && ODamage > 50
        Call FAir
      else
        Call UAir
      endif
    else
      // if we're here, then the opponent is in the air at which point
      // we just perform a random aerial for the sake of having some variety lol
      LOGSTR 1918987776 1682007296 1919508736 1811939328 0
      var0 = Rnd * 5 + 12
      Goto callers
    endif
  endif
endif
Return
Return
