#include <Definition_AIMain.h>
//TrueID=0x50F
id 0x850F

//Set Unknown
unk 0x0

//Strings

NoRepeat
var16=0
if HasCurry
    ADJUST_PERSONALITY 0 0.2 Rnd
endif
LOGSTR 1.6677189E+09 1.9860961E+09 1.9695534E+09 0 0
LOGVAL var21
PRINTLN
GetIsTeammateCloser var3
if Equal var3 1
    if Rnd <= 0.02
        SwitchTarget
        Return
    endif
    var20=-1
    var21=7
endif
if var21 >= 7 && var21 < 8
    var20=-1
    if LevelValue <= 42
        Call MainHub
    endif
    ADJUST_PERSONALITY 5 (-0.002) 1
    Goto _9
    if Equal var21 10
        Return
    endif
    SetDebugOverlayColor 0 0 255 136
    EnableDebugOverlay
    var22=21
    XGoto 0x8505    //Corrupted?
    var17=var22*(-1)+1
    var22=(LevelValue/100-1)*60
    var23=15*var17
    var22+=var23
    var22*=PT_REACTION_TIME
    MOD var22 GameTimer var22
    if var22 <= 1
        var17=OTopNY-TopNY
        if var17 > 45 || OYDistBackEdge < -20 && Equal AirGroundState 1
            GetCommitPredictChance var22
            if CHANCE_MUL_LE PT_AGGRESSION 0.2 && XDistLE 40 && var22 < 0.125
                var21=16
                Return
            endif
        endif
        predictOOption var22 10
        var22+=5
        if CHANCE_MUL_LE PT_AGGRESSION 0.25
            if XDistLE var22
                var21=10
                Return
            endif
            var16=2
            XGoto 0x8503    //Corrupted?
            var16=0
            if !(Equal var20 (-1)) && !(XDistLE 20) && LevelValue >= 48
                var15=-20
                var16=3
                CallI 0x8205    //Corrupted?
            elif XDistLE 5
                var21=16.3
                var20=-1
                Return
            elif CHANCE_MUL_LE PT_AGGRESSION 0.15
                Goto _B
            endif
            var20=-1
        endif
    endif
    predictAverage var17 10
    Goto _7
    if var22 <= var17
        Goto _B
        Return
    endif
    var17=var22*0.75
    Goto _6
    if var17 < var22
        Goto _B
        Return
    endif
    Goto _6
    if var22 <= 13
        if CHANCE_MUL_LE PT_AGGRESSION 0.1
            var21=10
            Return
        elif XDistLE var17 || Rnd <= 0.04
            Goto _B
            Return
        endif
        var22=21
        XGoto 0x8505    //Corrupted?
        var17=var22*(-1)+1
        var22=(LevelValue/100-1)*30
        var23=40*var17
        var22+=var23
        var22*=PT_REACTION_TIME
        MOD var22 GameTimer var22
        if var22 <= 1
            if Equal AirGroundState 1 && CHANCE_MUL_LE PT_JUMPINESS 1
                var14+=16.26
                if CHANCE_MUL_LE PT_JUMPINESS 1 && CHANCE_MUL_LE PT_JUMPINESS 1
                    var14+=5
                endif
            elif Equal AirGroundState 2 && YDistBackEdge < -5
                if CHANCE_MUL_LE PT_DJUMPINESS 1 && CHANCE_MUL_LE PT_DJUMPINESS 1 && NumJumps > 0
                    var14+=56.78
                else
                    var14+=1
                    GetYDistFloorAbsPos var22 var13 var14
                    var14-=var22
                endif
            endif
        endif
    endif
