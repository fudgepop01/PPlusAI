#include <Definition_AIMain.h>
//TrueID=0x6031
id 0x6031

//Set Unknown
unk 0x0

if Equal var18 0
  LOGSTR 1784766976 0 0 0 0
  var20 = 24625
  var9 = 2
  var10 = 0
  var11 = 20
  var12 = 5
  var13 = 6
  if Equal var21 2 && OFramesHitstun < 1
    Call DefendHub
  else
    Call ApproachHub
  endif
else
  var14 = 14
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

