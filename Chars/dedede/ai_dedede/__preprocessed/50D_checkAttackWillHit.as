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

if !(True)  || Equal var20 0 || Equal var20 2 || Equal var20 3 || Equal var20 4 || Equal var20 5 || Equal var20 7 || Equal var20 8 || Equal var20 9 || Equal var20 11
  var23 = var17 - 25
  if var23 <= var12 && var22 <= var13
    if Equal CurrAction 3 || Equal CurrAction 8
      if AnimFrame < 4
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
if !(True) || Equal var20 10|| Equal var20 13|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25
elif var23 > 25.344
  var20 = -1
endif

if var17 <= var12 && var22 <= var13
if !(True) || Equal var20 10|| Equal var20 13|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25
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

Return


// populates ranges, hitframes, and IASA
label jab123
var16 = 24
var10 = 6.68
var11 = -0.25
var12 = 10.26
var13 = 6
var14 = 8
var15 = 10
var19 = 0
Return
label dashattack
var16 = 66
var10 = 15.12
var11 = 1.81
var12 = 11.08
var13 = 7.61
var14 = 26
var15 = 29
var19 = 0
Return
label ftilt
var16 = 45
var10 = 5.94
var11 = -1.08
var12 = 16.97
var13 = 6.04
var14 = 12
var15 = 15
var19 = 0
Return
label utilt
var16 = 33
var10 = -16.02
var11 = -4.59
var12 = 15.24
var13 = 14.93
var14 = 7
var15 = 17
var19 = 0
Return
label dtilt
var16 = 32
var10 = 4.86
var11 = 1.79
var12 = 10.24
var13 = 5.03
var14 = 6
var15 = 8
var19 = 0
Return
label fsmash
var16 = 79
var10 = -0.29
var11 = 8.85
var12 = 25.33
var13 = 22.01
var14 = 40
var15 = 43
var19 = 0
Return
label usmash
var16 = 57
var10 = -23.09
var11 = 0.16
var12 = 23.59
var13 = 18.9
var14 = 18
var15 = 24
var19 = 0
Return
label dsmash
var16 = 47
var10 = -0.4
var11 = -0.78
var12 = 13.57
var13 = 6.5
var14 = 15
var15 = 18
var19 = 0
Return
label dsmash_hit2
var10 = -27.15
var11 = 0.5
var12 = 13.44
var13 = 6.79
var14 = 19
var15 = 24
var19 = 1
Return
label nspecial
var16 = 21
var10 = -5
var11 = 0
var12 = 9
var13 = 9
var14 = 17
var15 = 19
var19 = 0
Return
label nspecialair
var16 = 80
var10 = -5
var11 = 0
var12 = 9
var13 = 9
var14 = 17
var15 = 19
var19 = 0
Return
label dspecial
var16 = 57
var10 = -4.01
var11 = -5.36
var12 = 15.4
var13 = 10.93
var14 = 8
var15 = 10
var19 = 0
Return
label sspecial
var16 = 58
var10 = 0
var11 = 10
var12 = 30
var13 = 30
var14 = 30
var15 = 51 // just a dummy
var19 = 0
Return
label sspecialair
var16 = 58
var10 = 0
var11 = 10
var12 = 30
var13 = 30
var14 = 30
var15 = 51 // just a dummy
var19 = 0
Return
label grab
var16 = 32
var10 = 3.54
var11 = -0.09
var12 = 8.69
var13 = 4.41
var14 = 7
var15 = 8
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
var16 = 36
var10 = -11.06
var11 = 3.06
var12 = 11.06
var13 = 11.06
var14 = 6
var15 = 7
var19 = 0
Return
label nair_weak
var10 = -11.06
var11 = 3.06
var12 = 11.06
var13 = 11.06
var14 = 8
var15 = 28
var19 = 1
Return
label fair
var16 = 39
var10 = 1.01
var11 = 3.37
var12 = 12.87
var13 = 16.58
var14 = 13
var15 = 18
var19 = 0
Return
label bair
var16 = 32
var10 = -20.58
var11 = 0.45
var12 = 8.48
var13 = 5.68
var14 = 6
var15 = 8
var19 = 0
Return
label bair_weak
var10 = -19.79
var11 = 0.77
var12 = 8.09
var13 = 5.9
var14 = 9
var15 = 21
var19 = 1
Return
label uair
var16 = 44
var10 = -9.1
var11 = -11.06
var12 = 9.19
var13 = 13.22
var14 = 10
var15 = 24
var19 = 0
Return
label dair
var16 = 37
var10 = -7.11
var11 = 16.17
var12 = 7.39
var13 = 13.07
var14 = 9
var15 = 26
var19 = 0
Return

Return
Return
