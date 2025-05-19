#include <Definition_AIMain.h>
id 0x850F
unk 0x0

//= XReciever
NoRepeat

// $setLastAttack(ftilt)

// if Equal currGoal cg_edgeguard
//   if OYDistBackEdge > 0
//     $setLastAttack(dspecialair)
//   else
//     $setLastAttack(bair)
//   endif
// else
//   currGoal = cg_attack_reversal
//   if OYDistFloor > 35 || YDistFloor > 20
//     $setLastAttack(uair)
//   else
//     $setLastAttack(usmash)
//   endif
// endif

// $setLastAttack(uair_outer)

var16 = 0
if HasCurry
  ADJUST_PERSONALITY 0 0.2 Rnd
endif
// predictAverage immediateTempVar man_OXHitDist
// LOGSTR str("oxhitdist")
// LOGVAL immediateTempVar
// PRINTLN

// currGoal = cg_attack_wall
// $setLastAttack(ftilt)

// if currGoal >= cg_attack && currGoal < calc(cg_attack + 1)
// else 
//   predictOOption immediateTempVar man_OXHitDist
//   immediateTempVar *= 0.25
//   GetCommitPredictChance anotherTempVar
//   if XDistLE immediateTempVar
//     if anotherTempVar < 0.1
//       currGoal = cg_attack
//       XGoto CalcAttackGoal
//       //= XReciever
//     elif OAnimFrame > 45 && OCurrAction <= hex(0x1) && anotherTempVar < 0.3
//       currGoal = cg_attack
//       XGoto CalcAttackGoal
//       //= XReciever
//     endif
//   endif
// endif

// if currGoal < cg_bait || currGoal > cg_bait_dashawayWhenApproached
//   currGoal = cg_bait
// endif

LOGSTR 1667718912 1986096128 1969553408 0 0
LOGVAL var21
PRINTLN

// if Equal goalY BBoundary
//   if currGoal >= cg_attack && currGoal < calc(cg_attack + 1)
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
  var21 = 7
// elif currGoal < cg_bait
//   currGoal = cg_attack
endif
// currGoal = cg_circleCamp



if var21 >= 7 && var21 < 8
  var20 = -1
  if LevelValue <= 42
    Call MainHub
  endif
  ADJUST_PERSONALITY 5 -0.002 1
  Goto shuffleBaitCamp
  if Equal var21 10
    Return
  endif

  SetDebugOverlayColor 0 0 255 136
  EnableDebugOverlay
  var22 = 21
  XGoto GetChrSpecific
  //= XReciever
var17 = var22
  var17 *= -1
  var17 += 1

  var22 = (1 - (LevelValue / 100)) * 60 + 15 * var17
  var22 *= PT_REACTION_TIME
  MOD var22 GameTimer var22
  if var22 <= 1
    var17 = OTopNY - TopNY
    if var17 > 45 || OYDistBackEdge < -20 && Equal AirGroundState 1
      GetCommitPredictChance var22
      if CHANCE_MUL_LE PT_AGGRESSION 0.2 && XDistLE 40 && var22 < 0.125
        var21 = 16
        Return
      endif
    endif

    predictOOption var22 10 
    var22 += 5
    if CHANCE_MUL_LE PT_AGGRESSION 0.25
      if XDistLE var22 
        var21 = 10
        Return
      endif
      var16 = 2
      XGoto CalcAttackGoal
      //= XReciever
      var16 = 0
      
      if !(Equal var20 -1) && !(XDistLE 20) && LevelValue >= 48
        var15 = -20
        var16 = 3
        CallI Wavedash
      elif XDistLE 5
        var21 = 16.3
        var20 = -1
        Return
      elif CHANCE_MUL_LE PT_AGGRESSION 0.15
        Goto forceChangeGoal
      endif
      var20 = -1
    endif
  endif
  
  
  // if Equal immediateTempVar 1 && Rnd < 0.15
  //   currGoal = cg_bait
  //   Return
  // endif

  predictAverage var17 10
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
    if CHANCE_MUL_LE PT_AGGRESSION 0.1
      var21 = 10
      Return
    elif XDistLE var17 || Rnd <= 0.04
      Goto forceChangeGoal
      Return
    endif
  var22 = 21
  XGoto GetChrSpecific
  //= XReciever
