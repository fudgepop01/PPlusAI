#include <Definition_AIMain.h>
//TrueID=0x503
id 0x8503

//Set Unknown
unk 0x0

//Strings

NoRepeat
RESET_LTF_STACK_PTR
if !(Equal DEBUG_VALUE 0)
    if var21 < 16.7
        var21=16
    endif
    SeekNoCommit var4
endif
predictOOption var22 8
var23=0
if OCurrAction >= 66 && OCurrAction <= 100 && !(Equal OCurrAction 73)
    var23=1
endif
if Equal var21 16.3 && YDistFloor > 25 || Equal var21 16.3 && YDistFloor < 0
    var21=16
elif var21 >= 16 && var21 <= 17 || Equal var16 2 || Equal var21 10.1 || Equal var21 10.2
else
    var21=16
endif
DynamicDiceClear 0
var22=OFramesHitstun*0.75
EstOYCoord var22 var22
var23=OHurtboxSize
var22-=TopNY-var23
var12=1
if CurrAction >= 26 && CurrAction <= 29 || Equal CurrSubaction 20 || CalledFrom || var22 > 5 || YDistFloor > 8 && XDistLE 15 || OCurrAction >= 66 && OCurrAction <= 100 && var22 > 20 || CurrAction >= 115 && CurrAction <= 123
elif YDistFloor > 5 && YSpeed > -0.25 && CurrAction <= 32 || OYDistFloor > 45
else
    var12=0
endif
if Equal YDistFloor (-1)
    var12=1
endif
DynamicDiceClear 0
if CurrAction >= 52 && CurrAction <= 58
    DynamicDiceAdd 1 14 0.25
    DynamicDiceAdd 1 15 0.25
    DynamicDiceAdd 1 16 0.25
    DynamicDiceAdd 1 17 0.25
else
    DynamicDiceClear 0
    DynamicDiceAdd 0 0 0.5
    DynamicDiceAdd 0 1 0.5
    DynamicDiceAdd 0 2 0.5
    DynamicDiceAdd 0 3 0.5
    DynamicDiceAdd 0 4 1
    DynamicDiceAdd 0 5 1
    DynamicDiceAdd 0 6 1
    DynamicDiceAdd 0 7 1
    DynamicDiceAdd 0 8 1
    DynamicDiceAdd 0 9 1
    DynamicDiceAdd 0 10 1
    DynamicDiceAdd 0 11 1
    DynamicDiceAdd 0 12 1
    DynamicDiceAdd 0 14 0.2
    DynamicDiceAdd 0 15 0.2
    DynamicDiceAdd 0 16 0.2
    DynamicDiceAdd 0 17 0.2
    DynamicDiceAdd 0 18 0.5
    DynamicDiceAdd 0 19 0.5
    DynamicDiceAdd 0 20 1
    DynamicDiceAdd 0 21 1
    DynamicDiceAdd 0 22 1
    DynamicDiceAdd 0 23 1
endif
if Equal HitboxConnected 1 && HasCurry
endif
var22=18
XGoto 0x8505    //Corrupted?
var23=var22
STACK_PUSH var23 1
var22=OTotalYSpeed/OGravity
if OTotalYSpeed < 0
    var22=10
endif
EstOYCoord var17 var22
STACK_PUSH var17 1
var17-=OTopNY
var17+=OYDistFloor
if var17 < 0
    var17=0
endif
Goto _E
if var22 > 0
    var17+=7
endif
var23=var17
STACK_PUSH var17 1
GetAttribute var22 40 0
GetAttribute var17 136 0
if var17 > var22
    STACK_PUSH var17 1
else
    STACK_PUSH var22 1
endif
GetAttribute var22 72 0
var23-=OHurtboxSize
if var23 > 56.78 && !(HasCurry)
    var22=0
endif
STACK_PUSH var22 1
Goto _B
STACK_PUSH var22 1
GetAttribute var22 140 1
var23=OTotalXSpeed
Abs var23
var23/=var22
var23*=OTotalXSpeed
if Equal OAirGroundState 1
    var23=OTotalXSpeed*4
