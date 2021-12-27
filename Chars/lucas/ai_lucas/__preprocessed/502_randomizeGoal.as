#include <Definition_AIMain.h>
id 0x8502
unk 0x0

XReciever
var8 = Rnd * 300 - 150
var9 = Rnd * 150
GetColDistPosRel var17 var17 var8 var9 0 -150 0

if var17 <= -1
  var9 = BBoundary
  Return
endif

var9 = var17
var9 += 2

if Rnd < 0.2
  GetAttribute var22 14 0
  var22 *= 3.5
  var9 = var9 + Rnd * var22 * 10
  if Rnd < 0.05
    GetAttribute var22 18 0
    var9 = var9 + Rnd * var22 * 10
  endif
endif

Return
Return

