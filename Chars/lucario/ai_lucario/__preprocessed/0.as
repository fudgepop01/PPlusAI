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
  if !(Equal var19 256) && YDistBackEdge < -5 && Equal HitboxConnected 1 && LevelValue >= 42
    Call ComboHub
  elif CanJump && Rnd < 0.3 && LevelValue >= 75
    Button X
    Return
  else
    var18 = 1
    var19 = 2
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
    if OAnimFrame < 17
      var4 = 1
    endif
  endif
  if Equal var5 30 || Equal var5 31 || Equal var5 32 || Equal var5 78 || Equal var5 80 || Equal var5 82 || Equal var5 83 || Equal var5 97
    if OAnimFrame < 22
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
    if OAnimFrame < 17
      var0 = 1
    endif
  endif
  if Equal var1 30 || Equal var1 31 || Equal var1 32 || Equal var1 78 || Equal var1 80 || Equal var1 82 || Equal var1 83 || Equal var1 97
    if OAnimFrame < 22
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
      Call USpecial
    elif var0 < 12
      Call SSpecial
    elif var0 < 13
      Call DSpecial
    elif var0 < 14
      Call Grab
    elif var0 < 15
      Call NAir
    elif var0 < 16
      Call FAir
    elif var0 < 17
      Call BAir
    elif var0 < 18
      Call UAir
    elif var0 < 19
      Call DAir
    elif var0 < 20
      Call NSpecialAir
    elif var0 < 21
      Call SSpecialAir
    elif var0 < 22
      Call USpecialAir
    elif var0 < 23
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

    LOGSTR 1212502528 1159737600 0 0 0


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
    if Equal OCurrAction 51
      var17 = OTopNY + OYDistBackEdge
      EstOPassTimeY var17 var17
      var17 += 3
      if var17 < var4
        var4 = var17
      endif
    endif
    var4 -= 5

    LOGSTR 1212502528 1159737856 0 0 0

    var4 += var0
    if LevelValue >= 60 && Equal var6 0 && var7 <= 1
      if Equal var7 1
        Call FakeOutHub
      elif OAttacking && var0 < OAnimFrame && var4 >= 12 && !(Equal var0 -1) && LevelValue >= 75 && !(Equal OCurrAction 27) && XDistLE 40
  var0 = 10
  label whiffPunish
