#include <Definition_AIMain.h>
//TrueID=0x603C
id 0x603C

//Set Unknown
unk 0x0

if CurrAction >= 52 && CurrAction <= 60
  Call 0x1120
endif

if Equal var18 0
  // LOGSTR 1735549184 1644167168 0 0 0
  if Equal var19 1
    Seek techChase_wait
    Jump
  else
    Seek seekOpponent
    Jump
  endif
  Return
elif True
  var18 = 0
  if Equal CurrSubaction JumpSquat
    Button A|R
    Seek execute
  endif
  if !(Equal OPos Direction)
    Stick -1
    Return
  endif
  if Equal AirGroundState 1 && CurrAction <= 9
    Button X
  endif
endif
Return

label techChase_wait
  SetTimeout 300
  var0 = Rnd * 75 + 25
  var1 = 0
  if Damage < 80
    var2 = 20
  else
    var2 = 40
  endif
  var17 = Rnd
  label
  if !(XDistLE var2)
    // walk-up
    var3 = OPos
    AbsStick var3 (-0.4)
    if Equal CurrAction 1
      ClearStick
    endif
  elif Equal AirGroundState 1
    // force crouch cancel
    Stick 0 (-1)
    if var0 <= 20
      if var17 < 0.3 && var20 >= 24641 && var20 <= 24655
        Button X
      elif var17 < 0.6 && XDistBackEdge < -25 && var0 >= 19
        ClearStick
        Stick -1 0
      elif var17 >= 0.6
        Button R
      endif
    endif
  endif
  var4 = 0
  var5 = OCurrAction
  if Equal var5 96 || Equal var5 81
    if OAnimFrame < 17
      var4 = 1
    endif
  endif
  if Equal var5 30 || Equal var5 31 || Equal var5 32 || Equal var5 78 || Equal var5 80 || Equal var5 82 || Equal var5 83 || Equal var5 97
    if OAnimFrame < 21
      var4 = 1
    endif
  endif
  if Equal var4 1
    var1 = 1
  endif
  var0 -= 1
  if OCurrAction < 69
    Seek seekOpponent
    Jump
  elif Equal var1 1 && Equal var4 0
    Seek _AIHub
    Jump
  elif var0 <= 0
    Seek _AIHub
    Jump
  elif Equal OIsOnStage 0 && Equal OCurrAction 73
    Seek seekOpponent
    Jump
  elif OYDistBackEdge < -20 && Equal OFramesHitstun 0
    Seek _AIHub
    Jump
  endif
  Return

label _AIHub
Call AIHub

label seekOpponent
SetFrame 0
label
if Equal var19 1
  var0 = (100 - LevelValue) / 100
  if Rnd < var0 && !(FrameGE 15)
    Return
  endif
endif
var20 = 24636
var15 = 32
var9 = -0.75
var10 = -2
var11 = 5
var12 = 4
var13 = 7
var14 = 8
Call ApproachHub
Return

