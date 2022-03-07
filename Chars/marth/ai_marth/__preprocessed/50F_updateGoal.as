#include <Definition_AIMain.h>
id 0x850F
unk 0x0

XReciever
var16 = 0

GetCommitPredictChance var0 LevelValue
// if var21 >= 16 && var21 < 17
MOD var22 AnimFrame 8
if var22 <= 1 || !(ODistLE 40) || Rnd < 0.8
elif var21 < 16.7
  if Equal var21 16.4
  elif OAttacking
  elif var0 >= 0.4
    if CHANCE_MUL_LE PT_AGGRESSION 0.7
      var21 = 10.5
    elif CHANCE_MUL_LE PT_BAITCHANCE 0.65
      var21 = 10.2
    else
      var21 = 10
    endif
  elif var0 >= 0.3
    if CHANCE_MUL_GE PT_AGGRESSION 0.8
      var21 = 10.2
    elif CHANCE_MUL_LE PT_AGGRESSION 0.3
      var21 = 16.3
    else
      var21 = 10
    endif
  elif CHANCE_MUL_LE PT_AGGRESSION 0.2
    var21 = 16.3
  endif
  PredictOMov var0 15 LevelValue
  if var0 >= 0.6
    if CHANCE_MUL_LE PT_AGGRESSION 0.4
      var21 = 16.3
    elif CHANCE_MUL_LE PT_AGGRESSION 0.5
      var21 = 10.6
    else
      var21 = 10.5
    endif
  endif
elif !(Equal OYDistFloor -1)
  var21 = 16
endif

if Equal var14 BBoundary
  if var21 >= 16 && var21 < 17
  else
    Goto forceChangeGoal
  endif
endif

GetIsTeammateCloser var3
if Equal var3 1
  if Rnd <= 0.02
    SwitchTarget
    Return
  endif
  var20 = -1
  var21 = 7
endif

// if OYDistBackEdge >= -10 && OCurrAction >= 69 && OCurrAction <= 85 && Equal OIsOnStage 1
//   $ifLastAttack(fthrow)
//     var20 = -1
//   $elifLastAttack(dthrow)
//     var20 = -1
//   $elifLastAttack(bthrow)
//     var20 = -1
//   $elifLastAttack(uthrow)
//     var20 = -1
//   endif
// endif
var0 = -1
var22 = (1 - (LevelValue / 100)) * 30
var22 *= PT_REACTION_TIME
if var22 <= 1
  Goto EndlagCheck
endif
if var21 >= 7 && var21 < 8
  // Norm var22 TopNX TopNY
  // Norm var17 OTopNX OTopNY
  // Abs var22
  // Abs var17
  // if var22 < var17
  //   var21 = 10
  //   Return
  // endif

  SetDebugOverlayColor 0 0 255 136
  EnableDebugOverlay
  var22 = 21
  XGoto GetChrSpecific
  XReciever
var17 = var22
  var17 = (1 - var17)
  var22 = (1 - (LevelValue / 100)) * 30 + 10 * var17
  var22 *= PT_REACTION_TIME

  MOD var22 AnimFrame var22
  if var22 <= 1
    var17 = OTopNY - TopNY
    if var17 > 45 || OYDistBackEdge < -35 && Equal AirGroundState 1
      if CHANCE_MUL_LE PT_AGGRESSION 1.4
        var21 = 16
        Return
      endif
    endif

    // predictOOption var22 10 LevelValue 
    // var22 += 10
    if CHANCE_MUL_LE PT_AGGRESSION 0.4
      // if XDistLE var22 
      //   var21 = 10
      //   Return
      // endif
      var21 = 7.1
      XGoto CalcAttackGoal
      XReciever
      var21 = 7
      
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
    if ODistLE var17 || Rnd <= 0.04
      Goto forceChangeGoal
      Return
    endif
  var22 = 21
  XGoto GetChrSpecific
  XReciever
