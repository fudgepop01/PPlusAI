#include <Definition_AIMain.h>
//TrueID=0x50D
id 0x850D

//Set Unknown
unk 0x0

//Strings

RESET_LTF_STACK_PTR
var22=19
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 6 0
STACK_PUSH 15 0
STACK_PUSH 7 0
STACK_PUSH 9 0
STACK_PUSH 10 0
STACK_PUSH 1 0
STACK_PUSH 0 0
XGoto 0x8505    //Corrupted?
var16=0
if var15 > 10
    var15=10
elif var15 < 1
    var15=1
endif
var0*=Scale
var1*=Scale
var10*=Scale
var9*=Scale
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
var17=OAnimFrame+var7
if var17 < 8
elif OCurrAction >= 78 && OCurrAction <= 82 && var17 < 26 || OCurrAction >= 96 && OCurrAction <= 97 && var17 < 19 || OCurrAction >= 31 && OCurrAction <= 32 && var17 < 19 || Equal OCurrAction 30 || Equal OCurrAction 142 || Equal OCurrAction 144 || Equal OCurrAction 145 && var17 < 15 || Equal OCurrAction 33 && var17 < 29 || Equal OCurrSubaction 217 || Equal OCurrSubaction 48 && var17 < 33 || Equal OCurrSubaction 222 || Equal OCurrSubaction 221 && var17 < 61
    Return
endif
var0+=var10
if var0 < 0
    var16=1
    var0*=-1
endif
var22=OWidth*0.5
var1-=var9
var1*=-1
var22=OHurtboxSize*0.5
var18=0
var22=HurtboxSize*0.9
if var1 > var22 && OTopNY < TopNY
    var18=1
endif
var10*=2
var9*=2
var22=23
XGoto 0x8505    //Corrupted?
var2=var22
var23=var10+var0
Abs var23
if var23 < 3
    var2=0
endif
if var20 >= 10 && var20 <= 12
    Abs var0
elif Equal AirGroundState 1
    if var0 < 0 && OPos < 0 || var0 > 0 && OPos > 0
    elif True
        var0*=-1
    endif
elif var16 > 0
    var0*=-1
endif
LOGSTR_NL 1.8699684E+09 1.9362867E+09 1.6974733E+09 1.7518428E+09 0
var22=0.003
XGoto 0x8505    //Corrupted?
if var22 < 5 && var21 < 16.7
    LOGSTR_NL 1.7688461E+09 1.7681871E+09 761489400 1.7951621E+09 0
    var17=OTopNY+OHurtboxSize
    var23=TopNY-var1
    if var17 < var23 && Equal AirGroundState 1
        var20=-1
        Return
    endif
    if !(Equal var21 16.3) && !(Equal var21 16.5)
        LOGSTR_NL 1.6339707E+09 1.9705006E+09 1.768843E+09 0 0
        var23=var2
        Abs var23
        var10+=var23
        var0+=var2
    endif
    if Equal var21 16.3
        predictAverage var22 10
        var22*=0.75
        var10+=var22+Width
    endif
endif
if Equal var20 13 || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17
    if Equal OCurrAction 74 || Equal OCurrAction 77 || Equal OCurrAction 83 || Equal OCurrAction 84
        Return
    endif
    var15=1
endif
if LevelValue <= 21
    var22=Rnd*80-40
    var7+=var22
    var22=Rnd*80-40
    var0+=var22
    var22=Rnd*80-40
    var1+=var22
    var22=Rnd*30-5
    var10+=var22
    var22=Rnd*30-5
    var9+=var22
elif LevelValue <= 60
    var22=Rnd*26-13
    var0+=var22
    var22=Rnd*26-13
    var1+=var22
    var22=Rnd*10-5
    var10+=var22
    var22=Rnd*10-5
    var9+=var22
