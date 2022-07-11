#include <Definition_AIMain.h>
id 0x8503
unk 0x0

XReciever
NoRepeat

// yep, move choice is COOOOOMPLICATED lmao


predictOOption var22 8 LevelValue 
var23 = 0
if OCurrAction >= 66 && OCurrAction <= 100 && !(Equal OCurrAction 73)
  var23 = 1
endif
if !(Equal var22 2) && var21 < 16.7 && !(CalledFrom FastAerial) && Equal var21 16 && !(Equal var21 7.1) && OFramesHitstun <= 0 && Equal var23 0
  predictOOption var23 7 LevelValue 
  var22 = 200
  XGoto GetChrSpecific
  XReciever
  predictionConfidence var17 7 LevelValue
  var17 *= 2
  if Equal var22 1
  elif !(Equal var23 3) && Rnd < var17 && CHANCE_MUL_LE PT_WALL_CHANCE 1.2 && SamePlane
    var21 = 16.3
  endif
endif

if var21 >= 16 && var21 <= 17
elif Equal var21 7.1 || Equal var21 10.1 || Equal var21 10.2
else
  var21 = 16
endif
if OFramesHitstun >= 1 && var21 < 16.7
  var21 = 16
endif

// ///////////////////////////////////////////////////////////////
// prioritization
// ///////////////////////////////////////////////////////////////

// https://fightinggameglossary.net/index/pressure
// https://fightinggameglossary.net/index/poke
// I might not implement this idk
// https://fightinggameglossary.net/index/anti-air
// https://fightinggameglossary.net/index/conversion
// https://fightinggameglossary.net/index/frame-trap
// https://fightinggameglossary.net/index/cross-up
// https://fightinggameglossary.net/index/otg

DynamicDiceClear 0
DynamicDiceClear 1

// universal:
// - breakCC
// - antiAir
  // predict the chance that the opponent will crouch
  PredictOMov var22 6 LevelValue
  if OCurrAction >= 17 && OCurrAction <= 21
    var22 += 1.5
  endif
  DynamicDiceAdd 0 4 var22

  // if they're in the air and are likely to attack then an anti-air is a good option
  var22 = OTopNY - TopNY - HurtboxSize
  if XDistLE var17 && var22 > 10
    PredictOMov var22 14 LevelValue
    if var22 > 0.4 && CHANCE_MUL_LE PT_AGGRESSION 1.3 && OFramesHitstun < 15
      var23 = PT_AGGRESSION * 0.5
      DynamicDiceAdd 0 10 var23
    endif
  endif
// neutral:
// - kill
// - poke
// - breakCC
// - crossUp
// - antiAir
// - launch

// getting approximate width of the main stage platform
Goto approxStageWidth

Norm var22 TopNX TopNY 
Norm var23 OTopNX OTopNY
Abs var22
Abs var23

// if the distance between the players is less than about 7/20ths of the stage width
var17 *= 0.35
if var22 < var17
  // ...and neither player is 7/20th stage lengths away from the ledge
  var17 *= OPos
  GetYDistFloorOffset var22 var17 5 1
  var17 *= -1
  GetYDistFloorOffset var23 var17 5 0
  if !(Equal var22 -1) && !(Equal var23 -1) 
    Goto neutral_priorities
  endif
endif

if !(True)
  label neutral_priorities
    // the greater the damage, the more incentive there is to go for a kill
    // however, approaching can be unsafe, and so is determined by aggression
    var17 = PT_AGGRESSION + 0.15
    var22 = ODamage * (100 + OWeight - 100) / 2000
    var22 *= var17
    DynamicDiceAdd 0 0 var22

    // pokes are used in neutral often to try and get at the target from a safe distance
    var23 = (PT_AGGRESSION + 1) * (PT_BAITCHANCE + 1)
    DynamicDiceAdd 0 7 var23

    if Equal AirGroundState 1
      // if the opponent is unlikely to attack or grab
      PredictOMov var22 14 LevelValue
      PredictOMov var17 15 LevelValue
      var23 = (PT_AGGRESSION + 1) * (PT_BAITCHANCE + 1) * (1.5 - var22) * (1.5 - var17)
      if var22 < 0.2 && var17 < 0.2
        // then consider crossing them up
        DynamicDiceAdd 0 13 var23
      endif
      // otherwise if they're high in the air and nearby

      var22 = OTopNY - TopNY - HurtboxSize
      predictAverage var17 10 LevelValue
      var17 += 10
      if XDistLE var17 && var22 > 25
        // then maybe crossing up is still a good option
        var23 *= 0.85 * PT_AGGRESSION
        DynamicDiceAdd 0 13 var23
      endif
    endif

    // if they're close then a launcher (as-in combo starter) is an idea
    predictAverage var17 10 LevelValue
    var17 += Width + OWidth
    if ODistLE var17
      var23 = 2 * (0.4 + PT_AGGRESSION) * (0.4 + PT_BRAVECHANCE)
      DynamicDiceAdd 0 6 var23
    endif
  Return
endif

// advantage options

