#include <Definition_AIMain.h>
//TrueID=0x0
id 0x8000
unk 0x0

label begin

SetAutoDefend 0
SetDisabledMd -1



// if CurrAction >= 66 && CurrAction <= 68 || Equal CurrAction 69 && YDistBackEdge < -7 && !(OutOfStage)
//   Call OnGotDamaged
// endif

// if Equal var17 1111573504
//   Call OnGotDamaged
// endif

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

if Equal var16 10
  Seek _reroll
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

if FramesHitstun > 1
  Call OnGotDamaged
endif

var7 = 0
if CurrAction >= 67 && CurrAction <= 69 && LevelValue >= 75
  var7 = 1
endif

Seek _main
Jump
Return

// the stuff here happens when not in hitstun.
label _main
var6 = 0

// for efficiency, we just use a label here so we don't need to call the
// stuff above every frame we're in here
label
Cmd30
  var17 = 15
  var1 = XSpeed * var17
  GetYDistFloorOffset var0 var1 5 0
  // var22 = TopNY - var0 
  // DrawDebugLine TopNX TopNY TopNX var22 255 0 0 221
  if var0 < 4 && !(Equal var0 -1) 
    var0 = 0
  elif Equal DistBackEdge DistFrontEdge
    var0 = 2
  elif Equal var0 -1
    if var1 < 0
      var0 = 1
    elif var1 > 0
      var0 = -1
    endif
  else
    var0 = 0
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
  elif OCurrAction >= 66 && OCurrAction <= 82 && LevelValue >= 60
    Call ComboHub
  endif
endif

ClearStick
if Equal CurrAction 4 || Equal CurrAction 3
  Stick 1
endif
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

if OYSpeed < 0 && OYDistBackEdge > -5 && Equal OCurrAction 73 || OCurrAction >= 77 && OCurrAction <= 95
  SetTimeout 300
  var0 = Rnd * 40 + 15
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

  GetNearestCliff var0
  var0 = TopNX - var0
  var0 *= -1
  var1 *= -1
  var1 = var1 - (TopNY * -1)
    Abs var0

    var1 = TopNX
    Abs var1
    var2 = OTopNX
    Abs var2
    if var0 < 25 && XDistLE 40 && var2 < var1 && Equal OFramesHitstun 0 && !(Equal var21 32777) && LevelValue >= 48 && SamePlane && !(XDistLE 20)
      Call EdgeEscapeHub
    endif

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

    var4 = OEndFrame - OAnimFrame 
    var4 += var0
    if LevelValue >= 60 && Equal var6 0 && var7 <= 1
      if Equal var7 1
        Call FakeOutHub
      elif OAttacking && var0 < OAnimFrame && var4 >= 8 && !(Equal var0 -1) && LevelValue >= 75 && !(Equal OCurrAction 27) && XDistLE 40
  var0 = 10
  label whiffPunish
