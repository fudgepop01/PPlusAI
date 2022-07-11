// APPROACH HUB
// controls which approach to use when pursuing a target location
#include <Definition_AIMain.h>
id 0x8001

unk 0x0

SetTimeout 400

var18 = 0

  var0 = 0
  SAFE_INJECT_3 var0
  if var0 > 0
    Seek CallAttacks
    Jump
  endif
SetDisabledMd 6

if Equal var16 9
  Seek CallAttacks
  Jump
endif

if Equal var21 4384
  Call ComboHub
elif FramesHitstun > 0 || Equal var11 0
  var16 = 0
  Call AIHub
endif

if NoOpponent
  Return
endif

if !(Equal var21 36609) && !(Equal var21 36608) && !(Equal var21 32769) && !(Equal var21 25002) && !(Equal var21 25003) && !(Equal var21 25000)
  var0 = 0
  
  var17 = TopNY - OTopNY
  var22 = var10 * -1
  if var22 > OHurtboxSize && var17 > 50
    var0 = 1
  elif var22 < -8 && var17 < -90
    var0 = 1
  endif

  var17 = var9 + (var11 * 2)
  if Equal AirGroundState 2
    if var17 <= -1 && Equal Direction OPos
      var0 = 1
    elif var17 >= 1 && !(Equal Direction OPos)
      var0 = 1
    endif
  endif

  // if Equal var0 1 && !(Equal DistBackEdge DistFrontEdge)
  //   LOGSTR 1919250432 1768123136 540082176 0 0
  //   if Equal var21 32770
  //     var16 = 10
  //     Call ComboHub
  //   else
  //     var16 = 10
  //     Call AIHub
  //   endif
  // endif 

  if LevelValue <= 60
    var17 = (100 - LevelValue) / 3
    var9 = var9 + (Rnd * var17 * 2) - (var17)
    var10 = var10 + (Rnd * var17 * 2) - (var17)
    var17 = (100 - LevelValue) / 5
    var11 = var11 + (Rnd * var17)
    var12 = var12 + (Rnd * var17)
    var17 = (100 - LevelValue) / 15
    var13 = var13 + (Rnd * var17) - (var17 / 2)
    var17 = (100 - LevelValue) / 25
    var15 = var15 + (Rnd * var17)
  else
    // var17 = var13 * 0.5
    // var9 = var9 - var17
    // var11 = var11 + var17 * 2
    // var10 = var10 - var17
    // var12 = var12 + var17 * 2
  endif
  // if !(Equal var21 32770) 
    var17 = var11 * 0.0
    var9 -= var17
    var11 = var11 + var17
    var17 = var12 * 0.0
    var10 += var17
    var12 = var12 + var17
    // attempts to say each character has a "width" of 4
    if !(Equal var20 24636)
      // var11 += 2.5
      // var9 -= 5
      // if var20 <= 24637 && !(Equal var20 24630)
      //   var22 = 0.09 * 50
      //   var11 += var22
      //   var22 *= 2
      //   var9 -= var22
      // endif
    endif
  // endif

  // if Equal var16 3 && var20 < 24640
  //   var11 *= 1.5
  //   var12 *= 1.3
  //   var10 = var10 + (var12 * -1.5)
  //   var10 -= 10
  // endif 
endif

// this is used to detect when the target x position has passed through falcon, such as when changing direction or something

var7 = 65535

label

if Equal CurrAction 4 || Equal CurrAction 3
  Stick 1
endif

if var21 > 65536
  Seek forceDD
  Jump
endif

// these work together to only dashdance if not in a tech-chase or combo situation
  if Equal OCurrAction 78 || Equal OCurrAction 80 || Equal OCurrAction 82 || Equal OCurrAction 96 || Equal OCurrAction 97

// elif OAttacking && Rnd < 0.6 && XDistLE 20
elif CurrAction >= 124 && CurrAction <= 125
elif XDistLE 10
elif OCurrAction >= 66 && OCurrAction <= 82
elif Equal var21 36608 || Equal var21 8288 || Equal var21 32770 || MeteoChance
elif Equal var16 4 && Rnd < 0.3
elif Equal var16 14 && Rnd < 0.2
elif Equal var20 25002 && Rnd < 0.6
elif Equal var20 25003 && Rnd < 0.4
elif Equal var16 7
else
  label forceDD
  var0 = (105 - LevelValue) / 100
  var0 = (Rnd * 11) - 11 * var0
  OR var0 var0 var0
  var1 = (Rnd * 12) + 3
  // var17 = OXSpeed * 3
  // Abs var17
  // var17 += 20
  // if XDistLE var17
  //   Seek _dashdanceEnd
  //   Jump
  // endif
  
  label _dashdance
  Cmd30
  // Goto defendFromO
  RetrieveFullATKD var22 var23 var17 var23 var23 var23 var23 OCurrSubaction 1
  if Equal var22 0
    var22 = OEndFrame
  endif
  var22 = var22 - var17 - OAnimFrame
  // LOGSTR 758983936 1026374912 758983936 0 0
  // LOGVAL var17
  // LOGVAL OAnimFrame
  // LOGVAL var22
  // LOGVAL var13
  if OAttacking && OAnimFrame > var17 && var22 > var13 && XDistLE 50
    var0 = 0
  elif OCurrAction >= 59 && OCurrAction <= 82 && Rnd <= 0.5
    var0 = 0
  elif OCurrAction >= 24 && OCurrAction <= 25 && Rnd <= 0.5
    var0 = 0
  elif OCurrAction >= 96 && OCurrAction <= 113 && Rnd <= 0.5
    var0 = 0
  elif OYDistBackEdge < -40 && Rnd <= 0.1
    var0 = 0
  // elif XDistFrontEdge < 20 && XDistBackEdge > -20
  //   var0 = 0
  elif var0 >= 90
    SetFrame 0
    label
    AbsStick OPos
    if NumFrames >= 5
      Button X 
      var0 = 0
    else
      Return
    endif
  endif
  var17 = OXSpeed * 3
  Abs var17
  predictAverage var22 4 LevelValue
  var17 += var22
  var17 += 25
  // DrawDebugRectOutline TopNX TopNY var17 20 255 136 0 136
  // predictOOption var22 13 LevelValue
  // if Equal var22 1
  //   var17 += 10
  // elif Equal var22 3
  //   var17 -= 10
  // endif
  if Equal CurrAction 10
    Return
  elif Equal CurrAction 22 && AnimFrame < 4
    Return
  elif InAir && YDistBackEdge > -5 && YDistBackEdge < 0 && !(Equal XDistFrontEdge XDistBackEdge)
    if XDistBackEdge < -10 && XDistFrontEdge > 10
      if ODistLE 10
        if Rnd < 0.2
          var0 = 100
        else
          var0 = 0
        endif
      endif
      Button R
      if ODistLE var17
        var17 = OPos * -1
        AbsStick var17 (-0.5)
      else
        AbsStick OPos (-0.5)
      endif
      Return
    endif
  elif Equal AirGroundState 1 && var0 > 1 && Equal OFramesHitstun 0
    if Equal CurrAction 1 && !(Equal CurrAction 7)
      ClearStick
    elif !(XDistLE 35) && !(Equal OPos Direction) && CurrAction <= 3 && NumFrames > 3
      SetFrame 0
      Stick (-1)
    elif NumFrames >= var1 && Equal CurrAction 3
      Goto _ddSubr
    elif AnimFrame >= 12 && Equal CurrAction 3
      Goto _ddSubr
    elif Equal CurrAction 4
      ClearStick
      Stick 0 (-1)
    elif XDistFrontEdge <= 10
      SetFrame 0
      Stick (-1)
      var0 -= 1
      if Rnd < 0.05 && !(Equal Direction OPos)
        var0 = 100
      endif
    elif ODistLE var17 && CurrAction <= 3
      predictOOption var17 6 LevelValue
      predictionConfidence var22 6 LevelValue
      predictAverage var23 3 LevelValue
      var23 += 5
      if Rnd <= 0.03
        if Equal var17 1 && Rnd < var22 && XDistLE var23
          LOGSTR 1145390592 1162757120 1229866752 541344768 0
          if Rnd <= 0.55
            Call DefendHub
          elif !(OAttacking) && var13 <= 16 && Rnd <= 0.4
            var0 = 0
          elif Rnd <= 0.05
            Call Unk3020
          endif
        elif Equal var17 2 && Rnd < var22 && Rnd <= 0.05
          var21 = 32770
          Call Grab
        elif Equal var17 3 && Rnd < var22 && Rnd <= 0.7
          var0 = 0
          Return
        endif
      endif
      if Equal Direction OPos && Rnd < 0.3 && XDistFrontEdge > 25
        // if XDistBackEdge > -25 && Rnd < 0.25 || Rnd < 0.15
        //   Button R
        //   // var22 = TopNX * -1
        //   // AbsStick var22 0
        //   Call OOSHub
        // endif
        if Rnd < 0.1
          var0 = 100
        endif
        var0 -= 1
        Goto _ddSubr
      elif Equal Direction OPos && XDistBackEdge < -25 && Rnd < 0.7
        SetFrame 0
        Stick (-1)
        var0 -= 1
      elif Equal Direction OPos && Rnd < 0.05
        var0 = 0
      else
        Stick 1
      endif
    elif Rnd < 0.7 && Equal CurrAction 3 && !(XDistFrontEdge <= 10)
      Stick 0.7
      Return
    else
      Stick 1
    endif
    Return
  endif
  ClearStick
  Seek _dashdanceEnd
  Jump
  Return
  label _ddSubr
  SetFrame 0
  if XDistLE 35 && Rnd < 0.35
    Seek _dashdanceEnd
    Jump
  elif Rnd <= 0.05
    Seek _dashdanceEnd
    Jump
  endif
  if Equal Direction OPos && Rnd < 0.1 && XDistFrontEdge > 10 && XDistBackEdge < -10
    var0 -= 1
    Button X
  endif
  if var0 > 0 && Rnd < 0.7
    if LevelValue <= 60
      Stick (-1)
    elif LevelValue >= 75 && Rnd < 0.65
      Stick (-1)
    endif
  endif
  var1 = (Rnd * 12) + 3
  if OCurrAction >= 26 && OCurrAction <= 33 && Rnd < 0.8
    trackOAction 6 2
  elif OCurrAction >= 52 && OCurrAction <= 56
    trackOAction 6 3
  elif OAttacking && Rnd < 0.4
    trackOAction 6 1
  elif Rnd < 0.1
    trackOAction 6 0
  endif
  // HIGHLIGHT_GUESSES(6, LevelValue)
  Return
  label _dashdanceEnd
  var21 = 32769
