#include <Definition_AIMain.h>
id 0x8301
unk 0x0

str "*"
str "ADJUST MOVES"
str "x min"
str "x max"
str "y min"
str "y max"

SetTimeout 6000
label begin
Cmd30

SAFE_INJECT_0 var0
SAFE_INJECT_1 var1
SAFE_INJECT_2 var2
SAFE_INJECT_3 var3


if Equal OAnimFrame 1
  var5 = OTopNX
  var6 = OTopNY

  LOGSTR 1129270784 1447383552 1397313280 1308622848 0
  LOGVAL var0
  var17 = var2 * -1
  LOGVAL var17
  var17 = var1 - var0
  var17 *= 0.5
  LOGVAL var17
  var17 = var3 - var2
  var17 *= 0.5
  LOGVAL var17
endif


var17 = var1 - var0
var17 *= 0.5
var7 = var17 + var0
var7 *= ODirection
var7 += var5
var22 = var3 - var2
var22 *= 0.5
var8 = var22 + var6 + var2

DrawDebugRectOutline var7 var8 var17 var22 0 255 0 221

if Equal OCurrAction 16
  Call NAir
endif
Return
Return
