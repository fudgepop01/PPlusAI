#include <Definition_AIMain.h>
//TrueID=0x70
id 0x8070

//Set Unknown
unk 0x0

//Strings

if OAnimFrame > 1 && OAnimFrame <= 2 && ODistLE 80
  if OPrevAction >= 66 && OPrevAction <= 69 || Equal OPrevAction 73 || Equal var16 6
    if Equal OCurrAction 12 || Equal OCurrAction 13
      trackOAction 15 1
    elif OAttacking && Rnd < 0.6
      trackOAction 15 3
    elif Equal OCurrAction 14 || Equal OCurrAction 70 || Equal OCurrAction 74 || Equal OCurrAction 96 || Equal OCurrAction 97
      if OFramesHitstun <= 0 && Rnd < 0.5
        trackOAction 15 2
      endif
    endif
  endif
endif

if DistFrontEdge < 25 || !(ODistLE 60) || InAir
    Goto _end
elif DistBackEdge < 25 || !(ODistLE 60) || InAir
    Goto _end
endif
//____________________
label
if FrameGE 0 && !(FrameGE 1)
    Button X
endif
if FrameGE 4 && !(FrameGE 5)
    Button R
    if ODistLE 40
        var17 = OPos * -1
        AbsStick var17 (-1)
    else
        AbsStick OPos (-1)
    endif
endif
if FrameGE 10
    Goto _end
endif
Return

label _end
  if OAttacking && Equal AirGroundState 1
    Call Unk3020
  elif Equal var21 32769
    Call ApproachHub
  endif
Call AIHub
Return
Return