endif
var8=var15
var10*=0.5
var9*=0.5
STACK_PUSH var10 1
STACK_PUSH var9 1
STACK_PUSH var0 1
var22=0
if Equal var20 12 || var20 >= 18 && var20 <= 23
    var22=TotalYSpeed
    if OTopNY >= TopNY
        if Equal AirGroundState 1 || YDistFloor < 2 && YDistFloor > 0
            GetAttribute var22 84 0
            var14=(TopNY+19.26)-1
            EstOYCoord var23 var7
            if var14 < var23
                GetAttribute var22 72 0
                var14=(TopNY+36.14)-1
            endif
        elif Equal AirGroundState 2 && TotalYSpeed < 0.7 && NumJumps > 0
            GetAttribute var22 72 0
            GetAttribute var23 88 0
            var22*=var23
            EstOYCoord var17 var7
            var23=TopNY+56.78
            var17-=28.39
            if var23 > var17 && NumJumps > 0 && OTopNY > TopNY
                var14=var23+4
            elif var21 >= 16.7 && YDistBackEdge > 48.78
                var14=var23+4
                var13=TopNX
            endif
            var22=TotalYSpeed
        endif
    endif
endif
STACK_PUSH var22 1
STACK_PUSH var1 1
var16=-1
if OCurrAction >= 256
    var22=OCurrAction+256
    RetrieveFullATKD var3 var22 var22 var22 var22 var22 var22 var22 1
    var16=var3
    if var3 >= 0
        var2=0
    endif
endif
if !(True)
//____________________
label _0
endif
RESET_LTF_STACK_PTR
var4=LTF_STACK_READ
var5=LTF_STACK_READ
if var8 < 0
    var8=0
    SeekNoCommit var0
endif
var2=var8+var7
var22=LTF_STACK_READ*(-1)
var17=0
if var20 >= 10 && var20 <= 12
    var17=1
    var22*=OPos
endif
if Equal var20 12 || var20 >= 18 && var20 <= 23
    if Equal var17 0
        var22*=Direction
    endif
endif
var23=TopNX
if Equal var20 10 || Equal var20 11 || Equal var20 12
elif True
    if Equal var20 12 || var20 >= 18 && var20 <= 23
        var23=TotalXSpeed*var2
        if Equal AirGroundState 1
            var23=GetJumpLength*var2
        elif XDistLE var22
            GetAttribute var23 132 0
            var23*=var2
            var4+=var23
        endif
    else
        var23=0
    endif
    var23+=TopNX
endif
var23-=var22
STACK_PUSH var23 0
var23=TopNY
var22=LTF_STACK_READ
if Equal var20 10 || Equal var20 11 || Equal var20 12
elif True
    if Equal var20 12 || var20 >= 18 && var20 <= 23
        CalcYChange var23 var2 var22 Gravity MaxFallSpeed FastFallSpeed 0
        var23+=TopNY
    elif Equal AirGroundState 1
        var23=TopNY
    elif AnimFrame <= 5
        CalcYChange var23 var2 CharYSpeed Gravity MaxFallSpeed FastFallSpeed 0
        var23+=TopNY
    else
        EstYCoord var23 var2
    endif
endif
var23+=LTF_STACK_READ
STACK_PUSH var23 0
var17=STACK_POP
var22=STACK_POP
var23=var2*(-5)+255
DrawDebugRectOutline var22 var17 var4 var5 200 255 0 var23
STACK_PUSH var22 0
STACK_PUSH var17 0
if var16 < 0
    var23=OTotalXSpeed*var2+OCenterX
    STACK_PUSH var23 0
    if Equal OAirGroundState 2
        var23=var2
        if OAnimFrame <= 3 && !(Equal OYSpeed 0)
            CalcYChange var23 var23 OCharYSpeed OGravity OMaxFallSpeed OFastFallSpeed 0
            var23+=OCenterY
        else
            EstOYCoord var23 var23
            var22=OHurtboxSize
            var23+=var22
        endif
    else
        var23=OCenterY
        if Equal AirGroundState 2
            var23-=OHurtboxSize
        endif
    endif
    Goto _3
    STACK_PUSH var23 0
