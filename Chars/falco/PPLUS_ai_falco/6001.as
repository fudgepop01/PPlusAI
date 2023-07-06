#include <Definition_AIMain.h>
//TrueID=0x6001
id 0x6001

//Set Unknown
unk 0x90000

//Strings

if !(IsStage 1) || YCoord > 15 || OYCoord < 60 || InAir
    Finish
else
    Seek
endif
Return
//____________________
label
if XCoord > -55 && XCoord < -25
    Seek
elif XCoord < 55 && XCoord > 25
    Seek
else
    Finish
endif
Return
//____________________
label
if FrameGE 0 && !(FrameGE 7)
    Button X
endif
if FrameGE 14 && !(FrameGE 15)
    Button R
    Stick 0 (-1)
endif
if FrameGE 24
    Finish
endif
Return
