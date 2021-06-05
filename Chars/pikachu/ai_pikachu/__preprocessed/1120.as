// THROW HANDLER
// is ALWAYS called whenever a successfully grab occurs
#include <Definition_AIMain.h>
//TrueID=0x1120
id 0x1120

//Set Unknown
unk 0x0

if ODamage > 160
  var0 = 4
elif ODamage > 120
  var0 = 3
elif ODamage > 80
  var0 = 2
elif ODamage > 40
  var0 = 1
else
  var0 = 0
endif

label _begin

var1 = OWeight

var1 = var1 - 200
var1 *= -1
var1 /= 100
var1 *= ODamage

ClearStick
label
if CurrAction < 52 || CurrAction > 60
  Call AIHub
elif Equal CurrAction 57
  if var0 > 0
    Button A
    var0 -= 1
    Return
  elif True




var17 = Rnd * 4
if var17 < 1  && YDistBackEdge > -3 
var19 = 2
Goto grab
Goto fthrow
elif 1 < var17 && var17 < 2 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 3
Goto grab
Goto dthrow
elif 2 < var17 && var17 < 3 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 4
Goto grab
Goto bthrow
elif 3 < var17 && var17 < 4 && YDistBackEdge > -10 && YDistBackEdge > -10 
var19 = 5
Goto grab
Goto uthrow
endif

  Goto KCheck
  if !(True)
    label KCheck
    COS var22 var8
    var22 *= var15
    var22 *= Direction
    var22 *= 1.2
    var17 = RBoundary - (TopNX)
    if var22 > var17
      var2 = 1
      Return
    endif
    var17 = LBoundary - (TopNX)
    if var22 < var17
      var2 = 1
      Return
    endif
    var17 = TBoundary - (TopNY)
    SIN var22 var8
    var22 *= var15
    var22 *= 1.2
    if var22 > var17
      var2 = 1
      Return
    endif
    var2 = 0
    Return
  endif
    var22 = LevelValue * 0.01
    if Equal var2 1 && Rnd <= var22
      LOGSTR 2003397632 1814063872 1768713216 0 0
      Goto execThrow
      Return
    endif

  Goto KBCheck
  if !(True)
    label KBCheck
    if var15 < 60
      var2 = 0
      Return
    endif
    COS var22 var8
    var22 *= var15
    Abs var22
    var17 = 0
    var23 = 45
    if var22 < var17 || var23 < var22
      var2 = 0
      Return
    endif
    SIN var22 var8
    var22 *= var15
    var17 = 20
    var23 = 180
    if var22 < var17 || var23 < var22
      var2 = 0
      Return
    endif
    var2 = 1
    Return
  endif
    if Equal var2 1 && Rnd <= 0.8
      LOGSTR 1668246784 1651441664 0 0 0
      Goto execThrow
      Return
    endif

  Goto KBCheck
  if !(True)
    label KBCheck
    if var15 < 120
      var2 = 0
      Return
    endif
    COS var22 var8
    var22 *= var15
    Abs var22
    var17 = 50
    var23 = 150
    if var22 < var17 || var23 < var22
      var2 = 0
      Return
    endif
    SIN var22 var8
    var22 *= var15
    var17 = -200
    var23 = 200
    if var22 < var17 || var23 < var22
      var2 = 0
      Return
    endif
    var2 = 1
    Return
  endif
    if Equal var2 1 && Rnd <= 0.8
  Goto nearBZ
  if !(True)
    label nearBZ
    var17 = var8
    var22 = LBoundary - TopNX
    var23 = TopNX - RBoundary
    Abs var22
    Abs var23
    if var17 > 90 && var17 < 270
      if Equal Direction 1 && var22 < var23
        var2 = 1
        Return
      elif var23 < var22
        var2 = 1
        Return
      endif
    else
      if Equal Direction -1 && var22 < var23
        var2 = 1
        Return
      elif var23 < var22
        var2 = 1
        Return
      endif
    endif
    var2 = 0
    Return
  endif
      if Equal var2 1
        LOGSTR 1668247040 1953656576 1811939328 0 0
        Goto execThrow
        Return
      endif
    elif Equal var2 1 && Rnd <= 0.2
      LOGSTR 2036688128 1946157056 0 0 0
      Goto execThrow
      Return
    elif Rnd <= 0.02
      LOGSTR 2036688128 1946157056 0 0 0
      Goto execThrow
      Return
    endif
  endif
endif
Return

label grab
LOGSTR 1735549184 1644167168 0 0 0
var20 = 24636
var9 = -0.75
var10 = -2
var11 = 5
var12 = 4
var13 = 7
var14 = 8
CalcKnockback var15 ODamage 0 0 0 OWeight 0
var8 = 0
Goto __ANGLE_FIX__
Return
label fthrow
LOGSTR 1718904832 1919907584 0 0 0
CalcKnockback var15 ODamage 2 45 110 OWeight 0
var8 = 45
Goto __ANGLE_FIX__
Return
label dthrow
LOGSTR 1685350400 1919907584 0 0 0
CalcKnockback var15 ODamage 5 80 56 OWeight 0
var8 = 75
Goto __ANGLE_FIX__
Return
label bthrow
LOGSTR 1651795968 1919907584 0 0 0
CalcKnockback var15 ODamage 9 75 50 OWeight 0
var8 = 45
Goto __ANGLE_FIX__
Return
label uthrow
LOGSTR 1970563072 1919907584 0 0 0
CalcKnockback var15 ODamage 5 90 45 OWeight 0
var8 = 90
Goto __ANGLE_FIX__
Return
label __ANGLE_FIX__
if var8 > 180 && Equal OAirGroundState 1
  if Equal var8 361
    if var15 < 32
      var8 = 0
    else
      var8 = 44
    endif
  else
    var8 = 180 - var8
  endif
elif Equal var8 361
  var8 = 45
endif
Return

label execThrow
  if Equal var19 2
    Stick 1 0
  elif Equal var19 4
    Stick -1 0
  elif Equal var19 5
    Stick 0 1
  elif Equal var19 3
    Stick 0 (-1)
  endif
Return
Return

