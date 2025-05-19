#include <Definition_AIMain.h>
//TrueID=0x40F
id 0x840F

//Set Unknown
unk 0x0

//Strings

LOGSTR_NL 1.1634127E+09 1.1261878E+09 1.0955192E+09 1.1620844E+09 0
if Equal var16 1
    LOGSTR_NL 1.3972477E+09 1.4310615E+09 541476350 0 0
endif
if Equal var21 16.41
    var21=16.4
endif
//____________________
label _0
var15=0
var7=LevelValue*0.01
if var7 < 0.05
    var7=0.05
endif
XGoto 0x8501    //Corrupted?
Seek _0
Seek _0
if Equal CurrSubaction 20
    if Equal var20 8
        Seek _2
        Jump
    elif Equal var20 10
        Seek _2
        Jump
    endif
endif
if CurrAction >= 52 && CurrAction <= 57
//____________________
label _1
    Goto _1E
    Seek _1
    Return
endif
if Equal AirGroundState 1
    if Equal CurrAction 3 && AnimFrame < 2
        Return
    elif Equal CurrAction 6 && AnimFrame < 3
        Return
    elif Equal CurrAction 10
        if Equal var20 13 || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17
            Seek _2
            Jump
        endif
        XGoto 0x850C    //Corrupted?
        Seek _0
        Return
    endif
    var22=0.001
    XGoto 0x8505    //Corrupted?
    Seek _0
    if var22 < 0 && Equal Direction OPos
        ClearStick
        var22=OPos*(-1)
        if !(Equal CurrAction 17)
            AbsStick var22
        endif
        Return
    elif var22 > 0 && !(Equal Direction OPos)
        ClearStick
        var22=OPos
        if !(Equal CurrAction 17)
            AbsStick var22
        endif
        Return
    endif
endif
var22=300
XGoto 0x8505    //Corrupted?
Seek _0
if Equal var22 0
    Return
endif
STACK_PUSH var22 0
var22=100
XGoto 0x8505    //Corrupted?
var0=var22
var22=STACK_POP
if Equal var0 1
    if Equal AirGroundState 1
        MOD var22 GameTimer 3
        if !(Equal CurrSubaction 20) && var22 <= 1
            Button X
        endif
        Return
    endif
elif Equal var20 13 || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17
    if !(Equal AirGroundState 1)
        Return
    endif
elif !(Equal AirGroundState 1) || Equal CurrSubaction 20
    Return
endif
if Equal var20 2 || Equal var20 3
    Seek _1B
    Jump
elif Equal var20 13 || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17
    MOD var22 GameTimer 3
    if !(Equal CurrSubaction 20) && !(Equal CurrAction 6)
        if var22 <= 1
            Button X
        endif
        Return
    endif
elif Rnd > var7
    Return
endif
if Equal AirGroundState 1
    Seek _2
    Return
endif
//____________________
label _2
var22=19
STACK_PUSH 18 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 6 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
STACK_PUSH 17 0
XGoto 0x8505    //Corrupted?
Cmd30
ClearStick
if Equal var20 0
    Button A
    Seek _3
    Return
elif Equal var20 1
    Button A
    Seek _4
    Return
elif Equal var20 2
    Goto _1B
    Seek _5
    Return
elif Equal var20 3
    Goto _1B
    Seek _6
    Return
elif Equal var20 4
    Button A
    Goto _1C
    var23=OPos*0.7
    AbsStick var23 var22
    Seek _7
    Return
elif Equal var20 5
    Button A
    Stick 0 0.7
    Seek _8
    Return
elif Equal var20 6
    Button A
    Stick 0 (-0.7)
    Seek _9
    Return
elif Equal var20 7
    Button A
    Goto _1C
    AbsStick OPos var22
    Seek _A
    Return
elif Equal var20 8
    Button A
    Stick 0 1
    Seek _B
    Return
elif Equal var20 9
    Button A
    Stick 0 (-1)
    Seek _C
    Return
elif Equal var20 10
    Button B
    Stick 0 1
    Seek _D
    Return
elif Equal var20 11
    Button B
    Stick 0 (-0.7)
    Seek _E
    Return
elif Equal var20 12
    Button B
    Stick 0 (-0.7)
    Seek _F
    Return
elif Equal var20 13
    Button A | R
    Seek _10
    Return
elif Equal var20 14
    Button A | R
    Seek _11
    Return
elif Equal var20 15
    Button A | R
    Seek _12
    Return
elif Equal var20 16
    Button A | R
    Seek _13
    Return
elif Equal var20 17
    Button A | R
    Seek _14
    Return
elif Equal var20 18
    Button A
    Seek _15
    Return
elif Equal var20 19
    Button A
    Seek _16
    Return
elif Equal var20 20
    Button A
    Stick 1
    Seek _17
    Return
