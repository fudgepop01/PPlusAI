// APPROACH HUB
// controls which approach to use when pursuing a target location
#include <Definition_AIMain.h>
id 0x8001

unk 0x0

SetTimeout 400

if FramesHitstun > 0 || Equal move_xRange 0
  Call AIHub
endif

if !(Equal lastScript hex(0x8F01)) && !(Equal lastScript hex(0x8F00))
  MESS_MOVE_PARAMS(var0)
endif
// this is used to detect when the target x position has passed through falcon, such as when changing direction or something
#let prevTargetXDistance = var7

prevTargetXDistance = hex(0xFFFF)

label

// these work together to only dashdance if not in a tech-chase or combo situation
IF_O_IS_TECHING
elif Equal lastScript hex(0x8F00) || Equal lastScript hex(0x8002) || OYDistBackEdge < -20
elif Equal approachType mv_throwOut && Rnd < 0.3
else
  DASHDANCE(var0, var1)
endif

label BEGIN_MAIN

SAFE_INJECT_4 move_xOffset
SAFE_INJECT_5 move_yOffset
SAFE_INJECT_6 move_xRange
SAFE_INJECT_7 move_yRange

if FramesHitstun > 0
  Call AIHub
endif

lastScript = hex(0x8001)

// literally an edge case
if Equal OAirGroundState 3 && TopNY > OTopNY && !(Equal moveVariant mv_edgeguard)
  Call EdgeguardHub
endif

#let tempVar = var17

tempVar = OXDistBackEdge
Abs tempVar
if MeteoChance
  #let localTempVar = var2
  if tempVar > 70 && Equal IsOnStage 1
    Goto approachEdge
    Return
  elif Equal moveVariant mv_edgeguard && lastAttack < hex(0x6040) && Equal IsOnStage 1
    Goto approachEdge
    Return
  elif Equal AirGroundState 1 && tempVar > 40 && OYDistBackEdge < -1 && !(Equal XSpeed 0) && lastAttack >= hex(0x6040)
    Button X
  elif !(Equal CurrSubaction JumpSquat) && Equal AirGroundState 1 && OYDistBackEdge < 10 && lastAttack >= hex(0x6040)
    Button X
  elif OYDistBackEdge > -10 && !(Equal moveVariant mv_edgeguard)
    Call EdgeguardHub
  endif

  if localTempVar < OTopNY && Equal IsOnStage 0 && Equal moveVariant mv_edgeguard && OXDistFrontEdge < 20 && YDistBackEdge > 30
    Call RecoveryHub
  elif CanJump && YDistBackEdge > 50
    Call RecoveryHub
  elif YDistBackEdge > 30
    Call RecoveryHub
  endif
endif
if !(True)
  #let localTempVar = var2
  label approachEdge
  GetNearestCliff localTempVar
  localTempVar -= TopNX
  Abs localTempVar
  if localTempVar < 10
    localTempVar = OPos * -1 / 2
    AbsStick localTempVar
    Return
  elif localTempVar < 20
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
    if Equal CurrAction hex(0x01)
      ClearStick
    endif
  endif
  Return
endif

label edgeguardMovementComplete

#let targetXDistance = var5
#let targetYDistance = var6
#let absTargetXDistance = var0
#let absTargetYDistance = var1
#let prevTargetXDistance = var7

#let loopTempVar = var8
if lastAttack > hex(0x604F)
  move_length = 1
endif

loopTempVar = move_length

