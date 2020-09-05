// APPROACH HUB
// controls which approach to use when pursuing a target location
#include <Definition_AIMain.h>
id 0x8001

unk 0x0

lastScript = hex(0x8001)

// these work together to only dashdance if not in a tech-chase situation
IF_O_IS_TECHING
else
  DASHDANCE
endif

// clals distance to the target
CALC_TARGET_DISTANCES

#let absTargetXDistance = var0
#let absTargetYDistance = var1

// targetXDistance and targetYDistance come from the macro
absTargetXDistance = targetXDistance
absTargetYDistance = targetYDistance
Abs absTargetXDistance
Abs absTargetYDistance
// if we're not jumping
if !(Equal CurrSubaction JumpSquat)
  // if we want to perform an aerial, jump with respect to the
  // move_hitFrame (that's a really poor name for it tbh lol)
  // to attempt to get there by the time the move's hitbox is out
  var2 = targetXDistance - (XSpeed * move_hitFrame / 2)
  Abs var2
  if Equal AirGroundState 1 && CurrAction <= 9
    if var2 <= move_xRange && lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F)
      Button X
    elif Rnd <= 0.02 && lastAttack >= hex(0x6031) && lastAttack <= hex(0x603F) && XDistLE 20 40 && Equal OFramesHitstun 0
      // randomly perform tomhawk stuff if using a grounded move and not comboing
      Call mix_tomhawkJump
    endif
  elif CanJump && Rnd <= 0.04 && lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F) && Equal IsOnStage 1 && TopNY > OTopNY
    // randomly double-jump aerial instead of going straight for the aerial
    Call mix_doubleJump
  endif

  if absTargetXDistance <= move_xRange && absTargetYDistance <= move_yRange
    // otherwise we just straight-up go to the attack performing section if
    // we're in range
    Goto CallAttacks
  endif
endif

#let nearCliffX = var2
#let nearCliffY = var3
GetNearestCliff nearCliffX
nearCliffY = nearCliffY - TopNY * -1
// before continuing, checks currently location and situation
// this prevents the AI from awkwardly running offstage
if Equal YDistFloor -1 && YSpeed < 0 && nearCliffY < 15
  Call RecoveryHub
elif MeteoChance && !(Equal moveVariant mv_edgeguard)
  Call BlockRecovery
endif

// if we're not in jumpsquat, we want to dash to the location
if absTargetXDistance > move_xRange && Equal AirGroundState 1 && !(Equal CurrSubaction JumpSquat)
  var17 = targetXDistance
  AbsStick var17
  // to ensure we dash, we clear the stick if we're walking for whatever reason
  if Equal CurrAction 1
    ClearStick
  endif
else
  // otherwise...
  var17 = targetXDistance / 10
  if XDistFrontEdge < 10 && Equal OPos Direction
    var17 /= 2
  endif
  AbsStick var17

  // adjusts the trajectory of the jump if the
  // target is moving
  if Equal CurrSubaction JumpSquat
    var0 = OXSpeed * 2
    if OXSpeed > 0.3
      ClearStick
      AbsStick var0 0
    elif OXSpeed < -0.3
      ClearStick
      AbsStick var0 0
    endif
  endif

  if lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F)
    Goto JumpIfInRange
  elif !(SamePlane)
    Goto JumpIfInRange
  endif
endif

// if we're landing or something, we call upon the landing routine (59.as)
if YSpeed < 0 && YDistFloor < 10 && YDistFloor > -1
  var19 = 2
  var18 = 1
  Call Landing
endif
Return

label JumpIfInRange
JUMP_IF_IN_RANGES
Return

label CallAttacks

// if the action requires us to be stopped,
if lastAttack >= hex(0x6031) && lastAttack <= hex(0x6037)
  if Equal CurrAction hex(0x03)
    // stops the dash
    Stick (-1) 0
    Return
  endif
  if Equal CurrAction hex(0x04)
    // interrupts run with crouch for one frame
    Stick 0 (-1)
    Return
  endif
  if !(Equal Direction OPos)
    AbsStick OPos
    Return
  endif
  if InAir
    Call AIHub
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
endif
Return
Return