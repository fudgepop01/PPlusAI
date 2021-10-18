#include <Definition_AIMain.h>
id 0x850F
unk 0x0

XReciever
if Equal var9 BBoundary
  XGoto GoalChoiceHub
  XReciever
  Return
endif

if OYDistBackEdge >= -10 && OCurrAction >= 69 && OCurrAction <= 85 && Equal OIsOnStage 1
if Equal var20 10
    var20 = -1
elif Equal var20 11
    var20 = -1
elif Equal var20 12
    var20 = -1
elif Equal var20 13
    var20 = -1
  endif
endif

if Equal var21 7
  var22 = (1 - (LevelValue / 100)) * 30 + 10
  MOD var22 AnimFrame var22
  if Equal var22 1 && Rnd < 0.15
    var21 = 10
    Return
  endif

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
      if Equal AirGroundState 1 && Rnd < 0.05
        var9 += 12 
        if Rnd < 0.05 && Rnd < 0.05
          var9 += 5
        endif
      elif Equal AirGroundState 2 && YDistBackEdge < -5
        if Rnd < 0.2 && NumJumps > 0
          var9 += 28
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
      var22 += 5
      if XDistLE var22 && Rnd < 0.75 && Rnd < 0.75
        var21 = 16
      endif
      if Rnd < 0.7
      else 
        var22 += 20
      endif
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
          if Rnd < 0.85
            var16 = 2
            Call DashScr
          elif Rnd < 0.05
            var16 = 2
            Call Wavedash
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
          elif Rnd < 0.1 && Rnd < 0.1
            Call BoardPlatform
          endif
        elif NumJumps > 0
          var16 = 3
          Call JumpScr
        endif
      elif ODistLE var17 && Rnd < 0.05
        if Rnd < 0.05
          var16 = 1
          var16 += 0.1
        else
          var16 = 2
        endif
        Call JumpScr
      elif True
        Goto OPosGoal
      endif

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
    var17 *= 0.5
    var0 = var17
  elif Equal OCurrAction 26 || Equal OCurrAction 27
    var0 = 20
  elif OAttacking 
    RetrieveFullATKD var22 var23 var17 var23 var23 var23 var23 OCurrSubaction 1
    if Equal var22 0
      var22 = OEndFrame
    endif 
    if OAnimFrame >= var17
      var0 = var22 - OAnimFrame
    endif
  elif Rnd < 0.75 && Rnd < 0.75  && Rnd < 0.3
    var0 = 20
  endif
      if var0 >= 10
        var21 = 16
      endif

    endif
    predictAverage var22 10 LevelValue
    var22 += 25
    DrawDebugRectOutline var8 var9 var22 var22 255 255 0 136
    var22 += 15
    DrawDebugRectOutline var8 var9 var22 var22 255 255 0 68
  endif
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

  LOGSTR 1027424512 1414807808 1129004288 1023410176 0
