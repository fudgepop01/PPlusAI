#include <Definition_AIMain.h>
id 0x850D
unk 0x0

XReciever

Goto getMoveLocationParams
XReciever


var2 = var8
var3 = var9
// adjust for char height
// top of Opponent
var22 = OTopNY + OHurtboxSize
if var3 > var22
  var3 -= OHurtboxSize
  var3 -= OHurtboxSize
elif var3 < OTopNY
  // nothing
else 
  var17 = var22 - var3
  var3 -= var17
  var3 -= var17
endif

// adjust for char "width" 
var22 = OTopNX - 3
var23 = OTopNX + 3
if var2 > var23
  if Equal var5 -1
    var2 -= 3
  else
    var2 += 3
  endif
elif var2 < var22
  if Equal var5 -1
    var2 += 3
  else
    var2 -= 3
  endif
else
  var22 = var2 - OTopNX
  if Equal var5 -1
    var22 *= -1
  endif
  if var22 < 0
    var2 += var22
  else
    var2 -= var22
  endif
endif

var17 = var14

var23 = OHurtboxSize
var13 += var23

var22 = (100 - LevelValue) * 0.2
var10 -= var22
var11 -= var22
var22 *= 0.5
var12 += var22
var13 += var22

if !(True) || Equal var20 13|| Equal var20 15|| Equal var20 16|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25|| Equal var20 26|| Equal var20 27|| Equal var20 28|| Equal var20 29
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
DrawDebugRectOutline var22 var17 var12 var13 0 255 255 221

var22 = var0 
var17 = var1 

DrawDebugRectOutline var22 var17 var12 var13 0 255 0 221

var17 = var0 - TopNX
var22 = var1 - TopNY

Abs var17
Abs var22

if !(Equal var16 1)
if !(True)  || Equal var20 0 || Equal var20 2 || Equal var20 3 || Equal var20 4 || Equal var20 5 || Equal var20 6 || Equal var20 9 || Equal var20 11 || Equal var20 12
    var23 = var17 - 8
    if var23 <= var12 && var22 <= var13
      if Equal CurrAction 3 || Equal CurrAction 8
        if AnimFrame < 6
          var12 -= 5
          if var17 <= var12
            var16 = 3
          elif var0 <= TopNX
            if OPos < 0
              var16 = 1
            else
              var16 = 2
            endif
          elif var0 >= TopNX
            if OPos > 0
              var16 = 1
            else
              var16 = 2
            endif
          endif
          if XDistFrontEdge < 15 || XDistBackEdge > -15
            var16 = 4
          endif
          var15 = -1
          if Rnd < 0.7
            var15 = -2
          endif
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
if !(True) || Equal var20 13|| Equal var20 15|| Equal var20 16|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25|| Equal var20 26|| Equal var20 27|| Equal var20 28|| Equal var20 29
elif var23 > 15
  var20 = -1
endif

if !(True) || Equal var20 13|| Equal var20 15|| Equal var20 16|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25|| Equal var20 26|| Equal var20 27|| Equal var20 28|| Equal var20 29
  if Equal AirGroundState 2
  var17 = var14
  if Equal CurrSubaction JumpSquat
    GetAttribute var22 17 0
    var22 *= -1
  else
    var22 = YSpeed * -1
  endif
  CalcYChange var4 var17 var22 Gravity MaxFallSpeed FastFallSpeed 1

    var22 = var4 + (OSCDBottom - TopNY)
    var22 -= YDistBackEdge
    if var22 > 0
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
    endif
  endif
endif

if var17 <= var12 && var22 <= var13
  if !(Equal var16 1)
if !(True) || Equal var20 13|| Equal var20 15|| Equal var20 16|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25|| Equal var20 26|| Equal var20 27|| Equal var20 28|| Equal var20 29
      if Equal AirGroundState 2
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
Goto fsmash
Goto fsmash_weak
elif Equal var20 7
Goto usmash
elif Equal var20 8
Goto usmash
Goto usmash_late
elif Equal var20 9
Goto dsmash
elif Equal var20 10
Goto uspecial
elif Equal var20 11
Goto dspecial
elif Equal var20 12
Goto dspecial
Goto dspecial_weak
elif Equal var20 13
Goto dspecialair
elif Equal var20 14
Goto sspecial
elif Equal var20 15
Goto sspecialair
elif Equal var20 16
Goto sspecialair
Goto sspecialair_second
elif Equal var20 17
Goto grab
elif Equal var20 18
Goto grab
Goto fthrow
elif Equal var20 19
Goto grab
Goto dthrow
elif Equal var20 20
Goto grab
Goto bthrow
elif Equal var20 21
Goto grab
Goto uthrow
elif Equal var20 22
Goto nair
elif Equal var20 23
Goto nair
Goto nair_weak
elif Equal var20 24
Goto fair
elif Equal var20 25
Goto bair
elif Equal var20 26
Goto bair
Goto bair_weak
elif Equal var20 27
Goto uair
elif Equal var20 28
Goto uair
Goto uair_tipman
elif Equal var20 29
Goto dair
endif

