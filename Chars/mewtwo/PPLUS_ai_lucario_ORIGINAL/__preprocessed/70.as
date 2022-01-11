#include <Definition_AIMain.h>
//TrueID=0x70
id 0x8070

//Set Unknown
unk 0x0

//Strings

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

