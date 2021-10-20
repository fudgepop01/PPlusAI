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
elif OCurrAction >= 36 && OCurrAction <= 52 && Equal OAnimFrame 0
  var17 = TopNX - OTopNX
  Abs var17
  predictAverage var22 10 LevelValue
  
  var22 += 10
  var23 = var22 + 20
  if var17 < var22
    trackOAction 11 1
  elif var17 < var23
    trackOAction 11 2
  else
    trackOAction 11 3
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
if var21 >= 10 && var21 < 11
  Goto baitDefendOption
elif Equal var21 13
  Goto baitDefendOption
endif
if !(True)
  label baitDefendOption
  var22 = (1 - (LevelValue / 100)) * 30 + 12
  MOD var22 AnimFrame var22
  if Equal var22 1
    var17 = 9
    if Equal var21 13
      var17 = 7
    endif
    predictAverage var22 10 LevelValue
    var22 += 15
    // var17 = var22 + 15
    if ODistLE var22
      if 3 <= OCurrAction && OCurrAction <= 5 && Rnd < 0.4 && !(Equal var21 13)
        trackOAction 9 1
        if OAnimFrame >= 6 || Equal OCurrAction 4 || Equal OCurrAction 3
          // the target is running in a direction as a result of a bait
          if !(Equal OPos ODirection) 
            // the target is running away, therefor overshoot
            trackOAction 8 2
          else
            // the target is advancing, therefor undershoot
            trackOAction 8 3
          endif
        endif
      elif Rnd < 0.25 && OCurrAction <= 2 && !(Equal var21 13)
        // the target is roughly in-place, therefor neutral
        trackOAction 9 1
        trackOAction 8 1
      elif Equal OCurrAction 52 || Equal OCurrAction 54 || Equal OCurrAction 56 
        trackOAction var17 2
      elif OAttacking && Rnd < 0.5 && Equal var21 13
        trackOAction var17 1
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
elif Equal CurrAction 77 && !(Equal var21 17) 
  CallI LyingDown
elif !(Equal var21 15) && CurrAction >= 115 && CurrAction <= 117
  CallI OnLedge
endif

//--- switch tactic if conditions are met
if CurrAction >= 66 && CurrAction <= 69 && !(Equal var21 12)
  if FramesHitstun > 0
    CallI AttackedHub
  elif Equal CurrAction 66
    CallI AttackedHub
  endif
endif
if !(Equal var21 2) && !(Equal var21 3) && !(Equal var21 15) && Equal FramesHitstun 0
  if Equal IsOnStage 0
    GetYDistFloorOffset var22 0 25 0
    if Equal var22 -1
      CallI RecoveryHub
    endif
  elif MeteoChance
    // CallI EdgeguardHub
  endif
endif

if Equal CurrAction 190
  Stick 1
endif

if Equal CurrAction 29 && !(CalledAs Shield)
  CallI Shield
endif

if FramesHitlag > 0 || FramesHitstun > 0
  Return
endif

  if Equal CurrAction 22 
    if Equal PrevAction 33
      Return
    elif AnimFrame <= 3
      Return
    endif
  elif CurrAction >= 66 && CurrAction <= 73
  elif Equal CanCancelAttack 1
  elif CurrAction >= 24
    Return
  endif

// react to/read the opponent's attack patterns
var22 = (1 - (LevelValue / 100)) * 30 + 14
MOD var22 AnimFrame var22
if Equal var22 0 && !(Equal var21 13) && !(Equal var21 16.4) && OFramesHitstun <= 0 && !(CalledAs Shield)
  if OCurrAction < 66 || OCurrAction >= 72
    if Equal AirGroundState 2 && Rnd < 0.5
      Return
    endif
    predictAverage var22 10 LevelValue
    var22 += 3
    if Equal var21 12 || Equal CurrAction 73
      var22 += 17
    endif
    if ODistLE var22
      GetCommitPredictChance var17 LevelValue
      var17 *= 0.8
      if Equal var21 12 || Equal CurrAction 73
        var22 = Damage * 0.1
        var17 += var22
      endif
      var22 = (Rnd * 4) + 14 + (1 - LevelValue / 100) * 15
      if Rnd < var17 && Rnd < var17
        if var21 < 16 || var21 > 17
          CallI DefendHub
        elif Rnd < 0.75 || Equal var21 12 || Equal CurrAction 73
          CallI DefendHub
        endif
      elif OAnimFrame >= var22 && OCurrAction >= 36 && OCurrAction <= 52
        if var21 < 16 || var21 > 17
          CallI DefendHub
        elif Rnd < 0.75 || Equal var21 12 || Equal CurrAction 73
          CallI DefendHub
        endif
      endif
    endif
  endif
endif
Return
Return
