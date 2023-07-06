#include <Definition_AIMain.h>
//TrueID=0x2040
id 0x2040

//Set Unknown
unk 0xA0000

//Strings

//____________________
label _0
var0=25
var1=55
var2=50
if XDistFrontEdge >= 0
    var20=1
elif XDistFrontEdge <= 0
    var20=-1
endif
if XDistFrontEdge >= 0
    var10=0.5
elif XDistFrontEdge <= 0
    var10=-0.5
endif
Stick var20
if !(NoOneHanging)
    var0-=10
    var1-=20
    var2-=20
elif !(NoOneHanging) && !(Invincible)
endif
if XDistFrontEdge >= 35 || XDistBackEdge >= 35
    var5=0
else
    var5=1
endif
if YDistFrontEdge >= var1 || YDistBackEdge >= var1
    Button B
    Stick var20 1
    Seek _1
else
    Finish
endif
Return
//____________________
label _1
if PrevAction >= 72
    Stick var20
elif XDistFrontEdge <= 5 || XDistBackEdge <= 5
    Finish
elif XDistFrontEdge > 5 || XDistBackEdge > 5
    Stick var20
endif
if OAttacking
    Seek _0
endif
Return
