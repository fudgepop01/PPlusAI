#include <Definition_AIMain.h>
//TrueID=0x6031
id 0x6031

//Set Unknown
unk 0x0

if Equal var18 0
  // LOGSTR 1784766976 0 0 0 0
var20 = 24625
var15 = 19
var9 = 0
var10 = -4
var11 = 7.4
var12 = 3.85
var13 = 6
var14 = 7
  if Equal var16 2 && OFramesHitstun < 1
    Call DefendHub
  else
    Call ApproachHub
  endif
elif True
  var20 = 24625
  if !(Equal AirGroundState 1)
    Call AIHub
  endif
  var15 = 19
  Button A
  SetFrame 0
  Seek execute
endif
Return

label execute
var2 = Rnd * 3

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
    if Equal HitboxConnected 1 && var2 < 1 && FrameGE 7
      Call ComboHub
    elif Equal HitboxConnected 1 && FrameGE 9
      SetFrame 0
      Button A
    elif FrameGE 15
      Call AIHub
    endif
  elif Equal CurrSubaction Attack12
    if Equal HitboxConnected 1 && var2 < 2 && FrameGE 8
      Call ComboHub
    elif Equal HitboxConnected 1 && FrameGE 12
      SetFrame 0
      Button A
    elif FrameGE 18
      Call AIHub
    endif
  elif Equal CurrSubaction Attack13
    if Equal HitboxConnected 1 && FrameGE 8
      Call ComboHub
    elif Idling
      Call AIHub
    endif
  else
    Call AIHub
  endif
endif
Return
Return