elif True
    var22=OCenterX
    var23=OCenterY
    var17=var2
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
        var22=OTopNX
    endif
    STACK_PUSH var22 0
    Goto _3
    STACK_PUSH var23 0
endif
var17=STACK_POP
var22=STACK_POP
var23=var2*(-5)+255
DrawDebugRectOutline var22 var17 OWidth OHurtboxSize 255 0 255 var23
STACK_PUSH var22 0
STACK_PUSH var17 0
var9=STACK_POP
var10=STACK_POP
if Equal OCurrAction 69 || Equal OCurrAction 73
    GetYDistFloorAbsPos var23 var10 var9
    if var23 < 3 && var23 > 0
        var9=TBoundary*2
    endif
endif
var11=var9-STACK_POP
Abs var11
var23=OWidth*0.5
var4+=var23
var23=OHurtboxSize*0.5
var5+=var23
var17=OTotalXSpeed*12+var10
var12=STACK_POP
var10-=var12
Abs var10
if var20 >= 0 && var20 <= 1 || var20 >= 4 && var20 <= 7 || Equal var20 9 || Equal var20 11
    var23=36*OPos+TopNX
    var22=var17-var23
    Abs var22
    if var22 <= var4 && var10 > var4 && var11 <= var5 && var21 < 16.7 && LevelValue >= 60
        GetAttribute var22 36 0
        if Equal CurrAction 4 && var22 <= 0.6 && CHANCE_MUL_GE var22 1.35
            var16=5
            var15=-10
            CallI 0x8205    //Corrupted?
        elif Equal CurrAction 3 || Equal CurrAction 8 || Equal CurrAction 9
            if AnimFrame < 2 || Equal CurrAction 8 || Equal CurrAction 9 || !(Equal Direction OPos)
                var16=5
                var15=-20
                CallI 0x8205    //Corrupted?
            endif
        endif
    endif
    if Equal CurrAction 3 && LevelValue >= 31
        var23=((AnimFrame-9)+2)*TotalXSpeed+TopNX
        var22=var17-var23
        Abs var22
        if var22 <= var4 && var11 <= var5
//____________________
label _1
            XGoto 0x8501    //Corrupted?
            Seek _1
            ClearStick
            Stick 1
            if Equal CurrAction 4 || Equal CurrAction 1
                Seek _2
                Jump
            endif
            Return
        endif
    endif
