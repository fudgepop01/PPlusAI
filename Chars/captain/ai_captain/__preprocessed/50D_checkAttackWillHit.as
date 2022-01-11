#include <Definition_AIMain.h>
id 0x850D
unk 0x0

XReciever

if OAnimFrame < 23
  if OCurrAction >= 78 && OCurrAction <= 82
    Return
  elif OCurrAction >= 96 && OCurrAction <= 97
    Return
  endif
endif

if !(True) || Equal var20 9 || Equal var20 10 || Equal var20 11 || Equal var20 12 || Equal var20 13
  if Equal OCurrAction 74 || Equal OCurrAction 77 || Equal OCurrAction 83 || Equal OCurrAction 84
    Return
  elif OCurrAction >= 68 && OCurrAction <= 73 || Equal OCurrAction 66
    if OYDistBackEdge > -8 && OYSpeed < 0
      Return
    endif
  endif 
endif

  var22 = 19
STACK_PUSH 17
STACK_PUSH 6
STACK_PUSH 7
STACK_PUSH 8
STACK_PUSH 9
STACK_PUSH 10
STACK_PUSH 11
STACK_PUSH 12
STACK_PUSH 17
  XGoto GetChrSpecific
  XReciever

var7 = var8 + var7

var2 = var13
var3 = var14
var4 = var10
var5 = var9

// adjust to O center
var23 = OHurtboxSize * 0.5
var5 += var23
var23 = OWidth * 0.5
var4 += var23

var23 = Width * 0.5
var2 -= var23
var23 = HurtboxSize * 0.5
var3 += var23

var23 = OTopNX - OCenterX
var2 -= var23
// var2 -= var23
// if TopNX < OTopNX
//   var2 += var23
// else 
//   var2 -= var23
// endif

var23 = OCenterY - OTopNY
var3 += var23
// var3 -= var23
// if TopNY <= OTopNY
//   var3 -= var23
// else 
//   var3 += var23
// endif

var17 = var8


  if AnimFrame < 2
    if TotalYSpeed > 0
      var23 = TopNY + TotalYSpeed * var17 - Gravity * var17 * Gravity
    else
      var23 = TopNY + TotalYSpeed * var17
    endif
  else
    EstYCoord var23 var17
  endif
  var3 -= var23
var3 += TopNY

if OAnimFrame < 2 && !(Equal OYSpeed 0)
  var23 = OSCDBottom + OTotalYSpeed * var17 - OGravity * OGravity * var17
else
  EstOYCoord var23 var17
endif
var23 -= OTopNY
if var23 > OYDistFloor
  var23 = OTopNY - OYDistFloor
endif
var3 += var23


if OAnimFrame < 2
  var23 = OTopNX + OTotalXSpeed * var17
else
  EstOXCoord var23 var17
endif
var23 -= OTopNX
var2 += var23

if !(True) || Equal var20 14|| Equal var20 15|| Equal var20 16|| Equal var20 17|| Equal var20 18|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22
  var22 = 0.002
  XGoto GetChrSpecific
  XReciever
  if Equal var22 1 && Equal PrevAction 10 && AnimFrame < 2
    Return
  endif 
  var23 = var17
  // if Equal CurrAction 6 || Equal CurrAction 7
  //   var23 *= 0.35
  // elif Equal PrevAction 6 || Equal PrevAction 7
  //   if Equal CurrAction 3 && AnimFrame < 4
  //     var23 *= 0.35
  //   endif
  // endif
  if AnimFrame < 2
    var23 = TopNX + TotalXSpeed * var23
  else
    EstXCoord var23 var23
  endif
elif True
  var23 = TopNX
endif
var23 -= TopNX
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


if !(True) || Equal var20 14|| Equal var20 15|| Equal var20 16|| Equal var20 17|| Equal var20 18|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22
  GetAttribute var22 132; 0
  var22 *= var8 * 0.5
  var12 -= var22
  var22 *= 0.5
  var4 += var22
endif

if var17 > 15
  var22 = var17 - 15
  var22 *= 0.5
  var12 -= var22
  var11 -= var22
  var22 *= 0.5
  var4 += var22
  var5 += var22
endif

if Equal var21 16.3
  var4 += 12
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

DrawDebugRectOutline var22 var17 var4 var5 0 255 0 221

var17 = var0 - TopNX
var22 = var1 - TopNY

Abs var17
Abs var22

if !(Equal var16 1)
if !(True)  || Equal var20 1 || Equal var20 2 || Equal var20 3 || Equal var20 4 || Equal var20 6 || Equal var20 7
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

    var23 = var17 - 20
    if var23 <= var4 && var22 <= var5
      if Equal CurrAction 3 || Equal CurrAction 8 || Equal CurrAction 9
        if AnimFrame < 4
          var16 = 5
          // if XDistFrontEdge < 15 || XDistBackEdge > -15
          //   var16 = 4
          // endif
          var15 = -1
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
// elif var23 > 15
//   var20 = -1
// endif

if Equal IsOnStage 1
if !(True) || Equal var20 14|| Equal var20 15|| Equal var20 16|| Equal var20 17|| Equal var20 18|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22
    if Equal AirGroundState 2 && !(Equal var21 16.5)
  var17 = var8
  if Equal CurrSubaction JumpSquat
    GetAttribute var22 84; 0
    var22 *= -1
  else
    var22 = YSpeed * -1
  endif
  CalcYChange var6 var17 var22 Gravity MaxFallSpeed FastFallSpeed 1
      // LOGSTR 1178686208 1413890304 1280057344 1145656064 1409286144
      // LOGVAL var6
      // LOGSTR 1129665024 1380273664 1411406080 1347375872 0
      // LOGVAL TopNY
      // PRINTLN
      var22 = var6 + CenterY - TopNY
      var22 -= YDistFloor
      if var22 > 0
        var17 = var0 - TopNX
        var22 = var1 - TopNY + var6
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
      // var17 = var7 - var8
      // GetAttribute var23 144; 0
      // var23 *= var17
      // var17 = var0 - TopNX
      // var22 = var1 - TopNY + var6 + var23
      // Abs var17
      // Abs var22
      // if var17 <= var4 && var22 <= var5
      //   if !(Equal var16 1)
      //     var16 = 1
      //     CallI ExecuteAttack
      //     Finish
      //   else
      //     var16 = 1
      //     Return
      //   endif
      // endif
    endif
  endif
endif

var17 = var0 - TopNX
var22 = var1 - TopNY

Abs var17
Abs var22

if var17 <= var4 && var22 <= var5
  if !(Equal var16 1)
if !(True) || Equal var20 14|| Equal var20 15|| Equal var20 16|| Equal var20 17|| Equal var20 18|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22
      if Equal var21 16.5 || Equal IsOnStage 0
        EstYCoord var22 var6
        DrawDebugRectOutline TopNX var22 5 5 0 255 255 221
        DrawDebugRectOutline TopNX -40 10 2 255 136 0 221
        if var22 >= -69 && Equal AirGroundState 2
          CallI ExecuteAttack
          Finish
        endif
      elif Equal AirGroundState 2
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
Return
Return
