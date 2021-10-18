#include <Definition_AIMain.h>
id 0x8502
unk 0x0

XReciever
var8 = Rnd * 300 - 150
LOGSTR 1196961280 774766592 0 0 0
LOGVAL var8
var9 = Rnd * 150
LOGVAL var9
GetYDistFloorAbsPos var22 var8 var9
LOGVAL var9

if Equal var22 -1
  var9 = -1
  Return
endif

var9 -= var22
var9 += 2

if Rnd < 0.5
  GetAttribute var22 14 0
  var22 *= 3.5
  var9 = var9 + Rnd * var22 * 10
  if Rnd < 0.2
    GetAttribute var22 19 0
    var9 = var9 + Rnd * var22 * 10
  endif
endif

Return
Return