var17 = Rnd * 21
if var17 < 1  && YDistBackEdge > -3 
Goto jab123
elif 1 < var17 && var17 < 2 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto ftilt
elif 2 < var17 && var17 < 3 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto utilt
elif 3 < var17 && var17 < 4 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto dtilt
elif 4 < var17 && var17 < 5 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto fsmash
elif 5 < var17 && var17 < 6 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto usmash
elif 6 < var17 && var17 < 7 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto sspecial
elif 7 < var17 && var17 < 8 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto grab
elif 8 < var17 && var17 < 9 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 2
Goto grab
Goto fthrow
elif 9 < var17 && var17 < 10 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 3
Goto grab
Goto dthrow
elif 10 < var17 && var17 < 11 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 4
Goto grab
Goto bthrow
elif 11 < var17 && var17 < 12 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 5
Goto grab
Goto uthrow
elif 12 < var17 && var17 < 13  && OYDistBackEdge < -5
Goto nair
elif 13 < var17 && var17 < 14  && OYDistBackEdge < -5
var19 = 1
Goto nair
Goto app_nair
elif 14 < var17 && var17 < 15  && OYDistBackEdge < -5
var19 = 2
Goto nair
Goto nairhit2
elif 15 < var17 && var17 < 16  
Goto fair
elif 16 < var17 && var17 < 17  
var19 = 1
Goto fair
Goto fair_weak
elif 17 < var17 && var17 < 18  
Goto bair
elif 18 < var17 && var17 < 19  && OYDistBackEdge < -5
Goto uair
elif 19 < var17 && var17 < 20  && OYDistBackEdge < -5
var19 = 1
Goto uair
Goto uair_tipman
elif 20 < var17 && var17 < 21  
Goto dair
endif
  if var13 < var4 && var20 >= 24625 && var20 <= 24649
    LOGSTR 1347767808 1230194688 1229866752 542590976 1229342208
    if Equal OAirGroundState 2
      if var20 >= 24641 && var20 <= 24649
        Seek callMove
        Jump
      endif
    else 
      Seek callMove
      Jump
    endif
  endif
  if var0 <= 0
    Seek
  else
    Seek whiffPunish
  endif
  var0 -= 1
  Jump
  label
      elif var1 < OAnimFrame || Equal OCurrAction 37 || var4 < 8
        if OAttacking && Rnd < 0.8 && !(Equal var21 32776) && XDistLE var3
          var18 = 1
          Call FakeOutHub
        endif
      elif OAttacking && OCurrActionFreq >= 3 
        Call FakeOutHub
      elif Rnd < 0.1 && !(Equal var21 32776) 
        Call FakeOutHub
      endif
    endif

    var21 = 32768

    var3 = 200 - (ODamage - Damage) * 4
    var3 /= 200

    predictOOption var17 6 LevelValue
    predictionConfidence var22 6 LevelValue
    if Equal var17 1
      var17 = 0.5 + var22 * 1.1
      var3 *= var17
    endif 

    predictOOption var17 7 LevelValue
    predictionConfidence var22 7 LevelValue
    if Equal var17 1
      var17 = 0.5 + var22 * 1.1
      var3 *= var17
    endif 

    Norm var22 TopNX TopNY
    Norm var17 OTopNX OTopNY
    if LevelValue >= 42 && Equal var6 0 && var7 <= 2

      var2 = var3 * 0.20
      predictAverage var22 3 LevelValue

      if XDistLE var22 && Rnd < 0.4 && Equal AirGroundState 1
        if Rnd < var2 || Rnd < 0.04
          var16 = 2
        endif
        Call NeutralHub
      elif Equal var7 2
        Call NeutralHub
      endif
    endif

    if LevelValue >= 60 && Equal var6 0 && var7 <= 2
      if var22 < var17
        var2 = var3 * 0.23
      else
        var2 = var3 * 0.10
      endif
      Abs var2
      if Rnd < var2
        Call FakeOutHub
      endif
    endif

    if Equal var6 0 && var22 < var17 && var7 <= 3
      var2 = var3 * 0.28
      if Rnd < var3 || Rnd <= 0.2 || Equal var7 3
        var16 = 2
  if OYDistBackEdge < -20
    Call UAir
  endif
  if Rnd < 0.8 && !(Equal Direction OPos)
    Call BAir
  elif Rnd < 0.3
    var19 = 2
    Call NAir
  elif Rnd < 0.3
    Call FTilt
  elif Rnd < 0.3
    Call DTilt
  else
    Call FSmash
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

    var2 = OWeight

    var2 = var2 - 200
    var2 *= -1
    var2 /= 100
    var2 *= ODamage

    if LevelValue >= 21
  if OYDistBackEdge > -45
  if Rnd <= 0.05
    Call Grab
  endif
  
  var3 = 10
  Norm var22 TopNX TopNY
  Norm var17 OTopNX OTopNY
  var22 -= var17
  Abs var22
  if var22 < 40 && !(XDistLE 30)
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
  var3 = 5
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
  var3 = 5
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
if var17 < 1  
Call FAir
elif 1 < var17 && var17 < 2  
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
Goto approachTypes
var17 = Rnd * 16
if var17 < 1  && YDistBackEdge > -3 
Goto jab123
elif 1 < var17 && var17 < 2 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto dtilt
elif 2 < var17 && var17 < 3 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto grab
elif 3 < var17 && var17 < 4 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 2
Goto grab
Goto fthrow
elif 4 < var17 && var17 < 5 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 3
Goto grab
Goto dthrow
elif 5 < var17 && var17 < 6 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 4
Goto grab
Goto bthrow
elif 6 < var17 && var17 < 7 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 5
Goto grab
Goto uthrow
elif 7 < var17 && var17 < 8  && OYDistBackEdge < -5
Goto nair
elif 8 < var17 && var17 < 9  && OYDistBackEdge < -5
var19 = 1
Goto nair
Goto app_nair
elif 9 < var17 && var17 < 10  && OYDistBackEdge < -5
var19 = 2
Goto nair
Goto nairhit2
elif 10 < var17 && var17 < 11  
Goto fair
elif 11 < var17 && var17 < 12  
var19 = 1
Goto fair
Goto fair_weak
elif 12 < var17 && var17 < 13  
Goto bair
elif 13 < var17 && var17 < 14  && OYDistBackEdge < -5
Goto uair
elif 14 < var17 && var17 < 15  && OYDistBackEdge < -5
var19 = 1
Goto uair
Goto uair_tipman
elif 15 < var17 && var17 < 16  
Goto dair
endif
  Goto KBCheck
  if !(True)
    label KBCheck
    if var15 < 45
      var2 = 0
      Return
    endif
    COS var22 var8
    var22 *= var15
    Abs var22
    var17 = 0
    var23 = 90
    if var22 < var17 || var23 < var22
      var2 = 0
      Return
    endif
    SIN var22 var8
    var22 *= var15
    var17 = 0
    var23 = 90
    if var22 < var17 || var23 < var22
      var2 = 0
      Return
    endif
    var2 = 1
    Return
  endif
