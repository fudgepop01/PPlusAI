// APPROACH HUB
// controls which approach to use when pursuing a target location
#include <Definition_AIMain.h>
id 0x8001

unk 0x0

SetTimeout 400

movePart = 0

{DEBUG_SKIP}

if FramesHitstun > 0 || Equal move_xRange 0
  Call AIHub
endif

if !(Equal lastScript hex(0x8F01)) && !(Equal lastScript hex(0x8F00)) && !(Equal lastScript hex(0x8001))
  MESS_MOVE_PARAMS
endif
// this is used to detect when the target x position has passed through falcon, such as when changing direction or something
#let prevTargetXDistance = var7

prevTargetXDistance = hex(0xFFFF)

label

// these work together to only dashdance if not in a tech-chase or combo situation
IF_O_IS_TECHING
{SKIP_DASHDANCE_CONDITIONS}
elif Equal lastScript hex(0x8F00) || Equal lastScript hex(0x2060) || Equal lastScript hex(0x8002) || OYDistBackEdge < -20
elif Equal approachType at_throwOut && Rnd < 0.3
else
  DASHDANCE(var0, var1)
endif

label BEGIN_MAIN

if Equal OAirGroundState 1 && Equal approachType at_edgeguard
  Call AIHub
endif

{BEGINNING_CHECKS}
if Equal OCurrAction hex(0x4D) && Equal lastAttack hex(0x603C) && !(Equal moveVariant mv_techChase)
  Call AIHub
endif

if FramesHitstun > 0
  Call AIHub
endif

lastScript = hex(0x8001)

// literally an edge case
if Equal OAirGroundState 3 && TopNY > OTopNY && !(Equal approachType at_edgeguard)
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
  elif OYDistBackEdge < -50 && Equal IsOnStage 1
    Goto approachEdge
    Return
  elif Equal approachType at_edgeguard && lastAttack < hex(0x6040) && Equal IsOnStage 1
    Goto approachEdge
    Return
  elif Equal AirGroundState 1 && tempVar > 40 && OYDistBackEdge < -1 && OYDistBackEdge > -50 && !(Equal XSpeed 0) && lastAttack >= hex(0x6040)
    Button X
  elif !(Equal CurrSubaction JumpSquat) && Equal AirGroundState 1 && OYDistBackEdge < 10 && OYDistBackEdge > -50 && lastAttack >= hex(0x6040)
    Button X
  elif OYDistBackEdge > -10 && !(Equal approachType at_edgeguard)
    Call EdgeguardHub
  endif

  if CanJump && YDistBackEdge > maxYEdgeDistWithJump
    Call RecoveryHub
  elif !(CanJump) && YDistBackEdge > maxYEdgeDist
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
    localTempVar = OPos * -0.5
    AbsStick localTempVar
    Return
  elif localTempVar < 20
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
  move_lastHitFrame = move_hitFrame
endif

loopTempVar = (move_lastHitFrame - move_hitFrame) + 1

if Rnd < 0.05
  if YDistFloor < 0.2 && targetYDistance < 0 && !(SamePlane) && Equal AirGroundState 1
    globTempVar = 3
    Seek platformDrop
    Jump
  endif
endif

if !(True)
  label platformDrop
  ClearStick
  if CurrAction <= hex(0x05) && !(Equal CurrAction hex(0x03)) || Equal CurrAction hex(0x11)
    AbsStick 0 (-1)
  endif

  globTempVar -= 1

  if globTempVar <= 0
    Seek
  else
    Seek platformDrop
  endif
  Return
