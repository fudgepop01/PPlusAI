#include <Definition_AIMain.h>
id 0x850D
unk 0x0

//= XReciever

// $setLastAttack(dtilt)

// where will attacker be at end of frame
// where will defender be at end of frame
// apply positional offset to defender position
// check to see if move will hit if swung now

// CLEAR VARIABLES:
// 9, 10, 11, 12


  var22 = 19
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 6 0
STACK_PUSH 7 0
STACK_PUSH 15 0
STACK_PUSH 9 0
STACK_PUSH 10 0
STACK_PUSH 1 0
STACK_PUSH 0 0
STACK_PUSH 17 0
  XGoto GetChrSpecific
  //= XReciever

var11 = var0 + var10
var12 = var9 - var1
var12 *= -1

// grabs an estimate of the potential move xRange to hit
if !(True) || Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25|| Equal var20 26|| Equal var20 27
  // get max possilbe air speed
  GetAttribute var22 128; 0
  var17 = var15 + var7 * 0.5
  var23 = var17 * var22
  var17 = var23
  // max possible speed
  var23 += XSpeed
  // min possible speed
  var17 -= XSpeed
  Abs var17
  // clamp by term vel
  GetAttribute var22 136; 0
  if var23 > var22
    var23 = var22
  endif
  if var17 > var22
    var17 = var22
  endif
  // positive offset
  var22 = var15 + var7 * 0.5
  var23 *= var22
  var10 += var23
  var23 *= Direction
  var11 += var23
  // negative offset
  var17 *= var22
  var10 += var17
  var23 *= Direction
  var11 -= var17
endif



var16 = -1
if OCurrAction >= 256

  var22 = OCurrAction + 256
  RetrieveFullATKD var3 var22 var22 var22 var22 var22 var22 var22 1
  var16 = var3
endif


var17 = var15 - OAnimFrame
if OCurrAction >= 78 && OCurrAction <= 82 && 26 < var17
  Return
elif OCurrAction >= 96 && OCurrAction <= 97 && 19 < var17
  Return
elif OCurrAction >= 31 && OCurrAction <= 32 && 19 < var17 // roll
  Return
elif Equal OCurrAction 30 || Equal OCurrAction 142 || Equal OCurrAction 144 || Equal OCurrAction 145
  if 15 < var17 // spotdodge
    Return
  endif
elif Equal OCurrAction 33 && 29 < var17 // airdodge
  Return
elif Equal OCurrSubaction 217 || Equal OCurrSubaction 48
  if 33 < var17 // roll from ledge
    Return
  endif
elif Equal OCurrSubaction 222 || Equal OCurrSubaction 221
  if 61 < var17 // roll from ledge SLOW
    Return
  endif
endif

// if Equal OCurrAction 77
//   var9 += 3
//   var1 += 3
// endif

// $ifAerialAttack()
// else
//   var22 = var9 * 2 - var1
//   if var22 <= HurtboxSize && OYDistFloor > HurtboxSize && OYSpeed > 0
//     var20 = -1
//     Return
//   endif
//   var22 = var0 * 0.25 - var10 * 0.5
//   if XDistLE var22
//     var20 = -1
//     Return
//   endif
// endif

var9 += OHurtboxSize
var22 = OHurtboxSize
var12 += var22
var10 += OWidth
var22 = OWidth * 0.25
var11 -= var22

// var22 = 10
// // if var21 >= 16.7
// //   var22 = (var7 + var15) * 0.15
// // endif
// if Equal var21 16.41
//   var9 += var22
//   // var1 += var22
//   var10 += var22
//   // var0 -= var22
// endif 

if Equal var21 16.3 && OFramesHitstun < 1
  if var6 > 120
    var20 = -1
    Return
  endif
  var23 = var10 + var0
  var23 -= Width
  if var23 > 0
    var10 += var23
  elif True
    GetAttribute var22 40; 1
    var22 *= var6
    var22 -= OWidth
    var22 *= 0.5
    var10 += var22
  endif
  // var22 *= 0.5
  // var9 += var22
  // var1 += var22
endif

  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var3 = var22
  if Equal var3 1
  if Equal AirGroundState 1
    var10 += 5
    // var0 -= 5
  endif
endif

if !(True) || Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18 || Equal var20 19 || Equal var20 20
  if Equal OCurrAction 74 || Equal OCurrAction 77 || Equal OCurrAction 83 || Equal OCurrAction 84
    Return
  endif
  var7 = 1
endif

// if OCurrAction >= 68 && OCurrAction <= 73 || Equal OCurrAction 66
//   var22 = var9 - var1
//   if OYDistFloor < var22 && OYSpeed < 0 && OYDistFloor > 1
//     Return
//   endif
// endif

