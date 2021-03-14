// THROW HANDLER
// is ALWAYS called whenever a successfully grab occurs
#include <Definition_AIMain.h>
//TrueID=0x603C
id 0x1120

//Set Unknown
unk 0x0

if ODamage > 100
  var0 = 4
elif ODamage > 80
  var0 = 3
elif ODamage > 60
  var0 = 2
elif ODamage > 30
  var0 = 1
else
  var0 = 0
endif
label
ClearStick
if CurrAction < 52 || CurrAction > 60
  Call AIHub
elif Equal CurrAction 57
  if var0 > 0
    Button A
    var0 -= 1
    Return
  elif True
    GetNearestCliff var1
    var1 = TopNX - var1
    var1 *= -1
    var1 *= Direction
    if var1 > 0 && var1 < 20
      if Rnd < 0.2
        Stick (-1)
        var19 = 3
      else
        Stick 0 1
        var19 = 4
      endif
    elif var1 < 0 && var1 > -25
      if Rnd < 0.5
        Stick 0 (-1)
        var19 = 2
      elif ODamage > 60
        Stick 1
        var19 = 1
      else
        Stick 0 (-1)
        var19 = 2
      endif
    elif ODamage > 110
      Stick 0 1
      var19 = 4
    else
      var1 = Rnd * 2
      if var1 < 1
        Stick 0 1
        var19 = 4
      else
        Stick 0 (-1)
        var19 = 2
      endif
    endif
  endif
  Return
endif
Return
Return

