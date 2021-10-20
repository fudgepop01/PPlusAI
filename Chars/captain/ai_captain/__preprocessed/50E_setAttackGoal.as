#include <Definition_AIMain.h>
id 0x850E
unk 0x0

XReciever
Cmd30

var0 = var8
var1 = var9

if Equal var20 0
Goto dashattack
elif Equal var20 1
Goto ftilt
elif Equal var20 2
Goto utilt
elif Equal var20 3
Goto dtilt
elif Equal var20 4
Goto fsmash
elif Equal var20 5
Goto usmash
elif Equal var20 6
Goto dsmash
elif Equal var20 7
Goto dsmash
Goto dsmash_late
elif Equal var20 8
Goto sspecial
elif Equal var20 9
Goto grab
elif Equal var20 10
Goto grab
Goto fthrow
elif Equal var20 11
Goto grab
Goto dthrow
elif Equal var20 12
Goto grab
Goto bthrow
elif Equal var20 13
Goto grab
Goto uthrow
elif Equal var20 14
Goto nair
elif Equal var20 15
Goto nair
Goto nair_hit2
elif Equal var20 16
Goto fair
elif Equal var20 17
Goto fair
Goto fair_weak
elif Equal var20 18
Goto bair
elif Equal var20 19
Goto uair
elif Equal var20 20
Goto uair
Goto uair_tipman
elif Equal var20 21
Goto dair
elif Equal var20 22
Goto dair
Goto dair_spike
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

if !(True) || Equal var20 14|| Equal var20 15|| Equal var20 16|| Equal var20 17|| Equal var20 18|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22
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
if OAnimFrame < 2
  var8 = OTopNX + OTotalXSpeed * var23
else
  EstOXCoord var8 var23
  DrawDebugRectOutline var8 OTopNY 5 5 255 255 0 136
endif

if !(True) || Equal var20 14|| Equal var20 15|| Equal var20 16|| Equal var20 17|| Equal var20 18|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22
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

if !(True) || Equal var20 14|| Equal var20 15|| Equal var20 16|| Equal var20 17|| Equal var20 18|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22
  var23 *= Direction
else
  var23 *= OPos
endif

var8 -= var23
var8 += TopNX

// TODO: under/overshoot

if OAnimFrame < 2
  var9 = OSCDBottom + OTotalYSpeed * var17
else
  EstOYCoord var9 var17
endif
if AnimFrame < 2
  var23 = TopNY + TotalYSpeed * var17
else
  EstYCoord var23 var17
endif
var9 -= var23
var9 += TopNY



// if OYDistBackEdge < -30
//   var9 -= 12
// endif

// var17 = TopNY + YDistBackEdge
// if SamePlane && var9 <= var17 && !(MeteoChance)
//   var9 = var17
// endif

var23 = var11 + var13
var9 += var23

if !(True) || Equal var20 14|| Equal var20 15|| Equal var20 16|| Equal var20 17|| Equal var20 18|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22
  if NumJumps > 0 && var9 > 28
    var22 = var9 - 28
    var22 = 28 - var22
    var9 -= var22
  endif
  if var9 < 15 && Equal AirGroundState 1 && !(Equal CurrAction 10) && SamePlane
    var9 = 15
  endif
elif SamePlane && OYDistBackEdge < -56 
  if Equal OAirGroundState 2 && Rnd < 0.1
    Call MainHub
  endif
  var9 = TopNY + YDistBackEdge
endif

if OCurrAction >= 67 && OCurrAction <= 73
elif OXDistBackEdge > -30 && OXDistFrontEdge < 30
elif True
  GetAttribute var22 7 0 
  if Equal var21 16.1
    var22 = OXSpeed * OPos
    if OCurrAction >= 2 && OCurrAction <= 25 && var22 > 0
    else
      var22 *= OPos * var15 * 0.4
      var8 += var22
    endif
  elif Equal var21 16.3
    var22 *= OPos * var15 * 0.6
    var8 -= var22
  elif Equal var21 16.2
    var22 *= OPos * var15 * 0.4
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


label dashattack
var10 = 9.31
var11 = -2.79
var14 = 7
var15 = 16
Return
label ftilt
var10 = 2.35
var11 = -8.15
var14 = 9
var15 = 11
Return
label utilt
var10 = -0.24
var11 = 3.79
var14 = 17
var15 = 22
Return
label dtilt
var10 = 0.59
var11 = 1.61
var14 = 10
var15 = 15
Return
label fsmash
var10 = 5.73
var11 = -5.3
var14 = 19
var15 = 21
Return
label usmash
var10 = -2.55
var11 = -2.89
var14 = 22
var15 = 29
Return
label dsmash
var10 = 4.7
var11 = -6.99
var14 = 20
var15 = 23
Return
label dsmash_late
var10 = -19.56
var11 = -3.95
var14 = 30
var15 = 32
Return
label sspecial
var10 = -1.56
var11 = -1.41
var14 = 4
var15 = 8
Return
label grab
var10 = -0.91
var11 = -5.94
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
var10 = -3.17
var11 = -0.82
var14 = 20
var15 = 12
Return
label nair_hit2
var15 = 29
Return
label fair
var10 = 0.39
var11 = -0.84
var14 = 14
var15 = 0
Return
label fair_weak
var10 = 1.09
var11 = -0.77
var14 = 17
var15 = 30
Return
label bair
var10 = -16.52
var11 = -1.13
var14 = 10
var15 = 13
Return
label uair
var10 = -5.5
var11 = -2.37
var14 = 6
var15 = 10
Return
label uair_tipman
var10 = -16.75
var11 = -6.93
var14 = 11
var15 = 13
Return
label dair
var10 = -5.76
var11 = 10.97
var14 = 16
var15 = 20
Return
label dair_spike
var10 = -5.4
var11 = -3.01
Return
Return
Return
