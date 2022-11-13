#include <Definition_AIMain.h>
id 0x850F
unk 0x0

XReciever
NoRepeat
var16 = 0

if var21 >= 16 && var21 < 17
else 
  predictOOption var22 10 LevelValue
  var22 *= 0.15
  GetCommitPredictChance var23 LevelValue
  if XDistLE var22
    if var23 < 0.05
      var21 = 16
      XGoto CalcAttackGoal
      XReciever
    elif OAnimFrame > 45 && OCurrAction <= 1 && var23 < 0.25
      var21 = 16
      XGoto CalcAttackGoal
      XReciever
    endif
  endif
endif

LOGSTR 1667718912 1986096128 1969553408 0 0
LOGVAL var21
PRINTLN

// if Equal var14 BBoundary
//   if var21 >= 16 && var21 < 17
//   else
//     Call MainHub
//   endif
// endif

GetIsTeammateCloser var3
if Equal var3 1
  if Rnd <= 0.02
    SwitchTarget
    Return
  endif
  var20 = -1
  var21 = 10.5
endif

if var21 >= 7 && var21 < 8
  var20 = -1

  SetDebugOverlayColor 0 0 255 136
  EnableDebugOverlay
  var22 = 21
  XGoto GetChrSpecific
  XReciever
var17 = var22
  var17 *= -1
  var17 += 1

  var22 = (1 - (LevelValue / 100)) * 30 + 10 * var17
  var22 *= PT_REACTION_TIME
  MOD var22 AnimFrame var22
  if var22 <= 1
    var17 = OTopNY - TopNY
    if var17 > 45 || OYDistBackEdge < -20 && Equal AirGroundState 1
      if CHANCE_MUL_LE PT_AGGRESSION 0.9
        var21 = 16
        Return
      endif
    endif

    predictOOption var22 10 LevelValue 
    var22 += 30
    if CHANCE_MUL_LE PT_AGGRESSION 0.1
      if XDistLE var22 
        var21 = 10
        Return
      endif
      var16 = 2
      XGoto CalcAttackGoal
      XReciever
      var16 = 0
      
      if !(Equal var20 -1)
        var15 = -2
        CallI MainHub
      else
        Goto forceChangeGoal
      endif
    endif
  endif
  // if Equal var22 1 && Rnd < 0.15
  //   var21 = 10
  //   Return
  // endif

  predictAverage var17 10 LevelValue
  Goto getODist
  if var22 <= var17
    Goto forceChangeGoal
    Return
  endif

  var17 = var22 * 0.75
  Goto getDist
  if var17 < var22
    Goto forceChangeGoal
    Return
  endif

  Goto getDist
  if var22 <= 13
    if CHANCE_MUL_LE PT_AGGRESSION 0.15
      var21 = 10
      Return
    elif XDistLE var17 || Rnd <= 0.04
      Goto forceChangeGoal
      Return
    endif
  var22 = 21
  XGoto GetChrSpecific
  XReciever
var17 = var22
    var17 *= -1
    var17 += 1

    var22 = (1 - (LevelValue / 100)) * 30 + 10 * var17
    var22 *= PT_REACTION_TIME
    MOD var22 AnimFrame var22
    if var22 <= 1
      if Equal AirGroundState 1 && CHANCE_MUL_LE PT_JUMPINESS 1
        var14 += 11.81 
        if CHANCE_MUL_LE PT_JUMPINESS 1 && CHANCE_MUL_LE PT_JUMPINESS 1
          var14 += 5
        endif
      elif Equal AirGroundState 2 && YDistBackEdge < -5
        if CHANCE_MUL_LE PT_DJUMPINESS 1 && CHANCE_MUL_LE PT_DJUMPINESS 1 && NumJumps > 0
          var14 += 30.72
        else
          var14 += 1
          GetYDistFloorAbsPos var22 var13 var14
          var14 -= var22
        endif
      endif
    endif
  endif
