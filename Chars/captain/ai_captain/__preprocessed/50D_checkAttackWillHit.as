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

if !(True) || Equal var20 14|| Equal var20 15|| Equal var20 16|| Equal var20 17|| Equal var20 18|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22
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
if !(True)  || Equal var20 1 || Equal var20 2 || Equal var20 3 || Equal var20 4 || Equal var20 6 || Equal var20 7
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
endif

var23 = OTopNY - TopNY
if !(True) || Equal var20 14|| Equal var20 15|| Equal var20 16|| Equal var20 17|| Equal var20 18|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22
elif var23 > 15
  var20 = -1
endif

if !(True) || Equal var20 14|| Equal var20 15|| Equal var20 16|| Equal var20 17|| Equal var20 18|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22
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
if !(True) || Equal var20 14|| Equal var20 15|| Equal var20 16|| Equal var20 17|| Equal var20 18|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22
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

Return


// populates ranges, hitframes, and IASA
label dashattack
var16 = 37
var10 = 9.31
var11 = -2.79
var5 = 1
var12 = 10.78
var13 = 6.41
var14 = 7
var15 = 16
var19 = 0
Return
label ftilt
var16 = 29
var10 = 2.35
var11 = -8.15
var5 = 1
var12 = 9.53
var13 = 4.39
var14 = 9
var15 = 11
var19 = 0
Return
label utilt
var16 = 37
var10 = -0.24
var11 = 3.79
var5 = 1
var12 = 10.77
var13 = 15.57
var14 = 17
var15 = 22
var19 = 0
Return
label dtilt
var16 = 34
var10 = 0.59
var11 = 1.61
var5 = 1
var12 = 11.23
var13 = 5.23
var14 = 10
var15 = 15
var19 = 0
Return
label fsmash
var16 = 60
var10 = 5.73
var11 = -5.3
var5 = 1
var12 = 10.91
var13 = 4.24
var14 = 19
var15 = 21
var19 = 0
Return
label usmash
var16 = 40
var10 = -2.55
var11 = -2.89
var5 = 1
var12 = 8.37
var13 = 13.9
var14 = 22
var15 = 29
var19 = 0
Return
label dsmash
var16 = 44
var10 = 4.7
var11 = -6.99
var5 = 1
var12 = 7.9
var13 = 4.79
var14 = 20
var15 = 23
var19 = 0
Return
label dsmash_late
var10 = -19.56
var11 = -3.95
var5 = -1
var12 = 7.05
var13 = 4.37
var14 = 30
var15 = 32
var19 = 1
Return
label sspecial
var16 = 26
var10 = -1.56
var11 = -1.41
var5 = 1
var12 = 11.08
var13 = 13.11
var14 = 4
var15 = 8
var19 = 0
Return
label grab
var16 = 32
var10 = -0.91
var11 = -5.94
var5 = 0
var12 = 5.82
var13 = 3.91
var14 = 7
var15 = 7
var19 = 0
Return
label fthrow
var5 = 0
var19 = 2
Return
label dthrow
var5 = 0
var19 = 3
Return
label bthrow
var5 = 0
var19 = 4
Return
label uthrow
var5 = 0
var19 = 5
Return
label nair
var16 = 44
var10 = -3.17
var11 = -0.82
var5 = 1
var12 = 9.96
var13 = 6.11
var14 = 20
var15 = 12
var19 = 0
Return
label nair_hit2
var5 = 1
var13 = 8.49
var15 = 29
var19 = 1
Return
label fair
var16 = 35
var10 = 0.39
var11 = -0.84
var5 = 1
var12 = 5.95
var13 = 5.77
var14 = 14
var15 = 0
var19 = 0
Return
label fair_weak
var10 = 1.09
var11 = -0.77
var5 = 1
var12 = 5.65
var13 = 5.78
var14 = 17
var15 = 30
var19 = 1
Return
label bair
var16 = 28
var10 = -16.52
var11 = -1.13
var5 = -1
var12 = 7.83
var13 = 6.24
var14 = 10
var15 = 13
var19 = 0
Return
label uair
var16 = 29
var10 = -5.5
var11 = -2.37
var5 = 1
var12 = 11.48
var13 = 12.13
var14 = 6
var15 = 10
var19 = 0
Return
label uair_tipman
var10 = -16.75
var11 = -6.93
var5 = -1
var12 = 10.32
var13 = 9.85
var14 = 11
var15 = 13
var19 = 1
Return
label dair
var16 = 37
var10 = -5.76
var11 = 10.97
var5 = 0
var12 = 6.75
var13 = 12.8
var14 = 16
var15 = 20
var19 = 0
Return
label dair_spike
var10 = -5.4
var11 = -3.01
var5 = 0
var12 = 5.49
var13 = 5.81
var19 = 1
Return

Return
Return