var17 = var22
    var17 *= -1
    var17 += 1

    var22 = (1 - (LevelValue / 100)) * 30 + 40 * var17
    var22 *= PT_REACTION_TIME
    MOD var22 GameTimer var22
    if var22 <= 1
      if Equal AirGroundState 1 && CHANCE_MUL_LE PT_JUMPINESS 1
        var14 += 9.25 
        if CHANCE_MUL_LE PT_JUMPINESS 1 && CHANCE_MUL_LE PT_JUMPINESS 1
          var14 += 5
        endif
      elif Equal AirGroundState 2 && YDistBackEdge < -5
        if CHANCE_MUL_LE PT_DJUMPINESS 1 && CHANCE_MUL_LE PT_DJUMPINESS 1 && NumJumps > 0
          var14 += 35.4
        else
          var14 += 1
          GetYDistFloorAbsPos var22 var13 var14
          var14 -= var22
        endif
      endif
    endif
  endif
elif var21 >= 10 && var21 < 11
  ADJUST_PERSONALITY 3 -0.001 1
  if LevelValue <= 21
    var21 = 16
    Return
  endif
  Goto shuffleBaitCamp
  MOD var22 GameTimer 8
  if Equal var21 10.1
    if !(Equal var20 -1)
      var15 = -20
      CallI MainHub
    elif var22 <= 1
      XGoto CalcAttackGoal
      if !(Equal var20 -1)
        var15 = -20
        CallI MainHub
      endif
    endif
  endif

  var20 = -1
  var22 = 200
  XGoto GetChrSpecific
  //= XReciever
  if Equal var22 1
    var21 = 16.4
    Return
  endif

  predictAverage var22 10
  if var22 < 8
    var22 = 8
  endif
  DrawDebugRectOutline var13 var14 var22 var22 255 255 0 136
  var22 += 25
  DrawDebugRectOutline var13 var14 var22 var22 255 255 0 68
  
  predictAverage var22 11
  DrawDebugRectOutline var13 var14 var22 var22 255 0 0 136
  var22 += 25
  DrawDebugRectOutline var13 var14 var22 var22 255 0 0 68

  // if Equal currGoal cg_bait_attack && XDistLE immediateTempVar
  //   currGoal = cg_attack_wall
  //   Return
  // endif

  var23 = OPos * -30
  GetYDistFloorOffset var23 var23 10 0

  SetDebugOverlayColor 255 0 255 136
  if Equal var21 10.5
    SetDebugOverlayColor 255 0 255 255
  endif
  EnableDebugOverlay

  var22 = 21
  XGoto GetChrSpecific
  //= XReciever
