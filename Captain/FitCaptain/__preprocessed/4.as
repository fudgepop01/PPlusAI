// RECOVERY HUB
// a place for determining the possible recoveries available
#include <Definition_AIMain.h>
id 0x8004

unk 0x0

if !(InAir)
  Call AIHub
endif

// edge range width
// edge range height
// a temporary variable
// a second temporary variable
// will contain the X distance from the ledge
// will contain the Y distance from the ledge

SetVec var1 Zero
// GetNearestCliff stores values in BOTH the target var AND the next var over.
// This means if we input var0, it'll store values in var0 AND var1. The way
// we have the "let" variables above setup, var1 is var1, which means
// var2 will then contain the Y position of the cliff, which is why we name
// var2 var2
GetNearestCliff var1

// draws a debug rectangle around the cliff so we can see a visual of what
// the ranges are
DrawDebugRectOutline var1 var2 60 25 255 255 255 136

// makes var1 and var2 relative to the character's position
var1 = TopNX - var1
var1 *= -1
var2 = var2 - TopNY * -1

// if the opponent is offstage and we're offstage and within the bounds of the rect
// AND we have not yet determined if we can edgeguard the opponent, then check
// and edgeguard if possible
LOGSTR 1768846336 1866819328 0 0 0
if Equal OYDistFloor -1 && var1 <= 60 && var1 >= -60 && var2 >= -25 && !(Equal var18 255)
  var18 = 0
  Call EdgeguardHub
endif
var18 = 0
LOGSTR 1634104320 1701987584 1728053248 0 0

// makes var0 into the distance from the ledge regardless of whether
// the character is on the left or right of it
var0 = var1
Abs var0

// if we're above the ledge...
if var2 > 0
  // and are above it 50 or more units and over 20 units away
  if var2 > 50 && var0 > 30
    // if we can jump
    if CanJump
      // then jump towards the ledge
      if var1 > 0
        AbsStick (-1) 0
      else
        AbsStick 1 0
      endif
      Button X
      Call AIHub
    endif
    // otherwise perform downB
    // (which doesn't seem to be working at the moment big sad)
    if YSpeed < 0
      AbsStick 0 (-1)
      Button B
      Seek bReverseIfNecessary
    endif
    Return
  endif

  // otherwise, drift toward the ledge
  if TopNX < var1
    AbsStick 1 0
  else
    AbsStick (-1) 0
  endif
  if var0 > 10 && var0 < 25 && Equal IsOnStage 0
    Button B
    Seek bReverseIfNecessary
  elif var0 >= 25 && var0 < 50
    Stick 0 0.7
  endif
  Call RecoveryHub
else
  // otherwise, we must be below the ledge...

  // drift toward the ledge
  if var1 > 0
    AbsStick (-1) 0
  else
    AbsStick 1 0
  endif

  var3 = OXDistFrontEdge
  Abs var3

  // after this, tempVar1 will contain the vertical distance to the ledge
  // at which point to perform the next action
  if NoOneHanging
    if Equal OIsOnStage 0 && var3 < var0
      var3 = var0
      var0 = -30
    else
      var3 = var0
      var0 = -55
    endif
  else
    var3 = var0
    var0 = -30
  endif
// var3 now contains the absolute distance to the ledge
  LOGSTR 1919247104 1870030080 1919970304 2046820352 0
  // because i'm not fully sure how OR works here, I just do this lol
  if CanJump && var2 < -25 && var3 > 20
    // if we're beyond 20 units away and under the vertical bounds
    Button X
    Call AIHub
  elif CanJump && var2 < -45 && var3 < 5
    // if we're directly under the ledge then clear the stick's input
    // and jump
    ClearStick
    Button X
    Call AIHub
  elif CanJump && var2 < -65
    // I don't recall exactly what htis does but I assume it's important
    // if it's not important feel free to delete it
    Button X
    Call AIHub
  elif var2 <= var0 && YSpeed < -1
    // this means we can't jump and are falling, at which point we want to
    // perform upB
    AbsStick 0 0.7
    Button B
    Seek bReverseIfNecessary
  endif
endif
Return

// makes sure that the character is facing the ledge
// I get here using Seek because Seek waits 1 frame before actually
// getting here and continuing, giving it time to actually start the
// desired move
label bReverseIfNecessary
var0 = var1 * Direction
if var0 > 0
  Stick (-1)
  Return
endif
if Equal CurrAction 276
  Seek handleUpB
elif Equal CurrAction 275
  Seek handleSideB
elif Equal CurrAction 277
  Seek handleDownB
else
  Call AIHub
endif
Return

// these two aren't super special because you really can't do much with
// them once they're performed
label handleDownB
if !(Equal CurrSubaction DSpecialAir) && !(Equal CurrAction 16)
  Call AIHub
endif

Return

label handleSideB
if !(Equal CurrSubaction SSpecialAir) && !(Equal CurrAction 16)
  Call AIHub
endif

Return

// this one however has a bit more complexity
label handleUpB
// if we are no longer performing upB and aren't in special fall,
// call AIHub
if !(Equal CurrAction 276) && !(Equal CurrAction 16)
  if Equal AirGroundState 1 || Equal CurrAction 14 || Equal CurrAction 15
    Call AIHub
  endif
endif

// otherwise, we get the distance to the ledge on every frame
GetNearestCliff var1
var1 = TopNX - var1
var1 *= -1
var2 = var2 - TopNY * -1

// based on the direction falcon is facing, we want to be in a certain position
// relative to the ledge so we can grab it.
// this is the code that ensures that happens:
if Equal Direction -1
  if var2 > -2
    AbsStick (-1)
  elif var1 > 5
    AbsStick (-1)
  elif var1 < 3
    AbsStick 1
  endif
else
  if var2 > -2
    AbsStick 1
  elif var1 < -5
    AbsStick 1
  elif var1 > -3
    AbsStick (-1)
  endif
endif
Return
Return
