#include <Definition_AIMain.h>
//TrueID=0x6031
id 0x6031

//Set Unknown
unk 0x0

if Equal movePart 0
  // LOGSTR str("jab")
  $generateDefinedVariants(Jab123)
  if Equal approachType at_defend && OFramesHitstun < 1
    Call DefendHub
  else
    Call ApproachHub
  endif
elif True
  lastAttack = valJab123
  if !(Equal AirGroundState 1)
    Call AIHub
  endif
  move_IASA = jab123_IASA
  Button A
  SetFrame 0
  Seek execute
endif
Return

label execute
#let whereCancel = var2
whereCancel = Rnd * 3

if Equal moveVariant mv_jabReset
  if FrameGE 15 || Idling
    Call AIHub
  endif
  Return
endif


label
ClearStick
var1 = 0

CALC_TARGET_DISTANCES(var5, var6, var8, var0, var1, move_hitFrame - NumFrames, _oCalc, _sCalc)


if FrameGE 2
  if Equal CurrSubaction Attack11
    if Equal HitboxConnected 1 && whereCancel < 1 && FrameGE 7
      Call ComboHub
    elif Equal HitboxConnected 1 && FrameGE 7
      SetFrame 0
      Button A
    elif FrameGE 15
      Call AIHub
    endif
  elif Equal CurrSubaction Attack12
    if Equal HitboxConnected 1 && whereCancel < 2 && FrameGE 8
      Call ComboHub
    elif Equal HitboxConnected 1 && FrameGE 8
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
