// HOVER RECOVERY HUB
// makes mewtwo recover during hover

id 0x8103

unk 0x00000

lastScript = hex(0x8103)

if !(Equal XDistBackEdge XDistFrontEdge) || !(Equal CurrAction hex(0x120))
  Call AIHub
endif

// keep up the hover
Button X

#let nearCliffX = var0
#let nearCliffY = var1

GetNearestCliff nearCliffX
nearCliffX = TopNX - nearCliffX
nearCliffX *= -1
nearCliffY = nearCliffY - TopNY * -1

nearCliffY += 15
if nearCliffX > 0
  nearCliffX -= 10
else
  nearCliffX += 10
endif

AbsStick nearCliffX nearCliffY

Return
Return