var17 = var22
  var17 *= -1
  var17 += 1

  var22 = (1 - (LevelValue / 100)) * 40 + 14 * var17
  var22 *= PT_REACTION_TIME
  MOD var22 GameTimer var22
  var17 *= 18
  // $LV9Check(immediateTempVar = 1)
  if var22 <= 1 && OAnimFrame > var17
    Goto OPosGoal

    var17 = OTopNY - TopNY
    if var17 > 45 || OYDistBackEdge < -20 && Equal AirGroundState 1 && CHANCE_MUL_LE PT_AGGRESSION 1.25
      var21 = 16
      Return
    endif
    
    // GetAttribute anotherTempVar attr_dashInitVel 0
    // immediateTempVar = 2 - anotherTempVar
    // immediateTempVar *= 0.25 * PT_CIRCLECAMPCHANCE
    // if CHANCE_MUL_LE PT_AGGRESSION immediateTempVar
    //   if YDistFloor > -1 && YDistFloor < 25
    //     scriptVariant = sv_campAttack
    //     XGoto CalcAttackGoal
    //     //= XReciever
    //     if !(Equal lastAttack -1)
    //       skipMainInit = sm_execAttack
    //       CallI MainHub
    //     endif
    //     scriptVariant = sv_none
    //   endif
    // endif
    // Norm immediateTempVar OTopNX OTopNY
    // Abs immediateTempVar
    // if CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 0.005 && immediateTempVar < 35
    //   currGoal = cg_circleCamp
    //   Return
    // endif

    if Equal var21 10.4
      Return
    elif Equal var21 10.5
      if CHANCE_MUL_LE PT_BAITCHANCE 0.25 || CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.5 || CHANCE_MUL_LE PT_BAIT_WDASHAWAYCHANCE 0.5
        // Return
      elif CHANCE_MUL_LE PT_AGGRESSION 0.025
        // LOGSTR_NL str("FORCE AGGRO")
        var21 = 10.1
        XGoto CalcAttackGoal
      endif
    elif !(Equal var21 10.1) && !(HasCurry)
      if Equal CurrAction 3 || Equal CurrAction 4
        GetCommitPredictChance var22
        predictAverage var23 10
        if var23 < Width
          var23 = Width
        endif
        var23 += 1
        if var22 > 0.13 && !(XDistLE var23) && CHANCE_MUL_LE PT_BAITCHANCE 0.02 && LevelValue >= 60
          var15 = -10
          var21 = 10.4
          if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.1
            var21 = 10.5
          endif
          var16 = 3
          CallI Wavedash
          Return
        endif
      endif
    endif

    predictAverage var22 10
    predictAverage var23 11
    // if CHANCE_MUL_LE PT_AGGRESSION 0.4 && YDistFloor > -1 && YDistFloor < 15 && !(XDistLE immediateTempVar) && XDistLE anotherTempVar
      
    // endif

    if CHANCE_MUL_LE PT_AGGRESSION 0.05 && CHANCE_MUL_LE PT_BAITCHANCE 0.05
      var21 = 10.1
    elif CHANCE_MUL_LE PT_WALL_CHANCE 0.15
      var21 = 16.3
    endif

    // if !(Equal currGoal cg_bait_shield) && CHANCE_MUL_LE PT_BAITCHANCE 1 && Equal teamCloser 0
    //   predictAverage immediateTempVar man_OXHitDist
    //   if immediateTempVar < 8
    //     immediateTempVar = 8
    //   endif
    //   immediateTempVar += 100
    //   anotherTempVar = immediateTempVar - 70
    //   if XDistLE immediateTempVar && !(XDistLE anotherTempVar) && CHANCE_MUL_LE PT_AGGRESSION 0.3
    //     if CHANCE_MUL_LE PT_BRAVECHANCE 0.4
    //       if CHANCE_MUL_LE PT_WALL_CHANCE 0.35
    //         currGoal = cg_attack_wall
    //       else  
    //         currGoal = cg_bait_attack
    //       endif
    //       XGoto CalcAttackGoal
    //       //= XReciever
          
    //       if !(Equal lastAttack -1)
    //         skipMainInit = sm_execAttack
    //         CallI MainHub
    //       endif
    //     endif
    //   elif XDistLE anotherTempVar && CHANCE_MUL_LE PT_AGGRESSION 0.7
    //     GetCommitPredictChance immediateTempVar
    //     if CHANCE_MUL_LE PT_BRAVECHANCE 0.75 && immediateTempVar < 0.35
    //       if CHANCE_MUL_LE PT_WALL_CHANCE 0.85
    //         currGoal = cg_attack_wall
    //       else  
    //         currGoal = cg_bait_attack
    //       endif
    //       XGoto CalcAttackGoal
    //       //= XReciever
          
    //       if !(Equal lastAttack -1)
    //         skipMainInit = sm_execAttack
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
  predictAverage var23 10
  if var23 < Width
    var23 = Width
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
    predictAverage var23 10
  endif

  Goto getDist
  GetCommitPredictChance var23
  if var22 >= 55 || var23 < 0.12 || CHANCE_MUL_LE PT_BAITCHANCE 0.1 || var23 > 0.18
    var1 = 1
  endif 

  predictAverage var23 11
  predictAverage var17 10
  if var17 < Width
    var17 = Width + OWidth
  endif
  if var23 < var17
    var23 = var17
  endif
  var22 = 15 * Rnd
  if !(Equal var1 1)
    var17 += var22
  elif CHANCE_MUL_LE PT_BRAVECHANCE 1.25
  else
    var17 += var22
  endif

  var22 = var17
  if XDistLE var23 && Equal AirGroundState 1 && Equal var21 10.5
    label dashdance_exec
    if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.25
      var15 = -10
    endif
    if XDistBackEdge > -15 || XDistFrontEdge < 15
    elif CHANCE_MUL_LE PT_BAIT_WDASHAWAYCHANCE 0.2 && LevelValue >= 60
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
      //= XReciever
      Seek wdback
      if Equal AirGroundState 2
        var22 = OPos * -1
        AbsStick var22 (-1)
        Button R
      elif CurrAction <= 3
        Seek exec_dash
        Jump
      elif !(Equal CurrSubaction JumpSquat) && NoJumpPrevFrame
        Button X
      endif
      Return
    endif
    label exec_dash
    var16 = 6
    CallI DashScr
    // endif
  endif

  if Equal var21 10.5 && XDistLE var23
    if YDistFloor > 1
      var16 = 2
      var15 = -10
      CallI AerialDrift
    endif
    // GetCommitPredictChance immediateTempVar
    // anotherTempVar = 1 - immediateTempVar
    // anotherTempVar *= 2
    // if CHANCE_MUL_GE PT_BAITCHANCE anotherTempVar
    //   currGoal = cg_attack
    // endif
    Return
  endif

  predictAverage var17 11
  var17 += 5
  if XDistLE var17
    if Equal var21 10.2 && Equal AirGroundState 1
      label startup
      Stick 1
      if {Equal CurrAction 3 && AnimFrame >= 5}
        JmpNextIfLabel
      elif {CurrAction <= 5 && !(Equal CurrAction 0)}
        IfLabel
        Seek slide
        Jump
      endif
      XGoto PerFrameChecks
      Seek startup
      Return
      label slide
      if Equal AirGroundState 2
        Call MainHub
      endif
      Stick 1
      Button R
      if -0.2 < XSpeed && XSpeed < 0.2
        CallI Shield
      endif
      XGoto PerFrameChecks
      Seek slide
      Return
    elif Equal var21 10.6 && Equal AirGroundState 1
      var16 = 3
      Call DashScr
    endif
  endif
  var23 += Width

  predictAverage var17 10
  if XDistLE var23 && !(Equal var1 -1) || XDistLE var17
    DynamicDiceClear 0
    if Equal AirGroundState 1

      predictAverage var23 11
      var23 += 10
      var23 *= OPos
      GetYDistFloorOffset var23 var23 5 1

      DynamicDiceAdd 0 1 PT_BAIT_DASHAWAYCHANCE
      DynamicDiceAdd 0 2 PT_JUMPINESS
      DynamicDiceAdd 0 3 PT_BAIT_WDASHAWAYCHANCE
      var22 = 4 - PT_AGGRESSION
      DynamicDiceAdd 0 4 var22
      var22 = PT_BAITCHANCE * 2.5
      Abs var22
      DynamicDiceAdd 0 7 var22
      var22 *= 1.5
      DynamicDiceAdd 0 8 var22
      

      if Equal var23 -1
      elif Equal var1 1 && CHANCE_MUL_LE PT_AGGRESSION 0.3
        GetCommitPredictChance var22
        GetAttribute var23 40 0
        if var22 < 0.1 && var23 > 1.5
          DynamicDiceAdd 0 6 1.25
        endif
      endif
      GetYDistFloorOffset var22 0 40 0
      GetColDistPosRel var17 var23 TopNX SCDBottom 0 40 1
      if Equal var17 -1 && !(Equal var22 -1) && var22 < 30
        DynamicDiceAdd 0 5 1 
      endif
      if CHANCE_MUL_GE PT_AGGRESSION 0.5
        var21 = 10.4
        if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.05
          var21 = 10.5
        endif
      endif
      if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.10 && LevelValue >= 31
        var16 = 6
        var21 = 16.3
        Call DashScr
      elif CHANCE_MUL_LE PT_BAIT_WDASHAWAYCHANCE 0.10 && LevelValue >= 60
        var16 = 2
        Call Wavedash
      endif
      DynamicDiceRoll 0 var22 0
      if Equal var22 1
        var16 = 6
        if CHANCE_MUL_LE PT_AGGRESSION 0.15 && LevelValue >= 42
          // scriptVariant = sv_dash_towards
          var21 = 16.3
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
        var16 += 0.1
        Goto getDist
        if CHANCE_MUL_LE PT_AGGRESSION 0.35 && var22 <= 35
          var21 = 16
          var15 = -10
        endif
        Call JumpScr
      elif Equal var22 3
        var16 = 2
        Call Wavedash
      elif Equal var22 4
        var21 = 10.2
      elif Equal var22 7
        var21 = 10.4
      elif Equal var22 8
        var21 = 10.5
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
      if var22 <= 30 && CHANCE_MUL_LE PT_AGGRESSION 0.35
        var21 = 16
        var15 = -10
      endif
      Call JumpScr
    endif
  elif XDistLE var17 && CHANCE_MUL_LE PT_JUMPINESS 0.2 && Equal OAirGroundState 1 && Equal var1 1
    // LOGSTR str("===IN 2===")
    if CHANCE_MUL_LE PT_JUMPINESS 1 && XDistLE 25
      var16 = 1
      var16 += 0.1
    else
      var16 = 2
    endif
    Goto getDist
    if CHANCE_MUL_LE PT_AGGRESSION 0.9 && var22 <= 40
      var21 = 16
      var15 = -10
    endif
    Call JumpScr
  elif Equal var1 -1 && CHANCE_MUL_GE PT_AGGRESSION 0.65
    if CHANCE_MUL_LE PT_WALL_CHANCE 0.25
      var20 = -1
      var21 = 16.3
      var15 = -10
    elif CHANCE_MUL_LE PT_AGGRESSION 0.15
      var20 = -1
      var21 = 10.1
      var15 = -10
    endif
    var16 = 4
    Call DashScr
  endif