var17 = Rnd * 32
if var17 < 1  && YDistBackEdge > -3 
Goto jab123
elif 1 < var17 && var17 < 2 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto dashattack
elif 2 < var17 && var17 < 3 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto ftilt
elif 3 < var17 && var17 < 4 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto utilt
elif 4 < var17 && var17 < 5 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto dtilt
elif 5 < var17 && var17 < 6 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto fsmash
elif 6 < var17 && var17 < 7 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto usmash
elif 7 < var17 && var17 < 8 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 1
Goto usmash
Goto usmash_cancel
elif 8 < var17 && var17 < 9 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto dsmash
elif 9 < var17 && var17 < 10 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto nspecial
elif 10 < var17 && var17 < 11 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto nspecial
elif 11 < var17 && var17 < 12 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto nspecial
elif 12 < var17 && var17 < 13 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto sspecial
elif 13 < var17 && var17 < 14 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 1
Goto sspecial
Goto sspecial_power
elif 14 < var17 && var17 < 15 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 2
Goto sspecial
Goto sspecial_spike
elif 15 < var17 && var17 < 16 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto dspecial
elif 16 < var17 && var17 < 17 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 1
Goto dspecial
Goto dspecial_cancel
elif 17 < var17 && var17 < 18 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto grab
elif 18 < var17 && var17 < 19 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 1
Goto grab
Goto fthrow
elif 19 < var17 && var17 < 20 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 2
Goto grab
Goto dthrow
elif 20 < var17 && var17 < 21 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 3
Goto grab
Goto bthrow
elif 21 < var17 && var17 < 22 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 4
Goto grab
Goto uthrow
elif 22 < var17 && var17 < 23  
Goto nair
elif 23 < var17 && var17 < 24  
var19 = 1
Goto nair
Goto nair_mid
elif 24 < var17 && var17 < 25  
var19 = 2
Goto nair
Goto nair_weak
elif 25 < var17 && var17 < 26  
Goto fair
elif 26 < var17 && var17 < 27  
var19 = 1
Goto fair
Goto fair_scoop
elif 27 < var17 && var17 < 28  
Goto bair
elif 28 < var17 && var17 < 29  && OYDistBackEdge < -5
Goto uair
elif 29 < var17 && var17 < 30  && OYDistBackEdge < -5
var19 = 1
Goto uair
Goto uair_strong
elif 30 < var17 && var17 < 31  
Goto dair
elif 31 < var17 && var17 < 32  
var19 = 1
Goto dair
Goto dair_weak
endif
  if var13 < var4 && var20 >= 24625 && var20 <= 24649
    LOGSTR 1347767808 1230194688 1229866752 542590976 1229342208
    var16 = 7
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
      elif var1 < OAnimFrame || Equal OCurrAction 37 || var4 < 12
        if OAttacking && Rnd < 0.8 && !(Equal var21 32776) && XDistLE var3 && !(Equal var21 32775)
          var18 = 1
          Call FakeOutHub
        endif
      elif OAttacking && OCurrActionFreq >= 3 && !(Equal var21 32775)
        Call FakeOutHub
      elif Rnd < 0.1 && !(Equal var21 32776) && !(Equal var21 32775)
        Call FakeOutHub
      endif
    endif

    LOGSTR 1212502528 1159738112 0 0 0

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

    LOGSTR 1212502528 1159738368 0 0 0

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
    LOGSTR 1212502528 1159738624 0 0 0

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

    LOGSTR 1212502528 1159738880 0 0 0
    if Equal var6 0 && var22 < var17 && var7 <= 3
      var2 = var3 * 0.28
      if Rnd < var3 || Rnd <= 0.2 || Equal var7 3
        var16 = 2
  if Rnd < 0.65 && !(Equal Direction OPos)
    Call BAir
  elif Rnd < 0.3
    var20 = 25001
    Call DefendHub
  elif Rnd < 0.3
    Call FAir
  elif Rnd < 0.2
    Call DSmash
  elif Rnd < 0.2
    Call FSmash
  else
    Call DTilt
  endif
      endif
    endif
    var16 = 1 // default

    LOGSTR 1212502528 1159739136 0 0 0
    // if the opponent is lying there doing nothing
    if LevelValue >= 48 && Equal var6 0
      if Equal OCurrAction 74 || Equal OCurrAction 77
  if Equal AirGroundState 1 && Rnd < 0.3
    Call DTilt
  else
    Call DAir
  endif
      endif
    endif

    if LevelValue >= 42 && Equal OAirGroundState 3
      Call EdgeguardHub
    endif

  if !(XDistLE 20) && LevelValue >= 60 && Rnd < 0.35
    var16 = 4
    if Equal Direction OPos
      Call FAir
    else
      Call BAir
    endif
  endif
  if !(ODistLE 25) && Rnd < 0.6
    Call NSpecial
  endif

    LOGSTR 1212502528 1159739392 0 0 0
    if Equal OCurrAction 37 && !(Equal ODirection Direction)
      Seek callers
      Jump
    endif

    var2 = OWeight

    var2 = var2 - 200
    var2 *= -1
    var2 /= 100
    var2 *= ODamage
    LOGSTR 1212502528 1159739648 0 0 0

    if LevelValue >= 21
  if OYDistBackEdge > -20
  if Rnd <= 0.05
    Call Grab
  endif
  
  var3 = 10
  Norm var22 TopNX TopNY
  Norm var17 OTopNX OTopNY
  var22 -= var17
  Abs var22
  if var22 < 60 && !(XDistLE 20)
    label _neutralOption
    LOGSTR 1852142848 1953652992 1811939328 0 0
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
  endif
  if OYDistBackEdge <= -20
    var17 = TopNY - OTopNY
    Abs var17
    if TopNY < OTopNY && var17 < 30
      Call UAir
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
      if Rnd < 0.05
        Call SSpecial
      elif Rnd < 0.5
        Call UAir
      else
        Call UTilt
      endif
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
  Call DAir
  endif