Seek LOOP_DIST_CHECK
Jump
label LOOP_DIST_EXIT
if !(True)
  label LOOP_DIST_CHECK
  // clacs distance to the target
  CALC_TARGET_DISTANCES(var5, var6, var3, var4, move_hitFrame + loopTempVar, _oCalc, _sCalc)

  // targetXDistance and targetYDistance come from the macro
  absTargetXDistance = targetXDistance
  absTargetYDistance = targetYDistance
  Abs absTargetXDistance
  Abs absTargetYDistance
  // if we're not jumping

  if !(Equal CurrSubaction JumpSquat)
    #let localTempVar = var2

    // if one is negative and one is positive, and it's <= move_xRange
    // then we likely passed through it at some point within the last frame
    localTempVar = prevTargetXDistance + targetXDistance
    Abs localTempVar

    if absTargetXDistance <= move_xRange
      #let shouldAttack = var2
      Goto XDistCheckPassed
      if Equal shouldAttack 1
        Seek CallAttacks
        Jump
      endif
      tempVar = TopNY - OTopNY
      Abs tempVar
      if XDistLE 35 && tempVar <= 40 && OAttacking && Equal AirGroundState 1 && !(Equal CurrSubaction JumpSquat)
        Call Unk3020
      endif
    elif localTempVar <= move_xRange
      #let shouldAttack = var2
      Goto XDistCheckPassed
      if Equal shouldAttack 1
        Seek CallAttacks
        Jump
      endif
    elif YSpeed < 0
      Call AIHub
    endif
    if YDistBackEdge > 30
      Call AIHub
    endif
  endif

  loopTempVar -= 1
  if loopTempVar < 1
    Seek LOOP_DIST_EXIT
    Jump
    Return
  endif
  Seek LOOP_DIST_CHECK
  Jump
endif


if !(Equal CurrSubaction JumpSquat)
  #let localTempVar = var2

  // if one is negative and one is positive, and it's <= move_xRange
  // then we likely passed through it at some point within the last frame
  localTempVar = prevTargetXDistance + targetXDistance
  Abs localTempVar

  if Equal prevTargetXDistance hex(0xFFFF)
    // just makes sure this isn't affected by other variables
    localTempVar = hex(0xFFFF)
  endif
  // if we want to perform an aerial, jump with respect to the
  // move_hitFrame (that's a really poor name for it tbh lol)
  // to attempt to get there by the time the move's hitbox is out
  tempVar = targetXDistance + (TotalXSpeed * move_hitFrame * -1)
  localTempVar = targetXDistance + (XSpeed * move_hitFrame)
  Abs tempVar
  Abs localTempVar

  if Equal AirGroundState 1 && CurrAction <= 9 && OFramesHitstun < 1 && Equal IsOnStage 1
    if tempVar <= move_xRange && lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F)
      if MeteoChance
        if OYDistBackEdge < -5
          Button X
        endif
      else
        // Button X
      endif
    elif localTempVar <= move_xRange && lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F)
      if MeteoChance
        if OYDistBackEdge < -5
          Button X
        endif
      else
        // Button X
      endif
    elif Rnd <= 0.02 && lastAttack >= hex(0x6031) && lastAttack <= hex(0x603F) && XDistLE 40 60
      // randomly perform tomhawk stuff if using a grounded move and not comboing
      Call mix_tomhawkJump
    elif Rnd <= 0.02 && Equal lastAttack hex(0x8008)
      Call mix_tomhawkJump
    endif
  elif CanJump && Rnd <= 0.01 && lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F) && Equal IsOnStage 1 && TopNY > OTopNY && OFramesHitstun < 1
    // randomly double-jump aerial instead of going straight for the aerial
    Call mix_doubleJump
  elif CanJump && Rnd <= 0.01 && Equal lastAttack hex(0x8008) && TopNY > OTopNY && OFramesHitstun < 1
    Call mix_doubleJump
  endif

  if Equal moveVariant mv_throwOut
    if Rnd < 0.3 && lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F) && Equal AirGroundState 1 && !(Equal CurrSubaction JumpSquat)
      Button X
    endif
    if Rnd < 0.2 && lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F) && InAir && Equal Direction OPos
      Seek
      Goto CallAttacks
      Jump
    elif Rnd < 0.2 && lastAttack >= hex(0x6031) && lastAttack <= hex(0x603F) && !(InAir)
      Seek
      Goto CallAttacks
      Jump
    endif
    label
  endif