endif
var23+=OTopNX
STACK_PUSH var23 1
Goto _D
STACK_PUSH var17 1
var18=(6-PlayerCount)*0.25*30
SeekNoCommit var0
LOGSTR_NL 1.6846282E+09 1.6966236E+09 1.8695741E+09 0 0
if !(True)
//____________________
label _0
    DynamicDiceRoll 0 var20 1
    if Equal var20 (-1)
        var18-=1
        if var18 <= 0
            SeekNoCommit var1
        elif Equal var20 (-1)
            SeekNoCommit var0
        endif
    endif
    var22=19
    STACK_PUSH 1 0
    STACK_PUSH 6 0
    STACK_PUSH 4 0
    STACK_PUSH 13 0
    STACK_PUSH 10 0
    STACK_PUSH 9 0
    STACK_PUSH 8 0
    STACK_PUSH 7 0
    STACK_PUSH 0 0
    STACK_PUSH 3 0
    STACK_PUSH 0 0
    STACK_PUSH 5 0
    XGoto 0x8505    //Corrupted?
    RESET_LTF_STACK_PTR
    Goto _2
    if Equal var20 (-1)
        SeekNoCommit var0
    endif
    if LevelValue >= 75
        Goto _3
    endif
    Goto _5
    var18-=1
    if var18 <= 0
        SeekNoCommit var1
    endif
    SeekNoCommit var0
    Return
//____________________
label _1
endif
if !(True)
//____________________
label _2
    var17=LTF_STACK_READ
    if Equal var20 13 || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17
        if Equal CurrAction 60
            Return
        endif
        if Equal var16 2 || Equal var21 10.1 || Equal var21 16.3 || OIsCharOf GigaBowser
            var20=-1
            Return
        endif
    elif CurrAction >= 52 && CurrAction <= 58
        var20=-1
        Return
    elif Equal OAirGroundState 1
        PredictOMov var22 6
        if var22 > 0.07
            var4*=0.67
            var6*=0.67
        endif
    endif
    if Equal var12 1
        if Equal CurrSubaction 20 || Equal CurrAction 27 || Equal CurrAction 28 || Equal CurrAction 29
            if Equal var20 8
                Return
            elif Equal var20 10
                Return
            endif
        endif
        STACK_PUSH var22 0
        var22=100
        XGoto 0x8505    //Corrupted?
        var11=var22
        var22=STACK_POP
        if Equal var11 1
        else
            var20=-1
            Return
        endif
        if YDistFloor < 0
            CalcYChange var23 var9 YSpeed Gravity MaxFallSpeed FastFallSpeed 0
            var23+=TopNY
            if var23 < var17
                var20=-1
                Return
            endif
        endif
    endif
    if Equal var16 2 && var9 > 60
        if var10 > 0
            var20=-1
        endif
    elif Equal var21 16.3 && var9 > 120
        var20=-1
        Return
    endif
    if Equal HitboxConnected 1 && HasCurry
        STACK_PUSH var22 0
        var22=100
        XGoto 0x8505    //Corrupted?
        var11=var22
        var22=STACK_POP
        if Equal var11 1
        endif
        if CurrAction >= 42 && CurrAction <= 50 && Equal var11 1 || Equal var11 0 && YSpeed < 0
            var20=-1
            Return
        endif
    endif
    Return
endif
if !(True)
//____________________
label _3
    predictOOption var22 5
    predictionConfidence var23 5
    var23*=3
    if Rnd < var23
        if Equal var22 1
            if var1 > 90 && var1 < 180
                var1+=8
            elif var1 > 270
                var1+=8
            else
                var1-=8
            endif
        elif Equal var22 3
            if var1 > 90 && var1 < 180
                var1-=8
            elif var1 > 270
                var1-=8
            else
                var1+=8
            endif
        endif
    endif
    Return
endif
DynamicDiceRoll 1 var20 0
SetDebugMode TEMP_DEBUG_TOGGLE
if !(True)
//____________________
label _4
    var20=DEBUG_VALUE-1
endif
LOGVAL var20
LOGSTR 1.1288123E+09 1.3970509E+09 541152260 1.4135631E+09 1.2582912E+09
var22=19.1
XGoto 0x8505    //Corrupted?
PRINTLN
DynamicDiceClear 0
DynamicDiceClear 1
if Equal var20 (-1) && YDistFloor < 0
    CallI 0x8103    //Corrupted?
endif
if Equal HitboxConnected 1 && HasCurry
    if YDistBackEdge > -15 && Equal IsOnStage 0
        Button X
    endif
    var15=-10
    var21=16.5
    CallI 0x8100    //Corrupted?
endif
XGoto 0x850E    //Corrupted?
Return
//____________________
label _5
var15=0
if YDistFloor < 20 && !(Equal YDistFloor (-1))
    var22=0
    if Equal var20 18 || Equal var20 19
        GetAttribute var22 300 0
    elif Equal var20 20
        GetAttribute var22 304 0
    elif Equal var20 23
        GetAttribute var22 316 0
    elif Equal var20 21
        GetAttribute var22 308 0
    elif Equal var20 22
        GetAttribute var22 312 0
    endif
    if !(Equal var22 0)
        var23=OWidth+Width+var3
        if Equal AirGroundState 2 && XDistLE var23
            var22*=0.5
        else
            GetAttribute var23 940 0
            var7+=var23+2
            GetAttribute var23 112 0
            if var23 > 0.06
                var22*=0.5
            endif
            var22+=var7
            var23=var9*0.4
            var22+=var23
        endif
        if var22 <= var9
            var9=var22
        endif
    endif
