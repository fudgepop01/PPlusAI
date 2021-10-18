#include <Definition_AIMain.h>
id 0x850D
unk 0x0

XReciever

Goto getMoveLocationParams
XReciever

LOGSTR 1128812288 1229145344 0 0 0
LOGVAL var20

var17 = var14
var17 *= 0.5

var23 = OHurtboxSize
var13 += var23

var22 = (100 - LevelValue) * 0.2
var12 += var22
var13 += var22

if var14 > 20
  var22 = var14 - 20
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

var0 = var8
var1 = var9

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

if !(True)  || Equal var20 0 || Equal var20 2 || Equal var20 3 || Equal var20 4 || Equal var20 5 || Equal var20 7 || Equal var20 8
  var23 = var17 - 25
  if var23 <= var12 && var22 <= var13
    if Equal CurrAction 3 || Equal CurrAction 8
      if AnimFrame < 5
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

var23 = OTopNY - TopNY
if !(True) || Equal var20 9|| Equal var20 15|| Equal var20 16|| Equal var20 17|| Equal var20 18|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22
elif var23 > 25.344
  var20 = -1
endif

if var17 <= var12 && var22 <= var13
if !(True) || Equal var20 9|| Equal var20 15|| Equal var20 16|| Equal var20 17|| Equal var20 18|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22
    if Equal AirGroundState 2
      CallI ExecuteAttack
      Finish
    endif
  elif Equal AirGroundState 1
    CallI ExecuteAttack
    Finish
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
Goto dsmash
elif Equal var20 8
Goto dspecial
elif Equal var20 9
Goto dspecialair
elif Equal var20 10
Goto grab
elif Equal var20 11
Goto grab
Goto fthrow
elif Equal var20 12
Goto grab
Goto dthrow
elif Equal var20 13
Goto grab
Goto bthrow
elif Equal var20 14
Goto grab
Goto uthrow
elif Equal var20 15
Goto nair
elif Equal var20 16
Goto nair
Goto nair_weak
elif Equal var20 17
Goto fair
elif Equal var20 18
Goto bair
elif Equal var20 19
Goto bair
Goto bair_weak
elif Equal var20 20
Goto uair
elif Equal var20 21
Goto uair
Goto uair_weak
elif Equal var20 22
Goto dair
endif

Return


// populates ranges, hitframes, and IASA
label jab123
var16 = 17
var10 = 3.46
var11 = -3
var12 = 6.83
var13 = 3.98
var14 = 2
var15 = 3
var19 = 0
Return
label dashattack
var16 = 35
var10 = 9.63
var11 = -0.29
var12 = 10.3
var13 = 5.4
var14 = 4
var15 = 17
var19 = 0
Return
label ftilt
var16 = 26
var10 = -0.84
var11 = -3.69
var12 = 8.9
var13 = 3.76
var14 = 5
var15 = 8
var19 = 0
Return
label utilt
var16 = 24
var10 = -10.86
var11 = 1.44
var12 = 10.16
var13 = 9.97
var14 = 5
var15 = 11
var19 = 0
Return
label dtilt
var16 = 27
var10 = 7.74
var11 = 1.43
var12 = 6.46
var13 = 3.51
var14 = 7
var15 = 9
var19 = 0
Return
label fsmash
var16 = 36
var10 = 12.37
var11 = -3.48
var12 = 8.75
var13 = 6.92
var14 = 9
var15 = 13
var19 = 0
Return
label usmash
var16 = 39
var10 = 2.22
var11 = -0.72
var12 = 6.04
var13 = 9.82
var14 = 5
var15 = 7
var19 = 0
Return
label dsmash
var16 = 46
var10 = -13.68
var11 = 3.73
var12 = 12.51
var13 = 5.35
var14 = 7
var15 = 11
var19 = 0
Return
label dspecial
var16 = 5
var10 = -8
var11 = 1.5
var12 = 8
var13 = 8
var14 = 1
var15 = 1
var19 = 0
Return
label dspecialair
var16 = 5
var10 = -8
var11 = 1.5
var12 = 8
var13 = 8
var14 = 1
var15 = 1
var19 = 0
Return
label grab
var16 = 32
var10 = 1.77
var11 = -2.84
var12 = 5.2
var13 = 3.91
var14 = 7
var15 = 7
var19 = 0
Return
label fthrow
var19 = 2
Return
label dthrow
var19 = 3
Return
label bthrow
var19 = 4
Return
label uthrow
var19 = 5
Return
label nair
var16 = 41
var10 = -3.77
var11 = -0.08
var12 = 6.62
var13 = 4.45
var14 = 4
var15 = 7
var19 = 0
Return
label nair_weak
var10 = -3.75
var11 = -0.03
var12 = 6.66
var13 = 4.77
var14 = 8
var15 = 31
var19 = 1
Return
label fair
var16 = 52
var10 = -0.95
var11 = -3.34
var12 = 7.98
var13 = 5.59
var14 = 6
var15 = 8
var19 = 0
Return
label bair
var16 = 37
var10 = -13.41
var11 = -1.38
var12 = 9.53
var13 = 6.72
var14 = 4
var15 = 7
var19 = 0
Return
label bair_weak
var10 = -13.34
var11 = -1.15
var12 = 9.54
var13 = 6.8
var14 = 8
var15 = 19
var19 = 1
Return
label uair
var16 = 35
var10 = -5.05
var11 = -4.33
var12 = 5.88
var13 = 8.25
var14 = 8
var15 = 14
var19 = 0
Return
label uair_weak
var10 = -5.05
var11 = -4.33
var12 = 5.88
var13 = 8.25
var14 = 8
var15 = 14
var19 = 1
Return
label dair
var16 = 51
var10 = -4.34
var11 = 2.33
var12 = 6.96
var13 = 7.08
var14 = 5
var15 = 24
var19 = 0
Return

Return
Return
