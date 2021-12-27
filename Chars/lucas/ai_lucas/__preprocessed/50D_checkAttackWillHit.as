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

if !(True) || Equal var20 15|| Equal var20 19|| Equal var20 25|| Equal var20 26|| Equal var20 27|| Equal var20 28|| Equal var20 29|| Equal var20 30
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
if !(True)  || Equal var20 0 || Equal var20 1 || Equal var20 4 || Equal var20 5 || Equal var20 6 || Equal var20 7 || Equal var20 8 || Equal var20 9 || Equal var20 10 || Equal var20 11 || Equal var20 12 || Equal var20 13 || Equal var20 14 || Equal var20 16 || Equal var20 17
    var23 = var17 - 35
    if var23 <= var12 && var22 <= var13
      if Equal CurrAction 3 || Equal CurrAction 8
        if AnimFrame < 4
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
if !(True) || Equal var20 15|| Equal var20 19|| Equal var20 25|| Equal var20 26|| Equal var20 27|| Equal var20 28|| Equal var20 29|| Equal var20 30
elif var23 > 12.344
  var20 = -1
endif

if Equal IsOnStage 1
if !(True) || Equal var20 15|| Equal var20 19|| Equal var20 25|| Equal var20 26|| Equal var20 27|| Equal var20 28|| Equal var20 29|| Equal var20 30
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
      if NumJumps > 0
        if Equal IsOnStage 1
          GetAttribute var4 33 0
          var4 *= var14 * -1
          var22 = var4 + (OSCDBottom - TopNY)
          var22 -= YDistBackEdge
          if var22 > 0
            var17 = var0 - TopNX
            var22 = var1 - TopNY + var4
            Abs var17
            Abs var22
            if var17 <= var12 && var22 <= var13
              if !(Equal var16 1)
                var16 = -100
                CallI ExecuteAttack
                Finish
              else
                var16 = -100
                Return
              endif
            endif
          endif
        endif
        var22 = OTopNY - TopNY
        if var22 > 15
          var4 = 2
          var4 *= var14
          var22 = var4 + (OSCDBottom - TopNY)
          var22 -= YDistBackEdge
          if var22 > 0
            var17 = var0 - TopNX
            var22 = var1 - TopNY + var4
            Abs var17
            Abs var22
            if var17 <= var12 && var22 <= var13
              if !(Equal var16 1)
                var16 = -101
                CallI ExecuteAttack
                Finish
              else
                var16 = -101
                Return
              endif
            endif
          endif
        endif
      endif
    endif
  endif
endif

var17 = var0 - TopNX
var22 = var1 - TopNY

Abs var17
Abs var22

if var17 <= var12 && var22 <= var13
  if !(Equal var16 1)
if !(True) || Equal var20 15|| Equal var20 19|| Equal var20 25|| Equal var20 26|| Equal var20 27|| Equal var20 28|| Equal var20 29|| Equal var20 30
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

Return