if Equal var2 0
  Return
endif
Goto approachType_filter
Return

label killMoves
Goto approachTypes
// $filterMoveEndlag(20)
var17 = Rnd * 18
if var17 < 1  && YDistBackEdge > -3 
Goto jab123
elif 1 < var17 && var17 < 2 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto ftilt
elif 2 < var17 && var17 < 3 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto dtilt
elif 3 < var17 && var17 < 4 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto fsmash
elif 4 < var17 && var17 < 5 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto grab
elif 5 < var17 && var17 < 6 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 2
Goto grab
Goto fthrow
elif 6 < var17 && var17 < 7 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 3
Goto grab
Goto dthrow
elif 7 < var17 && var17 < 8 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 4
Goto grab
Goto bthrow
elif 8 < var17 && var17 < 9 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 5
Goto grab
Goto uthrow
elif 9 < var17 && var17 < 10  && OYDistBackEdge < -5
Goto nair
elif 10 < var17 && var17 < 11  && OYDistBackEdge < -5
var19 = 1
Goto nair
Goto app_nair
elif 11 < var17 && var17 < 12  && OYDistBackEdge < -5
var19 = 2
Goto nair
Goto nairhit2
elif 12 < var17 && var17 < 13  
Goto fair
elif 13 < var17 && var17 < 14  
var19 = 1
Goto fair
Goto fair_weak
elif 14 < var17 && var17 < 15  
Goto bair
elif 15 < var17 && var17 < 16  && OYDistBackEdge < -5
Goto uair
elif 16 < var17 && var17 < 17  && OYDistBackEdge < -5
var19 = 1
Goto uair
Goto uair_tipman
elif 17 < var17 && var17 < 18  
Goto dair
endif
  Goto KCheck
  if !(True)
    label KCheck
    COS var22 var8
    var22 *= var15
    var22 *= Direction
    var22 *= 1.2
    var17 = RBoundary - (0)
    if var22 > var17
      var2 = 1
      Return
    endif
    var17 = LBoundary - (0)
    if var22 < var17
      var2 = 1
      Return
    endif
    var17 = TBoundary - (0)
    SIN var22 var8
    var22 *= var15
    var22 *= 1.2
    if var22 > var17
      var2 = 1
      Return
    endif
    var2 = 0
    Return
  endif
