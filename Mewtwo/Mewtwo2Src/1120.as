// THROW HANDLER
// is ALWAYS called whenever a successfully grab occurs
#include <Definition_AIMain.h>
//TrueID=0x603C
id 0x1120

//Set Unknown
unk 0x0

#let pummelCount = var0
#let nearCliffX = var1
if ODamage > 100
  pummelCount = 4
elif ODamage > 80
  pummelCount = 3
elif ODamage > 60
  pummelCount = 2
elif ODamage > 30
  pummelCount = 1
else
  pummelCount = 0
endif
label
ClearStick
if CurrAction < hex(0x34) || CurrAction > hex(0x3C)
  Call AIHub
elif Equal CurrAction hex(0x39)
  if pummelCount > 0
    Button A
    pummelCount -= 1
    Return
  elif True
    GetNearestCliff nearCliffX
    nearCliffX = TopNX - nearCliffX
    nearCliffX *= -1
    nearCliffX *= Direction
    LOGSTR str("======")
    LOGVAL nearCliffX
    if nearCliffX > 0 && nearCliffX < 60
      if Rnd < 0.2
        Stick 0 (-1)
        moveVariant = mv_dthrow
      else
        Stick (-1)
        moveVariant = mv_bthrow
      endif
    elif nearCliffX < 0 && nearCliffX > -25
      if Rnd < 0.2
        Stick 0 (-1)
        moveVariant = mv_dthrow
      elif ODamage > 60
        Stick 1
        moveVariant = mv_fthrow
      else
        Stick 0 (-1)
        moveVariant = mv_dthrow
      endif
    elif ODamage > 110
      Stick 0 1
      moveVariant = mv_uthrow
    elif ODamage > 30
      var1 = Rnd * 2
      if var1 < 1
        Stick 0 1
        moveVariant = mv_uthrow
      else
        Stick 0 (-1)
        moveVariant = mv_dthrow
      endif
    else
      Stick 0 (-1)
      moveVariant = mv_dthrow
    endif
  endif
  Return
endif
Return
Return
