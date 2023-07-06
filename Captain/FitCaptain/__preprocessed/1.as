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
    if XDistBackEdge < -10
      Button R
      if ODistLE 30
        Stick -1 (-1)
      else
        Stick 1 (-1)
      endif
      Return
    endif
  elif Equal AirGroundState 1 && var0 > 0 && Equal OFramesHitstun 0 && !(ODistLE 15)
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
if Equal OCurrAction 77 && Equal var20 24636 && !(Equal var19 1)
  Call AIHub
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

  if CanJump && YDistBackEdge > 65
    Call RecoveryHub
  elif !(CanJump) && YDistBackEdge > 45
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
      if OYDistBackEdge < 30
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

var8 = (var14 - var13) + 1

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
  if var20 >= 24625 && var20 <= 24639
    if Equal AirGroundState 1 && Equal CurrAction 3 && !(Equal var20 24636) && !(Equal var20 24630)
      var4 = 10 + 4
    elif Equal AirGroundState 2
      var4 = 10
    else
      var4 = 0
    endif
  elif var20 >= 24641 && var20 <= 24655
    var4 = 0
    if Equal AirGroundState 1
      var4 = 4
    endif
  endif

  SAFE_INJECT_4 var9
  SAFE_INJECT_5 var10
  SAFE_INJECT_6 var11
  SAFE_INJECT_7 var12
  var17 = OTopNY + OHurtboxSize
  var3 = var12 / 2
  var3 = TopNY - var10 + var3
  if var3 > var17
    var3 = OHurtboxSize * -1
  elif var3 < OTopNY
    var3 = 0
  else
    var17 = (var17 - var3)
    var17 = var17 * -1
    var3 = OHurtboxSize / var17
  endif
  // if Equal var8 0 || Equal var8 1 || Equal var18 1
  //   var5 = TopNX + (var9 * Direction)
  //   var5 = var5 + (var11 * Direction)
  //   var6 = TopNY - var10 + var12
  //   DrawDebugRectOutline var5 var6 var11 var12 255 68 68 153
  //   var6 += var3
  //   if var10 > -2 && var20 >= 24641 && var20 <= 24655
  //     var6 = var6 + var10 + 2 - var3
  //   endif
  //   if Equal PlayerNum 0
  //     DrawDebugRectOutline var5 var6 var11 var12 255 68 68 153
  //   elif Equal PlayerNum 1
  //     DrawDebugRectOutline var5 var6 var11 var12 68 68 255 153
  //   elif Equal PlayerNum 2
  //     DrawDebugRectOutline var5 var6 var11 var12 255 255 68 153
  //   elif Equal PlayerNum 3
  //     DrawDebugRectOutline var5 var6 var11 var12 68 255 68 153
  //   else
  //     DrawDebugRectOutline var5 var6 var11 var12 68 68 68 153
  //   endif
  //   var4 = OHurtboxSize / 2
  //   var17 = OTopNY + var4
  //   DrawDebugRectOutline OTopNX var17 var11 var4 68 255 68 153
  // endif
  var17 = 0
 // SAFE_INJECT_1 var17
  var17 = var13 + var8 + var4 + var17
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
  var17 = var9 + (var11 * 2)
  var17 /= 2
  if var17 <= -1
    var5 = var5 - (var11 * OPos * -1)
    var5 = var5 - (var9 * OPos * -1)
  else
    var5 = var5 - (var11 * Direction)
    var5 = var5 - (var9 * Direction)
  endif
  var6 += TopNY
  var17 = var3 * 2
  var6 -= var17
  var6 = var6 - var12
  var6 += var10
  // if Equal var8 0 || Equal var8 1 || Equal var18 1
  //   DrawDebugRectOutline var5 var6 var11 var12 255 0 0 136
  // endif
  var5 -= TopNX
  var6 -= TopNY

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
  var17 = var13 + var8 - 2
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
  EstOYCoord var3 var3
  var3 -= ExactOYCoord
  var3 += OTopNY
  if var3 < OYDistBackEdge
    var3 = OYDistBackEdge
  endif
  var17 = TopNY + var2
  var17 -= var3
  if var17 <= var12 && var17 > 0 && !(var2 < YDistBackEdge)
    var2 = 1
  else
    var2 = 0
  endif
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
    if CanJump && YDistBackEdge > 65
      Call RecoveryHub
    elif !(CanJump) && YDistBackEdge > 45
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
  var17 = var5 + (TotalXSpeed * var13 * -1)
  var2 = var5 + (XSpeed * var13)
  Abs var17
  Abs var2

  if Equal AirGroundState 1 && CurrAction <= 9 && Equal IsOnStage 1
    if var17 <= var11 && var20 >= 24641 && var20 <= 24655
      if MeteoChance
        if OYDistBackEdge < -5
          Button X
        endif
      elif var6 <= 70
        var17 = var9 + (var11 * 2)
        var17 /= 2
        label
        if var17 <= -1 && Equal Direction OPos
          Stick -1
          Return
        endif
        Button X
      endif
    elif var2 <= var11 && var20 >= 24641 && var20 <= 24655
      if MeteoChance
        if OYDistBackEdge < -5
          Button X
        endif
      elif var6 <= 70
        var17 = var9 + (var11 * 2)
        var17 /= 2
        label
        if var17 <= -1 && Equal Direction OPos
          Stick -1
          Return
        endif
        Button X
      endif
    elif Rnd <= 0.02 && var20 >= 24625 && var20 <= 24639 && XDistLE 80 100 && OFramesHitstun < 1
      // randomly perform tomhawk stuff if using a grounded move and not comboing
      Call mix_tomhawkJump
    elif Rnd <= 0.02 && Equal var20 32776 && OFramesHitstun < 1
      Call mix_tomhawkJump
    endif
  elif CanJump && Rnd <= 0.01 && var20 >= 24641 && var20 <= 24655 && Equal IsOnStage 1 && TopNY > OTopNY && OFramesHitstun < 1
    Call mix_doubleJump
  elif CanJump && Rnd <= 0.01 && Equal var20 32776 && TopNY > OTopNY && OFramesHitstun < 1
    Call mix_doubleJump

  endif

  if Equal var16 4
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
  if Equal var2 2
    var18 = 0
    Call RecoveryHub
  endif