if Equal var2 0
  Return
endif
Goto approachType_filter
Return

label neutralMoves
Goto approachTypes
var17 = Rnd * 12
if var17 < 1  && YDistBackEdge > -3 
Goto jab123
elif 1 < var17 && var17 < 2 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto grab
elif 2 < var17 && var17 < 3 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 2
Goto grab
Goto fthrow
elif 3 < var17 && var17 < 4 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 3
Goto grab
Goto dthrow
elif 4 < var17 && var17 < 5 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 4
Goto grab
Goto bthrow
elif 5 < var17 && var17 < 6 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 5
Goto grab
Goto uthrow
elif 6 < var17 && var17 < 7  && OYDistBackEdge < -5
Goto nair
elif 7 < var17 && var17 < 8  && OYDistBackEdge < -5
var19 = 1
Goto nair
Goto app_nair
elif 8 < var17 && var17 < 9  && OYDistBackEdge < -5
var19 = 2
Goto nair
Goto nairhit2
elif 9 < var17 && var17 < 10  
Goto fair
elif 10 < var17 && var17 < 11  
var19 = 1
Goto fair
Goto fair_weak
elif 11 < var17 && var17 < 12  
Goto dair
endif
Goto approachType_filter
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
if var17 < 1  && YDistBackEdge > -3 
Call Jab123
elif 1 < var17 && var17 < 2 && YDistBackEdge > -10 && YDistBackEdge > -10 
Call FTilt
elif 2 < var17 && var17 < 3 && YDistBackEdge > -10 && YDistBackEdge > -10 
Call UTilt
elif 3 < var17 && var17 < 4 && YDistBackEdge > -10 && YDistBackEdge > -10 
Call DTilt
elif 4 < var17 && var17 < 5 && YDistBackEdge > -10 && YDistBackEdge > -10 
Call FSmash
elif 5 < var17 && var17 < 6 && YDistBackEdge > -10 && YDistBackEdge > -10 
Call USmash
elif 6 < var17 && var17 < 7 && YDistBackEdge > -10 && YDistBackEdge > -10 
Call SSpecial
elif 7 < var17 && var17 < 8 && YDistBackEdge > -10 && YDistBackEdge > -10 
Call Grab
elif 8 < var17 && var17 < 9 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 2
Call Grab
elif 9 < var17 && var17 < 10 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 3
Call Grab
elif 10 < var17 && var17 < 11 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 4
Call Grab
elif 11 < var17 && var17 < 12 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 5
Call Grab
elif 12 < var17 && var17 < 13  && OYDistBackEdge < -5
Call NAir
elif 13 < var17 && var17 < 14  && OYDistBackEdge < -5
var19 = 1
Call NAir
elif 14 < var17 && var17 < 15  && OYDistBackEdge < -5
var19 = 2
Call NAir
elif 15 < var17 && var17 < 16  
Call FAir
elif 16 < var17 && var17 < 17  
var19 = 1
Call FAir
elif 17 < var17 && var17 < 18  && OYDistBackEdge < -5
Call UAir
elif 18 < var17 && var17 < 19  && OYDistBackEdge < -5
var19 = 1
Call UAir
elif 19 < var17 && var17 < 20  
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
if var17 < 1  
Call BAir
elif 1 < var17 && var17 < 2  && OYDistBackEdge < -5
var19 = 1
Call UAir
elif 2 < var17 && var17 < 3  
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

