#include <Definition_AIMain.h>
id 0x8501
unk 0x0

XReciever
//--- keep this script from being called more than once per frame
NoRepeat

//--- visualize stuffs
if Equal PlayerNum 0
  DrawDebugRectOutline var8 var9 5 5 255 0 0 221
elif Equal PlayerNum 1
  DrawDebugRectOutline var8 var9 5 5 0 0 255 221
elif Equal PlayerNum 2
  DrawDebugRectOutline var8 var9 5 5 0 255 0 221
elif Equal PlayerNum 3
  DrawDebugRectOutline var8 var9 5 5 255 255 0 221
else
  DrawDebugRectOutline var8 var9 5 5 34 34 34 221
endif
//--- prevent auto-attack
Cmd30
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
// O OOS Option
if Equal OAnimFrame 0 && OFramesSinceShield < 20
  if Equal OCurrAction 33
    trackOAction 14 1
  elif OAttacking && !(Equal OCurrAction 52)
    trackOAction 14 2
  elif Equal OCurrAction 52
    trackOAction 14 3
  endif
elif OAttacking && Equal OAnimFrame 0
  var17 = TopNX - OTopNX
  Abs var17
  trackOAction 11 var17
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

//--- special state switches
if Equal CurrAction 124 || Equal CurrAction 125
  Stick -0.78
elif !(CalledAs LyingDown) && Equal CurrAction 77
  CallI LyingDown
elif !(CalledAs OnLedge) && CurrAction >= 115 && CurrAction <= 117
  CallI OnLedge
endif

//--- switch tactic if conditions are met
if FramesHitstun > 0 && !(CalledAs AttackedHub) && CurrAction >= 67 && CurrAction <= 69
  CallI AttackedHub
endif
if !(Equal var21 2) && !(Equal var21 3) && !(CalledAs OnLedge) && Equal FramesHitstun 0
  if OutOfStage 
    var17 = TopNY + 10
    GetColDistPosRel var17 var17 TopNX var17 0 -150 0
    if Equal var17 -1 || var17 < -5
      CallI RecoveryHub
    endif
  elif MeteoChance
    // CallI EdgeguardHub
  endif
endif

if Equal CurrAction 190
  Stick 1
endif
// react to/read the opponent's attack patterns
var22 = (1 - (LevelValue / 100)) * 30 + 9
MOD var22 AnimFrame var22
if Equal var22 0 && !(Equal var21 13)
  predictAverage var22 10 LevelValue
  var22 += 3
  if ODistLE var22
    GetCommitPredictChance var17 LevelValue
    // var17 *= 0.8
    var22 = (Rnd * 4) + 14 + (1 - LevelValue / 100) * 15
    if Rnd < var17 && Rnd < var17
      CallI DefendHub
    elif OAnimFrame >= var22 && OCurrAction >= 36 && OCurrAction <= 52
      CallI DefendHub
    endif
  endif
endif
Return
Return
