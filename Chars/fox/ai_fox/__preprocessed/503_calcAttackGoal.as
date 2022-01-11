#include <Definition_AIMain.h>
id 0x8503
unk 0x0

XReciever

// yep, move choice is COOOOOMPLICATED lmao

// $generateChecks(check_hub)

predictOOption var22 8 LevelValue 
var23 = 0
if OCurrAction >= 66 && OCurrAction <= 100 && !(Equal OCurrAction 73)
  var23 = 1
endif
if !(Equal var22 2) && !(Equal var21 16.5) && !(CalledFrom FastAerial) && Equal var21 16 && !(Equal var21 7.1) && OFramesHitstun <= 0 && Equal var23 0
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
elif Equal var21 7.1 || Equal var21 10.1 || Equal var21 10.2 || Equal var21 13
elif !(Equal var21 16.3)
  var21 = 16
endif
if OFramesHitstun >= 1 && !(Equal var21 16.5)
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
      var23 = PT_AGGRESSION * 3
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

    var22 = 5 * PT_AGGRESSION
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
if OCurrAction <= 65 || OCurrAction >= 190
elif Equal HitboxConnected 1 || OFramesHitlag > 0 || OFramesHitstun > 0
  Goto punish_priorities
elif OPrevAction >= 67 && OPrevAction <= 100  
  Goto punish_priorities
endif
if !(True)
  label punish_priorities
    // the greater the damage, the more incentive there is to go for a kill
    var22 = ODamage * (100 + OWeight - 100) / 900
    DynamicDiceAdd 0 0 var22

    // calculate if we can arrive to the target's position as their hitstun ends
    if OFramesHitstun > 0
      var23 = OFramesHitstun

      EstOXCoord var22 var23

      if Equal AirGroundState 1
        GetAttribute var17 40; 0
      else
        GetAttribute var17 136; 0
      endif
      var17 = var17 * var23
      var17 *= OPos
      var17 += TopNX

      if var17 < var22 && OPos < 0
        DynamicDiceAdd 0 1 4
      elif var17 > var22 && OPos > 0
        DynamicDiceAdd 0 1 4
      endif
    elif OCurrAction >= 77 && OCurrAction <= 100
      DynamicDiceAdd 0 2 4
    else
      // otherwise see if we can make a conversion
      var23 = 20

      EstOXCoord var22 var23

      if Equal AirGroundState 1
        GetAttribute var17 40; 0
      else
        GetAttribute var17 136; 0
      endif
      var17 = var17 * var23
      var17 *= OPos
      var17 += TopNX

      if var17 < var22 && OPos < 0
        DynamicDiceAdd 0 11 2
      elif var17 > var22 && OPos > 0
        DynamicDiceAdd 0 11 2
      endif
    endif

    if OYDistFloor > 1 && OYDistFloor < 8
      DynamicDiceAdd 0 2 2.5
    endif

    var22 = PT_BAITCHANCE * 5
    if OCurrAction >= 26 && OCurrAction <= 29
      var22 *= 2.5
    endif
    DynamicDiceAdd 0 12 var22
  Return
endif

// disadvantage (very similar to advantage - basically just reversed)

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

DynamicDiceRoll 0 var7 0


// ///////////////////////////////////////////////////////////////
// var7 results
// ///////////////////////////////////////////////////////////////

if Equal var21 7.1
  var7 = 8
endif

DynamicDiceClear 0

// ///////////////////////////////////////////////////////////////
// attack rolls
// ///////////////////////////////////////////////////////////////

var22 = OTopNY - TopNY - OHurtboxSize * 2
if CurrAction >= 26 && CurrAction <= 29
  var16 = 1
elif Equal CurrSubaction JumpSquat
  var16 = 1
elif Equal var7 3
elif YDistFloor > 15 || YSpeed > 0.2
  var16 = 1
// elif OCurrAction >= 66 && OCurrAction <= 100 && OYSpeed > 0 && var22 > 0
//   var16 = 1
endif