elif var21 >= 10 && var21 < 11
    ADJUST_PERSONALITY 3 (-0.001) 1
    if LevelValue <= 21
        var21=16
        Return
    endif
    Goto _9
    MOD var22 GameTimer 8
    if Equal var21 10.1
        if !(Equal var20 (-1))
            var15=-20
            CallI 0x8100    //Corrupted?
        elif var22 <= 1
            XGoto 0x8503    //Corrupted?
            if !(Equal var20 (-1))
                var15=-20
                CallI 0x8100    //Corrupted?
            endif
        endif
    endif
    var20=-1
    var22=200
    XGoto 0x8505    //Corrupted?
    if Equal var22 1
        var21=16.4
        Return
    endif
    predictAverage var22 10
    if var22 < 8
        var22=8
    endif
    DrawDebugRectOutline var13 var14 var22 var22 255 255 0 136
    var22+=25
    DrawDebugRectOutline var13 var14 var22 var22 255 255 0 68
    predictAverage var22 11
    DrawDebugRectOutline var13 var14 var22 var22 255 0 0 136
    var22+=25
    DrawDebugRectOutline var13 var14 var22 var22 255 0 0 68
    var23=OPos*(-30)
    GetYDistFloorOffset var23 var23 10 0
    SetDebugOverlayColor 255 0 255 136
    if Equal var21 10.5
        SetDebugOverlayColor 255 0 255 255
    endif
    EnableDebugOverlay
    var22=21
    XGoto 0x8505    //Corrupted?
    var17=var22*(-1)+1
    var22=(LevelValue/100-1)*40
    var23=14*var17
    var22+=var23
    var22*=PT_REACTION_TIME
    MOD var22 GameTimer var22
    var17*=18
    if var22 <= 1 && OAnimFrame > var17
        Goto _5
        var17=OTopNY-TopNY
        if var17 > 45 || OYDistBackEdge < -20 && Equal AirGroundState 1 && CHANCE_MUL_LE PT_AGGRESSION 1.25
            var21=16
            Return
        endif
        if Equal var21 10.4
            Return
        elif Equal var21 10.5
            if CHANCE_MUL_LE PT_BAITCHANCE 0.25 || CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.5 || CHANCE_MUL_LE PT_BAIT_WDASHAWAYCHANCE 0.5
            elif CHANCE_MUL_LE PT_AGGRESSION 0.025
                var21=10.1
                XGoto 0x8503    //Corrupted?
            endif
        elif !(Equal var21 10.1) && !(HasCurry)
            if Equal CurrAction 3 || Equal CurrAction 4
                GetCommitPredictChance var22
                predictAverage var23 10
                if var23 < Width
                    var23=Width
                endif
                var23+=1
                if var22 > 0.13 && !(XDistLE var23) && CHANCE_MUL_LE PT_BAITCHANCE 0.02 && LevelValue >= 60
                    var15=-10
                    var21=10.4
                    if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.1
                        var21=10.5
                    endif
                    var16=3
                    CallI 0x8205    //Corrupted?
                    Return
                endif
            endif
        endif
        predictAverage var22 10
        predictAverage var23 11
        if CHANCE_MUL_LE PT_AGGRESSION 0.05 && CHANCE_MUL_LE PT_BAITCHANCE 0.05
            var21=10.1
        elif CHANCE_MUL_LE PT_WALL_CHANCE 0.15
            var21=16.3
        endif
    endif
    if Equal var21 10.4
        Return
    endif
    var1=1
    predictAverage var23 10
    if var23 < Width
        var23=Width
    endif
    var23+=10
    var23*=OPos
    Norm var22 TopNX TopNY
    Norm var17 OTopNX OTopNY
    Abs var22
    Abs var17
    GetYDistFloorOffset var23 var23 5 1
    if Equal var23 (-1) || Equal var3 1 || var22 < var17
        var1=0
        predictAverage var23 10
    endif
    Goto _6
    GetCommitPredictChance var23
    if var22 >= 55 || var23 < 0.12 || CHANCE_MUL_LE PT_BAITCHANCE 0.1 || var23 > 0.18
        var1=1
    endif
    predictAverage var23 11
    predictAverage var17 10
    if var17 < Width
        var17=Width+OWidth
    endif
    if var23 < var17
        var23=var17
    endif
    var22=15*Rnd
    if !(Equal var1 1)
        var17+=var22
    elif CHANCE_MUL_LE PT_BRAVECHANCE 1.25
    else
        var17+=var22
    endif
    var22=var17
    if XDistLE var23 && Equal AirGroundState 1 && Equal var21 10.5
//____________________
label _0
        if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.25
            var15=-10
        endif
        if CHANCE_MUL_LE PT_BAIT_WDASHAWAYCHANCE 0.45 && LevelValue >= 60
            var16=2
            Call Wavedash
        endif
        var16=2
        if CurrAction > 3
//____________________
label _1
            if XDistBackEdge > -15 || XDistFrontEdge < 15
                Call DefendHub
            endif
            XGoto 0x8501    //Corrupted?
            Seek _1
            if Equal AirGroundState 2
                var22=OPos*(-1)
                AbsStick var22 (-1)
                Button R
            elif CurrAction <= 3
                Seek _2
                Jump
            elif !(Equal CurrSubaction 20) && NoJumpPrevFrame
                Button X
            endif
            Return
        endif
