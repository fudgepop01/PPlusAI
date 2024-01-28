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
STACK_PUSH 17 0
STACK_PUSH 6 0
STACK_PUSH 7 0
STACK_PUSH 15 0
STACK_PUSH 9 0
STACK_PUSH 10 0
STACK_PUSH 1 0
STACK_PUSH 0 0
  XGoto GetChrSpecific
  //= XReciever
var16 = 0

var0 *= Scale
var1 *= Scale
var10 *= Scale
var9 *= Scale

// temp until loop
// 1. adjust hitFrame
  STACK_PUSH var22 0
  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var3 = var22
  var22 = STACK_POP
  if Equal var3 1
  if Equal AirGroundState 1
    GetAttribute var23 940; 0
    var15 += var23
  endif
endif

// 2. check if it's worth pursuing this attack
var17 = OAnimFrame - var15 + var7 * 0.5
if OCurrAction >= 78 && OCurrAction <= 82 && 26 > var17
  Return
elif OCurrAction >= 96 && OCurrAction <= 97 && 19 > var17
  Return
elif OCurrAction >= 31 && OCurrAction <= 32 && 19 > var17 // roll
  Return
elif Equal OCurrAction 30 || Equal OCurrAction 142 || Equal OCurrAction 144 || Equal OCurrAction 145
  if 15 > var17 // spotdodge
    Return
  endif
elif Equal OCurrAction 33 && 29 > var17 // airdodge
  Return
elif Equal OCurrSubaction 217 || Equal OCurrSubaction 48
  if 33 > var17 // roll from ledge
    Return
  endif
elif Equal OCurrSubaction 222 || Equal OCurrSubaction 221
  if 61 > var17 // roll from ledge SLOW
    Return
  endif
endif

// 3. setup ranges
var0 = var0 + var10
if var0 < 0
  var16 = 1
  var0 *= -1
endif

var1 = var9 - var1

// grabs an estimate of the potential move xRange to hit
if  Equal var20 21 || Equal var20 22 || Equal var20 23 || Equal var20 24 || Equal var20 25 || Equal var20 26 || Equal var20 27
  var17 = var15 + var7 * 0.25
  if Equal AirGroundState 2
    // get max possilbe air speed
    GetAttribute var22 128; 0
    var23 = var17 * var22
    var17 = var23
    // max possible speed
    var23 += XSpeed
    Abs var23
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
    var22 = var15 + var7 * 0.25
    var23 *= var22
    var10 += var23
    var23 *= Direction * 2
    var0 -= var23
    // negative offset
    var17 *= var22
    var10 += var17
    var17 *= Direction * 2
    var0 += var17
  else
    GetAttribute var22 68; 0
    var22 *= var17
    var10 += var22
    var9 += OHurtboxSize
  endif
endif

var22 = OHurtboxSize * 0.8
var9 += var22
var22 = OWidth * 0.5
var10 += var22

// if OFramesHitstun < 1
//   GetAttribute var22 40; 1
//   PredictOMov var23 14
//   var23 *= var22
//   var10 += var23

//   // var22 *= var23
//   // var22 *= 2

//   if Equal var21 16.3
//     predictAverage var22 10
//     var22 *= 0.75
//     var10 += var22
//     var10 += Width
//   endif
// endif
// LOGVAL_NL var10

if Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18 || Equal var20 19 || Equal var20 20
  if OCurrAction >= 74 && OCurrAction <= 84
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

// $tempVar(dirX, var22)
// GET_CHAR_TRAIT(dirX, 0.001)
if  Equal var20 9 || Equal var20 10 || Equal var20 11 || Equal var20 12 || Equal var20 13 || Equal var20 14
  Abs var0
elif Equal AirGroundState 1
  if var0 < 0 && OPos < 0
  elif var0 > 0 && OPos > 0
  else
    var0 *= -1
  endif
elif var16 > 0
  var0 *= -1
endif


var15 -= 1
var8 = var7

STACK_PUSH var10 1
STACK_PUSH var9 1
STACK_PUSH var0 1
STACK_PUSH var1 1

// LOGSTR 1481768960 0 0 0 0
// LOGVAL var10
// LOGSTR 1498546176 0 0 0 0
// LOGVAL var9
// LOGSTR 1129840640 0 0 0 0
// LOGVAL var0
// LOGSTR 1129906176 0 0 0 0
// LOGVAL var1
// PRINTLN

