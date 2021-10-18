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
if Equal OAnimFrame 0 && FramesSinceShield < 20
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

//--- switch tactic if conditions are met
if FramesHitstun > 0 && !(Equal var21 12) && CurrAction >= 66 && CurrAction <= 73
  if CurrAction >= 67 && CurrAction <= 69
    CallI AttackedHub
  endif
endif
if !(Equal var21 2) && !(Equal var21 3) && !(Equal var21 15) && Equal FramesHitstun 0
  if OutOfStage 
    // CallI RecoveryHub
  elif MeteoChance
    // CallI EdgeguardHub
  endif
endif

if Equal CurrAction 190
  Stick 1
elif !(Equal var21 14) && !(Equal var21 15)
  // react to/read the opponent's attack patterns
  MOD var22 AnimFrame 7
  if Equal var22 0 && !(Equal var21 13)
    predictAverage var22 10 LevelValue
    var22 += 3
    if ODistLE var22
      GetCommitPredictChance var17 LevelValue
      LOGSTR 1096043264 541280256 1313031424 0 0
      LOGVAL var17
      var17 *= 0.8
      var22 = (Rnd * 4) + 14 + (1 - LevelValue / 100) * 15
      if Rnd < var17 && Rnd < var17
        CallI DefendHub
      elif OAnimFrame >= var22 && OCurrAction >= 36 && OCurrAction <= 52
        CallI DefendHub
      endif
    endif
  endif

  //--- special state switches
  if Equal CurrAction 124 || Equal CurrAction 125
    Stick -0.78
  elif Equal CurrAction 77
    var21 = 14
    CallI LyingDown
  elif CurrAction >= 115 && CurrAction <= 117
    var21 = 15
    CallI OnLedge
  endif
endif
Return
Return