//____________________
label _2
        var16=6
        CallI 0x8201    //Corrupted?
    endif
    if Equal var21 10.5 && XDistLE var23
        if YDistFloor > 1
            var16=2
            var15=-10
            CallI 0x8206    //Corrupted?
        endif
        Return
    endif
    predictAverage var17 11
    var17+=5
    if XDistLE var17
        if Equal var21 10.2 && Equal AirGroundState 1
//____________________
label _3
            Stick 1
            if Equal CurrAction 3 && AnimFrame >= 5 || CurrAction <= 5 && !(Equal CurrAction 0)
                Seek _4
                Jump
            endif
            XGoto 0x8501    //Corrupted?
            Seek _3
            Return
//____________________
label _4
            if Equal AirGroundState 2
                Call MainHub
            endif
            Stick 1
            Button R
            if -0.2 < XSpeed && XSpeed < 0.2
                CallI 0x8204    //Corrupted?
            endif
            XGoto 0x8501    //Corrupted?
            Seek _4
            Return
        elif Equal var21 10.6 && Equal AirGroundState 1
            var16=3
            Call DashScr
        endif
    endif
    var23+=Width
    predictAverage var17 10
    if XDistLE var23 && !(Equal var1 (-1)) || XDistLE var17
        DynamicDiceClear 0
        if Equal AirGroundState 1
            predictAverage var23 11
            var23+=10
            var23*=OPos
            GetYDistFloorOffset var23 var23 5 1
            DynamicDiceAdd 0 1 PT_BAIT_DASHAWAYCHANCE
            DynamicDiceAdd 0 2 PT_JUMPINESS
            DynamicDiceAdd 0 3 PT_BAIT_WDASHAWAYCHANCE
            var22=4-PT_AGGRESSION
            DynamicDiceAdd 0 4 var22
            var22=PT_BAITCHANCE*2.5
            Abs var22
            DynamicDiceAdd 0 7 var22
            var22*=1.5
            DynamicDiceAdd 0 8 var22
            if Equal var23 (-1)
            elif Equal var1 1 && CHANCE_MUL_LE PT_AGGRESSION 0.3
                GetCommitPredictChance var22
                GetAttribute var23 40 0
                if var22 < 0.1 && var23 > 1.5
                    DynamicDiceAdd 0 6 1.25
                endif
            endif
            GetYDistFloorOffset var22 0 40 0
            GetColDistPosRel var17 var23 TopNX SCDBottom 0 40 1
            if Equal var17 (-1) && !(Equal var22 (-1)) && var22 < 30
                DynamicDiceAdd 0 5 1
            endif
            if CHANCE_MUL_GE PT_AGGRESSION 0.5
                var21=10.4
                if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.05
                    var21=10.5
                endif
            endif
            if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.1 && LevelValue >= 31
                var16=6
                var21=16.3
                Call DashScr
            elif CHANCE_MUL_LE PT_BAIT_WDASHAWAYCHANCE 0.1 && LevelValue >= 60
                var16=2
                Call Wavedash
            endif
            DynamicDiceRoll 0 var22 0
            if Equal var22 1
                var16=6
                if CHANCE_MUL_LE PT_AGGRESSION 0.15 && LevelValue >= 42
                    var21=16.3
                endif
                Call DashScr
            elif Equal var22 6
                var16=5
                Call DashScr
            elif Equal var22 2
                var16=2
                if CHANCE_MUL_GE PT_AGGRESSION 0.25
                    var16=3
                endif
                var16+=0.1
                Goto _6
                if CHANCE_MUL_LE PT_AGGRESSION 0.35 && var22 <= 35
                    var21=16
                    var15=-10
                endif
                Call JumpScr
            elif Equal var22 3
                var16=2
                Call Wavedash
            elif Equal var22 4
                var21=10.2
            elif Equal var22 7
                var21=10.4
            elif Equal var22 8
                var21=10.5
            endif
            GetYDistFloorOffset var17 0 50 0
            if var17 < 40 && CHANCE_MUL_LE PT_PLATCHANCE 1
                Call BoardPlatform
            endif
        elif NumJumps > 0 && CHANCE_MUL_LE PT_DJUMPINESS 0.2 && YDistFloor < 20
            var16=2
            if CHANCE_MUL_LE PT_AGGRESSION 0.6 && XDistLE 25
                var16=1
            elif Rnd < 0.5
                var16=3
            endif
            var16+=0.1
            Goto _6
            if var22 <= 30 && CHANCE_MUL_LE PT_AGGRESSION 0.35
                var21=16
                var15=-10
            endif
            Call JumpScr
        endif
    elif XDistLE var17 && CHANCE_MUL_LE PT_JUMPINESS 0.2 && Equal OAirGroundState 1 && Equal var1 1
        if CHANCE_MUL_LE PT_JUMPINESS 1 && XDistLE 25
            var16=1+0.1
        else
            var16=2
        endif
        Goto _6
        if CHANCE_MUL_LE PT_AGGRESSION 0.9 && var22 <= 40
            var21=16
            var15=-10
        endif
        Call JumpScr
    elif Equal var1 (-1) && CHANCE_MUL_GE PT_AGGRESSION 0.65
        if CHANCE_MUL_LE PT_WALL_CHANCE 0.25
            var20=-1
            var21=16.3
            var15=-10
        elif CHANCE_MUL_LE PT_AGGRESSION 0.15
            var20=-1
            var21=10.1
            var15=-10
        endif
        var16=4
        Call DashScr
    endif
