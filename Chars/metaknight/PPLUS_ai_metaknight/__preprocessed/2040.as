#include <Definition_AIMain.h>
//TrueID=0x2040
id 0x2040

//Set Unknown
unk 0x70000

//Strings

var3=YDistFrontEdge
var4=XDistFrontEdge
var5=DistFrontEdge
ToggleSwitch
var21=10.5
var22=var21-1.5
//____________________
label
var3=YDistFrontEdge
var4=XDistFrontEdge
var5=DistFrontEdge
if XDistFrontEdge >= 0
    var0=1
elif XDistFrontEdge <= 0
    var0=-1
endif
Stick var0 0
if YDistFrontEdge > 20 && XDistFrontEdge <= 40 || YDistBackEdge > 20 && XDistBackEdge <= 40
    Stick 0 (-1)
    Button B
    Seek _0
    if XDistFrontEdge > 50 && YDistFrontEdge < 40
        Stick 0 1
        Button B
        Seek
    endif
elif YDistFrontEdge <= 15 && XDistFrontEdge <= 50
    Button B
    Stick var0
endif
Return
//____________________
label _0
var1=YDistFrontEdge
AbsStick var0 var1
Return

