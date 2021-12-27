#include <Definition_AIMain.h>
id 0x850F
unk 0x0

XReciever
var16 = 0

if Equal var9 BBoundary
  XGoto GoalChoiceHub
  XReciever
endif

GetIsTeammateCloser var3
if Equal var3 1
  var20 = -1
  var21 = 7
endif

// if OYDistBackEdge >= -10 && OCurrAction >= 69 && OCurrAction <= 85 && Equal OIsOnStage 1
//   $ifLastAttack(fthrow)
//     var20 = -1
//   $elifLastAttack(dthrow)
//     var20 = -1
//   $elifLastAttack(bthrow)
//     var20 = -1
//   $elifLastAttack(uthrow)
//     var20 = -1
//   endif
// endif

var0 = 0
if var21 < 16 || var21 >= 17
  Goto EndlagCheck
endif
if var21 >= 7 && var21 < 8
  SetDebugOverlayColor 0 0 255 136
  EnableDebugOverlay
  var22 = (1 - (LevelValue / 100)) * 30 + 10
  MOD var22 AnimFrame var22
  // $LV9Check(var22 = 1)
  if Equal var22 1
    var17 = OTopNY - TopNY
    if var17 > 45 || OYDistBackEdge < -35 && Equal AirGroundState 1
      if Rnd < 0.76
        var21 = 16
        Return
      endif
    endif

    // predictOOption var22 10 LevelValue 
    // var22 += 10
    if Rnd < 0.26599999999999996
      // if XDistLE var22 
      //   var21 = 10
      //   Return
      // endif
      var21 = 7.1
      XGoto CalcAttackGoal
      XReciever
      
      if !(Equal var20 -1)
        var15 = -2
        CallI MainHub
      else
        XGoto GoalChoiceHub
        XReciever
      endif
    endif
  endif
  // if Equal var22 1 && Rnd < 0.15
  //   var21 = 10
  //   Return
  // endif

  predictAverage var17 10 LevelValue
  Goto getODist
  if var22 <= var17
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
    // $LV9Check(var22 = 1)
    if Equal var22 1
      // Goto EndlagCheck

      if Equal AirGroundState 1 && Rnd < 0.2
        var9 += 12 
        if Rnd < 0.2 && Rnd < 0.2
          var9 += 5
        endif
      elif Equal AirGroundState 2 && YDistBackEdge < -5
        if Rnd < 0.12 && Rnd < 0.12 && NumJumps > 0
          var9 += 29
        else
          var9 += 1
          GetYDistFloorAbsPos var22 var8 var9
          var9 -= var22
        endif
      endif
    endif
  endif
