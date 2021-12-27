#include <Definition_AIMain.h>
id 0x850D
unk 0x0

XReciever

Goto getMoveLocationParams
XReciever


var2 = var8
var3 = var9

// adjust to O center
var23 = OHurtboxSize
var13 += var23
var23 = OWidth
var12 += var23

var23 = OTopNX - OCenterX
var2 -= var23
if TopNX < OTopNX
  var2 -= var23
else 
  var2 += var23
endif

var23 = OTopNY - OCenterY
var3 -= var23

if TopNY < OTopNY
  var3 -= var23
else 
  var3 += var23
endif

var17 = var14

if AnimFrame < 2
  if TotalYSpeed > 0
    var23 = TopNY + TotalYSpeed * var17 - Gravity * var17
  else
    var23 = TopNY + TotalYSpeed * var17
  endif
else
  EstYCoord var23 var17
endif
var23 -= TopNY
var3 += var23

if !(True) || Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25
  var23 = var17
  if Equal CurrAction 6 || Equal CurrAction 7
    var23 *= 0.35
  elif Equal PrevAction 6 || Equal PrevAction 7
    if Equal CurrAction 3 && AnimFrame < 4
      var23 *= 0.35
    endif
  endif
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
var23 = var12 + var22
if var23 > 1
  var10 -= var22
  var22 *= 0.5
  var12 += var22
  var22 *= 2
endif
var23 = var13 + var22
if var23 > 1
  var11 -= var22
  var22 *= 0.5
  var13 += var22
endif

if !(True) || Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25
  GetAttribute var22 30 0
  var22 *= var14 * 0.5
  var10 -= var22
  var22 *= 0.5
  var12 += var22
endif

if var17 > 15
  var22 = var17 - 15
  var22 *= 0.5
  var10 -= var22
  var11 -= var22
  var22 *= 0.5
  var12 += var22
  var13 += var22
endif

if Equal var21 16.3
  var12 += 12
endif
// var23 = OXSpeed
// Abs var23
// var12 += var23

var0 = var2
var1 = var3

var22 = OTopNX + (var10 + var12) * ODirection
var17 = OTopNY - var11 + var13
DrawDebugRectOutline var22 var17 var12 var13 255 255 68 68

var22 = var0 
var17 = var1 

DrawDebugRectOutline var22 var17 var12 var13 0 255 0 221

var17 = var0 - TopNX
var22 = var1 - TopNY

Abs var17
Abs var22

if !(Equal var16 1)
if !(True)  || Equal var20 0 || Equal var20 3 || Equal var20 4 || Equal var20 5 || Equal var20 6 || Equal var20 7 || Equal var20 8 || Equal var20 10 || Equal var20 11 || Equal var20 12 || Equal var20 13
    var23 = var17 - 25
    if var23 <= var12 && var22 <= var13
      if Equal CurrAction 3 || Equal CurrAction 8
        if AnimFrame < 4
          var16 = 5
          if XDistFrontEdge < 15 || XDistBackEdge > -15
            var16 = 4
          endif
          // var15 = -1
          // if Rnd < 0.7
            var15 = -2
          // endif
          CallI Wavedash      
        endif
      endif
    endif
    if var17 <= var12 && var22 <= var13 && Equal CurrAction 4
      var15 = -1
      label crouchWait
        Seek crouchWait
        if !(Equal CurrAction 4)
          Call MainHub
        endif
        ClearStick
        AbsStick 0 (-0.6)
      Return
    endif
  endif
endif

var23 = OTopNY - TopNY
if !(True) || Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25
elif var23 > 14
  var20 = -1
endif

if Equal IsOnStage 1
if !(True) || Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25
    if Equal AirGroundState 2
  var17 = var14
  if Equal CurrSubaction JumpSquat
    GetAttribute var22 17 0
    var22 *= -1
  else
    var22 = YSpeed * -1
  endif
  CalcYChange var4 var17 var22 Gravity MaxFallSpeed FastFallSpeed 1
      // var22 = var4 + (OSCDBottom - TopNY)
      // var22 -= YDistBackEdge
      // if var22 > 0
        var17 = var0 - TopNX
        var22 = var1 - TopNY + var4
        Abs var17
        Abs var22
        if var17 <= var12 && var22 <= var13
          if !(Equal var16 1)
            var16 = 1
            CallI ExecuteAttack
            Finish
          else
            var16 = 1
            Return
          endif
        endif
      // endif
    endif
  endif
endif

var17 = var0 - TopNX
var22 = var1 - TopNY

Abs var17
Abs var22

if var17 <= var12 && var22 <= var13
  if !(Equal var16 1)
if !(True) || Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25
      if Equal var21 16.5 && Equal IsOnStage 0
        EstYCoord var22 var16
        DrawDebugRectOutline TopNX var22 5 5 0 255 255 221
        DrawDebugRectOutline TopNX -40 10 2 255 136 0 221
        if var22 >= -40
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
label getMoveLocationParams