endif

if !(XDistLE 80) && Rnd < 0.35 && !(Equal var16 14)
  Call FakeOutHub
endif 

// var7
var7 = 65535
label BEGIN_MAIN
Cmd30
if Equal DistFrontEdge DistBackEdge
  SetDisabledMd 4
else
  SetDisabledMd 6
endif

Goto checkHitstun
// var17 = var9 + (var11 * 2)
// if Equal AirGroundState 2 && YDistBackEdge < 30 && !(Equal var16 3)
//   if var17 <= -1 && Equal Direction OPos
//     var16 = 10
//     Call AIHub
//   elif var17 >= 1 && !(Equal Direction OPos)
//     var16 = 10
//     Call AIHub
//   endif
// endif
if OFramesHitstun > 10
  EstOYCoord var22 OFramesHitstun
else
  EstOYCoord var22 10
endif
var22 = var22 - TopNY
if SamePlane && var22 >= 60 && var20 <= 24637
  var16 = 10
  Call AIHub
endif

if Equal OIsOnStage 1 && Equal var16 3
  Call AIHub
endif

  if Equal CurrAction 276
    Call RecoveryHub
  endif
  if OYSpeed < 0 && OYDistBackEdge > -5 && Equal OCurrAction 73
    Call AIHub
  endif

// if Equal OCurrAction 3 && Equal OAnimFrame 1 
//   #let currODashDanceCount = var0
//   incrementPrediction man_oDashFrequency
//   predictAverage var22 man_oDashFrequency LevelValue
//   getCurrentPredictValue currODashDanceCount man_oDashFrequency
  
//   var17 = var22 - 2
//   var22 += 2
//   if currODashDanceCount < var17
//     if Rnd <= 0.3
//       var16 = 5
//     endif
//   elif var17 < currODashDanceCount && currODashDanceCount < var22
//     if ODistLE 50
//       predictOOption var17 7 LevelValue
//       predictionConfidence var22 7 LevelValue
//       if !(Equal ODirection OPos) && Equal var17 1 && Rnd < var22
//         if Equal AirGroundState 2 && NumJumps > 0
//           Button X
//           Seek BEGIN_MAIN
//         elif Rnd < 0.7
//           Call Unk3020
//         else
//           ClearStick
//           Button R
//           Stick 0 (-1)
//           Seek BEGIN_MAIN
//           Return
//         endif
//       elif Equal var17 2 && Rnd < var22
//         if Rnd < 0.4
//           var21 = 32770
//           Call Grab
//         else
//           var18 = 0
//           Call FakeOutHub
//         endif
//       endif 
//     endif
//   endif
// endif
// if !(Equal OCurrAction 7) && !(Equal OCurrAction 3)
//   if Equal OPrevAction 7 || Equal OPrevAction 3
//     if Equal OAnimFrame 1      
//       trackOAction man_oDashFrequency 0
//     endif
//   endif
// endif

if OCurrAction > 69 && Equal var20 24636 && !(Equal var19 1)
  if Rnd < 0.4
    Call AIHub
  else
    var18 = 0
    var19 = 1
    var16 = 0
    Call Grab
  endif
endif

if CurrAction >= 124 && CurrAction <= 125
  Stick -1
  Return
endif

if FramesHitstun > 0
  Call AIHub
endif

var21 = 32769

// literally an edge case
if Equal OAirGroundState 3 && TopNY > OTopNY && !(Equal var16 3)
  Call EdgeguardHub
endif

var17 = OXDistBackEdge
Abs var17
if MeteoChance
  if var17 > 70 && Equal IsOnStage 1
    Goto approachEdge
    Return
  elif OYDistBackEdge < -50 && Equal IsOnStage 1
    Goto approachEdge
    Return
  elif Equal var16 3 && var20 < 24640 && Equal IsOnStage 1
    Goto approachEdge
    Return
  elif Equal AirGroundState 1 && var17 > 40 && OYDistBackEdge < -1 && OYDistBackEdge > -50 && !(Equal XSpeed 0) && var20 >= 24640 && CurrAction <= 5
    Button X
  elif !(Equal CurrSubaction JumpSquat) && Equal AirGroundState 1 && OYDistBackEdge < 10 && OYDistBackEdge > -50 && var20 >= 24640 && CurrAction <= 5
    Button X
  elif OYDistBackEdge > -10 && !(Equal var16 3) && !(Equal OAirGroundState 1)
    var2 = 0
    label
    // "are you sure?" check
    if !(MeteoChance)
      Seek
      Jump
    else 
    if var2 > 5
      Call EdgeguardHub
    endif
    var2 += 1
    Return
  endif
  label

  // if CanJump && YDistBackEdge > 69
  //   var16 = 0
  //   Call RecoveryHub
  // elif !(CanJump) && YDistBackEdge > 58
  //   var16 = 0
  //   Call RecoveryHub
  // endif
endif
if !(True)
  label approachEdge
  GetNearestCliff var2
  var2 -= TopNX
  Abs var2
  if var2 < 5
    if Equal CurrAction 4
      ClearStick
      Stick 0 (-1)
      Return
    endif 
    var2 = OPos * -0.5
    AbsStick var2
    Return
  elif var2 < 10
    var17 = var9 + (var11 * 2)
    if var17 >= 1 && !(Equal Direction OPos)
      Stick -1
      Return
    elif var17 <= -1 && Equal Direction OPos
      Stick -1
      Return
    endif
    if OYDistBackEdge > -50
      if OYDistBackEdge < 40 && var20 >= 24640 && CurrAction <= 5
        Button X
      endif
      Seek edgeguardMovementComplete
      Jump
      ClearStick
    endif
    Return
  else
    AbsStick OPos
    if Equal CurrAction 1
      ClearStick
    endif
  endif
  Return
endif

label edgeguardMovementComplete


if var20 > 24655
  var14 = var13
endif

var8 = 0 //(var14 - var13) + 1

if var8 < 1
  var8 = 1
endif

if Equal OCurrAction 96 || Equal OCurrAction 97
  if Equal OAnimFrame 3
    trackOAction 15 1

    var17 = OXSpeed * OPos
    if var17 > 0.1
      trackOAction 9 3
    elif var17 < -0.1
      trackOAction 9 1
    else
      trackOAction 9 2
    endif
  endif 
endif

if Equal OCurrAction 69 || Equal OCurrAction 74
  if Equal OAnimFrame 3
    trackOAction 15 2
  endif
endif

Goto defendFromO

if !(Equal AirGroundState 3) 
  Seek LOOP_DIST_CHECK
  Jump