var17 = var22
    var17 = (1 - var17)
    var22 = (1 - (LevelValue / 100)) * 30 + 10 * var17
    var22 *= PT_REACTION_TIME
    MOD var22 AnimFrame var22
    // $LV9Check(var22 = 1)
    if var22 <= 1
      // Goto EndlagCheck

      if Equal AirGroundState 1 && CHANCE_MUL_LE PT_JUMPINESS 1
        var14 += 11.77 
        if CHANCE_MUL_LE PT_JUMPINESS 1 && CHANCE_MUL_LE PT_JUMPINESS 1
          var14 += 5
        endif
      elif Equal AirGroundState 2 && YDistBackEdge < -5
        if CHANCE_MUL_LE PT_DJUMPINESS 1 && CHANCE_MUL_LE PT_DJUMPINESS 1 && NumJumps > 0
          var14 += 26.23
        else
          var14 += 1
          GetYDistFloorAbsPos var22 var13 var14
          var14 -= var22
        endif
      endif
    endif
  endif
elif var21 >= 10 && var21 < 11
  var22 = 200
  XGoto GetChrSpecific
  XReciever
  if Equal var22 1
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
  if var21 < 10.5
  elif ODistLE var22 && Equal var23 -1
    var21 = 10
  endif

  SetDebugOverlayColor 255 0 255 136
  if Equal var21 10.5
    SetDebugOverlayColor 255 0 255 255
  endif
  EnableDebugOverlay

  var22 = 21
  XGoto GetChrSpecific
  XReciever