var22 = OTopNY - TopNY - HurtboxSize
if var22 > 40
  Goto advantage_priorities
elif True
  // otherwise if the opponent is 4/10ths of the way to the ledge relative to their direction from you
  Goto approxStageWidth
  var17 *= 0.4 * OPos
  // take aggression and bravery into account
  var23 = (0.5 + PT_AGGRESSION) * (0.5 + PT_BRAVECHANCE)
  var17 *= var23
  GetYDistFloorOffset var22 var17 5 1
  if Equal var22 -1
    Goto advantage_priorities
  elif True
    // then if the target is stuck in their shield...
    if OCurrAction >= 26 && OCurrAction <= 29 && XDistLE 35
      Goto advantage_priorities
    endif
  endif
endif

if !(True)
  label advantage_priorities
    // the greater the damage, the more incentive there is to go for a kill
    var22 = ODamage * (100 + OWeight - 100) / 2000
    DynamicDiceAdd 0 0 var22

    var22 = 2 * PT_AGGRESSION
    DynamicDiceAdd 0 3 var22
    if OCurrAction >= 26 && OCurrAction <= 29
      DynamicDiceAdd 0 3 2.5
    endif
    var22 *= 0.65
    DynamicDiceAdd 0 1 var22
    var23 = 1 + PT_BRAVECHANCE
    var22 *= var23
    DynamicDiceAdd 0 6 var22

    var22 = PT_BAITCHANCE * 5
    DynamicDiceAdd 0 12 var22
  Return
endif

// if the target is caught in a combo of some sort
// exclude if they can act freely
  var22 = 200
  XGoto GetChrSpecific
  XReciever
if Equal var22 1
  Goto punish_priorities
endif
if !(True)
  label punish_priorities
    // the greater the damage, the more incentive there is to go for a kill
    var22 = ODamage * (100 + OWeight - 100) / 900
    DynamicDiceAdd 0 0 var22

    // calculate if we can arrive to the target's position as their hitstun ends
    if OFramesHitstun > 0
      // var23 = OFramesHitstun

      // EstOXCoord var22 var23

      // if Equal AirGroundState 1
      //   GetAttribute var17 40; 0
      // else
      //   GetAttribute var17 136; 0
      // endif
      // var17 = var17 * var23
      // var17 *= OPos
      // var17 += TopNX

      // if var17 < var22 && OPos < 0
      //   DynamicDiceAdd 0 1 15
      // elif var17 > var22 && OPos > 0
        DynamicDiceAdd 0 1 15
      // endif
    elif OCurrAction >= 77 && OCurrAction <= 100
      DynamicDiceAdd 0 2 4
    else
      // otherwise see if we can make a conversion
      // var23 = 20

      // EstOXCoord var22 var23

      // if Equal AirGroundState 1
      //   GetAttribute var17 40; 0
      // else
      //   GetAttribute var17 136; 0
      // endif
      // var17 = var17 * var23
      // var17 *= OPos
      // var17 += TopNX

      // if var17 < var22 && OPos < 0
      //   DynamicDiceAdd 0 11 5
      // elif var17 > var22 && OPos > 0
        DynamicDiceAdd 0 11 8
      // endif
    endif

    if OYDistFloor > 1 && OYDistFloor < 8
      DynamicDiceAdd 0 2 2.5
    endif

    var22 = PT_BAITCHANCE
    if OCurrAction >= 26 && OCurrAction <= 29
      var22 *= 2.5
    endif
    DynamicDiceAdd 0 12 var22
  Return
endif

// disadvantage (very similar to advantage - basically just reversed)
if OFramesHitstun <= 0

  var22 = TopNY - OTopNY - OHurtboxSize
  if var22 > 40
    Goto disadvantage_priorities
  elif True
    // otherwise if the opponent is 4/10ths of the way to the ledge relative to their direction from you
    Goto approxStageWidth
    var17 *= -0.4 * OPos
    // take aggression and bravery into account
    // var23 = (0.5 + PT_AGGRESSION) * (0.5 + PT_BRAVECHANCE) + 1
    // var17 /= var23
    GetYDistFloorOffset var22 var17 5 1
    var23 = OTopNX + var17
    DrawDebugLine OTopNX OCenterY var23 OCenterY 255 0 0 221
    if Equal var22 -1
      Goto disadvantage_priorities
    endif
  endif
endif
if !(True)
  label disadvantage_priorities
    // the greater the damage, the more incentive there is to go for a kill (less so than pure advantage)
    var22 = ODamage * (100 + OWeight - 100) / 4000
    DynamicDiceAdd 0 0 var22
    
    // perhaps try to wall them out
    var22 = (1 - PT_AGGRESSION) * 4
    DynamicDiceAdd 0 7 var22

    var22 = PT_BRAVECHANCE * 4
    DynamicDiceAdd 0 13 var22

    var22 = PT_AGGRESSION * 4
    DynamicDiceAdd 0 5 var22
  Return
