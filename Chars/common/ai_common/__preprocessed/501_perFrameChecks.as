#include <Definition_AIMain.h>
id 0x8501
unk 0x0

//= XReciever
//--- keep this script from being called more than once per frame
NoRepeat
SetTimeout 999

// SetDebugMode 1
// LOGSTR str("mode")
// LOGVAL currGoal
// PRINTLN
//--- visualize stuffs
DrawDebugRectOutline var13 var14 5 5 0 0 255 221

// SetDebugMode 0
//--- prevent auto-attack
Cmd30
// keeps the AI from targeting itself because that can happen for some reason
// if Equal PlayerNum OPlayerNum && !(Equal YDistFloor -1)
//   SwitchTarget
// endif

MOD var22 GameTimer 10
if var22 < 1
  getCurrentPredictValue var22 2
  var23 = OTopNX * 0.25
  var22 -= var23
  Abs var22
  var22 *= 4
  trackOAction 3 var22
  trackOAction 3 var22
  trackOAction 3 var22
  setPrediction var23 2
  predictAverage var22 3
  var23 = -0.5
  if var22 < 3
    var23 = 1
  endif
  ADJUST_PERSONALITY 0 -0.03 var23
  ADJUST_PERSONALITY 3 0.03 var23
  ADJUST_PERSONALITY 11 0.03 var23
endif
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
  JmpNextIfLabel
elif OFramesHitstun > 0
  IfLabel
  trackOAction 4 0
else 
  getCurrentPredictValue var22 4
  if var22 < 120
    incrementPrediction 4
  endif
endif
// Track OAttack Params
if OCurrAction >= 36 && OCurrAction <= 52 || OCurrAction >= 274 && Equal OAnimFrame 0 && Equal OActionTimer 0
  RetrieveFullATKD var23 var23 var23 var17 var22 var23 var23 OCurrSubaction 1
  if !(Equal var23 -1)
    Abs var17
    Abs var22
    if var17 < var22
      var17 = var22
    endif
    var17 *= 1.5
    var23 = Width + OWidth
    var17 += var23

    trackOAction 10 var17
    var23 = OCenterX - CenterX
    Abs var23
    var17 *= 1.5
    trackOAction 11 var23 
    // RetrieveFullATKD globTempVar anotherTempVar immediateTempVar anotherTempVar anotherTempVar anotherTempVar anotherTempVar OCurrSubaction 1
    // if Equal globTempVar 0
    //   globTempVar = OEndFrame
    // endif 
    // anotherTempVar = globTempVar - immediateTempVar
    // trackOAction man_OAvgEndlag anotherTempVar
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
elif Equal var21 13 || Rnd < 0.2
  Goto baitDefendOption
endif
if !(True)
  label baitDefendOption
  var22 = (1 - (LevelValue / 100)) * 30 + 10
  MOD var22 GameTimer var22
  if var22 < 1
    var17 = 9
    if Equal var21 13 || Equal var21 13.1
      var17 = 7
    endif
    predictAverage var22 10
    var22 += 20
    // globTempVar = immediateTempVar + 15
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
  Stick -1
elif NoJumpPrevFrame && CurrAction >= 179 && CurrAction <= 188 
  JmpNextIfLabel
elif Equal CurrAction 186
  JmpNextIfLabel
elif CurrAction >= 146 && CurrAction <= 148
  IfLabel
  Button X
elif CurrAction >= 152 && CurrAction <= 154 
  JmpNextIfLabel
elif CurrAction >= 169 && CurrAction <= 174
  IfLabel
  Button A
  var22 = Rnd * 2 - 1
  var23 = Rnd * 2 - 1
  AbsStick var22 var23
  if CurrAction >= 169 && CurrAction <= 174
    Button R
  endif
elif Equal CurrAction 57 && !(CalledFrom ExecuteAttack)
  CallI ExecuteAttack
elif CurrAction >= 61 && CurrAction <= 63
  JmpNextIfLabel
elif CurrAction >= 90 && CurrAction <= 95
  JmpNextIfLabel
elif CurrAction >= 199 && CurrAction <= 218
  JmpNextIfLabel
elif Equal CurrAction 236
  IfLabel
  MOD var22 GameTimer 5
  if var22 >= 3
    var22 = Rnd * 2 - 1
    var23 = Rnd * 2 - 1
    AbsStick var22 var23
  endif
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
if !(CalledFrom AttackedHub)
  if GettingThrown
    JmpNextIfLabel
  elif CurrAction >= 66 && CurrAction <= 73
    IfLabel
    if FramesHitlag > 0 || FramesHitstun > 0
      Goto OnGotHitAdjustments
      CallI AttackedHub
    elif CurrAction >= 69 && CurrAction <= 73 && YDistFloor > 0 && YDistFloor < 10
      CallI AttackedHub
    elif GettingThrown || Equal CurrAction 238
      CallI AttackedHub
    endif
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
  var22 = 60000
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

if !(CalledFrom RecoveryHub) && Equal IsOnStage 0
  if Equal PlayerNum OPlayerNum
    CallI RecoveryHub
  endif
  var22 = 17
  XGoto GetChrSpecific
  //= XReciever
var17 = var22
  if Equal IsOnStage 0 && var21 < 16.7
    var17 *= 0.25
    GetYDistFloorOffset var22 var17 15 0
    var17 *= -1
    GetYDistFloorOffset var23 var17 15 0
    if Equal var22 -1 && Equal var23 -1
      CallI RecoveryHub
    endif
    var17 *= -1
  endif
  var22 = 18
  XGoto GetChrSpecific
  //= XReciever

  var23 = var22 / var17
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
  var22 = CenterX - var22
  var23 *= -1
  var23 += CenterY

  Abs var22
  var17 *= var22
  var22 = 18
  XGoto GetChrSpecific
  //= XReciever
  var17 -= var22
  // globTempVar += 30
  if var23 < var17 && TotalYSpeed < -0.2 && AnimFrame > 2 && Equal IsOnStage 0
    CallI RecoveryHub
  endif
  // immediateTempVar = OTopNY - TopNY
  // globTempVar += immediateTempVar
  // if anotherTempVar < globTempVar && TotalYSpeed < -1 && AnimFrame > 2 && Equal IsOnStage 0
  //   CallI RecoveryHub
  // endif

  DrawDebugRectOutline TopNX var17 3 3 255 0 0 221
endif
if !(CalledFrom ExecuteAttack)
  if var21 >= 16.7 || Equal var21 3
  elif Equal OIsOnStage 0 && !(Equal var21 15) && !(Equal var21 16.71) && Equal FramesHitstun 0
    GetYDistFloorOffset var22 10 15 1
    GetYDistFloorOffset var17 -10 15 1
    if Equal var22 -1 && Equal var17 -1
      var21 = 16.7
      var15 = -10
      CallI MainHub
    endif
  endif
endif

if Equal CurrAction 29 && !(CalledFrom Shield)
  CallI Shield
endif

if Equal var21 16.41
elif CalledFrom MainHub || CalledFrom UpdateGoal
  var22 = 40000
  XGoto GetChrSpecific
  //= XReciever
endif
Return
Return