var17 = var22
  var17 = (1 - var17)
  var22 = (1 - (LevelValue / 100)) * 30 + 10 * var17

  var22 *= PT_REACTION_TIME
  MOD var22 AnimFrame var22
  // $LV9Check(var22 = 1)
  if var22 <= 1 && OAnimFrame > var17
    Goto OPosGoal

    var17 = OTopNY - TopNY
    if var17 > 45 || OYDistBackEdge < -35 && Equal AirGroundState 1
      if CHANCE_MUL_LE PT_AGGRESSION 1.25
        var21 = 16
        Return
      endif
    endif
    
    if Equal var21 10.4
      Return
    endif

    if !(Equal var21 10.2) && !(Equal var21 10.5) && !(Equal var21 10.6)
      predictOOption var22 11 LevelValue 
      predictionConfidence var23 11 LevelValue
      if Equal var22 1 && Rnd < var23
        if CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 1 && Equal var3 0
          if CHANCE_MUL_LE PT_BAITCHANCE 0.25
            var21 = 10.5
          else 
            var21 = 7
          endif
        endif
        var22 = 1
        Return
      elif Equal var22 2 && Rnd < var23 && CHANCE_MUL_LE PT_BRAVECHANCE 1
        var22 = 1
      else
        var22 = 0
      endif

      predictAverage var22 10 LevelValue
      if var22 < 8
        var22 = 8
      endif
      var22 += 30
      var23 = var22 - 20
      if XDistLE var22 && !(XDistLE var23) && CHANCE_MUL_LE PT_AGGRESSION 0.45 && Equal var3 0
        if CHANCE_MUL_LE PT_BRAVECHANCE 0.4
          if CHANCE_MUL_LE PT_WALL_CHANCE 0.75
            var21 = 16.3
          else  
            var21 = 10.1
          endif
          XGoto CalcAttackGoal
          XReciever
          
          if !(Equal var20 -1)
            var15 = -2
            CallI MainHub
          endif
        endif
      endif
    endif

    var1 = 1
    predictAverage var23 10 LevelValue
    if var23 < 8
      var23 = 8
    endif
    var23 += 45
    var23 *= OPos
    
    Norm var22 TopNX TopNY
    Norm var17 OTopNX OTopNY
    Abs var22
    Abs var17

    GetYDistFloorOffset var23 var23 5 1
    if Equal var23 -1 || Equal var3 1 || var22 < var17
      var1 = 0
      predictAverage var23 10 LevelValue
      var13 -= var23
    endif

    Goto getDist
    if var22 >= 120 && !(Equal var1 0)
      var1 = 1
    elif CHANCE_MUL_LE PT_BAITCHANCE 0.3
      var1 = -1
    endif 

    predictAverage var17 10 LevelValue
    if var17 < 5
      var17 = 5
    endif
    var22 = 10 * Rnd
    var17 += var22
    if !(Equal var1 1)
      var17 = var17 + 15 * Rnd + 10
    elif True
      if CHANCE_MUL_LE PT_BRAVECHANCE 1 && CHANCE_MUL_LE PT_BRAVECHANCE 0.75
      else
        var17 = var17 + 15 * Rnd + 10
      endif
    endif
    var22 = var17

    GetAttribute var23 40; 0
    var23 *= 2
    var17 -= var23
    GetAttribute var23 40; 1
    var23 *= 4
    var17 += var23
    if ODistLE var17 && Equal AirGroundState 1 && Equal var21 10.5
      if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.75 || CHANCE_MUL_LE PT_BAIT_WDASHAWAYCHANCE 0.75
        var15 = -1
        if CHANCE_MUL_LE PT_BAIT_WDASHAWAYCHANCE 0.45
          var16 = 2
          Call Wavedash
        endif
        var16 = 2
        Call DashScr
      endif
    endif

    predictAverage var22 10 LevelValue
    var22 += 20
    if CHANCE_MUL_LE PT_AGGRESSION 0.55 && Equal AirGroundState 1 && !(ODistLE var22)
      if CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 0.75 && !(XDistLE var22)
        var21 = 7.1
        XGoto CalcAttackGoal
        XReciever
        var21 = 10.5
        if !(Equal var20 -1)
          var15 = -2
          CallI MainHub
        endif
      endif
    endif
    var22 -= 20

    if Equal var21 10.5
      Return
    endif

    if CHANCE_MUL_LE PT_BAITCHANCE 0.45 || XDistLE var22
      var21 = 16.3
      if XDistLE var22 && CHANCE_MUL_LE PT_AGGRESSION 0.35
        var21 = 16.4
      endif
      XGoto CalcAttackGoal
      XReciever
      Return
    endif

    var22 += 13
    if ODistLE var22
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
        var16 = 3
        Call DashScr
      endif
    endif
    var22 -= 13

    if XDistLE var22 && !(Equal var1 -1)
      // LOGSTR 1027423488 1229856768 826096896 1023410176 0

      DynamicDiceClear 0
      if Equal AirGroundState 1

        predictAverage var23 10 LevelValue
        var23 += 10
        var23 *= OPos
        GetYDistFloorOffset var23 var23 5 0

        DynamicDiceAdd 0 1 0.75
        DynamicDiceAdd 0 2 0.35
        DynamicDiceAdd 0 3 0.75
        DynamicDiceAdd 0 4 0.25
        var22 = PT_BAITCHANCE * 2
        Abs var22
        DynamicDiceAdd 0 7 var22
        if Equal var23 -1
        elif Equal var1 1 && CHANCE_MUL_LE PT_AGGRESSION 0.7
          DynamicDiceAdd 0 6 4
          if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.35 || CHANCE_MUL_LE PT_BRAVECHANCE 0.55
            if ODistLE 15
              var16 = 1
              var16 += 0.1
            else
              var16 = 3
            endif
            if CHANCE_MUL_LE PT_AGGRESSION 0.9
              var21 = 16
              var15 = -1
            endif
            Call JumpScr
          endif
        endif
        GetYDistFloorOffset var22 0 40 0
        GetColDistPosRel var17 var23 TopNX SCDBottom 0 40 1
        if Equal var17 -1 && !(Equal var22 -1) && var22 < 40
          DynamicDiceAdd 0 5 1 
        endif
        DynamicDiceRoll 0 var22 0
        if CHANCE_MUL_GE PT_AGGRESSION 0.15
          var21 = 10.4
        endif
        if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.4
          var16 = 2
          Call DashScr
        elif CHANCE_MUL_LE PT_BAIT_WDASHAWAYCHANCE 0.4
          var16 = 2
          Call Wavedash
        endif
        if Equal var22 1
          var16 = 2
          if CHANCE_MUL_LE PT_AGGRESSION 0.45
            var16 = 1
          endif
          Call DashScr
        elif Equal var22 6
          var16 = 5
          Call DashScr
        elif Equal var22 2
          var16 = 2
          if CHANCE_MUL_GE PT_AGGRESSION 0.55
            var16 = 3
          endif
          Goto getDist
          if CHANCE_MUL_LE PT_AGGRESSION 0.35 && var22 <= 30
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
        if var17 > -40 && CHANCE_MUL_LE PT_PLATCHANCE 1
          Call BoardPlatform
        endif
      elif NumJumps > 0 && CHANCE_MUL_LE PT_DJUMPINESS 1 && CHANCE_MUL_LE PT_DJUMPINESS 1 && YDistFloor < 20
        
        var16 = 2
        if CHANCE_MUL_LE PT_AGGRESSION 0.6 && XDistLE 25
          var16 = 1
        elif Rnd < 0.5
          var16 = 3
        endif
        var16 += 0.1
        Call JumpScr
      endif
    elif ODistLE var17 && CHANCE_MUL_LE PT_JUMPINESS 1 && Equal OAirGroundState 1 && Equal var1 1
      // LOGSTR 1027423488 1229856768 842874112 1023410176 0
      if CHANCE_MUL_LE PT_JUMPINESS 1 && XDistLE 25
        var16 = 1
        var16 += 0.1
      else
        var16 = 2
      endif
      if CHANCE_MUL_LE PT_AGGRESSION 0.65 && var22 <= 30
        var21 = 16
        var15 = -1
      endif
      Call JumpScr
    elif True
      // LOGSTR 1027423488 1229856768 859651328 1023410176 0
      // Goto OPosGoal
      // if Equal var1 1
      // elif True
      //   predictAverage var22 10 LevelValue
      //   var22 += 15
      //   var13 = var13 + var22 * OPos * -1 
      // endif
    endif

    // Goto EndlagCheck
  endif