elif var21 >= 16 && var21 < 17
  if CalledFrom ExecuteAttack
    XGoto SetAttackGoal
    //= XReciever
    Return
  endif
  
  var22 = 200
  XGoto GetChrSpecific
  //= XReciever
  if var21 < 16.4
    JmpNextIfLabel
  elif Equal OIsOnStage 1 && var21 >= 16.7
    IfLabel
    if var22 > 0
      var21 = 16.4
    endif
  endif

  if Equal var21 16.41 && Rnd < 0.05
    XGoto DefendHub
    //= XReciever
    Return
  endif

  // if OCurrAction >= hex(0x42) && OCurrAction <= hex(0x59) && !(Equal OCurrAction hex(0x49))
  // elif Equal OCurrAction hex(0x49) && OYDistFloor > 15
  // elif Equal HitboxConnected 1 || Equal PrevAction hex(0x3C)
  // elif Equal currGoal cg_edgeguard && Equal OIsOnStage 1
  //   currGoal = cg_attack
  // endif 

  if var21 >= 16.7 && Equal OIsOnStage 1 && OYDistFloor < 60
    var21 = 16
  endif

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
    if Equal CanCancelAttack 1 && Equal AirGroundState 1
      var21 = 16
    endif
  else
    SetDebugOverlayColor 0 255 255 136

    if {CHANCE_MUL_LE PT_BAITCHANCE 0.15 || CHANCE_MUL_LE PT_AGGRESSION 0.1} && Rnd < 0.02 && !(Equal OAirGroundState 3) && OYDistBackEdge > 0 && YDistFloor > 0 && DistToOEdge < 40 && OXDistBackEdge > 20}
      var21 = 16.72
      Return
    endif
    // if Equal OAirGroundState 1 
    //   currGoal = cg_attack_reversal
    // endif
  endif
  EnableDebugOverlay

  MOD var22 GameTimer 4
  if Equal var20 -1 && var22 >= 3
    Goto OPosGoal
    Goto changeGoal
    Return
  elif OFramesHitstun <= 0 && OFramesHitlag <= 0 && !(ODistLE 35) 
    MOD var22 GameTimer 60
    if var22 >= 59
      Goto OPosGoal
      Goto changeGoal
      Return
    endif
  endif

  // $ifLastOrigin(grab,false)
  //   if CHANCE_MUL_LE PT_AGGRESSION 0.65
  //     if Equal currGoal cg_attack_wall
  //       Goto changeGoal
  //       Return
  //     elif Equal OCurrAction hex(0x4A) || Equal OCurrAction hex(0x4D) || Equal OCurrAction hex(0x53) || Equal OCurrAction hex(0x54)
  //       Goto changeGoal
  //       Return
  //     elif OCurrAction >= hex(0x44) && OCurrAction <= hex(0x49) || Equal OCurrAction hex(0x42)
  //       if OYDistBackEdge > -12 && OYSpeed < 0
  //         Goto changeGoal
  //         Return
  //       endif
  //     endif 
  //   endif
  // endif

  // $ifLastOrigin(grab,false)
  // elif Equal currGoal cg_attack_wall
  //   predictAverage immediateTempVar man_OXHitDist
  //   if immediateTempVar < 8
  //     immediateTempVar = 8
  //   endif
  //   immediateTempVar += 60
  //   anotherTempVar = immediateTempVar - 70
  //   if XDistLE immediateTempVar && !(XDistLE anotherTempVar) && CHANCE_MUL_LE PT_AGGRESSION 0.05
  //     Call ExecuteAttack
  //   endif
  // endif

  EstOYCoord var22 20
  var22 -= TopNY - YDistFloor
  // $ifAerialAttack()
  //   if currGoal >= cg_edgeguard
  //     lastAttack = -1
  //     Return
  //   endif
  // endif

  // predictAverage immediateTempVar man_OXHitDist
  // immediateTempVar += 10
  // if Equal currGoal cg_attack_crossup && XDistLE immediateTempVar
  //   scriptVariant = sv_jump_over
  //   scriptVariant += svp_jump_fullhop
  //   skipMainInit = mainInitSkip
  //   currGoal = cg_attack_reversal
  //   CallI JumpScr 
  // endif

  // globTempVar = TopNX
  // immediateTempVar = OTopNX
  // Abs globTempVar
  // Abs immediateTempVar
  // if Equal currGoal cg_attack_wall
  //   $ifAerialAttack()
  //     if globTempVar < immediateTempVar
  //       Call ExecuteAttack
  //     elif Rnd < 0.2
  //       Call ExecuteAttack
  //     endif
  //   elif Equal AirGroundState 1
  //     if globTempVar < immediateTempVar
  //       Call ExecuteAttack
  //     elif Rnd < 0.2
  //       Call ExecuteAttack
  //   endif
  //     endif
  // endif

  predictAverage var23 10
  var23 *= 0.5
  if XDistLE var23 && Equal var21 16.3 && CHANCE_MUL_LE PT_AGGRESSION 0.2
    var21 = 16
    var20 = -1
    Return
  endif
  var23 *= 2
  var23 += 20
  if XDistLE var23 && var21 < 16.4 && !(Equal var21 16.3)
    GetCommitPredictChance var22
    var22 *= 0.075
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
        if YDistFloor < 15 && YDistFloor > 0
          var21 = 10.5
          Return
        endif
      endif
    endif
  endif

  // LOGSTR str("==ATTACK:")
  // $printMoveName()
  
  // combos
  var2 = (1 - (LevelValue / 100)) * 45 + 4
  // standard
  var22 = 200
  XGoto GetChrSpecific
  //= XReciever
  if Equal var22 0
    var2 = (1 - (LevelValue / 100)) * 60 + 10
  endif

  var22 = 21
  XGoto GetChrSpecific
  //= XReciever
