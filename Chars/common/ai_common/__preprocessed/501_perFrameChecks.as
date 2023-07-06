#include <Definition_AIMain.h>
id 0x8501
unk 0x0

//= XReciever
//--- keep this script from being called more than once per frame
NoRepeat
SetTimeout 999

// SetDebugMode 1
// LOGSTR 1836016640 1694498816 0 0 0
// LOGVAL var21
// PRINTLN
//--- visualize stuffs
if Equal PlayerNum 0
  DrawDebugRectOutline var13 var14 5 5 255 0 0 221
elif Equal PlayerNum 1
  DrawDebugRectOutline var13 var14 5 5 0 0 255 221
elif Equal PlayerNum 2
  DrawDebugRectOutline var13 var14 5 5 0 255 0 221
elif Equal PlayerNum 3
  DrawDebugRectOutline var13 var14 5 5 255 255 0 221
else
  DrawDebugRectOutline var13 var14 5 5 34 34 34 221
endif
// SetDebugMode 0
//--- prevent auto-attack
Cmd30
// keeps the AI from targeting itself because that can happen for some reason
// if Equal PlayerNum OPlayerNum && !(Equal YDistFloor -1)
//   SwitchTarget
// endif
//--- track target stuff 
// out of tumble action
if Equal OPrevAction 68 || Equal OPrevAction 69 || Equal OPrevAction 73
  if Equal OCurrAction 73 && Equal OAnimFrame 30
    trackOAction 15 3
  elif Equal OAnimFrame 0
    if Equal OCurrAction 12 || Equal OCurrAction 13
      trackOAction 15 1
    elif Equal OCurrAction 14 || Equal OCurrAction 15
      trackOAction 15 3
    elif OAttacking
      trackOAction 15 2
    endif
  endif
endif
// frame count after hitstun ends
if OCurrAction >= 65 && OCurrAction <= 100
  trackOAction 4 0
elif OFramesHitstun > 0
  trackOAction 4 0
else 
  getCurrentPredictValue var22 4
  if var22 < 250
    incrementPrediction 4
  endif
endif
// O OOS Option
if Equal OAnimFrame 0 && OFramesSinceShield < 20
  if Equal OCurrAction 33
    trackOAction 14 1
  elif OAttacking && !(Equal OCurrAction 52)
    trackOAction 14 2
  elif Equal OCurrAction 52
    trackOAction 14 3
  endif
elif OCurrAction >= 36 && OCurrAction <= 52 || OCurrAction >= 274 && Equal OAnimFrame 0
  RetrieveFullATKD var23 var23 var23 var17 var22 var23 var23 OCurrSubaction 1
  if var23 >= 0
    Abs var17
    Abs var22
    if var17 < var22
      var17 = var22
    endif
    GetAttribute var22 40; 1
    var22 *= 5
    var17 += var22
        
    trackOAction 10 var17
    // RetrieveFullATKD var23 var23 var23 var23 var23 var17 var22 OCurrSubaction 1
    // Goto getMax
    // trackOAction 11 var17    
  endif
endif
// O Tech Option
if Equal OAnimFrame 10
  if Equal OCurrAction 97 
    var17 = OPos * OXSpeed
    if var17 > 0
      trackOAction 13 1
    else
      trackOAction 13 3
    endif
  elif Equal OCurrAction 96
    trackOAction 13 2
  endif

  if Equal OPrevAction 77
    if Equal OCurrAction 82
      var17 = OPos * OXSpeed
      if var17 > 0
        trackOAction 12 1
      else
        trackOAction 12 3
      endif
    elif Equal OCurrAction 83
      trackOAction 12 2
    endif
  endif
endif
// O Bait/Defend Option
if var21 >= 7 && var21 < 11
  Goto baitDefendOption
elif Equal var21 13
  Goto baitDefendOption
elif Rnd < 0.2
  Goto baitDefendOption
endif
if !(True)
  label baitDefendOption
  var22 = (1 - (LevelValue / 100)) * 10 + 5
  MOD var22 AnimFrame var22
  if var22 < 1
    var17 = 9
    if Equal var21 13 || Equal var21 13.1
      var17 = 7
    endif
    predictAverage var22 10
    var22 += 20
    // var17 = var22 + 15
    if XDistLE var22
      if 4 <= OCurrAction && OCurrAction <= 5 && Rnd < 0.65 && !(Equal var17 7)
        trackOAction 9 1
        if OAnimFrame >= 4
          // the target is running in a direction as a result of a bait
          if Equal OPos ODirection 
            // the target is advancing, therefor overshoot
            trackOAction 8 2
          else
            // the target is running away, therefor undershoot
            trackOAction 8 3
          endif
        endif
      elif Rnd < 0.5 && OCurrAction <= 2 && !(Equal var17 7)
        // the target is roughly in-place, therefor neutral
        trackOAction 9 1
        trackOAction 8 1
      elif OAttacking && Rnd < 0.5 && Equal var17 7
        trackOAction var17 1
      elif OAttacking && Rnd < 0.5 && !(Equal var17 7)
        trackOAction 9 2
      elif 26 <= OCurrAction && OCurrAction <= 28 && Rnd < 0.6
        trackOAction var17 3
      endif
    endif
  endif
  Return
