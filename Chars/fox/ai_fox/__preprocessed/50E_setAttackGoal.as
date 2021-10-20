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
Goto dsmash
elif Equal var20 8
Goto nspecial
elif Equal var20 9
Goto nspecialair
elif Equal var20 10
Goto dspecial
elif Equal var20 11
Goto dspecialair
elif Equal var20 12
Goto grab
elif Equal var20 13
Goto grab
Goto fthrow
elif Equal var20 14
Goto grab
Goto dthrow
elif Equal var20 15
Goto grab
Goto bthrow
elif Equal var20 16
Goto grab
Goto uthrow
elif Equal var20 17
Goto nair
elif Equal var20 18
Goto nair
Goto nair_weak
elif Equal var20 19
Goto fair
elif Equal var20 20
Goto bair
elif Equal var20 21
Goto bair
Goto bair_weak
elif Equal var20 22
Goto uair
elif Equal var20 23
Goto uair
Goto uair_weak
elif Equal var20 24
Goto dair
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

if !(True) || Equal var20 9|| Equal var20 11|| Equal var20 17|| Equal var20 18|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24
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

if !(True) || Equal var20 9|| Equal var20 11|| Equal var20 17|| Equal var20 18|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24
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

if !(True) || Equal var20 9|| Equal var20 11|| Equal var20 17|| Equal var20 18|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24
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
//   var9 -= 22.344
// endif

// var17 = TopNY + YDistBackEdge
// if SamePlane && var9 <= var17 && !(MeteoChance)
//   var9 = var17
// endif

var23 = var11 + var13
var9 += var23

if !(True) || Equal var20 9|| Equal var20 11|| Equal var20 17|| Equal var20 18|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24
  if NumJumps > 0 && var9 > 39.514
    var22 = var9 - 39.514
    var22 = 39.514 - var22
    var9 -= var22
  endif
  if var9 < 25.344 && Equal AirGroundState 1 && !(Equal CurrAction 10) && SamePlane
    var9 = 25.344
  endif
elif SamePlane && OYDistBackEdge < -79.028 
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
var10 = 3.46
var11 = -3
var14 = 2
var15 = 3
Return
label dashattack
var10 = 9.63
var11 = -0.29
var14 = 4
var15 = 17
Return
label ftilt
var10 = -0.84
var11 = -3.69
var14 = 5
var15 = 8
Return
label utilt
var10 = -10.86
var11 = 1.44
var14 = 5
var15 = 11
Return
label dtilt
var10 = 7.74
var11 = 1.43
var14 = 7
var15 = 9
Return
label fsmash
var10 = 12.37
var11 = -3.48
var14 = 9
var15 = 13
Return
label usmash
var10 = 2.22
var11 = -0.72
var14 = 5
var15 = 7
Return
label dsmash
var10 = -13.68
var11 = 3.73
var14 = 7
var15 = 11
Return
label nspecial
var10 = 5
var11 = -2
var14 = 20
var15 = 30
Return
label nspecialair
var10 = 80
var11 = -2
var14 = 50
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
label grab
var10 = 1.77
var11 = -2.84
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
var10 = -3.77
var11 = -0.08
var14 = 4
var15 = 7
Return
label nair_weak
var10 = -3.75
var11 = -0.03
var14 = 8
var15 = 31
Return
label fair
var10 = -0.95
var11 = -3.34
var14 = 6
var15 = 8
Return
label bair
var10 = -13.41
var11 = -1.38
var14 = 4
var15 = 7
Return
label bair_weak
var10 = -13.34
var11 = -1.15
var14 = 8
var15 = 19
Return
label uair
var10 = -5.05
var11 = -4.33
var14 = 8
var15 = 14
Return
label uair_weak
var10 = -5.05
var11 = -4.33
var14 = 8
var15 = 14
Return
label dair
var10 = -4.34
var11 = 2.33
var14 = 5
var15 = 24
Return
Return
Return
