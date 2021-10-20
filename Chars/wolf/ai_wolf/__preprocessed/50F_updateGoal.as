#include <Definition_AIMain.h>
id 0x850F
unk 0x0

XReciever
var16 = 0
if Equal var9 BBoundary
  XGoto GoalChoiceHub
  XReciever
  Return
endif

if OYDistBackEdge >= -10 && OCurrAction >= 69 && OCurrAction <= 85 && Equal OIsOnStage 1
if Equal var20 17
    var20 = -1
elif Equal var20 18
    var20 = -1
elif Equal var20 19
    var20 = -1
elif Equal var20 20
    var20 = -1
  endif
endif

Goto EndlagCheck
if var21 >= 7 && var21 < 8
  var22 = (1 - (LevelValue / 100)) * 30 + 10
  MOD var22 AnimFrame var22
  if Equal var22 1
    if Rnd < 0.65
      var21 = 7.1
      XGoto CalcAttackGoal
      XReciever
      
      if !(Equal var20 -1)
        var15 = -2
        CallI MainHub
      endif
    endif
  endif
  // if Equal var22 1 && Rnd < 0.15
  //   var21 = 10
  //   Return
  // endif

  predictAverage var17 10 LevelValue
  Goto getODist
  if var17 <= var22
    XGoto GoalChoiceHub
    XReciever
    Return
  endif

  Goto getDist
  if var22 <= 13
    if ODistLE var17 || Rnd <= 0.04
      XGoto GoalChoiceHub
      XReciever
      Return
    endif
    var22 = (1 - (LevelValue / 100)) * 30 + 10
    MOD var22 AnimFrame var22
    if Equal var22 1
      // Goto EndlagCheck

      if Equal AirGroundState 1 && Rnd < 0.35
        var9 += 9.344 
        if Rnd < 0.35 && Rnd < 0.35
          var9 += 5
        endif
      elif Equal AirGroundState 2 && YDistBackEdge < -5
        if Rnd < 0.07 && Rnd < 0.07 && NumJumps > 0
          var9 += 33.514
        else
          var9 += 1
          GetYDistFloorAbsPos var22 var8 var9
          var9 -= var22
        endif
      endif
    endif
  endif
elif var21 >= 10 && var21 < 11
  var22 = (1 - (LevelValue / 100)) * 30 + 12
  MOD var22 AnimFrame var22
  if Equal var22 1
    if !(Equal var21 10.2)
      predictOOption var22 11 LevelValue 
      predictionConfidence var23 11 LevelValue
      if Equal var22 1 && Rnd < var23
        if Rnd < 0.35
          if Rnd < 0.65 && Rnd < 0.65
            Call FastAerial
          else 
            var21 = 7
          endif
        endif
        var22 = 1
        Return
      elif Equal var22 2 && Rnd < var23 && Rnd > 0.35
        var22 = 1
      else
        var22 = 0
      endif

      if Equal var22 1
        predictAverage var22 11 LevelValue
      else
        predictAverage var22 10 LevelValue
      endif
      var22 += 15
      var23 = var22 - 5
      if XDistLE var22 && !(XDistLE var23) && Rnd < 0.325
        if Rnd < 0.35
          var21 = 10.1
          XGoto CalcAttackGoal
          XReciever
          
          if !(Equal var20 -1)
            var15 = -2
            CallI MainHub
          endif
        endif
        var21 = 16
      endif
    endif

    var1 = 1
    predictAverage var23 11 LevelValue
    if var23 < 15
      var23 = 15
    endif
    var23 += 15 
    var23 *= OPos
    GetYDistFloorOffset var23 var23 5 0
    if Equal var23 -1
      LOGSTR 1145130496 1195725312 541212928 1230241792 0
      var1 = 0
    endif
    if Equal var1 0
      var17 = 15 * Rnd + 25
      var22 += var17
    elif True
      if Rnd < 0.35 && Rnd < 0.35
      else
        var17 = 15 * Rnd + 25
        var22 += var17
      endif
    endif

    var17 = var22 + 15
    if ODistLE var22
      if Equal var21 10.2 && Equal AirGroundState 1
        CallI Shield
        Return
      endif

      DynamicDiceClear
      if Equal AirGroundState 1
        DynamicDiceAdd 1
        DynamicDiceAdd 2
        DynamicDiceAdd 3
        DynamicDiceAdd 4
        if Equal var1 1
          DynamicDiceAdd 6
        endif
        GetYDistFloorOffset var22 0 40 0
        GetColDistPosRel var17 var23 TopNX SCDBottom 0 40 1
        if Equal var17 -1 && !(Equal var22 -1) && var22 < 40
          DynamicDiceAdd 5 
        endif
        DynamicDiceRoll var22
        if Rnd < 0.175
          var16 = 2
          Call DashScr
        elif Rnd < 0.325
          var16 = 2
          Call Wavedash
        endif
        if Equal var22 1
          var16 = 2
          Call DashScr
        elif Equal var22 6
          var16 = 4
          Call DashScr
        elif Equal var22 2
          var16 = 3
          Call JumpScr
        elif Equal var22 3
          var16 = 2
          Call Wavedash
        elif Equal var22 4
          var21 = 10.2
        elif Rnd < 0.05 && Rnd < 0.05
          Call BoardPlatform
        endif
      elif NumJumps > 0 && Rnd < 0.07 && Rnd < 0.07 && OYDistBackEdge > -20
        var16 = 1
        if Rnd < 0.5
          var16 = 3
        endif
        Call JumpScr
      endif
    elif ODistLE var17 && Rnd < 0.35 && Equal OAirGroundState 1 && Equal var1 1
      if Rnd < 0.35
        var16 = 1
        var16 += 0.1
      elif Rnd < 0.35
        var16 = 3
      else
        var16 = 2
      endif
      Call JumpScr
    elif True
      if Equal var1 1
        Goto OPosGoal
      else
        var8 = 0
      endif
    endif

    // Goto EndlagCheck
  endif
  predictAverage var22 10 LevelValue
  var22 += 25
  DrawDebugRectOutline var8 var9 var22 var22 255 255 0 136
  var22 += 15
  DrawDebugRectOutline var8 var9 var22 var22 255 255 0 68
