#include <Definition_AIMain.h>
//TrueID=0x100
id 0x8100

//Set Unknown
unk 0x0

//Strings
str "PERSONALITY"
str "1"
str "1"
str "1"
str "1"
str "1"
str "1"
str "0.2"
str "0.4"
str "0.3"
str "1"
str "0.5"
str "0.35"

//____________________
label _0
LOGSTR_NL 757935360 757935360 754974700 0 0
if True || !(True)
    LOGSTR 822083600 0 0 0 0
endif
if !(True) || True
    LOGSTR 838860800 0 0 0 0
endif
if True && True || !(True) && !(True)
    LOGSTR 855638000 0 0 0 0
endif
if !(True) || !(True) && True || !(True)
    LOGSTR 872415230 0 0 0 0
endif
if !(True) || !(True) && True || !(True)
    LOGSTR 889192450 0 0 0 0
endif
if True || !(True) && !(True) || !(True)
    LOGSTR 905969660 0 0 0 0
endif
if True && !(True) || True
    LOGSTR 908996860 0 0 0 0
endif
if True || !(True) || True
    LOGSTR 908997100 0 0 0 0
endif
if !(True) || True || !(True)
    LOGSTR 908997400 0 0 0 0
endif
if True || !(True) || True
    LOGSTR 908997630 0 0 0 0
endif
if True && !(True) && !(True) || True
    LOGSTR 922746900 0 0 0 0
endif
PRINTLN
Seek _0
Return
SetAutoDefend 0
SetDisabledSwitch 1
SetDebugMode TEMP_DEBUG_TOGGLE
SetDisabledMd (-1)
if Equal var21 (-1)
    var21=0
endif
LOGSTR 1.6677028E+09 1.8351004E+09 1.850963E+09 1.6348908E+09 0
LOGVAL var21
LOGVAL var15
PRINTLN
if TRAINING_MODE_OPTION >= 0
    XGoto 0x8501    //Corrupted?
    ADJUST_PERSONALITY 0 (-100) 1
    ADJUST_PERSONALITY 1 (-100) 1
    ADJUST_PERSONALITY 2 (-100) 1
    ADJUST_PERSONALITY 3 (-100) 1
    ADJUST_PERSONALITY 4 (-100) 1
    ADJUST_PERSONALITY 5 (-100) 1
    ADJUST_PERSONALITY 11 (-100) 1
    ClearStick
    if Equal TRAINING_MODE_OPTION 1
        ADJUST_PERSONALITY 0 100 1
        ADJUST_PERSONALITY 4 100 1
        Seek _1
    elif Equal TRAINING_MODE_OPTION 5
        ADJUST_PERSONALITY 5 100 1
        ADJUST_PERSONALITY 3 100 1
        Seek _1
    elif Equal TRAINING_MODE_OPTION 6
        Button R
    elif Equal TRAINING_MODE_OPTION 7
        AbsStick 0 (-1)
    elif Equal TRAINING_MODE_OPTION 4
        if Equal CurrAction 124 || Equal CurrAction 125
            Stick (-0.7)
        else
            Stick 0.7
        endif
    elif Equal TRAINING_MODE_OPTION 0
        if Equal AirGroundState 1 && CurrAction <= 10
            Button X
        endif
    endif
    Return
endif
//____________________
label _1
getCurrentPredictValue var22 10
if Equal var22 0
    trackOAction 10 20
    trackOAction 11 40
    trackOAction 4 250
    Seek _1
    Jump
endif
//____________________
label _0
if Equal var21 3 && Equal YDistFloor (-1) || Equal CurrAction 16
    CallI 0x8103    //Corrupted?
elif var21 >= 16.7
    var20=-1
    Seek _E
    Jump
endif
XGoto 0x8501    //Corrupted?
Seek _0
GetIsTeammateCloser var3
if Equal var3 1
    var15=-100