Return


// populates ranges, hitframes, and IASA
label jab123
var16 = 15
var10 = 4.83
var11 = -1.74
var5 = 1
var12 = 4.41
var13 = 3.16
var14 = 3
var15 = 3
var19 = 0
Return
label dashattack
var16 = 46
var10 = -1.14
var11 = 0.25
var5 = 1
var12 = 29.68
var13 = 4.38
var14 = 8
var15 = 31
var19 = 0
Return
label ftilt
var16 = 27
var10 = 4.06
var11 = -1.97
var5 = 1
var12 = 7.71
var13 = 4.24
var14 = 5
var15 = 8
var19 = 0
Return
label utilt
var16 = 23
var10 = -14.38
var11 = -2.2
var5 = 0
var12 = 12.31
var13 = 8.89
var14 = 4
var15 = 10
var19 = 0
Return
label dtilt
var16 = 20
var10 = 3.79
var11 = 2.78
var5 = 1
var12 = 7.63
var13 = 5.12
var14 = 4
var15 = 7
var19 = 0
Return
label fsmash
var16 = 52
var10 = -0.17
var11 = -0.68
var5 = 1
var12 = 13.15
var13 = 4.9
var14 = 13
var15 = 22
var19 = 0
Return
label fsmash_weak
var10 = -0.17
var11 = -0.68
var5 = 1
var12 = 13.15
var13 = 4.9
var14 = 13
var15 = 22
var19 = 1
Return
label usmash
var16 = 40
var10 = -3.56
var11 = -0.72
var5 = 0
var12 = 7.02
var13 = 10.65
var14 = 11
var15 = 14
var19 = 0
Return
label usmash_late
var10 = -8.66
var11 = -5.71
var5 = 0
var12 = 9.58
var13 = 8.46
var14 = 13
var15 = 19
var19 = 1
Return
label dsmash
var16 = 51
var10 = -13.18
var11 = 2.42
var5 = 0
var12 = 12.85
var13 = 5.3
var14 = 9
var15 = 23
var19 = 0
Return
label uspecial
var16 = 47
var10 = 2.75
var11 = 6
var5 = 1
var12 = 11.9
var13 = 7.75
var14 = 23
var15 = 37
var19 = 0
Return
label dspecial
var16 = 47
var10 = 3.09
var11 = 2.86
var5 = 1
var12 = 12.6
var13 = 4.28
var14 = 7
var15 = 14
var19 = 0
Return
label dspecial_weak
var10 = 20.46
var11 = 2.4
var5 = 1
var12 = 8.89
var13 = 4.05
var14 = 15
var19 = 1
Return
label dspecialair
var16 = 71
var10 = -4.5
var11 = 40
var5 = 0
var12 = 4.5
var13 = 45
var14 = 16
var15 = 40
var19 = 0
Return
label sspecial
var16 = 55
var10 = 4.09
var11 = 0.73
var5 = 1
var12 = 5.58
var13 = 5
var14 = 18
var15 = 19
var19 = 0
Return
label sspecialair
var16 = 51
var10 = 1.79
var11 = -0.32
var5 = 1
var12 = 7.65
var13 = 5.03
var14 = 17
var15 = 19
var19 = 0
Return
label sspecialair_second
var10 = 3.77
var11 = 0.45
var5 = 1
var12 = 6.91
var13 = 4.7
var14 = 34
var15 = 35
var19 = 1
Return
label grab
var16 = 32
var10 = 1.57
var11 = -1.5
var5 = 1
var12 = 6.67
var13 = 3.91
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
var10 = -10.61
var11 = 5.94
var5 = 0
var12 = 10.25
var13 = 9.65
var14 = 3
var15 = 6
var19 = 0
Return
label nair_weak
var10 = -8.07
var11 = 3.34
var5 = 0
var12 = 7.81
var13 = 8.17
var14 = 7
var15 = 29
var19 = 1
Return
label fair
var16 = 37
var10 = -0.91
var11 = 1.73
var5 = 1
var12 = 8.71
var13 = 5.5
var14 = 7
var15 = 22
var19 = 0
Return
label bair
var16 = 35
var10 = -14.25
var11 = 1.4
var5 = -1
var12 = 8.59
var13 = 5.99
var14 = 6
var15 = 8
var19 = 0
Return
label bair_weak
var10 = -14.25
var11 = 1.4
var5 = -1
var12 = 8.59
var13 = 5.99
var14 = 9
var15 = 20
var19 = 1
Return
label uair
var16 = 33
var10 = -3.16
var11 = -1.34
var5 = 0
var12 = 7.22
var13 = 7.66
var14 = 8
var15 = 10
var19 = 0
Return
label uair_tipman
var10 = -9.8
var11 = 1.86
var5 = 0
var12 = 7.64
var13 = 9.26
var14 = 11
var15 = 13
var19 = 1
Return
label dair
var16 = 49
var10 = -2.85
var11 = 8.72
var5 = 0
var12 = 6.98
var13 = 8.71
var14 = 13
var15 = 29
var19 = 0
Return

Return
Return