endif
// edgeguard
if !(True)
  label edgeguard_priorities
    // the greater the damage, the more incentive there is to go for a kill (less so than pure advantage)
    var22 = ODamage * (100 + OWeight - 100) / 2000
    DynamicDiceAdd 0 0 var22
    
    DynamicDiceAdd 0 9 12
  Return
endif

DynamicDiceRoll 0 var11 0



// ///////////////////////////////////////////////////////////////
// var11 results
// ///////////////////////////////////////////////////////////////

if Equal var21 7.1
  var11 = 8
endif

DynamicDiceClear 0

// ///////////////////////////////////////////////////////////////
// attack rolls
// ///////////////////////////////////////////////////////////////

EstOYCoord var22 OFramesHitstun
var23 = OHurtboxSize * 2
var22 -= TopNY 
var22 -= var23

var12 = 1
PredictOMov var23 7 LevelValue
var23 *= 0.2
if CurrAction >= 26 && CurrAction <= 29
elif Equal CurrSubaction JumpSquat || CalledFrom Shield
elif YDistFloor > 20 || OYDistFloor > 20
elif var22 > 30
elif YDistFloor > 8 && XDistLE 15
elif OCurrAction >= 66 && OCurrAction <= 100 && var22 > 20
else
  var12 = 0
endif

if var21 >= 16.7 && OXDistBackEdge < 50 && OYDistBackEdge < 20
  var12 = 1
elif Equal YDistFloor -1
  var12 = 1
endif

DynamicDiceClear 0
DynamicDiceAdd 0 0 0.3333333333333333
DynamicDiceAdd 0 1 0.3333333333333333
DynamicDiceAdd 0 2 0.3333333333333333
DynamicDiceAdd 0 3 1
DynamicDiceAdd 0 4 1
DynamicDiceAdd 0 5 1
DynamicDiceAdd 0 6 1
DynamicDiceAdd 0 7 1
DynamicDiceAdd 0 8 1
DynamicDiceAdd 0 9 0.5
DynamicDiceAdd 0 10 0.5
DynamicDiceAdd 0 11 1
DynamicDiceAdd 0 12 0.5
DynamicDiceAdd 0 13 0.5
DynamicDiceAdd 0 14 1
DynamicDiceAdd 0 15 0.5
DynamicDiceAdd 0 16 0.5
DynamicDiceAdd 0 17 1
DynamicDiceAdd 0 19 0.2
DynamicDiceAdd 0 20 0.2
DynamicDiceAdd 0 21 0.2
DynamicDiceAdd 0 22 0.2
DynamicDiceAdd 0 23 0.5
DynamicDiceAdd 0 24 0.5
DynamicDiceAdd 0 25 1
DynamicDiceAdd 0 26 1
DynamicDiceAdd 0 27 1
DynamicDiceAdd 0 28 0.5
DynamicDiceAdd 0 29 0.5

// ///////////////////////////////////////////////////////////////
// hardcoded situations
// ///////////////////////////////////////////////////////////////

// if Equal var11 0
//   LOGSTR_NL 1263094784 1275068416 0 0 0
//   {KILL_MOVES}
// elif Equal var11 1
//   LOGSTR_NL 1129270528 1112473600 0 0 0
//   {COMBO_MOVES}
// elif Equal var11 2
//   LOGSTR_NL 1413825280 1212368896 1095976192 0 0
//   {TECHCHASE_MOVES}
// elif Equal var11 3
//   LOGSTR_NL 1347568896 1397970176 1380253696 0 0
//   {PRESSURE_MOVES}
// elif Equal var11 4
//   LOGSTR_NL 1112687872 1095451392 1124073472 0 0
//   {BREAKCC_MOVES}
// elif Equal var11 5
//   LOGSTR_NL 1163084544 1095779584 1129271808 1313165824 0
//   {ESCAPECORNER_MOVES}
// elif Equal var11 6
//   LOGSTR_NL 1279350016 1313032192 0 0 0
//   {LAUNCH_MOVES}
// elif Equal var11 7
//   LOGSTR_NL 1347373824 1157627904 0 0 0
//   {POKE_MOVES}
// elif Equal var11 8
//   LOGSTR_NL 1128353024 1342177280 0 0 0
//   // DynamicDiceClear 0
//   {CAMP_MOVES}
// elif Equal var11 9
//   LOGSTR_NL 1162102528 1162302720 1095910400 0 0
//   {EDGEGUARD_MOVES}
// elif Equal var11 10
//   LOGSTR_NL 1095652352 1229015296 1375731712 0 0
//   {ANTIAIR_MOVES}
// elif Equal var11 11
//   LOGSTR_NL 1129270784 1447383552 1397313280 1308622848 0
//   {CONVERSION_MOVES}
// elif Equal var11 12
//   LOGSTR_NL 1179795712 1296389120 1380012032 0 0
//   {FRAMETRAP_MOVES}
// elif Equal var11 13
//   LOGSTR_NL 1129467648 1397970176 1342177280 0 0
//   {CROSSUP_MOVES}
// elif Equal var11 14
//   LOGSTR_NL 1245790720 1380274944 1163132928 0 0
//   {JABRESET_MOVES}
// endif

