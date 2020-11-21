// APPROACH HUB
// controls which approach to use when pursuing a target location
#include <Definition_AIMain.h>
id 0x8001

unk 0x0

SetTimeout 400

MESS_MOVE_PARAMS(var0)

// this is used to detect when the target x position has passed through falcon, such as when changing direction or something
#let prevTargetXDistance = var7

prevTargetXDistance = hex(0xFFFF)

label
// these work together to only dashdance if not in a tech-chase situation
IF_O_IS_TECHING
elif Equal lastScript hex(0x8F00)
else
  DASHDANCE(var0, var1)
endif

label

lastScript = hex(0x8001)

// literally an edge case
if Equal OAirGroundState 3 && TopNY > OTopNY && !(Equal moveVariant mv_edgeguard)
  Call EdgeguardHub
endif

// nothing else uses it YET so I GUESS IT WORKS FOR NOW......
#let tempVar = var17

#let absTargetXDistance = var0
#let absTargetYDistance = var1

#let prevTargetXDistance = var7

// clacs distance to the target
CALC_TARGET_DISTANCES(var5, var6, var3, var4, move_hitFrame, _oCalc, _sCalc)

// targetXDistance and targetYDistance come from the macro
absTargetXDistance = targetXDistance
absTargetYDistance = targetYDistance
Abs absTargetXDistance
Abs absTargetYDistance
// if we're not jumping
if !(Equal CurrSubaction JumpSquat)
  // this "tempVar" is only "defined" locally within this scope
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
  tempVar = targetXDistance + (XSpeed * move_hitFrame)
  Abs tempVar
  if Equal AirGroundState 1 && CurrAction <= 9
    if tempVar <= move_xRange && lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F) && targetYDistance >= 0
      Button X
    elif localTempVar <= move_xRange && lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F) && targetYDistance >= 0
      Button X
    elif Rnd <= 0.02 && lastAttack >= hex(0x6031) && lastAttack <= hex(0x603F) && XDistLE 20 40 && Equal OFramesHitstun 0 && targetYDistance >= 0
      // randomly perform tomhawk stuff if using a grounded move and not comboing
      Call mix_tomhawkJump
    elif Rnd <= 0.02 && Equal lastAttack hex(0x8008) && targetYDistance >= 0
      Call mix_tomhawkJump
    endif
  elif CanJump && Rnd <= 0.02 && lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F) && Equal IsOnStage 1 && TopNY > OTopNY
    // randomly double-jump aerial instead of going straight for the aerial
    Call mix_doubleJump
  elif CanJump && Rnd <= 0.01 && Equal lastAttack hex(0x8008) && TopNY > OTopNY
    Call mix_doubleJump
  endif

  if absTargetXDistance <= move_xRange
    Goto XDistCheckPassed
    tempVar = TopNY - OTopNY
    Abs tempVar
    if XDistLE 35 && tempVar <= 40 && OAttacking && Equal AirGroundState 1
      Call Unk3020
    endif
  elif localTempVar <= move_xRange
    Goto XDistCheckPassed
  endif
endif

#let isGoingOffstage = var2
GOING_OFFSTAGE(var2, var3, 4)

#let nearCliffX = var3
#let nearCliffY = var4
GetNearestCliff nearCliffX
nearCliffY *= -1
nearCliffY = nearCliffY - TopNY * -1
// before continuing, checks currently location and situation
// this prevents the AI from awkwardly running offstage
if !(Equal isGoingOffstage 0) && YSpeed < -1 && nearCliffY < -20
  Call RecoveryHub
elif MeteoChance && !(Equal moveVariant mv_edgeguard) && Equal IsOnStage 1
  Call BlockRecovery
endif


if YSpeed < 0.2 && YDistBackEdge < -1 && YDistBackEdge > -10 && lastAttack >= hex(0x6031) && lastAttack <= hex(0x6037) && tempVar < 6 && !(Equal tempVar -1)
  tempVar = targetXDistance / 10
  AbsStick tempVar (-1)
  Button R
endif

// now that the calculations using these are over with, we'll store them
// for the next frame
prevTargetXDistance = targetXDistance

// if we're not in jumpsquat, we want to dash to the location
if absTargetXDistance > move_xRange && Equal AirGroundState 1 && !(Equal CurrSubaction JumpSquat)
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

// if we're landing or something, we call upon the landing routine (59.as)
// if YSpeed < 0 && YDistFloor < 10 && YDistFloor > -1
//   var19 = 2
//   var18 = 1
//   Call Landing
// endif
Return

label JumpIfInRange
JUMP_IF_IN_RANGES(var6)
Return

label XDistCheckPassed
if absTargetYDistance <= move_yRange
  #let approxDist = var4
  CALC_SELF_Y_CHANGE_GRAVITY(var4, var3, move_IASA, l_test)
  approxDist = (YDistFrontEdge * -1) - approxDist

  #let isGoingOffstage = var2
  GOING_OFFSTAGE(var2, var3, move_IASA)


  if lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F)
    if CanJump && !(Equal isGoingOffstage 0) && approxDist < -80
      // DrawDebugRectOutline TopNX TopNY 5 25 color(0xFFFF0088)
    elif !(Equal isGoingOffstage 0) && approxDist < -52
      // DrawDebugRectOutline TopNX TopNY 5 25 color(0xFF00FF88)
    else
      Goto CallAttacks
    endif
  elif Equal AirGroundState 1
    // otherwise we just straight-up go to the attack performing section if
    // we're in range
    Goto CallAttacks
  endif
endif
Return

label CallAttacks

// if the action requires us to be stopped,
if lastAttack >= hex(0x6031) && lastAttack <= hex(0x6037)
  if Equal CurrAction hex(0x03)
    // stops the dash
    Button X
    Return
  endif
  if Equal CurrAction hex(0x04)
    // interrupts run with crouch for one frame
    Stick 0 (-1)
    Return
  endif
  if !(Equal Direction OPos)
    tempVar = OPos * 0.5
    AbsStick tempVar
    Return
  endif
  if Equal CurrAction hex(0x0A) || Equal CurrAction hex(0x16)
    Return
  endif
  if InAir && YDistBackEdge > -10 && YDistBackEdge <= 0
    if LevelValue <= LV7
      if Rnd < 0.4
        Button R
        AbsStick targetXDistance (-1)
      endif
    else
      Button R
      AbsStick targetXDistance (-1)
    endif
    Return
  elif !(Equal AirGroundState 1)
    Call AIHub
  endif
  if !(CurrAction <= hex(0x09))
    Return
  endif
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