endif
label LOOP_DIST_EXIT
if !(True)
  label LOOP_DIST_CHECK
  // clacs distance to the target
  // this prevents it from auto-attacking.
  // this issue persisted for... 9 months
  Cmd30
  if var20 >= 24625 && var20 <= 24631
    if Equal AirGroundState 1 && Equal CurrAction 3 && !(Equal var20 24636) && !(Equal var20 24630)
      var4 = 0
    elif Equal AirGroundState 2
      var4 = 0
    else
      var4 = 0
    endif
  elif var20 >= 24641 && var20 <= 24655
    var4 = 0
    if Equal AirGroundState 1
      var4 = 0
    endif
  elif Equal var20 25000
    var4 = OFramesHitstun 
  endif
  // SAFE_WRITE_C var9
  // SAFE_WRITE_D var10
  // SAFE_WRITE_E var11
  // SAFE_WRITE_F var12  
  SAFE_INJECT_C var9
  SAFE_INJECT_D var10
  SAFE_INJECT_E var11
  SAFE_INJECT_F var12
  var3 = 0
  // calculate own estimated position
  var17 = var13 + (var14 - var13) / 2 + var4
  // if using a grounded attack then own offset will be very small
  if var20 >= 24625 && var20 <= 24631
    var17 = 0
  endif
  var17 += 1
  if OAnimFrame <= 2
    var5 = OTopNX + OXSpeed * var17
  var17 = var13 + (var14 - var13) / 2
  var23 = OYSpeed * -1
  CalcYChange var6 var17 var23 OGravity OMaxFallSpeed OFastFallSpeed 0
    var6 = OTopNY - var6
    // DrawDebugRectOutline OTopNX OTopNY 5 5 0 255 255 221
  else 
    EstOXCoord var5 var17
    EstOYCoord var6 var17
  endif
  var17 -= 1
  var17 /= 60
  EstOPosVecR var3 var17 var17
  if OAnimFrame > 2
    var22 = ExactOXCoord - ExactXCoord
    var22 = var22 - (OTopNX - TopNX)
    var3 -= var22
    var22 = ExactOYCoord - ExactYCoord
    var22 = var22 - (OSCDBottom - TopNY)
    var17 -= var22
  endif
    var3 += TopNX
    var17 += TopNY
    var3 -= OTopNX
    var3 *= -2
    var22 = var5 - OTopNX
    var3 += var22
    var3 += TopNX
  // estimate target position separately  
  var22 = var13 + (var14 - var13) / 2 + var4
  // calculate own Y coord because I can't figure out the !@$% EstOPosVecR thing
  var17 = var13 + (var14 - var13) / 2
  if Equal CurrSubaction JumpSquat
    var22 = -1.81
  else
    var22 = YSpeed * -1
  endif
  CalcYChange var6 var17 var22 Gravity MaxFallSpeed FastFallSpeed 0
  var17 = TopNY - var6
  // calculate Opponent change in 0.11 (used later)
  // if !(Equal OYSpeed 0) 
  //   O_CALC_SELF_Y_CHANGE_GRAVITY(var5, var13 + (var14 - var13) / 2)
  // endif
  // it's awful, I know, but i'm all out of variables and this was the only way lol
  var22 = var13 + (var14 - var13) / 2 
  if var20 >= 24625 && var20 <= 24631
    if Equal AirGroundState 1 && Equal CurrAction 3 && !(Equal var20 24636) && !(Equal var20 24630)
      var22 += 0
    endif
  elif var20 >= 24641 && var20 <= 24655
    if Equal AirGroundState 1
      var22 += 0
    endif
  elif Equal var20 25000
    var22 += OFramesHitstun 
  endif
  if OAnimFrame <= 2
  var17 = var22
  var23 = OYSpeed * -1
  CalcYChange var6 var17 var23 OGravity OMaxFallSpeed OFastFallSpeed 0
    var6 = OTopNY - var6
    var6 *= -1
    if OCurrAction <= 9 && var20 < 24641
      var22 *= 0.0
    endif
    var5 = OTopNX + OXSpeed * var22
    // DrawDebugRectOutline OTopNX OTopNY 5 5 0 255 255 221
    // DrawDebugRectOutline var5 var6 5 5 255 255 0 136
  else 
    EstOYCoord var6 var22
    // if the opponent is in an actionable state, lower the estimate of
    // their x offset to prevent dashdancing from setting it off when very far away
    if OCurrAction <= 9 && var20 < 24641
      var22 *= 0.0
    endif
    EstOXCoord var5 var22
    var6 = var6 + (OSCDBottom - OTopNY)
  endif
  var4 = TopNY + YDistBackEdge
  if SamePlane && var6 <= var4 && !(MeteoChance)
    var6 = var4
  endif
  if !(CalledAs ComboHub)
    // if Equal var16 4
    //   var22 = 20 * OPos
    //   var5 -= var22
    // elif Equal var16 5
    //   var22 = 20 * OPos
    //   var5 += var22
    // el
    if Equal var16 13
      // LOGSTR 1414025728 1161909248 1162758400 1313275904 0
      predictAverage var22 3 LevelValue
      var22 += 30
      var22 *= OPos
      var23 = OXSpeed
      Abs var23
      var23 *= 0.5
      var22 *= var23
      var5 -= var22
    endif
    if Equal var16 12
      predictAverage var22 3 LevelValue
      var22 += 15
      var22 *= OPos
      var23 = OXSpeed
      Abs var23
      var23 *= 0.5
      var22 *= var23
      var5 -= var22
    endif
    if LevelValue >= 75 && !(Equal var16 7) && OCurrAction <= 15 && Equal OIsOnStage 1
      predictOOption var22 13 LevelValue
      var22 = 30 * OPos
      if Equal var22 1
        var5 += var22
      elif Equal var22 3
        var5 -= var22
      endif
    endif
    if Equal var20 24636 || Equal var20 24630
      if CurrAction >= 3 && CurrAction <= 4
        var22 = 10 * OPos
        var5 += var22
      endif
    endif
    if LevelValue >= 48 && CalledAs ApproachHub
      predictOOption var22 15 LevelValue
      predictionConfidence var4 15 LevelValue
      if Equal var22 1 && Rnd < var4
        if var20 >= 24641 && var20 <= 24649
          var22 = var13 + 3 + 3
        else
          var22 = var13
        endif
        EstOYCoord var22 var22
        var4 = TopNY + YDistBackEdge
        if SamePlane && var22 <= var4 
          var22 = 1
        else
          var22 = 0
        endif
        if Equal OCurrAction 97 || Equal OCurrAction 96
          Seek
          Jump
        elif OCurrAction >= 68 && OCurrAction <= 73 && Equal var22 1
          label
          if Equal OCurrAction 97 && OAnimFrame > 18
          elif Equal OCurrAction 96
          else
            var4 = -9999.9999
          endif 
          predictOOption var22 9 LevelValue
          if Equal var22 1
            LOGSTR 1414485760 1095910400 1392508928 0 0
            var22 = 21
            if Equal OCurrAction 97
              var22 -= OAnimFrame
            endif
            var22 *= 2 * OPos
            var5 -= var22
          elif Equal var22 3
            LOGSTR 1096237312 1493172224 0 0 0
            var22 = 21
            if Equal OCurrAction 97
              var22 -= OAnimFrame
            endif
            var22 *= 2 * OPos
            var5 += var22
          endif
        endif
      endif
    endif
  endif
  // correct to be sure it's not senslessly offstage
  if Equal OIsOnStage 1 && Equal OFramesHitstun 0
    var22 = var5 - TopNX
    GetYDistFloorOffset var22 var22 0 0
    if Equal var22 -1
      var22 = OXDistBackEdge
      Abs var22
      if var22 > OXDistFrontEdge
        var22 = OXDistFrontEdge
      endif
      var5 = OTopNX + var22 
      // var5 *= OPos
    endif
  endif 
  // var5 = estimated target x position
  // var6 = estimated target y position
  // var3 = estimated own x position
  // var17 = estimated own y position
  // var22 = temporary variable
  // var4 = by some miracle, another temporary variable
  // correct if estimated y positions go beyond ground level
  // target
  // var17 += var22
  // var17 -= var4
  // if var4 > 0 && Equal OAirGroundState 2
  //   var17 -= var4
  // endif
  // var22 = OTopNY - var4
  // DrawDebugLine OTopNX OTopNY OTopNX var22 255 0 0 221
  var22 = OYDistBackEdge + OTopNY
  if var6 < var22 && Equal OIsOnStage 1
    var22 -= var6
    var6 += var22
  elif Equal OCurrAction 70 || Equal OCurrAction 74 || Equal OCurrAction 84 || Equal OCurrAction 85
    var22 -= var6
    var6 += var22
  elif Equal OAirGroundState 1
    // var17 -= var4
  endif
  if Equal AirGroundState 1
    var17 = TopNY
  endif
  // if !(CalledAs ComboHub)
  //   // self
  //   DrawDebugRectOutline var3 var17 5 5 255 0 0 136
  //   // target
  //   DrawDebugRectOutline var5 var6 5 5 0 0 255 136
  // endif
  // adjust for move parameters
  if var20 >= 24641 && var20 <= 24645
    if Equal AirGroundState 2
      var17 -= var10
      var17 += var12
    endif
  else
    var17 -= var10
    var17 += var12
  endif
  // var17 = var17 - OHurtboxSize * 0.5
  
  // adjust for the move parameters
  if var20 > 24637 || var20 >= 24632 && var20 <= 24635
    if !(InAir) && var20 <= 24649
      var22 = var9 + (var11 * 2)
      if var22 <= 2
        var3 = var3 - (var9 * OPos)
      else 
        var3 = var3 + (var11 * OPos)
        var3 = var3 + (var9 * OPos)
      endif 
    else
      var3 = var3 + (var11 * Direction)
      var3 = var3 + (var9 * Direction)
    endif
  else
    var3 = var3 + (var11 * Direction)
    var3 = var3 + (var9 * Direction)
  endif
  // if !(Equal SCDBottom TopNY) && var20 >= 24640
  //   var22 = SCDBottom - TopNY
  //   var17 -= var22
  // endif
  // if Equal AirGroundState 2
  //   var17 -= OHurtboxSize
  // endif
  
  // if !(CalledAs ComboHub)
  //   if Equal index 1 || var18 >= 1
  //     // self
  //     DrawDebugRectOutline var3 var17 var11 var12 255 187 0 136
  //   endif
  // endif
  // calculate difference between the two
  
  var5 = var3 - var5
  var6 = var6 - var17
  // adjust for opponent position (aim towards nearest blastzone)
  // if !(Equal var20 32776) && !(Equal var20 25000) && !(CalledAs ComboHub)
  //   var22 = 0
  //   var17 = LBoundary - (TopNX + var5) 
  //   if var17 < 90 && Equal Direction (-1)
  //     var17 = 0.0 + 1
  //     var17 = var11 * (1/var17)
  //     var17 /= 2
  //     var22 += var17
  //   endif
  //   var17 = RBoundary - (TopNX + var5)
  //   if var17 > -90 && Equal Direction 1
  //     var17 = 0.0 + 1
  //     var17 = var11 * (1/var17)
  //     var17 /= 2
  //     var22 -= var17
  //   endif
  //   var5 += var22
  //   if Equal var22 0
  //     var22 = Direction
  //     var17 = 0.0 + 1
  //     var17 = var11 * (1/var17)
  //     var22 *= var17
  //     var22 /= 2
  //     var5 -= var22
  //   endif
  // endif
  // account for target height
  var22 = 0
  SAFE_INJECT_D var22
  var17 = OSCDBottom + OHurtboxSize // top of target
  var3 = var6 * -1
  if var3 >= OHurtboxSize
    // self is above
    var3 = OHurtboxSize
  elif var3 <= 0 
    // self is below
    var3 = 0 // OHurtboxSize * -1
  else 
    // self is between
    var17 = var3 - OHurtboxSize
    // var3 -= var17
    // var3 = var22
  endif
  
  // if Equal AirGroundState 2
    
  //   if Equal OAirGroundState 1
  //     // var3 = var3 + OHurtboxSize * 0.5
  //     var3 += OHurtboxSize
  //   endif
  // endif
  var6 += var3
  if Equal AirGroundState 1 && Equal OAirGroundState 1 && var20 >= 24641 && var20 <= 24645 && SamePlane
    var6 = 0
  endif
  // if !(CalledAs ComboHub)
  //   var5 += TopNX
  //   var6 += TopNY
  //   DrawDebugRectOutline var5 var6 var11 var12 0 255 0 136
  //   var5 -= TopNX
  //   var6 -= TopNY
  //   var17 = 0.0 + 1
  //   var17 = var11 * (1/var17)
  //   var11 = var17
  //   var9 = var9 + var17 * 0.0
  //   var17 = 0.0 + 1
  //   var17 = var12 * (1/var17)
  //   var12 = var17
  //   var10 = var10 - var17 * 0.0
  //   // var17 = TopNY - var10 + var12 + var22
  //   // DrawDebugRectOutline TopNX var17 10 0 0 255 255 136
  //   if CalledAs ApproachHub
  //     var11 -= 2.5
  //     var9 += 5
  //   endif
  //   var22 = (var9 + var11)
  //   var22 *= Direction
  //   var22 += TopNX
  //   var17 = TopNY - var10 + var12
  //   DrawDebugRectOutline var22 var17 var11 var12 136 136 136 136
  //   var17 += var3
    
  //   // if OTopNX > 0
  //   //   var22 += var11
  //   // else
  //   //   var22 -= var11
  //   // endif 
  //   DrawDebugRectOutline var22 var17 var11 var12 255 255 255 136
  //   var22 = OHurtboxSize / 2
  //   var17 = var22 + OSCDBottom
  //   DrawDebugRectOutline OTopNX var17 5 var22 255 255 0 221
    
  //   if CalledAs ApproachHub
  //     var11 += 2.5
  //     var9 -= 5
  //   endif
  //   var17 = var11 * 0.0
  //   var9 -= var17
  //   var11 = var11 + var17
  //   var17 = var12 * 0.0
  //   var10 += var17
  //   var12 = var12 + var17
  // endif
  // if !(CalledAs ComboHub) && LevelValue >= 60 && !(Equal var16 7) 
  //   var17 = var13 + (var14 - var13) / 2 - index
  //   var5 = var5 + OXSpeed * var17 * -2
  // endif

  if Equal var4 -9999.9999
    var6 = var4
  endif

  if LevelValue >= 48 && OCurrAction >= 66 && OCurrAction <= 69 && Equal OIsOnStage 1 && Equal AirGroundState 1
    EstOYCoord var17 OFramesHitstun
    var17 = OTopNY - var17
    var22 = OTopNY + OYDistBackEdge
    if var17 < var22
      predictOOption var17 14 LevelValue
      predictionConfidence var22 14 LevelValue
      
      // LOGSTR 1347568896 1145651968 1414090496 1308622848 0
      // LOGVAL var17
      // LOGVAL var22
      // DrawDebugRectOutline TopNX TopNY 25 3 255 0 0 221

      if Equal var17 1 && Rnd < var22
        if ONumJumps > 0
          var6 -= 20
        endif
      elif Equal var17 3 && Rnd < var22 && XDistLE 25
        if Rnd < 0.3
          var17 = OPos * -1
          AbsStick var17
        elif Rnd < 0.3
          AbsStick OPos
          Button R
        elif Rnd < 0.5
          Call Unk3020
        else
          ClearStick
          Button R
          Stick 0 (-1)
          Seek BEGIN_MAIN
          Return
        endif
      endif
    endif
  endif

  var17 = var7 - var5
  Abs var17
  if var17 > 50 && !(Equal var7 65535)
    var5 = var7
  endif

  // var5 and var6 come from the macro
  var0 = var5
  var1 = var6
  Abs var0
  Abs var1

  if var20 <= 24631 && !(Equal var20 24630) && !(Equal var20 24636) && Equal CurrAction 3
    var22 = 0.09 * 50
    var0 -= var22
  endif

  // if we're not jumping
  if !(Equal CurrSubaction JumpSquat) && !(Equal var6 -9999.999)
    var2 = 0

    // if one is negative and one is positive, and it's <= var11
    // then we likely passed through it at some point within the last frame
    var2 = var7 + var5
    Abs var2

  var22 = var11 * 2
  if Equal AirGroundState 2 && var0 <= var22 && LevelValue >= 75 && !(Equal XDistBackEdge XDistFrontEdge)  && !(Equal var16 14) && !(Equal CurrAction 12)
  var17 = var13 + (var14 - var13) / 2
  if Equal CurrSubaction JumpSquat
    var22 = -1.81
  else
    var22 = YSpeed * -1
  endif
  CalcYChange var2 var17 var22 Gravity MaxFallSpeed FastFallSpeed 1
  var3 = var13 + (var14 - var13) / 2
  EstOYCoord var3 var3
  // var3 = var3 + ExactOYCoord - OTopNY
  // LOGSTR 2122219008 2122219008 2113929216 0 0
  // LOGVAL OTopNY
  // LOGVAL var3
  // LOGVAL OYDistBackEdge
  // LOGVAL var12
  var17 = OYDistBackEdge + OTopNY
  if var3 < var17
    var17 = var3 - var17
    var3 -= var17
  endif
  // if Equal var8 1 || Equal var18 1
  //   var5 += TopNX
  //   var17 = TopNY + var2
  //   DrawDebugRectOutline var5 var17 var11 var12 0 255 255 136
  //   var17 = var3
  //   DrawDebugRectOutline var5 var17 var11 var12 255 0 255 136
  //   var5 -= TopNX
  // endif
  var17 = TopNY - var3
  var17 -= var2
  var17 -= var10
  // var22 = OHurtboxSize / 2
  // var17 += var22
  // LOGSTR 2122194944 2122194944 2122186752 0 0
  // LOGVAL TopNY
  // LOGVAL OTopNY
  // LOGVAL OHurtboxSize
  // LOGVAL var3
  // LOGVAL var2
  // LOGVAL var17
  
  var22 = YDistBackEdge - 10
  // LOGSTR 2122219008 2122219008 2122219008 2113929216 0
  // LOGVAL var22
  // LOGVAL var17
  var3 = var12 / 2
  var17 -= var3
  if var17 <= var3 
    var3 *= -1
    var2 *= -1
    if var17 > var3 && !(var2 < var22)
      var2 = 1
    else
      var2 = 0
    endif
  else
    var2 = 0
  endif
    if Equal var2 1
      LOGSTR 1178686208 1413890304 1280049152 0 0
      Seek CallAttacks
      Jump
    endif
    
  var17 = var13
  if Equal CurrSubaction JumpSquat
    var22 = -1.81
  else
    var22 = YSpeed * -1
  endif
  CalcYChange var2 var17 var22 Gravity MaxFallSpeed FastFallSpeed 1
  var3 = var13
  EstOYCoord var3 var3
  // var3 = var3 + ExactOYCoord - OTopNY
  // LOGSTR 2122219008 2122219008 2113929216 0 0
  // LOGVAL OTopNY
  // LOGVAL var3
  // LOGVAL OYDistBackEdge
  // LOGVAL var12
  var17 = OYDistBackEdge + OTopNY
  if var3 < var17
    var17 = var3 - var17
    var3 -= var17
  endif
  // if Equal var8 1 || Equal var18 1
  //   var5 += TopNX
  //   var17 = TopNY + var2
  //   DrawDebugRectOutline var5 var17 var11 var12 0 255 255 136
  //   var17 = var3
  //   DrawDebugRectOutline var5 var17 var11 var12 255 0 255 136
  //   var5 -= TopNX
  // endif
  var17 = TopNY - var3
  var17 -= var2
  var17 -= var10
  // var22 = OHurtboxSize / 2
  // var17 += var22
  // LOGSTR 2122194944 2122194944 2122186752 0 0
  // LOGVAL TopNY
  // LOGVAL OTopNY
  // LOGVAL OHurtboxSize
  // LOGVAL var3
  // LOGVAL var2
  // LOGVAL var17
  
  var22 = YDistBackEdge - 10
  // LOGSTR 2122219008 2122219008 2122219008 2113929216 0
  // LOGVAL var22
  // LOGVAL var17
  var3 = var12 / 2
  var17 -= var3
  if var17 <= var3 
    var3 *= -1
    var2 *= -1
    if var17 > var3 && !(var2 < var22)
      var2 = 1
    else
      var2 = 0
    endif
  else
    var2 = 0
  endif
    if Equal var2 1
      LOGSTR 1178686208 1413890304 1280049152 0 0
      Seek CallAttacks
      Jump
    endif
  endif

    if !(Equal AirGroundState 2) || !(Equal YSpeed 0) 
      if CanJump && YDistBackEdge > 69
        var16 = 0
        Call RecoveryHub
      elif !(CanJump) && YDistBackEdge > 58
        var16 = 0
        Call RecoveryHub
      elif YDistBackEdge > 50
        var16 = 0
        Call RecoveryHub
      endif
      if var0 <= var11
        var2 = 0
        Goto XDistCheckPassed
        if Equal var2 1
          LOGSTR 1380271872 0 0 0 0
          var2 = 0
          Seek CallAttacks
          Jump
        elif Equal var2 2
          Seek BEGIN_MAIN
          Return
        elif Equal var2 3
          Seek
          Return
          label
          Button X
          Seek BEGIN_MAIN
          Return
        endif
        var17 = TopNY - OTopNY
        Abs var17
        if !(Equal var16 3) && Rnd < 0.2
          if ODistLE 15
            predictOOption var17 7 LevelValue
            predictionConfidence var22 7 LevelValue
            if !(Equal ODirection OPos) && Equal var17 1 && Rnd < var22
              if Equal AirGroundState 2 && NumJumps > 0
                Button X
                Seek BEGIN_MAIN
              elif Rnd < 0.3
                var17 = OPos * -1
                AbsStick var17
              elif Rnd < 0.3
                AbsStick OPos
                Button R
              elif Rnd < 0.5
                Call Unk3020
              else
                ClearStick
                Button R
                Stick 0 (-1)
                Seek BEGIN_MAIN
                Return
              endif
            elif Equal var17 2 && Rnd < var22 && Rnd < 0.55 && !(Equal var20 24636)
              if Rnd < 0.8
                var21 = 32770
                var16 = 0
                Call Grab
              else
                var18 = 1
                Call FakeOutHub
              endif
            endif 
          endif
          // if XDistLE 25 && var17 <= 40 && OAttacking && Equal AirGroundState 1 && !(Equal CurrSubaction JumpSquat)
          //   if Rnd < 0.9
          //     Call Unk3020
          //   endif

          //   DEFENSIVE_REACTION_TIME(var0, var1)

          //   label
          //   Button X
          //   var17 = OPos * -1
          //   AbsStick var17
          //   if InAir || FramesHitstun > 0
          //     Call AIHub
          //   endif
          //   Return
          // elif XDistLE 35 && var17 <= 40 && OAttacking && Equal AirGroundState 2 && !(MeteoChance)

          //   DEFENSIVE_REACTION_TIME(var0, var1)
          //   Button X
          //   var18 = 0
          //   Call AIHub
          // endif
        endif
      // elif var2 <= var11
      //   var2 = 0
      //   Goto XDistCheckPassed
      //   if Equal var2 1
      //     LOGSTR 1280262912 1095499776 0 0 0
      //     var2 = 0
      //     Seek CallAttacks
      //     Jump
      //   elif Equal var2 2
      //     Seek BEGIN_MAIN
      //     Return
      //   elif Equal var2 3
      //     Seek
      //     Return
      //     label
      //     Button X
      //     Seek BEGIN_MAIN
      //     Return
      //   endif
      endif
    endif
  endif

  var8 -= 1
  if var8 < 1
    Seek LOOP_DIST_EXIT
    Jump
    Return
  endif
  Seek LOOP_DIST_CHECK
  Jump
