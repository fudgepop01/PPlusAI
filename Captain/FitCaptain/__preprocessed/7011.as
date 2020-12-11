// APPROACH HUB
// controls which approach to use when pursuing a target location
#include <Definition_AIMain.h>
id 0x7011

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
elif Equal var21 36608 || Equal var21 8288 || Equal var21 32770 || OYDistBackEdge < -20
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
      Return
    elif XDistFrontEdge <= 10
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
  var0 = var0 - 1
  if (var0 > 0)
    Stick (-1)
  endif
  var1 = (Rnd * 10) + 3
  Return
  label _dashdanceEnd
endif

label BEGIN_MAIN

if Equal var17 NumFrames
  ClearStick 1
  Return
endif

SAFE_INJECT_4 var9
SAFE_INJECT_5 var10
SAFE_INJECT_6 var11
SAFE_INJECT_7 var12

if OYSpeed < 0 && OYDistBackEdge > -5 && Equal OCurrAction 73
  Call AIHub
endif

if Equal OCurrAction 77 && Equal var20 24636 && !(Equal var19 1)
  Call AIHub
endif

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

  if CanJump && YDistBackEdge > 50
    Call RecoveryHub
  elif !(CanJump) && YDistBackEdge > 30
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
      Stick (-0.5)
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
  if Equal var8 0 || Equal var8 var14
    var5 = TopNX + (var9 * Direction)
    var6 = YCoord - var10
    DrawDebugRectOutline var5 var6 var11 var12 255 68 68 153
    var17 = OHurtboxSize / 2
    var6 += var17
    var17 = var12 + var17
    if Equal PlayerNum 0
      DrawDebugRectOutline var5 var6 var11 var17 255 68 68 153
    elif Equal PlayerNum 1
      DrawDebugRectOutline var5 var6 var11 var17 68 68 255 153
    elif Equal PlayerNum 2
      DrawDebugRectOutline var5 var6 var11 var17 255 255 68 153
    elif Equal PlayerNum 3
      DrawDebugRectOutline var5 var6 var11 var17 68 255 68 153
    else
      DrawDebugRectOutline var5 var6 var11 var17 68 68 68 153
    endif
    var17 = OTopNY + (OHurtboxSize / 2)
    DrawDebugRectOutline OTopNX var17 var11 OHurtboxSize 68 255 68 153
  endif
  var17 = var13 + var8
  var17 /= 60
  EstOPosVecR var5 var6 var17
  // convert the values to use TopN X and Y instead of character's coordinates
  var17 = ExactOXCoord - ExactXCoord
  var17 = var17 - (OTopNX - TopNX)
  var5 = var5 - var17
  var17 = ExactOYCoord - ExactYCoord
  var17 = var17 - (OTopNY - TopNY)
  var6 = var6 - var17
  var5 += TopNX
  var5 = var5 - (var9 * Direction)
  var6 -= TopNY
  // if var6 < OYDistBackEdge && Equal OIsOnStage 1 && !(Equal AirGroundState 2) && !(Equal CurrAction 10)
  //   var6 = OYDistBackEdge
  // endif
  var6 += TopNY
  var6 += var10
  var17 = OHurtboxSize / 2
  var6 += var17
  var17 = var12 + var17
  if Equal var8 0 || Equal var8 var14 || Equal var8 1
    DrawDebugRectOutline var5 var6 var11 var17 255 0 0 136
  endif
  var6 -= TopNY
  var5 -= TopNX

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

    var17 = var11 * 1.5
    if var0 <= var11
      Goto XDistCheckPassed
      if Equal var2 1
        Seek CallAttacks
        Jump
      endif
      var17 = TopNY - OTopNY
      Abs var17
      if XDistLE 35 && var17 <= 40 && OAttacking && Equal AirGroundState 1 && !(Equal CurrSubaction JumpSquat)
        Call Unk3020
      endif
    elif var2 <= var11
      Goto XDistCheckPassed
      if Equal var2 1
        Seek CallAttacks
        Jump
      endif
    elif YSpeed < 0
      // Call AIHub
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
    elif Rnd <= 0.02 && var20 >= 24625 && var20 <= 24639 && XDistLE 80 100
      // randomly perform tomhawk stuff if using a grounded move and not comboing
      Call mix_tomhawkJump
    elif Rnd <= 0.02 && Equal var20 32776
      Call mix_tomhawkJump
    endif
  elif CanJump && Rnd <= 0.01 && var20 >= 24641 && var20 <= 24655 && Equal IsOnStage 1 && TopNY > OTopNY && OFramesHitstun < 1
    // randomly double-jump aerial instead of going straight for the aerial
    Call mix_doubleJump
  elif CanJump && Rnd <= 0.01 && Equal var20 32776 && TopNY > OTopNY && OFramesHitstun < 1
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
    label
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