endif
if !(True)
    var9+=YDistFloor+80
elif Equal var20 10
    var9+=60
endif
GetCommitPredictChance var17
if var17 > 0.16
    var9=0
else
    var17=ODamage*0.25
    var9-=var17
endif
LOGVAL var20
var22=19.1
XGoto 0x8505    //Corrupted?
if var10 <= 0
    var22=TopNX-OTopNX
    Abs var22
    var22*=0.2
    var22+=1
    var22*=var22
    var15=var22*var3*0.1
    var9*=0.75
    GetAttribute var23 40 1
    var23*=0.8*var9
    predictAverage var17 10
    var17+=var23
    if YDistFloor < 0
        PRINTLN
        Return
    elif Equal var10 0
        if var9 <= 10
            var15*=1.5
        endif
        var15*=1.5
        Goto _9
        PRINTLN
        Return
    elif var22 < var23 || var22 < var17
        PRINTLN
        Return
    endif
    if Equal var21 7.1 || var21 >= 16.7
        var15*=2
    endif
    Goto _8
    PRINTLN
    Return
elif !(Equal var21 7.1)
    if !(Equal var21 16.3) && !(Equal var21 16.41)
        var23=LTF_STACK_READ
        var22=LTF_STACK_READ
        STACK_PUSH var22 0
        var22=100
        XGoto 0x8505    //Corrupted?
        var11=var22
        var22=STACK_POP
        if Equal var11 1
        elif Equal var20 13 || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17
            var22=1
        elif OYDistFloor < 0
            var23=TopNY-YDistFloor
            var22=0
        else
            var23=OTopNY-OYDistFloor
        endif
        CalcMoveWeight var15 ODamage OWeight var1 var4 var6 var7 var8 var9 var10 var13 LTF_STACK_READ LTF_STACK_READ LTF_STACK_READ LTF_STACK_READ TopNX TBoundary RBoundary LTF_STACK_READ var23 var22
    elif Equal var20 13 || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17
        Return
    else
        var15=20
    endif
endif
Goto _6
PRINTLN
Return
//____________________
label _6
LOGSTR 1.1115773E+09 1.1576279E+09 0 0 0
LOGVAL var15
var17=TopNX-OTopNX
Abs var17
Goto _7
if var23 > var17
    var5=0
    var3=var17*0.5
endif
var23=TopNY-OTopNY
Abs var23
var23*=0.5
if var17 > var23
    GetAttribute var22 52 0
    GetAttribute var23 40 0
    if var23 < var22
        var22=var23
    endif
    if var22 > 0
        var22*=1.5
    else
        var22*=0.5
    endif
    var3/=var22
    var5/=var22
    if Equal var20 12 || var20 >= 18 && var20 <= 23
        var23=var22*1.5+1
        var3*=var23
        var23=var3+var5
        Abs var23
        if var23 < Width
            var3*=0.25
        endif
    endif
    if OFramesHitstun < 5
        var22=TopNX-OTopNX
        var17=var7*XSpeed-var22
        Abs var17
        Goto _7
        if var17 >= var23
            var23=var3+var5
            var22=var5
            Abs var22
            if var22 > var23
                var23=var22
            endif
            var23*=0.5*var23
            var15+=var23
            if Equal var21 16.3
                var15+=var23
            endif
            var23*=0.035
            var23+=1
            var15*=var23
            var22=0.001
            XGoto 0x8505    //Corrupted?
            if var21 < 16.7
                var23=TopNX-OTopNX
                Abs var23
                if var11 > 0 && Equal AirGroundState 2 || YDistFloor < OFramesHitstun && YDistFloor > -1 && var23 < 35
                    if Equal Direction OPos && var22 >= 0 || !(Equal Direction OPos) && var22 <= 0
                        var15*=1.75
                    elif !(Equal var22 0) && var23 < 30
                        var15*=0.05
                    endif
                endif
            endif
        else
            var15*=2.5
        endif
    else
        var22=OTotalXSpeed*var7+OTopNX
        var23=TotalXSpeed*var7+TopNX
        var22-=var23
        Abs var22
        Goto _7
        if var22 < var23
            var22*=0.15
            var15+=var22
            var15*=2
        endif
    endif
    if !(True)
//____________________
label _7
        var23=var5
        Abs var23
        var23+=var3+var3
        Return
    endif
    LOGSTR 1.4808701E+09 1.3757317E+09 0 0 0
    LOGVAL var15
endif
if Equal var20 13 || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17
    PredictOMov var17 10
    if var17 > 0.15 && OYDistFloor < 20 && OYDistFloor > -1
        var15*=2
    endif
    var17*=3
    var17+=0.8
    var15*=var17