label jab123
LOGSTR 1784766976 825373440 0 0 0
var20 = 24625
var9 = 1
var10 = -9
var11 = 8
var12 = 2
var13 = 3
var14 = 5
CalcKnockback var15 ODamage 8 20 100 OWeight 0
var8 = 55
Goto __ANGLE_FIX__
Return
label ftilt
LOGSTR 1718905088 1819541504 0 0 0
var20 = 24626
var9 = 1
var10 = -9
var11 = 8.5
var12 = 3.7
var13 = 9
var14 = 11
CalcKnockback var15 ODamage 11 10 100 OWeight 0
var8 = 361
Goto __ANGLE_FIX__
Return
label utilt
LOGSTR 1970563328 1819541504 0 0 0
var20 = 24627
var9 = 1
var10 = 3.5
var11 = 7
var12 = 15
var13 = 17
var14 = 22
CalcKnockback var15 ODamage 13 50 80 OWeight 0
var8 = 361
Goto __ANGLE_FIX__
Return
label dtilt
LOGSTR 1685350656 1819541504 0 0 0
var20 = 24628
var9 = 1
var10 = 0
var11 = 10
var12 = 4
var13 = 10
var14 = 15
CalcKnockback var15 ODamage 12 25 75 OWeight 0
var8 = 70
Goto __ANGLE_FIX__
Return
label fsmash
LOGSTR 1718840576 1634953216 0 0 0
var20 = 24629
var9 = 1
var10 = -7
var11 = 11
var12 = 3
var13 = 19
var14 = 21
CalcKnockback var15 ODamage 20 24 100 OWeight 0
var8 = 361
Goto __ANGLE_FIX__
Return
label usmash
LOGSTR 1970498816 1634953216 0 0 0
var20 = 24630
var9 = -1
var10 = -3
var11 = 4.3
var12 = 13
var13 = 22
var14 = 29
CalcKnockback var15 ODamage 13 30 126 OWeight 0
var8 = 90
Goto __ANGLE_FIX__
Return
label sspecial
LOGSTR 1936945152 1701013760 1634467840 0 0
var20 = 24633
var9 = 3
var10 = 0
var11 = 5
var12 = 5
var13 = 1
var14 = 26 // just a dummy
CalcKnockback var15 ODamage 7 78 80 OWeight 0
var8 = 90
Goto __ANGLE_FIX__
Return
label grab
LOGSTR 1735549184 1644167168 0 0 0
var20 = 24636
var9 = -0.75
var10 = -6
var11 = 5.5
var12 = 4
var13 = 7
var14 = 8
CalcKnockback var15 ODamage 0 0 0 OWeight 0
var8 = 0
Goto __ANGLE_FIX__
Return
label fthrow
LOGSTR 1718904832 1919907584 0 0 0
CalcKnockback var15 ODamage 4 45 105 OWeight 0
var8 = 45
Goto __ANGLE_FIX__
Return
label dthrow
LOGSTR 1685350400 1919907584 0 0 0
CalcKnockback var15 ODamage 7 75 34 OWeight 0
var8 = 65
Goto __ANGLE_FIX__
Return
label bthrow
LOGSTR 1651795968 1919907584 0 0 0
CalcKnockback var15 ODamage 4 30 130 OWeight 0
var8 = 135
Goto __ANGLE_FIX__
Return
label uthrow
LOGSTR 1970563072 1919907584 0 0 0
CalcKnockback var15 ODamage 3 70 105 OWeight 0
var8 = 85
Goto __ANGLE_FIX__
Return
label nair
LOGSTR 1851877632 1912602624 0 0 0
var20 = 24641
var9 = -3.2
var10 = -3
var11 = 10
var12 = 5
var13 = 7
var14 = 12
CalcKnockback var15 ODamage 5 40 100 OWeight 1
var8 = 78
Goto __ANGLE_FIX__
Return
label app_nair
LOGSTR 1634758656 1601069312 1769078784 0 0
var10 = -3
var11 = 10
CalcKnockback var15 ODamage 7 40 100 OWeight 1
var8 = 361
Goto __ANGLE_FIX__
Return
label nairhit2
LOGSTR 1851877632 1917348096 1949433856 0 0
CalcKnockback var15 ODamage 7 40 100 OWeight 0
var8 = 361
Goto __ANGLE_FIX__
Return
label fair
LOGSTR 1717659904 1912602624 0 0 0
var20 = 24642
var9 = 1
var10 = -1.450
var11 = 5.3
var12 = 5
var13 = 14
var14 = 16
CalcKnockback var15 ODamage 18 24 100 OWeight 0
var8 = 32
Goto __ANGLE_FIX__
Return
label fair_weak
LOGSTR 1717659904 1918859008 1700883200 0 0
var13 = 17
var14 = 30
CalcKnockback var15 ODamage 6 35 80 OWeight 0
var8 = 361
Goto __ANGLE_FIX__
Return
label bair
LOGSTR 1650551040 1912602624 0 0 0
var20 = 24643
var9 = -16
var10 = -1.450
var11 = 7.3
var12 = 6
var13 = 10
var14 = 17
CalcKnockback var15 ODamage 14 20 100 OWeight 0
var8 = 361
Goto __ANGLE_FIX__
Return
label uair
LOGSTR 1969318144 1912602624 0 0 0
var20 = 24644
var9 = -3
var10 = -3.4
var11 = 9.6
var12 = 11
var13 = 6
var14 = 10
CalcKnockback var15 ODamage 13 10 100 OWeight 0
var8 = 361
Goto __ANGLE_FIX__
Return
label uair_tipman
LOGSTR 1969318144 1918858240 1768975616 1634598912 0
var9 = -8
var10 = -3
var11 = 8
var12 = 8
var13 = 11
var14 = 13
CalcKnockback var15 ODamage 12 8 80 OWeight 0
var8 = 150
Goto __ANGLE_FIX__
Return
label dair
LOGSTR 1684105472 1912602624 0 0 0
var20 = 24645
var9 = -4
var10 = 10
var11 = 5
var12 = 12
var13 = 16
var14 = 20
CalcKnockback var15 ODamage 16 40 100 OWeight 0
var8 = 270
Goto __ANGLE_FIX__
Return
label __ANGLE_FIX__
if var8 > 180 && Equal OAirGroundState 1
  if Equal var8 361
    if var15 < 32
      var8 = 0
    else
      var8 = 44
    endif
  else
    var8 = 180 - var8
  endif