// if Equal var19 255 && var20 < 24640
// elif YSpeed < 0.2 && YDistBackEdge < -1 && YDistBackEdge > -10 && var20 >= 24625 && var20 <= 24631 && YDistBackEdge > -6 && Equal IsOnStage 1
//   LOGSTR 822083584 0 0 0 0
//   var17 = var5 / 10
//   AbsStick var17 (-1)
//   Button R
// endif

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

var17 = NumFrames
Seek BEGIN_MAIN
Jump
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
// if YDistFloor < 0.2 && var6 < 0 && !(SamePlane) && Equal AirGroundState 1
//   ClearStick
//   if CurrAction <= 5 && !(Equal CurrAction 3) || Equal CurrAction 17
//     AbsStick 0 (-1)
//   endif
//   Return
// endif

var2 = 0

var17 = HurtboxSize
if var6 < var17 && Equal AirGroundState 1 && Equal YSpeed 0 && !(Equal CurrAction 10)
  var17 = 65535
else
  var17 = var12 + (OHurtboxSize / 2)
endif
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
    if !(Equal var2 0) && Equal OIsOnStage 1
      Return
    elif Equal AirGroundState 1 && CurrAction <= 9
      if var9 >= 1 && !(Equal Direction OPos)
        ClearStick
        Stick (-0.5)
        Return
      endif
      Button X
      Return
    elif Equal AirGroundState 1
      Return
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
      var2 = 1
    endif
  elif Equal AirGroundState 1
    // otherwise we just straight-up go to the attack performing section if
    // we're in range
    var2 = 1
  endif
endif
Return

label CallAttacks
LOGSTR 1665233920 1952539392 1802698752 0 0

// if the action requires us to be stopped,
if var20 >= 24625 && var20 <= 24631
  if Equal CurrAction 3
    // stops the dash
    ClearStick
    Button X
    Return
  endif
  if Equal CurrAction 4
    // interrupts run with crouch for one frame
    ClearStick
    // Stick 0 (-1)
    Return
  endif
  if Equal CurrAction 10 || Equal CurrSubaction JumpSquat
    Return
  endif

  GetNearestCliff var2
  var3 = XSpeed * 4
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

  if InAir && YDistBackEdge > -10 && YDistBackEdge <= 0 && Equal var2 0
    var17 = var5 / 10
    if LevelValue <= 60
      if Rnd < 0.4
        Button R
        // AbsStick var17 (-1)
      endif
    else
      Button R
      // AbsStick var17 (-1)
    endif
    Return
  elif !(Equal AirGroundState 1)
    Call AIHub
  endif
  if var9 >= 1 && !(Equal Direction OPos)
    ClearStick
    Stick (-0.5)
    Return
  endif
  if CurrAction > 21
    Return
  endif
elif Equal CurrSubaction JumpSquat
  Return
elif var20 >= 24640 && var20 <= 24655 && Equal AirGroundState 1
  if AnimFrame >= var15 || CurrAction <= 9
    Button X
  endif
  Return
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
