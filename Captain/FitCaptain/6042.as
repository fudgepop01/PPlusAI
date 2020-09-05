// Knee

#include <Definition_AIMain.h>
//TrueID=0x6031
id 0x6031

//Set Unknown
unk 0x0

if Equal movePart 0
  move_xOffset = fair_xOffset
  move_yOffset = fair_yOffset
  move_xRange = fair_xRange
  move_yRange = fair_yRange
  move_hitFrame = fair_dist1
  lastAttack = hex(0x6031)
  Call ApproachHub
else
  if Equal moveVariant mv_lowAerial && OYDistFloor < 10
    if YSpeed < 0
      Stick 0 (-1)
    endif
    if YDistFloor > 15 || YSpeed > 0
      Call ApproachHub
    endif
  endif
  move_IASA = fair_IASA
  Stick 1 0
  Button A
  Seek executeAttack
endif
Return

label executeAttack
CALC_TARGET_DISTANCES

if Equal AirGroundState 1 || Equal YDistFloor -1 || AnimFrame >= move_IASA
  Call AIHub
endif

if targetXDistance < 0
  AbsStick (-1)
else
  AbsStick 1
endif


if YSpeed < 0 && YDistFloor < 25 && YDistFloor >= 0
  var19 = 2
  var18 = 1
  Call Landing
endif
Return
Return