elif var21 >= 10 && var21 < 11
  var20 = -1
  var22 = 200
  XGoto GetChrSpecific
  XReciever
  if Equal var22 1
    LOGSTR_NL 1229856768 1129270528 1112473600 0 0
    var21 = 16.4
    Return
  endif

  predictAverage var22 10 LevelValue
  if var22 < 8
    var22 = 8
  endif
  var22 += 10
  DrawDebugRectOutline var13 var14 var22 var22 255 255 0 136
  var22 += 10
  DrawDebugRectOutline var13 var14 var22 var22 255 255 0 68
  var22 += 10
  DrawDebugRectOutline var13 var14 var22 var22 255 255 0 34
  var22 += 10
  var23 = OPos * -30
  GetYDistFloorOffset var23 var23 10 0

  SetDebugOverlayColor 255 0 255 136
  if Equal var21 10.5
    SetDebugOverlayColor 255 0 255 255
  endif
  EnableDebugOverlay

  var22 = 21
  XGoto GetChrSpecific
  XReciever
var17 = var22
  var17 *= -1
  var17 += 1

  var22 = (1 - (LevelValue / 100)) * 30 + 10 * var17
  var22 *= PT_REACTION_TIME
  MOD var22 AnimFrame var22
  // $LV9Check(var22 = 1)
  if var22 <= 1 && OAnimFrame > var17
    Goto OPosGoal

    var17 = OTopNY - TopNY
    if var17 > 45 || OYDistBackEdge < -20 && Equal AirGroundState 1
      if CHANCE_MUL_LE PT_AGGRESSION 1.25
        var21 = 16
        Return
      endif
    endif
    
    GetAttribute var23 40; 0
    var22 = 2 - var23
    var22 *= 0.25 * PT_CIRCLECAMPCHANCE
    if CHANCE_MUL_LE PT_AGGRESSION var22
      if YDistFloor > -1 && YDistFloor < 25
        var16 = 2
        XGoto CalcAttackGoal
        XReciever
        if !(Equal var20 -1)
          var15 = -2
          CallI MainHub
        endif
        var16 = 0
      endif
    endif
    Norm var22 OTopNX OTopNY
    Abs var22
    if CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 0.05 && var22 < 35
      var21 = 7
      Return
    endif

    if Equal var21 10.4
      Return
    elif Equal var21 10.5 && CHANCE_MUL_LE PT_BAITCHANCE 0.8
      Return
    elif !(Equal var21 10.1)
      if Equal CurrAction 3 || Equal CurrAction 4
        GetCommitPredictChance var22 LevelValue
        predictAverage var23 10 LevelValue
        if var23 < 5
          var23 = 5
        endif
        if var22 > 0.2 && !(XDistLE var23) && CHANCE_MUL_LE PT_BAITCHANCE 0.2
          var15 = -1
          var21 = 10.4
          if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.05
            var21 = 10.5
          endif
          var16 = 3
          CallI Wavedash
          Return
        endif
      endif
    endif

    predictAverage var22 10 LevelValue
    if CHANCE_MUL_LE PT_AGGRESSION 0.4 && YDistFloor > -1 && YDistFloor < 15 && !(XDistLE var22)
      if Equal var21 10.1
        XGoto CalcAttackGoal
        XReciever
        if !(Equal var20 -1)
          var15 = -2
          CallI MainHub
        endif
      endif
    endif

    // if !(Equal var21 10.2) && CHANCE_MUL_LE PT_BAITCHANCE 1 && Equal var3 0
    //   predictAverage var22 10 LevelValue
    //   if var22 < 8
    //     var22 = 8
    //   endif
    //   var22 += 100
    //   var23 = var22 - 70
    //   if XDistLE var22 && !(XDistLE var23) && CHANCE_MUL_LE PT_AGGRESSION 0.3
    //     if CHANCE_MUL_LE PT_BRAVECHANCE 0.4
    //       if CHANCE_MUL_LE PT_WALL_CHANCE 0.35
    //         var21 = 16.3
    //       else  
    //         var21 = 10.1
    //       endif
    //       XGoto CalcAttackGoal
    //       XReciever
          
    //       if !(Equal var20 -1)
    //         var15 = -2
    //         CallI MainHub
    //       endif
    //     endif
    //   elif XDistLE var23 && CHANCE_MUL_LE PT_AGGRESSION 0.7
    //     GetCommitPredictChance var22 LevelValue
    //     if CHANCE_MUL_LE PT_BRAVECHANCE 0.75 && var22 < 0.35
    //       if CHANCE_MUL_LE PT_WALL_CHANCE 0.85
    //         var21 = 16.3
    //       else  
    //         var21 = 10.1
    //       endif
    //       XGoto CalcAttackGoal
    //       XReciever
          
    //       if !(Equal var20 -1)
    //         var15 = -2
    //         CallI MainHub
    //       endif
    //     endif
    //   endif
    // endif
  endif

  if Equal var21 10.4
    Return
  endif

  var1 = 1
  predictAverage var23 10 LevelValue
  if var23 < 8
    var23 = 8
  endif
  var23 += 10
  var23 *= OPos
  
  Norm var22 TopNX TopNY
  Norm var17 OTopNX OTopNY
  Abs var22
  Abs var17

  GetYDistFloorOffset var23 var23 5 1
  if Equal var23 -1 || Equal var3 1 || var22 < var17
    var1 = 0
    predictAverage var23 10 LevelValue
  endif

  Goto getDist
  GetCommitPredictChance var23 LevelValue
  if var22 >= 55 || var23 < 0.25
    var1 = 1
  elif CHANCE_MUL_LE PT_BAITCHANCE 0.05
    var1 = -1
  endif 

  predictAverage var17 10 LevelValue
  if var17 < 15
    var17 = 15
  endif
  var22 = 10 * Rnd
  var17 -= var22
  if !(Equal var1 1)
    var17 = var17 + 15 * Rnd
  elif True
    if CHANCE_MUL_LE PT_BRAVECHANCE 1.25
    else
      var17 = var17 + 15 * Rnd
    endif
  endif
  var22 = var17
  if XDistLE var17 && Equal AirGroundState 1 && Equal var21 10.5
    if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.65
      var15 = -1
    endif
    if CHANCE_MUL_LE PT_BAIT_WDASHAWAYCHANCE 0.45
      var16 = 2
      Call Wavedash
    endif
    var16 = 2
    if CurrAction > 3
      label wdback
      if XDistBackEdge > -15 || XDistFrontEdge < 15
        Call DefendHub
      endif
      XGoto PerFrameChecks
      XReciever
      Seek wdback
      if Equal AirGroundState 2
        var22 = OPos * -1
        AbsStick var22 (-1)
        Button R
      elif CurrAction <= 3
        Seek exec_dash
        Jump
      elif !(Equal CurrSubaction JumpSquat)
        Button X
      endif
      Return
    endif
    label exec_dash
    var16 = 2
    CallI DashScr
    // endif
  endif


  if Equal var21 10.5
    Return
  endif

  predictAverage var22 10 LevelValue
  var22 += 5
  if XDistLE var22 && !(Equal var1 -1)
    if Equal var21 10.2 && Equal AirGroundState 1
      label startup
      Stick 1
      if Equal CurrAction 3 && AnimFrame >= 5
        Seek slide
        Jump
      elif CurrAction <= 5 && !(Equal CurrAction 0)
        Seek slide
        Jump
      endif
      Return
      label slide
      Stick 1
      Button R
      if -0.2 < XSpeed && XSpeed < 0.2
        CallI Shield
      endif
      Return
    elif Equal var21 10.6 && Equal AirGroundState 1
      var16 = 2
      if CHANCE_MUL_LE PT_AGGRESSION 0.75
        var16 = 3
      endif
      Call DashScr
    endif
  endif
  var22 += 10

  if XDistLE var22 && !(Equal var1 -1)

    DynamicDiceClear 0
    if Equal AirGroundState 1

      predictAverage var23 10 LevelValue
      var23 += 10
      var23 *= OPos
      GetYDistFloorOffset var23 var23 5 1

      DynamicDiceAdd 0 1 PT_BAIT_DASHAWAYCHANCE
      DynamicDiceAdd 0 2 PT_JUMPINESS
      DynamicDiceAdd 0 3 PT_BAIT_WDASHAWAYCHANCE
      var22 = 6 - PT_AGGRESSION
      DynamicDiceAdd 0 4 var22
      var22 = PT_BAITCHANCE * 8
      Abs var22
      DynamicDiceAdd 0 7 var22
      if Equal var23 -1
      elif Equal var1 1 && CHANCE_MUL_LE PT_AGGRESSION 0.3
        GetCommitPredictChance var22 LevelValue
        GetAttribute var23 40; 0
        if var22 < 0.6 && var23 > 1.5
          DynamicDiceAdd 0 6 1.25
        endif
      endif
      GetYDistFloorOffset var22 0 40 0
      GetColDistPosRel var17 var23 TopNX SCDBottom 0 40 1
      if Equal var17 -1 && !(Equal var22 -1) && var22 < 30
        DynamicDiceAdd 0 5 1 
      endif
      DynamicDiceRoll 0 var22 0
      if CHANCE_MUL_GE PT_AGGRESSION 0.2
        var21 = 10.4
        if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.05
          var21 = 10.5
        endif
      endif
      if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.05
        var16 = 2
        Call DashScr
      elif CHANCE_MUL_LE PT_BAIT_WDASHAWAYCHANCE 0.05
        var16 = 2
        Call Wavedash
      endif
      if Equal var22 1
        var16 = 2
        if CHANCE_MUL_LE PT_AGGRESSION 0.2
          var16 = 1
        endif
        Call DashScr
      elif Equal var22 6
        var16 = 5
        Call DashScr
      elif Equal var22 2
        var16 = 2
        if CHANCE_MUL_GE PT_AGGRESSION 0.25
          var16 = 3
        endif
        Goto getDist
        if CHANCE_MUL_LE PT_AGGRESSION 0.9 && var22 <= 100
          var21 = 16
          var15 = -1
        endif
        Call JumpScr
      elif Equal var22 3
        var16 = 2
        Call Wavedash
      elif Equal var22 4
        var21 = 10.2
      elif Equal var22 7
        var21 = 10.4
      endif
      GetYDistFloorOffset var17 0 50 0
      if var17 < 40 && CHANCE_MUL_LE PT_PLATCHANCE 1
        Call BoardPlatform
      endif
    elif NumJumps > 0 && CHANCE_MUL_LE PT_DJUMPINESS 0.2 && YDistFloor < 20
      
      var16 = 2
      if CHANCE_MUL_LE PT_AGGRESSION 0.6 && XDistLE 25
        var16 = 1
      elif Rnd < 0.5
        var16 = 3
      endif
      var16 += 0.1
      Goto getDist
      if var22 <= 100 && CHANCE_MUL_LE PT_AGGRESSION 0.8
        var21 = 16
        var15 = -1
      endif
      Call JumpScr
    endif
  elif XDistLE var17 && CHANCE_MUL_LE PT_JUMPINESS 0.2 && Equal OAirGroundState 1 && Equal var1 1
    // LOGSTR 1027423488 1229856768 842874112 1023410176 0
    if CHANCE_MUL_LE PT_JUMPINESS 1 && XDistLE 25
      var16 = 1
      var16 += 0.1
    else
      var16 = 2
    endif
    Goto getDist
    if CHANCE_MUL_LE PT_AGGRESSION 0.9 && var22 <= 100
      var21 = 16
      var15 = -1
    endif
    Call JumpScr
  elif Equal var1 -1 && CHANCE_MUL_GE PT_AGGRESSION 0.65
    if CHANCE_MUL_LE PT_WALL_CHANCE 0.25
      var20 = -1
      var21 = 16.3
      var15 = -1
    elif CHANCE_MUL_LE PT_AGGRESSION 0.15
      var20 = -1
      var21 = 10.1
      var15 = -1
    endif
    var16 = 4
    Call DashScr
  endif