if Equal var20 0
LOGSTR 1147237120 1749120000 1952539392 1795162112 0
LOGSTR 1147237120 1749120000 1952539392 1795162112 0
LOGSTR 1147237120 1749120000 1952539392 1795162112 0
LOGSTR 1147237120 1749120000 1952539392 1795162112 0
LOGSTR 1147237120 1749120000 1952539392 1795162112 0
elif Equal var20 1
LOGSTR 1179937024 1819541504 0 0 0
LOGSTR 1179937024 1819541504 0 0 0
LOGSTR 1179937024 1819541504 0 0 0
LOGSTR 1179937024 1819541504 0 0 0
LOGSTR 1179937024 1819541504 0 0 0
elif Equal var20 2
LOGSTR 1431595264 1819541504 0 0 0
LOGSTR 1431595264 1819541504 0 0 0
LOGSTR 1431595264 1819541504 0 0 0
LOGSTR 1431595264 1819541504 0 0 0
LOGSTR 1431595264 1819541504 0 0 0
elif Equal var20 3
LOGSTR 1146382592 1819541504 0 0 0
LOGSTR 1146382592 1819541504 0 0 0
LOGSTR 1146382592 1819541504 0 0 0
LOGSTR 1146382592 1819541504 0 0 0
LOGSTR 1146382592 1819541504 0 0 0
elif Equal var20 4
LOGSTR 1179872512 1634953216 0 0 0
LOGSTR 1179872512 1634953216 0 0 0
LOGSTR 1179872512 1634953216 0 0 0
LOGSTR 1179872512 1634953216 0 0 0
LOGSTR 1179872512 1634953216 0 0 0
elif Equal var20 5
LOGSTR 1431530752 1634953216 0 0 0
LOGSTR 1431530752 1634953216 0 0 0
LOGSTR 1431530752 1634953216 0 0 0
LOGSTR 1431530752 1634953216 0 0 0
LOGSTR 1431530752 1634953216 0 0 0
elif Equal var20 6
LOGSTR 1146318080 1634953216 0 0 0
LOGSTR 1146318080 1634953216 0 0 0
LOGSTR 1146318080 1634953216 0 0 0
LOGSTR 1146318080 1634953216 0 0 0
LOGSTR 1146318080 1634953216 0 0 0
elif Equal var20 7
LOGSTR 1685286144 1634953216 1600938240 1952776192 0
LOGSTR 1685286144 1634953216 1600938240 1952776192 0
LOGSTR 1685286144 1634953216 1600938240 1952776192 0
LOGSTR 1685286144 1634953216 1600938240 1952776192 0
LOGSTR 1685286144 1634953216 1600938240 1952776192 0
elif Equal var20 8
LOGSTR 1397977088 1701013760 1634467840 0 0
LOGSTR 1397977088 1701013760 1634467840 0 0
LOGSTR 1397977088 1701013760 1634467840 0 0
LOGSTR 1397977088 1701013760 1634467840 0 0
LOGSTR 1397977088 1701013760 1634467840 0 0
elif Equal var20 9
LOGSTR 1198678272 1644167168 0 0 0
LOGSTR 1198678272 1644167168 0 0 0
LOGSTR 1198678272 1644167168 0 0 0
LOGSTR 1198678272 1644167168 0 0 0
LOGSTR 1198678272 1644167168 0 0 0
elif Equal var20 10
LOGSTR 1718904832 1919907584 0 0 0
LOGSTR 1718904832 1919907584 0 0 0
LOGSTR 1718904832 1919907584 0 0 0
LOGSTR 1718904832 1919907584 0 0 0
LOGSTR 1718904832 1919907584 0 0 0
elif Equal var20 11
LOGSTR 1685350400 1919907584 0 0 0
LOGSTR 1685350400 1919907584 0 0 0
LOGSTR 1685350400 1919907584 0 0 0
LOGSTR 1685350400 1919907584 0 0 0
LOGSTR 1685350400 1919907584 0 0 0
elif Equal var20 12
LOGSTR 1651795968 1919907584 0 0 0
LOGSTR 1651795968 1919907584 0 0 0
LOGSTR 1651795968 1919907584 0 0 0
LOGSTR 1651795968 1919907584 0 0 0
LOGSTR 1651795968 1919907584 0 0 0
elif Equal var20 13
LOGSTR 1970563072 1919907584 0 0 0
LOGSTR 1970563072 1919907584 0 0 0
LOGSTR 1970563072 1919907584 0 0 0
LOGSTR 1970563072 1919907584 0 0 0
LOGSTR 1970563072 1919907584 0 0 0
elif Equal var20 14
LOGSTR 1312909568 1912602624 0 0 0
LOGSTR 1312909568 1912602624 0 0 0
LOGSTR 1312909568 1912602624 0 0 0
LOGSTR 1312909568 1912602624 0 0 0
LOGSTR 1312909568 1912602624 0 0 0
elif Equal var20 15
LOGSTR 1851877632 1918855168 1769222656 0 0
LOGSTR 1851877632 1918855168 1769222656 0 0
LOGSTR 1851877632 1918855168 1769222656 0 0
LOGSTR 1851877632 1918855168 1769222656 0 0
LOGSTR 1851877632 1918855168 1769222656 0 0
elif Equal var20 16
LOGSTR 1178691840 1912602624 0 0 0
LOGSTR 1178691840 1912602624 0 0 0
LOGSTR 1178691840 1912602624 0 0 0
LOGSTR 1178691840 1912602624 0 0 0
LOGSTR 1178691840 1912602624 0 0 0
elif Equal var20 17
LOGSTR 1717659904 1918859008 1700883200 0 0
LOGSTR 1717659904 1918859008 1700883200 0 0
LOGSTR 1717659904 1918859008 1700883200 0 0
LOGSTR 1717659904 1918859008 1700883200 0 0
LOGSTR 1717659904 1918859008 1700883200 0 0
elif Equal var20 18
LOGSTR 1111582976 1912602624 0 0 0
LOGSTR 1111582976 1912602624 0 0 0
LOGSTR 1111582976 1912602624 0 0 0
LOGSTR 1111582976 1912602624 0 0 0
LOGSTR 1111582976 1912602624 0 0 0
elif Equal var20 19
LOGSTR 1430350080 1912602624 0 0 0
LOGSTR 1430350080 1912602624 0 0 0
LOGSTR 1430350080 1912602624 0 0 0
LOGSTR 1430350080 1912602624 0 0 0
LOGSTR 1430350080 1912602624 0 0 0
elif Equal var20 20
LOGSTR 1969318144 1918858240 1768975616 1634598912 0
LOGSTR 1969318144 1918858240 1768975616 1634598912 0
LOGSTR 1969318144 1918858240 1768975616 1634598912 0
LOGSTR 1969318144 1918858240 1768975616 1634598912 0
LOGSTR 1969318144 1918858240 1768975616 1634598912 0
elif Equal var20 21
LOGSTR 1145137408 1912602624 0 0 0
LOGSTR 1145137408 1912602624 0 0 0
LOGSTR 1145137408 1912602624 0 0 0
LOGSTR 1145137408 1912602624 0 0 0
LOGSTR 1145137408 1912602624 0 0 0
elif Equal var20 22
LOGSTR 1684105472 1918857984 1885956864 1694498816 0
LOGSTR 1684105472 1918857984 1885956864 1694498816 0
LOGSTR 1684105472 1918857984 1885956864 1694498816 0
LOGSTR 1684105472 1918857984 1885956864 1694498816 0
LOGSTR 1684105472 1918857984 1885956864 1694498816 0
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

  if Equal var23 var17 && var22 > 25
    XGoto GoalChoiceHub
    XReciever
    Return
  endif

  var23 = XSpeed
  Abs var23
  var23 = 15 + var23

  var16 = 0
  if OCurrAction <= 33 && var22 <= var23 && !(Equal CurrAction 10) && Equal OFramesHitstun 0
    if Equal var0 1
      var16 = 1
      XGoto SetAttackGoal
      XReciever
    endif
  // otherwise carry on as normal
  elif Equal var0 1 || Equal CurrAction 10 || Equal OCurrAction 73 || OFramesHitstun > 1 || Equal HitboxConnected 1
    if !(SamePlane) && Rnd < 0.95 && Rnd < 0.3
      var21 = 10
      Return
    endif
    
    XGoto SetAttackGoal
    XReciever
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
  var9 += 12 
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