var23 = var22
  var23 = (1 - var23)
  var23 *= 2
  if var23 < 0.25
    var23 = 0.25
  endif
  var2 *= var23
  var2 += 4

  var2 *= PT_REACTION_TIME

  MOD var2 GameTimer var2

  Goto getODist
  var23 = 2 * PT_REACTION_TIME
  if OAnimFrame <= var23 && var22 < 5
    var2 = 2
  endif

  // if shouldUpdate <= 1
  //   DrawDebugRectOutline 0 10 shouldUpdate 2 color(0xFFFFFFEE)
  // else
  //   DrawDebugRectOutline 0 10 shouldUpdate 2 color(0xFF0000EE)
  // endif

if Equal var20 22 || Equal var20 23 || Equal var20 24 || Equal var20 25 || Equal var20 26
  elif OCurrAction >= 26 && OCurrAction <= 29 && var2 < 1 && Rnd < 0.2
    var20 = -1
    Return      
  endif

  // GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
  // globTempVar = OTopNY - TopNY
  // if Equal immediateTempVar 0
  //   if globTempVar > 30 || OYDistBackEdge < -35 && Equal AirGroundState 1
  //   elif !(Equal currGoal cg_attack_reversal) && OYDistFloor < 45
  //   elif currGoal >= cg_edgeguard
  //   elif True
  //     if shouldUpdate <= 1 && Equal AirGroundState 1
  //       predictOOption immediateTempVar man_OXAttackDist 
  //       predictionConfidence anotherTempVar man_OXAttackDist
  //       if Equal immediateTempVar op_attack_close && CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.6
  //         currGoal = cg_bait_dashdance
  //         Return
  //       elif Equal immediateTempVar op_attack_mid && CHANCE_MUL_GE PT_BRAVECHANCE 0.35
  //         currGoal = cg_bait
  //         Return
  //       elif Equal immediateTempVar op_attack_far && Rnd < anotherTempVar
  //         currGoal = cg_circleCamp
  //         Return
  //       endif
  //     endif
  //     if shouldUpdate <= 1 && Equal shouldApproach 0 && Equal AirGroundState 1 && CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.5
  //       currGoal = cg_bait_dashdance
  //       Return
  //     endif
  //     immediateTempVar += 30
  //     if !(XDistLE immediateTempVar) && CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 1 && CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 1 && OFramesHitstun <= 0
  //       currGoal = cg_circleCamp
  //       Return
  //     endif
  //   endif
  // endif

  predictAverage var22 10
  var22 += 10
  if {Equal OCurrAction 73 && var21 < 16.7} && {XDistLE var22 && !(Equal OAirGroundState 1)}
    predictOOption var22 15
    predictionConfidence var17 15
    if Equal var22 2 && Rnd < var17
      Call Shield
    endif
  endif

  // if Equal anotherTempVar globTempVar && immediateTempVar > 55
  //   XGoto GoalChoiceHub
  //   //= XReciever
  //   Return
  // endif

  // prevents truly unreactable adjustements
  Goto getDist
  //= XReciever

  var23 = XSpeed
  Abs var23
  var23 = 8 + var23

  // LOGSTR str("SHOULD UPDATE?")
  // LOGVAL shouldUpdate
  // LOGVAL OCurrAction
  // PRINTLN

  if var21 >= 16.7
    var16 = 0
    XGoto SetAttackGoal
    //= XReciever
  elif OCurrAction <= 33 && !(Equal CurrAction 10) && Equal OFramesHitstun 0
    if var2 <= 1
      XGoto SetAttackGoal
    endif

    // predictAverage immediateTempVar man_OAvgEndlag
    // LOGSTR str("avg endl")
    // LOGVAL immediateTempVar
    // PRINTLN

    MOD var22 GameTimer 8
    if LevelValue >= 60 && OCurrAction <= 32 && var22 <= 1 && var21 < 16.5
      predictAverage var22 10
      var23 = Width + OWidth + 5
      var22 += var23
      if XDistLE var23 var22
        GetCommitPredictChance var22
        var23 = var22 * 1.5
        if var22 >= 0.13
          // LOGSTR str("aggro wait")
          // LOGVAL immediateTempVar
          // predictAverage immediateTempVar man_OAvgEndlag
          if CHANCE_MUL_GE PT_AGGRESSION var23 //|| var22 >= 15
            Goto aggressiveWait
          endif
        endif
      endif
    endif
  elif var2 <= 1 || Equal CurrAction 10 || Equal OCurrAction 73 || OFramesHitstun > 1 || Equal HitboxConnected 1    

    if var22 > var23
  var22 = 200
  XGoto GetChrSpecific
  //= XReciever
      if Equal var22 1 || var21 >= 16.7
      elif !(SamePlane) && CHANCE_MUL_LE PT_BAITCHANCE 0.15 && Rnd < 0.2 && OFramesHitstun <= 0
        var21 = 10
        Return
      endif
    endif

    if !(Equal var21 16.5) && !(XDistLE 15)
  var22 = 0.004
  XGoto GetChrSpecific
  //= XReciever
