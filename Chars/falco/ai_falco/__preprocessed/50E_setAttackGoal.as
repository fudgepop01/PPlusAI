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
Goto dashattack
Goto dashattack_weak
elif Equal var20 3
Goto ftilt
elif Equal var20 4
Goto utilt
elif Equal var20 5
Goto dtilt
elif Equal var20 6
Goto fsmash
elif Equal var20 7
Goto usmash
elif Equal var20 8
Goto usmash
Goto usmash_back
elif Equal var20 9
Goto dsmash
elif Equal var20 10
Goto nspecial
elif Equal var20 11
Goto nspecialair
elif Equal var20 12
Goto dspecial
elif Equal var20 13
Goto dspecialair
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
Goto nair_weak
elif Equal var20 21
Goto fair
elif Equal var20 22
Goto bair
elif Equal var20 23
Goto bair
Goto bair_weak
elif Equal var20 24
Goto uair
elif Equal var20 25
Goto uair
Goto uair_hit2
elif Equal var20 26
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

if !(True) || Equal var20 11|| Equal var20 13|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25|| Equal var20 26
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

if !(True) || Equal var20 11|| Equal var20 13|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25|| Equal var20 26
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

if !(True) || Equal var20 11|| Equal var20 13|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25|| Equal var20 26
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
//   var9 -= 13
// endif

// var17 = TopNY + YDistBackEdge
// if SamePlane && var9 <= var17 && !(MeteoChance)
//   var9 = var17
// endif

var23 = var11 + var13
var9 += var23

if !(True) || Equal var20 11|| Equal var20 13|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25|| Equal var20 26
  if NumJumps > 0 && var9 > 38
    var22 = var9 - 38
    var22 = 38 - var22
    var9 -= var22
  endif
  if var9 < 16 && Equal AirGroundState 1 && !(Equal CurrAction 10) && SamePlane
    var9 = 16
  endif
elif SamePlane && OYDistBackEdge < -76 
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
var10 = 7.72
var11 = -4.33
var14 = 2
var15 = 3
Return
label dashattack
var10 = 8.24
var11 = -3.91
var14 = 4
var15 = 7
Return
label dashattack_weak
var10 = 12.67
var11 = -3.9
var14 = 8
var15 = 17
Return
label ftilt
var10 = 0.64
var11 = -5.66
var14 = 5
var15 = 9
Return
label utilt
var10 = -10.36
var11 = 0.66
var14 = 5
var15 = 11
Return
label dtilt
var10 = 2.06
var11 = -0.27
var14 = 7
var15 = 9
Return
label fsmash
var10 = 11.62
var11 = -1.21
var14 = 13
var15 = 22
Return
label usmash
var10 = 1.16
var11 = -1.07
var14 = 8
var15 = 11
Return
label usmash_back
var10 = -12.26
var11 = -12.54
var14 = 12
var15 = 17
Return
label dsmash
var10 = -14.66
var11 = 4.08
var14 = 7
var15 = 11
Return
label nspecial
var10 = 5
var11 = -1
var14 = 20
var15 = 30
Return
label nspecialair
var10 = 80
var11 = 0
var14 = 17
var15 = 30
Return
label dspecial
var10 = -6
var11 = -1
var14 = 1
var15 = 1
Return
label dspecialair
var10 = -6
var11 = -1
var14 = 1
var15 = 1
Return
label grab
var10 = 2.43
var11 = -3.82
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
var10 = -3.45
var11 = -0.61
var14 = 4
var15 = 7
Return
label nair_weak
var10 = -3.58
var11 = -0.22
var14 = 8
var15 = 31
Return
label fair
var10 = -0.02
var11 = -4.24
var14 = 6
var15 = 8
Return
label bair
var10 = -14.97
var11 = -1.82
var14 = 4
var15 = 7
Return
label bair_weak
var10 = -14.91
var11 = -1.52
var14 = 8
var15 = 19
Return
label uair
var10 = -6
var11 = -5.9
var14 = 8
var15 = 9
Return
label uair_hit2
var10 = -7.32
var11 = -6.4
var14 = 11
var15 = 14
Return
label dair
var10 = -5.17
var11 = 1.46
var14 = 5
var15 = 24
Return
Return
Return