label execute
  // this prevents it from auto-attacking.
  // this issue persisted for... 9 months
  Cmd30
  if var20 >= 24625 && var20 <= 24631
    if Equal AirGroundState 1 && Equal CurrAction 3 && !(Equal var20 24636) && !(Equal var20 24630)
      var1 = 0
    elif Equal AirGroundState 2
      var1 = 0
    else
      var1 = 0
    endif
  elif var20 >= 24641 && var20 <= 24655
    var1 = 0
    if Equal AirGroundState 1
      var1 = 0
    endif
  elif Equal var20 25000
    var1 = OFramesHitstun 
  endif
  SAFE_WRITE_4 var9
  SAFE_WRITE_5 var10
  SAFE_WRITE_6 var11
  SAFE_WRITE_7 var12  
  SAFE_INJECT_4 var9
  SAFE_INJECT_5 var10
  SAFE_INJECT_6 var11
  SAFE_INJECT_7 var12
  var0 = 0
  // calculate own estimated position
  var17 = var14 + var1
  // if using a grounded attack then own offset will be very small
  if var20 >= 24625 && var20 <= 24631
    var17 = 0
  endif
  var17 += 1
  if OAnimFrame <= 2
    var5 = OTopNX + OXSpeed * var17
  var17 = var14
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
  EstOPosVecR var0 var17 var17
  if OAnimFrame > 2
    var22 = ExactOXCoord - ExactXCoord
    var22 = var22 - (OTopNX - TopNX)
    var0 -= var22
    var22 = ExactOYCoord - ExactYCoord
    var22 = var22 - (OSCDBottom - TopNY)
    var17 -= var22
  endif
    var0 += TopNX
    var17 += TopNY
    var0 -= OTopNX
    var0 *= -2
    var22 = var5 - OTopNX
    var0 += var22
    var0 += TopNX
  // estimate target position separately  
  var22 = var14 + var1
  // calculate own Y coord because I can't figure out the !@$% EstOPosVecR thing
  var17 = var14
  if Equal CurrSubaction JumpSquat
    var22 = -2.07
  else
    var22 = YSpeed * -1
  endif
  CalcYChange var6 var17 var22 Gravity MaxFallSpeed FastFallSpeed 0
  var17 = TopNY - var6
  // calculate Opponent change in 0.17 (used later)
  // if !(Equal OYSpeed 0) 
  //   O_CALC_SELF_Y_CHANGE_GRAVITY(var5, var14)
  // endif
  // it's awful, I know, but i'm all out of variables and this was the only way lol
  var22 = var14 
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
  else 
    EstOYCoord var6 var22
    // if the opponent is in an actionable state, lower the estimate of
    // their x offset to prevent dashdancing from setting it off when very far away
    if OCurrAction <= 9 && var20 < 24641
      var22 *= 0.0
    endif
    EstOXCoord var5 var22
    var6 = var6 - (OSCDBottom - OTopNY)
  endif
  var1 = TopNY + YDistBackEdge
  if SamePlane && var6 <= var1 && !(MeteoChance)
    var6 = var1
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
      predictionConfidence var1 15 LevelValue
      if Equal var22 1 && Rnd < var1
        if var20 >= 24641 && var20 <= 24649
          var22 = var13 + 5 + 3
        else
          var22 = var13
        endif
        EstOYCoord var22 var22
        var1 = TopNY + YDistBackEdge
        if SamePlane && var22 <= var1 
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
            var1 = -9999.9999
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
  // var0 = estimated own x position
  // var17 = estimated own y position
  // var22 = temporary variable
  // var1 = by some miracle, another temporary variable
    if Equal var20 24647 || Equal var20 24649
        var17 = TopNY
    endif
  // correct if estimated y positions go beyond ground level
  // target
  // var17 += var22
  // var17 -= var1
  // if var1 > 0 && Equal OAirGroundState 2
  //   var17 -= var1
  // endif
  // var22 = OTopNY - var1
  // DrawDebugLine OTopNX OTopNY OTopNX var22 255 0 0 221
  var22 = OYDistBackEdge + OTopNY
  if var6 < var22 && Equal OIsOnStage 1
    var22 -= var6
    var6 += var22
  elif Equal OCurrAction 70 || Equal OCurrAction 74 || Equal OCurrAction 84 || Equal OCurrAction 85
    var22 -= var6
    var6 += var22
  elif Equal OAirGroundState 1
    // var17 -= var1
  endif
  if Equal AirGroundState 1
    var17 = TopNY
  endif
  // if !(CalledAs ComboHub)
  //   // self
  //   DrawDebugRectOutline var0 var17 5 5 255 0 0 136
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
  if !(InAir) || var20 >= 24632 && var20 <= 24635
    var22 = var9 + (var11 * 2)
    var22 /= 2
    if var22 <= 2
      var0 = var0 - (var9 * OPos)
    else 
      var0 = var0 + (var11 * OPos)
      var0 = var0 + (var9 * OPos)
    endif 
  else
    var0 = var0 + (var11 * Direction)
    var0 = var0 + (var9 * Direction)
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
  //     DrawDebugRectOutline var0 var17 var11 var12 255 187 0 136
  //   endif
  // endif
  // calculate difference between the two
  
  var5 = var0 - var5
  var6 = var6 - var17
  // adjust for opponent position (aim towards nearest blastzone)
  if !(Equal var20 32776) && !(Equal var20 25000) && !(CalledAs ComboHub)
    var22 = 0
    var17 = LBoundary - (TopNX + var5) 
    if var17 < 90 && Equal Direction (-1)
      var17 = 0.0 + 1
      var17 = var11 * (1/var17)
      var17 /= 2
      var22 += var17
    endif
    var17 = RBoundary - (TopNX + var5)
    if var17 > -90 && Equal Direction 1
      var17 = 0.0 + 1
      var17 = var11 * (1/var17)
      var17 /= 2
      var22 -= var17
    endif
    var5 += var22
    if Equal var22 0
      var22 = Direction
      var17 = 0.0 + 1
      var17 = var11 * (1/var17)
      var22 *= var17
      var22 /= 2
      var5 -= var22
    endif
  endif
  // account for target height
  var22 = 0
  SAFE_INJECT_D var22
  var17 = OSCDBottom + OHurtboxSize // top of target
  var0 = var6 * -1
  if var0 >= OHurtboxSize
    // self is above
    var0 = OHurtboxSize
  elif var0 <= 0 
    // self is below
    var0 = 0 // OHurtboxSize * -1
  else 
    // self is between
    var17 = var0 - OHurtboxSize
    // var0 -= var17
    // var0 = var22
  endif
  
  // if Equal AirGroundState 2
    
  //   if Equal OAirGroundState 1
  //     // var0 = var0 + OHurtboxSize * 0.5
  //     var0 += OHurtboxSize
  //   endif
  // endif
  var6 += var0
  if Equal AirGroundState 1 && Equal OAirGroundState 1 && var20 >= 24641 && var20 <= 24645 && SamePlane
    var6 = 0
  endif
  if !(CalledAs ComboHub)
    var5 += TopNX
    var6 += TopNY
    DrawDebugRectOutline var5 var6 var11 var12 0 255 0 136
    var5 -= TopNX
    var6 -= TopNY
    var17 = 0.0 + 1
    var17 = var11 * (1/var17)
    var11 = var17
    var9 = var9 + var17 * 0.0
    var17 = 0.0 + 1
    var17 = var12 * (1/var17)
    var12 = var17
    var10 = var10 - var17 * 0.0
    // var17 = TopNY - var10 + var12 + var22
    // DrawDebugRectOutline TopNX var17 10 0 0 255 255 136
    if CalledAs ApproachHub
      var11 -= 2.5
      var9 += 5
    endif
    var22 = (var9 + var11)
    var22 *= Direction
    var22 += TopNX
    var17 = TopNY - var10 + var12
    DrawDebugRectOutline var22 var17 var11 var12 136 136 136 136
    var17 += var0
    
    // if OTopNX > 0
    //   var22 += var11
    // else
    //   var22 -= var11
    // endif 
    DrawDebugRectOutline var22 var17 var11 var12 255 255 255 136
    var22 = OHurtboxSize / 2
    var17 = var22 + OSCDBottom
    DrawDebugRectOutline OTopNX var17 5 var22 255 255 0 221
    
    if CalledAs ApproachHub
      var11 += 2.5
      var9 -= 5
    endif
    var17 = var11 * 0.0
    var9 -= var17
    var11 = var11 + var17
    var17 = var12 * 0.0
    var10 += var17
    var12 = var12 + var17
  endif
  // if !(CalledAs ComboHub) && LevelValue >= 60 && !(Equal var16 7) 
  //   var17 = var14 - index
  //   var5 = var5 + OXSpeed * var17 * -2
  // endif

if CurrAction <= 9 || Equal CurrAction 125 || FramesHitstun > 0
  Call AIHub
elif Equal CurrAction 55 || Equal CurrAction 53
  Call Unk1120
endif
Return
Return