elif Equal var20 21
    Button A
    Stick (-1) 0
    Seek _18
    Return
elif Equal var20 22
    Button A
    Stick 0 1
    Seek _19
    Return
elif Equal var20 23
    Button A
    Stick 0 (-0.6)
    Seek _1A
    Return
endif
if !(True)
//____________________
label _3
    Goto _1D
    Goto _1E
    Seek _3
    Return
//____________________
label _4
    Goto _1D
    if Equal CurrSubaction 72 && AnimFrame >= 7 && Rnd <= 0.8
        Button A
    endif
    Goto _1E
    Seek _4
    Return
//____________________
label _5
    Goto _1D
    Goto _1E
    Seek _5
    Return
//____________________
label _6
    Goto _1D
    Goto _1E
    Seek _6
    Return
//____________________
label _7
    Goto _1D
    Goto _1E
    Seek _7
    Return
//____________________
label _8
    Goto _1D
    Goto _1E
    Seek _8
    Return
//____________________
label _9
    Goto _1D
    Goto _1E
    Seek _9
    Return
//____________________
label _A
    Goto _1D
    Goto _1E
    Seek _A
    Return
//____________________
label _B
    Goto _1D
    Goto _1E
    Seek _B
    Return
//____________________
label _C
    Goto _1D
    Goto _1E
    Seek _C
    Return
//____________________
label _D
    Goto _1D
    if AnimFrame >= 2 && AnimFrame <= 7 && !(Equal Direction OPos)
        AbsStick OPos
    endif
    if ActionTimer < 20 && CurrAction > 256
        if Equal ActionTimer 0
            var8=0
        endif
        var23=20-ActionTimer
        if OAnimFrame > 10
            EstOXCoord var13 var23
            EstOYCoord var14 var23
        else
            EstOXCoord var13 3
            EstOYCoord var14 3
        endif
        var22=var14-TopNY-34
        var17=var13-TopNX
        Abs var17
        var17-=34
        var23=2.2*ActionTimer
        if var23 < var22
            Button B
            var8+=1
        elif var23 < var17
            Button B
            var8+=1
        endif
    endif
    LOGSTR 1.7160205E+09 1.8184929E+09 0 0 0
    LOGVAL var8
    PRINTLN
    var23=3.4*var8+34
    var17=OPos*Direction
    if var17 < 0
        var23-=20
    endif
    LOGSTR 1.6505536E+09 1.7002834E+09 1.769174E+09 0 0
    LOGVAL var23
    PRINTLN
    var13-=var23-TopNX
    if var8 > 0
        var17=3.571429*var8*Direction
        var13/=var17
    endif
    LOGSTR 1.9370089E+09 1.6679777E+09 1.7020355E+09 0 0
    LOGVAL var13
    PRINTLN
    Stick var13
endif
Goto _1E
Seek _D
Return
//____________________
label _E
Goto _1D
if AnimFrame >= 2 && AnimFrame <= 7 && !(Equal Direction OPos)
    AbsStick OPos
endif
Goto _1E
Seek _E
Return
//____________________
label _F
Goto _1D
if AnimFrame >= 2 && AnimFrame <= 7 && !(Equal Direction OPos)
    AbsStick OPos
endif
Goto _1E
Seek _F
Return
//____________________
label _10
Goto _1D
Goto _1E
Seek _10
Return
//____________________
label _11
Goto _1D
Goto _1E
Seek _11
Return
//____________________
label _12
Goto _1D
Goto _1E
Seek _12
Return
//____________________
label _13
Goto _1D
Goto _1E
Seek _13
Return
//____________________
label _14
Goto _1D
Goto _1E
Seek _14
Return
//____________________
label _15
Goto _1D
Goto _1E
Seek _15
Return
//____________________
label _16
Goto _1D
Goto _1E
Seek _16
Return
//____________________
label _17
Goto _1D
Goto _1E
Seek _17
Return
//____________________
label _18
Goto _1D
Goto _1E
Seek _18
Return
//____________________
label _19
Goto _1D
Goto _1E
Seek _19
Return
//____________________
label _1A
Goto _1D
Goto _1E
Seek _1A
Return
endif
Call MainHub
Return
//____________________
label _1B
Goto _1D
Seek _1B
if Equal CurrAction 1
ClearStick
elif Equal CurrAction 4
Button A
Stick 1
Seek _5
Return
elif Equal CurrAction 3 && AnimFrame > 3
Button A
Stick 1
Seek _5
Return
elif CurrAction <= 9 || Equal CurrAction 17 || Equal CurrAction 18
Stick 1
else
Goto _1E
endif
Return
//____________________
label _1C
var22=0
if Equal OCurrAction 74 || Equal OCurrAction 77 || Equal OCurrAction 83 || Equal OCurrAction 84
var22=-0.5
elif OCurrAction >= 68 && OCurrAction <= 73 || Equal OCurrAction 66
if OYDistBackEdge > -8 && OYSpeed < 0
    var22=-0.5
