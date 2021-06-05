// HOVER APPROACH HUB
// controls how mewtwo approaches to attack during hover

id 0x8102

unk 0x00000

SetTimeout 400

if !(Equal var21 36609) && !(Equal var21 36608) && !(Equal var21 32769) && !(Equal var21 33026)
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
      var11 += 2.5
      var9 -= 5
      // if var20 <= 24638 && !(Equal var20 24630)
      //   var22 = 0.04 * 50
      //   var11 += var22
      //   var22 *= 2
      //   var9 -= var22
      // endif
    endif
  // endif

  if Equal var16 3 && var20 < 24640
    var11 *= 1.1
    var10 = var10 + (var12 * 1.5)
  endif 
endif

var21 = 33026

label

if !(Equal CurrAction 288) && CanJump
  if Equal AirGroundState 1
    if Equal var20 24643
      if Equal AirGroundState 1 && Equal OPos Direction
        Stick -1
        Return
      elif Equal OPos Direction
        Call AIHub
      endif
    elif Equal var20 24642
      if Equal AirGroundState 1 && !(Equal OPos Direction)
        Stick -1
        Return
      elif !(Equal OPos Direction)
        Call AIHub
      endif
    endif 
    if CurrAction <= 9
      Button X
    endif
    AbsStick OPos
  else
    Button X
    AbsStick OPos (-1)
  endif
  Return
endif

label Begin

if !(Equal CurrAction 288)
  Call ApproachHub
endif

// keeps hover going
Button X


if var20 > 24655
  var14 = var13
endif

var8 = (var14 - var13) + 1

var8 = 1

