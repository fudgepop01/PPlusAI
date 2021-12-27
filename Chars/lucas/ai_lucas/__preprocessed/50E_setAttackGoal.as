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
Goto jab123_2
elif Equal var20 2
Goto dashattack
elif Equal var20 3
Goto dashattack
Goto dashattack_weak
elif Equal var20 4
Goto ftilt
elif Equal var20 5
Goto utilt
elif Equal var20 6
Goto utilt
Goto utilt_weak
elif Equal var20 7
Goto dtilt
elif Equal var20 8
Goto fsmash
elif Equal var20 9
Goto fsmash
Goto fsmash_strong
elif Equal var20 10
Goto dsmash
elif Equal var20 11
Goto dsmash
Goto dsmash_strong
elif Equal var20 12
Goto dsmash
Goto dsmash2
elif Equal var20 13
Goto nspecial
elif Equal var20 14
Goto nspecial
Goto nspecial_charge
elif Equal var20 15
Goto nspecialair
elif Equal var20 16
Goto dspecial
elif Equal var20 17
Goto dspecial
elif Equal var20 18
Goto sspecial
elif Equal var20 19
Goto sspecialair
elif Equal var20 20
Goto grab
elif Equal var20 21
Goto grab
Goto fthrow
elif Equal var20 22
Goto grab
Goto dthrow
elif Equal var20 23
Goto grab
Goto bthrow
elif Equal var20 24
Goto grab
Goto uthrow
elif Equal var20 25
Goto nair
elif Equal var20 26
Goto fair
elif Equal var20 27
Goto bair
elif Equal var20 28
Goto uair
elif Equal var20 29
Goto dair
elif Equal var20 30
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

if !(True) || Equal var20 15|| Equal var20 19|| Equal var20 25|| Equal var20 26|| Equal var20 27|| Equal var20 28|| Equal var20 29|| Equal var20 30
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

if !(True) || Equal var20 15|| Equal var20 19|| Equal var20 25|| Equal var20 26|| Equal var20 27|| Equal var20 28|| Equal var20 29|| Equal var20 30
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

if !(True) || Equal var20 15|| Equal var20 19|| Equal var20 25|| Equal var20 26|| Equal var20 27|| Equal var20 28|| Equal var20 29|| Equal var20 30
if !(True) || Equal var20 15
    var23 *= OPos
elif !(True)
    var23 *= OPos
elif !(True)
    var23 *= OPos
elif !(True) || Equal var20 19
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
//   var9 -= 9.344
// endif

// var17 = TopNY + YDistBackEdge
// if SamePlane && var9 <= var17 && !(MeteoChance)
//   var9 = var17
// endif

var23 = (var11 * -1) + var13
var9 -= var23

if !(True) || Equal var20 15|| Equal var20 19|| Equal var20 25|| Equal var20 26|| Equal var20 27|| Equal var20 28|| Equal var20 29|| Equal var20 30
  if var9 < 12.344 && Equal AirGroundState 1 && !(Equal CurrAction 10) && SamePlane && OYDistBackEdge >= -30
    var9 = TopNY + 12.344
  endif

  if SamePlane && OYDistBackEdge >= -30 && Equal AirGroundState 1 && !(Equal CurrAction 10)
    var9 = TopNY + 12.344
  endif

  // if Equal AirGroundState 1
  //   var9 = TopNY + 12.344 * 4
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
var10 = 1.96
var11 = -1.87
var14 = 2
var15 = 4
Return
label jab123_2
var10 = 6.76
var11 = -1.42
var14 = 10
var15 = 12
Return
label dashattack
var10 = 9.1
var11 = -0.5
var14 = 6
var15 = 8
Return
label dashattack_weak
var10 = 14.94
var11 = -0.5
var14 = 9
var15 = 16
Return
label ftilt
var10 = 2.08
var11 = -0.61
var14 = 6
var15 = 9
Return
label utilt
var10 = -1.45
var11 = -0.08
var14 = 7
var15 = 8
Return
label utilt_weak
var10 = -10.11
var11 = -6.32
var14 = 9
var15 = 12
Return
label dtilt
var10 = 3.66
var11 = 0.53
var14 = 3
var15 = 4
Return
label fsmash
var10 = -1.82
var11 = -0.06
var14 = 15
var15 = 17
Return
label fsmash_strong
Return
label dsmash
var10 = 1.52
var11 = 3
var14 = 21
var15 = 26
Return
label dsmash_strong
Return
label dsmash2
var10 = 1.52
var11 = 3
var14 = 29
var15 = 33
Return
label nspecial
var10 = -6.45
var11 = -2.62
var14 = 2
var15 = 3
Return
label nspecial_charge
var10 = -20
var11 = -20
var14 = 10
var15 = 10
Return
label nspecialair
var10 = -6.45
var11 = -2.62
var14 = 2
var15 = 3
Return
label dspecial
var10 = -0.05
var11 = -2.2
var14 = 6
var15 = 8
Return
label dspecialair
var10 = -0.05
var11 = -2.2
var14 = 6
var15 = 8
Return
label sspecial
var10 = 0
var11 = 0
var14 = 25
var15 = 45
Return
label sspecialair
var10 = 0
var11 = 0
var14 = 25
var15 = 45
Return
label grab
var10 = 3.92
var11 = -1.31
var14 = 11
var15 = 13
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
var10 = -7.25
var11 = 2.5
var14 = 4
var15 = 19
Return
label fair
var10 = -2.09
var11 = 1.09
var14 = 5
var15 = 10
Return
label bair
var10 = -13.52
var11 = 10.23
var14 = 14
var15 = 16
Return
label uair
var10 = -12.14
var11 = 2.13
var14 = 5
var15 = 9
Return
label dair
var10 = -4.84
var11 = 8.6
var14 = 4
var15 = 21
Return
label dair_spike
var10 = -4.84
var11 = 8.6
var14 = 19
var15 = 21
Return
Return
Return
