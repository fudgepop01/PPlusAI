#include <Definition_AIMain.h>
//TrueID=0x6039
id 0x6039

//Set Unknown
unk 0x00000

//Strings
str "#wait_f"
str "#key_start_f"

var0=3
var1=5
SetVec var2 Zero
var4=(LevelValue-20)*0.0166*30
if var4 < 0
    var4=0
elif var4 > 30
    var4=30
endif
//____________________
label
if !(Idling)
    if FrameGE 10
        Finish
    endif
    Return
endif
Seek
Jump
Return
//____________________
label
if FrameGE var0
    Stick 0.7
    Button B
    SetTimeout 60
    Seek
endif
Return
//____________________
label
Button B
Norm var5 ObjXSpeed ObjYSpeed
if var5 > 0
    SetTimeout 60
    Seek
endif
Return
//____________________
label
Button B
if FrameGE var1
    var6=(((OYSpeed-ObjYSpeed)*var4+ExactOYCoord)-ObjYCoord)*0.0625
    Stick 0 var6
endif
var5=ExactOXCoord-ObjXCoord
var7=var5*ObjXSpeed
if var7 < 0
    Seek
endif
SetVec var8 ObjXSpeed
var8*=var4*0.15
var9*=var4*0.1
SetVec var2 OXSpeed
var2*=var4*0.5
var3*=var4*0.5
SubVector var8 var2
AddVector var8 ObjXCoord
SubVector var8 ExactOXCoord
Norm var5 var8 var9
if var5 < 8
    Seek
endif
Return
//____________________
label
if FrameGE 2
    Finish
endif
Return
Return