endif
label

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
  if lastAttack >= hex(0x6031) && lastAttack <= hex(0x603F)
    if Equal AirGroundState 1 && Equal CurrAction hex(0x03) && !(Equal lastAttack hex(0x603C)) && !(Equal lastAttack hex(0x6036))
      var4 = 10 + jumpSquatFrames
    elif Equal AirGroundState 2
      var4 = 10
    else
      var4 = 0
    endif
  elif lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F)
    var4 = 0
    if Equal AirGroundState 1
      var4 = jumpSquatFrames
    endif
  endif

  CALC_TARGET_DISTANCES(var5, var6, var3, var4, move_hitFrame + loopTempVar, _oCalc, _sCalc)

  // targetXDistance and targetYDistance come from the macro
  absTargetXDistance = targetXDistance
  absTargetYDistance = targetYDistance
  Abs absTargetXDistance
  Abs absTargetYDistance
  // if we're not jumping

  if !(Equal CurrSubaction JumpSquat)
    shouldFastFall = 0
    #let localTempVar = var2

    // if one is negative and one is positive, and it's <= move_xRange
    // then we likely passed through it at some point within the last frame
    localTempVar = prevTargetXDistance + targetXDistance
    Abs localTempVar

    {FASTFALL_CHECK}
    if absTargetXDistance <= move_xRange
      #let shouldAttack = var2
      Goto XDistCheckPassed
      if Equal shouldAttack 1
        shouldAttack = 0
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
        shouldAttack = 0
        Seek CallAttacks
        Jump
      endif
    endif
    if CanJump && YDistBackEdge > maxYEdgeDistWithJump
      Call RecoveryHub
    elif !(CanJump) && YDistBackEdge > maxYEdgeDist
      Call RecoveryHub
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

  if Equal AirGroundState 1 && CurrAction <= 9 && Equal IsOnStage 1
    if tempVar <= move_xRange && lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F)
      if MeteoChance
        if OYDistBackEdge < -5
          Button X
        endif
      elif targetYDistance <= 70
        Button X
      endif
    elif localTempVar <= move_xRange && lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F)
      if MeteoChance
        if OYDistBackEdge < -5
          Button X
        endif
      elif targetYDistance <= 70
        Button X
      endif
    elif Rnd <= 0.02 && lastAttack >= hex(0x6031) && lastAttack <= hex(0x603F) && XDistLE 80 100 && OFramesHitstun < 1
      // randomly perform tomhawk stuff if using a grounded move and not comboing
      Call mix_tomhawkJump
    elif Rnd <= 0.02 && Equal lastAttack hex(0x8008) && OFramesHitstun < 1
      Call mix_tomhawkJump
    endif
  {MIX_DOUBLEJUMP_SECTION}
  {ADDITIONAL_MIXUPS}
  endif

  if Equal approachType at_throwOut
    if Rnd < 0.3 && lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F) && Equal AirGroundState 1 && !(Equal CurrSubaction JumpSquat)
      Button X
    endif
    if Rnd < 0.2 && lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F) && InAir && Equal Direction OPos
      Seek CallAttacks
      Jump
    elif Rnd < 0.2 && lastAttack >= hex(0x6031) && lastAttack <= hex(0x603F) && !(InAir)
      Seek CallAttacks
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
nearCliffX = TopNX - nearCliffX

if nearCliffX > 50 || nearCliffX < -50
  if Equal isGoingOffstage 2
    movePart = 0
    Call RecoveryHub
  endif
endif

label VAR2_SAFE

// now that the calculations using these are over with, we'll store them
// for the next frame
prevTargetXDistance = targetXDistance

// if we're not in jumpsquat, we want to dash to the location
if Equal approachType at_edgeguard && lastAttack < hex(0x6040)
elif Equal AirGroundState 1 && !(Equal CurrSubaction JumpSquat)
  tempVar = targetXDistance
  if absTargetXDistance <= oWalkingDist && CurrAction < hex(0x03) && CurrAction > hex(0x04)
    ClearStick
    if targetXDistance < 0
      AbsStick 0.6
    else
      AbsStick -0.6
    endif
  else
    AbsStick tempVar
  endif
  // to ensure we dash, we clear the stick if we're walking for whatever reason
  if Equal CurrAction hex(0x01) && LevelValue > LV3 && oWalkingDist < absTargetXDistance
    ClearStick
  endif
else
  // otherwise...
  tempVar = targetXDistance / oWalkingDist
  if XDistFrontEdge < edgeRange && Equal OPos Direction
    tempVar /= 2
  elif XDistBackEdge > -edgeRange && !(Equal OPos Direction)
    tempVar /= 2
  endif
  AbsStick tempVar

  // adjusts the trajectory of the jump if the
  // target is moving
  nearCliffX -= TopNX
  if Equal CurrSubaction JumpSquat
    tempVar = OXSpeed * 2
    if OXSpeed > calloutSpeed
      ClearStick 0
      AbsStick tempVar 0
    elif OXSpeed < -calloutSpeed
      ClearStick 0
      AbsStick tempVar 0
    endif

    if nearCliffX >= -edgeRange && nearCliffX <= edgeRange
      if nearCliffX > 0
        ClearStick 0
        if XSpeed > 0.1
          AbsStick -1
        endif
      elif nearCliffX < 0
        ClearStick 0
        if XSpeed < -0.1
          AbsStick 1
        endif
      endif
    endif
  endif

  if lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F)
    Goto JumpIfInRange
  elif !(SamePlane)
    Goto JumpIfInRange
  endif
endif

Seek BEGIN_MAIN
if shouldFastFall > 0
  Return
