#include <Definition_AIMain.h>
id 0x850E
unk 0x0

XReciever
Cmd30

var0 = var8
var1 = var9

if Equal var20 0
Goto jab123
elif Equal var20 1
Goto dashattack
elif Equal var20 2
Goto ftilt
elif Equal var20 3
Goto utilt
elif Equal var20 4
Goto dtilt
elif Equal var20 5
Goto fsmash
elif Equal var20 6
Goto usmash
elif Equal var20 7
Goto usmash
Goto usmash_late
elif Equal var20 8
Goto dsmash
elif Equal var20 9
Goto dsmash
Goto dsmash_late
elif Equal var20 10
Goto nspecial
elif Equal var20 11
Goto nspecialair
elif Equal var20 12
Goto dspecial
elif Equal var20 13
Goto dspecialair
elif Equal var20 14
Goto sspecial
elif Equal var20 15
Goto sspecialair
elif Equal var20 16
Goto grab
elif Equal var20 17
Goto grab
Goto fthrow
elif Equal var20 18
Goto grab
Goto dthrow
elif Equal var20 19
Goto grab
Goto bthrow
elif Equal var20 20
Goto grab
Goto uthrow
elif Equal var20 21
Goto nair
elif Equal var20 22
Goto fair
elif Equal var20 23
Goto bair
elif Equal var20 24
Goto uair
elif Equal var20 25
Goto uair
Goto uair_late
elif Equal var20 26
Goto dair
elif Equal var20 27
Goto dair
Goto dair_meteor
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

if !(True) || Equal var20 11|| Equal var20 13|| Equal var20 15|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25|| Equal var20 26|| Equal var20 27
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

if !(True) || Equal var20 11|| Equal var20 13|| Equal var20 15|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25|| Equal var20 26|| Equal var20 27
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

if !(True) || Equal var20 11|| Equal var20 13|| Equal var20 15|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25|| Equal var20 26|| Equal var20 27
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
//   var9 -= 9.344
// endif

// var17 = TopNY + YDistBackEdge
// if SamePlane && var9 <= var17 && !(MeteoChance)
//   var9 = var17
// endif

var23 = var11 + var13
var9 += var23

if !(True) || Equal var20 11|| Equal var20 13|| Equal var20 15|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25|| Equal var20 26|| Equal var20 27
  if NumJumps > 0 && var9 > 33.514
    var22 = var9 - 33.514
    var22 = 33.514 - var22
    var9 -= var22
  endif
  if var9 < 12.344 && Equal AirGroundState 1 && !(Equal CurrAction 10) && SamePlane
    var9 = 12.344
  endif
elif SamePlane && OYDistBackEdge < -67.028 
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


label jab123
var10 = 15.84
var11 = 1.18
var14 = 4
var15 = 5
Return
label dashattack
var10 = 22.13
var11 = -4.76
var14 = 11
var15 = 15
Return
label ftilt
var10 = 2
var11 = -0.5
var14 = 7
var15 = 10
Return
label utilt
var10 = -2.94
var11 = -0.02
var14 = 6
var15 = 10
Return
label dtilt
var10 = 2.99
var11 = 1.09
var14 = 9
var15 = 10
Return
label fsmash
var10 = 0.68
var11 = 0
var14 = 11
var15 = 17
Return
label usmash
var10 = -8.37
var11 = 0.97
var14 = 12
var15 = 17
Return
label usmash_late
var10 = -23.36
var11 = 0.61
var14 = 18
var15 = 25
Return
label dsmash
var10 = 3.03
var11 = 2.24
var14 = 9
var15 = 10
Return
label dsmash_late
var10 = -18.24
var11 = 2.25
var14 = 15
var15 = 16
Return
label nspecial
var10 = 5
var11 = -2
var14 = 20
var15 = 30
Return
label nspecialair
var10 = 5
var11 = -2
var14 = 10
var15 = 30
Return
label dspecial
var10 = -8
var11 = 1.5
var14 = 1
var15 = 1
Return
label dspecialair
var10 = -8
var11 = 1.5
var14 = 1
var15 = 1
Return
label sspecial
var10 = 28
var11 = -14
var14 = 17
var15 = 20
Return
label sspecialair
var10 = 28
var11 = -14
var14 = 17
var15 = 20
Return
label grab
var10 = 1.3
var11 = -1.5
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
var10 = -7.79
var11 = 1.8
var14 = 7
var15 = 24
Return
label fair
var10 = -0.91
var11 = 1.35
var14 = 11
var15 = 14
Return
label bair
var10 = -16.58
var11 = -1.86
var14 = 7
var15 = 10
Return
label uair
var10 = -0.11
var11 = -3.93
var14 = 7
var15 = 7
Return
label uair_late
var10 = -14.58
var11 = -0.49
var14 = 8
var15 = 11
Return
label dair
var10 = -5.5
var11 = 10.5
var14 = 13
var15 = 15
Return
label dair_meteor
var10 = -5.5
var11 = 10.5
var14 = 13
var15 = 15
Return
Return
Return