endif
if Equal var15 (-10)
    var15=-100
    var22=200
    XGoto 0x8505    //Corrupted?
    if Equal var22 1
        var21=16.4
    endif
    if !(Equal var20 (-1))
        XGoto 0x850E    //Corrupted?
        STACK_PUSH var22 0
        var22=100
        XGoto 0x8505    //Corrupted?
        var0=var22
        var22=STACK_POP
        if Equal var0 1
        elif Equal var20 8
        elif Equal var20 10
        elif Equal CurrSubaction 20
            var16=1
            Call Wavedash
        endif
    endif
    Seek _9
    Jump
elif Equal var15 (-20)
//____________________
label _2
    XGoto 0x8501    //Corrupted?
    Seek _2
    if Equal CurrAction 3 || Equal CurrAction 4
        if Equal var20 2 || Equal var20 3
        elif True
            if Equal var21 13
                var16=2
            endif
            var16=3
            CallI 0x8205    //Corrupted?
        endif
    endif
    Goto _F
    Seek _2
    if Equal var22 0
        Return
    endif
    var15=-100
    CallI 0x840F    //Corrupted?
elif Equal var21 16.3 && CHANCE_MUL_LE PT_WALL_CHANCE 0.45
    if YDistFloor > 25
        var21=0
        var20=-1
        Seek _7
        Jump
    endif
//____________________
label _3
    XGoto 0x8501    //Corrupted?
    Seek _3
    Goto _F
    if Equal var22 0
        Return
    endif
//____________________
label _4
    XGoto 0x8501    //Corrupted?
    if Rnd < 0.1 && CHANCE_MUL_LE PT_WALL_CHANCE 1
        XGoto 0x8503    //Corrupted?
    elif Equal var20 (-1)
        XGoto 0x8503    //Corrupted?
    endif
    Seek _4
    var17=OTopNX-TopNX
    var22=OTopNY-TopNY
    Norm var0 var17 var22
    Abs var0
    LOGSTR_NL 1.41409E+09 1.1630019E+09 0 0 0
    LOGVAL_NL var0
    if var0 > 120
        var21=0
        Call MainHub
        Return
    endif
    var0*=0.4*Rnd
//____________________
label _5
    XGoto 0x8501    //Corrupted?
    Seek _5
    if var0 <= 0
        CallI 0x840F    //Corrupted?
    endif
    var0-=1
    Return
elif Equal var21 7.1 && CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 1.3 && CHANCE_MUL_LE PT_AGGRESSION 1
//____________________
label _6
    XGoto 0x8501    //Corrupted?
    Seek _6
    Goto _F
    if Equal var22 0
        Return
    endif
    Seek _9
    Jump
elif Equal var21 10.4
    Seek _C
    Jump
endif
DisableDebugOverlay
//____________________
label _7
XGoto 0x8501    //Corrupted?
var16=0
var20=-1
DynamicDiceClear 0
var23=TopNX-OTopNX
Abs var23
var22=PT_CIRCLECAMPCHANCE*var23*0.025
DynamicDiceAdd 0 10.1 var22
var22*=3
GetCommitPredictChance var23
var23-=0.25
var23*=-6*var22
DynamicDiceAdd 0 7 var23
var22=PT_BAITCHANCE
DynamicDiceAdd 0 10 var22
var22+=PT_AGGRESSION
DynamicDiceAdd 0 10.1 var22
var22=PT_BAIT_DASHAWAYCHANCE*2
DynamicDiceAdd 0 10.5 var22
if LevelValue >= 75
    var22=300-GameTimer
    if var22 > 0
        var22*=0.1
        DynamicDiceAdd 0 10.4 var22
        DynamicDiceAdd 0 7 var22
    endif
endif
var23=LevelValue*0.0075
if Equal HitboxConnected 0 && CHANCE_MUL_LE PT_AGGRESSION 0.2 || CHANCE_MUL_LE PT_AGGRESSION var23
    SeekNoCommit var8
endif
var22=LevelValue*0.0075
var23=1-var22
PredictOMov var22 14
var22*=var23
if var22 < 0.02 && CHANCE_MUL_LE PT_AGGRESSION 0.02
    SeekNoCommit var8