// CLEAR VARIABLES:
// 9, 10, 11, 12


var15 -= 1
var8 = var7

STACK_PUSH var10 1
STACK_PUSH var9 1
STACK_PUSH var11 1
STACK_PUSH var12 1

// var1 *= -1

LOGSTR 1481768960 0 0 0 0
LOGVAL var10
LOGSTR 1498546176 0 0 0 0
LOGVAL var9
LOGSTR 1129840640 0 0 0 0
LOGVAL var11
LOGSTR 1129906176 0 0 0 0
LOGVAL var12
PRINTLN


if !(True)
  label CHECK_HIT_LOOP
endif

RESET_LTF_STACK_PTR

var4 = LTF_STACK_READ
var5 = LTF_STACK_READ

if var8 < 0
  var8 = 0
  SeekNoCommit CHECK_HIT_LOOP
endif

var2 = var8
var2 += var15
// LOGSTR 1702065152 1768759296 1718771968 1835335680 0
// LOGVAL var2
// PRINTLN

// 1. where will attacker be at end of frame

  {SELF_X_ADJUST}
  STACK_PUSH var23 0

  {SELF_Y_ADJUST}
  STACK_PUSH var23 0

  // NOTE visualization SELF
  var17 = STACK_POP // YPos
  var22 = STACK_POP // XPos
  // LOGSTR_NL 1347375104 1346716672 0 0 0
  // LOGVAL_NL var22
  var23 = 255 - var2 * 5
  DrawDebugRectOutline var22 var17 var4 var5 200 255 0 var23
  STACK_PUSH var22 0
  STACK_PUSH var17 0

// 2. where will defender be at end of frame
  if var16 < 0

    var23 = OTopNX + OTotalXSpeed * var2
    // if OAnimFrame <= 3
    // else
    //   EstOXCoord var23 var2
    // endif
    STACK_PUSH var23 0


    if Equal OAirGroundState 2
      if OAnimFrame <= 3 && !(Equal OYSpeed 0)
        var23 = OSCDBottom + OTotalYSpeed * var2 - OGravity * var2 * var2
      else
        EstOYCoord var23 var2
      endif
    else
      var23 = OTopNY
    endif
    // if OYDistBackEdge > 5
    //   if var23 < 0
    //     var23 = 0
    //   endif
    //   var5 += var23
    // endif
    Goto adjustPosIfInGround
    STACK_PUSH var23 0
  elif True


    var22 = OTopNX
    var23 = OTopNY
    var17 = var2
  STACK_PUSH var0 0
  STACK_PUSH var1 0
  STACK_PUSH var2 0
  STACK_PUSH var3 0
  STACK_PUSH var4 0
  STACK_PUSH var5 0
  STACK_PUSH var6 0
STACK_PUSH 23 0
STACK_PUSH 22 0
  STACK_PUSH var17 0
  var22 = 22
  XGoto GetChrSpecific
  var6 = STACK_POP
  var5 = STACK_POP
  var4 = STACK_POP
  var3 = STACK_POP
  var2 = STACK_POP
  var1 = STACK_POP
  var0 = STACK_POP

    STACK_PUSH var22 0
    Goto adjustPosIfInGround
    STACK_PUSH var23 0
  endif

  // NOTE visualization OTHER
  var17 = STACK_POP // YPos
  var22 = STACK_POP // XPos
  var23 = 255 - var2 * 5
  DrawDebugRectOutline var22 var17 OWidth OHurtboxSize 255 0 255 var23
  STACK_PUSH var22 0
  STACK_PUSH var17 0

// stack: 
// estOYPos, estOXPos, var23, var23, var14, var13, var10, var9

// 3. apply positional offset to defender position
  // FIXME come up with a better strategy for setAttackGoal
  // $tempVar(estOYPosOffs, var23)
  // estOYPosOffs = OTopNY - var14
  // estOYPosOffs += STACK_POP // estOYPos
  // $tempVar(estOXPosOffs, var22)
  // estOXPosOffs = OTopNX - var13
  // estOXPosOffs += STACK_POP // estOXPos
  // STACK_PUSH estOXPosOffs 0
  // STACK_PUSH estOYPosOffs 0

// check to see if move will hit if swung now
  var9 = STACK_POP // var9

  var10 = STACK_POP // estOXPos

  var11 = var9 - STACK_POP // var23
  Abs var11

  // var4 *= 1
  // var5 *= 1

  // LOGSTR_NL 2018654976 544821760 991983872 1140850688 0
  // LOGVAL var4
  // LOGVAL var5
  // LOGVAL var11
  // PRINTLN
  // handle dash for idle ground moves:
if !(True)  || Equal var20 0 || Equal var20 1 || Equal var20 3 || Equal var20 4 || Equal var20 5 || Equal var20 6 || Equal var20 8
    if Equal CurrAction 3
      STACK_TOSS 1 // ignore var23

      var10 = var10 - XSpeed * (AnimFrame - 9)
      Abs var10
      if var10 <= var4 && var11 <= var5
        label runWait
          XGoto PerFrameChecks
          Seek runWait
          ClearStick
          Stick 1
          if Equal CurrAction 4 || Equal CurrAction 1
            Seek crouchWait
            Jump
          endif
        Return
      endif
    endif

    var23 = var10 - 15
    var22 = OXSpeed
    Abs var22
    if var23 <= var4 && var22 <= var5 && var21 < 16.7
      if Equal CurrAction 3 || Equal CurrAction 8 || Equal CurrAction 9
        if AnimFrame < 6 || Equal CurrAction 8 || Equal CurrAction 9
          var16 = 5
          var15 = -2
          CallI Wavedash 
        endif
      endif
    endif
  endif
  
  var12 = STACK_POP // var23
  var10 -= var12
  Abs var10
  // LOGSTR_NL 2017722368 0 0 0 0
  // LOGVAL_NL var10
  
  if var10 < var4
  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var3 = var22
  if Equal var3 1

      
      STACK_PUSH var11 0
  var17 = var15 + var7 - var8 + 1
  if Equal CurrSubaction JumpSquat
    GetAttribute var22 84; 0
  else
    var22 = YSpeed
  endif
  CalcYChange var10 var17 var22 Gravity MaxFallSpeed FastFallSpeed 1
      var11 = var9 - var10
      Abs var11
      if var11 <= var5
        var16 = 1
        CalcYChange var10 var6 YSpeed Gravity MaxFallSpeed FastFallSpeed 1
        Goto checkIfAirViable // fastfall
      endif

      var11 = STACK_POP // original var11
      if var11 <= var5
        var16 = 0
        CalcYChange var10 var6 YSpeed Gravity MaxFallSpeed FastFallSpeed 0
        Goto checkIfAirViable // normal
      endif
    elif Equal AirGroundState 1 && var11 <= var5
      // handle run for idle ground moves
      if Equal CurrAction 4
if !(True)  || Equal var20 0 || Equal var20 1 || Equal var20 3 || Equal var20 4 || Equal var20 5 || Equal var20 6 || Equal var20 8
          label crouchWait
            XGoto PerFrameChecks
            //= XReciever
            Seek crouchWait
            if !(Equal CurrAction 4)
              var15 = -2
              Call MainHub
            endif
            ClearStick
            AbsStick 0 (-0.6)
          Return
        endif
      endif


      Goto updateGoals
      CallI ExecuteAttack
    endif
  endif

if var8 > 0
  var8 -= 1
  SeekNoCommit CHECK_HIT_LOOP
endif

var15 = 0
Return
label adjustPosIfInGround

  if OYDistFloor > 0
    var22 = OTopNY - var23
    if var22 > OYDistFloor
      var23 = OTopNY - OYDistFloor
    endif
  endif
Return
label checkIfAirViable

  var22 = XSpeed * var8 * 1.2
  var17 = OPos * 10
  var22 += var17
  GetYDistFloorOffset var22 var22 5 0
  if Equal var22 -1 || Equal YDistFloor -1
    if OXDistBackEdge > 20 && OYDistBackEdge > 15
  var22 = 18
  XGoto GetChrSpecific
  //= XReciever
var23 = var22
      var23 *= -1
    else
      var23 = -48.8
    endif
    if Equal AirGroundState 2
      var17 = OTopNY + OYDistBackEdge
      var22 = TopNY + var10
      var17 += var22
      LOGSTR 1717856512 1936993280 544366848 1852269824 0
      LOGVAL var17
      LOGVAL var23
      PRINTLN
      if var17 > var23 || !(DangerEnabled)
        Goto updateGoals
        CallI ExecuteAttack
      elif Equal var16 0
        var20 = -1
      endif
    endif
  elif Equal AirGroundState 2
    Goto updateGoals
    CallI ExecuteAttack
  endif
Return
label updateGoals
  // #let var23 = var9
  // #let var12 = var12

  // var13 = var12
  // var22 = var0 * OPos * -0.5
  // $ifAerialAttackNotSpecial()
  //   var22 *= Direction
  // endif
  // var13 -= var22

  // var14 = var23
  // var14 -= var1
  // var14 -= OHurtboxSize
Return
Return
