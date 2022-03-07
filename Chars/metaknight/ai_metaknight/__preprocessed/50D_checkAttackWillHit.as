#include <Definition_AIMain.h>
id 0x850D
unk 0x0

XReciever

  var22 = 19
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 6 0
STACK_PUSH 7 0
STACK_PUSH 8 0
STACK_PUSH 9 0
STACK_PUSH 10 0
STACK_PUSH 11 0
STACK_PUSH 12 0
STACK_PUSH 0 0
  XGoto GetChrSpecific
  XReciever

var17 = 23 - var8
if OAnimFrame < var17
  if OCurrAction >= 78 && OCurrAction <= 82
    Return
  elif OCurrAction >= 96 && OCurrAction <= 97
    Return
  endif
endif

if !(True) || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18
  if Equal OCurrAction 74 || Equal OCurrAction 77 || Equal OCurrAction 83 || Equal OCurrAction 84
    Return
  endif
endif

if OCurrAction >= 68 && OCurrAction <= 73 || Equal OCurrAction 66
  var22 = var9 - var11 
  if OYDistFloor < var22 && OYSpeed < 0 && OYDistFloor > 1
    Return
  endif
endif 

var7 += var8

if !(True) || Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25
else
  var7 = var8
endif

var7 -= 1
var8 -= 1


if !(True)
  label CHECK_HIT_LOOP
endif

var2 = var13
var3 = var14
var4 = var10
var5 = var9

// adjust to O center
var23 = OHurtboxSize
var5 += var23
var23 = OWidth
var4 += var23

// var23 = Width * 0.5
// var2 -= var23
// var23 = HurtboxSize * 0.5
// var3 -= var23

var23 = OTopNX - OCenterX
var2 -= var23

// var2 -= var23
// if TopNX < OTopNX
//   var2 += var23
// else 
//   var2 -= var23
// endif

// var23 = CenterY - TopNY
// var3 -= var23

var23 = OCenterY - OTopNY
var3 += var23

// var3 -= var23
// if TopNY <= OTopNY
//   var3 -= var23
// else 
//   var3 += var23
// endif

  if var7 < var8
    var7 = var8
    SeekNoCommit CHECK_HIT_LOOP
  endif

  var17 = var7

  if Equal AirGroundState 1
if !(True) || Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25
      GetAttribute var22 84; 0
      var23 = TopNY + var22 * var17 - Gravity * var17 * var17
    else
      var23 = TopNY
    endif
  elif AnimFrame <= 3
    if TotalYSpeed > 0
      var23 = TopNY + TotalYSpeed * var17 - Gravity * var17 * var17
    else
      var23 = TopNY + TotalYSpeed * var17
    endif
  else
    EstYCoord var23 var17
  endif
  var3 -= var23
  var3 += TopNY

  // var22 = OTopNX - var2
  // var2 += var22
  var23 = TopNX + TotalXSpeed * var17
  // var23 -= TopNX
  var2 -= var23
  var2 += TopNX

  if OAnimFrame <= 3 && !(Equal OYSpeed 0)
    var23 = OSCDBottom + OTotalYSpeed * var17 - OGravity * var17 * var17
  else
    EstOYCoord var23 var17
  endif
  var23 -= OTopNY
  var22 = OYDistFloor * -1
  if var23 < var22 && OYDistFloor > 0
    var23 = OTopNY - OYDistFloor
  endif
  var3 += var23

  // if OAnimFrame <= 3
  //   var23 = OTopNX + OTotalXSpeed * var17
  // else
    EstOXCoord var23 var17
  // endif
  var23 -= OTopNX
  var2 += var23

  var22 = (100 - LevelValue) * 0.2 - 0
  var23 = var4 + var22
  if var23 > 1
    var12 -= var22
    var22 *= 0.5
    var4 += var22
    var22 *= 2
  endif
  var23 = var5 + var22
  if var23 > 1
    var11 -= var22
    var22 *= 0.5
    var5 += var22
  endif


  // $ifAerialAttack()
  //   GetAttribute var22 132; 0
  //   var22 *= var8 * 0.5
  //   var12 -= var22
  //   var22 *= 0.5
  //   var4 += var22
  // endif

  // if var17 > 15
  //   var22 = var17 - 15
  //   var22 *= 0.5
  //   var12 -= var22
  //   var11 -= var22
  //   var22 *= 0.5
  //   var4 += var22
  //   var5 += var22
  // endif

  if Equal var21 16.3
    var4 += 8
  endif
  // var23 = OXSpeed
  // Abs var23
  // var4 += var23

  var0 = var2
  var1 = var3

  var22 = OTopNX + (var12 + var4) * ODirection
  var17 = OTopNY - var11 + var5
  DrawDebugRectOutline var22 var17 var4 var5 255 255 68 68

  var22 = var0 
  var17 = var1 

  DrawDebugRectOutline var22 var17 var4 var5 0 255 0 68

  var17 = var0 - TopNX
  var22 = var1 - TopNY

  Abs var17
  Abs var22

  if !(Equal var16 1)