endif

//--- special state switches
if Equal CurrAction 124 || Equal CurrAction 125
  Stick -0.78
elif Equal CurrAction 57 && !(CalledFrom ExecuteAttack)
  CallI Unk1120
elif CurrAction >= 61 && CurrAction <= 63
  var22 = Rnd * 2 - 1
  var23 = Rnd * 2 - 1
  AbsStick var22 var23
elif !(CalledFrom LedgeDash) && !(CalledFrom LedgeStall) && !(CalledFrom OnLedge) && CurrAction >= 115 && CurrAction <= 117
  CallI OnLedge
elif !(CalledFrom LyingDown)
  if CurrAction >= 74 && CurrAction <= 84 
    CallI LyingDown
  elif CurrAction >= 138 && CurrAction <= 141
    CallI LyingDown
  endif
endif

//--- switch tactic if conditions are met
if CurrAction >= 66 && CurrAction <= 69 && !(Equal OCurrAction 73) && !(CalledFrom AttackedHub)
  var22 = LevelValue * 0.01 - 0.15
  if FramesHitlag > 0
    Goto OnGotHitAdjustments
    CallI AttackedHub
  elif Equal CurrAction 66
    // Goto OnGotHitAdjustments
    CallI AttackedHub
  endif
endif

if Equal OFramesHitlag 1 && OFramesHitstun > 0 && Equal HitboxConnected 0
  var22 = 10000
  XGoto GetChrSpecific
  //= XReciever
endif

  var22 = 20000
  XGoto GetChrSpecific
  //= XReciever

if !(True)
  label OnGotHitAdjustments
  var22 = 30000
  XGoto GetChrSpecific
  //= XReciever
  Return
endif

if Equal CurrAction 190
  Stick 1
endif

  var22 = 300
  XGoto GetChrSpecific
  if Equal var22 0 
    Return
  endif

if !(CalledFrom RecoveryHub) && DangerEnabled && Equal IsOnStage 0
  if Equal PlayerNum OPlayerNum
    CallI RecoveryHub
  endif
  var22 = 17
  XGoto GetChrSpecific
  //= XReciever
var17 = var22
  if Equal IsOnStage 0 && var21 < 16.7
    var17 *= 0.5
    GetYDistFloorOffset var22 var17 15 0
    var17 *= -1
    GetYDistFloorOffset var23 var17 15 0
    if Equal var22 -1 && Equal var23 -1
      CallI RecoveryHub
    endif
    var17 *= -2
  endif
  var22 = 18
  XGoto GetChrSpecific
  //= XReciever

  var23 = var17 / var22
  var17 = var23

  // X = direction to cliff
  // Y = vertical height if cliff height = 0
  //
  // if char is above ledge, yVar is positive
  // if below, yVar is negative
  // <= means "lower than" and >= means "higher than"
  //
  // AbsStick X = to ledge
  // AbsStick X * -1 = away from ledge
  // 
  // if left of ledge, xVar is positive
  // if right, xVar is negative
  GetNearestCliff var22
  var22 = TopNX - var22
  var23 *= -1
  var23 += TopNY

  Abs var22
  var17 *= var22
  var22 = 18
  XGoto GetChrSpecific
  //= XReciever
  var17 -= var22
  if var23 < var17 && TotalYSpeed < -0.2 && AnimFrame > 2 && Equal IsOnStage 0
    CallI RecoveryHub
  endif
  // var22 = OTopNY - TopNY
  // var17 += var22
  // if var23 < var17 && TotalYSpeed < -1 && AnimFrame > 2 && Equal IsOnStage 0
  //   CallI RecoveryHub
  // endif

  // DrawDebugRectOutline TopNX var17 3 3 255 0 0 221
endif
if !(CalledFrom ExecuteAttack) && !(CalledFrom RecoveryHub)
  if var21 >= 16.7 && Equal OIsOnStage 0
  elif !(Equal var21 15) && !(Equal var21 16.71) && Equal FramesHitstun 0
    if Equal OIsOnStage 0 && var21 < 16.7
      GetYDistFloorOffset var22 10 15 1
      GetYDistFloorOffset var17 -10 15 1
      if Equal var22 -1 && Equal var17 -1
        var21 = 16.7
        var15 = -1
        CallI MainHub
      endif
    endif
  endif
endif

if Equal CurrAction 29 && !(CalledFrom Shield)
  CallI Shield
endif

if !(CalledFrom ExecuteAttack) && !(Equal var21 16.41)
  var22 = 40000
  XGoto GetChrSpecific
  //= XReciever
endif
Return
Return
