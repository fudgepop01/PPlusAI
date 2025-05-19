#include <Definition_AIMain.h>
//TrueID=0x70
id 0x8070

//Set Unknown
unk 0x00000

//Strings

var0 = Rnd * 5
if !(XDistLE AIPDFloat2)
    var0 *= 3
endif
label
if XDistLE 20
    if DistFrontEdge < 25 || !(ODistLE 60) || InAir
        Finish
    elif DistBackEdge < 25 || !(ODistLE 60) || InAir
        Finish
    endif    
endif
if FrameGE var0
    SetFrame 0
    Seek
endif
Return

//____________________
label
if !(XDistLE 20)
    Button R
    if XDistLE AIPDFloat2
        if CalledAs RollF
            Stick 1
        else
            Stick -1
        endif
        Finish
    endif
    if FrameGE 30
        Finish
    endif
elif True
    if FrameGE 0 && !(FrameGE 1)
        Button X
    endif
    if FrameGE 4 && !(FrameGE 5)
        Button R
        var1 = OPos
        if CalledAs RollB
            var1 *= -1
        endif
        Stick var1 (-1)
    endif
    if FrameGE 10
        Finish
    endif
endif
Return