endif
ClearStick 1
// without this it may fastfall automatically, which we don't want
Stick 0 0.5
Return

label JumpIfInRange
JUMP_IF_IN_RANGES(var6)
Return

label XDistCheckPassed
#let shouldAttack = var2
#let loopTempVar = var8

shouldAttack = 0

tempVar = HurtboxSize
if targetYDistance < tempVar && Equal AirGroundState 1 && Equal YSpeed 0 && !(Equal CurrAction hex(0x0A))
  tempVar = hex(0xFFFF)
else
  tempVar = move_yRange + (OHurtboxSize / 2)
endif
if absTargetYDistance <= tempVar
  #let approxDist = var4
  CALC_SELF_Y_CHANGE_GRAVITY(var4, var3, move_IASA, l_test)
  approxDist = (YDistFrontEdge * -1) - approxDist

  #let isGoingOffstage = var2
  GOING_OFFSTAGE(var2, var3, move_IASA + 3)

  if lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F)
    if Equal AirGroundState 1 && CurrAction <= hex(0x09)
      globTempVar = move_xOffset + (move_xRange * 2)
      globTempVar /= 2
      if globTempVar >= 1 && !(Equal Direction OPos)
        ClearStick
        Stick (-0.5)
        Return
      elif globTempVar <= -1 && Equal Direction OPos
        ClearStick
        Stick (-0.5)
        Return
      endif
      Button X
      Return
    elif Equal AirGroundState 1
      Return
    elif CanJump && Equal isGoingOffstage 2 && approxDist < -maxYEdgeDistWithJump
      moveVariant = 0
      Call AIHub
    elif !CanJump && Equal isGoingOffstage 2 && approxDist < -maxYEdgeDist
      moveVariant = 0
      Call AIHub
    {ADDITIONAL_YDIST_CHECKS}
    else
      shouldAttack = 1
    endif
  elif Equal AirGroundState 1
    shouldAttack = 1
  endif
endif
Return

label CallAttacks

// if the action requires us to be stopped,
if lastAttack >= hex(0x6031) && lastAttack <= hex(0x603B)
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
  GOING_OFFSTAGE(var2, var3, 4)

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
  globTempVar = move_xOffset + (move_xRange * 2)
  globTempVar /= 2
  if globTempVar >= 1 && !(Equal Direction OPos)
    ClearStick
    Stick (-0.7)
    Return
  elif globTempVar <= -1 && Equal Direction OPos
    ClearStick
    Stick (-0.7)
    Return
  endif
  if CurrAction > hex(0x15)
    Return
  endif
elif Equal CurrSubaction JumpSquat
  Return
elif lastAttack >= hex(0x6040) && lastAttack <= hex(0x604F) && Equal AirGroundState 1
  if globTempVar >= 1 && !(Equal Direction OPos)
    ClearStick
    Stick (-0.7)
    Return
  elif globTempVar <= -1 && Equal Direction OPos
    ClearStick
    Stick (-0.7)
    Return
  endif
  if AnimFrame >= move_IASA || CurrAction <= hex(0x09)
    Button X
  endif
  Return
endif

// sets movePart to 1 so we know to actually perform the move instead
// of loading the move data and getting within the move's range -- we
// just did that in this script!
movePart = 1
if Equal lastAttack valJab123
  Call Jab123
elif Equal lastAttack valFTilt
  Call FTilt
elif Equal lastAttack valUTilt
  Call UTilt
elif Equal lastAttack valDTilt
  Call DTilt
elif Equal lastAttack valFSmash
  Call FSmash
elif Equal lastAttack valUSmash
  Call USmash
elif Equal lastAttack valDSmash
  Call DSmash
elif Equal lastAttack valNSp
  Call NSpecial
elif Equal lastAttack valSSp
  Call SSpecial
elif Equal lastAttack valUSp
  Call USpecial
elif Equal lastAttack valDSp
  Call DSpecial
elif Equal lastAttack valGrab
  Call Grab
elif Equal lastAttack valNAir
  Call NAir
elif Equal lastAttack valFAir
  Call FAir
elif Equal lastAttack valBAir
  Call BAir
elif Equal lastAttack valUAir
  Call UAir
elif Equal lastAttack valDAir
  Call DAir
elif Equal lastAttack valNSpAir
  Call NSpecialAir
elif Equal lastAttack valSSpAir
  Call SSpecialAir
elif Equal lastAttack valUSpAir
  Call USpecialAir
elif Equal lastAttack valDSpAir
  Call DSpecialAir
elif Equal lastAttack hex(0x8008)
  Call FakeOutHub
endif
Return
Return