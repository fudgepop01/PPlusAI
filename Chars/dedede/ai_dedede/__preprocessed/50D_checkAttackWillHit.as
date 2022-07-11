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
STACK_PUSH 15 0
STACK_PUSH 9 0
STACK_PUSH 10 0
STACK_PUSH 11 0
STACK_PUSH 12 0
STACK_PUSH 0 0
  XGoto GetChrSpecific
  XReciever

var17 = 26 - var15
if OAnimFrame < var17
  if OCurrAction >= 78 && OCurrAction <= 82
    Return
  elif OCurrAction >= 96 && OCurrAction <= 97
    Return
  endif
endif

// if Equal OCurrAction 77
//   var9 += 3
//   var11 += 3
// endif

if !(True) || Equal var20 10|| Equal var20 13|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25
else
  var22 = var9 * 2 - var11
  if var22 <= HurtboxSize && OYDistFloor > HurtboxSize && OYSpeed > 0
    var20 = -1
    Return
  endif
  var22 = var12 * 0.25
  if XDistLE var22
    var20 = -1
    Return
  endif
endif

var22 = OHurtboxSize * 0.8
var9 += var22
var11 += var22

if !(True) || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18
  if Equal OCurrAction 74 || Equal OCurrAction 77 || Equal OCurrAction 83 || Equal OCurrAction 84
    Return
  endif
  var7 = 1
endif

if OCurrAction >= 68 && OCurrAction <= 73 || Equal OCurrAction 66
  var22 = var9 - var11
  if OYDistFloor < var22 && OYSpeed < 0 && OYDistFloor > 1
    Return
  endif
endif


// var15 += 2
var8 = var7

if !(True)
  label CHECK_HIT_LOOP
endif

var2 = var13
var3 = var14
var4 = var10
var5 = var9

// adjust to O center
// var23 = OHurtboxSize * 0.25
// var5 += var23
// var23 = OWidth
// var4 += var23

// var23 = Width * 0.5
// var2 -= var23
// var23 = HurtboxSize * 0.5
// var3 -= var23

var23 = OCenterX - OTopNX
var2 += var23

var23 = var8 + 1 + var15
var22 = 0.3 / var23
var22 += 0.7
var4 *= var22
var5 *= var22

if Equal OYDistFloor -1 && Equal AirGroundState 1
  if OYDistBackEdge > -10
    var3 -= OHurtboxSize
  elif OYDistBackEdge < -45
    var3 += OHurtboxSize
  endif
endif
// var2 -= var23
// if TopNX < OTopNX
//   var2 += var23
// else 
//   var2 -= var23
// endif

// var23 = CenterY - TopNY
// var3 -= var23

var23 = OCenterY - OTopNY
var3 -= var23

// var3 -= var23
// if TopNY <= OTopNY
//   var3 -= var23
// else 
//   var3 += var23
// endif

  if var8 < 0
    var8 = 0
    SeekNoCommit CHECK_HIT_LOOP
  endif

  var17 = var8 + var15

  if Equal AirGroundState 1
if !(True) || Equal var20 10|| Equal var20 13|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25
      GetAttribute var22 84; 0
      var23 = 0 + var22 * var17 - Gravity * var17 * var17
    else
      var23 = 0
    endif
  elif AnimFrame <= 3
    if TotalYSpeed > 0
      var23 = 0 + TotalYSpeed * var17 - Gravity * var17 * var17
    else
      var23 = 0 + TotalYSpeed * var17
    endif
  else
    EstYCoord var23 var17
    var23 -= TopNY
  endif
  var3 -= var23

  DrawDebugRectOutline TopNX var3 10 10 255 0 0 221

  var23 = TotalXSpeed * 3
if !(True) || Equal var20 10|| Equal var20 13|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25
    var23 = TotalXSpeed * var17
  endif
  var2 -= var23

  var17 = var8
  if OAnimFrame <= 3 && !(Equal OYSpeed 0)
    var23 = OSCDBottom + OTotalYSpeed * var17 - OGravity * var17 * var17
  else
    EstOYCoord var23 var17
  endif
  var23 -= OSCDBottom
  var22 = OYDistFloor * -1
  if var23 < OYDistBackEdge && OYDistFloor > 0
    var23 = OTopNY - OYDistFloor
  endif
  var3 -= var23

  if OAnimFrame <= 3
    var23 = OTopNX + OTotalXSpeed * var17
  else
    EstOXCoord var23 var17
  endif
  var23 -= OTopNX
  var2 -= var23

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

  // if Equal var21 16.3
  //   var4 += 8
  // endif
  // var23 = OXSpeed
  // Abs var23
  // var4 += var23

  var0 = var2
  var22 = OHurtboxSize * 0.5
  var1 = var3 //- var22
  var5 += var22

  var22 = OTopNX + (var12 + var4) * ODirection
  var17 = OTopNY - var11 + var5 + OHurtboxSize * 0.5
  DrawDebugRectOutline var22 var17 var4 var5 255 255 68 68

  var22 = var0 
  var17 = var1 

  DrawDebugRectOutline var22 var17 var4 var5 0 255 0 68

  var17 = var0 - TopNX
  var22 = var1 - TopNY

  Abs var17
  Abs var22

  if !(Equal var16 1)
