#include <Definition_AIMain.h>
//TrueID=0x6031
id 0x6031

//Set Unknown
unk 0x0

if Equal var18 0
  // LOGSTR 1784766976 0 0 0 0
  var20 = 24625
  var9 = 4
  var10 = -7
  var11 = 12
  var12 = 6
  var13 = 3
  var14 = 3
  if Equal var21 2 && OFramesHitstun < 1
    Call DefendHub
  else
    Call ApproachHub
  endif
else
  var15 = 14
  Button A
  SetFrame 0
  Seek execute
endif
Return

label execute

if Equal var19 1
  if FrameGE 15 || Idling
    Call AIHub
  endif
  Return
endif

label
ClearStick


if FrameGE 2
  if Equal CurrSubaction Attack11
    if Equal HitboxConnected 1 && FrameGE 7
      SetFrame 0
      Button A
    elif FrameGE 15
      Call AIHub
    endif
  elif Equal CurrSubaction Attack12
    if Equal HitboxConnected 1 && FrameGE 8
      SetFrame 0
      Button A
    elif FrameGE 18
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