endif
Return

label comboStarters
Goto approachTypes
var17 = Rnd * 10
if var17 < 1  && YDistBackEdge > -3 
Goto dashattack
elif 1 < var17 && var17 < 2 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto utilt
elif 2 < var17 && var17 < 3 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto dtilt
elif 3 < var17 && var17 < 4 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 1
Goto usmash
Goto usmash_cancel
elif 4 < var17 && var17 < 5 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto sspecial
elif 5 < var17 && var17 < 6 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 2
Goto sspecial
Goto sspecial_spike
elif 6 < var17 && var17 < 7  
Goto fair
elif 7 < var17 && var17 < 8  
var19 = 1
Goto fair
Goto fair_scoop
elif 8 < var17 && var17 < 9  
Goto dair
elif 9 < var17 && var17 < 10  
var19 = 1
Goto dair
Goto dair_weak
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
var17 = Rnd * 13
if var17 < 1  && YDistBackEdge > -3 
Goto fsmash
elif 1 < var17 && var17 < 2 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto usmash
elif 2 < var17 && var17 < 3 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 1
Goto usmash
Goto usmash_cancel
elif 3 < var17 && var17 < 4 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto dsmash
elif 4 < var17 && var17 < 5 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto sspecial
elif 5 < var17 && var17 < 6 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 1
Goto sspecial
Goto sspecial_power
elif 6 < var17 && var17 < 7 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 2
Goto sspecial
Goto sspecial_spike
elif 7 < var17 && var17 < 8  
Goto nair
elif 8 < var17 && var17 < 9  
var19 = 1
Goto nair
Goto nair_mid
elif 9 < var17 && var17 < 10  
var19 = 2
Goto nair
Goto nair_weak
elif 10 < var17 && var17 < 11  
Goto bair
elif 11 < var17 && var17 < 12  && OYDistBackEdge < -5
Goto uair
elif 12 < var17 && var17 < 13  && OYDistBackEdge < -5
var19 = 1
Goto uair
Goto uair_strong
endif
  Goto KCheck
  if !(True)
    label KCheck
    // LOGSTR 1262708736 1799643392 1952514048 0 0
    COS var22 var8
    var22 *= var15
    var22 *= Direction
    var22 *= 1.2
    var17 = RBoundary - (0)
    // LOGSTR 1380057088 0 0 0 0
    // LOGVAL var22
    // LOGVAL var17
    if var22 > var17
      var2 = 1
      Return
    endif
    var17 = LBoundary - (0)
    // LOGSTR 1279393792 0 0 0 0
    // LOGVAL var22
    // LOGVAL var17
    if var22 < var17
      var2 = 1
      Return
    endif
    var17 = TBoundary - (0)
    SIN var22 var8
    var22 *= var15
    var22 *= 0.7
    // LOGSTR 1413611520 0 0 0 0
    // LOGVAL var22
    // LOGVAL var17
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
if ODistLE 20
  var18 = 1
endif
var17 = Rnd * 3
if var17 < 1  && YDistBackEdge > -3 
Goto dashattack
elif 1 < var17 && var17 < 2 && YDistBackEdge > -10 && YDistBackEdge > -10 
Goto dtilt
elif 2 < var17 && var17 < 3  
Goto fair
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