elif var21 >= 10 && var21 < 11
  SetDebugOverlayColor 255 0 255 136
  if Equal var21 10.5
    SetDebugOverlayColor 255 0 255 255
  endif
  EnableDebugOverlay
  var22 = (1 - (LevelValue / 100)) * 30 + 13
  MOD var22 AnimFrame var22
  // $LV9Check(var22 = 1)
  if Equal var22 1
    Goto OPosGoal

    var17 = OTopNY - TopNY
    if var17 > 45 || OYDistBackEdge < -35 && Equal AirGroundState 1
      if Rnd < 0.76
        var21 = 16
        Return
      endif
    endif
    
    if Equal var21 10.4
      Return
    endif

    if !(Equal var21 10.2) && !(Equal var21 10.5)
      predictOOption var22 11 LevelValue 
      predictionConfidence var23 11 LevelValue
      if Equal var22 1 && Rnd < var23
        if Rnd < 0.45 && Equal var3 0
          if Rnd < 0.425
            var21 = 10.5
          else 
            var21 = 7
          endif
        endif
        var22 = 1
        Return
      elif Equal var22 2 && Rnd < var23 && Rnd < 0.7
        var22 = 1
      else
        var22 = 0
      endif

      predictAverage var22 10 LevelValue
      var22 += 45
      var23 = var22 - 20
      if XDistLE var22 && !(XDistLE var23) && Rnd < 0.19 && Equal var3 0
        if Rnd < 0.35
          if Rnd < 0.5625
            var21 = 16.3
          else  
            var21 = 10.1
          endif
          XGoto CalcAttackGoal
          XReciever
          
          if !(Equal var20 -1)
            var15 = -2
            CallI MainHub
          endif
        endif
        var21 = 16
        Return
      endif
    endif

    var1 = 1
    predictAverage var23 10 LevelValue
    if var23 < 8
      var23 = 8
    endif
    var23 += 15
    var23 *= OPos
    GetYDistFloorOffset var23 var23 5 0
    if Equal var23 -1 || Equal var3 1
      var1 = 0
    endif

    Goto getDist
    if var22 >= 25
      var1 = 1
    elif Rnd < 0.255
      var1 = -1
    endif 

    predictAverage var17 10 LevelValue
    if !(Equal var1 1)
      var17 = var17 + 15 * Rnd + 10
    elif True
      if Rnd < 0.7 && Rnd < 0.5249999999999999
      else
        var17 = var17 + 15 * Rnd + 10
      endif
    endif
    var22 = var17

    var17 += 20
    GetAttribute var23 4 0
    var23 *= 5
    var17 -= var23
    if ODistLE var17 && Equal AirGroundState 1 && Equal var21 10.5
      if Rnd < 0.13999999999999999 || Rnd < 0.017499999999999998
        var15 = -1
        if Rnd < 0.025
          var16 = 2
          Call Wavedash
        endif
        var16 = 2
        Call DashScr
      endif
    endif

    if ODistLE var22 && !(Equal var1 -1)
      // LOGSTR 1027423488 1229856768 826096896 1023410176 0
      var22 -= 8
      if Equal var21 10.2 && Equal AirGroundState 1 && ODistLE var22
        var21 = 16.4
        CallI Shield
      endif

      DynamicDiceClear
      if Equal AirGroundState 1
        DynamicDiceAdd 1
        DynamicDiceAdd 2
        DynamicDiceAdd 2
        DynamicDiceAdd 3
        DynamicDiceAdd 4
        DynamicDiceAdd 7
        if Equal var1 1 && Rnd < 0.45599999999999996
          DynamicDiceAdd 6
          DynamicDiceAdd 6
          if Rnd < 0.342
            var16 = 1
            var16 += 0.1
            if Rnd < 0.45599999999999996
              var21 = 16
            endif
            Call JumpScr
          endif
        endif
        GetYDistFloorOffset var22 0 40 0
        GetColDistPosRel var17 var23 TopNX SCDBottom 0 40 1
        if Equal var17 -1 && !(Equal var22 -1) && var22 < 40
          DynamicDiceAdd 5 
        endif
        DynamicDiceRoll var22
        if Rnd > 0.5700000000000001
          LOGSTR_NL 1398030592 1381244928 1463896320 1409286144 0
          var21 = 10.4
        endif
        if Rnd < 0.52
          var16 = 2
          Call DashScr
        elif Rnd < 0.065
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
          if Rnd < 0.2
            var16 += 0.1
          endif
          Goto getDist
          if Rnd < 0.45599999999999996 && var22 <= 30
            var21 = 16
          endif
          Call JumpScr
        elif Equal var22 3
          var16 = 2
          Call Wavedash
        elif Equal var22 4
          var21 = 10.2
        elif Equal var22 7
          var21 = 10.4
        endif
        GetYDistFloorOffset var17 0 50 0
        if var17 > -40 && Rnd < 0.1
          Call BoardPlatform
        endif
      elif NumJumps > 0 && Rnd < 0.12 && Rnd < 0.12 && OYDistBackEdge > -20
        var16 = 1
        if Rnd < 0.5
          var16 = 3
        endif
        var16 += 0.1
        Call JumpScr
      endif
    elif ODistLE var17 && Rnd < 0.2 && Equal OAirGroundState 1 && Equal var1 1
      // LOGSTR 1027423488 1229856768 842874112 1023410176 0
      if Rnd < 0.2
        var16 = 1
        var16 += 0.1
      elif Rnd < 0.2
        var16 = 3
      else
        var16 = 2
      endif
      Call JumpScr
    elif True
      // LOGSTR 1027423488 1229856768 859651328 1023410176 0
      Goto OPosGoal
      if Equal var1 1
      elif True
        predictAverage var22 10 LevelValue
        var22 += 15
        var8 = var8 + var22 * OPos * -1 
      endif
    endif

    // Goto EndlagCheck
  endif
  predictAverage var22 10 LevelValue
  if var22 < 8
    var22 = 8
  endif
  var22 += 10
  DrawDebugRectOutline var8 var9 var22 var22 255 255 0 136
  var22 += 10
  DrawDebugRectOutline var8 var9 var22 var22 255 255 0 68
  var22 += 10
  DrawDebugRectOutline var8 var9 var22 var22 255 255 0 34
elif var21 >= 16 && var21 < 17
  if CalledAs ExecuteAttack
    XGoto SetAttackGoal
    XReciever
    Return
  endif
  if !(Equal var21 16.5)
    SetDebugOverlayColor 255 0 0 136
  else
    SetDebugOverlayColor 0 255 255 136
  endif
    EnableDebugOverlay

  if Equal var20 -1
    XGoto GoalChoiceHub
    XReciever
    XGoto SetAttackGoal
    XReciever
    Return
  endif

  var17 = TopNX
  var22 = OTopNX
  Abs var17
  Abs var22
  if Equal var21 16.3
