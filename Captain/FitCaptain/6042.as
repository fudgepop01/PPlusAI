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
  move_hitFrame = fair_hitFrame
  lastAttack = hex(0x6031)
  if Equal approachType at_defend && OFramesHitstun < 1
    Call DefendHub
  else
    Call ApproachHub
  endif
else
  if Equal moveVariant mv_lowAerial && OYDistBackEdge > -10
    if YSpeed < 0
      Stick 0 (-1)
    endif
    if YDistBackEdge < -15 || YSpeed > 0
      Call ApproachHub
    endif
  endif
  move_IASA = fair_IASA
  Stick 1 0
  Button A
  SetFrame 0
  Seek executeAttack
endif
Return

label executeAttack
CALC_TARGET_DISTANCES(var5, var6, var0, var1, move_hitFrame, _oCalc, _sCalc)

if Equal AirGroundState 1 || Equal IsOnStage 0 || FrameGE move_IASA
  Call AIHub
endif

if targetXDistance < 0
  AbsStick (-1)
else
  AbsStick 1
endif

RECORD_MOVE_CONNECTFRAME

if YSpeed < 0 && YDistBackEdge > -10 && YDistBackEdge <= 0
  var19 = 2
  var18 = 1
  Call Landing
endif
Return
Return