endif

if !(Equal CurrSubaction JumpSquat) && SamePlane && Equal AirGroundState 1 && Equal OAirGroundState 1 && var1 > var12 && !(Equal var6 -9999.9999) 
  Call AIHub
endif

  var17 = var13
  if Equal CurrSubaction JumpSquat
    var22 = -1.81
  else
    var22 = YSpeed * -1
  endif
  CalcYChange var1 var17 var22 Gravity MaxFallSpeed FastFallSpeed 0

// if !(Equal CurrSubaction JumpSquat)

  // if one is negative and one is positive, and it's <= var11
  // then we likely passed through it at some point within the last frame
  var2 = var7 + var5
  Abs var2

  if Equal var7 65535
    // just makes sure this isn't affected by other variables
    var2 = 65535
  endif
  // if we want to perform an aerial, jump with respect to the
  // var13 to attempt to get there by the time the move's hitbox is out
  var17 = var5 //+ (TotalXSpeed * (var13 + 3) * -1) + TopNX
  // var17 -= TopNX
  // var2 -= TopNX
  Abs var17
  // var22 = var11 + 0.8 * var13
  
  if Equal var6 -9999.9999 
  elif Equal AirGroundState 1 && CurrAction <= 9 && Equal IsOnStage 1
    if var17 <= var11 && var20 >= 24641 && var20 <= 25000 || XDistLE 15 && var20 >= 24641 && var20 <= 25000      
      if MeteoChance
        if OYDistBackEdge < -5
          Button X
        endif
      elif var6 <= 80
        var17 = var9 + (var11 * 2)
        label
        if var17 <= -1 && Equal Direction OPos
          Stick -1
          Return
        elif var17 >= 1 && !(Equal Direction OPos)
          Stick -1
          Return
        endif
        if !(Equal CurrSubaction JumpSquat) && var6 <= 80
          Button X
        elif var6 <= 80 && OAttacking
          Button X
        endif
        Goto JumpIfInRange
      else
        ClearStick 0
      endif
    elif var6 <= 80 && OAttacking && OCurrActionFreq >= 3
      Button X
      Goto JumpIfInRange
    // elif Rnd < 0.3 && var6 <= 80 
    //   Button X
    //   Goto JumpIfInRange
    endif


  endif

  // if Equal var16 4 && XDistLE 60
  //   if Rnd < 0.3 && var20 >= 24641 && var20 <= 24655 && Equal AirGroundState 1 && !(Equal CurrSubaction JumpSquat)
  //     var17 = var9 + (var11 * 2)
  //     label
  //     if var17 <= -1 && Equal Direction OPos
  //       Stick -1
  //       Return
  //     elif var17 >= 1 && !(Equal Direction OPos)
  //       Stick -1
  //       Return
  //     endif
  //     Button X
  //   endif
  //   if Rnd < 0.5 && var20 >= 24641 && var20 <= 24655 && InAir
  //     Seek CallAttacks
  //     Jump
  //   elif Rnd < 0.4 && var20 >= 24625 && var20 <= 24631 && !(InAir)
  //     Seek CallAttacks
  //     Jump
  //   endif
  //   label
  // endif
