#include <Definition_AIMain.h>
id 0x8502
unk 0x0

//= XReciever
var13 = Rnd * 300 - 150
var14 = Rnd * 150
GetColDistPosRel var17 var17 var13 var14 0 -150 0

if var17 <= -1
  var14 = BBoundary
  Return
endif

var14 = var17
var14 += 2

if CHANCE_MUL_LE PT_JUMPINESS 1
  GetAttribute var22 72; 0
  var22 *= 3.5
  var14 = var14 + Rnd * var22 * 10
  if CHANCE_MUL_LE PT_DJUMPINESS 1
    GetAttribute var22 88; 0
    var14 = var14 + Rnd * var22 * 10
  endif
endif

Return
Return