elif Equal HitboxConnected 1
    if !(True)
//____________________
label _8
    endif
    var22=PT_BAIT_DASHAWAYCHANCE
    DynamicDiceAdd 0 10.5 var22
    predictionConfidence var22 9
    if var22 > 0.4 || CHANCE_MUL_LE PT_AGGRESSION 0.35
        DynamicDiceAdd 0 16 2
    endif
    var22=PT_AGGRESSION*4
    DynamicDiceAdd 0 16 var22
    GetCommitPredictChance var22
    if YDistFloor < 25
        var22*=8*PT_WALL_CHANCE
        DynamicDiceAdd 0 16.3 var22
    endif
    var22-=5
    DynamicDiceAdd 0 16.4 var22
endif
DynamicDiceRoll 0 var21 0
LOGSTR 1.7353526E+09 1.8119393E+09 0 0 0
LOGVAL var21
PRINTLN
var22=200
XGoto 0x8505    //Corrupted?
if Equal var3 1
    var21=7
elif Equal HitboxConnected 1 || Equal PrevAction 60 || Equal var22 1
    var21=16.4
endif
var14=BBoundary
if Equal var21 (-1)
    Call MainHub
elif Equal var21 16
    var14=BBoundary
endif
//____________________
label _9
XGoto 0x8501    //Corrupted?
Seek _9
Goto _F
if Equal var22 0
    Seek _9
    Return
endif
var0=LevelValue*0.01
if var0 <= 0.025
    var0=0.025
endif
//____________________
label _A
XGoto 0x8501    //Corrupted?
Seek _A
if Rnd < var0
    Seek _B
    Jump
endif
Return
//____________________
label _B
XReciever
XGoto 0x8501    //Corrupted?
Cmd30
if Equal var21 16.3 && LevelValue <= 42
    var21=16
endif
XGoto 0x850F    //Corrupted?
LOGSTR 1.6677061E+09 1.8863521E+09 1.948276E+09 1.8835046E+09 0
LOGVAL var21
PRINTLN
Seek _B
if Equal var21 10.4 && LevelValue >= 42
    if CurrAction >= 3 && CurrAction <= 10
        var16=3
        CallI 0x8205    //Corrupted?
    endif
//____________________
label _C
    var4=Rnd*55+5
//____________________
label _D
    STACK_PUSH var4 0
    XGoto 0x8501    //Corrupted?
    XGoto 0x850F    //Corrupted?
    if Equal CurrAction 73
        XGoto 0x8101    //Corrupted?
    endif
    var4=STACK_POP-1
    Seek _D
    predictAverage var22 10
    var22*=0.4
    if XDistLE var22 && Rnd <= 0.02
        CallI 0x8102    //Corrupted?
    endif
    var22*=3
    var22+=20
    if XDistLE var22 && CHANCE_MUL_LE PT_AGGRESSION 0.05
        var20=-1
        var21=16.3
        Seek _B
        Jump
    endif
    if LevelValue >= 75
        Stick 0 (-0.7)
    endif
    if var4 <= 0 || !(Equal var21 10.4)
        var21=0
        var15=-100
        Call MainHub
    endif
    Return
elif Equal var14 BBoundary
    Return
endif
if !(True)
//____________________
label _E
endif
Seek _B
if Equal var16 (-99)
    var16=0
    Return
endif
XGoto 0x8501    //Corrupted?
Goto _F
Seek _B
if Equal var22 0
    Return
endif
XGoto 0x850C    //Corrupted?
Seek _B
Return
//____________________
label _F
var22=0
if Equal CanCancelAttack 1 || HasCurry && Equal HitboxConnected 1 || CurrAction >= 103 && CurrAction <= 109
elif Equal CurrAction 22
    if Equal PrevAction 33
        Return
    elif AnimFrame <= 3
        Return
    endif
elif CurrAction >= 24 && !(Equal CurrAction 73) && !(Equal CurrAction 103) && !(Equal CurrAction 108)
    Return
endif
var22=1
Return
Return
