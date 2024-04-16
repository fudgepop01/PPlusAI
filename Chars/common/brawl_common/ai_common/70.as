#include <Definition_AIMain.h>
//TrueID=0x70
id 0x8070

//Set Unknown
unk 0x0

//Strings

//____________________
label
if !(Idling) && !(Dashing)
    if FrameGE 30
        Finish
    endif
endif
Seek
Return
//____________________
label
Button R
if FrameGE 3
    Seek
endif
Return
//____________________
label
Button R
if CalledAs RollB
    Stick (-1)
else
    Stick 1
endif
Finish
Return