if !(True)  || Equal var20 0 || Equal var20 2 || Equal var20 3 || Equal var20 4 || Equal var20 5 || Equal var20 7 || Equal var20 8 || Equal var20 9 || Equal var20 11
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

      var23 = var17 - 15
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
  // elif var23 > 13.47
  //   var20 = -1
  // endif

  if Equal IsOnStage 1
if !(True) || Equal var20 10|| Equal var20 13|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25
    if Equal AirGroundState 2 && !(Equal var21 16.7)
  var17 = var15 + var7 - var8 + 1
  if Equal CurrSubaction JumpSquat
    GetAttribute var22 84; 0
    var22 *= -1
  else
    var22 = YSpeed * -1
  endif
  CalcYChange var18 var17 var22 Gravity MaxFallSpeed FastFallSpeed 1
      
      var22 = var18 - HurtboxSize * 0.5
      var22 -= YDistFloor
      if var22 > 0
        var17 = var0 - TopNX
        var22 = TopNY - var18
        var22 = var1 - var22
        
        Abs var17
        Abs var22
        if var17 <= var4 && var22 <= var5
          if !(Equal var16 1)
            var16 = 1
            SetDebugOverlayColor 255 0 0 255
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
    var23 = var8 + 1
    var22 = 6 / var23
    if Rnd < var22
      if !(Equal var16 1)
if !(True) || Equal var20 10|| Equal var20 13|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25
          if var21 >= 16.7 || Equal IsOnStage 0
  CalcYChange var22 var6 YSpeed Gravity MaxFallSpeed FastFallSpeed 0
  var22 -= TopNY 
  var22 *= -1
            DrawDebugRectOutline TopNX var22 5 5 0 255 255 221
            var23 = -90
            if NumJumps > 0
              var23 -= 12.8
            endif
            DrawDebugRectOutline TopNX var23 10 2 255 136 0 221
            if var22 >= var23 && Equal AirGroundState 2
              CallI ExecuteAttack
              Finish
            else
              var20 = -1
              Return
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
  endif

  // if var17 <= var4
  //   var13 = TopNX
  //   Return
  // endif

if var8 > 0
  var8 -= 4
  SeekNoCommit CHECK_HIT_LOOP
endif

var15 = 0

// MIXES UP AN APPROACH
if var21 < 16.7 && Rnd < 0.15
  PredictOMov var22 10 LevelValue
  if var22 < 0.4
if !(True) || Equal var20 10|| Equal var20 13|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25
      if var15 <= 5
        Return
      endif
    elif var15 <= 13
      Return
    endif
  endif

  var22 = 200
  XGoto GetChrSpecific
  XReciever
  if LevelValue >= 48 && Equal var22 0 && var21 < 16.7 && !(Equal var21 16.4)
    predictAverage var22 10 LevelValue
    if var22 < 15
      var22 = 15
    endif
    var22 *= 2
    if ODistLE var22
      var15 = -1
      GetCommitPredictChance var23 LevelValue
      if var23 < 0.1 && Rnd < 0.4 || var23 > 0.2 && Rnd < var23 && Rnd < var23
        if CHANCE_MUL_LE PT_BAITCHANCE 0.6
          var16 = 3
          if Equal AirGroundState 2
            if YDistFloor <= 5
              var16 = 2
            elif True
              var16 = 1
              var20 = -1
              CallI JumpScr
            endif
          elif ODistLE 20
            var16 = 2
          endif
          CallI Wavedash
        endif
        var16 = 2
        CallI DashScr
        Return
      endif

      GetCommitPredictChance var23 LevelValue
      if Equal AirGroundState 1 && CHANCE_MUL_LE PT_BAITCHANCE 1.2
        PredictOMov var22 10 LevelValue
        if var23 >= 0.25 || var22 >= 0.25
          var21 = 10.4
          if ODistLE 35
            var16 = 2
            CallI DashScr
          else
            var16 = 2
            CallI Wavedash
          endif
        endif
      endif
      if var23 < 0.1 && Rnd < 0.4 || var23 > 0.3 && Rnd < var23 && Rnd < var23
        var21 = 10.2
        if CHANCE_MUL_LE PT_AGGRESSION 0.3
          var21 = 16.4
          var16 = 1 //+ 0.1
          var20 = -1
          CallI JumpScr
        endif
        Return
      endif
    endif
  endif
endif
Return
Return
