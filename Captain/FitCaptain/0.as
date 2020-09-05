// var21 is the previous routine (set manually)
// var20 is the previous attack routine (set manually)

#include <Definition_AIMain.h>
//TrueID=0x0
id 0x8000

//Set Unknown
unk 0x0

//Strings

LOGSTR str("Hub")

//______________________________________
// Rand DI / tech "smart" implementation
// randomly DIs unless conditions are met for survival DI
#let StickX = var0
#let StickY = var1

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
if CurrAction >= hex(0x45) && CurrAction <= hex(0x4D) && FramesSinceShield > 40
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
  movePart = 0
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
if OFramesHitstun > 0 && !(Equal noCombo noComboVal)
  Call ComboHub
endif

// EnableDebugOverlay
// SetDebugOverlayColor 0 0 0 200
ClearStick
movePart = 0

IS_EARLY_ROLL

#let moveSelection = var0
if Equal isEarlyRoll 0
  // CUSTOM_INJECT is a value that is adjustable on the fly
  // when debugging AI. Remove this or set it to 0 when it's time
  // to actually put the AI into production
  moveSelection = CUSTOM_INJECT

  // because we don't want to set the moveSelection again if we revisit
  // this, we place a label here to jump to
  label callers
  if !(Equal moveSelection 0)
    if moveSelection < 2
      Call Jab123
    elif moveSelection < 3
      Call FTilt
    elif moveSelection < 4
      Call UTilt
    elif moveSelection < 5
      Call DTilt
    elif moveSelection < 6
      Call FSmash
    elif moveSelection < 7
      Call USmash
    elif moveSelection < 8
      Call DSmash
    elif moveSelection < 9
      Call NSpecial
    elif moveSelection < 10
      Call SSpecial
    elif moveSelection < 11
      Call DSpecial
    elif moveSelection < 12
      Call Grab
    elif moveSelection < 13
      Call NAir
    elif moveSelection < 14
      Call FAir
    elif moveSelection < 15
      Call BAir
    elif moveSelection < 16
      Call UAir
    elif moveSelection < 17
      Call DAir
    elif moveSelection < 18
      Call NSpecialAir
    elif moveSelection < 19
      Call SSpecialAir
    elif moveSelection < 20
      Call USpecialAir
    elif moveSelection < 21
      Call DSpecialAir
    endif
  else
    // this part is effectively falcon's whole entire neutral game.
    // if the opponent is close to the ground...
    if OYDistFloor < 15 && Equal OIsOnStage 1
      moveSelection = Rnd * 160
      // LOGSTR str("moveSel")
      // LOGVAL moveSelection
      // these moves are pretty much always relevant
      if moveSelection >= 100
        if moveSelection < 110
          Call FAir
        elif moveSelection < 125
          Call DAir
        elif moveSelection < 140
          Call NAir
        elif moveSelection < 150
          Call Grab
        else
          moveSelection = Rnd * 11 + 2
          Goto callers
        endif
      else
        if ODamage >= 90
          // LOGSTR str(">= 90")
          if moveSelection < 20
            Call Grab
          elif moveSelection < 60
            Call FAir
          elif moveSelection < 65
            Call Jab123
          elif moveSelection < 80
            Call FSmash
          elif moveSelection < 95
            Call USmash
          else
            Call DAir
          endif
        elif ODamage >= 50
          // LOGSTR str(">= 50")
          if moveSelection < 30
            Call Grab
          else
            Call FTilt
          endif
        else
          // LOGSTR str("< 50")
          if moveSelection < 50
            // LOGSTR str("callGrb")
            Call Grab
          else
            // LOGSTR str("callDair")
            Call DAir
          endif
          // LOGSTR str("notExec")
        endif
        // LOGSTR str("none")
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
      LOGSTR str("randAerial")
      moveSelection = Rnd * 5 + 12
      Goto callers
    endif
  endif
endif
Return
Return