var17 = var22
      if Equal var17 -500
        if CHANCE_MUL_GE PT_AGGRESSION 0.5
          var21 = 10.2
        else
          Goto aggressiveWait
        endif
      endif
    endif
    // scriptVariant = sv_attackgoal_self
    XGoto SetAttackGoal
    //= XReciever
  endif

  // Goto getDist
  // if immediateTempVar > 35 && shouldUpdate <= 1 && XDistLE 35 && !(Equal currGoal cg_edgeguard)
  //   Goto changeGoal
  //   Return
  // endif

  if var16 < 10
    var16 = 0
  endif
  if var20 > -1
    XGoto CheckAttackWillHit
  endif
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
//   goalY += calc(cs_shortHopHeight - 3) 
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
label shuffleBaitCamp
  MOD var22 GameTimer 350
  if var22 >= 335
    ADJUST_PERSONALITY 5 -0.4 1
    ADJUST_PERSONALITY 5 -0.02 ODamage
    if Rnd < 0.25
      Call MainHub
    endif
    var21 = 10
    Return
  endif
Return
label changeGoal
  XGoto CalcAttackGoal
Return
label forceChangeGoal
  if CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 0.35
    XGoto CircleCampGoal
  elif Equal var21 7 && Rnd < 0.75
    XGoto CircleCampGoal
  else
    XGoto RandomizeGoal
  endif
Return
label aggressiveWait
  var23 = LevelValue + 2
  var22 = Rnd * var23
  if var20 >= 0 && LevelValue >= 42
    if CHANCE_MUL_LE PT_AGGRESSION 0.02
      var21 = 16.5
    elif CHANCE_MUL_LE PT_AGGRESSION 0.2
      var20 = -1
      var21 = 16.3
    endif
  endif
  if var22 > 10 && !(HasCurry)
    if YDistFloor > 5 && NumJumps > 0 && SamePlane
      Button X
    elif Equal AirGroundState 1
      var15 = -10
      Seek dashdance_exec
      Jump
    else
      var15 = -10
      var16 = 2
      Call JumpScr
    endif
  endif
Return
Return
