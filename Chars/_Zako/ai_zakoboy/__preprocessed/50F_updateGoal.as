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

if !(True)
  elif OCurrAction >= 26 && OCurrAction <= 29 && var2 < 1 && Rnd < 0.2
    var20 = -1
    Return      
  endif

  var23 = XSpeed
  Abs var23
  var23 = 8 + var23

  if var21 >= 16.7
    var16 = 0
    XGoto SetAttackGoal
    //= XReciever
  elif OCurrAction <= 33 && !(Equal CurrAction 10) && Equal OFramesHitstun 0
    if var2 <= 1
      XGoto SetAttackGoal
      //= XReciever
    endif

    if var21 <= 16.4 && !(Equal var21 16.3)
      var23 = OPos * -15
      GetYDistFloorOffset var22 var23 0 0
      var23 *= -2
      GetYDistFloorOffset var23 var23 0 1
      if Equal var22 -1
        var23 = -1
      endif
      if Equal var23 -1 && CHANCE_MUL_GE PT_AGGRESSION 0.4 && CHANCE_MUL_GE PT_WALL_CHANCE 0.65
        var21 = 10.4
        if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.4
          var21 = 10.5
        endif
        Return
      elif Equal var23 -1
  var22 = 100
  XGoto GetChrSpecific
  //= XReciever
var0 = var22
  if Equal var0 1
          var21 = 16.3      
          Return
        endif
      endif
    endif
  // otherwise carry on as normal
  elif var2 <= 1 || Equal CurrAction 10 || Equal OCurrAction 73 || OFramesHitstun > 1 || Equal HitboxConnected 1
    
    if OAnimFrame <= 9 || Equal CurrAction 10 || Equal OCurrAction 73 || OFramesHitstun > 1 || Equal HitboxConnected 1
      if var22 > var23
  var22 = 200
  XGoto GetChrSpecific
  //= XReciever
        if Equal var22 1
        elif var21 >= 16.7
        elif !(SamePlane) && CHANCE_MUL_LE PT_BAITCHANCE 1 && Rnd < 0.2 && var2 <= 1 && OFramesHitstun <= 0
          var21 = 16
          Return
        endif

        // var16 = 3
        XGoto SetAttackGoal
        //= XReciever
      endif
    endif
  endif

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