elif var21 >= 16 && var21 < 17
  if CalledFrom ExecuteAttack
    XGoto SetAttackGoal
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
    SetDebugOverlayColor 255 0 0 136
  else
    SetDebugOverlayColor 0 255 255 136

    if OYDistBackEdge > -20 && !(Equal OAirGroundState 3) && OXDistBackEdge > 40
      SetDebugOverlayColor 0 255 255 255
      var21 = 16.8
    else
      var21 = 16.7
    endif
  endif
  EnableDebugOverlay

  if Equal OAirGroundState 3
    var21 = 16.7
  endif

  if var21 < 16.7
    Norm var22 OYDistBackEdge OYDistBackEdge
    if OCurrAction >= 66 && OCurrAction <= 89 || OCurrAction >= 272
    elif var22 <= 50 && OYDistBackEdge > -5 && Equal OYDistFloor -1 && XDistFrontEdge < 20 
      if CHANCE_MUL_LE PT_BAITCHANCE 0.8
        var21 = 10.5
      elif CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 0.75
        var21 = 7
        if CHANCE_MUL_LE PT_AGGRESSION 0.25
          var21 = 7.1
        endif
      else
        var21 = 10.4
      endif
      Return
    endif
  endif

  if Equal var20 -1
    Goto changeGoal
    Return
  endif

if !(True) || Equal var20 22 || Equal var20 23 || Equal var20 24 || Equal var20 25 || Equal var20 26
    if CHANCE_MUL_LE PT_AGGRESSION 0.65
      if Equal var21 16.3
        Goto changeGoal
        Return
      elif Equal OCurrAction 74 || Equal OCurrAction 77 || Equal OCurrAction 83 || Equal OCurrAction 84
        Goto changeGoal
        Return
      elif OCurrAction >= 68 && OCurrAction <= 73 || Equal OCurrAction 66
        if OYDistBackEdge > -8 && OYSpeed < 0
          Goto changeGoal
          Return
        endif
      endif 
    endif
  endif
  EstOYCoord var22 20
  var22 -= TopNY - YDistFloor