var16 = -1
if OCurrAction >= 256

  var22 = OCurrAction + 256
  RetrieveFullATKD var3 var22 var22 var22 var22 var22 var22 var22 1
  var16 = var3
endif

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

  var22 = LTF_STACK_READ * -1 // var0
  var23 = TotalXSpeed * var2
  var17 = 0
if  Equal var20 9 || Equal var20 10 || Equal var20 11 || Equal var20 12 || Equal var20 13 || Equal var20 14
    var17 = 1
    var22 *= OPos
  endif
if  Equal var20 10 || Equal var20 14 || Equal var20 21 || Equal var20 22 || Equal var20 23 || Equal var20 24 || Equal var20 25 || Equal var20 26 || Equal var20 27
    if Equal var17 0
      var22 *= Direction
    endif
    if Equal AirGroundState 1
      GetAttribute var17 76; 0
      var23 *= var17
    endif
  else
    var23 = 0
  endif
  var23 += TopNX
  var23 -= var22

  STACK_PUSH var23 0

  var23 = TopNY
  if Equal AirGroundState 1
if  Equal var20 10 || Equal var20 14 || Equal var20 21 || Equal var20 22 || Equal var20 23 || Equal var20 24 || Equal var20 25 || Equal var20 26 || Equal var20 27
      GetAttribute var22 84; 0
      var17 = TopNY + var22
      var14 = TopNY + 12.03 - 5
      if var17 < OTopNY
        GetAttribute var22 72; 0
        var14 = TopNY + 58.8 - 5
      endif
      CalcYChange var23 var2 var22 Gravity MaxFallSpeed FastFallSpeed 0
      var23 += TopNY
    else
      var23 = TopNY
    endif
  elif AnimFrame <= 5
    // MARKER THINGY HERE
    CalcYChange var23 var2 CharYSpeed Gravity MaxFallSpeed FastFallSpeed 0
    var23 += TopNY
  else
    EstYCoord var23 var2
  endif
  var23 -= LTF_STACK_READ // var1
  STACK_PUSH var23 0

  // NOTE visualization SELF
  // var17 = STACK_POP // YPos
  // var22 = STACK_POP // XPos
  // // LOGSTR_NL 1347375104 1346716672 0 0 0
  // // LOGVAL_NL var22
  // var23 = 255 - var2 * 5
  // var4 *= 0.5
  // var5 *= 0.5
  // DrawDebugRectOutline var22 var17 var4 var5 200 255 0 var23
  // var4 *= 2
  // var5 *= 2
  // STACK_PUSH var22 0
  // STACK_PUSH var17 0