elif var21 >= 16 && var21 < 17
    if CalledFrom 0x840F    //Corrupted?
        XGoto 0x850E    //Corrupted?
        Return
    endif
    var22=200
    XGoto 0x8505    //Corrupted?
    if var21 < 16.4 || Equal OIsOnStage 1 && var21 >= 16.7
        if var22 > 0
            var21=16.4
        endif
    endif
    if Equal var21 16.41 && Rnd < 0.05
        XGoto 0x8102    //Corrupted?
        Return
    endif
    if var21 >= 16.7 && Equal OIsOnStage 1 && OYDistFloor < 60
        var21=16
    endif
    if var21 < 16.7
        var22=OXSpeed*12
        GetYDistFloorOffset var22 var22 15 1
        if Equal OAirGroundState 3
            var21=16.7
        elif Equal var22 (-1) && OFramesHitstun > 0
            var21=16.7
        endif
        SetDebugOverlayColor 255 0 0 136
    elif Equal var21 16.72
        SetDebugOverlayColor 0 255 255 255
        Return
    elif Equal var21 16.71
        SetDebugOverlayColor 0 255 136 255
        if Equal CanCancelAttack 1 && Equal AirGroundState 1
            var21=16
        endif
    else
        SetDebugOverlayColor 0 255 255 136
        if CHANCE_MUL_LE PT_BAITCHANCE 0.15 || CHANCE_MUL_LE PT_AGGRESSION 0.1
            if Rnd < 0.02 && !(Equal OAirGroundState 3) && OYDistBackEdge > 0 && YDistFloor > 0 && DistToOEdge < 40 && OXDistBackEdge > 20
                var21=16.72
                Return
            endif
        endif
    endif
    EnableDebugOverlay
    MOD var22 GameTimer 4
    if Equal var20 (-1) && var22 >= 3
        Goto _5
        Goto _A
        Return
    elif OFramesHitstun <= 0 && OFramesHitlag <= 0 && !(ODistLE 35)
        MOD var22 GameTimer 60
        if var22 >= 59
            Goto _5
            Goto _A
            Return
        endif
    endif
    EstOYCoord var22 20
    var22-=TopNY-YDistFloor
    predictAverage var23 10
    var23*=0.5
    if XDistLE var23 && Equal var21 16.3 && CHANCE_MUL_LE PT_AGGRESSION 0.2
        var21=16
        var20=-1
        Return
    endif
    var23*=2
    var23+=20
    if XDistLE var23 && var21 < 16.4 && !(Equal var21 16.3)
        GetCommitPredictChance var22
        var22*=0.075
        if Rnd < var22
            if CHANCE_MUL_LE PT_WALL_CHANCE 0.45 || CHANCE_MUL_LE PT_BAITCHANCE 0.25
                if CHANCE_MUL_LE PT_BAITCHANCE 0.75
                    var21=10
                else
                    var20=-1
                    var21=16.3
                endif
                Return
            elif CHANCE_MUL_LE PT_BAITCHANCE 0.2 || CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 0.2
                if YDistFloor < 15 && YDistFloor > 0
                    var21=10.5
                    Return
                endif
            endif
        endif
    endif
    var2=(LevelValue/100-1)*45+4
    var22=200
    XGoto 0x8505    //Corrupted?
    if Equal var22 0
        var2=(LevelValue/100-1)*60+10
    endif
    var22=21
    XGoto 0x8505    //Corrupted?
    var23=(var22-1)*2
    if var23 < 0.25
        var23=0.25
    endif
    var2*=var23
    var2+=4
    var2*=PT_REACTION_TIME
    MOD var2 GameTimer var2
    Goto _7
    var23=2*PT_REACTION_TIME
    if OAnimFrame <= var23 && var22 < 5
        var2=2
    endif
    if Equal var20 13 || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17
    elif OCurrAction >= 26 && OCurrAction <= 29 && var2 < 1 && Rnd < 0.2
        var20=-1
        Return
    endif
    predictAverage var22 10
    var22+=10
    if Equal OCurrAction 73 && var21 < 16.7 && XDistLE var22 && !(Equal OAirGroundState 1)
        predictOOption var22 15
        predictionConfidence var17 15
        if Equal var22 2 && Rnd < var17
            Call Shield
        endif
    endif
    Goto _6
    var23=XSpeed
    Abs var23
    var23+=8
    if var21 >= 16.7
        var16=0
        XGoto 0x850E    //Corrupted?
    elif OCurrAction <= 33 && !(Equal CurrAction 10) && Equal OFramesHitstun 0
        if var2 <= 1
            XGoto 0x850E    //Corrupted?
        endif
        MOD var22 GameTimer 8
        if LevelValue >= 60 && OCurrAction <= 32 && var22 <= 1 && var21 < 16.5
            predictAverage var22 10
            var23=Width+OWidth+5
            var22+=var23
            if XDistLE var23 var22
                GetCommitPredictChance var22
                var23=var22*1.5
                if var22 >= 0.13
                    if CHANCE_MUL_GE PT_AGGRESSION var23
                        Goto _C
                    endif
                endif
            endif
        endif
    elif var2 <= 1 || Equal CurrAction 10 || Equal OCurrAction 73 || OFramesHitstun > 1 || Equal HitboxConnected 1
        if var22 > var23
            var22=200
            XGoto 0x8505    //Corrupted?
            if Equal var22 1 || var21 >= 16.7
            elif !(SamePlane) && CHANCE_MUL_LE PT_BAITCHANCE 0.15 && Rnd < 0.2 && OFramesHitstun <= 0
                var21=10
                Return
            endif
        endif
        if !(Equal var21 16.5) && !(XDistLE 15)
            var22=0.004
            XGoto 0x8505    //Corrupted?
            var17=var22
            if Equal var17 (-500)
                if CHANCE_MUL_GE PT_AGGRESSION 0.5
                    var21=10.2
                else
                    Goto _C
                endif
            endif
        endif
        XGoto 0x850E    //Corrupted?
    endif
    if var16 < 10
        var16=0
    endif
    if var20 > -1
        XGoto 0x850D    //Corrupted?
    endif