elif var21 >= 16 && var21 < 17
  if CalledFrom ExecuteAttack
    XGoto SetAttackGoal
    XReciever
    Return
  endif
  
  if Equal var21 16.41 && Rnd < 0.05
    XGoto DefendHub
    XReciever
    Return
  endif

  // if OCurrAction >= 66 && OCurrAction <= 89 && !(Equal OCurrAction 73)
  // elif Equal OCurrAction 73 && OYDistFloor > 15
  // elif Equal HitboxConnected 1 || Equal PrevAction 60
  // elif Equal var21 16.7 && Equal OIsOnStage 1
  //   var21 = 16
  // endif 

  if var21 < 16.7
    var22 = OXSpeed * 12
    GetYDistFloorOffset var22 var22 15 1
    if Equal OAirGroundState 3
      var21 = 16.7
    elif Equal var22 -1 && OFramesHitstun > 0 
      var21 = 16.7
    endif

    SetDebugOverlayColor 255 0 0 136
  elif Equal var21 16.72
    SetDebugOverlayColor 0 255 255 255
    Return
  elif Equal var21 16.71
    SetDebugOverlayColor 0 255 136 255
    if Equal AirGroundState 1
      var21 = 16
    endif
  else
    SetDebugOverlayColor 0 255 255 136

    if Rnd < 0.1 && !(Equal OAirGroundState 3)
      if CHANCE_MUL_LE PT_BAITCHANCE 0.05 || CHANCE_MUL_LE PT_BRAVECHANCE 0.05
        var21 = 16.72
        Return
      endif
    endif
    if Equal OAirGroundState 1
      var21 = 16.4
    endif
  endif
  EnableDebugOverlay

  if Equal var20 -1
    Goto OPosGoal
    Goto changeGoal
    Return
  endif

  // $ifLastOrigin(grab,0)
  //   if CHANCE_MUL_LE PT_AGGRESSION 0.65
  //     if Equal var21 16.3
  //       Goto changeGoal
  //       Return
  //     elif Equal OCurrAction 74 || Equal OCurrAction 77 || Equal OCurrAction 83 || Equal OCurrAction 84
  //       Goto changeGoal
  //       Return
  //     elif OCurrAction >= 68 && OCurrAction <= 73 || Equal OCurrAction 66
  //       if OYDistBackEdge > -12 && OYSpeed < 0
  //         Goto changeGoal
  //         Return
  //       endif
  //     endif 
  //   endif
  // endif

  // $ifLastOrigin(grab,0)
  // elif Equal var21 16.3
  //   predictAverage var22 10 LevelValue
  //   if var22 < 8
  //     var22 = 8
  //   endif
  //   var22 += 60
  //   var23 = var22 - 70
  //   if XDistLE var22 && !(XDistLE var23) && CHANCE_MUL_LE PT_AGGRESSION 0.05
  //     Call ExecuteAttack
  //   endif
  // endif

  EstOYCoord var22 20
  var22 -= TopNY - YDistFloor
  // $ifAerialAttack()
  //   if var21 >= 16.7
  //     var20 = -1
  //     Return
  //   endif
  // endif

  // predictAverage var22 10 LevelValue
  // var22 += 10
  // if Equal var21 16.6 && XDistLE var22
  //   var16 = 1
  //   var16 += 0.1
  //   var15 = -1
  //   var21 = 16.4
  //   CallI JumpScr 
  // endif

  // var17 = TopNX
  // var22 = OTopNX
  // Abs var17
  // Abs var22
  // if Equal var21 16.3
  //   $ifAerialAttack()
  //     if var17 < var22
  //       Call ExecuteAttack
  //     elif Rnd < 0.2
  //       Call ExecuteAttack
  //     endif
  //   elif Equal AirGroundState 1
  //     if var17 < var22
  //       Call ExecuteAttack
  //     elif Rnd < 0.2
  //       Call ExecuteAttack
  //   endif
  //     endif
  // endif

  predictAverage var23 10 LevelValue
  var23 += 20
  if XDistLE var23 && var21 < 16.4
    if !(Equal var21 16.3)
      GetCommitPredictChance var22 LevelValue
      var22 *= 0.1
      if Rnd < var22 
        if CHANCE_MUL_LE PT_WALL_CHANCE 0.45 || CHANCE_MUL_LE PT_BAITCHANCE 0.25
          if CHANCE_MUL_LE PT_BAITCHANCE 0.75
            var21 = 10
          else
            var20 = -1
            var21 = 16.3
          endif
          Return
        elif CHANCE_MUL_LE PT_BAITCHANCE 0.2 || CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 0.2
          var21 = 10.5
          Return
        endif
      endif
    endif
  endif

  // LOGSTR 1027424512 1414807808 1129003520 0 0
  // $printMoveName()
  
  // combos
  var2 = (1 - (LevelValue / 100)) * 25 + 2
  var17 = OAnimFrame
  // standard
  var22 = 200
  XGoto GetChrSpecific
  XReciever
  if Equal var22 0
    var2 = (1 - (LevelValue / 100)) * 30 + 15
    var17 = OAnimFrame
  endif

  var22 = 21
  XGoto GetChrSpecific
  XReciever