// populates ranges, hitframes, and IASA
label jab123
var16 = 15
var10 = 1.96
var11 = -1.87
var5 = 1
var12 = 7.35
var13 = 4.5
var14 = 2
var15 = 4
var19 = 0
Return
label jab123_2
var16 = 30
var10 = 6.76
var11 = -1.42
var5 = 1
var12 = 8.09
var13 = 4.02
var14 = 10
var15 = 12
var19 = 1
Return
label dashattack
var16 = 38
var10 = 9.1
var11 = -0.5
var5 = 1
var12 = 9.16
var13 = 5.8
var14 = 6
var15 = 8
var19 = 0
Return
label dashattack_weak
var10 = 14.94
var11 = -0.5
var5 = 1
var12 = 11.72
var13 = 5.8
var14 = 9
var15 = 16
var19 = 1
Return
label ftilt
var16 = 28
var10 = 2.08
var11 = -0.61
var5 = 1
var12 = 9.63
var13 = 3.8
var14 = 6
var15 = 9
var19 = 0
Return
label utilt
var16 = 30
var10 = -1.45
var11 = -0.08
var5 = 1
var12 = 7.11
var13 = 7.63
var14 = 7
var15 = 8
var19 = 0
Return
label utilt_weak
var10 = -10.11
var11 = -6.32
var5 = 0
var12 = 11.63
var13 = 9.81
var14 = 9
var15 = 12
var19 = 1
Return
label dtilt
var16 = 14
var10 = 3.66
var11 = 0.53
var5 = 1
var12 = 6.38
var13 = 3.71
var14 = 3
var15 = 4
var19 = 0
Return
label fsmash
var16 = 47
var10 = -1.82
var11 = -0.06
var5 = 1
var12 = 10.65
var13 = 5.35
var14 = 15
var15 = 17
var19 = 0
Return
label fsmash_strong
var5 = 1
var19 = 1
Return
label dsmash
var16 = 38
var10 = 1.52
var11 = 3
var5 = 1
var12 = 6
var13 = 6
var14 = 21
var15 = 26
var19 = 0
Return
label dsmash_strong
var5 = 1
var19 = 1
Return
label dsmash2
var16 = 46
var10 = 1.52
var11 = 3
var5 = 1
var12 = 6
var13 = 6
var14 = 29
var15 = 33
var19 = 2
Return
label nspecial
var16 = 41
var10 = -6.45
var11 = -2.62
var5 = 0
var12 = 7.03
var13 = 7.7
var14 = 2
var15 = 3
var19 = 0
Return
label nspecial_charge
var16 = 140
var10 = -20
var11 = -20
var5 = 0
var12 = 20
var13 = 20
var14 = 10
var15 = 10
var19 = 1
Return
label nspecialair
var16 = 41
var10 = -6.45
var11 = -2.62
var5 = 0
var12 = 7.03
var13 = 7.7
var14 = 2
var15 = 3
var19 = 0
Return
label dspecial
var16 = 9
var10 = -0.05
var11 = -2.2
var5 = 1
var12 = 6.67
var13 = 4.1
var14 = 6
var15 = 8
var19 = 0
Return
label dspecialair
var16 = 9
var10 = -0.05
var11 = -2.2
var5 = 1
var12 = 6.67
var13 = 4.1
var14 = 6
var15 = 8
var19 = 0
Return
label sspecial
var16 = 43
var10 = 0
var11 = 0
var5 = 1
var12 = 60
var13 = 8
var14 = 25
var15 = 45
var19 = 0
Return
label sspecialair
var16 = 25
var10 = 0
var11 = 0
var5 = 1
var12 = 60
var13 = 8
var14 = 25
var15 = 45
var19 = 0
Return
label grab
var16 = 55
var10 = 3.92
var11 = -1.31
var5 = 1
var12 = 10.74
var13 = 3.59
var14 = 11
var15 = 13
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
var16 = 43
var10 = -7.25
var11 = 2.5
var5 = 0
var12 = 7.53
var13 = 7.5
var14 = 4
var15 = 19
var19 = 0
Return
label fair
var16 = 32
var10 = -2.09
var11 = 1.09
var5 = 1
var12 = 8.15
var13 = 4.52
var14 = 5
var15 = 10
var19 = 0
Return
label bair
var16 = 43
var10 = -13.52
var11 = 10.23
var5 = -1
var12 = 4.97
var13 = 10.6
var14 = 14
var15 = 16
var19 = 0
Return
label uair
var16 = 27
var10 = -12.14
var11 = 2.13
var5 = 0
var12 = 10.33
var13 = 10.48
var14 = 5
var15 = 9
var19 = 0
Return
label dair
var16 = 42
var10 = -4.84
var11 = 8.6
var5 = 0
var12 = 5.5
var13 = 8.05
var14 = 4
var15 = 21
var19 = 0
Return
label dair_spike
var10 = -4.84
var11 = 8.6
var5 = 0
var12 = 5.5
var13 = 8.05
var14 = 19
var15 = 21
var19 = 1
Return

Return
Return