var17 = Rnd * 26
if var17 < 1  && YDistBackEdge > -3 
Call Jab123
elif 1 < var17 && var17 < 2 && YDistBackEdge > -10 && YDistBackEdge > -10 
Call DashAttack
elif 2 < var17 && var17 < 3 && YDistBackEdge > -10 && YDistBackEdge > -10 
Call FTilt
elif 3 < var17 && var17 < 4 && YDistBackEdge > -10 && YDistBackEdge > -10 
Call UTilt
elif 4 < var17 && var17 < 5 && YDistBackEdge > -10 && YDistBackEdge > -10 
Call DTilt
elif 5 < var17 && var17 < 6 && YDistBackEdge > -10 && YDistBackEdge > -10 
Call FSmash
elif 6 < var17 && var17 < 7 && YDistBackEdge > -10 && YDistBackEdge > -10 
Call USmash
elif 7 < var17 && var17 < 8 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 1
Call USmash
elif 8 < var17 && var17 < 9 && YDistBackEdge > -10 && YDistBackEdge > -10 
Call DSmash
elif 9 < var17 && var17 < 10 && YDistBackEdge > -10 && YDistBackEdge > -10 
Call SSpecial
elif 10 < var17 && var17 < 11 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 1
Call SSpecial
elif 11 < var17 && var17 < 12 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 2
Call SSpecial
elif 12 < var17 && var17 < 13 && YDistBackEdge > -10 && YDistBackEdge > -10 
Call Grab
elif 13 < var17 && var17 < 14 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 1
Call Grab
elif 14 < var17 && var17 < 15 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 2
Call Grab
elif 15 < var17 && var17 < 16 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 3
Call Grab
elif 16 < var17 && var17 < 17 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 4
Call Grab
elif 17 < var17 && var17 < 18  
Call NAir
elif 18 < var17 && var17 < 19  
var19 = 1
Call NAir
elif 19 < var17 && var17 < 20  
var19 = 2
Call NAir
elif 20 < var17 && var17 < 21  
Call FAir
elif 21 < var17 && var17 < 22  
var19 = 1
Call FAir
elif 22 < var17 && var17 < 23  && OYDistBackEdge < -5
Call UAir
elif 23 < var17 && var17 < 24  && OYDistBackEdge < -5
var19 = 1
Call UAir
elif 24 < var17 && var17 < 25  
Call DAir
elif 25 < var17 && var17 < 26  
var19 = 1
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