endif
endif
Return
//____________________
label _1D
XGoto 0x8501    //Corrupted?
if var21 < 16.7
var22=XSpeed*20
GetYDistFloorOffset var22 var22 5 0
if var22 < 0
    var22=XSpeed*(-20)
    AbsStick var22
    Return
endif
endif
if !(Equal var21 7)
if var20 >= 18 && var20 <= 23
    if Equal IsOnStage 0 && NumJumps < 1 && TotalYSpeed < -0.5
        var22=TopNX*(-1)
        AbsStick var22
    elif True
        if Equal var21 16.3
            PredictOMov var22 14
            if OCurrAction >= 36 && OCurrAction <= 52 || OCurrAction >= 274 && XDistLE 20
                XGoto 0x850C    //Corrupted?
            elif var22 > 0.1 && XDistLE 50
                var22=OPos*(-1)
                AbsStick var22
                Return
            endif
        endif
        XGoto 0x850E    //Corrupted?
        if Equal var21 16.4
            XGoto 0x850C    //Corrupted?
        elif Equal var21 16.3
            var22=XSpeed*(-8)
            AbsStick var22
        else
            XGoto 0x850C    //Corrupted?
        endif
    endif
endif
endif
Return
//____________________
label _1E
XGoto 0x8501    //Corrupted?
if Equal CanCancelAttack 1
Seek _20
Jump
elif Equal HitboxConnected 1 && HasCurry
if OFramesHitstun > 1 && OFramesHitlag < 1 && OAnimFrame >= 3
    Seek _20
    Jump
endif
elif CurrAction <= 32 && !(Equal CurrAction 24)
Seek _20
Jump
endif
if OFramesHitlag <= 0 && OFramesHitstun > 0
var15+=1
if Equal var15 2
    if !(True)
//____________________
label _1F
    endif
    if var18 > 90
        var18-=90
        if var18 > 90
            SeekNoCommit var31
        endif
    endif
    var22=var18+3
    var23=var18-3
    if OKBAngle > var22
        trackOAction 5 1
    elif OKBAngle < var23
        trackOAction 5 3
    elif Rnd < 0.5
        trackOAction 5 2
    endif
endif
endif
if Equal CurrAction 51 && YDistFloor > 0
RetrieveFullATKD var22 var17 var17 var17 var17 var17 var17 CurrSubaction 0
if Equal var22 0
    var22=999
endif
var23=var22-AnimFrame
EstYCoord var23 7
var17=TopNY-YDistFloor
var22-=2
if !(Equal CanCancelAttack 1) && Equal AirGroundState 2 && YSpeed < -0.2 && var23 < var17 && var22 > AnimFrame
    Button R
endif
endif
if Equal CurrAction 57
if Equal var20 13
    XGoto 0x8503    //Corrupted?
elif Equal var20 13 || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17
else
    XGoto 0x8503    //Corrupted?
endif
if Equal var20 14
    Stick 1 0
elif Equal var20 15
    Stick 0 (-1)
elif Equal var20 16
    Stick (-1) 0
elif Equal var20 17
    Stick 0 1
endif
endif
if Equal AirGroundState 2 && var21 < 16.7
var22=AnimFrame*0.8
LOGSTR 1.9371131E+09 0 0 0 0
LOGVAL var16
PRINTLN
if Equal var16 1 && YSpeed < 0 && FramesHitlag <= 0
    AbsStick 0 (-1)
    var16=0
elif var22 > var6 && LevelValue >= 75 && Equal AirGroundState 2 && Equal HitboxConnected 1 && YSpeed <= 0
    var22=EndFrame-AnimFrame
    if Equal var16 1 || var22 > 5
        AbsStick 0 (-1)
    endif
endif
endif
Return
//____________________
label _20
var16=0
var15=-100
var20=-1
if Equal var21 16.3 && CHANCE_MUL_GE PT_WALL_CHANCE 0.15
var21=0
endif
if Equal HitboxConnected 1 || OFramesHitlag > 0 || OFramesHitstun > 0 || CHANCE_MUL_LE PT_AGGRESSION 0.1 || Equal OCurrAction 66
if !(XDistLE 40) && OFramesHitstun <= 0 && OFramesHitstun <= 0 && !(Equal OCurrAction 66)
    var21=16.3
else
    var21=16.4
endif
XGoto 0x8503    //Corrupted?
var15=-10
elif CHANCE_MUL_LE PT_BAITCHANCE 0.2 && !(XDistLE 35)
var15=-10
var21=10.5
endif
if !(XDistLE 65) && CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 0.15
var15=-10
var21=7
endif
CallI 0x8100    //Corrupted?
Return
Return