if !(True) || Equal var20 14|| Equal var20 15|| Equal var20 16|| Equal var20 17|| Equal var20 18|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22
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
  predictAverage var23 10 LevelValue
  var23 += 30
  var23 *= OPos
  GetYDistFloorOffset var23 var23 5 0
  if Equal var23 -1
    var1 = 0
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
  // combos
  var2 = (1 - (LevelValue / 100)) * 30 + 3
  var22 = OAnimFrame - 2
  // standard
  if OCurrAction >= 66 && OCurrAction <= 89
  elif Equal HitboxConnected 1 || Equal PrevAction 60
  else
    var2 = (1 - (LevelValue / 100)) * 30 + 7
    var22 = OAnimFrame - 3
  endif
  
  MOD var2 var22 var2
  var17 = var2 * 3
  MOD var23 var22 var17
  var17 -= 1
  // $LV9Check(var2 = 1)

  // if OAnimFrame <= 4
  //   var2 = 0
  // endif

  if Equal var2 1 && !(Equal var21 16.5)
    var17 = OTopNY - TopNY
    if var17 > 45 || OYDistBackEdge < -45 && Equal AirGroundState 1
    elif OCurrAction >= 66 && OCurrAction <= 89
    elif Equal HitboxConnected 1 || Equal PrevAction 60
    elif !(Equal var21 16.4) && OYDistFloor < 30
      predictOOption var22 11 LevelValue 
      predictionConfidence var23 11 LevelValue
      if Equal var22 1 && Rnd < var23
        var21 = 10
        Return
      elif Equal var22 2 && Rnd > 0.35
        var21 = 10.5
        Return
      elif Equal var22 3 && Rnd < var23
        var21 = 7
        Return
      endif
    endif
  endif

  var17 = OTopNY - TopNY
  if var17 > 30 || OYDistBackEdge < -35 && Equal AirGroundState 1
  elif OCurrAction >= 66 && OCurrAction <= 89 
  elif Equal HitboxConnected 1 || Equal PrevAction 60
  elif Equal var2 1 && Equal var1 0 && Rnd > 0.35 && Equal AirGroundState 1 && !(Equal var21 16.5)
    var21 = 10.5
    Return
  endif

  predictAverage var22 10 LevelValue
  var22 += 20
  if Equal OCurrAction 73 && !(Equal var21 16.5)
    if ODistLE var22 && !(Equal OAirGroundState 1) 
      predictOOption var22 15 LevelValue
      predictionConfidence var17 15 LevelValue
      if Equal var22 2 && Rnd < var17
        Call Shield
      endif
    endif
  endif
  var22 += 30
  if !(ODistLE var22) && Rnd < 0.45 && Rnd < 0.45 && OFramesHitstun <= 0 && !(Equal var21 16.5)
    var21 = 7
    Return
  endif

  // if Equal var23 var17 && var22 > 55
  //   XGoto GoalChoiceHub
  //   XReciever
  //   Return
  // endif

  // prevents truly unreactable adjustements
  Goto getDist
  XReciever

  var23 = XSpeed
  Abs var23
  var23 = 8 + var23

  var16 = 0
  if OCurrAction <= 33 && !(Equal CurrAction 10) && Equal OFramesHitstun 0
    if Equal var2 1 && !(Equal var21 16.5)
      var23 = OPos * -15
      GetYDistFloorOffset var23 var23 0 0
      if Equal var23 -1 && Rnd > 0.38
        var21 = 10.5
        Return
      endif

      if XSpeed > -0.6 && XSpeed < 0.6 && XDistLE 10
        // var16 = 3
        XGoto SetAttackGoal
        XReciever
      endif
    endif

    var16 = 1
    if OCurrAction >= 11 && OCurrAction <= 13 && OAnimFrame < 20
    else
      // var16 = 3
      XGoto SetAttackGoal
      XReciever
    endif
  // otherwise carry on as normal
  elif Equal var2 1 || Equal CurrAction 10 || Equal OCurrAction 73 || OFramesHitstun > 1 || Equal HitboxConnected 1
    if OAnimFrame <= 9 || Equal CurrAction 10 || Equal OCurrAction 73 || OFramesHitstun > 1 || Equal HitboxConnected 1
      var23 = OPos * -15
      GetYDistFloorOffset var23 var23 0 0
      if Equal OCurrAction 73 || OFramesHitstun > 1 || Equal HitboxConnected 1
      elif Equal var23 -1 && Rnd > 0.76 && Rnd > 0.76
        var21 = 10.5
        Return
      endif

      if var22 > var23
        if OCurrAction >= 66 && OCurrAction <= 89
        elif !(SamePlane) && Rnd < 0.85 && Rnd < 0.2 && Equal var2 1 && OFramesHitstun <= 0
          var21 = 10
          Return
        endif
        
        if OCurrAction >= 11 && OCurrAction <= 13 && OAnimFrame < 20
          var16 = 2
        endif
        
        // var16 = 3
        XGoto SetAttackGoal
        XReciever
      endif
    endif
  endif
  if Equal var2 0
    var16 = 3
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
    // if OAnimFrame >= var17
      var0 = var22 - OAnimFrame
    // endif
  elif Rnd < 0.76 && Rnd < 0.76 && Rnd < 0.1
    var0 = 20
  endif
predictAverage var22 10 LevelValue
LOGSTR 1162757120 1279346432 0 0 0
LOGVAL var0
var23 = var0 * 1.25
var22 += var23 + 10
if var0 >= 10 && ODistLE var22 && OFramesHitstun <= 0 && Rnd < 0.76
  predictOOption var22 9 LevelValue
  predictionConfidence var17 9 LevelValue
  var17 *= 1.1
  var17 = var17 + Damage * 0.01 - ODamage * 0.01
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
//   var9 += 12 
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