elif var21 >= 16 && var21 < 17
  if CalledAs ExecuteAttack
    XGoto SetAttackGoal
    XReciever
    Return
  endif

  if Equal var20 -1
    XGoto GoalChoiceHub
    XReciever
    Return
  endif

  var17 = TopNX
  var22 = OTopNX
  Abs var17
  Abs var22
  if Equal var21 16.3
if !(True) || Equal var20 11|| Equal var20 13|| Equal var20 15|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25|| Equal var20 26|| Equal var20 27
      if var17 < var22
        Call ExecuteAttack
      elif Rnd < 0.3
        Call ExecuteAttack
      endif
    elif Equal AirGroundState 1
      if var17 < var22
        Call ExecuteAttack
      elif Rnd < 0.3
        Call ExecuteAttack
      endif
    endif
  endif


  var1 = 1
  predictAverage var23 11 LevelValue
  var23 += 30
  var23 *= OPos
  GetYDistFloorOffset var23 var23 5 0
  if Equal var23 -1
    var1 = 0
  endif

  LOGSTR 1027424512 1414807808 1129004288 1023410176 0
if Equal var20 0
LOGSTR 1247896064 825373440 0 0 0
LOGSTR 1247896064 825373440 0 0 0
LOGSTR 1247896064 825373440 0 0 0
LOGSTR 1247896064 825373440 0 0 0
LOGSTR 1247896064 825373440 0 0 0
elif Equal var20 1
LOGSTR 1147237120 1749120000 1952539392 1795162112 0
LOGSTR 1147237120 1749120000 1952539392 1795162112 0
LOGSTR 1147237120 1749120000 1952539392 1795162112 0
LOGSTR 1147237120 1749120000 1952539392 1795162112 0
LOGSTR 1147237120 1749120000 1952539392 1795162112 0
elif Equal var20 2
LOGSTR 1179937024 1819541504 0 0 0
LOGSTR 1179937024 1819541504 0 0 0
LOGSTR 1179937024 1819541504 0 0 0
LOGSTR 1179937024 1819541504 0 0 0
LOGSTR 1179937024 1819541504 0 0 0
elif Equal var20 3
LOGSTR 1431595264 1819541504 0 0 0
LOGSTR 1431595264 1819541504 0 0 0
LOGSTR 1431595264 1819541504 0 0 0
LOGSTR 1431595264 1819541504 0 0 0
LOGSTR 1431595264 1819541504 0 0 0
elif Equal var20 4
LOGSTR 1146382592 1819541504 0 0 0
LOGSTR 1146382592 1819541504 0 0 0
LOGSTR 1146382592 1819541504 0 0 0
LOGSTR 1146382592 1819541504 0 0 0
LOGSTR 1146382592 1819541504 0 0 0
elif Equal var20 5
LOGSTR 1179872512 1634953216 0 0 0
LOGSTR 1179872512 1634953216 0 0 0
LOGSTR 1179872512 1634953216 0 0 0
LOGSTR 1179872512 1634953216 0 0 0
LOGSTR 1179872512 1634953216 0 0 0
elif Equal var20 6
LOGSTR 1431530752 1634953216 0 0 0
LOGSTR 1431530752 1634953216 0 0 0
LOGSTR 1431530752 1634953216 0 0 0
LOGSTR 1431530752 1634953216 0 0 0
LOGSTR 1431530752 1634953216 0 0 0
elif Equal var20 7
LOGSTR 1970498816 1634953216 1600938240 1952776192 0
LOGSTR 1970498816 1634953216 1600938240 1952776192 0
LOGSTR 1970498816 1634953216 1600938240 1952776192 0
LOGSTR 1970498816 1634953216 1600938240 1952776192 0
LOGSTR 1970498816 1634953216 1600938240 1952776192 0
elif Equal var20 8
LOGSTR 1146318080 1634953216 0 0 0
LOGSTR 1146318080 1634953216 0 0 0
LOGSTR 1146318080 1634953216 0 0 0
LOGSTR 1146318080 1634953216 0 0 0
LOGSTR 1146318080 1634953216 0 0 0
elif Equal var20 9
LOGSTR 1685286144 1634953216 1600938240 1952776192 0
LOGSTR 1685286144 1634953216 1600938240 1952776192 0
LOGSTR 1685286144 1634953216 1600938240 1952776192 0
LOGSTR 1685286144 1634953216 1600938240 1952776192 0
LOGSTR 1685286144 1634953216 1600938240 1952776192 0
elif Equal var20 10
LOGSTR 1314091008 1701013760 1634467840 0 0
LOGSTR 1314091008 1701013760 1634467840 0 0
LOGSTR 1314091008 1701013760 1634467840 0 0
LOGSTR 1314091008 1701013760 1634467840 0 0
LOGSTR 1314091008 1701013760 1634467840 0 0
elif Equal var20 11
LOGSTR 1314091008 1701013760 1634484480 1769078784 0
LOGSTR 1314091008 1701013760 1634484480 1769078784 0
LOGSTR 1314091008 1701013760 1634484480 1769078784 0
LOGSTR 1314091008 1701013760 1634484480 1769078784 0
LOGSTR 1314091008 1701013760 1634484480 1769078784 0
elif Equal var20 12
LOGSTR 1685286912 1701013760 1634467840 0 0
LOGSTR 1685286912 1701013760 1634467840 0 0
LOGSTR 1685286912 1701013760 1634467840 0 0
LOGSTR 1685286912 1701013760 1634467840 0 0
LOGSTR 1685286912 1701013760 1634467840 0 0
elif Equal var20 13
LOGSTR 1685286912 1701013760 1634492672 1769078784 0
LOGSTR 1685286912 1701013760 1634492672 1769078784 0
LOGSTR 1685286912 1701013760 1634492672 1769078784 0
LOGSTR 1685286912 1701013760 1634492672 1769078784 0
LOGSTR 1685286912 1701013760 1634492672 1769078784 0
elif Equal var20 14
LOGSTR 1397977088 1701013760 1634467840 0 0
LOGSTR 1397977088 1701013760 1634467840 0 0
LOGSTR 1397977088 1701013760 1634467840 0 0
LOGSTR 1397977088 1701013760 1634467840 0 0
LOGSTR 1397977088 1701013760 1634467840 0 0
elif Equal var20 15
LOGSTR 1397977088 1701013760 1634484480 1769078784 0
LOGSTR 1397977088 1701013760 1634484480 1769078784 0
LOGSTR 1397977088 1701013760 1634484480 1769078784 0
LOGSTR 1397977088 1701013760 1634484480 1769078784 0
LOGSTR 1397977088 1701013760 1634484480 1769078784 0
elif Equal var20 16
LOGSTR 1198678272 1644167168 0 0 0
LOGSTR 1198678272 1644167168 0 0 0
LOGSTR 1198678272 1644167168 0 0 0
LOGSTR 1198678272 1644167168 0 0 0
LOGSTR 1198678272 1644167168 0 0 0
elif Equal var20 17
LOGSTR 1718904832 1919907584 0 0 0
LOGSTR 1718904832 1919907584 0 0 0
LOGSTR 1718904832 1919907584 0 0 0
LOGSTR 1718904832 1919907584 0 0 0
LOGSTR 1718904832 1919907584 0 0 0
elif Equal var20 18
LOGSTR 1685350400 1919907584 0 0 0
LOGSTR 1685350400 1919907584 0 0 0
LOGSTR 1685350400 1919907584 0 0 0
LOGSTR 1685350400 1919907584 0 0 0
LOGSTR 1685350400 1919907584 0 0 0
elif Equal var20 19
LOGSTR 1651795968 1919907584 0 0 0
LOGSTR 1651795968 1919907584 0 0 0
LOGSTR 1651795968 1919907584 0 0 0
LOGSTR 1651795968 1919907584 0 0 0
LOGSTR 1651795968 1919907584 0 0 0
elif Equal var20 20
LOGSTR 1970563072 1919907584 0 0 0
LOGSTR 1970563072 1919907584 0 0 0
LOGSTR 1970563072 1919907584 0 0 0
LOGSTR 1970563072 1919907584 0 0 0
LOGSTR 1970563072 1919907584 0 0 0
elif Equal var20 21
LOGSTR 1312909568 1912602624 0 0 0
LOGSTR 1312909568 1912602624 0 0 0
LOGSTR 1312909568 1912602624 0 0 0
LOGSTR 1312909568 1912602624 0 0 0
LOGSTR 1312909568 1912602624 0 0 0
elif Equal var20 22
LOGSTR 1178691840 1912602624 0 0 0
LOGSTR 1178691840 1912602624 0 0 0
LOGSTR 1178691840 1912602624 0 0 0
LOGSTR 1178691840 1912602624 0 0 0
LOGSTR 1178691840 1912602624 0 0 0
elif Equal var20 23
LOGSTR 1111582976 1912602624 0 0 0
LOGSTR 1111582976 1912602624 0 0 0
LOGSTR 1111582976 1912602624 0 0 0
LOGSTR 1111582976 1912602624 0 0 0
LOGSTR 1111582976 1912602624 0 0 0
elif Equal var20 24
LOGSTR 1430350080 1912602624 0 0 0
LOGSTR 1430350080 1912602624 0 0 0
LOGSTR 1430350080 1912602624 0 0 0
LOGSTR 1430350080 1912602624 0 0 0
LOGSTR 1430350080 1912602624 0 0 0
elif Equal var20 25
LOGSTR 1969318144 1918856192 1635017984 0 0
LOGSTR 1969318144 1918856192 1635017984 0 0
LOGSTR 1969318144 1918856192 1635017984 0 0
LOGSTR 1969318144 1918856192 1635017984 0 0
LOGSTR 1969318144 1918856192 1635017984 0 0
elif Equal var20 26
LOGSTR 1145137408 1912602624 0 0 0
LOGSTR 1145137408 1912602624 0 0 0
LOGSTR 1145137408 1912602624 0 0 0
LOGSTR 1145137408 1912602624 0 0 0
LOGSTR 1145137408 1912602624 0 0 0
elif Equal var20 27
LOGSTR 1684105472 1918856448 1702126848 1869742080 0
LOGSTR 1684105472 1918856448 1702126848 1869742080 0
LOGSTR 1684105472 1918856448 1702126848 1869742080 0
LOGSTR 1684105472 1918856448 1702126848 1869742080 0
LOGSTR 1684105472 1918856448 1702126848 1869742080 0
endif
  LOGSTR 1027423488 1027423488 1027423488 1023410176 0
  var0 = (1 - (LevelValue / 100)) * 30 + 12
  MOD var0 AnimFrame var0
  var17 = var0 * 3
  MOD var23 AnimFrame var17
  var17 -= 1

  // prevents truly unreactable adjustements
  Goto getDist
  XReciever

  if Equal var0 1 && Equal var1 0 && Rnd > 0.175
    LOGSTR 1145130496 1195725312 541152256 1258291200 0
    var21 = 10
    Return
  endif

  predictAverage var22 10 LevelValue
  var22 += 20
  if Equal OCurrAction 73
    if ODistLE var22 && !(Equal OAirGroundState 1) 
      predictOOption var22 15 LevelValue
      predictionConfidence var17 15 LevelValue
      if Equal var22 2 && Rnd < var17
        Call Shield
      endif
    endif
  endif
  var22 += 30
  if !(ODistLE var22) && Rnd < 0.35 && Rnd < 0.35 && OFramesHitstun <= 0
    var21 = 7
    Return
  endif

  if Equal var23 var17 && var22 > 55
    XGoto GoalChoiceHub
    XReciever
    Return
  endif

  var23 = XSpeed
  Abs var23
  var23 = 8 + var23

  var16 = 0
  if OCurrAction <= 33 && var22 <= var23 && !(Equal CurrAction 10) && Equal OFramesHitstun 0
    if Equal var0 1
      var23 = OPos * -15
      GetYDistFloorOffset var23 var23 0 0
      if Equal var23 -1 && Rnd > 0.65
        CallI DefendHub
      endif


      if XSpeed > -0.6 && XSpeed < 0.6 && ODistLE 8 && Equal var21 16
        XGoto CalcAttackGoal
        XReciever
        Return
      endif

      var16 = 1
      if OCurrAction >= 11 && OCurrAction <= 13 && OAnimFrame < 20
      else
        XGoto SetAttackGoal
        XReciever
      endif
    endif
  // otherwise carry on as normal
  elif Equal var0 1 || Equal CurrAction 10 || Equal OCurrAction 73 || OFramesHitstun > 1 || Equal HitboxConnected 1
    var23 = OPos * -15
    GetYDistFloorOffset var23 var23 0 0
    if Equal var23 -1 && Rnd > 0.65
      CallI DefendHub
    endif

    if var22 > var23
      if !(SamePlane) && Rnd < 0.85 && Rnd < 0.2 && Equal var0 1 && OFramesHitstun <= 0
        var21 = 10
        Return
      endif
      
      if OCurrAction >= 11 && OCurrAction <= 13 && OAnimFrame < 20
        var16 = 2
      endif
      
      XGoto SetAttackGoal
      XReciever
    endif
  endif
  
  XGoto CheckAttackWillHit
  XReciever
