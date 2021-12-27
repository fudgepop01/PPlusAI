#include <Definition_AIMain.h>
id 0x850E
unk 0x0

XReciever
Cmd30

var0 = var8
var1 = var9

var2 = (1 - (LevelValue / 100)) * 30 + 1
MOD var2 AnimFrame var2

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

if True
  var22 = OTopNX - TopNX
  var17 = OTopNY - TopNY
  Norm var17 var22 var17

  var17 -= 15
  if var17 < 0
    var17 = 0
  endif
  var17 *= 0.1
endif
var17 += var14

if !(True) || Equal var20 34|| Equal var20 35|| Equal var20 36|| Equal var20 37|| Equal var20 38|| Equal var20 39|| Equal var20 40|| Equal var20 41|| Equal var20 42|| Equal var20 43|| Equal var20 44|| Equal var20 45|| Equal var20 46|| Equal var20 47|| Equal var20 48|| Equal var20 49
  if Equal AirGroundState 1
    GetAttribute var23 12 0
    var17 -= var23 - 1
  endif
endif
// var17 *= 0.5

var23 = var17
if Equal OCurrAction 6 || Equal OCurrAction 7
  var23 *= 0.35
elif Equal OPrevAction 6 || Equal OPrevAction 7
  if Equal OCurrAction 3 && OAnimFrame < 4
    var23 *= 0.35
  endif
endif
if Equal var16 3
  var23 -= var2
  var23 += 1
endif
if OAnimFrame < 2
  var8 = OTopNX + OTotalXSpeed * var23
else
  EstOXCoord var8 var23
  DrawDebugRectOutline var8 OTopNY 5 5 255 255 0 136
endif
// var8 = OTopNX

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
    DrawDebugRectOutline var23 TopNY 5 5 0 255 255 136
  endif
elif True
  var23 = TopNX
endif
// var8 -= OTopNX
// var23 -= TopNX
var8 -= var23
var23 = var10 + var12

if !(True) || Equal var20 34|| Equal var20 35|| Equal var20 36|| Equal var20 37|| Equal var20 38|| Equal var20 39|| Equal var20 40|| Equal var20 41|| Equal var20 42|| Equal var20 43|| Equal var20 44|| Equal var20 45|| Equal var20 46|| Equal var20 47|| Equal var20 48|| Equal var20 49
if !(True)
    var23 *= OPos
elif !(True)
    var23 *= OPos
elif !(True)
    var23 *= OPos
elif !(True)
    var23 *= OPos
  else
    var23 *= Direction
  endif
else
  var23 *= OPos
endif

var8 -= var23
var8 += TopNX

// TODO: under/overshoot
if Equal var16 3
  var17 -= var2
  var17 += 1
endif
if OAnimFrame < 2 && !(Equal OYSpeed 0)
  var9 = OSCDBottom + OTotalYSpeed * var17
else
  EstOYCoord var9 var17
endif
if Equal OCurrAction 84
  var9 = OTopNY
endif
if Equal var16 3
  var17 -= 1
  var17 += var2
endif

if AnimFrame < 2
  if TotalYSpeed > 0
    var23 = TopNY + TotalYSpeed * var17 - Gravity * var17
  else
    var23 = TopNY + TotalYSpeed * var17
  endif
else
  EstYCoord var23 var17
endif
var9 -= var23
var9 += TopNY

// if OYDistBackEdge < -30
//   var9 -= 11
// endif

// var17 = TopNY + YDistBackEdge
// if SamePlane && var9 <= var17 && !(MeteoChance)
//   var9 = var17
// endif

var23 = (var11 * -1) + var13
var9 -= var23

if !(True) || Equal var20 34|| Equal var20 35|| Equal var20 36|| Equal var20 37|| Equal var20 38|| Equal var20 39|| Equal var20 40|| Equal var20 41|| Equal var20 42|| Equal var20 43|| Equal var20 44|| Equal var20 45|| Equal var20 46|| Equal var20 47|| Equal var20 48|| Equal var20 49
  if var9 < 14 && Equal AirGroundState 1 && !(Equal CurrAction 10) && SamePlane && OYDistBackEdge >= -30
    var9 = TopNY + 14
  endif

  if SamePlane && OYDistBackEdge >= -30 && Equal AirGroundState 1 && !(Equal CurrAction 10)
    var9 = TopNY + 14
  endif

  // if Equal AirGroundState 1
  //   var9 = TopNY + 14 * 4
  // endif
elif SamePlane
  var9 = TopNY + YDistBackEdge
endif

var17 = OTopNY - TopNY
if var17 > 30 || OYDistBackEdge < -35
elif OCurrAction >= 66 && OCurrAction <= 89
elif Equal HitboxConnected 1 || Equal PrevAction 60
elif !(Equal var21 16.4) && OYDistFloor < 30
  GetAttribute var22 7 1
  if Equal var21 16.1
    if OXDistBackEdge > -20 && OXDistFrontEdge < 20
      var17 = OXSpeed * OPos
      if OCurrAction >= 2 && OCurrAction <= 25 && var17 > 0
      else
        var22 *= OPos * var15 * 0.7
        var8 += var22
      endif
    endif
  elif Equal var21 16.3
    var22 *= OPos * var15 * 0.9
    var8 -= var22
  elif Equal var21 16.2
    var22 *= OPos * var15 * 0.6
    var8 -= var22
  endif 