endif

#let isGoingOffstage = var2
GOING_OFFSTAGE(var2, var3, move_IASA)

#let nearCliffX = var3
#let nearCliffY = var4
GetNearestCliff nearCliffX
nearCliffY *= -1
nearCliffY = nearCliffY - TopNY * -1
// before continuing, checks currently location and situation
// this prevents the AI from awkwardly running offstage
if !(Equal isGoingOffstage 0) && YSpeed < -1 && nearCliffY < -20
  movePart = 0
  Call RecoveryHub
endif

if Equal moveVariant mv_edgeguard && lastAttack < hex(0x6040)
elif YSpeed < 0.2 && YDistBackEdge < -1 && YDistBackEdge > -10 && lastAttack >= hex(0x6031) && lastAttack <= hex(0x6037) && YDistBackEdge > -6 && Equal IsOnStage 1
  tempVar = targetXDistance / 10
  AbsStick tempVar (-1)
  Button R
endif

// now that the calculations using these are over with, we'll store them
// for the next frame
prevTargetXDistance = targetXDistance

// if we're not in jumpsquat, we want to dash to the location
if Equal moveVariant mv_edgeguard && lastAttack < hex(0x6040)
elif absTargetXDistance > move_xRange && Equal AirGroundState 1 && !(Equal CurrSubaction JumpSquat)
  tempVar = targetXDistance
  AbsStick tempVar
  // to ensure we dash, we clear the stick if we're walking for whatever reason
  if Equal CurrAction hex(0x01) && LevelValue > LV3
    ClearStick
  endif
else
  // otherwise...
  tempVar = targetXDistance / 10
  if XDistFrontEdge < 25 && Equal OPos Direction
    tempVar /= 2
  elif XDistBackEdge > -25 && !(Equal OPos Direction)
    tempVar /= 2
  endif
  AbsStick tempVar

  // adjusts the trajectory of the jump if the
  // target is moving
  if Equal CurrSubaction JumpSquat
    tempVar = OXSpeed * 2
    if OXSpeed > 0.3
      ClearStick
      AbsStick tempVar 0
    elif OXSpeed < -0.3
      ClearStick
      AbsStick tempVar 0
    endif
  endif

  if lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F)
    Goto JumpIfInRange
  elif !(SamePlane)
    Goto JumpIfInRange
  endif
endif

// LOGSTR str("LOOPED?")
Seek BEGIN_MAIN
// if (OInAir) && !(Dashing) && !(OAttacking)
//   Jump
// endif
Return

label JumpIfInRange
JUMP_IF_IN_RANGES(var6)
Return

label XDistCheckPassed
if YDistFloor < 0.2 && targetYDistance < 0 && !(SamePlane) && Equal AirGroundState 1
  ClearStick
  if CurrAction <= hex(0x05) && !(Equal CurrAction hex(0x03)) || Equal CurrAction hex(0x11)
    AbsStick 0 (-1)
  endif
  Return
endif

#let shouldAttack = var2
shouldAttack = 0

tempVar = HurtboxSize
if targetYDistance < tempVar && Equal AirGroundState 1 && Equal YSpeed 0 && !(Equal CurrAction JumpSquat)
  tempVar = hex(0xFFFF)
else
  tempVar = move_yRange + OHurtboxSize