DynamicDiceClear 0
DynamicDiceAdd 0 0 1
DynamicDiceAdd 0 1 1
DynamicDiceAdd 0 2 1
DynamicDiceAdd 0 3 1
DynamicDiceAdd 0 4 1
DynamicDiceAdd 0 5 1
DynamicDiceAdd 0 6 1
DynamicDiceAdd 0 7 1
DynamicDiceAdd 0 8 1
DynamicDiceAdd 0 9 1
DynamicDiceAdd 0 10 1
DynamicDiceAdd 0 11 1
DynamicDiceAdd 0 12 0.2
DynamicDiceAdd 0 13 0.2
DynamicDiceAdd 0 14 0.2
DynamicDiceAdd 0 15 0.2
DynamicDiceAdd 0 16 0.2
DynamicDiceAdd 0 17 0.5
DynamicDiceAdd 0 18 0.5
DynamicDiceAdd 0 19 1
DynamicDiceAdd 0 20 0.5
DynamicDiceAdd 0 21 0.5
DynamicDiceAdd 0 22 0.5
DynamicDiceAdd 0 23 0.5
DynamicDiceAdd 0 24 1

// if Equal var7 1
//   PAUSE
// endif

// ///////////////////////////////////////////////////////////////
// hardcoded situations
// ///////////////////////////////////////////////////////////////

if Equal var7 0
  LOGSTR_NL 1263094784 1275068416 0 0 0

elif Equal var7 1
  LOGSTR_NL 1129270528 1112473600 0 0 0
  // $addToDice(1, dspecial, 1)
elif Equal var7 2
  LOGSTR_NL 1413825280 1212368896 1095976192 0 0

elif Equal var7 3
  LOGSTR_NL 1347568896 1397970176 1380253696 0 0
  // $addToDice(1, nspecialair, 1)
  // $addToDice(1, nspecialair, 1)
  // $addToDice(1, nspecialair, 1)
  // $addToDice(1, uthrow, 1)
  // $addToDice(1, uthrow, 1)
  // $addToDice(1, uthrow, 1)
  // $addToDice(1, dthrow, 1)
elif Equal var7 4
  LOGSTR_NL 1112687872 1095451392 1124073472 0 0
DynamicDiceAdd 1 10 1
elif Equal var7 5
  LOGSTR_NL 1163084544 1095779584 1129271808 1313165824 0

elif Equal var7 6
  LOGSTR_NL 1279350016 1313032192 0 0 0
  // $addToDice(1, dspecial, 1)
elif Equal var7 7
  LOGSTR_NL 1347373824 1157627904 0 0 0

elif Equal var7 8
  LOGSTR_NL 1128353024 1342177280 0 0 0
  if !(XDistLE 25)
DynamicDiceAdd 1 9 3
DynamicDiceAdd 1 8 0.1
  endif
elif Equal var7 9
  LOGSTR_NL 1162102528 1162302720 1095910400 0 0

elif Equal var7 10
  LOGSTR_NL 1095652352 1229015296 1375731712 0 0

elif Equal var7 11
  LOGSTR_NL 1129270784 1447383552 1397313280 1308622848 0

elif Equal var7 12
  LOGSTR_NL 1179795712 1296389120 1380012032 0 0

elif Equal var7 13
  LOGSTR_NL 1129467648 1397970176 1342177280 0 0

elif Equal var7 14
  LOGSTR_NL 1245790720 1380274944 1163132928 0 0

endif

var18 = 80 * ((6 - PlayerCount) * 0.25)
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
  // GotoByValue var20
  var22 = 19
STACK_PUSH 10
STACK_PUSH 9
STACK_PUSH 8
STACK_PUSH 7
STACK_PUSH 4
STACK_PUSH 3
STACK_PUSH 6
STACK_PUSH 5
STACK_PUSH 1
  XGoto GetChrSpecific
  XReciever
  Goto check_hub
  Goto __ADDITIONAL_FILTERS__
  var18 -= 1
  if var18 <= 0
    SeekNoCommit __DICE_LOOP_END__
  elif Equal var20 -1 
    SeekNoCommit __DICE_LOOP__
  endif
  SeekNoCommit __DICE_LOOP__
  Return
  label __DICE_LOOP_END__
endif

if !(True)
  label __ADDITIONAL_FILTERS__
  if Equal var16 1
if !(True) || Equal var20 9|| Equal var20 11|| Equal var20 17|| Equal var20 18|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24
    else
      var20 = -1
    endif
  endif
if Equal var20 11
    if Equal NumJumps 0
      var20 = -1
    elif Equal AirGroundState 1 && !(Equal CurrSubaction JumpSquat)
var20 = 10
    endif