// endif

if AnimFrame <= 5 && Equal CurrAction 11 
elif YDistBackEdge > -3 && Equal IsOnStage 1 && LevelValue >= 60 && InAir && XDistBackEdge < -10 && XDistFrontEdge > 10
  label
  Button R
  ClearStick

  if XDistBackEdge > -25 && XDistBackEdge < -10
    Stick 1 (-1)
  elif XDistFrontEdge < 25 && XDistFrontEdge > 10
    Stick (-1) (-1)
  else
    var22 = Rnd * 10
    Stick var22 (-1)
  endif

  if Equal var16 7
    ClearStick
    AbsStick OPos (-1)
  endif

  // AbsStick OPos (-1)
  Seek BEGIN_MAIN
  Return
endif

var22 = XSpeed * 8
GetYDistFloorOffset var17 var22 40 0
if !(Equal var17 -1) && var17 < 20 && Rnd < 0.15
  if !(Equal var16 7) && var20 > 24637 || !(SamePlane)
    if XDistLE 25 && Rnd < 0.3 || XDistLE 25 60
      label 
      if !(CurrAction <= 11)
        ClearStick
        Return
      endif
      var22 = 3 + 4
      label
      Button X
      if var22 <= 0 
        Seek
      endif
      var22 -= 1
      Return
      label
      Seek BEGIN_MAIN
      Return
    endif
  endif