endif

label VAR2_SAFE

// now that the calculations using these are over with, we'll store them
// for the next frame
var7 = var5

// if we're not in jumpsquat, we want to dash to the location
if Equal var16 3 && var20 < 24640
elif Equal AirGroundState 1 && !(Equal CurrSubaction JumpSquat)
  var17 = var5
  if var0 <= 10 && CurrAction < 3 && CurrAction > 4
    ClearStick
    if var5 < 0
      AbsStick 0.6
    else
      AbsStick -0.6
    endif
  else
    AbsStick var17
  endif
  // to ensure we dash, we clear the stick if we're walking for whatever reason
  if Equal CurrAction 1 && LevelValue > 21 && 10 < var0
    ClearStick
  endif

  if !(SamePlane) && var0 <= 10
    Goto JumpIfInRange
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
  var3 -= TopNX
  if Equal CurrSubaction JumpSquat
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
  endif

  if var20 >= 24641 && var20 <= 24655
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
  var17 = var6 + (OTotalYSpeed + TotalYSpeed) * 3
  if MeteoChance && Equal IsOnStage 0 && YSpeed < 0.01 && var17 > 30 && var17 < 60
    Button X
    Stick 0 (-1)
    Call ChrSpecific2
  endif
  if var17 > 15 && var17 < 70 && Equal AirGroundState 1 && CurrAction <= 9
    Button X
  endif
  if var17 > 20 && var17 < 70 && Equal CurrSubaction JumpSquat
    Button X
  endif
  if var17 > 35 && var17 < 55 && Equal AirGroundState 2 && CanJump && Equal IsOnStage 1
    Button X
    if Equal IsOnStage 0
      Stick 0 (-1)
      Call ChrSpecific2
    endif
  endif
Return

label XDistCheckPassed

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
    var3 += 0.13 // 0.13
    if var3 > 3.5
      var3 = 3.5
    elif var3 > MaxFallSpeed
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

  if var20 >= 24641 && var20 <= 24655
    if Equal AirGroundState 1 && CurrAction <= 9
      var17 = var9 + (var11 * 2)
      var17 /= 2
      if var17 >= 1 && !(Equal Direction OPos)
        ClearStick
        Stick (-1)
        var2 = 2
        Return
      elif var17 <= -1 && Equal Direction OPos
        ClearStick
        Stick (-1)
        var2 = 2
        Return
      endif
      Button X
      Return
    elif Equal AirGroundState 1
      Return
    elif CanJump && Equal var2 2 && var4 < -65
      var19 = 0
      Call AIHub
    elif !CanJump && Equal var2 2 && var4 < -45
      var19 = 0
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

// if the action requires us to be stopped,
if var20 >= 24625 && var20 <= 24635
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
    var17 = var5 / 10
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
  if var17 >= 1 && !(Equal Direction OPos)
    ClearStick
    Stick (-0.7)
    Return
  elif var17 <= -1 && Equal Direction OPos
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
  if var17 >= 1 && !(Equal Direction OPos)
    ClearStick
    Stick (-0.7)
    Return
  elif var17 <= -1 && Equal Direction OPos
    ClearStick
    Stick (-0.7)
    Return
  endif
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