elif Equal var20 14
    if OYDistFloor < 10 && Rnd < 0.6
      var20 = -1
    endif
elif Equal var20 23
    if OFramesHitstun <= 0
      var20 = -1
    endif
  endif
  Return
endif

DynamicDiceRoll 1 var20 0

Goto __ADDITIONAL_FILTERS__

DynamicDiceClear 0
DynamicDiceClear 1

// ///////////////////////////////////////////////////////////////
// attack post-processing
// ///////////////////////////////////////////////////////////////

if !(Equal var20 -1)
  if Equal var7 7
    var21 = 16.2
    if CHANCE_MUL_LE PT_AGGRESSION 0.25
      var21 = 16
    endif
    Return
  elif Equal var7 13
    predictAverage var22 10 LevelValue
    var22 += 15
    if XDistLE var22
      if Equal AirGroundState 1 && CHANCE_MUL_GE PT_JUMPINESS 1
        var21 = 16.4
        var15 = -1
        var16 = 5
        CallI DashScr
      else
        var21 = 16.4
        var15 = -1
        var16 = 1
        if CHANCE_MUL_LE PT_JUMPINESS 1.25
          var16 += 0.1
        endif
        CallI JumpScr
      endif
    endif
  elif Equal var7 12
    predictAverage var22 10 LevelValue
    var22 += 10
    if XDistLE var22
      var22 = Rnd * 15
      label frametrap_wait
        LOGSTR_NL 1179934464 1463896320 1409286144 0 0
        XGoto PerFrameChecks
        XReciever
        XGoto SetAttackGoal
        XReciever
        XGoto MoveToGoal
        XReciever
        Seek frametrap_wait
        var22 -= 1
        if var22 < 0
          var21 = 16
          var15 = -2
          CallI MainHub
        endif
      Return
    endif
  endif
endif

if Equal var7 8 || Equal var7 7 || Equal var7 9
  Return
elif Equal CurrAction 73 || Equal var21 13
  if !(Equal var20 -1)
    var15 = -1
    var21 = 16.4
  endif
  CallI MainHub
endif

predictionConfidence var22 9 LevelValue
predictOOption var17 9 LevelValue
var23 = 0
if OCurrAction >= 66 && OCurrAction <= 100 && !(Equal OCurrAction 73)
  var23 = 1
endif
if Equal var21 16.5
elif Rnd < var22 && Equal var17 1 && Equal var21 16 && OYDistBackEdge > -20 && OFramesHitstun <= 0 && Equal HitboxConnected 0 && Equal var23 0 
  predictOOption var22 8 LevelValue 
  if Equal var22 2
    var21 = 16.1
  elif Equal var22 3
    var21 = 16.2
  endif
elif Equal var7 7 && CHANCE_MUL_GE PT_AGGRESSION 0.2
  var21 = 16.2
endif

// var22 *= 2
// $ifAerialAttack()
// elif YDistBackEdge < -45 || OYDistBackEdge < -20
//   var20 = -1 
// elif Rnd < var22 && Equal var17 3
//   $ifLastAttack(uthrow)
//   $elifLastAttack(bthrow)
//   $elifLastAttack(fthrow)
//   $elifLastAttack(dthrow)
//   else
//     var20 = -1
//   endif
// endif

  var22 = 200
  XGoto GetChrSpecific
  XReciever
if Equal var22 1
elif Equal var21 16.5
elif CHANCE_MUL_LE PT_WALL_CHANCE 1 && Equal var21 16 && SamePlane && OFramesHitstun <= 0
  var22 = TopNX
  var17 = OTopNX
  Abs var22
  Abs var17

  // if var22 < var17 && var8 > 4
  //   var21 = 16.3
  // endif
endif

XGoto SetAttackGoal
XReciever
Return

// ///////////////////////////////////////////////////////////////
// check hub/types/adder
// ///////////////////////////////////////////////////////////////

label check_hub

  var15 = 0

  if YDistFloor < 20 && !(Equal YDistFloor -1) 
if !(True) || Equal var20 17 || Equal var20 18
      GetAttribute var22 300; 0
elif !(True) || Equal var20 19
      GetAttribute var22 304; 0
elif !(True) || Equal var20 24
      GetAttribute var22 316; 0
elif !(True) || Equal var20 20 || Equal var20 21
      GetAttribute var22 308; 0