if Equal var21 0
  LOGSTR_NL 1852797952 1751739904 1728053248 0 0
elif Equal var21 3
  LOGSTR_NL 1919247104 1870030080 1912602624 0 0
elif Equal var21 7
  LOGSTR_NL 1667854848 1668048128 1130458368 1879048192 0
elif Equal var21 7.1
  LOGSTR_NL 1667329280 1885298944 1953784064 1667956736 0
elif Equal var21 10
  LOGSTR_NL 1650551040 1946157056 0 0 0
elif Equal var21 10.1
  LOGSTR_NL 1650551040 1952407808 1953784064 1667956736 0
elif Equal var21 10.2
  LOGSTR_NL 1650551040 1952412416 1751737600 1818492928 0
elif Equal var21 10.3
  LOGSTR_NL 1650551040 1952408320 1701737472 1701969920 0
elif Equal var21 10.4
  LOGSTR_NL 1650551040 1952413440 1634300928 0 0
elif Equal var21 10.5
  LOGSTR_NL 1650551040 1952408576 1634953216 1684106752 1667563520
elif Equal var21 10.6
  LOGSTR_NL 1650551040 1952408576 1634953216 1635213568 2035771392
elif Equal var21 12
  LOGSTR_NL 1768835072 1769239296 1953852928 0 0
elif Equal var21 13
  LOGSTR_NL 1684366848 1701733376 0 0 0
elif Equal var21 15
  LOGSTR_NL 1818584064 1734672384 0 0 0
elif Equal var21 15.1
  LOGSTR_NL 1818584064 1734696704 1701078784 1701278976 1634886656
elif Equal var21 16
  LOGSTR_NL 1635021824 1633905408 0 0 0
elif Equal var21 16.1
  LOGSTR_NL 1635021824 1633905408 1601140224 1701999360 1752133376
elif Equal var21 16.2
  LOGSTR_NL 1635021824 1633905408 1601531392 1684369920 1936224000
elif Equal var21 16.3
  LOGSTR_NL 1635021824 1633905408 1601659136 1819017216 0
elif Equal var21 16.4
  LOGSTR_NL 1635021824 1633905408 1601332480 1986359808 1935764480
elif Equal var21 16.5
  LOGSTR_NL 1635021824 1633905408 1601398784 1768254464 1682994432
elif Equal var21 16.6
  LOGSTR_NL 1635021824 1633905408 1600352768 1869837056 1970274304
elif Equal var21 16.7
  LOGSTR_NL 1701078784 1701278976 1634886656 0 0
elif Equal var21 16.8
  LOGSTR_NL 1701078784 1701278976 1634886656 1600939264 1684497664
elif Equal var21 16.9
  LOGSTR_NL 1919247104 1870030080 1918857728 1702257920 1920164096
elif Equal var21 17
  LOGSTR_NL 1819896064 1852243968 0 0 0
endif

// {COMBO_ROUTINES}

// perform these expensive calculations once for efficiency
if LevelValue >= 60
  GetAttribute var22 40; 0
  GetAttribute var17 136; 0
  if var17 > var22
    STACK_PUSH var17 1
  else
    STACK_PUSH var22 1
  endif

  GetAttribute var22 72; 0
  STACK_PUSH var22 1

  Goto getOEndlag
  STACK_PUSH var22 1
  
  var22 = OTopNX
  var23 = OTopNY
  STACK_PUSH var23 1 // OTopNY
  STACK_PUSH var22 1 // OTopNX
  EstOYCoord var17 10 
  var17 -= OTopNY
  var17 += OYDistFloor
  if var17 < 0
    var17 = 0
  endif
  STACK_PUSH var17 1 // EstOYDistFloor
  STACK_PUSH TopNX 1
  STACK_PUSH TBoundary 1
  if var22 > 0
    STACK_PUSH RBoundary 1
  else
    STACK_PUSH LBoundary 1
  endif
  Goto approxStageWidth
  STACK_PUSH var17 1 // stageWidth
endif

var18 = 60 * ((6 - PlayerCount) * 0.25)
SeekNoCommit __DICE_LOOP__
if !(True)
  label __DICE_LOOP__
  DynamicDiceRoll 0 var20 1
  if Equal var20 -1 
    var18 -= 1
    if var18 <= 0
      SeekNoCommit __DICE_LOOP_END__
    elif Equal var20 -1 
      SeekNoCommit __DICE_LOOP__
    endif
  endif 
  var22 = 19
STACK_PUSH 6 0
STACK_PUSH 4 0
STACK_PUSH 13 0
STACK_PUSH 10 0
STACK_PUSH 9 0
STACK_PUSH 8 0
STACK_PUSH 7 0
STACK_PUSH 0 0
STACK_PUSH 3 0
STACK_PUSH 0 0
STACK_PUSH 5 0
STACK_PUSH 1 0
  XGoto GetChrSpecific
  XReciever

  Goto __ADDITIONAL_FILTERS__
  if Equal var20 -1 
    SeekNoCommit __DICE_LOOP__
  endif
  if LevelValue >= 75
    Goto __DI_ANGLE__
  endif

  Goto check_hub
  var18 -= 1
  if var18 <= 0
    SeekNoCommit __DICE_LOOP_END__
  endif
  SeekNoCommit __DICE_LOOP__
  Return
  label __DICE_LOOP_END__
