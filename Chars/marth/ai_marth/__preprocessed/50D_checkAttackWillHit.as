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

if !(True) || Equal var20 34|| Equal var20 35|| Equal var20 36|| Equal var20 37|| Equal var20 38|| Equal var20 39|| Equal var20 40|| Equal var20 41|| Equal var20 42|| Equal var20 43|| Equal var20 44|| Equal var20 45|| Equal var20 46|| Equal var20 47|| Equal var20 48|| Equal var20 49
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

if !(True) || Equal var20 34|| Equal var20 35|| Equal var20 36|| Equal var20 37|| Equal var20 38|| Equal var20 39|| Equal var20 40|| Equal var20 41|| Equal var20 42|| Equal var20 43|| Equal var20 44|| Equal var20 45|| Equal var20 46|| Equal var20 47|| Equal var20 48|| Equal var20 49
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
if !(True)  || Equal var20 0 || Equal var20 1 || Equal var20 5 || Equal var20 6 || Equal var20 7 || Equal var20 8 || Equal var20 9 || Equal var20 10 || Equal var20 11 || Equal var20 12 || Equal var20 13 || Equal var20 14 || Equal var20 15 || Equal var20 19 || Equal var20 20 || Equal var20 21 || Equal var20 22 || Equal var20 23 || Equal var20 24 || Equal var20 25 || Equal var20 26 || Equal var20 27
    var23 = var17 - 35
    if var23 <= var12 && var22 <= var13
      if Equal CurrAction 3 || Equal CurrAction 8
        if AnimFrame < 9
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
if !(True) || Equal var20 34|| Equal var20 35|| Equal var20 36|| Equal var20 37|| Equal var20 38|| Equal var20 39|| Equal var20 40|| Equal var20 41|| Equal var20 42|| Equal var20 43|| Equal var20 44|| Equal var20 45|| Equal var20 46|| Equal var20 47|| Equal var20 48|| Equal var20 49
elif var23 > 14
  var20 = -1
endif

if Equal IsOnStage 1
if !(True) || Equal var20 34|| Equal var20 35|| Equal var20 36|| Equal var20 37|| Equal var20 38|| Equal var20 39|| Equal var20 40|| Equal var20 41|| Equal var20 42|| Equal var20 43|| Equal var20 44|| Equal var20 45|| Equal var20 46|| Equal var20 47|| Equal var20 48|| Equal var20 49
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
if !(True) || Equal var20 34|| Equal var20 35|| Equal var20 36|| Equal var20 37|| Equal var20 38|| Equal var20 39|| Equal var20 40|| Equal var20 41|| Equal var20 42|| Equal var20 43|| Equal var20 44|| Equal var20 45|| Equal var20 46|| Equal var20 47|| Equal var20 48|| Equal var20 49
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
Goto jab123
Goto jab123_strong
elif Equal var20 2
Goto dashattack
elif Equal var20 3
Goto dashattack
Goto dashattack_mid
elif Equal var20 4
Goto dashattack
Goto dashattack_strong
elif Equal var20 5
Goto ftilt
elif Equal var20 6
Goto ftilt
Goto ftilt_strong
elif Equal var20 7
Goto utilt
elif Equal var20 8
Goto utilt
Goto utilt_start_outer
elif Equal var20 9
Goto utilt
Goto utilt_end_inner
elif Equal var20 10
Goto utilt
Goto utilt_end_outer
elif Equal var20 11
Goto dtilt
elif Equal var20 12
Goto dtilt
Goto dtilt_inner
elif Equal var20 13
Goto dtilt
Goto dtilt_outer
elif Equal var20 14
Goto fsmash
elif Equal var20 15
Goto fsmash
Goto fsmash_outer
elif Equal var20 16
Goto usmash
elif Equal var20 17
Goto usmash
Goto usmash_mid
elif Equal var20 18
Goto usmash
Goto usmash_strong
elif Equal var20 19
Goto dsmash
elif Equal var20 20
Goto dsmash
Goto dsmash_hit1_inner
elif Equal var20 21
Goto dsmash
Goto dsmash_hit1_outer
elif Equal var20 22
Goto dsmash
Goto dsmash_hit2_mid
elif Equal var20 23
Goto dsmash
Goto dsmash_hit2_inner
elif Equal var20 24
Goto dsmash
Goto dsmash_hit2_outer
elif Equal var20 25
Goto nspecial
elif Equal var20 26
Goto nspecial
Goto nspecial_mid
elif Equal var20 27
Goto nspecial
Goto nspecial_strong
elif Equal var20 28
Goto sspecial
elif Equal var20 29
Goto grab
elif Equal var20 30
Goto grab
Goto fthrow
elif Equal var20 31
Goto grab
Goto dthrow
elif Equal var20 32
Goto grab
Goto bthrow
elif Equal var20 33
Goto grab
Goto uthrow
elif Equal var20 34
Goto nair
elif Equal var20 35
Goto nair
Goto nair_hit1_strong
elif Equal var20 36
Goto nair
Goto nair_hit2_inner
elif Equal var20 37
Goto nair
Goto nair_hit2_strong
elif Equal var20 38
Goto fair
elif Equal var20 39
Goto fair
Goto fair_mid
elif Equal var20 40
Goto fair
Goto fair_outer
elif Equal var20 41
Goto bair
elif Equal var20 42
Goto bair
Goto bair_mid
elif Equal var20 43
Goto bair
Goto bair_outer
elif Equal var20 44
Goto uair
elif Equal var20 45
Goto uair
Goto uair_mid
elif Equal var20 46
Goto uair
Goto uair_outer
elif Equal var20 47
Goto dair
elif Equal var20 48
Goto dair
Goto dair_mid
elif Equal var20 49
Goto dair
Goto dair_outer
endif