if Equal var20 0
Goto jab123
elif Equal var20 1
Goto dashattack
elif Equal var20 2
Goto dashattack
Goto dashattack_weak
elif Equal var20 3
Goto ftilt
elif Equal var20 4
Goto ftilt
Goto ftilt2
elif Equal var20 5
Goto ftilt
Goto ftilt3
elif Equal var20 6
Goto utilt
elif Equal var20 7
Goto dtilt
elif Equal var20 8
Goto fsmash
elif Equal var20 9
Goto usmash
elif Equal var20 10
Goto dsmash
elif Equal var20 11
Goto dsmash
Goto dsmash_hit2
elif Equal var20 12
Goto dspecial
elif Equal var20 13
Goto dspecial
elif Equal var20 14
Goto grab
elif Equal var20 15
Goto grab
Goto fthrow
elif Equal var20 16
Goto grab
Goto dthrow
elif Equal var20 17
Goto grab
Goto bthrow
elif Equal var20 18
Goto grab
Goto uthrow
elif Equal var20 19
Goto nair
elif Equal var20 20
Goto nair
Goto nair_med
elif Equal var20 21
Goto nair
Goto nair_weak
elif Equal var20 22
Goto fair
elif Equal var20 23
Goto bair
elif Equal var20 24
Goto uair
elif Equal var20 25
Goto dair
endif

Return


// populates ranges, hitframes, and IASA
label jab123
var16 = 39
var10 = -17.07
var11 = 0
var5 = 0
var12 = 17.07
var13 = 7.75
var14 = 8
var15 = 22
var19 = 0
Return
label dashattack
var16 = 39
var10 = 10.02
var11 = -3.73
var5 = 1
var12 = 7.76
var13 = 3.73
var14 = 4
var15 = 7
var19 = 0
Return
label dashattack_weak
var10 = 16.81
var11 = 0.97
var5 = 1
var12 = 11.23
var13 = 6.08
var14 = 8
var15 = 14
var19 = 1
Return
label ftilt
var16 = 25
var10 = 4.29
var11 = -1.52
var5 = 1
var12 = 9.98
var13 = 4.5
var14 = 3
var15 = 4
var19 = 0
Return
label ftilt2
var16 = 37
var10 = 0.48
var11 = -1.52
var5 = 1
var12 = 10.51
var13 = 4.5
var14 = 10
var15 = 11
var19 = 1
Return
label ftilt3
var16 = 51
var10 = 3.7
var11 = -1
var5 = 1
var12 = 10.13
var13 = 10.5
var14 = 18
var15 = 19
var19 = 2
Return
label utilt
var16 = 28
var10 = -7.71
var11 = -7.78
var5 = 0
var12 = 8.02
var13 = 12.31
var14 = 8
var15 = 18
var19 = 0
Return
label dtilt
var16 = 19
var10 = 4.89
var11 = 0.8
var5 = 1
var12 = 10.96
var13 = 4.8
var14 = 6
var15 = 7
var19 = 0
Return
label fsmash
var16 = 51
var10 = 3.5
var11 = 1.91
var5 = 1
var12 = 9.64
var13 = 7.93
var14 = 25
var15 = 26
var19 = 0
Return
label usmash
var16 = 48
var10 = -17.03
var11 = -1.54
var5 = 0
var12 = 16.28
var13 = 13.76
var14 = 9
var15 = 20
var19 = 0
Return
label dsmash
var16 = 47
var10 = 1.49
var11 = 1.69
var5 = 1
var12 = 10.54
var13 = 4.51
var14 = 6
var15 = 7
var19 = 0
Return
label dsmash_hit2
var10 = -22.57
var11 = 1.69
var5 = -1
var12 = 10.72
var13 = 4.51
var14 = 15
var15 = 16
var19 = 1
Return
label dspecial
var16 = 77
var10 = -15.11
var11 = 1.43
var5 = -1
var12 = 9.61
var13 = 6.5
var14 = 26
var15 = 27
var19 = 0
Return
label dspecialair
var16 = 77
var10 = -15.11
var11 = 1.43
var5 = -1
var12 = 9.61
var13 = 6.5
var14 = 26
var15 = 27
var19 = 0
Return
label grab
var16 = 32
var10 = 1.5
var11 = -2.5
var5 = 1
var12 = 6.25
var13 = 4
var14 = 7
var15 = 7
var19 = 0
Return
label fthrow
var5 = 1
var19 = 2
Return
label dthrow
var5 = 1
var19 = 3
Return
label bthrow
var5 = 1
var19 = 4
Return
label uthrow
var5 = 1
var19 = 5
Return
label nair
var16 = 42
var10 = -7
var11 = 6.6
var5 = 0
var12 = 9.18
var13 = 12.36
var14 = 3
var15 = 6
var19 = 0
Return
label nair_med
var10 = -12.23
var11 = 6.6
var5 = 0
var12 = 12.17
var13 = 11.29
var14 = 7
var15 = 15
var19 = 1
Return
label nair_weak
var10 = -9.63
var11 = 4.32
var5 = 0
var12 = 9.64
var13 = 9.86
var14 = 16
var15 = 28
var19 = 2
Return
label fair
var16 = 33
var10 = 0.01
var11 = 1.4
var5 = 1
var12 = 7.57
var13 = 6.57
var14 = 6
var15 = 14
var19 = 0
Return
label bair
var16 = 35
var10 = -14
var11 = 5
var5 = -1
var12 = 7.5
var13 = 12.5
var14 = 10
var15 = 11
var19 = 0
Return
label uair
var16 = 22
var10 = -17.8
var11 = -6
var5 = 0
var12 = 15.4
var13 = 8.25
var14 = 5
var15 = 6
var19 = 0
Return
label dair
var16 = 41
var10 = -7.5
var11 = 10.5
var5 = 0
var12 = 10.25
var13 = 6.5
var14 = 12
var15 = 13
var19 = 0
Return

Return
Return