elif !(True) || Equal var20 22 || Equal var20 23
      GetAttribute var22 312; 0
    endif
    if Equal AirGroundState 2
      var22 *= 0.5
    else
      GetAttribute var23 940; 0
      var7 += var23 + 1
      var22 *= 0.8
    endif

    if var22 <= var9
      var9 = var22
    endif
  endif

//   {FILTER_CHECKS}

  // LOGVAL var10
  if Equal var7 0
    Goto kill_check
  elif Equal var7 1
    Goto combo_check
  elif Equal var7 2
    Goto techchase_check
  elif Equal var7 3
    Goto pressure_check
  elif Equal var7 4
    Goto breakcc_check
  elif Equal var7 5
    Goto escapecorner_check
  elif Equal var7 6
    Goto launch_check
  elif Equal var7 7
    Goto poke_check
  elif Equal var7 8
    Goto camp_check
  elif Equal var7 9
    Goto edgeguard_check
  elif Equal var7 10
    Goto antiair_check
  elif Equal var7 11
    Goto conversion_check
  elif Equal var7 12
    Goto frametrap_check
  elif Equal var7 13
    Goto crossup_check
  elif Equal var7 14
    Goto jabreset_check
  endif

  Goto dirCheck
Return
label kill_check
  if OFramesHitstun > 0
    var23 = var7 + OFramesHitstun
    EstOXCoord var11 var23
    EstOYCoord var12 var23
  else
    var11 = OTopNX
    var12 = OTopNY
  endif
  Goto __KILL__
  if !(True)
    label __KILL__
    // LOGSTR 1262708736 1799643392 1952514048 0 0
    COS var22 var1
    var22 *= var10
    var22 *= OPos
    var22 *= 0.03
    var22 *= var10 * 0.4 * 8
    var17 = RBoundary - (var11)
    // LOGSTR 1380057088 0 0 0 0
    // LOGVAL var22
    // LOGVAL var17
    if var22 > var17
      var0 = 1
      Return
    endif
    var17 = LBoundary - (var11)
    // LOGSTR 1279393792 0 0 0 0
    // LOGVAL var22
    // LOGVAL var17
    if var22 < var17
      var0 = 1
      Return
    endif
    var17 = TBoundary - (var12)
    SIN var22 var1
    var22 *= var10
    var22 *= 0.03
    var22 *= var10 * 0.4 * 8
    // LOGSTR 1413611520 0 0 0 0
    // LOGVAL var22
    // LOGVAL var17
    if var22 > var17
      var0 = 1
      Return
    endif
    var0 = 0
    Return
  endif
  if Equal var0 1
    var15 += 2
  endif
Return
label combo_check
  Goto kill_check

  var17 = var10 * 0.4
  var22 = 200
  XGoto GetChrSpecific
  XReciever
  if Equal var22 1 && Equal OIsOnStage 1
    var23 = OTopNY - YDistBackEdge + 15
    EstOPassTimeY var17 var23
  endif
  Goto getEndlag
  if OYDistFloor < 4 && var10 <= 90 && CHANCE_MUL_GE PT_BRAVECHANCE 0.7
    var22 += 0 // leeway room (CC)
  else
    var22 -= 8 // leeway room
  endif
  if var22 < var17 && var10 >= 65
    Goto combo_check_pt2
  elif var22 <= 15 && var7 <= 8
    Goto combo_check_pt2
  endif
Return
label combo_check_pt2
  var0 = 1

  if !(Equal var0 0) 
    // var17 = var9 - (var7 + var8)
    var23 = var22
    Goto getEndlag
    var23 -= var22
    GetAttribute var22 40; 0
    var22 *= var23 * 1.75
    GetAttribute var17 136; 0
    var17 *= var23 * 1.75
    
    COS var0 var1
    var0 *= (var10 * 0.03) * var23
    if var1 >= 230 && var1 <= 310
    elif var1 >= 55 && var1 <= 105
    elif var22 > var0 || var17 > var0
    else
      var0 = 0
    endif
  endif

  if !(Equal var0 0)
    var15 += 1
  endif
Return
label techchase_check
  Goto combo_check
Return
label pressure_check
  Goto getEndlag
  if var22 < 20 || var7 < 20
    var15 += 1
    Goto fastCheck
  endif
Return
label breakcc_check
  if var10 >= 120
    var15 += 1