endif

if Equal CurrAction 10 || Equal var16 1
  var8 = var0
elif Equal var16 2
  var9 = var1
endif

Cmd30
Return


label jab123
var10 = 4.1
var11 = -3.32
var14 = 4
var15 = 7
Return
label jab123_strong
var10 = 14.09
var11 = 2.16
var14 = 4
var15 = 7
Return
label dashattack
var10 = 28.59
var11 = 1.12
var14 = 12
var15 = 15
Return
label dashattack_mid
var10 = 24.83
var11 = -2.58
var14 = 12
var15 = 15
Return
label dashattack_strong
var10 = 38.37
var11 = 2.07
var14 = 12
var15 = 15
Return
label ftilt
var10 = 2.73
var11 = -5.54
var14 = 7
var15 = 10
Return
label ftilt_strong
var10 = 16.38
var11 = -0.76
var14 = 7
var15 = 10
Return
label utilt
var10 = 2.14
var11 = -10.18
var14 = 6
var15 = 8
Return
label utilt_start_outer
var10 = 4.63
var11 = -6.7
var14 = 6
var15 = 8
Return
label utilt_end_inner
var10 = -1.29
var11 = -9.42
var14 = 9
var15 = 12
Return
label utilt_end_outer
var10 = -11.93
var11 = -8.71
var14 = 9
var15 = 12
Return
label dtilt
var10 = 16.44
var11 = 1.3
var14 = 7
var15 = 9
Return
label dtilt_inner
var10 = 7.71
var11 = -1.59
var14 = 7
var15 = 9
Return
label dtilt_outer
var10 = 21.28
var11 = 2.84
var14 = 7
var15 = 9
Return
label fsmash
var10 = 4.93
var11 = 3.57
var14 = 11
var15 = 14
Return
label fsmash_outer
var10 = 9.24
var11 = 3.17
var14 = 11
var15 = 14
Return
label usmash
var10 = -10.59
var11 = -3.34
var14 = 9
var15 = 13
Return
label usmash_mid
var10 = -4.41
var11 = -16.36
var14 = 9
var15 = 13
Return
label usmash_strong
var10 = -4.31
var11 = -23.43
var14 = 9
var15 = 13
Return
label dsmash
var10 = 15.03
var11 = -1.16
var14 = 6
var15 = 8
Return
label dsmash_hit1_inner
var10 = 2.16
var11 = -3.04
var14 = 6
var15 = 8
Return
label dsmash_hit1_outer
var10 = 20.16
var11 = 0.53
var14 = 6
var15 = 8
Return
label dsmash_hit2_mid
var10 = -17.54
var11 = 0.34
var14 = 21
var15 = 23
Return
label dsmash_hit2_inner
var10 = -11.89
var11 = -1.51
var14 = 21
var15 = 23
Return
label dsmash_hit2_outer
var10 = -21.89
var11 = 1.26
var14 = 21
var15 = 23
Return
label nspecial
var10 = 2.76
var11 = 3.96
var14 = 17
var15 = 22
Return
label nspecial_mid
var10 = -1.05
var11 = -1.74
var14 = 17
var15 = 22
Return
label nspecial_strong
var10 = -1.02
var11 = 3.7
var14 = 17
var15 = 22
Return
label sspecial
var10 = 2.64
var11 = 2.49
var14 = 6
var15 = 8
Return
label grab
var10 = 4.18
var11 = -4.63
var14 = 7
var15 = 7
Return
label fthrow
Return
label dthrow
Return
label bthrow
Return
label uthrow
Return
label nair
var10 = -2.83
var11 = -4.83
var14 = 6
var15 = 7
Return
label nair_hit1_strong
var10 = -4.7
var11 = -4.63
var14 = 6
var15 = 7
Return
label nair_hit2_inner
var10 = -16.24
var11 = -0.66
var14 = 6
var15 = 21
Return
label nair_hit2_strong
var10 = -4.42
var11 = -4.63
var14 = 15
var15 = 21
Return
label fair
var10 = -3.13
var11 = -3.25
var14 = 4
var15 = 7
Return
label fair_mid
var10 = 0.6
var11 = 1.07
var14 = 4
var15 = 7
Return
label fair_outer
var10 = 7.49
var11 = 0.8
var14 = 4
var15 = 7
Return
label bair
var10 = -13.32
var11 = -5.18
var14 = 7
var15 = 11
Return
label bair_mid
var10 = -18.28
var11 = -2.43
var14 = 7
var15 = 11
Return
label bair_outer
var10 = -23.66
var11 = 2.65
var14 = 7
var15 = 11
Return
label uair
var10 = -9.11
var11 = -8.42
var14 = 5
var15 = 8
Return
label uair_mid
var10 = -12.28
var11 = -12.24
var14 = 5
var15 = 8
Return
label uair_outer
var10 = -14.71
var11 = -10.41
var14 = 5
var15 = 8
Return
label dair
var10 = -8.79
var11 = -0.64
var14 = 6
var15 = 9
Return
label dair_mid
var10 = -13.58
var11 = 3.98
var14 = 6
var15 = 9
Return
label dair_outer
var10 = -18
var11 = 8.5
var14 = 6
var15 = 9
Return
Return
Return