var23 = var22
  var23 = (1 - var23)
  var2 *= var23
  var2 += 4

  var2 *= PT_REACTION_TIME

  MOD var2 var17 var2

  Goto getODist
  var23 = 2 * PT_REACTION_TIME
  if OAnimFrame <= var23 && var22 < 5
    var2 = 2
  endif

if !(True) || Equal var20 19 || Equal var20 20 || Equal var20 21 || Equal var20 22 || Equal var20 23
  elif OCurrAction >= 26 && OCurrAction <= 29 && var2 < 1 && Rnd < 0.2
    var20 = -1
    Return      
  endif

  // GET_CHAR_TRAIT(var22, 200)
  // var17 = OTopNY - TopNY
  // if Equal var22 0
  //   if var17 > 30 || OYDistBackEdge < -35 && Equal AirGroundState 1
  //   elif !(Equal var21 16.4) && OYDistFloor < 45
  //   elif var21 >= 16.7
  //   elif True
  //     if var2 <= 1 && Equal AirGroundState 1
  //       predictOOption var22 11 LevelValue 
  //       predictionConfidence var23 11 LevelValue
  //       if Equal var22 1 && CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.6
  //         var21 = 10.5
  //         Return
  //       elif Equal var22 2 && CHANCE_MUL_GE PT_BRAVECHANCE 0.35
  //         var21 = 10
  //         Return
  //       elif Equal var22 3 && Rnd < var23
  //         var21 = 7
  //         Return
  //       endif
  //     endif
  //     if var2 <= 1 && Equal shouldApproach 0 && Equal AirGroundState 1 && CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.5
  //       var21 = 10.5
  //       Return
  //     endif
  //     var22 += 30
  //     if !(XDistLE var22) && CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 1 && CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 1 && OFramesHitstun <= 0
  //       var21 = 7
  //       Return
  //     endif
  //   endif
  // endif

  predictAverage var22 10 LevelValue
  var22 += 10
  if Equal OCurrAction 73 && var21 < 16.7
    if XDistLE var22 && !(Equal OAirGroundState 1) 
      predictOOption var22 15 LevelValue
      predictionConfidence var17 15 LevelValue
      if Equal var22 2 && Rnd < var17
        Call Shield
      endif
    endif
  endif

  // if Equal var23 var17 && var22 > 55
  //   XGoto GoalChoiceHub
  //   XReciever
  //   Return
  // endif

  // prevents truly unreactable adjustements
  // Goto getDist
  // XReciever

  var23 = XSpeed
  Abs var23
  var23 = 8 + var23

  // LOGSTR 1397247744 1431061504 542461952 1145132032 1161756672
  // LOGVAL var2
  // LOGVAL OCurrAction
  // PRINTLN

  if var21 >= 16.7
    var16 = 0
    XGoto SetAttackGoal
    XReciever
  elif OCurrAction <= 33 && !(Equal CurrAction 10) && Equal OFramesHitstun 0
    if var2 <= 1
      XGoto SetAttackGoal
      XReciever
    endif

    // if OCurrAction >= 11 && OCurrAction <= 13 && OAnimFrame < 20
    // else
    //   XGoto SetAttackGoal
    //   XReciever
    // endif

    if var21 <= 16.4 && !(Equal var21 16.3)
      var23 = OPos * -15
      GetYDistFloorOffset var22 var23 0 0
      var23 *= -2
      GetYDistFloorOffset var23 var23 0 1
      if Equal var22 -1
        var23 = -1
      endif
      if Equal var23 -1 && CHANCE_MUL_GE PT_AGGRESSION 0.4 && CHANCE_MUL_GE PT_WALL_CHANCE 0.65
        var21 = 10.4
        if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.4
          var21 = 10.5
        endif
        Return
      elif Equal var23 -1
