// HOVER RECOVERY HUB
// makes mewtwo recover during hover

id 0x8103

unk 0x00000

var21 = 33027

if !(Equal XDistBackEdge XDistFrontEdge) || !(Equal CurrAction 288)
  Call AIHub
endif

// keep up the hover
Button X


GetNearestCliff var0
var0 = TopNX - var0
var0 *= -1
var1 = var1 - TopNY * -1

var1 += 15
if var0 > 0
  var0 -= 10
else
  var0 += 10
endif

AbsStick var0 var1

Return
Return