elif Equal var8 361
  var8 = 45
endif
Return

label callMove
LOGSTR 1277182208 1953169408 0 0 0
LOGVAL var20

if Equal CurrAction 24
  Return
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

label approachTypes
var17 = TopNY - OTopNY
Abs var17
if ODistLE 8 && var17 < 20 && Equal AirGroundState 1
  var16 = 9
endif
predictOOption var17 7 LevelValue
predictionConfidence var22 7 LevelValue
if Equal 7 1 && Rnd < var22
  var16 = 4
elif Rnd < 0.2
  var16 = 4
endif
Norm var22 TopNX TopNY
Norm var17 OTopNX OTopNY
if Rnd < 0.1 && var22 < var17
  var16 = 2
elif Rnd < 0.4 && var22 < var17
  var16 = 12
elif Rnd < 0.1
  var16 = 12
endif
if var22 < var17 && Rnd < 0.5
  var16 = 13
endif
var22 -= var17
Abs var22
if var22 < 30 && Rnd < 0.7 && LevelValue >= 60 && !(XDistLE 35)
  var16 = 13
endif
Return

label approachType_filter
if Equal var16 13
  if Equal var20 24636
    Return
  elif var20 < 24641 && Rnd < 0.4
  elif var20 >= 24641
  else
    Return
  endif
elif Equal var16 12 && Equal var20 24636
  Return
endif
Seek callMove
Jump
Return
Return