elif !(True) || Equal var20 12 || Equal var20 13 || Equal var20 14 || Equal var20 15 || Equal var20 16
    var15 += 1.5
  endif
Return
label escapecorner_check
  Goto fastCheck
Return
label launch_check
  // Goto combo_check_pt2

  var22 = 60
  if ODamage > 50
    var22 = 100
  endif
  if var10 < var22
  else
    var15 += 1
  endif
Return
label poke_check
  Goto getEndlag
 
  var17 = var5 + var3
  if var22 < 15 && var7 < 30 && var17 > 5
    Goto fastCheck
  endif 
Return
label camp_check
  Goto poke_check
Return
label edgeguard_check
if !(True) || Equal var20 12 || Equal var20 13 || Equal var20 14 || Equal var20 15 || Equal var20 16
    var15 += 0.35
    Return
  endif

  Goto kill_check
  var22 = Direction * TopNX
  var0 = 0
  if var22 < 0
    if var1 >= 135 && var1 <= 325
      var0 = 1
    endif
  else
    if var1 <= 65 || var1 >= 225
      var0 = 1
    endif
  endif

  if Equal var0 1
    var15 += 2
  endif 
Return
label antiair_check
  var22 = var4 - var6
  if var22 > HurtboxSize
    var22 -= HurtboxSize
    var22 = 1 + var22 / 3
    var15 += var22
  endif
Return
label conversion_check
  Goto fastCheck
  Goto combo_check
Return
label frametrap_check
  Goto pressure_check
Return
label crossup_check
  Goto combo_check
Return
label jabreset_check
  // I know, it's supposed to be moves that deal < 7% but at this
  // point i'm out of variables lmao
  if var10 < 60
    var15 += 1
  endif
Return
label fastCheck
  Goto getEndlag

  // if var10 >= 71
    if var7 <= 7 && var22 <= 10
      var15 += 1.5
    elif var7 <= 14 && var22 <= 10 && var8 >= 10
      var15 += 1
    elif var7 <= 11 && var22 <= 16
      if CHANCE_MUL_LE PT_BRAVECHANCE 1
        var15 += 1
      endif
    endif
  // endif
