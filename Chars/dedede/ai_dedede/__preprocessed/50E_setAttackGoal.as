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
Goto dsmash
Goto dsmash_hit2
elif Equal var20 9
Goto nspecial
elif Equal var20 10
Goto nspecialair
elif Equal var20 11
Goto dspecial
elif Equal var20 12
Goto sspecial
elif Equal var20 13
Goto sspecialair
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

if !(True) || Equal var20 10|| Equal var20 13|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25
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

if !(True) || Equal var20 10|| Equal var20 13|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25
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

if !(True) || Equal var20 10|| Equal var20 13|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25
if !(True) || Equal var20 10
    var23 *= OPos
elif !(True)
    var23 *= OPos
elif !(True)
    var23 *= OPos
elif !(True) || Equal var20 13
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
//   var9 -= 12
// endif

// var17 = TopNY + YDistBackEdge
// if SamePlane && var9 <= var17 && !(MeteoChance)
//   var9 = var17
// endif

var23 = (var11 * -1) + var13
var9 -= var23

if !(True) || Equal var20 10|| Equal var20 13|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25
  if var9 < 15 && Equal AirGroundState 1 && !(Equal CurrAction 10) && SamePlane && OYDistBackEdge >= -30
    var9 = TopNY + 15
  endif

  if SamePlane && OYDistBackEdge >= -30 && Equal AirGroundState 1 && !(Equal CurrAction 10)
    var9 = TopNY + 15
  endif

  // if Equal AirGroundState 1
  //   var9 = TopNY + 15 * 4
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
var10 = 6.68
var11 = -0.25
var14 = 8
var15 = 10
Return
label dashattack
var10 = 15.12
var11 = 1.81
var14 = 26
var15 = 29
Return
label ftilt
var10 = 5.94
var11 = -1.08
var14 = 12
var15 = 15
Return
label utilt
var10 = -16.02
var11 = -4.59
var14 = 7
var15 = 17
Return
label dtilt
var10 = 4.86
var11 = 1.79
var14 = 6
var15 = 8
Return
label fsmash
var10 = -0.29
var11 = 8.85
var14 = 40
var15 = 43
Return
label usmash
var10 = -23.09
var11 = 0.16
var14 = 18
var15 = 24
Return
label dsmash
var10 = -0.4
var11 = -0.78
var14 = 15
var15 = 18
Return
label dsmash_hit2
var10 = -27.15
var11 = 0.5
var14 = 19
var15 = 24
Return
label nspecial
var10 = -5
var11 = 0
var14 = 17
var15 = 19
Return
label nspecialair
var10 = -5
var11 = 0
var14 = 17
var15 = 19
Return
label dspecial
var10 = -4.01
var11 = -5.36
var14 = 8
var15 = 10
Return
label sspecial
var10 = 0
var11 = 10
var14 = 30
var15 = 51 // just a dummy
Return
label sspecialair
var10 = 0
var11 = 10
var14 = 30
var15 = 51 // just a dummy
Return
label grab
var10 = 3.54
var11 = -0.09
var14 = 7
var15 = 8
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
var10 = -11.06
var11 = 3.06
var14 = 6
var15 = 7
Return
label nair_weak
var10 = -11.06
var11 = 3.06
var14 = 8
var15 = 28
Return
label fair
var10 = 1.01
var11 = 3.37
var14 = 13
var15 = 18
Return
label bair
var10 = -20.58
var11 = 0.45
var14 = 6
var15 = 8
Return
label bair_weak
var10 = -19.79
var11 = 0.77
var14 = 9
var15 = 21
Return
label uair
var10 = -9.1
var11 = -11.06
var14 = 10
var15 = 24
Return
label dair
var10 = -7.11
var11 = 16.17
var14 = 9
var15 = 26
Return
Return
Return