endif
if !(True)
//____________________
label _8
endif
Goto _E
var23=var22
Goto _B
LOGSTR 1.6682468E+09 1.6514499E+09 1.6677875E+09 0 0
LOGVAL var23
if !(Equal var21 16.3) && Equal var23 0 && var22 < 10
    var23=var22
    Goto _C
    LOGSTR 1.1791424E+09 1.4092861E+09 0 0 0
    LOGVAL var15
else
    var23=var22
    if var22 < 5
        var22=5
    endif
    var22-=var7
    var22*=0.05
    var22+=3
    if var22 > 4
        var22=4
    elif var22 < 0
        var22=0
    endif
    if var22 > 1 || var10 > 0
        var15*=var22
    endif
    LOGSTR 1.329942E+09 1.1458314E+09 0 0 0
    LOGVAL var15
endif
GetAttribute var17 52 0
var22=OTopNX-TopNX
Abs var22
var17/=var22
var23*=var17
if Equal var21 16.3 || var21 < 16
    var23=0
endif
if var23 < var7 && var21 < 16.7 && !(Equal var21 12)
    Goto _A
    GetAttribute var23 40 1
    var23*=0.5
    var22*=var23
    var23*=var9
    predictAverage var17 10
    var17*=0.5
    var23+=var17
    var17=var22
    var23=var3+var5
    var22=OTopNX-TopNX
    Abs var22
    if Equal var21 16.3
        var22-=10
        var23+=var3+OWidth
    endif
    if var22 < var23
        var23=var22
    endif
    var22=200
    XGoto 0x8505    //Corrupted?
    if var23 < var17 && Equal var22 0
        var17-=var23
        var17*=0.005
        var17+=1
        var15/=var17
    endif
    LOGSTR 1.3987525E+09 1.3130988E+09 0 0 0
    LOGVAL var15
endif
if !(Equal var21 16.3)
    if Equal var20 13
    elif Equal var20 13 || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17
        PredictOMov var23 10
        if var23 > 0.18 && !(Equal var16 1)
            var23*=100
            var15+=var23
            var23*=0.1
            var15*=var23
        endif
        if OCurrAction >= 26 && OCurrAction <= 29 && YDistFloor < 25
            var15+=20
            var15*=3
        endif
    endif
    LOGSTR 1.1965729E+09 1.1135419E+09 1.3298565E+09 0 0
    LOGVAL var15
endif
if !(True)
//____________________
label _9
endif
var22=LevelValue/100
var23=Rnd
if var23 < var22
    var23=var22
endif
if var15 < 0
    LOGSTR 1.313163E+09 1.0960428E+09 1.4473626E+09 0 0
    Return
endif
var15*=var23*0.0025*var15
LOGSTR 1.1792092E+09 1.0954998E+09 0 0 0
LOGVAL var15
if var15 > 0
    DynamicDiceAdd 1 var20 var15
endif
Return
//____________________
label _A
var17=var7+var8
var22=var9-var17
STACK_PUSH var22 0
var22=100
XGoto 0x8505    //Corrupted?
var11=var22
var22=STACK_POP
if Equal var11 1
    if Equal IsOnStage 1
        var22=var9
    endif
endif
GetCommitPredictChance var23
PredictOMov var17 10
var23+=var17
if Equal var20 13 || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17
    var22*=0.75
elif var23 < 0.16 && OFramesHitstun < var7
    var22*=5
endif
Return
//____________________
label _B
var22=0.003
XGoto 0x8505    //Corrupted?
if var21 < 16.7
    STACK_PUSH var22 0
    var22=OTopNY-TopNY
    STACK_PUSH var22 0
    var22=TopNX-OTopNX
    Abs var22
    var22*=-0.015
    if STACK_POP < 20
        var22*=3
    endif
    var22+=STACK_POP
endif
Return
//____________________
label _C
var22=var7-15
STACK_PUSH var22 0
var22=100
XGoto 0x8505    //Corrupted?
var11=var22
var22=STACK_POP
if Equal var11 1
    if Equal AirGroundState 1
        var22+=6
    endif
endif
if var22 < 0
    var22=15-var7
    if Equal var16 1
        var22*=0.6
    else
        GetCommitPredictChance var23
        if var23 < 0.11
            var22*=0.5
        else
            var22*=0.25
        endif
    endif
    var22+=1
    var15*=var22
endif
Return
//____________________
label _D
GetColDistPosAbs var22 var23 0 (-5) (-10000) (-5) 0
GetColDistPosAbs var17 var23 var22 (-5) 10000 (-5) 0
var17-=var22
Return
//____________________
label _E
var22=200
XGoto 0x8505    //Corrupted?
Return
Return
