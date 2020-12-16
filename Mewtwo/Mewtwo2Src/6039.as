#include <Definition_AIMain.h>
//TrueID=0x6039
id 0x6039

//Set Unknown
unk 0x0

if Equal movePart 0
  lastAttack = hex(0x6039)
  move_xOffset = sspecial_xOffset
  move_yOffset = sspecial_yOffset
  move_xRange = sspecial_xRange
  move_yRange = sspecial_yRange
  move_hitFrame = sspecial_hitFrame
  move_lastHitFrame = sspecial_lastHitFrame
  Call ApproachHub
else
  move_IASA = sspecial_IASA
  Stick 1 0
  Button B
  SetFrame 0
  Seek ExecuteAttack
endif
Return

label ExecuteAttack
if CurrAction <= hex(0x09) || !(Equal AirGroundState 1)
  Call AIHub
endif
Return
Return