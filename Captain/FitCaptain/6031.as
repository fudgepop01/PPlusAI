#include <Definition_AIMain.h>
//TrueID=0x6031
id 0x6031

//Set Unknown
unk 0x0

if Equal movePart 0
  LOGSTR str("jab")
  lastAttack = hex(0x6031)
  move_xOffset = jab123_xOffset
  move_yOffset = jab123_yOffset
  move_xRange = jab123_xRange
  move_yRange = jab123_yRange
  move_hitFrame = jab123_dist1
  if Equal approachType at_defend && OFramesHitstun < 1
    Call DefendHub
  else
    Call ApproachHub
  endif
else
  move_IASA = jab123_IASA
  Button A
  Seek execute
endif
Return

label execute
ClearStick
if FrameGE 2
  if Equal CurrSubaction Attack11
    if Equal HitboxConnected 1 && AnimFrame > 7
      Button A
    elif AnimFrame > 15
      Call AIHub
    endif
  elif Equal CurrSubaction Attack12
    if Equal HitboxConnected 1 && AnimFrame > 8
      Button A
    elif AnimFrame > 18
      Call AIHub
    endif
  elif Equal CurrSubaction Attack13
    if Idling
      Call AIHub
    endif
  else
    Call AIHub
  endif
endif
Return
Return