var10 = OHurtboxSize * 0.8
// 2. where will defender be at end of frame
  if var16 < 0

    if OCurrAction > 32 && OAnimFrame > 3
      EstOXCoord var23 var2
    else
      var23 = OTopNX + OTotalXSpeed * var2
    endif
    STACK_PUSH var23 0


    if Equal OAirGroundState 2
      if OAnimFrame <= 3 && !(Equal OYSpeed 0)
        CalcYChange var23 var2 OYSpeed OGravity OMaxFallSpeed OFastFallSpeed 0
        var23 += OTopNY
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
    var23 += var10
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
    var23 += var10
    STACK_PUSH var23 0
  endif

  // NOTE visualization OTHER
  // var17 = STACK_POP // YPos
  // var22 = STACK_POP // XPos
  // var23 = 255 - var8 * 5
  // DrawDebugRectOutline var22 var17 OWidth var10 255 0 255 var23
  // // LOGSTR 1886351360 1885692928 0 0 0
  // // LOGVAL var22
  // // PRINTLN
  // STACK_PUSH var22 0
  // STACK_PUSH var17 0

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
if Equal var20 0 || Equal var20 1 || Equal var20 3 || Equal var20 4 || Equal var20 5 || Equal var20 6 || Equal var20 8
    if Equal CurrAction 3
      STACK_TOSS 1 // ignore var23

      var22 = var10 - XSpeed * (AnimFrame - 9)
      Abs var22
      Abs var10
      Abs var11
      if var22 <= var4 && var11 <= var5
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

    var23 = 15 + OXSpeed
    var22 = var10 - var23
    Abs var22
    if var22 <= var4 && var11 <= var5 && var21 < 16.7
      if Equal CurrAction 3 || Equal CurrAction 8 || Equal CurrAction 9
        if AnimFrame < -1 || Equal CurrAction 8 || Equal CurrAction 9
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
  STACK_PUSH var22 0
  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var3 = var22
  var22 = STACK_POP
  if Equal var3 1

      Abs var11
      STACK_PUSH var16 0
      STACK_PUSH var11 0
      // LOGSTR 2032165888 1768318464 0 0 0
      // LOGVAL var11
  var17 = var2
  if Equal CurrSubaction JumpSquat || Equal AirGroundState 1
    GetAttribute var22 940; 0
    var17 -= var22
    GetAttribute var22 84; 0
  else
    var22 = CharYSpeed
  endif
  CalcYChange var10 var17 var22 Gravity MaxFallSpeed FastFallSpeed 1
  
      var22 = TopNY + var10 - var1
      // VIS FASTFALL
      // var5 *= 0.5
      // var4 *= 0.5
      // DrawDebugRectOutline OTopNX var22 var4 var5 255 0 255 221
      // var5 *= 2
      // var4 *= 2

      var11 = var9 - var22
      Abs var11
      if var11 <= var5
  var17 = var15 + var7 - var8
  if Equal CurrSubaction JumpSquat || Equal AirGroundState 1
    GetAttribute var22 940; 0
    var17 -= var22
    GetAttribute var22 84; 0
  else
    var22 = CharYSpeed
  endif
  CalcYChange var10 var17 var22 Gravity MaxFallSpeed FastFallSpeed 1
        var16 = 1
        CalcYChange var10 var6 YSpeed Gravity MaxFallSpeed FastFallSpeed 1
        Goto checkCanEdgeguard
        if var22 > 0
          Goto checkIfAirViable // fastfall
        endif
      endif
      // LOGSTR 1717960704 0 0 0 0
      // LOGVAL var11
      PRINTLN
      var11 = STACK_POP // original var11
      CalcYChange var10 var6 YSpeed Gravity MaxFallSpeed FastFallSpeed 0
      Goto checkCanEdgeguard
      if var22 < 0
        var20 = -1
        Return
      endif
      if var11 <= var5
        var16 = 0
        Goto checkIfAirViable // normal
      endif
      
      var16 = STACK_POP
    elif Equal AirGroundState 1 && var11 <= var5
      // handle run for idle ground moves
      if Equal CurrAction 4
if Equal var20 0 || Equal var20 1 || Equal var20 3 || Equal var20 4 || Equal var20 5 || Equal var20 6 || Equal var20 8
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
    var22 = OSCDBottom - var23
    if var22 > OYDistFloor
      var23 = OSCDBottom - OYDistFloor
    endif
  endif
Return
label checkCanEdgeguard

  var22 = XSpeed * var8 * 1.2
  if Equal var16 1
    var22 *= 0.7
  endif
  var22 += OPos
  GetYDistFloorOffset var22 var22 5 0
  if Equal var22 -1 || Equal YDistFloor -1 || var21 >= 16.7 && Equal OYDistFloor -1
  var22 = 18
  XGoto GetChrSpecific
  //= XReciever
var23 = var22
    var23 *= -1
    if Equal AirGroundState 2
      var17 = OTopNY + OYDistBackEdge
      LOGVAL var17
      var22 = TopNY + var10
      var17 += var22
      if var17 > var23 || !(DangerEnabled)
      else
        var22 = -1
        Return
      endif
    endif
  endif
  var22 = 1
Return
label checkIfAirViable
  if Equal CurrAction 10
  elif Equal AirGroundState 1

  var22 = 0.001
  XGoto GetChrSpecific
  //= XReciever
if  Equal var20 9 || Equal var20 10 || Equal var20 11 || Equal var20 12 || Equal var20 13 || Equal var20 14
      if NoJumpPrevFrame
        Button X
      endif
    elif Equal var22 -1 && Equal Direction OPos
      var16 = -99
      ClearStick
      Stick -1
    elif !(Equal var22 -1) && !(Equal Direction OPos)
      var16 = -99
      ClearStick
      Stick -1
    elif NoJumpPrevFrame
      Button X
    endif
  elif !(Equal AirGroundState 3)
    CallI ExecuteAttack
  endif
Return
Return