var17 = Rnd * 10
if var17 < 1  && YDistBackEdge > -3 
Call UTilt
elif 1 < var17 && var17 < 2 && YDistBackEdge > -10 && YDistBackEdge > -10 
Call DSmash
elif 2 < var17 && var17 < 3  
Call NAir
elif 3 < var17 && var17 < 4  
var19 = 1
Call NAir
elif 4 < var17 && var17 < 5  
var19 = 2
Call NAir
elif 5 < var17 && var17 < 6  
Call BAir
elif 6 < var17 && var17 < 7  && OYDistBackEdge < -5
Call UAir
elif 7 < var17 && var17 < 8  && OYDistBackEdge < -5
var19 = 1
Call UAir
elif 8 < var17 && var17 < 9  
Call DAir
elif 9 < var17 && var17 < 10  
var19 = 1
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
var9 = 0
var10 = -4
var11 = 7.4
var12 = 3.85
var13 = 6
var14 = 7
CalcKnockback var15 ODamage 5 30 120 OWeight 0
var8 = 55
Goto __ANGLE_FIX__
Return
label dashattack
LOGSTR 1684108032 1751217152 1952539392 1795162112 0
var20 = 24638
var9 = -1
var10 = -4
var11 = 8.4
var12 = 3.85
var13 = 6
var14 = 15
CalcKnockback var15 ODamage 10 45 55 OWeight 0
var8 = 55
Goto __ANGLE_FIX__
Return
label ftilt
LOGSTR 1718905088 1819541504 0 0 0
var20 = 24626
var9 = 1
var10 = -5.650
var11 = 8.4
var12 = 3.850
var13 = 10
var14 = 0
CalcKnockback var15 ODamage 10 40 35 OWeight 0
var8 = 40
Goto __ANGLE_FIX__
Return
label utilt
LOGSTR 1970563328 1819541504 0 0 0
var20 = 24627
var9 = -12
var10 = 1
var11 = 12.4
var12 = 12.85
var13 = 5
var14 = 14
CalcKnockback var15 ODamage 8 35 90 OWeight 0
var8 = 85
Goto __ANGLE_FIX__
Return
label dtilt
LOGSTR 1685350656 1819541504 0 0 0
var20 = 24628
var9 = 1
var10 = 1
var11 = 8.55
var12 = 3.85
var13 = 5
var14 = 8
CalcKnockback var15 ODamage 6 35 100 OWeight 0
var8 = 80
Goto __ANGLE_FIX__
Return
label fsmash
LOGSTR 1718840576 1634953216 0 0 0
var20 = 24629
var9 = 6
var10 = -2
var11 = 10.55
var12 = 6
var13 = 20
var14 = 24
CalcKnockback var15 ODamage 14 20 100 OWeight 0
var8 = 361
Goto __ANGLE_FIX__
Return
label usmash
LOGSTR 1970498816 1634953216 0 0 0
var20 = 24630
var9 = 1
var10 = 0
var11 = 4.55
var12 = 19.6
var13 = 11
var14 = 24
CalcKnockback var15 ODamage 6 45 175 OWeight 0
var8 = 83
Goto __ANGLE_FIX__
Return
label usmash_cancel
LOGSTR 1970498816 1634953216 1600348416 1852007680 1811939328
CalcKnockback var15 ODamage 4 48 100 OWeight 0
var8 = 90
Goto __ANGLE_FIX__
Return
label dsmash
LOGSTR 1685286144 1634953216 0 0 0
var20 = 24631
var9 = -17
var10 = -1
var11 = 16
var12 = 4.6
var13 = 13
var14 = 18
CalcKnockback var15 ODamage 14 25 100 OWeight 0
var8 = 361
Goto __ANGLE_FIX__
Return
label nspecial
LOGSTR 1853059072 1701013760 1634467840 0 0
var20 = 24632
var9 = 8
var10 = -3
var11 = 69 // nice
var12 = 5
var13 = 8
var14 = 8
CalcKnockback var15 ODamage 0 0 0 OWeight 0
var8 = 0
Goto __ANGLE_FIX__
Return
label nspecial_start
LOGSTR 1853059072 1701013760 1634492160 1937006848 1920204800
var10 = 5
var11 = 90
var12 = 10
CalcKnockback var15 ODamage 0 0 0 OWeight 0
var8 = 0
Goto __ANGLE_FIX__
Return
label nspecial_aurabomb
LOGSTR 1853059072 1701013760 1634492160 1635086848 1633840896
var9 = 0
var10 = 4
var12 = 10
CalcKnockback var15 ODamage 0 0 0 OWeight 0
var8 = 0
Goto __ANGLE_FIX__
Return
label sspecial
LOGSTR 1936945152 1701013760 1634467840 0 0
var20 = 24633
var9 = 0.5
var10 = -5
var11 = 7.5
var12 = 3.6
var13 = 12
var14 = 14
CalcKnockback var15 ODamage 3 40 212 OWeight 0
var8 = 65
Goto __ANGLE_FIX__
Return
label sspecial_power
LOGSTR 1936945152 1701013760 1634492160 1886353152 1701969920
CalcKnockback var15 ODamage 5 65 219 OWeight 0
var8 = 65
Goto __ANGLE_FIX__
Return
label sspecial_spike
LOGSTR 1936945152 1701013760 1634492160 1936746752 1801781248
CalcKnockback var15 ODamage 3 10 212 OWeight 0
var8 = 280
Goto __ANGLE_FIX__
Return
label dspecial
LOGSTR 1685286912 1701013760 1634467840 0 0
var20 = 24635
var9 = 0
var10 = 0
var11 = 25
var12 = 10
var13 = 10
var14 = 10
CalcKnockback var15 ODamage 0 0 0 OWeight 0
var8 = 0
Goto __ANGLE_FIX__
Return
label dspecial_cancel
LOGSTR 1685286912 1701013760 1634492160 1667329536 1667591168
CalcKnockback var15 ODamage 0 0 0 OWeight 0
var8 = 0
Goto __ANGLE_FIX__
Return
label grab
LOGSTR 1735549184 1644167168 0 0 0
var20 = 24636
var9 = 1
var10 = -3
var11 = 6
var12 = 3
var13 = 7
var14 = 8
CalcKnockback var15 ODamage 0 0 0 OWeight 0
var8 = 0
Goto __ANGLE_FIX__
Return
label fthrow
LOGSTR 1718904832 1919907584 0 0 0
CalcKnockback var15 ODamage 10 20 90 OWeight 0
var8 = 45
Goto __ANGLE_FIX__
Return
label dthrow
LOGSTR 1685350400 1919907584 0 0 0
CalcKnockback var15 ODamage 7 80 44 OWeight 0
var8 = 70
Goto __ANGLE_FIX__
Return
label bthrow
LOGSTR 1651795968 1919907584 0 0 0
CalcKnockback var15 ODamage 10 35 75 OWeight 0
var8 = 45
Goto __ANGLE_FIX__
Return
label uthrow
LOGSTR 1970563072 1919907584 0 0 0
CalcKnockback var15 ODamage 5 60 105 OWeight 0
var8 = 75
Goto __ANGLE_FIX__
Return
label nair
LOGSTR 1851877632 1912602624 0 0 0
var20 = 24641
var9 = -10
var10 = -1.5
var11 = 9.5
var12 = 4.6
var13 = 9
var14 = 15
CalcKnockback var15 ODamage 15 20 100 OWeight 0
var8 = 361
Goto __ANGLE_FIX__
Return
label nair_mid
LOGSTR 1851877632 1918856448 1768161280 0 0
var13 = 16
var14 = 28
CalcKnockback var15 ODamage 12 15 100 OWeight 0
var8 = 50
Goto __ANGLE_FIX__
Return
label nair_weak
LOGSTR 1851877632 1918859008 1700883200 0 0
var13 = 29
var14 = 41
CalcKnockback var15 ODamage 9 10 100 OWeight 0
var8 = 60
Goto __ANGLE_FIX__
Return
label fair
LOGSTR 1717659904 1912602624 0 0 0
var20 = 24642
var9 = 0
var10 = 1
var11 = 7.5
var12 = 4.6
var13 = 6
var14 = 12
CalcKnockback var15 ODamage 11 30 70 OWeight 0
var8 = 361
Goto __ANGLE_FIX__
Return
label fair_scoop
LOGSTR 1717659904 1918857984 1668247296 1879048192 0
var9 = 0
var10 = 3
var11 = 3.5
var12 = 7.6
var13 = 4
var14 = 5
CalcKnockback var15 ODamage 11 30 70 OWeight 0
var8 = 361
Goto __ANGLE_FIX__
Return
label bair
LOGSTR 1650551040 1912602624 0 0 0
var20 = 24643
var9 = -16
var10 = 0
var11 = 7
var12 = 5
var13 = 10
var14 = 13
CalcKnockback var15 ODamage 14 20 100 OWeight 0
var8 = 361
Goto __ANGLE_FIX__
Return
label uair
LOGSTR 1969318144 1912602624 0 0 0
var20 = 24644
var9 = -4
var10 = -12
var11 = 4
var12 = 3
var13 = 7
var14 = 10
CalcKnockback var15 ODamage 11 30 80 OWeight 0
var8 = 80
Goto __ANGLE_FIX__
Return
label uair_strong
LOGSTR 1969318144 1918857984 1953656576 1852243968 0
CalcKnockback var15 ODamage 12 40 100 OWeight 0
var8 = 90
Goto __ANGLE_FIX__
Return
label dair
LOGSTR 1684105472 1912602624 0 0 0
var20 = 24645
var9 = -4
var10 = 10
var11 = 4
var12 = 7
var13 = 4
var14 = 12
CalcKnockback var15 ODamage 8 50 110 OWeight 0
var8 = 361
Goto __ANGLE_FIX__
Return
label dair_weak
LOGSTR 1684105472 1918859008 1700883200 0 0
var14 = 5
CalcKnockback var15 ODamage 8 20 30 OWeight 0
var8 = 85
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
  var16 = 7
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
if var20 < 24625 || var20 > 24649
  Return
endif
if Equal var16 13
  if Equal var20 24636
    var16 = 0
  // elif var20 < 24641 && Rnd < 0.4
  // elif var20 >= 24641
  // else
  //   var16 = 0
  endif
elif Equal var16 12 && Equal var20 24636
  var16 = 0
endif
Seek callMove
Jump
Return
Return