endif

if !(True)
  label __ADDITIONAL_FILTERS__
  if Equal var12 1
if !(True) || Equal var20 11|| Equal var20 14|| Equal var20 23|| Equal var20 24|| Equal var20 25|| Equal var20 26|| Equal var20 27|| Equal var20 28|| Equal var20 29
    else
      var20 = -1
      Return
    endif
  endif
  if Equal var21 7.1
    if var10 > 0 && var8 < 10
      var20 = -1
    endif
  elif Equal var10 0
    if Equal var21 10.1 || Equal var21 16.3
if !(True) || Equal var20 18 || Equal var20 19 || Equal var20 20 || Equal var20 21 || Equal var20 22
        var20 = -1
      endif
    else
      var20 = -1
      Return
    endif
  endif
//   {ADDITIONAL_FILTERS}
  Return
endif

if !(True)
  label __DI_ANGLE__
  predictOOption var22 5 LevelValue
  predictionConfidence var23 5 LevelValue
  var23 *= 3
  if Rnd < var23
    if Equal var22 1
      if var1 > 90 && var1 < 180
        var1 += 8
      elif var1 > 270
        var1 += 8
      else
        var1 -= 8
      endif
    elif Equal var22 3
      if var1 > 90 && var1 < 180
        var1 -= 8
      elif var1 > 270
        var1 -= 8
      else
        var1 += 8
      endif
    endif
  endif
  Return
endif

DynamicDiceRoll 1 var20 0

// {POST_CHOICE_FILTER}

LOGVAL var20
LOGSTR 1128812288 1397050880 541152256 1413563136 1258291200
if Equal var20 0
LOGSTR 1247896064 825373440 0 0 0 // Jab123
elif Equal var20 1
LOGSTR 1784766976 825373440 838860800 0 0 // jab1232
elif Equal var20 2
LOGSTR 1784766976 825373440 855638016 0 0 // jab1233
elif Equal var20 3
LOGSTR 1147237120 1749120000 1952539392 1795162112 0 // DashAttack
elif Equal var20 4
LOGSTR 1179937024 1819541504 0 0 0 // FTilt
elif Equal var20 5
LOGSTR 1431595264 1819541504 0 0 0 // UTilt
elif Equal var20 6
LOGSTR 1146382592 1819541504 0 0 0 // DTilt
elif Equal var20 7
LOGSTR 1179872512 1634953216 0 0 0 // FSmash
elif Equal var20 8
LOGSTR 1431530752 1634953216 0 0 0 // USmash
elif Equal var20 9
LOGSTR 1146318080 1634953216 0 0 0 // DSmash
elif Equal var20 10
LOGSTR 1685286144 1634953216 1214870528 838860800 0 // dsmashHit2
elif Equal var20 11
LOGSTR 1314091008 1701013760 1634484480 1769078784 0 // NSpecialAir
elif Equal var20 12
LOGSTR 1431531520 1701013760 1634467840 0 0 // USpecial
elif Equal var20 13
LOGSTR 1970499584 1701013760 1634487296 1635017984 0 // uspecialLate
elif Equal var20 14
LOGSTR 1431531520 1701013760 1634484480 1769078784 0 // USpecialAir
elif Equal var20 15
LOGSTR 1146318848 1701013760 1634467840 0 0 // DSpecial
elif Equal var20 16
LOGSTR 1685286912 1701013760 1634486272 1769209856 0 // dspecialHit
elif Equal var20 17
LOGSTR 1397977088 1701013760 1634467840 0 0 // SSpecial
elif Equal var20 18
LOGSTR 1198678272 1644167168 0 0 0 // Grab
elif Equal var20 19
LOGSTR 1718904832 1919907584 0 0 0 // fthrow
elif Equal var20 20
LOGSTR 1685350400 1919907584 0 0 0 // dthrow
elif Equal var20 21
LOGSTR 1651795968 1919907584 0 0 0 // bthrow
elif Equal var20 22
LOGSTR 1970563072 1919907584 0 0 0 // uthrow
elif Equal var20 23
LOGSTR 1312909568 1912602624 0 0 0 // NAir
elif Equal var20 24
LOGSTR 1851877632 1918330112 1634402304 0 0 // nairWeak
elif Equal var20 25
LOGSTR 1178691840 1912602624 0 0 0 // FAir
elif Equal var20 26
LOGSTR 1111582976 1912602624 0 0 0 // BAir
elif Equal var20 27
LOGSTR 1430350080 1912602624 0 0 0 // UAir
elif Equal var20 28
LOGSTR 1145137408 1912602624 0 0 0 // DAir
elif Equal var20 29
LOGSTR 1684105472 1917674752 1952804608 1912602624 0 // dairMeteor
endif
PRINTLN