Seek LOOP_DIST_CHECK
Jump
label LOOP_DIST_EXIT
if !(True)
  label LOOP_DIST_CHECK
  // this prevents it from auto-attacking.
  // this issue persisted for... 9 months
  Cmd30
  if var20 >= 24625 && var20 <= 24631
    if Equal AirGroundState 1 && Equal CurrAction 3 && !(Equal var20 24636) && !(Equal var20 24630)
      var3 = 0
    elif Equal AirGroundState 2
      var3 = 0
    else
      var3 = 0
    endif
  elif var20 >= 24641 && var20 <= 24655
    var3 = 0
    if Equal AirGroundState 1
      var3 = 3
    endif
  elif Equal var20 25000
    var3 = OFramesHitstun 
  endif
  SAFE_WRITE_4 var9
  SAFE_WRITE_5 var10
  SAFE_WRITE_6 var11
  SAFE_WRITE_7 var12  
  SAFE_INJECT_4 var9
  SAFE_INJECT_5 var10
  SAFE_INJECT_6 var11
  SAFE_INJECT_7 var12
  var2 = 0
  // calculate own estimated position
  var17 = var13 + var3
  // if using a grounded attack then own offset will be very small
  if var20 >= 24625 && var20 <= 24631
    var17 = 0
  endif
  var17 += 1
  if OAnimFrame <= 2
    var0 = OTopNX + OXSpeed * var17
  var17 = var13
  var23 = OYSpeed * -1
  CalcYChange var1 var17 var23 OGravity OMaxFallSpeed OFastFallSpeed 0
    var1 = OTopNY - var1
    // DrawDebugRectOutline OTopNX OTopNY 5 5 0 255 255 221
  else 
    EstOXCoord var0 var17
    EstOYCoord var1 var17
  endif
  var17 -= 1
  var17 /= 60
  EstOPosVecR var2 var17 var17
  if OAnimFrame > 2
    var22 = ExactOXCoord - ExactXCoord
    var22 = var22 - (OTopNX - TopNX)
    var2 -= var22
    var22 = ExactOYCoord - ExactYCoord
    var22 = var22 - (OSCDBottom - TopNY)
    var17 -= var22
  endif
    var2 += TopNX
    var17 += TopNY
    var2 -= OTopNX
    var2 *= -2
    var22 = var0 - OTopNX
    var2 += var22
    var2 += TopNX
  // estimate target position separately  
  var22 = var13 + var3
  // calculate own Y coord because I can't figure out the !@$% EstOPosVecR thing
  var17 = var13
  if Equal CurrSubaction JumpSquat
    var22 = -1.482
  else
    var22 = YSpeed * -1
  endif
  CalcYChange var1 var17 var22 Gravity MaxFallSpeed FastFallSpeed 0
  var17 = TopNY - var1
  // calculate Opponent change in 0.082 (used later)
  // if !(Equal OYSpeed 0) 
  //   O_CALC_SELF_Y_CHANGE_GRAVITY(var0, var13)
  // endif
  // it's awful, I know, but i'm all out of variables and this was the only way lol
  var22 = var13 
  if var20 >= 24625 && var20 <= 24631
    if Equal AirGroundState 1 && Equal CurrAction 3 && !(Equal var20 24636) && !(Equal var20 24630)
      var22 += 0
    endif
  elif var20 >= 24641 && var20 <= 24655
    if Equal AirGroundState 1
      var22 += 3
    endif
  elif Equal var20 25000
    var22 += OFramesHitstun 
  endif
  if OAnimFrame <= 2
  var17 = var22
  var23 = OYSpeed * -1
  CalcYChange var1 var17 var23 OGravity OMaxFallSpeed OFastFallSpeed 0
    var1 = OTopNY - var1
    var1 *= -1
    if OCurrAction <= 9 && var20 < 24641
      var22 *= 0.3
    endif
    var0 = OTopNX + OXSpeed * var22
    // DrawDebugRectOutline OTopNX OTopNY 5 5 0 255 255 221
  else 
    EstOYCoord var1 var22
    // if the opponent is in an actionable state, lower the estimate of
    // their x offset to prevent dashdancing from setting it off when very far away
    if OCurrAction <= 9 && var20 < 24641
      var22 *= 0.3
    endif
    EstOXCoord var0 var22
    var1 = var1 - (OSCDBottom - OTopNY)
  endif
  var3 = TopNY + YDistBackEdge
  if SamePlane && var1 <= var3 && !(MeteoChance)
    var1 = var3
  endif
  if !(CalledAs ComboHub)
    // if Equal var16 4
    //   var22 = 20 * OPos
    //   var0 -= var22
    // elif Equal var16 5
    //   var22 = 20 * OPos
    //   var0 += var22
    // el
    if Equal var16 13
      LOGSTR 1414025728 1161909248 1162758400 1313275904 0
      predictAverage var22 3 LevelValue
      var22 += 35
      var22 *= OPos
      var0 -= var22
    endif
    if Equal var16 12
      predictAverage var22 3 LevelValue
      var22 += 10
      var22 *= OPos
      var0 -= var22
    endif
    if LevelValue >= 75 && !(Equal var16 7) && OCurrAction <= 15 && Equal OIsOnStage 1
      predictOOption var22 13 LevelValue
      var22 = 30 * OPos
      if Equal var22 1
        var0 += var22
      elif Equal var22 3
        var0 -= var22
      endif
      if Equal var20 24636 && Equal CurrAction 4 
        var22 = 10 * OPos
        var0 += var22
      endif
    endif
    if LevelValue >= 48 && CalledAs ApproachHub
      predictOOption var22 15 LevelValue
      predictionConfidence var3 15 LevelValue
      if Equal var22 1 && Rnd < var3
        if var20 >= 24641 && var20 <= 24649
          var22 = var13 + 3 + 3
        else
          var22 = var13
        endif
        EstOYCoord var22 var22
        var3 = TopNY + YDistBackEdge
        if SamePlane && var22 <= var3 
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
            var3 = -9999.9999
          endif 
          predictOOption var22 9 LevelValue
          if Equal var22 1
            LOGSTR 1414485760 1095910400 1392508928 0 0
            var22 = 21
            if Equal OCurrAction 97
              var22 -= OAnimFrame
            endif
            var22 *= 2 * OPos
            var0 -= var22
          elif Equal var22 3
            LOGSTR 1096237312 1493172224 0 0 0
            var22 = 21
            if Equal OCurrAction 97
              var22 -= OAnimFrame
            endif
            var22 *= 2 * OPos
            var0 += var22
          endif
        endif
      endif
    endif
  endif
  // correct to be sure it's not senslessly offstage
  if Equal OIsOnStage 1 && Equal OFramesHitstun 0
    var22 = var0 - TopNX
    GetYDistFloorOffset var22 var22 0 0
    if Equal var22 -1
      var22 = OXDistBackEdge
      Abs var22
      if var22 > OXDistFrontEdge
        var22 = OXDistFrontEdge
      endif
      var0 = OTopNX + var22 
      // var0 *= OPos
    endif
  endif 
  // var0 = estimated target x position
  // var1 = estimated target y position
  // var2 = estimated own x position
  // var17 = estimated own y position
  // var22 = temporary variable
  // var3 = by some miracle, another temporary variable
  // correct if estimated y positions go beyond ground level
  // target
  // var17 += var22
  // var17 -= var3
  // if var3 > 0 && Equal OAirGroundState 2
  //   var17 -= var3
  // endif
  // var22 = OTopNY - var3
  // DrawDebugLine OTopNX OTopNY OTopNX var22 255 0 0 221
  var22 = OYDistBackEdge + OTopNY
  if var1 < var22 && Equal OIsOnStage 1
    var22 -= var1
    var1 += var22
  elif Equal OCurrAction 70 || Equal OCurrAction 74 || Equal OCurrAction 84 || Equal OCurrAction 85
    var22 -= var1
    var1 += var22
  elif Equal OAirGroundState 1
    // var17 -= var3
  endif
  if Equal AirGroundState 1
    var17 = TopNY
  endif
  // if !(CalledAs ComboHub)
  //   // self
  //   DrawDebugRectOutline var2 var17 5 5 255 0 0 136
  //   // target
  //   DrawDebugRectOutline var0 var1 5 5 0 0 255 136
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
  if !(InAir)
    var22 = var9 + (var11 * 2)
    var22 /= 2
    if var22 <= 2
      var2 = var2 - (var9 * OPos)
    else 
      var2 = var2 + (var11 * OPos)
      var2 = var2 + (var9 * OPos)
    endif 
  else
    var2 = var2 + (var11 * Direction)
    var2 = var2 + (var9 * Direction)
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
  //     DrawDebugRectOutline var2 var17 var11 var12 255 187 0 136
  //   endif
  // endif
  // calculate difference between the two
  
  var0 = var2 - var0
  var1 = var1 - var17
  // adjust for opponent position (aim towards nearest blastzone)
  if !(Equal var20 32776) && !(Equal var20 25000) && !(CalledAs ComboHub)
    var22 = 0
    var17 = LBoundary - (TopNX + var0) 
    if var17 < 90 && Equal Direction (-1)
      var17 = 0.0 + 1
      var17 = var11 * (1/var17)
      var17 /= 2
      var22 += var17
    endif
    var17 = RBoundary - (TopNX + var0)
    if var17 > -90 && Equal Direction 1
      var17 = 0.0 + 1
      var17 = var11 * (1/var17)
      var17 /= 2
      var22 -= var17
    endif
    var0 += var22
    if Equal var22 0
      var22 = Direction
      var17 = 0.0 + 1
      var17 = var11 * (1/var17)
      var22 *= var17
      var22 /= 2
      var0 -= var22
    endif
  endif
  // account for target height
  var22 = 0
  SAFE_INJECT_D var22
  var17 = OSCDBottom + OHurtboxSize // top of target
  var2 = var1 * -1
  if var2 >= OHurtboxSize
    // self is above
    var2 = OHurtboxSize
  elif var2 <= 0 
    // self is below
    var2 = 0 // OHurtboxSize * -1
  else 
    // self is between
    var17 = var2 - OHurtboxSize
    // var2 -= var17
    // var2 = var22
  endif
  
  // if Equal AirGroundState 2
    
  //   if Equal OAirGroundState 1
  //     // var2 = var2 + OHurtboxSize * 0.5
  //     var2 += OHurtboxSize
  //   endif
  // endif
  var1 += var2
  if Equal AirGroundState 1 && Equal OAirGroundState 1 && var20 >= 24641 && var20 <= 24645 && SamePlane
    var1 = 0
  endif
  // if !(CalledAs ComboHub)
  //   var0 += TopNX
  //   var1 += TopNY
  //   DrawDebugRectOutline var0 var1 var11 var12 0 255 0 136
  //   var0 -= TopNX
  //   var1 -= TopNY
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
  //   var17 += var2
    
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
  //   var17 = var13 - index
  //   var0 = var0 + OXSpeed * var17 * -2
  // endif

  // var0 and var1 come from the macro
  var2 = var0
  var3 = var1
  Abs var2
  Abs var3

  if var2 <= var11
    var17 = var12 + (OHurtboxSize / 2)
    if var3 <= var17
  var17 = var15
  if Equal CurrSubaction JumpSquat
    var22 = -1.482
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
  if var2 < 4 && !(Equal var2 -1) 
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
      
      if !(Equal var2 0)
        if !(CanJump) && NumJumps > 0 && var4 < -60
          var19 = 0
          Call AIHub
        else
          Seek CallAttacks
          Jump
        endif
      else
        Seek CallAttacks
        Jump
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

if CanJump && YDistBackEdge > 80
  Call RecoveryHub
elif !(CanJump) && YDistBackEdge > 40
  Call RecoveryHub
elif !(CanJump) && NumJumps > 0 && YDistBackEdge > 60
  Call RecoveryHub
endif

AbsStick var0 var1

if YDistBackEdge > -5 && Equal IsOnStage 1 && var1 < 0
  ClearStick 1
endif

Seek Begin
Return
label CallAttacks
LOGSTR 1667329024 1818848768 1728053248 0 0

var18 = 1
if Equal var20 24641
  Call NAir
elif Equal var20 24642
  Call FAir
elif Equal var20 24643
  Call BAir
elif Equal var20 24644
  Call UAir
elif Equal var20 24645
  Call DAir
elif Equal var20 25000
  Call ComboHub
endif

Return
Return
