#include <Definition_AIMain.h>
id 0x850F
unk 0x0

XReciever
if Equal var9 BBoundary
  XGoto GoalChoiceHub
  XReciever
  Return
endif

if Equal var21 7
  Goto getODist
  if var22 <= 32
    XGoto GoalChoiceHub
    XReciever
    Return
  endif

  Goto getDist
  if var22 <= 10
    if ODistLE 35 || Rnd <= 0.04
      XGoto GoalChoiceHub
      XReciever
      Return
    endif
    var22 = (1 - (LevelValue / 100)) * 30 + 10
    MOD var22 AnimFrame var22
    if Equal var22 1
      if Equal AirGroundState 1 && Rnd < 0.5
        var9 += 13 
        if Rnd < 0.5 && Rnd < 0.5
          var9 += 5
        endif
      elif Equal AirGroundState 2 && YDistBackEdge < -5
        if Rnd < 0.2 && NumJumps > 0
          var9 += 38
        else
          var9 += 1
          GetYDistFloorAbsPos var22 var8 var9
          var9 -= var22
        endif
      endif
    endif
  endif
elif var21 >= 10 && var21 < 11
  if Equal var21 10
    var22 = (1 - (LevelValue / 100)) * 30 + 12
    MOD var22 AnimFrame var22
    if Equal var22 1
      predictAverage var22 10 LevelValue
      var22 += 15
      var17 = var22 + 15
      if ODistLE var22
        DynamicDiceClear
        if Equal AirGroundState 1
          DynamicDiceAdd 1
          DynamicDiceAdd 2
          DynamicDiceAdd 3
          DynamicDiceAdd 4
          GetYDistFloorOffset var22 0 40 0
          GetColDistPosRel var17 var23 TopNX SCDBottom 0 40 1
          if Equal var17 -1 && !(Equal var22 -1) && var22 < 40
            DynamicDiceAdd 5 
          endif
          DynamicDiceRoll var22
          if Rnd < 0.2
            var16 = 2
            Call Roll
          elif Rnd < 0.75
            var16 = 2
            Call DashScr
          endif
          if Equal var22 1
            var16 = 2
            Call DashScr
          elif Equal var22 2
            var16 = 3
            Call JumpScr
          elif Equal var22 3
            var16 = 2
            Call Wavedash
          elif Equal var22 4
            Call Shield
          else
            Call BoardPlatform
          endif
        elif NumJumps > 0
          var16 = 3
          Call JumpScr
        endif
      elif ODistLE var17 && Rnd < 0.5
        if Rnd < 0.5
          var16 = 1
          var16 += 0.1
        else
          var16 = 2
        endif
        Call JumpScr
      elif True
        Goto OPosGoal
      endif
    endif
    predictAverage var22 10 LevelValue
    var22 += 15
    DrawDebugRectOutline var8 var9 var22 var22 255 255 0 136
    var22 += 15
    DrawDebugRectOutline var8 var9 var22 var22 255 255 0 68
  endif
else
  Goto getDist
  if var22 <= 8
    XGoto GoalChoiceHub
    XReciever
    Return
  endif
endif
Return
label OPosGoal
if OAnimFrame < 2
  var8 = OTopNX + OTotalXSpeed * 10 * OPos * ODirection * -1
else
  EstOXCoord var8 18
  var8 -= OTopNX
  var8 *= OPos * ODirection * -1
  var8 += OTopNX
endif
var9 = OYDistBackEdge + OTopNY
if OYDistBackEdge < -30
  var9 += 13 
endif
Return
label getDist
var22 = TopNX - var8
var23 = TopNY - var9
Goto normalize
Return
label getODist
var22 = OTopNX - var8
var23 = OTopNY - var9
Goto normalize
Return
label normalize
Norm var22 var22 var23
Abs var22
Return
Return
