// THROW HANDLER
// is ALWAYS called whenever a successfully grab occurs
#include <Definition_AIMain.h>
//TrueID=0x603C
id 0x1120

//Set Unknown
unk 0x0

var21 = 4384

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
label
ClearStick
if CurrAction < 52 || CurrAction > 60
  Call AIHub
elif Equal CurrAction 57
  var18 = 0
  if var0 > 0
    Button A
    var0 -= 1
    Return
  elif True
    if DistFrontEdge < 25
      if ODamage > 60 && Rnd < 0.5
        Stick 0 1
        var19 = 5
      elif ODamage > 20
        Stick 1
        var19 = 2
      else
        Stick 0 (-1)
        var19 = 3
      endif
    elif DistBackEdge < 25
      if ODamage > 60 && Rnd < 0.5
        Stick 0 1
        var19 = 5
      else
        Stick (-1)
        var19 = 4
      endif
    elif ODamage > 80
      Stick 0 1
      var19 = 5
    else
      var1 = Rnd * 2
      if var1 < 1
        Stick 0 1
        var19 = 5
      else
        Stick 0 (-1)
        var19 = 3
      endif
    endif
  endif
  Return
endif
Return
Return