if !(True) || Equal var20 27|| Equal var20 28|| Equal var20 29|| Equal var20 30|| Equal var20 31|| Equal var20 32|| Equal var20 33|| Equal var20 34|| Equal var20 35|| Equal var20 36|| Equal var20 37
  elif YDistFloor > 25
    Goto forceChangeGoal
    Return
  endif

  predictAverage var22 10 LevelValue
  var22 += 10
  if Equal var21 16.6 && XDistLE var22
    var16 = 1
    var16 += 0.1
    var15 = -1
    var21 = 16.4
    CallI JumpScr 
  endif

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
  //     endif
  //   endif
  // endif


  var1 = 1
  predictAverage var23 10 LevelValue
  var23 += 10
  var23 *= OPos
  GetYDistFloorOffset var23 var23 5 1
  if Equal var23 -1 && var21 < 16.4
    var1 = 0
    if !(Equal var21 16.3) && !(Equal var21 16.2)
      if CHANCE_MUL_LE PT_WALL_CHANCE 0.75 || CHANCE_MUL_LE PT_BAITCHANCE 1
        if CHANCE_MUL_LE PT_BAITCHANCE 1
          var21 = 10
        else
          var21 = 16.3
        endif
        var20 = -1
        Return
      elif CHANCE_MUL_LE PT_BAITCHANCE 0.75 || CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 0.6
        var21 = 10.5
        var20 = -1
        Return
      endif
    endif
  endif

  // LOGSTR 1027424512 1414807808 1129003520 0 0
  // $printMoveName()
  
  // combos
  var2 = (1 - (LevelValue / 100)) * 25 + 1
  var17 = OAnimFrame - 3
  // standard
  var22 = 200
  XGoto GetChrSpecific
  XReciever
  if Equal var22 1
  else
    var2 = (1 - (LevelValue / 100)) * 30 + 2
    var17 = OAnimFrame - 8
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
  var23 = 0 * PT_REACTION_TIME
  if OAnimFrame <= var23 && var22 < 5
    var2 = 2
  endif

  var22 = 200
  XGoto GetChrSpecific
  XReciever
  var17 = OTopNY - TopNY
  if Equal var22 1
    if var17 > 30 || OYDistBackEdge < -35 && Equal AirGroundState 1
    elif !(Equal var21 16.4) && OYDistFloor < 45
    elif var21 >= 16.7
    elif True
      if var2 <= 1
        predictOOption var22 11 LevelValue 
        predictionConfidence var23 11 LevelValue
        if Equal var22 1 && CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.6
          var21 = 10.5
          Return
        elif Equal var22 2 && CHANCE_MUL_GE PT_BRAVECHANCE 0.35
          var21 = 10
          Return
        elif Equal var22 3 && Rnd < var23
          var21 = 7
          Return
        endif
      endif
      if var2 <= 1 && Equal var1 0 && Equal AirGroundState 1 && CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.5
        var21 = 10.5
        Return
      endif
      var22 += 30
      if !(ODistLE var22) && CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 1 && CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 1 && OFramesHitstun <= 0
        var21 = 7
        Return
      endif
    endif
  endif

  predictAverage var22 10 LevelValue
  var22 += 20
  if Equal OCurrAction 73 && var21 < 16.7
    if ODistLE var22 && !(Equal OAirGroundState 1) 
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

  var16 = 0
  if OCurrAction <= 33 && !(Equal CurrAction 10) && Equal OFramesHitstun 0
    if var2 <= 1
      // var23 = OPos * -15
      // GetYDistFloorOffset var23 var23 5 0
      // if Equal var23 -1 && CHANCE_MUL_GE PT_AGGRESSION 0.4
      //   var21 = 10.5
      //   Return
      // endif

      // if XSpeed < -0.6 || XSpeed > 0.6
        // var16 = 3
        XGoto SetAttackGoal
        XReciever
      // endif
    endif

    var16 = 1
    if OCurrAction >= 11 && OCurrAction <= 13 && OAnimFrame < 20
    else
      // var16 = 3
      XGoto SetAttackGoal
      XReciever
    endif
  // otherwise carry on as normal
  elif var2 <= 1 || Equal CurrAction 10 || Equal OCurrAction 73 || OFramesHitstun > 1 || Equal HitboxConnected 1
    if OAnimFrame <= 9 || Equal CurrAction 10 || Equal OCurrAction 73 || OFramesHitstun > 1 || Equal HitboxConnected 1
      var23 = OPos * -15
      GetYDistFloorOffset var23 var23 0 0
      if Equal OCurrAction 73 || OFramesHitstun > 1 || Equal HitboxConnected 1
      elif Equal var23 -1 && CHANCE_MUL_GE PT_AGGRESSION 0.55 && CHANCE_MUL_GE PT_AGGRESSION 0.45 && var21 < 16.7
        var21 = 10.5
        Return
      endif

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
        
        if OCurrAction >= 11 && OCurrAction <= 13 && OAnimFrame < 20
          var16 = 2
        endif
        
        // var16 = 3
        XGoto SetAttackGoal
        XReciever
      endif
    endif
  endif
  if var21 >= 16.7
    var16 = 0
    XGoto SetAttackGoal
    XReciever
  endif

  // Goto getDist
  // if var22 > 35 && var2 <= 1 && ODistLE 35 && !(Equal var21 16.7)
  //   Goto changeGoal
  //   Return
  // endif

  var16 = 0
  XGoto CheckAttackWillHit
  XReciever