endif

if !(SamePlane) && Rnd < 0.8 && Equal IsOnPassableGround 1
  if Equal AirGroundState 1 && var6 < 0
    var17 = 4
    Seek platformDrop
    Jump
  endif
endif

if !(True)
  label platformDrop
  if Equal CurrSubaction JumpSquat
    Seek 
    Jump
  endif
  if Equal LevelValue 100
    ClearStick
    Button R
    if Equal CurrAction 27 && !(SamePlane)
      Stick 0 (-0.715)
    elif Equal CurrAction 114
      Call AIHub
    elif SamePlane || !(Equal IsOnPassableGround 1)
      Call OOSHub
    endif 
  else
    ClearStick
    if CurrAction <= 5 && !(Equal CurrAction 3)
      AbsStick 0 (-1)
    elif Equal CurrAction 17
      AbsStick 0 (-1)
    elif !(InAir)
      Return
    endif

    var17 -= 1

    if var17 <= 0
      Call AIHub
    else
      Seek platformDrop
    endif
  endif
  Return
endif
label

  var17 = var15
  var3 = XSpeed * var17
  GetYDistFloorOffset var2 var3 5 0
  // var22 = TopNY - var2 
  // DrawDebugLine TopNX TopNY TopNX var22 255 0 0 221
  if !(Equal var2 -1) 
    var2 = 0
  elif Equal DistBackEdge DistFrontEdge
    var2 = 2
  elif Equal var2 -1
    if var3 < 0
      var2 = 1
    elif var3 > 0
      var2 = -1
    endif
  else
    var2 = 0
  endif

// if InAir && YSpeed < 0 && Equal var2 0
//   var2 = 1
//   Stick 0 (-1)
// endif

GetNearestCliff var3
var3 = TopNX - var3

if var3 > 60 || var3 < -60 
  if Equal var2 2 && !(Equal var16 3)
    var18 = 0
    var16 = 0
    Call RecoveryHub
  endif
endif

if Equal var2 2 && Equal var16 3
  var17 = (YDistFrontEdge * -1) - var1
  var22 = OTopNY + 30
  if CanJump && YDistFrontEdge < -69
    var19 = 0
    var16 = 0
    Call AIHub
  elif !CanJump && YDistFrontEdge < -58 && YSpeed < 0.1
    var19 = 0
    var16 = 0
    Call AIHub
  elif CanJump && YDistFrontEdge > 69 || YDistFrontEdge > 25 && TopNY < var22
    var19 = 0
    var16 = 0
    Call RecoveryHub
  endif
endif

// now that the calculations using these are over with, we'll store them
// for the next frame
if Equal var7 var5
  var7 = 65535
else
  var7 = var5
endif

// if we're not in jumpsquat, we want to dash to the location
if Equal var16 3 && var20 < 24640
elif XDistLE 20 && var20 < 24640 && Equal AirGroundState 2
  Goto makeIdle
  var2 = 1
elif Equal AirGroundState 1 && !(Equal CurrSubaction JumpSquat)
  predictAverage var22 3 LevelValue
  var22 += 5
  predictOOption var17 7 LevelValue
  predictionConfidence var23 7 LevelValue
  var23 *= 2
  if OCurrAction <= 23 && XDistLE var22 && Rnd < var23 && Equal var17 1 
    if Rnd < 0.3
      var17 = OPos * -1
      AbsStick var17
    elif Rnd < 0.3
      AbsStick OPos
      Button R
    elif Rnd < 0.5
      Call Unk3020
    endif
  endif

  var17 = var5
  if var0 <= 1 && var20 <= 24631
    Goto makeIdle
  // elif XDistLE 20 && var20 <= 24631 && !(Equal var20 24630)
  //   if CurrAction < 3
  //     ClearStick
  //     if var5 > 0
  //       AbsStick 0.7
  //     else
  //       AbsStick -0.7
  //     endif
  //   else
  //     Goto makeIdle
  //   endif
  else
    AbsStick var5
  endif
  // to ensure we dash, we clear the stick if we're walking for whatever reason
  if Equal CurrAction 1 && LevelValue > 21 && !(XDistLE 20)
    ClearStick
  endif

  if XDistLE 20 || var0 <= var11 
    EstOYCoord var17 var14
    var17 -= TopNY
    if var17 > 80 || MeteoChance
      ClearStick
    elif var20 < 24641 && XDistFrontEdge < 10
    endif
  endif

  if XDistLE 20 && !(Equal CurrSubaction JumpSquat) && var20 >= 24641
    Goto JumpIfInRange
  endif
elif Equal CurrSubaction JumpSquat
  var0 = Rnd
  label jsquat
  var22 = var13 * XSpeed + TopNX
  var22 -= OTopNX
  Abs var22
  var17 = (var9 + var11) * Direction
  var22 += var17
  var17 = var22
  if var17 < 0
    Abs var17
    if var17 <= 5
      ClearStick
    elif var17 <= 10 
      var22 = OPos * -0.4
      AbsStick var22
    elif var17 <= 15
      var22 = OPos * -0.6
      AbsStick var22
    elif var17 <= 20
      var22 = OPos * -0.85
      AbsStick var22
    else
      var22 = OPos * -1
      AbsStick var22
    endif
  elif True
    if var17 <= 5
      ClearStick
    elif var17 <= 10 
      var22 = OPos * 0.4
      AbsStick var22
    elif var17 <= 15
      var22 = OPos * 0.6
      AbsStick var22
    elif var17 <= 20
      var22 = OPos * 0.85
      AbsStick var22
    else
      AbsStick OPos
    endif
  endif

  // adjusts the trajectory of the jump if the
  // target is moving
  var17 = OTotalXSpeed * 2
  if OTotalXSpeed > 0.3 && XDistLE 50
    ClearStick 0
    var22 += var17
    AbsStick var22 0
  elif OTotalXSpeed < -0.3 && XDistLE 50
    ClearStick 0
    var22 += var17
    AbsStick var22 0
  endif

  // if var3 >= -25 && var3 <= 25
  //   if var3 > 0
  //     ClearStick 0
  //     if XSpeed > 0.1
  //       AbsStick -1
  //     endif
  //   elif var3 < 0
  //     ClearStick 0
  //     if XSpeed < -0.1
  //       AbsStick 1
  //     endif
  //   endif
  // endif
  Goto JumpIfInRange

  if Equal CurrSubaction JumpSquat && !(Equal var16 7) && OFramesHitstun < 1
    if var0 <= 0.2
      Button X
    endif 
    Seek jsquat
    Return
  elif OAttacking && Equal CurrSubaction JumpSquat && OCurrActionFreq >= 3
    Button X
    Seek jsquat 
    Return
  endif
