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
    Return
  endif

  if var21 < 16.7
    var22 = OXSpeed * 12
    GetYDistFloorOffset var22 var22 15 1
    if Equal OAirGroundState 3
      var21 = 16.7
    elif Equal var22 -1 && OFramesHitstun > 0 
      var21 = 16.7
    endif
  elif Equal var21 16.72
  elif Equal var21 16.71
    if Equal AirGroundState 1
      var21 = 16
    endif
  elif True
    if Rnd < 0.02 && !(Equal OAirGroundState 3) && OYDistBackEdge > 0
      if CHANCE_MUL_LE PT_BAITCHANCE 0.15 || CHANCE_MUL_LE PT_AGGRESSION 0.1
        var21 = 16.72
        Return
      endif
    endif
    if Equal OAirGroundState 1
      var21 = 16.4
    endif
  endif

  if Equal var20 -1
    Goto OPosGoal
    Goto changeGoal
    Return
  endif


  // if var2 <= 1
  //   DrawDebugRectOutline 0 10 var2 2 255 255 255 238
  // else
  //   DrawDebugRectOutline 0 10 var2 2 255 0 0 238
  // endif

if Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18 || Equal var20 19 || Equal var20 20
  elif OCurrAction >= 26 && OCurrAction <= 29 && Rnd < 0.2
    var20 = -1
    Return      
  endif

  var23 = XSpeed
  Abs var23
  var23 = 8 + var23
  XGoto SetAttackGoal

  if var16 < 10
    var16 = 0
  endif
  XGoto CheckAttackWillHit
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
MOD var22 AnimFrame 8
if Equal var22 0
  XGoto CalcAttackGoal
  //= XReciever
endif
Return
Return