endif
if absTargetYDistance <= tempVar
  #let approxDist = var4
  CALC_SELF_Y_CHANGE_GRAVITY(var4, var3, move_IASA, l_test)
  approxDist = (YDistFrontEdge * -1) - approxDist

  #let isGoingOffstage = var2
  GOING_OFFSTAGE(var2, var3, move_IASA + 3)

  if lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F)
    if Equal AirGroundState 1 && CurrAction <= hex(0x09)
      if move_xOffset >= 1 && !(Equal Direction OPos)
        ClearStick
        Stick -0.5
        Return
      endif
      Button X
      Return
    elif Equal AirGroundState 1
      Return
    elif CanJump && !(Equal isGoingOffstage 0) && approxDist < -70
      // DrawDebugRectOutline TopNX TopNY 5 5 color(0xFFFF00AA)
      moveVariant = 0
      Call AIHub
    elif !CanJump && !(Equal isGoingOffstage 0) && approxDist < -36
      // DrawDebugRectOutline TopNX TopNY 5 5 color(0xFF00FFAA)
      moveVariant = 0
      Call AIHub
    else
      // LOGSTR str("appDist")
      shouldAttack = 1
    endif
  elif Equal AirGroundState 1
    // otherwise we just straight-up go to the attack performing section if
    // we're in range
    shouldAttack = 1
  endif
endif
Return

label CallAttacks

// if the action requires us to be stopped,
if lastAttack >= hex(0x6031) && lastAttack <= hex(0x6037)
  if Equal CurrAction hex(0x03)
    // stops the dash
    ClearStick
    Button X
    Return
  endif
  if Equal CurrAction hex(0x04)
    // interrupts run with crouch for one frame
    ClearStick
    Stick 0 (-1)
    Return
  endif
  if Equal CurrAction hex(0x0A) || Equal CurrSubaction JumpSquat
    Return
  endif

  #let isGoingOffstage = var2
  GOING_OFFSTAGE(var2, var3, 2)

  if InAir && YDistBackEdge > -10 && YDistBackEdge <= 0 && Equal isGoingOffstage 0
    globTempVar = targetXDistance / 10
    if LevelValue <= LV7
      if Rnd < 0.4
        Button R
        AbsStick globTempVar (-1)
      endif
    else
      Button R
      AbsStick globTempVar (-1)
    endif
    Return
  elif !(Equal AirGroundState 1)
    Call AIHub
  endif
  if move_xOffset >= 1 && !(Equal Direction OPos)
    ClearStick
    Stick -0.5
    Return
  endif
  if CurrAction > hex(0x15)
    Return
  endif
elif lastAttack >= hex(0x6040) && lastAttack <= hex(0x604F) && Equal AirGroundState 1
  if AnimFrame >= move_IASA || CurrAction <= hex(0x09)
    Button X
  endif
  Return
elif Equal CurrSubaction JumpSquat
  Return
endif

// sets movePart to 1 so we know to actually perform the move instead
// of loading the move data and getting within the move's range -- we
// just did that in this script!
movePart = 1
if Equal lastAttack hex(0x6031)
  Call Jab123
elif Equal lastAttack hex(0x6032)
  Call FTilt
elif Equal lastAttack hex(0x6033)
  Call UTilt
elif Equal lastAttack hex(0x6034)
  Call DTilt
elif Equal lastAttack hex(0x6035)
  Call FSmash
elif Equal lastAttack hex(0x6036)
  Call USmash
elif Equal lastAttack hex(0x6037)
  Call DSmash
elif Equal lastAttack hex(0x6038)
  Call NSpecial
elif Equal lastAttack hex(0x6039)
  Call SSpecial
elif Equal lastAttack hex(0x603A)
  Call USpecial
elif Equal lastAttack hex(0x603B)
  Call DSpecial
elif Equal lastAttack hex(0x603C)
  Call Grab
elif Equal lastAttack hex(0x6041)
  Call NAir
elif Equal lastAttack hex(0x6042)
  Call FAir
elif Equal lastAttack hex(0x6043)
  Call BAir
elif Equal lastAttack hex(0x6044)
  Call UAir
elif Equal lastAttack hex(0x6045)
  Call DAir
elif Equal lastAttack hex(0x6046)
  Call NSpecialAir
elif Equal lastAttack hex(0x6047)
  Call SSpecialAir
elif Equal lastAttack hex(0x6048)
  Call USpecialAir
elif Equal lastAttack hex(0x6049)
  Call DSpecialAir
elif Equal lastAttack hex(0x8008)
  Call FakeOutHub
endif
Return
Return