else
  // otherwise...
  var17 = var5
  // if var17 > 0.1 && var17 < 0.3
  //   var17 = 0.3
  // elif var17 < -0.1 && var17 > -0.3
  //   var17 = -0.3
  // endif
  
  // if XDistFrontEdge < 25 && Equal OPos Direction
  //   var17 /= 2
  // elif XDistBackEdge > -25 && !(Equal OPos Direction)
  //   var17 /= 2
  // endif

  // 

  AbsStick var17
  if !(Equal var2 0) && !(Equal var16 3)
    ClearStick 0
    var0 = XSpeed * -10
    AbsStick var0 0
  endif 

  if var20 >= 24641 && var20 <= 24655
    Goto JumpIfInRange
  elif Equal var20 25000
    Goto JumpIfInRange
  elif !(SamePlane)
    Goto JumpIfInRange
  endif
endif

Seek BEGIN_MAIN
// if Equal var16 4
//   LOGSTR 1953001984 1870098176 1970536448 0 0
//   LOGSTR 1667329536 1667591168 1701052416 0 0
//   var16 = 0
// endif
if var2 > 0
  Return
endif
ClearStick 1
// without this it may fastfall automatically, which we don't want

Stick 0 0.5
Return

label JumpIfInRange
if !(Equal var6 -9999.9999)
  EstOYCoord var17 var13
  var17 -= TopNY
  // LOGVAL var17
  // if MeteoChance && Equal AirGroundState 1 && OYSpeed > 0.01 && OYDistBackEdge > 15
  //   var17 += 5
  // endif
  // var17 += OHurtboxSize
  // if MeteoChance && Equal IsOnStage 0 && YSpeed < 0.01 && var17 > 23 && var17 < 35
  //   Button X
  // endif
  if var17 > 7 && var17 < 80 && Equal AirGroundState 1 && CurrAction <= 9
    Button X
  endif
  if var17 > 23 && var17 < 80 && Equal CurrSubaction JumpSquat
    Button X
  elif var17 > 7 && var17 < 80 && Equal CurrSubaction JumpSquat && OAttacking
    Button X
  endif
  if Equal AirGroundState 2 && YDistBackEdge < GetJumpHeight
    // var17 -= var1
    var17 += var10 
    var17 -= var12 
    // var22 = TopNY + var17
    // DrawDebugLine TopNX TopNY TopNX var22 0 255 255 221
    if var17 > 23 && var17 < 35 && CanJump
      var17 = OTopNX - TopNX
      var17 *= 0.3
      ClearStick
      AbsStick var17
      Button X
    endif
  //   var17 = TopNX + 5
  //   var22 = TopNY + 23
  //   DrawDebugLine var17 TopNY var17 var22 255 255 0 221
  //   var17 = TopNX + 10
  //   var22 = TopNY + 35
  //   DrawDebugLine var17 TopNY var17 var22 255 255 0 221
  // elif Equal AirGroundState 1
  //   var17 = TopNX
  //   var22 = TopNY + 7
  //   DrawDebugLine var17 TopNY var17 var22 255 255 0 221
  //   var17 = TopNX + 5
  //   var22 = TopNY + 23
  //   DrawDebugLine var17 TopNY var17 var22 255 255 0 221
  //   var17 = TopNX + 10
  //   var22 = TopNY + 80
  //   DrawDebugLine var17 TopNY var17 var22 255 255 0 221
  endif
endif
Return

label XDistCheckPassed

var2 = 0
var17 = var12
if var1 <= var17
  var17 = var15
  if Equal CurrSubaction JumpSquat
    var22 = -1.81
  else
    var22 = YSpeed * -1
  endif
  CalcYChange var4 var17 var22 Gravity MaxFallSpeed FastFallSpeed 0
  var4 = (YDistFrontEdge * -1) - var4

  var17 = var15 + 3
  var3 = XSpeed * var17
  GetYDistFloorOffset var2 var3 5 0
  // var22 = TopNY - var2 
  // DrawDebugLine TopNX TopNY TopNX var22 255 0 0 221
  if !(Equal var2 -1) 
    var2 = 0
  elif Equal DistBackEdge DistFrontEdge
    var2 = 2
  elif Equal var2 -1
    if var3 < 0
      var2 = 1
    elif var3 > 0
      var2 = -1
    endif
  else
    var2 = 0
  endif

  var3 = 0
  if var20 >= 24632 && var20 <= 24635 && InAir && YDistBackEdge < -0.5
    var3 = 1
  endif

  if var20 >= 24641 && var20 <= 24655 || Equal var3 1
    ClearStick
    Stick 0 0.5
    var17 = -69 
    if Equal AirGroundState 1 && CurrAction <= 23
      predictOOption var17 7 LevelValue
      predictionConfidence var22 7 LevelValue
      var22 *= 0.25
      predictAverage var17 3 LevelValue
      var17 += 10
      if Equal var17 1 && Rnd < var22 && !(Equal var16 7) && XDistLE var17
        if Rnd < 0.3
          var17 = OPos * -1
          AbsStick var17
        elif Rnd < 0.3
          AbsStick OPos
          Button R
        elif Rnd < 0.5
          Call Unk3020
        else
          var18 = 1
          Call FakeOutHub
        endif
      endif

      var17 = var9 + (var11 * 2)
      if var17 >= 1 && !(Equal Direction OPos)
        Stick (-1)
        var2 = 3
        Return
      elif var17 <= -1 && Equal Direction OPos
        Stick (-1)
        var2 = 3
        Return
      endif
      Button X
      Return
    elif Equal AirGroundState 1
      var2 = 0
      Return
    elif CanJump && Equal var2 2 && var4 < var17
      var19 = 0
      var16 = 0
      Call AIHub
    elif !CanJump && Equal var2 2 && var4 < -58
      var19 = 0
      var16 = 0
      Call AIHub

    else
      LOGSTR 1635021824 1633905408 1768843008 0 0
      var2 = 1
      Return
    endif
  elif Equal AirGroundState 1 || Equal var20 25000
    var2 = 1
  endif
endif
Return

label CallAttacks
Cmd30
if !(Equal var16 7)
  predictOOption var17 11 LevelValue
  predictionConfidence var22 11 LevelValue

  if Equal AirGroundState 1 && Rnd < 0.25 && Rnd < var22
    predictAverage var22 3 LevelValue
    if Equal var17 1 && XDistLE var22 
      Stick 1
      Call Unk3020
    elif Equal var17 2 && !(Equal var20 24636)
      var18 = 1
      Call FakeOutHub
    elif Equal var17 3
      Call DefendHub
    endif 
  elif Equal AirGroundState 2 && TopNY > OTopNY && Rnd < 0.2 && var20 >= 24641 && var20 <= 24649 && NumJumps > 0 && !(Equal var16 3)
    if Rnd < var22
      SetFrame 0
      label
      Button X
      if NumFrames > 2
        Seek BEGIN_MAIN
      endif
      Return
    endif 
  endif
endif
label
Goto defendFromO
Goto checkHitstun
// if Equal OAirGroundState 1 && OCurrAction <= 9 && Rnd < 0.3 && Equal AirGroundState 1 && var20 < 24641
//   var20 = 32776
// endif

if Equal var20 25000 || Equal var16 14
  Seek skipPreparation
  Jump
endif

var0 = 0

// {ADDITIONAL_IDLE_HOOK}

// if the action requires us to be stopped,
if var20 >= 24625 && var20 <= 24635 && !(Equal var20 24630) && !(Equal var20 24633) && CurrAction > 2
  if CurrAction >= 6 && CurrAction <= 7
  else
    Goto makeIdle
  endif
  Return
elif Equal CurrSubaction JumpSquat
  Return