DynamicDiceClear 0
DynamicDiceClear 1
// Seek _ENDCALC_
// ///////////////////////////////////////////////////////////////
// attack post-processing
// ///////////////////////////////////////////////////////////////

// if !(Equal var20 -1)
//   if Equal var11 7
//     var21 = 16.2
//     if CHANCE_MUL_LE PT_AGGRESSION 0.25
//       var21 = 16
//     endif
//     $ifLastOrigin(grab,0)
//       var21 = 16
//     endif
//     SeekNoCommit _ENDCALC_
//   elif Equal var11 13
//     predictAverage var22 10 LevelValue
//     var22 += 15
//     if XDistLE var22
//       if Equal AirGroundState 1 && CHANCE_MUL_GE PT_JUMPINESS 1
//         var21 = 16.4
//         var15 = -1
//         var16 = 5
//         CallI DashScr
//       else
//         var21 = 16.4
//         var15 = -1
//         var16 = 1
//         if CHANCE_MUL_LE PT_JUMPINESS 1.25
//           var16 += 0.1
//         endif
//         CallI JumpScr
//       endif
//     endif
//   endif
// endif

// if Equal var11 8 || Equal var11 7 || Equal var11 9
//   SeekNoCommit _ENDCALC_
// // elif Equal CurrAction 73 || Equal var21 13
// //   if !(Equal var20 -1)
// //     var15 = -1
// //     var21 = 16.4
// //   endif
// //   CallI MainHub
// endif

// // predictionConfidence var22 9 LevelValue
// // predictOOption var17 9 LevelValue
// // var23 = 0
// // if OCurrAction >= 66 && OCurrAction <= 100 && !(Equal OCurrAction 73)
// //   var23 = 1
// // endif
// // if var21 >= 16.7
// // elif Rnd < var22 && Equal var17 1 && Equal var21 16 && OYDistBackEdge > -20 && OFramesHitstun <= 0 && Equal HitboxConnected 0 && Equal var23 0 
// //   predictOOption var22 8 LevelValue 
// //   if Equal var22 2
// //     var21 = 16.1
// //   elif Equal var22 3
// //     var21 = 16.2
// //   endif
// // elif Equal var11 7 && CHANCE_MUL_GE PT_AGGRESSION 0.2
// //   var21 = 16.2
// // endif

// // $ifLastOrigin(grab,0)
// //   if Equal var21 16.2
// //     var21 = 16
// //   endif
// // endif

// // var22 *= 2
// // $ifAerialAttack()
// // elif YDistBackEdge < -45 || OYDistBackEdge < -20
// //   var20 = -1 
// // elif Rnd < var22 && Equal var17 3
// //   $ifLastAttack(uthrow)
// //   $elifLastAttack(bthrow)
// //   $elifLastAttack(fthrow)
// //   $elifLastAttack(dthrow)
// //   else
// //     var20 = -1
// //   endif
// // endif

// // GET_CHAR_TRAIT(var22, 200)
// // if Equal var22 1
// // elif var21 >= 16.7
// // elif CHANCE_MUL_LE PT_WALL_CHANCE 1 && Equal var21 16 && SamePlane && OFramesHitstun <= 0
// //   var22 = TopNX
// //   var17 = OTopNX
// //   Abs var22
// //   Abs var17

// //   // if var22 < var17 && var8 > 4
// //   //   var21 = 16.3
// //   // endif
// // endif
// SeekNoCommit _ENDCALC_
// Return

// label _ENDCALC_
XGoto SetAttackGoal
XReciever
Return

// ///////////////////////////////////////////////////////////////
// check hub/types/adder
// ///////////////////////////////////////////////////////////////

label check_hub

  var15 = 0

  if YDistFloor < 20 && !(Equal YDistFloor -1) 
    var22 = 0
if !(True) || Equal var20 23 || Equal var20 24
      GetAttribute var22 300; 0
elif !(True) || Equal var20 25
      GetAttribute var22 304; 0
elif !(True) || Equal var20 28 || Equal var20 29
      GetAttribute var22 316; 0
elif !(True) || Equal var20 26
      GetAttribute var22 308; 0
elif !(True) || Equal var20 27
      GetAttribute var22 312; 0
    endif
    if !(Equal var22 0) 
      if Equal AirGroundState 2
        var22 *= 0.5
      else
        GetAttribute var23 940; 0
        var7 += var23 + 1
        GetAttribute var23 112; 0
        if var23 > 0.06
          var22 *= 0.5
        endif
      endif

      if var22 <= var9
        var9 = var22
      endif
    endif
  endif

//   {FILTER_CHECKS}