else
    var21=10
endif
Return
//____________________
label _5
if OAnimFrame < 2
    var13=OTotalXSpeed*10*OPos*ODirection*(-1)+OTopNX
else
    EstOXCoord var13 10
    var13-=OTopNX
    var13*=OPos*ODirection*(-1)
    var13+=OTopNX
endif
var14=OYDistBackEdge+OTopNY
Return
//____________________
label _6
var22=TopNX-var13
var23=TopNY-var14
Goto _8
Return
//____________________
label _7
var22=OTopNX-var13
var23=OTopNY-var14
Goto _8
Return
//____________________
label _8
Norm var22 var22 var23
Abs var22
Return
//____________________
label _9
MOD var22 GameTimer 350
if var22 >= 335
    ADJUST_PERSONALITY 5 (-0.4) 1
    ADJUST_PERSONALITY 5 (-0.02) ODamage
    if Rnd < 0.25
        Call MainHub
    endif
    var21=10
    Return
endif
Return
//____________________
label _A
XGoto 0x8503    //Corrupted?
Return
//____________________
label _B
if CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 0.35 || Equal var21 7 && Rnd < 0.75
    XGoto 0x8504    //Corrupted?
else
    XGoto 0x8502    //Corrupted?
endif
Return
//____________________
label _C
var23=LevelValue+2
var22=Rnd*var23
if var20 >= 0 && LevelValue >= 42
    if CHANCE_MUL_LE PT_AGGRESSION 0.02
        var21=16.5
    elif CHANCE_MUL_LE PT_AGGRESSION 0.2
        var20=-1
        var21=16.3
    endif
endif
if var22 > 10 && !(HasCurry)
    if YDistFloor > 5 && NumJumps > 0 && SamePlane
        Button X
    elif Equal AirGroundState 1
        var15=-10
        Seek _0
        Jump
    else
        var15=-10
        var16=2
        Call JumpScr
    endif
endif
Return
Return