Return
label dirCheck  

  var0 = var15

  // O above

  var22 = 0.002
  XGoto GetChrSpecific
  XReciever

  if TopNY < OTopNY 
    if Equal var22 1
      var15 *= 1.5
    else
      var15 *= 0.1
    endif
  endif

  // O below
  var23 = OTopNY
  if var23 <= TopNY
    if Equal var22 -1
      var15 *= 1.5
    else
      var15 *= 0.25
    endif
  endif

  // O mid
  var17 = TopNY - OTopNY
  Abs var17
  var23 = HurtboxSize + OHurtboxSize
  var23 *= 0.5
  if var17 <= var23
    if Equal var22 0 
      var15 *= 1.35
    else
      var15 *= 0.25
    endif
  endif

   

  var22 = 0.001
  XGoto GetChrSpecific
  XReciever
  var17 = Direction * OPos
  if Equal var22 var17 
    var23 = var3 * 2 + var5
    if Equal var22 -1
      var23 = var5 * -1
    endif
    if !(XDistLE 20)
      if Equal var7 7 || Equal var7 11 || Equal var7 3
        var23 *= 0.25
        var23 += 1
        var15 *= var23
      elif Equal var7 1 && OFramesHitstun <= 0
        var23 *= 0.25
        var23 += 1
        var15 *= var23
      else
        var15 *= 1.25
      endif
    else
      var15 *= 1.25
    endif
  elif Equal var22 0 && var17 > 0
    var23 = var3 * 2 + var5
    if !(XDistLE 20)
      if Equal var7 7 || Equal var7 11 || Equal var7 3
        var23 *= 0.25
        var23 += 1
        var15 *= var23
      elif Equal var7 1 && OFramesHitstun <= 0
        var23 *= 0.25
        var23 += 1
        var15 *= var23
      else
        var15 *= 1.25
      endif
    else
      var15 *= 1.25
    endif
  else
    var15 *= 0.2
  endif
  Goto addIfFastHit
  Goto getOEndlag
  if var7 <= var22 && var10 >= 50
    var22 -= var7
    var22 *= 0.15
    var22 += 1
    var15 += var22
  endif
  DynamicDiceAdd 1 var20 var15

  // var22 = OTopNY - TopNY
  // if OFramesHitstun <= 0 && var22 < 30 && Equal HitboxConnected 0 && !(Equal var7 priority_panic) && OCurrAction < 65
  //   var22 = OTopNX - TopNX
  //   Abs var22
  //   var22 *= 2
  //   if OYDistBackEdge > -35
  //     if !(Equal var7 3)
  //       if disjointX > 1 && Equal Direction OPos || Equal AirGroundState 1
  //         var22 = disjointX * 0.4 + 1
  //         var22 *= var15
  //         DynamicDiceAdd 1 var20 var22
  //       elif disjointX < -1 && !(Equal Direction OPos) || Equal AirGroundState 1
  //         var22 = disjointX * -0.4 + 1
  //         var22 *= var15
  //         DynamicDiceAdd 1 var20 var22
  //       endif
  //     endif
  //   endif
  //   var22 = OTopNY - CenterY
  //   if var22 >= 20
  //     if OAttacking
  //       var22 = 1
  //     else
  //       var22 = 0
  //     endif
  //     if var1 > 55 && var1 < 105 && var22 >= var22
  //       DynamicDiceAdd 1 var20 var15
  //       Goto addIfFastHit
  //     endif
  //   elif True
  //     if var1 > 55 && var1 < 105
  //       DynamicDiceAdd 1 var20 var15
  //     endif
  //     if var1 > 230 && var1 < 310
  //       DynamicDiceAdd 1 var20 var15
  //     endif
  //     Goto addIfFastHit

  //     $ifLastOrigin(grab,0)
  //       var22 = var15 * 2.5
  //       DynamicDiceAdd 1 var20 var22
  //     endif
  //   endif
  // else
  //   var22 = Direction * OPos
  //   var17 = OTopNY + OHurtboxSize * 0.5
  //   if Equal var22 0 && Equal var22 0
  //     var22 = var15 * 2
  //     DynamicDiceAdd 1 var20 var22
  //   elif Equal var22 var22
  //     if var22 <= 0
  //       var22 = var15 * 2
  //       DynamicDiceAdd 1 var20 var22
  //     elif Equal var22 1 && var17 > CenterY
  //       var22 = var15 * 2
  //       DynamicDiceAdd 1 var20 var22
  //     endif
  //   elif Equal var22 1 && var17 > CenterY
  //     if Equal var22 0
  //       var22 = var15 * 2
  //       DynamicDiceAdd 1 var20 var22
  //     elif Equal var22 var22
  //       var22 = var15 * 2
  //       DynamicDiceAdd 1 var20 var22
  //     endif
  //   elif Equal var22 -1 && var17 <= CenterY
  //     if Equal var22 0
  //       var22 = var15 * 2
  //       DynamicDiceAdd 1 var20 var22
  //     elif Equal var22 var22
  //       var22 = var15 * 2
  //       DynamicDiceAdd 1 var20 var22
  //     endif
  //   endif
  //   DynamicDiceAdd 1 var20 var15
  //   $ifLastOrigin(grab,0)
  //     var22 = var15 * 2
  //     DynamicDiceAdd 1 var20 var22
  //   endif
  // endif

  // Goto getOEndlag
  // if var7 <= var22 && var10 >= 50
  //   var22 -= var7
  //   var22 *= 0.15
  //   var22 += 1
  //   var22 *= var15
  //   DynamicDiceAdd 1 var20 var22
  // endif
Return
label getEndlag
  var22 = var9 - (var7 + var8)
if !(True) || Equal var20 9|| Equal var20 11|| Equal var20 17|| Equal var20 18|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24
    if Equal IsOnStage 1
      var22 = var9
    endif
elif !(True) || Equal var20 12 || Equal var20 13 || Equal var20 14 || Equal var20 15 || Equal var20 16
    var22 -= 8
  endif
Return
label getOEndlag
  var22 = 0.003
  XGoto GetChrSpecific
  XReciever
Return
label addIfFastHit
  var22 = var7
  var22 -= 20
  if var22 > 0
    var22 = 20 - var22
    var22 *= 0.3
    var22 *= var15
    var15 += var22
  endif
Return
label approxStageWidth
  GetColDistPosAbs var22 var23 0 -5 -10000 -5 0
  GetColDistPosAbs var17 var23 var22 -5 10000 -5 0
  var17 -= var22
Return
Return