else
  Goto getDist
  if var22 <= 8
    XGoto GoalChoiceHub
    XReciever
    Return
  endif
endif
Return
label EndlagCheck
  var0 = -1
  if Equal OCurrAction 51 && OYDistBackEdge > -25
    if Equal OCurrSubaction AttackAirN
      GetAttribute var17 65 1
    elif Equal OCurrSubaction AttackAirF
      GetAttribute var17 66 1
    elif Equal OCurrSubaction AttackAirB
      GetAttribute var17 67 1
    elif Equal OCurrSubaction AttackAirHi
      GetAttribute var17 68 1
    elif Equal OCurrSubaction AttackAirLw
      GetAttribute var17 69 1
    endif
    var17 -= OYDistBackEdge
    var17 *= 0.7
    var0 = var17
  elif Equal OCurrAction 24
    var0 = OEndFrame - OAnimFrame
  elif Equal OCurrAction 33 && OYDistBackEdge < -15
    var0 = 35
  elif Equal OCurrAction 26 || Equal OCurrAction 27 || Equal OCurrAction 16
    var17 = OTopNX - TopNX
    Abs var17
    var17 = 10 - var17
    var0 = 30 + var17
  elif OAttacking 
    RetrieveFullATKD var22 var17 var23 var23 var23 var23 var23 OCurrSubaction 1
    if Equal var22 0
      var22 = OEndFrame
    endif 
    if OAnimFrame >= var17
      var0 = var22 - OAnimFrame
    endif
  elif Rnd < 0.65 && Rnd < 0.65 && Rnd < 0.1
    var0 = 20
  endif
predictAverage var22 10 LevelValue
var22 += var0 + 10
if var0 >= 12 && ODistLE var22 && OFramesHitstun <= 0
  predictOOption var22 9 LevelValue
  predictionConfidence var17 9 LevelValue
  var17 *= 2
  var17 = var17 + Damage * 0.02
  if Rnd < var17 && Equal var22 1 
    var21 = 10.2
  else
    var21 = 16.4
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
// if OYDistBackEdge < -30
//   var9 += 9.344 
// endif
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
