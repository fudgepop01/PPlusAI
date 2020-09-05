// DASHUP
id 0x60

unk 0x0

var21 = 60

var9 = OTopNX + (OXSpeed * 10)
var10 = var9 - 30
var11 = var9 + 30
var12 = OTopNY + 10

DrawDebugLine var10 var12 var11 var12 255 255 255 255
SetDebugOverlayColor 255 0 0 200

var9 -= TopNX
Abs var9

if var9 <= 30
  Call AIHub
endif

AbsStick OPos
if Equal CurrAction 1
  ClearStick
endif
Return
Return
