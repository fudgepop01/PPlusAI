#include <Definition_AIMain.h>
id 0x850F
unk 0x0

//= XReciever
NoRepeat
// var21 = 16.4
// $setLastAttack(usmash)
var16 = 0
if var21 >= 16 && var21 < 17
  if CalledFrom ExecuteAttack
    XGoto SetAttackGoal
    //= XReciever
    Return
  endif
  
  if Equal var21 16.41 && Rnd < 0.05
    XGoto DefendHub
    //= XReciever
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
    if Equal CanCancelAttack 1 && Equal AirGroundState 1
      var21 = 16
    endif
  else
    SetDebugOverlayColor 0 255 255 136

    if Rnd < 0.02 && !(Equal OAirGroundState 3) && OYDistBackEdge > 0 && YDistFloor > 0
      if CHANCE_MUL_LE PT_BAITCHANCE 0.15 || CHANCE_MUL_LE PT_AGGRESSION 0.1
        var21 = 16.72
        Return
      endif
    endif
    // if Equal OAirGroundState 1 
    //   var21 = 16.4
    // endif
  endif
  EnableDebugOverlay

  MOD var22 AnimFrame 4
  if Equal var20 -1 && var22 >= 3
    Goto OPosGoal
    Goto changeGoal
    Return
  else 
    MOD var22 AnimFrame 20
    if var22 >= 19
      Goto OPosGoal
      Goto changeGoal
      Return
    endif
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
  //   predictAverage var22 10
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

  // predictAverage var22 10
  // var22 += 10
  // if Equal var21 16.6 && XDistLE var22
  //   var16 = 1
  //   var16 += 0.1
  //   var15 = -10
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

  // LOGSTR 1027424512 1414807808 1129003520 0 0
  // $printMoveName()
  
  // combos
  var2 = (1 - (LevelValue / 100)) * 25 + 2
  var17 = OAnimFrame
  // standard
  var22 = 200
  XGoto GetChrSpecific
  //= XReciever
  if Equal var22 0
    var2 = (1 - (LevelValue / 100)) * 30 + 15
    var17 = OAnimFrame
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

  MOD var2 var17 var2

  Goto getODist
  var23 = 2 * PT_REACTION_TIME
  if OAnimFrame <= var23 && var22 < 5
    var2 = 2
  endif

  // if var2 <= 1
  //   DrawDebugRectOutline 0 10 var2 2 255 255 255 238
  // else
  //   DrawDebugRectOutline 0 10 var2 2 255 0 0 238
  // endif

  // GET_CHAR_TRAIT(var22, 200)
  // var17 = OTopNY - TopNY
  // if Equal var22 0
  //   if var17 > 30 || OYDistBackEdge < -35 && Equal AirGroundState 1
  //   elif !(Equal var21 16.4) && OYDistFloor < 45
  //   elif var21 >= 16.7
  //   elif True
  //     if var2 <= 1 && Equal AirGroundState 1
  //       predictOOption var22 man_OXAttackDist 
  //       predictionConfidence var23 man_OXAttackDist
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

  predictAverage var22 10
  var22 += 10
  if Equal OCurrAction 73 && var21 < 16.7
    if XDistLE var22 && !(Equal OAirGroundState 1) 
      predictOOption var22 15
      predictionConfidence var17 15
      if Equal var22 2 && Rnd < var17
        Call Shield
      endif
    endif
  endif

  // if Equal var23 var17 && var22 > 55
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

  // LOGSTR 1397247744 1431061504 542461952 1145132032 1161756672
  // LOGVAL var2
  // LOGVAL OCurrAction
  // PRINTLN

  if var21 >= 16.7
    var16 = 0
    XGoto SetAttackGoal
    //= XReciever
  elif OCurrAction <= 33 && !(Equal CurrAction 10) && Equal OFramesHitstun 0
    if var2 <= 1
      XGoto SetAttackGoal
      //= XReciever
    endif

  // otherwise carry on as normal
  elif var2 <= 1 || Equal CurrAction 10 || Equal OCurrAction 73 || OFramesHitstun > 1 || Equal HitboxConnected 1
    
    if OAnimFrame <= 9 || Equal CurrAction 10 || Equal OCurrAction 73 || OFramesHitstun > 1 || Equal HitboxConnected 1
      if var22 > var23 || OAnimFrame > 10
  var22 = 200
  XGoto GetChrSpecific
  //= XReciever
        if Equal var22 1
        elif var21 >= 16.7
        elif !(SamePlane) && CHANCE_MUL_LE PT_BAITCHANCE 0.15 && Rnd < 0.2 && OFramesHitstun <= 0
          Return
        endif

        // var16 = 3
        XGoto SetAttackGoal
        //= XReciever
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
  if var20 > -1
    XGoto CheckAttackWillHit
  endif
else
  var21 = 16
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
// MOD var22 AnimFrame 8
// if Equal var22 0
  XGoto CalcAttackGoal
  //= XReciever
// endif
Return
Return