if Equal var20 0
LOGSTR 1247896064 825373440 0 0 0 // Jab123
elif Equal var20 1
LOGSTR 1784766976 825373440 838860800 0 0 // jab1232
elif Equal var20 2
LOGSTR 1784766976 825373440 855638016 0 0 // jab1233
elif Equal var20 3
LOGSTR 1147237120 1749120000 1952539392 1795162112 0 // DashAttack
elif Equal var20 4
LOGSTR 1179937024 1819541504 0 0 0 // FTilt
elif Equal var20 5
LOGSTR 1431595264 1819541504 0 0 0 // UTilt
elif Equal var20 6
LOGSTR 1146382592 1819541504 0 0 0 // DTilt
elif Equal var20 7
LOGSTR 1179872512 1634953216 0 0 0 // FSmash
elif Equal var20 8
LOGSTR 1431530752 1634953216 0 0 0 // USmash
elif Equal var20 9
LOGSTR 1146318080 1634953216 0 0 0 // DSmash
elif Equal var20 10
LOGSTR 1685286144 1634953216 1214870528 838860800 0 // dsmashHit2
elif Equal var20 11
LOGSTR 1314091008 1701013760 1634484480 1769078784 0 // NSpecialAir
elif Equal var20 12
LOGSTR 1431531520 1701013760 1634467840 0 0 // USpecial
elif Equal var20 13
LOGSTR 1970499584 1701013760 1634487296 1635017984 0 // uspecialLate
elif Equal var20 14
LOGSTR 1431531520 1701013760 1634484480 1769078784 0 // USpecialAir
elif Equal var20 15
LOGSTR 1146318848 1701013760 1634467840 0 0 // DSpecial
elif Equal var20 16
LOGSTR 1685286912 1701013760 1634486272 1769209856 0 // dspecialHit
elif Equal var20 17
LOGSTR 1397977088 1701013760 1634467840 0 0 // SSpecial
elif Equal var20 18
LOGSTR 1198678272 1644167168 0 0 0 // Grab
elif Equal var20 19
LOGSTR 1718904832 1919907584 0 0 0 // fthrow
elif Equal var20 20
LOGSTR 1685350400 1919907584 0 0 0 // dthrow
elif Equal var20 21
LOGSTR 1651795968 1919907584 0 0 0 // bthrow
elif Equal var20 22
LOGSTR 1970563072 1919907584 0 0 0 // uthrow
elif Equal var20 23
LOGSTR 1312909568 1912602624 0 0 0 // NAir
elif Equal var20 24
LOGSTR 1851877632 1918330112 1634402304 0 0 // nairWeak
elif Equal var20 25
LOGSTR 1178691840 1912602624 0 0 0 // FAir
elif Equal var20 26
LOGSTR 1111582976 1912602624 0 0 0 // BAir
elif Equal var20 27
LOGSTR 1430350080 1912602624 0 0 0 // UAir
elif Equal var20 28
LOGSTR 1145137408 1912602624 0 0 0 // DAir
elif Equal var20 29
LOGSTR 1684105472 1917674752 1952804608 1912602624 0 // dairMeteor
endif
  // PRINTLN

  if Equal var11 14
    Goto jabreset_check
  elif Equal var10 0 && var4 >= 0
    var15 = 350
  elif !(Equal var21 16.3)
    // "lol" said the programmer, "lmao"
    RESET_LTF_STACK_PTR
    CalcMoveWeight var15 ODamage OWeight var1 var4 var6 var7 var8 var9 var10 var13 LTF_STACK_READ LTF_STACK_READ LTF_STACK_READ LTF_STACK_READ LTF_STACK_READ LTF_STACK_READ LTF_STACK_READ LTF_STACK_READ LTF_STACK_READ LTF_STACK_READ
elif !(True) || Equal var20 18 || Equal var20 19 || Equal var20 20 || Equal var20 21 || Equal var20 22
    Return
  else
    var15 = 20
  endif

  Goto dirCheck

  PRINTLN
Return
label jabreset_check
  // I know, it's supposed to be moves that deal < 7% but at this
  // point i'm out of variables lmao
  if var10 <= 7
    var15 += 1000
  endif
Return
label dirCheck
  LOGSTR 1111577344 1157627904 0 0 0
  LOGVAL var15
  
  // O above

  var22 = 0.002
  XGoto GetChrSpecific
  XReciever