Return


// populates ranges, hitframes, and IASA
label jab123
var16 = 25
var10 = 4.1
var11 = -3.32
var5 = 1
var12 = 9.08
var13 = 7.6
var14 = 4
var15 = 7
var19 = 0
Return
label jab123_strong
var10 = 14.09
var11 = 2.16
var5 = 1
var12 = 7.06
var13 = 10.97
var14 = 4
var15 = 7
var19 = 1
Return
label dashattack
var16 = 40
var10 = 28.59
var11 = 1.12
var5 = 1
var12 = 7
var13 = 6.62
var14 = 12
var15 = 15
var19 = 0
Return
label dashattack_mid
var10 = 24.83
var11 = -2.58
var5 = 1
var12 = 6.05
var13 = 5.68
var14 = 12
var15 = 15
var19 = 1
Return
label dashattack_strong
var10 = 38.37
var11 = 2.07
var5 = 1
var12 = 5.42
var13 = 6.66
var14 = 12
var15 = 15
var19 = 2
Return
label ftilt
var16 = 35
var10 = 2.73
var11 = -5.54
var5 = 1
var12 = 10.81
var13 = 8.5
var14 = 7
var15 = 10
var19 = 0
Return
label ftilt_strong
var10 = 16.38
var11 = -0.76
var5 = 1
var12 = 6.66
var13 = 12.87
var14 = 7
var15 = 10
var19 = 1
Return
label utilt
var16 = 31
var10 = 2.14
var11 = -10.18
var5 = 1
var12 = 5.86
var13 = 5.5
var14 = 6
var15 = 8
var19 = 0
Return
label utilt_start_outer
var10 = 4.63
var11 = -6.7
var5 = 1
var12 = 8.87
var13 = 12.41
var14 = 6
var15 = 8
var19 = 1
Return
label utilt_end_inner
var10 = -1.29
var11 = -9.42
var5 = 0
var12 = 5.83
var13 = 5.88
var14 = 9
var15 = 12
var19 = 2
Return
label utilt_end_outer
var10 = -11.93
var11 = -8.71
var5 = 0
var12 = 12.77
var13 = 11.51
var14 = 9
var15 = 12
var19 = 3
Return
label dtilt
var16 = 19
var10 = 16.44
var11 = 1.3
var5 = 1
var12 = 4.07
var13 = 4.15
var14 = 7
var15 = 9
var19 = 0
Return
label dtilt_inner
var10 = 7.71
var11 = -1.59
var5 = 1
var12 = 5.07
var13 = 4.4
var14 = 7
var15 = 9
var19 = 1
Return
label dtilt_outer
var10 = 21.28
var11 = 2.84
var5 = 1
var12 = 4.11
var13 = 4.15
var14 = 7
var15 = 9
var19 = 2
Return
label fsmash
var16 = 48
var10 = 4.93
var11 = 3.57
var5 = 1
var12 = 11.72
var13 = 13.75
var14 = 11
var15 = 14
var19 = 0
Return
label fsmash_outer
var10 = 9.24
var11 = 3.17
var5 = 1
var12 = 11.98
var13 = 16.21
var14 = 11
var15 = 14
var19 = 1
Return
label usmash
var16 = 41
var10 = -10.59
var11 = -3.34
var5 = 0
var12 = 10.59
var13 = 4.3
var14 = 9
var15 = 13
var19 = 0
Return
label usmash_mid
var10 = -4.41
var11 = -16.36
var5 = 0
var12 = 4.78
var13 = 5.07
var14 = 9
var15 = 13
var19 = 1
Return
label usmash_strong
var10 = -4.31
var11 = -23.43
var5 = 0
var12 = 4.39
var13 = 4.68
var14 = 9
var15 = 13
var19 = 2
Return
label dsmash
var16 = 62
var10 = 15.03
var11 = -1.16
var5 = 1
var12 = 4.3
var13 = 4.3
var14 = 6
var15 = 8
var19 = 0
Return
label dsmash_hit1_inner
var10 = 2.16
var11 = -3.04
var5 = 1
var12 = 7.81
var13 = 3.93
var14 = 6
var15 = 8
var19 = 1
Return
label dsmash_hit1_outer
var10 = 20.16
var11 = 0.53
var5 = 1
var12 = 3.91
var13 = 3.91
var14 = 6
var15 = 8
var19 = 2
Return
label dsmash_hit2_mid
var10 = -17.54
var11 = 0.34
var5 = -1
var12 = 3.91
var13 = 3.91
var14 = 21
var15 = 23
var19 = 3
Return
label dsmash_hit2_inner
var10 = -11.89
var11 = -1.51
var5 = -1
var12 = 7.2
var13 = 3.97
var14 = 21
var15 = 23
var19 = 4
Return
label dsmash_hit2_outer
var10 = -21.89
var11 = 1.26
var5 = -1
var12 = 3.91
var13 = 3.91
var14 = 21
var15 = 23
var19 = 5
Return
label nspecial
var16 = 46
var10 = 2.76
var11 = 3.96
var5 = 1
var12 = 8.43
var13 = 13.73
var14 = 17
var15 = 22
var19 = 0
Return
label nspecial_mid
var10 = -1.05
var11 = -1.74
var5 = 0
var12 = 4.53
var13 = 5.28
var14 = 17
var15 = 22
var19 = 1
Return
label nspecial_strong
var10 = -1.02
var11 = 3.7
var5 = 1
var12 = 13.21
var13 = 15.9
var14 = 17
var15 = 22
var19 = 2
Return
label sspecial
var16 = 29
var10 = 2.64
var11 = 2.49
var5 = 1
var12 = 11.86
var13 = 14.11
var14 = 6
var15 = 8
var19 = 0
Return
label grab
var16 = 32
var10 = 4.18
var11 = -4.63
var5 = 1
var12 = 7.28
var13 = 4.36
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
var16 = 49
var10 = -2.83
var11 = -4.83
var5 = 1
var12 = 11.05
var13 = 5.77
var14 = 6
var15 = 7
var19 = 0
Return
label nair_hit1_strong
var10 = -4.7
var11 = -4.63
var5 = 0
var12 = 4.44
var13 = 3.91
var14 = 6
var15 = 7
var19 = 1
Return
label nair_hit2_inner
var10 = -16.24
var11 = -0.66
var5 = 0
var12 = 17.76
var13 = 11.01
var14 = 6
var15 = 21
var19 = 2
Return
label nair_hit2_strong
var10 = -4.42
var11 = -4.63
var5 = 0
var12 = 4.53
var13 = 3.91
var14 = 15
var15 = 21
var19 = 3
Return
label fair
var16 = 29
var10 = -3.13
var11 = -3.25
var5 = 0
var12 = 6.49
var13 = 6.71
var14 = 4
var15 = 7
var19 = 0
Return
label fair_mid
var10 = 0.6
var11 = 1.07
var5 = 1
var12 = 7.18
var13 = 10.45
var14 = 4
var15 = 7
var19 = 1
Return
label fair_outer
var10 = 7.49
var11 = 0.8
var5 = 1
var12 = 6.42
var13 = 12.81
var14 = 4
var15 = 7
var19 = 2
Return
label bair
var16 = 34
var10 = -13.32
var11 = -5.18
var5 = -1
var12 = 7.13
var13 = 5.66
var14 = 7
var15 = 11
var19 = 0
Return
label bair_mid
var10 = -18.28
var11 = -2.43
var5 = -1
var12 = 9.14
var13 = 9.77
var14 = 7
var15 = 11
var19 = 1
Return
label bair_outer
var10 = -23.66
var11 = 2.65
var5 = -1
var12 = 12.77
var13 = 14.84
var14 = 7
var15 = 11
var19 = 2
Return
label uair
var16 = 43
var10 = -9.11
var11 = -8.42
var5 = 0
var12 = 8.18
var13 = 6.12
var14 = 5
var15 = 8
var19 = 0
Return
label uair_mid
var10 = -12.28
var11 = -12.24
var5 = 0
var12 = 12.33
var13 = 6.51
var14 = 5
var15 = 8
var19 = 1
Return
label uair_outer
var10 = -14.71
var11 = -10.41
var5 = 0
var12 = 15.81
var13 = 9.7
var14 = 5
var15 = 8
var19 = 2
Return
label dair
var16 = 59
var10 = -8.79
var11 = -0.64
var5 = 0
var12 = 8.04
var13 = 6.13
var14 = 6
var15 = 9
var19 = 0
Return
label dair_mid
var10 = -13.58
var11 = 3.98
var5 = 0
var12 = 12.09
var13 = 8.52
var14 = 6
var15 = 9
var19 = 1
Return
label dair_outer
var10 = -18
var11 = 8.5
var5 = 0
var12 = 16.38
var13 = 10.39
var14 = 6
var15 = 9
var19 = 2
Return

Return
Return
