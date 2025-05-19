#include <Definition_AIMain.h>
//TrueID=0x50E
id 0x850E

//Set Unknown
unk 0x0

//Strings

Cmd30
NoRepeat
var23=1
if OCurrAction >= 77 && OCurrAction <= 82 || OCurrAction >= 96 && OCurrAction <= 97
    var23=0
elif Equal OCurrSubaction 217 || Equal OCurrSubaction 48 || Equal OCurrSubaction 222 || Equal OCurrSubaction 221
    var13=ODirection*30*OScale+OTopNX
    var14=OHurtboxSize+OTopNY
    Return
endif
var17=LevelValue*0.021-30
if Equal var23 0 || OAnimFrame < var17
    Return
endif
var22=19
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 2 0
STACK_PUSH 17 0
STACK_PUSH 0 0
STACK_PUSH 7 0
STACK_PUSH 8 0
STACK_PUSH 9 0
STACK_PUSH 10 0
STACK_PUSH 11 0
XGoto 0x8505    //Corrupted?
var11*=Scale
var10*=Scale
var9*=Scale
var8*=Scale
if var2 <= 0
    var13=TopNX
    if OYDistFloor > 0
        var13=OTopNX
        predictAverage var22 10
        var22+=10
        var22*=OPos
        var13-=var22
        GetYDistFloorAbsPos var22 var13 TopNY
        if var22 < 0
            var13=OTopNX
        endif
    endif
    var14=TopNY
    Return
endif
if Equal var20 13 || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17
    var0=1
endif
if var0 > 10
    var0=10
endif
var22=23
XGoto 0x8505    //Corrupted?
var2=var22
var23=var9+var11
Abs var23
if var23 < 3
    var2=0
endif
var12=-1
if OCurrAction >= 256
    var22=OCurrAction+256
    RetrieveFullATKD var3 var22 var22 var22 var22 var22 var22 var22 1
    if var3 >= 0
        var7+=var0
        var2=0
        var12=var3
    endif
endif
var17=var7
if OFramesHitstun > 0 && OFramesHitstun < var7
    var7=OFramesHitstun
endif
var22=((LevelValue/100-1)*60+10)*PT_REACTION_TIME
var13=OTotalXSpeed*var22
STACK_PUSH var22 0
var22=100
XGoto 0x8505    //Corrupted?
var3=var22
var22=STACK_POP
if Equal var3 1
    if Equal AirGroundState 1
        GetAttribute var23 940 0
        var7+=var23
    endif
endif
if var12 < 0
    if OCurrAction > 32 && OAnimFrame > 3
        EstOXCoord var23 var7
    else
        var23=OTotalXSpeed*var7+OTopNX
    endif
    if OYDistBackEdge > 20
        var23=ODirection*OXDistFrontEdge+OTopNX
    endif
    var13+=var23
    if Equal OAirGroundState 2
        if OAnimFrame <= 3
            var23=OYCoord
            if !(Equal OTotalYSpeed 0)
                var23=OCharYSpeed*var7+OYCoord
                var22=OGravity*var7*var7
                var23-=var22
            endif
        else
            EstOYCoord var23 var7
        endif
    else
        GetAttribute var22 40 1
        PredictOMov var23 14
        var23*=var22*4
        var23+=1
        var23*=OPos*(-1)
        if Equal var21 16.3 || Equal var21 10.1
            var23*=5
            var13+=var23
        endif
        var13+=var23
        var23=OTopNY
    endif
    Goto _0
    var14=var23
elif True
    var22=OTopNX
    var23=OTopNY
    var17=var7
    STACK_PUSH var0 0
    STACK_PUSH var1 0
    STACK_PUSH var2 0
    STACK_PUSH var3 0
    STACK_PUSH var4 0
    STACK_PUSH var5 0
    STACK_PUSH var6 0
    STACK_PUSH 23 0
    STACK_PUSH 22 0
    STACK_PUSH var17 0
    var22=22
    OXGoto 0x8505    //Corrupted?
    if Equal var22 (-123456790)
        STACK_TOSS 3
        EstOXCoord var22 var17
        EstOYCoord var23 var17
    endif
    var6=STACK_POP
    var5=STACK_POP
    var4=STACK_POP
    var3=STACK_POP
    var2=STACK_POP
    var1=STACK_POP
    var0=STACK_POP
    if OYDistBackEdge > 20
        var22=ODirection*OXDistFrontEdge+OTopNX
    endif
    var13+=var22
    Goto _0
    var14=var23
endif
if Equal OCurrAction 84
    var14=OCenterY
endif
DrawDebugRectOutline var13 var14 3 3 0 255 0 221
var23=var9+var11
Abs var23
var22=OWidth*0.5
if var22 > var23
    var23+=var22
endif
if var20 >= 18 && var20 <= 23
    if Equal AirGroundState 2
        var23*=Direction
    else
        var23*=OPos
    endif
else
    var23*=OPos
endif
var13-=var23
if AnimFrame > 2
    var3=LevelValue*0.0125
    var22=TotalXSpeed*var7*var3
    if Equal var20 10 || Equal var20 11 || Equal var20 12
    else
    endif
    var22=TotalYSpeed*var7
    if Equal var20 10 || Equal var20 11 || Equal var20 12
    else
        var14-=var22
    endif
endif
var22=var8-var10
var14-=var22
var22=OHurtboxSize*0.5
var14-=var22
if OTopNY > TopNY
    var14=OTopNY
    if SamePlane
        var14=TopNY
    endif
endif
if Equal OCurrAction 73 && !(CalledFrom 0x840F    //Corrupted?)
    predictionConfidence var22 15
    if var22 >= 0.3
        predictOOption var22 15
        if Equal var22 1 && ONumJumps > 0
            var22=OHurtboxSize*3
            var14+=var22
        elif Equal var22 2 && XDistLE 20 && Equal AirGroundState 1
            var23=OTopNY-30
            if TopNY < var23
                if CHANCE_MUL_LE PT_BAITCHANCE 0.3
                    var15=-10
                    var16=3
                    Call JumpScr
                endif
            elif True
                STACK_PUSH var22 0
                var22=100
                XGoto 0x8505    //Corrupted?
                var3=var22
                var22=STACK_POP
                if Equal var3 1
                    XGoto 0x8503    //Corrupted?
                endif
            endif
        endif
    endif
endif
var22=0.003
XGoto 0x8505    //Corrupted?
if var22 < 5 && var21 < 16.7 && !(Equal var21 16.5) && !(Equal var21 16.3)
    var13+=var2
endif
DrawDebugRectOutline var13 var14 8 8 255 255 255 221
Return
//____________________
label _0
if OYDistFloor > 0
    var22=ExactOYCoord-var23
    if var22 > OYDistFloor
        var23=ExactOYCoord-OYDistFloor
    endif
endif
Return
Return