var17 = var22

  if !(Equal var17 0)
    EstOYCoord var22 15
    var23 = var22
    var23 += HurtboxSize
    if var23 > OTopNY
      if var17 > 0 || OFramesHitstun > 0
        var15 *= 1.75
      else
        var15 *= 0.1
      endif
    endif

    // O below
    var23 = var22
    if var23 <= TopNY
      if var17 < 0 || OFramesHitstun > 0 || Equal OIsOnStage 0
        var15 *= 3.5
      else
        var15 *= 0.1
      endif
    endif
    LOGSTR 1497647360 1381171200 0 0 0
    LOGVAL var15
  endif

  // O mid
  // var17 = TopNY - OTopNY
  // Abs var17
  // var23 = HurtboxSize + OHurtboxSize
  // var23 *= 0.5
  // if var17 <= var23
  //   if Equal var17 0 
  //     var15 *= 1.35
  //   else
  //     var15 *= 0.25
  //   endif
  // endif

   

  var22 = 0.001
  XGoto GetChrSpecific
  XReciever
  var17 = var7 * XSpeed + TopNX - OTopNX
  Abs var17
  if OFramesHitstun < 5
    if var17 >= 20
      var23 = var3 + var5
      var22 = var5
      Abs var22
      if var22 > var23
        var23 = var22
      endif
      if var23 > 30
        var23 = 20
      endif
      var23 *= 0.5
      var15 += var23
      if Equal var21 16.3
        var15 += var23
        var15 += var23
      endif

      var23 *= 0.4
      var23 += 1
      var15 *= var23


      if Equal IsOnStage 1
        if Equal AirGroundState 1 || YDistFloor < OFramesHitstun
          if Equal Direction OPos && var22 >= 0 
            var15 *= 1.25
          elif !(Equal Direction OPos) && var22 < 0 
            var15 *= 1.25
          elif !(Equal var22 0)
            var15 *= 0.05
          endif
        endif
      endif
    elif Equal var22 0
      var15 *= 1.4
    endif
  endif
  // $ifLastOrigin(grab,0)
  //   if var17 < 35
  //     GET_CHAR_TRAIT(var22, 200)
  //     PredictOMov var17 10 LevelValue
  //     if Equal var22 1 && var17 > 0.2 && OYDistFloor < 20 && OYDistFloor > -1
  //       var15 *= 2.25
  //     endif
  //   endif
  // endif

  LOGSTR 1480870144 1375731712 0 0 0
  LOGVAL var15
  if !(Equal var21 16.3)
    Goto addIfFastHit
    LOGSTR 1179142400 1409286144 0 0 0
    LOGVAL var15
  endif
  Goto getOEndlag
  var22 += 5
  var23 = var22
  if var7 <= var22 
    var22 = var7
    var22 *= 0.1
    var22 += 1
    var15 *= var22
  endif
  LOGSTR 1329942016 1145831424 0 0 0
  LOGVAL var15
  if var15 < 3000
    if Equal var21 16.3
      if var8 <= 3
        var22 = var8 + 1
        var22 = var15 / var22
        var15 -= var22
      elif True
        var22 = var8 - 3
        var22 *= 0.15
        var15 *= var22
      endif
    endif

    Goto getEndlag
    var22 -= var23
    GetAttribute var23 40; 1
    var23 *= 1.2
    var22 *= var23
    var23 *= var8
    if Equal var21 10.1 && XDistLE var23
      Return
    elif Equal var4 -1 && XDistLE var23
      Return
    endif
    if var22 > 20 || Equal var21 16.3
      if Equal var21 16.3
        var15 -= var22
        var22 *= 0.05
      else
        var22 -= 20
        var22 *= 0.005
      endif
      var22 += 1
      var15 /= var22
    endif
    if !(Equal var21 16.3)
if Equal var20 18
elif !(True) || Equal var20 18 || Equal var20 19 || Equal var20 20 || Equal var20 21 || Equal var20 22
        PredictOMov var23 10 LevelValue
        if var23 > 0.15 && !(Equal var16 1)
          var23 = 100 * var23
          var15 += var23
          var23 *= 0.1
          var15 *= var23
        endif
        if OCurrAction >= 26 && OCurrAction <= 29 && YDistFloor < 25
          var15 += 20
          var15 *= 3
        endif
      endif
    endif

    LOGSTR 1398752512 1313098752 0 0 0
    LOGVAL var15
  endif
    
  var22 = LevelValue / 100
  var23 = Rnd
  if var23 < var22
    var23 = var22
  endif
  var15 *= var23
  LOGSTR 1179209216 1095499776 0 0 0
  LOGVAL var15
  if var15 > 0
    DynamicDiceAdd 1 var20 var15
  endif
Return
label getEndlag
  var22 = var7 + var8
  var22 = var9 - var22
if !(True) || Equal var20 11|| Equal var20 14|| Equal var20 23|| Equal var20 24|| Equal var20 25|| Equal var20 26|| Equal var20 27|| Equal var20 28|| Equal var20 29
    if Equal IsOnStage 1
      var22 = var9
    endif
  endif
Return
label getOEndlag
  var22 = 0.003
  XGoto GetChrSpecific
  XReciever
Return
label addIfFastHit
  var22 = var7
  var22 -= 15
if !(True) || Equal var20 11|| Equal var20 14|| Equal var20 23|| Equal var20 24|| Equal var20 25|| Equal var20 26|| Equal var20 27|| Equal var20 28|| Equal var20 29
    if Equal AirGroundState 1
      var22 += 6
    endif
  endif
  if var22 < 0
    var22 = 15 - var7
    if Equal var16 1
if !(True) || Equal var20 18 || Equal var20 19 || Equal var20 20 || Equal var20 21 || Equal var20 22
        var15 *= 0
      endif
      var22 *= 0.4
    else
      GetCommitPredictChance var23 LevelValue
      if var23 > 0.2
        var22 *= 0.6
      else 
        var22 *= 0.25
      endif
    endif
    var22 += 1
    var15 *= var22
  endif
Return
label approxStageWidth
  GetColDistPosAbs var22 var23 0 -5 -10000 -5 0
  GetColDistPosAbs var17 var23 var22 -5 10000 -5 0
  var17 -= var22
Return
Return