else
  Goto getDist
  if var22 <= 8
    Goto forceChangeGoal
    Return
  endif
endif
Return
label EndlagCheck
  var22 = 0.003
  XGoto GetChrSpecific
  XReciever
var0 = var22
// LOGSTR 1327514880 1852075008 1634140160 0 0
// LOGVAL var0
// PRINTLN
if Equal var21 16.4 || Equal var21 10.2
elif var0 >= 5 && CHANCE_MUL_LE PT_AGGRESSION 1.5
  predictionConfidence var17 9 LevelValue
  var17 *= 0.2
  var17 = var17 + Damage * 0.003 - ODamage * 0.001
  predictOOption var23 9 LevelValue
  if OCurrAction >= 74 && OCurrAction <= 101
  elif Rnd < var17 && Equal var23 2 && Equal AirGroundState 1
    var21 = 10.2
    if CHANCE_MUL_LE PT_AGGRESSION 0.7
      var21 = 10.6
    elif CHANCE_MUL_GE PT_AGGRESSION 0.6
      var21 = 10.4
    elif CHANCE_MUL_GE PT_AGGRESSION 0.3
      var21 = 10.5
    endif
    if XDistLE var0
      var21 = 16.4
    endif
    Return
  endif
  predictAverage var22 10 LevelValue
  var23 = var0 * 1.2
  var22 += var23 + 10
  if ODistLE var22 || OCurrAction >= 74 && OCurrAction <= 101
    if OCurrAction >= 26 && OCurrAction <= 29
      var21 = 16.4
    //   if CHANCE_MUL_LE PT_JUMPINESS 1 && OTopNX > -40 && OTopNX < 40
    //     var21 = 16.6
    //   endif
    // elif CHANCE_MUL_LE PT_JUMPINESS 1.45 && OTopNX > -40 && OTopNX < 40
    //   var21 = 16.6
    elif var21 >= 16 && var21 < 17
    elif OAnimFrame > 8
      var21 = 16.4
    endif
  endif
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
//   var14 += 11.77 
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
MOD var22 AnimFrame 4
if Equal var22 0
  XGoto GoalChoiceHub
  XReciever
endif
Return
label forceChangeGoal
XGoto GoalChoiceHub
XReciever
Return
Return