elif var20 >= 24640 && var20 <= 24655 && Equal AirGroundState 1
  var17 = var9 + (var11 * 2)
  if var17 >= 1 && !(Equal Direction OPos)
    ClearStick
    Stick (-0.7)
    Return
  elif var17 <= -1 && Equal Direction OPos
    ClearStick
    Stick (-0.7)
    Return
  endif
  if AnimFrame >= var15 || CurrAction <= 23
    Button X
    Seek BEGIN_MAIN
  endif
  Return
endif
// BReversing
if var20 >= 24632 && var20 <= 24635
  var17 = var9 + (var11 * 2)
  if var17 >= 1 && !(Equal Direction OPos)
    ClearStick
    Stick (-0.7)
  elif var17 <= -1 && Equal Direction OPos
    ClearStick
    Stick (-0.7)
  else
    ClearStick
    var17 = OPos * 0.7
    AbsStick var17
  endif
endif
// DashAttack
if Equal var20 24637 && !(Equal CurrAction 3) && !(Equal CurrAction 4)
  if Equal CurrAction 1
    ClearStick
  else
    AbsStick OPos
  endif
  Return
endif

label skipPreparation
// sets var18 to 1 so we know to actually perform the move instead
// of loading the move data and getting within the move's range -- we
// just did that in this script!
var18 = 1
if Equal var20 24625
  Call Jab123
elif Equal var20 24637
  Call DashAttack
elif Equal var20 24626
  Call FTilt
elif Equal var20 24627
  Call UTilt
elif Equal var20 24628
  Call DTilt
elif Equal var20 24629
  Call FSmash
elif Equal var20 24630
  Call USmash
elif Equal var20 24631
  Call DSmash
elif Equal var20 24632
  Call NSpecial
elif Equal var20 24633
  Call SSpecial
elif Equal var20 24634
  Call USpecial
elif Equal var20 24635
  Call DSpecial
elif Equal var20 24636
  Call Grab
elif Equal var20 24641
  Call NAir
elif Equal var20 24642
  Call FAir
elif Equal var20 24643
  Call BAir
elif Equal var20 24644
  Call UAir
elif Equal var20 24645
  Call DAir
elif Equal var20 24646
  Call NSpecialAir
elif Equal var20 24647
  Call SSpecialAir
elif Equal var20 24648
  Call USpecialAir
elif Equal var20 24649
  Call DSpecialAir
elif Equal var16 14
  Call FakeOutHub
elif Equal var20 25000
  var18 = 255
  Call ComboHub
endif
Return

label makeIdle
LOGSTR 1296124672 1229866752 541672448 1279590400 0
if Equal CurrAction 3
  // stops the dash
  ClearStick
  Button X
  LOGSTR 1398034176 1346650368 1397227520 0 0
  Return
endif
if Equal CurrAction 4
  // interrupts run with crouch for one frame
  ClearStick
  Stick 0 (-1)
  Return
endif
if Equal CurrAction 10 || Equal CurrSubaction JumpSquat
  Return
endif

  var17 = 4
  var3 = XSpeed * var17
  GetYDistFloorOffset var2 var3 5 0
  // var22 = TopNY - var2 
  // DrawDebugLine TopNX TopNY TopNX var22 255 0 0 221
  if !(Equal var2 -1) 
    var2 = 0
  elif Equal DistBackEdge DistFrontEdge
    var2 = 2
  elif Equal var2 -1
    if var3 < 0
      var2 = 1
    elif var3 > 0
      var2 = -1
    endif
  else
    var2 = 0
  endif

if InAir && YDistBackEdge > -10 && YDistBackEdge <= 2 && Equal var2 0
  ClearStick
  var17 = var5 * 0.4
  if XDistBackEdge > -5
    var17 = 0.4
  elif XDistFrontEdge < 5
    var17 = -0.4
  endif
  if LevelValue <= 60
    if Rnd < 0.5
      Button R
      AbsStick var17 (-1)
    endif
  elif True
    if Rnd <= 0.1
      var17 *= -1
    elif Rnd < 0.7 && XDistFrontEdge < 30
      var17 *= -1
    endif
    Button R
    AbsStick var17 (-1)
  endif
  if XDistBackEdge > -10 || XDistFrontEdge < 10
    ClearStick
    AbsStick 0 (-1)
  endif
  Return
elif !(Equal AirGroundState 1)
  Call AIHub
endif
var17 = var9 + (var11 * 2)
if var17 >= 1 && !(Equal Direction OPos)
  ClearStick
  Stick (-0.7)
  Return
elif var17 <= -1 && Equal Direction OPos
  ClearStick
  Stick (-0.7)
  Return
endif
if CurrAction >= 22 && var0 < 4
  var0 += 1
  Return
elif CurrAction >= 24
  Return
endif
Return

label defendFromO

  predictAverage var22 4 LevelValue
  predictAverage var17 5 LevelValue
  // DrawDebugRectOutline TopNX TopNY var22 var17 255 0 0 136
  if Equal AirGroundState 1 && OFramesHitstun < 1 && !(Equal var16 7)
    predictAverage var22 4 LevelValue
    var17 = OXSpeed * 5 * OPos * -1
    var22 += var17
    // LOGSTR 1868054784 1953784064 1667974144 1769174016 0
    // LOGVAL var22
    if XDistLE var22
      predictAverage var22 5 LevelValue
      var17 = OYSpeed * 5
      var22 += var17
      var17 = TopNY - OTopNY
      Abs var17
      // LOGSTR 1868120320 1953784064 1667974144 1769174016 0
      // LOGVAL var22
      if var17 <= var22
        if CalledAs DefendHub
          var22 = 8
        else
          var22 = 7
        endif
        
        if !(OAttacking) && Rnd <= 0.04
          trackOAction var22 0
          predictAverage var17 4 LevelValue
          var17 *= 0.5
          trackOAction 4 var17
        endif
        predictOOption var17 var22 LevelValue
        predictionConfidence var22 var22 LevelValue
        
        var22 *= 0.1
        if Equal var17 1 && Rnd <= var22
          var22 = OPos * OXSpeed
          if var22 < 0 
            if Rnd < 0.3
              var17 = OPos * -1
              AbsStick var17
            elif Rnd < 0.3
              AbsStick OPos
              Button R
            elif Rnd < 0.5
              Call Unk3020
            endif
          endif
        elif Equal var17 1 && Rnd <= var22 && Rnd < 0.2
          var18 = 1
          Call FakeOutHub
        endif
        if Equal var17 1 && Rnd <= var22 && OAttacking && OAnimFrame > 10 && OAnimFrame < 20
          var22 = OPos * OXSpeed
          if var22 < 0 
            if Rnd < 0.3
              var17 = OPos * -1
              AbsStick var17
            elif Rnd < 0.3
              AbsStick OPos
              Button R
            elif Rnd < 0.5
              Call Unk3020
            endif
          endif
        endif
      endif
    endif
  endif
  if OAttacking && OAnimFrame < 2 && ODistLE 90
    var22 = TopNX - OTopNX
    Abs var22
    var22 += 10
    if var22 > 126
      var22 = 126
    endif
    trackOAction 4 var22
  endif
if OAnimFrame > 1 && OAnimFrame <= 2 && ODistLE 80
  if OPrevAction >= 66 && OPrevAction <= 69 || Equal OPrevAction 73 || Equal var16 7
    if Equal OCurrAction 12 || Equal OCurrAction 13
      trackOAction 14 1
    elif OAttacking && Rnd < 0.6
      trackOAction 14 1
    elif Equal OCurrAction 14 || Equal OCurrAction 70 || Equal OCurrAction 74 || Equal OCurrAction 96 || Equal OCurrAction 97
      if OFramesHitstun <= 0 && Rnd < 0.5
        trackOAction 14 2
      endif
    endif
  endif
endif
// if OAttacking && OAnimFrame > 1 && OAnimFrame <= 2 && ODistLE 70
//   if YDistBackEdge > -3 && YDistBackEdge <= 3
//     var22 = TopNX - OTopNX
//     Abs var22
//     var22 += 10
//     if var22 > 126
//       var22 = 126
//     endif
//     trackOAction 4 var22
//     var22 = TopNY - OTopNY
//     Abs var22
//     var22 += 10
//     if var22 > 126
//       var22 = 126
//     endif
//     trackOAction 5 var22
//   endif
// endif

Return
label checkHitstun

  if FramesHitstun > 0
    var22 = LevelValue * 0.01 - 0.1
    if LevelValue >= 60 && Rnd <= var22
      if Damage < 80 || Equal FramesHitlag 1
        ClearStick
        Stick 0 (-1)
      elif Rnd < 0.4
        ClearStick
        Stick 0 (-1)
        if LevelValue >= 75 && Rnd <= var22
          Button R
        endif
      endif
    endif
    Call OnGotDamaged
  endif

Return
Return