if !(True) || Equal var20 12|| Equal var20 14|| Equal var20 17|| Equal var20 18|| Equal var20 24|| Equal var20 25|| Equal var20 26|| Equal var20 27|| Equal var20 28|| Equal var20 29
          var21 = 16.3      
          Return
        endif
      endif
    endif
  // otherwise carry on as normal
  elif var2 <= 1 || Equal CurrAction 10 || Equal OCurrAction 73 || OFramesHitstun > 1 || Equal HitboxConnected 1
    
    if OAnimFrame <= 9 || Equal CurrAction 10 || Equal OCurrAction 73 || OFramesHitstun > 1 || Equal HitboxConnected 1
      if var22 > var23
  var22 = 200
  XGoto GetChrSpecific
  XReciever
        if Equal var22 1
        elif var21 >= 16.7
        elif !(SamePlane) && CHANCE_MUL_LE PT_BAITCHANCE 1 && Rnd < 0.2 && var2 <= 1 && OFramesHitstun <= 0
          var21 = 10
          Return
        endif

        // var16 = 3
        XGoto SetAttackGoal
        XReciever
      endif
    endif
  endif

  // Goto getDist
  // if var22 > 35 && var2 <= 1 && XDistLE 35 && !(Equal var21 16.7)
  //   Goto changeGoal
  //   Return
  // endif

  if var16 < 10
    var16 = 0
  endif
  XGoto CheckAttackWillHit
  XReciever
else
  var21 = 10
endif
Return
label OPosGoal
if OAnimFrame < 2
  var13 = OTopNX + OTotalXSpeed * 10 * OPos * ODirection * -1
else
  EstOXCoord var13 10
  var13 -= OTopNX
  var13 *= OPos * ODirection * -1
  var13 += OTopNX
endif
var14 = OYDistBackEdge + OTopNY
// if OYDistBackEdge < -30
//   var14 += 11.81 
// endif
Return
label getDist
var22 = TopNX - var13
var23 = TopNY - var14
Goto normalize
Return
label getODist
var22 = OTopNX - var13
var23 = OTopNY - var14
Goto normalize
Return
label normalize
Norm var22 var22 var23
Abs var22
Return
label changeGoal
MOD var22 AnimFrame 8
if Equal var22 0
  XGoto CalcAttackGoal
  XReciever
endif
Return
label forceChangeGoal
  if CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 0.35
    XGoto CircleCampGoal
    XReciever
  else
    XGoto RandomizeGoal
    XReciever
  endif
Return
Return
