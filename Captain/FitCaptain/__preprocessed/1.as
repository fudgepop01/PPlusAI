// APPROACH HUB
// controls which approach to use when pursuing a target location
#include <Definition_AIMain.h>
id 0x8001

unk 0x0

var21 = 32769

// these work together to only dashdance if not in a tech-chase situation
  var5 = OCurrAction
  if Equal var5 78 || Equal var5 80 || Equal var5 82 || Equal var5 96 || Equal var5 97

else
  var0 = (Rnd * 15) - 10
  var1 = (Rnd * 15) + 3
  label _dashdance
  if Equal AirGroundState 1 && var0 > 0 && Equal OFramesHitstun 0 && DistFrontEdge > 7 && !(ODistLE 4)
    if AnimFrame >= var1 && Equal CurrAction 3
      var0 = var0 - 1
      Stick (-1)
    else
      Stick 1
      if !(CurrAction <= 1) && !(Equal CurrAction 7)
        ClearStick
      endif
    endif
    Return
  endif
  label _dashdanceEnd

endif

// clals distance to the target
  DrawDebugPoint TopNX TopNY 255 0 0 85
  if Equal CurrAction 7
    var5 = OTopNX + (var9 * Direction)
  else
    var5 = OTopNX + (var9 * Direction * -1)
  endif
  var6 = OTopNY + var10
  // account for target's & own velocity
  var5 = var5 + (OXSpeed * 10) - (XSpeed * var13 / 2)
  if YSpeed < 0.10 && YDistFloor > 10 && TopNY > OTopNY
    var6 = var6 + (OYSpeed * var13 / 2) - ((YSpeed - 1) * var13 / 2) + OHurtboxSize
  else
    var6 = var6 + (OYSpeed * var13 / 2) - (YSpeed * var13 / 2)
  endif
  if Equal PlayerNum 0
    DrawDebugRectOutline var5 var6 var11 var12 255 0 0 85
  elif Equal PlayerNum 1
    DrawDebugRectOutline var5 var6 var11 var12 0 0 255 85
  elif Equal PlayerNum 2
    DrawDebugRectOutline var5 var6 var11 var12 255 255 0 85
  elif Equal PlayerNum 3
    DrawDebugRectOutline var5 var6 var11 var12 0 255 0 85
  else
    DrawDebugRectOutline var5 var6 var11 var12 0 0 0 85
  endif
  DrawDebugPoint var5 var6 255 0 0 85
  var5 = var5 - TopNX
  var6 = var6 - TopNY



// var5 and var6 come from the macro
var0 = var5
var1 = var6
Abs var0
Abs var1
// if we're not jumping
if !(Equal CurrSubaction JumpSquat)
  // if we want to perform an aerial, jump with respect to the
  // var13 (that's a really poor name for it tbh lol)
  // to attempt to get there by the time the move's hitbox is out
  var2 = var5 - (XSpeed * var13 / 2)
  Abs var2
  if Equal AirGroundState 1 && CurrAction <= 9
    if var2 <= var11 && var20 >= 24641 && var20 <= 24655
      Button X
    elif Rnd <= 0.02 && var20 >= 24625 && var20 <= 24639 && XDistLE 20 40 && Equal OFramesHitstun 0
      // randomly perform tomhawk stuff if using a grounded move and not comboing
      Call mix_tomhawkJump
    endif
  elif CanJump && Rnd <= 0.04 && var20 >= 24641 && var20 <= 24655 && Equal IsOnStage 1 && TopNY > OTopNY
    // randomly double-jump aerial instead of going straight for the aerial
    Call mix_doubleJump
  endif

  if var0 <= var11 && var1 <= var12
    // otherwise we just straight-up go to the attack performing section if
    // we're in range
    Goto CallAttacks
  endif
endif

GetNearestCliff var2
var3 = var3 - TopNY * -1
// before continuing, checks currently location and situation
// this prevents the AI from awkwardly running offstage
if Equal YDistFloor -1 && YSpeed < 0 && var3 < 15
  Call RecoveryHub
elif MeteoChance && !(Equal var19 255)
  Call BlockRecovery
endif

// if we're not in jumpsquat, we want to dash to the location
if var0 > var11 && Equal AirGroundState 1 && !(Equal CurrSubaction JumpSquat)
  var17 = var5
  AbsStick var17
  // to ensure we dash, we clear the stick if we're walking for whatever reason
  if Equal CurrAction 1
    ClearStick
  endif
else
  // otherwise...
  var17 = var5 / 10
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

  if var20 >= 24641 && var20 <= 24655
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
  if var6 > 10 && Equal AirGroundState 1 && CurrAction <= 9
    Button X
  endif
  if var6 > 22 && Equal CurrSubaction JumpSquat
    Button X
  endif
  if var6 > 35 && var6 < 55 && Equal AirGroundState 2 && YDistFloor > 20 && CanJump
    Button X
  endif

Return

label CallAttacks

// if the action requires us to be stopped,
if var20 >= 24625 && var20 <= 24631
  if Equal CurrAction 3
    // stops the dash
    Stick (-1) 0
    Return
  endif
  if Equal CurrAction 4
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
endif
Return
Return