endif
if var10 < var4
    STACK_PUSH var22 0
    var22=100
    XGoto 0x8505    //Corrupted?
    var3=var22
    var22=STACK_POP
    if Equal var3 1
        Abs var11
        STACK_PUSH var16 0
        STACK_PUSH var11 0
        if !(Equal OYSpeed 0) || !(Equal OAirGroundState 2)
            if Equal var20 10 || Equal var20 11 || Equal var20 12
            elif True
                if var21 < 16.7
                    var23=LevelValue+2
                    var22=Rnd*var23
                    if LevelValue >= 31 && var22 > 1
                        var17=var2
                        if Equal CurrSubaction 20 || Equal AirGroundState 1 || Equal CurrAction 11 && Equal AnimFrame 0
                            GetAttribute var22 940 0
                            var17-=var22
                            GetAttribute var22 84 0
                        else
                            var22=TotalYSpeed
                        endif
                        CalcYChange var10 var17 var22 Gravity MaxFallSpeed FastFallSpeed 1
                        if Equal var18 1 && var10 > 0
                        else
                            var22=TopNY+var10+var1
                            DrawDebugRectOutline CenterX var22 var4 var5 255 0 255 221
                            DrawDebugRectOutline OCenterX var9 var4 var5 255 255 255 221
                            var11=var9-var22
                            Abs var11
                            if var11 <= var5
                                var16=1
                                var10=YDistFloor+1
                                if Equal var20 10 || Equal var20 11 || Equal var20 12
                                elif True
                                    var17=(var7+var15)-var8
                                    if Equal CurrSubaction 20 || Equal AirGroundState 1 || Equal CurrAction 11 && Equal AnimFrame 0
                                        GetAttribute var22 940 0
                                        var17-=var22
                                        GetAttribute var22 84 0
                                    else
                                        var22=TotalYSpeed
                                    endif
                                    CalcYChange var10 var17 var22 Gravity MaxFallSpeed FastFallSpeed 1
                                endif
                                var23=HurtboxSize*0.5
                                var22=var10+YDistFloor+var23
                                if var22 > 0 || YDistFloor < 0
                                    CalcYChange var10 var6 TotalYSpeed Gravity MaxFallSpeed FastFallSpeed 1
                                    Goto _4
                                    if var22 > 0
                                        Goto _5
                                    endif
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
        var11=STACK_POP
        var23=YSpeed
        if Equal AirGroundState 1
            GetAttribute var23 84 0
        endif
        var10=YDistFloor+1
        if Equal var20 10 || Equal var20 11 || Equal var20 12
        elif True
            CalcYChange var10 var2 var23 Gravity MaxFallSpeed FastFallSpeed 0
        endif
        var23=HurtboxSize*0.5
        var22=var10+YDistFloor+var23
        if var10 > 0 && Equal var18 1
        elif var22 > 0 || YDistFloor < 0
            CalcYChange var10 var6 TotalYSpeed Gravity MaxFallSpeed FastFallSpeed 0
            Goto _4
            if var22 < 0
                if NumJumps < 1
                    var20=-1
                endif
                Return
            endif
            if var11 <= var5
                var16=0
                Goto _5
            endif
        endif
        var16=STACK_POP
    elif Equal AirGroundState 1 && var11 <= var5
        if Equal CurrAction 4 || Equal CurrAction 3
            if var20 >= 0 && var20 <= 1 || var20 >= 4 && var20 <= 7 || Equal var20 9 || Equal var20 11
//____________________
label _2
                XGoto 0x8501    //Corrupted?
                Seek _2
                if CurrAction < 3 || CurrAction > 4
                    CallI 0x840F    //Corrupted?
                endif
                ClearStick
                if Equal CurrAction 4
                    Stick 0 (-1)
                else
                    Stick 1
                endif
                Return
            endif
        endif
        CallI 0x840F    //Corrupted?
    endif
endif
if var8 > 0
    var8-=2
    SeekNoCommit var0
endif
var15=0
Return
//____________________
label _3
if OYDistFloor > 0
    var22=OSCDBottom-var23
    if var22 > OYDistFloor
        var23=OSCDBottom-OYDistFloor
    endif
endif
Return
//____________________
label _4
var22=TotalXSpeed*var8*1.2
if Equal var16 1
    var22*=0.7
endif
var23=OPos*10
var22+=var23
GetYDistFloorOffset var22 var22 5 0
var23=var14+10
GetYDistFloorAbsPos var23 var13 var23
if Equal var22 (-1) || Equal var23 (-1) || Equal YDistFloor (-1) || var21 >= 16.7 && Equal OYDistFloor (-1)
    var22=18
    XGoto 0x8505    //Corrupted?
    var23=(var22-HurtboxSize)*(-1)
    if Equal AirGroundState 2
        var17=OTopNY+OYDistBackEdge
        var22=TopNY+var10
        var17+=var22
        if var17 > var23
        else
            var22=-1
            Return
        endif
    endif
endif
var22=1
Return
//____________________
label _5
if Equal CurrAction 10
elif Equal AirGroundState 1
    var22=0.001
    XGoto 0x8505    //Corrupted?
    var22*=Direction*OPos
    if var20 >= 10 && var20 <= 12
        if NoJumpPrevFrame
            Button X
        endif
    elif Equal var22 (-1)
        var16=-99
        if !(Equal CurrAction 7) && !(Equal CurrAction 6)
            ClearStick
            Stick (-1)
        endif
    elif NoJumpPrevFrame
        Button X
    endif
elif !(Equal AirGroundState 3)
    CallI 0x840F    //Corrupted?
endif
Return
Return
