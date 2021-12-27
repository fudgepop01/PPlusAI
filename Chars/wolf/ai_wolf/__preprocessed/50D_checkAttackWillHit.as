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

if !(True) || Equal var20 11|| Equal var20 13|| Equal var20 15|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25|| Equal var20 26|| Equal var20 27
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
if !(True)  || Equal var20 0 || Equal var20 2 || Equal var20 3 || Equal var20 4 || Equal var20 5 || Equal var20 8 || Equal var20 9 || Equal var20 10 || Equal var20 12
    var23 = var17 - 25
    if var23 <= var12 && var22 <= var13
      if Equal CurrAction 3 || Equal CurrAction 8
        if AnimFrame < 5
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
if !(True) || Equal var20 11|| Equal var20 13|| Equal var20 15|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25|| Equal var20 26|| Equal var20 27
elif var23 > 12.344
  var20 = -1
endif

if Equal IsOnStage 1
if !(True) || Equal var20 11|| Equal var20 13|| Equal var20 15|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25|| Equal var20 26|| Equal var20 27
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
if !(True) || Equal var20 11|| Equal var20 13|| Equal var20 15|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25|| Equal var20 26|| Equal var20 27
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

Return


// populates ranges, hitframes, and IASA
label jab123
var16 = 34
var10 = 15.84
var11 = 1.18
var5 = 1
var12 = 5.79
var13 = 6.4
var14 = 4
var15 = 5
var19 = 0
Return
label dashattack
var16 = 39
var10 = 22.13
var11 = -4.76
var5 = 1
var12 = 7.77
var13 = 11.07
var14 = 11
var15 = 15
var19 = 0
Return
label ftilt
var16 = 31
var10 = 2
var11 = -0.5
var5 = 1
var12 = 10
var13 = 6
var14 = 7
var15 = 10
var19 = 0
Return
label utilt
var16 = 26
var10 = -2.94
var11 = -0.02
var5 = 0
var12 = 7.72
var13 = 13.37
var14 = 6
var15 = 10
var19 = 0
Return
label dtilt
var16 = 26
var10 = 2.99
var11 = 1.09
var5 = 1
var12 = 10.53
var13 = 5.18
var14 = 9
var15 = 10
var19 = 0
Return
label fsmash
var16 = 48
var10 = 0.68
var11 = 0
var5 = 1
var12 = 19.56
var13 = 5
var14 = 11
var15 = 17
var19 = 0
Return
label usmash
var16 = 50
var10 = -8.37
var11 = 0.97
var5 = 1
var12 = 14.37
var13 = 13.92
var14 = 12
var15 = 17
var19 = 0
Return
label usmash_late
var10 = -23.36
var11 = 0.61
var5 = -1
var12 = 12.18
var13 = 13.74
var14 = 18
var15 = 25
var19 = 1
Return
label dsmash
var16 = 44
var10 = 3.03
var11 = 2.24
var5 = 1
var12 = 8.87
var13 = 5.22
var14 = 9
var15 = 10
var19 = 0
Return
label dsmash_late
var10 = -18.24
var11 = 2.25
var5 = -1
var12 = 8.5
var13 = 5.35
var14 = 15
var15 = 16
var19 = 1
Return
label nspecial
var16 = 80
var10 = 0
var11 = -2
var5 = 1
var12 = 200
var13 = 2
var14 = 20
var15 = 30
var19 = 0
Return
label nspecialair
var16 = 80
var10 = 0
var11 = -2
var5 = 1
var12 = 60
var13 = 2
var14 = 10
var15 = 30
var19 = 0
Return
label dspecial
var16 = 11
var10 = -8
var11 = 1.5
var5 = 0
var12 = 8
var13 = 8
var14 = 1
var15 = 1
var19 = 0
Return
label dspecialair
var16 = 11
var10 = -8
var11 = 1.5
var5 = 0
var12 = 8
var13 = 8
var14 = 1
var15 = 1
var19 = 0
Return
label sspecial
var16 = 59
var10 = 28
var11 = -14
var5 = 1
var12 = 6
var13 = 8
var14 = 17
var15 = 20
var19 = 0
Return
label sspecialair
var16 = 59
var10 = 28
var11 = -14
var5 = 1
var12 = 6
var13 = 8
var14 = 17
var15 = 20
var19 = 0
Return
label grab
var16 = 32
var10 = 1.3
var11 = -1.5
var5 = 1
var12 = 6
var13 = 4.5
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
var16 = 40
var10 = -7.79
var11 = 1.8
var5 = 0
var12 = 7.8
var13 = 8.33
var14 = 7
var15 = 24
var19 = 0
Return
label fair
var16 = 29
var10 = -0.91
var11 = 1.35
var5 = 1
var12 = 8.97
var13 = 7.32
var14 = 11
var15 = 14
var19 = 0
Return
label bair
var16 = 28
var10 = -16.58
var11 = -1.86
var5 = -1
var12 = 8.84
var13 = 4.86
var14 = 7
var15 = 10
var19 = 0
Return
label uair
var16 = 29
var10 = -0.11
var11 = -3.93
var5 = 1
var12 = 8.18
var13 = 5.5
var14 = 7
var15 = 7
var19 = 0
Return
label uair_late
var10 = -14.58
var11 = -0.49
var5 = 0
var12 = 15.41
var13 = 12.97
var14 = 8
var15 = 11
var19 = 1
Return
label dair
var16 = 36
var10 = -5.5
var11 = 10.5
var5 = 0
var12 = 6
var13 = 7.5
var14 = 13
var15 = 15
var19 = 0
Return
label dair_meteor
var10 = -5.5
var11 = 10.5
var5 = 0
var12 = 6
var13 = 7.5
var14 = 13
var15 = 15
var19 = 1
Return

Return
Return