if !(True)  || Equal var20 0 || Equal var20 3 || Equal var20 4 || Equal var20 5 || Equal var20 6 || Equal var20 7 || Equal var20 8 || Equal var20 10 || Equal var20 11 || Equal var20 12 || Equal var20 13
      if var17 <= var4 && var22 <= var5 && Equal CurrAction 4
        label crouchWait
          XGoto PerFrameChecks
          XReciever
          Seek crouchWait
          if !(Equal CurrAction 4)
            var15 = -2
            Call MainHub
          endif
          ClearStick
          AbsStick 0 (-0.6)
        Return
      endif

      if Equal CurrAction 3
        var17 = var0 + XSpeed * (AnimFrame - 8)
        var17 -= TopNX
        Abs var17
        if var17 <= var4 && var22 <= var5
          label runWait
          XGoto PerFrameChecks
          XReciever
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

      var23 = var17 - 25
      var22 = OXSpeed
      Abs var22
      if var23 <= var4 && var22 <= var5 && var22 < 0.8 && var21 < 16.7
        if Equal CurrAction 3 || Equal CurrAction 8 || Equal CurrAction 9
          if AnimFrame < 4
            var16 = 5
            // if XDistFrontEdge < 15 || XDistBackEdge > -15
            //   var16 = 4
            // endif
            var15 = -2
            // if Rnd < 0.7
              // var15 = -2
            // endif
            CallI Wavedash      
          endif
        endif
      endif
    endif
  endif

  // var23 = OTopNY - TopNY
  // $ifAerialAttack()
  // elif var23 > 14.24
  //   var20 = -1
  // endif

  if Equal IsOnStage 1
if !(True) || Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25
    if Equal AirGroundState 2 && !(Equal var21 16.7)
  var17 = var8
  if Equal CurrSubaction JumpSquat
    GetAttribute var22 84; 0
    var22 *= -1
  else
    var22 = YSpeed * -1
  endif
  CalcYChange var18 var17 var22 Gravity MaxFallSpeed FastFallSpeed 1
      // LOGSTR 1178686208 1413890304 1280057344 1145656064 1409286144
      // LOGVAL var18
      // LOGSTR 1129665024 1380273664 1411406080 1347375872 0
      // LOGVAL TopNY
      // PRINTLN
      var22 = var18 + CenterY - TopNY
      var22 -= YDistFloor
      if var22 > 0
        var17 = var0 - TopNX
        var22 = var1 - TopNY + var18
        Abs var17
        Abs var22
        if var17 <= var4 && var22 <= var5
          if !(Equal var16 1)
            var16 = 1
            CallI ExecuteAttack
            Finish
          else
            var16 = 1
            Return
          endif
        endif
      endif
    endif
  endif
  endif

  var17 = var0 - TopNX
  var22 = var1 - TopNY

  Abs var17
  Abs var22

  if var17 <= var4 && var22 <= var5
    if !(Equal var16 1)
if !(True) || Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25
        if var21 >= 16.7 || Equal IsOnStage 0
          EstYCoord var22 var6
          DrawDebugRectOutline TopNX var22 5 5 0 255 255 221
          DrawDebugRectOutline TopNX -48.28 10 2 255 136 0 221
          if var22 >= -48.28 && Equal AirGroundState 2
            CallI ExecuteAttack
            Finish
          endif
        else
          CallI ExecuteAttack
          Finish
        endif
      elif Equal AirGroundState 1
        CallI ExecuteAttack
        Finish
      endif
    else
      var16 = 2
      Return
    endif
  endif

  // if var17 <= var4
  //   var13 = TopNX
  //   Return
  // endif

if var7 > var8
  var7 -= 4
  SeekNoCommit CHECK_HIT_LOOP
endif


var15 = 0

// MIXES UP AN APPROACH
  var22 = 200
  XGoto GetChrSpecific
  XReciever
if LevelValue >= 42 && !(Equal var21 16.4) && !(Equal var21 16.2) && Equal var22 0 && var21 < 16.7
  var4 += 20
  var5 += 20
  if var17 <= var4 && var22 <= var5
  var22 = 21
  XGoto GetChrSpecific
  XReciever
    if var22 > 0.4
      var21 = 10.5
      if CHANCE_MUL_LE PT_BAITCHANCE 0.8
        var21 = 10.4
        var16 = 3
        var15 = -1
        if Equal AirGroundState 2
          if YDistFloor <= 5
            var16 = 2
          else
            // var21 = 16.4
            var16 = 2
            CallI JumpScr
          endif
        elif ODistLE 20
          var16 = 2
        endif
        CallI Wavedash
      endif
      Return
    endif
    PredictOMov var22 1 LevelValue
    PredictOMov var23 14 LevelValue
    if var22 > 0.4 && var23 > 0.4
      var21 = 10.2
      if CHANCE_MUL_LE PT_AGGRESSION 0.5
        var21 = 10.5
      endif
      Return
    endif
  endif
endif
Return
Return
