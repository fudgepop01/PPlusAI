#include <Definition_AIMain.h>
//TrueID=0x6030
id 0x6030

//Set Unknown
unk 0x0

//Strings

Cmd30

// {PRE_SCRIPT_HOOKS}

SetTimeout 300
if Equal CurrAction 3 || Equal CurrAction 4 
  Stick 1
endif

if CalledAs Jab123
  Goto _Jab123
elif CalledAs FTilt
  Goto _FTilt
elif CalledAs UTilt
  Goto _UTilt
elif CalledAs DTilt
  Goto _DTilt
elif CalledAs FSmash
  Goto _FSmash
elif CalledAs USmash
  Goto _USmash
elif CalledAs DSmash
  Goto _DSmash
elif CalledAs NSpecial
  Goto _NSpecial
elif CalledAs SSpecial
  Goto _SSpecial
elif CalledAs USpecial
  Goto _USpecial
elif CalledAs DSpecial
  Goto _DSpecial
elif CalledAs Grab
  Goto _Grab
elif CalledAs DashAttack
  Goto _DashAttack
else
  Call AIHub
endif

if Equal var18 0
  if Equal var16 2 && OFramesHitstun < 1
    Call DefendHub
  else
    Call ApproachHub
  endif
endif

if !(Equal AirGroundState 1)
  if var20 <= 24631 || var20 >= 24636
    Call AIHub
  endif
endif

ClearStick

// {SPECIAL_PERFORMERS}

if CalledAs Jab123
  Button A
elif CalledAs FTilt
  Button A
  Stick 0.7 0
elif CalledAs UTilt
  Button A
  Stick 0 0.7
elif CalledAs DTilt
  Button A
  Stick 0 (-0.7)
elif CalledAs FSmash
  Button A
  AbsStick OPos 0
elif CalledAs USmash
  Button A
  Stick 0 1
elif CalledAs DSmash
  Button A
  Stick 0 (-1)
elif CalledAs NSpecial
  Button B
elif CalledAs SSpecial
  Button B
  AbsStick OPos 0
elif CalledAs USpecial
  Button B
  Stick 0 1
elif CalledAs DSpecial
  Button B
  Stick 0 (-1)
elif CalledAs Grab
  Button R|A
elif CalledAs DashAttack
  label
  if Equal CurrAction 4
    Button A
    Stick 1
    Seek
  elif Equal CurrAction 3 && AnimFrame > 3
    Button A
    Stick 1
    Seek
  elif CurrAction <= 9
    Stick 1
  else
    Call AIHub
  endif
  Return
endif
label _executed
Seek 
Return
label
if OCurrAction >= 26 && OCurrAction <= 33
  trackOAction 7 2
elif OCurrAction >= 52 && OCurrAction <= 56
  trackOAction 7 3
elif OAttacking && Rnd < 0.7
  trackOAction 7 1
elif Rnd < 0.8
  trackOAction 7 0
endif

var4 = -1
label _begin
Goto checks

// {PRE_HOOKS}

if CalledAs Jab123
  Goto _Jab123_impl
elif CalledAs FTilt
  Goto _FTilt_impl
elif CalledAs UTilt
  Goto _UTilt_impl
elif CalledAs DTilt
  Goto _DTilt_impl
elif CalledAs FSmash
  Goto _FSmash_impl
elif CalledAs USmash
  Goto _USmash_impl
elif CalledAs DSmash
  Goto _DSmash_impl
elif CalledAs NSpecial
  Goto _NSpecial_impl
elif CalledAs SSpecial
  Goto _SSpecial_impl
elif CalledAs USpecial
  Goto _USpecial_impl
elif CalledAs DSpecial
  Goto _DSpecial_impl
elif CalledAs Grab
  Goto _Grab_impl
elif CalledAs DashAttack
  Goto _DashAttack_impl
endif

// {POST_HOOKS}

Seek _begin
Return

label _Jab123_impl
  if Equal var19 1
    if var4 >= 15 || Idling
      Call AIHub
    endif
    Return
  endif
  if var4 >= 2
    if Equal CurrSubaction Attack11
      if Equal HitboxConnected 1 && var4 >= 7
        var4 = 0
        Button A
      elif var4 >= 15
        Call AIHub
      endif
    elif Equal CurrSubaction Attack12
      if Equal HitboxConnected 1 && var4 >= 8
        var4 = 0
        Button A
      elif var4 >= 18
        Call AIHub
      endif
    elif Equal CurrSubaction Attack13
      if Idling
        Call AIHub
      endif
    else
      Call AIHub
    endif
  endif
Return

label _FTilt_impl
//   {FTilt}
Return

label _UTilt_impl
//   {UTilt}
Return

label _DTilt_impl
//   {DTilt}
Return

label _FSmash_impl
//   {FSmash}
Return

label _USmash_impl
//   {USmash}
Return

label _DSmash_impl
//   {DSmash}
Return

label _NSpecial_impl
  var1 = 10 + Rnd * 70
  label NSpecialExec
  Goto checks
  var4 = 0
  if var4 >= 10
    var4 = -2
  endif
  var0 = 20
  if Equal var18 2
    Seek 
    Jump
  endif
  if !(True)
    label _chk
    Goto CTD
    if var5 <= var11 && var6 <= var12
      Button B
    endif
    var0 -= 5
    if var0 <= 0
      Seek
      Jump
    else
      Seek _chk
      Jump
    endif
    Return
  endif
  label
  if ODistLE 30
    if Rnd < 0.8 && Equal Direction OPos
      Button B
    elif Rnd < 0.2
      Button R
    elif Rnd < 0.4
      Stick 1 0
    else
      Stick -1 0
    endif
  endif
  var1 -= 1
  if var1 <= 0 && Equal var18 2
    Button R
    Call AIHub
  elif var1 <= 0
    var18 = 2
    var1 = 50 + Rnd * 100
  endif
  Seek NSpecialExec
  Return
Return

label _SSpecial_impl
//   {SSpecial}
Return

label _USpecial_impl
//   {USpecial}
Return

label _DSpecial_impl
//   {DSpecial}
Return

label _Grab_impl
//   {Grab}
Return

label _DashAttack_impl
//   {DashAttack}
Return

label CTD
var1 = 0
  // this prevents it from auto-attacking.
  // this issue persisted for... 9 months
  Cmd30
  if var20 >= 24625 && var20 <= 24631
    if Equal AirGroundState 1 && Equal CurrAction 3 && !(Equal var20 24636) && !(Equal var20 24630)
      var8 = 0
    elif Equal AirGroundState 2
      var8 = 0
    else
      var8 = 0
    endif
  elif var20 >= 24641 && var20 <= 24655
    var8 = 0
    if Equal AirGroundState 1
      var8 = 0
    endif
  elif Equal var20 25000
    var8 = OFramesHitstun 
  endif
  // SAFE_WRITE_C var9
  // SAFE_WRITE_D var10
  // SAFE_WRITE_E var11
  // SAFE_WRITE_F var12  
  SAFE_INJECT_C var9
  SAFE_INJECT_D var10
  SAFE_INJECT_E var11
  SAFE_INJECT_F var12
  var7 = 0
  // calculate own estimated position
  var17 = var14 - var4 + var8
  // if using a grounded attack then own offset will be very small
  if var20 >= 24625 && var20 <= 24631
    var17 = 0
  endif
  var17 += 1
  if OAnimFrame <= 2
    var5 = OTopNX + OXSpeed * var17
  var17 = var14 - var4
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
  EstOPosVecR var7 var17 var17
  if OAnimFrame > 2
    var22 = ExactOXCoord - ExactXCoord
    var22 = var22 - (OTopNX - TopNX)
    var7 -= var22
    var22 = ExactOYCoord - ExactYCoord
    var22 = var22 - (OSCDBottom - TopNY)
    var17 -= var22
  endif
    var7 += TopNX
    var17 += TopNY
    var7 -= OTopNX
    var7 *= -2
    var22 = var5 - OTopNX
    var7 += var22
    var7 += TopNX
  // estimate target position separately  
  var22 = var14 - var4 + var8
  // calculate own Y coord because I can't figure out the !@$% EstOPosVecR thing
  var17 = var14 - var4
  if Equal CurrSubaction JumpSquat
    var22 = -1.482
  else
    var22 = YSpeed * -1
  endif
  CalcYChange var6 var17 var22 Gravity MaxFallSpeed FastFallSpeed 0
  var17 = TopNY - var6
  // calculate Opponent change in 0.082 (used later)
  // if !(Equal OYSpeed 0) 
  //   O_CALC_SELF_Y_CHANGE_GRAVITY(var5, var14 - var4)
  // endif
  // it's awful, I know, but i'm all out of variables and this was the only way lol
  var22 = var14 - var4 
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
  var8 = TopNY + YDistBackEdge
  if SamePlane && var6 <= var8 && !(MeteoChance)
    var6 = var8
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
      predictionConfidence var8 15 LevelValue
      if Equal var22 1 && Rnd < var8
        if var20 >= 24641 && var20 <= 24649
          var22 = var13 + 3 + 3
        else
          var22 = var13
        endif
        EstOYCoord var22 var22
        var8 = TopNY + YDistBackEdge
        if SamePlane && var22 <= var8 
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
            var8 = -9999.9999
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
  // var7 = estimated own x position
  // var17 = estimated own y position
  // var22 = temporary variable
  // var8 = by some miracle, another temporary variable
  // correct if estimated y positions go beyond ground level
  // target
  // var17 += var22
  // var17 -= var8
  // if var8 > 0 && Equal OAirGroundState 2
  //   var17 -= var8
  // endif
  // var22 = OTopNY - var8
  // DrawDebugLine OTopNX OTopNY OTopNX var22 255 0 0 221
  var22 = OYDistBackEdge + OTopNY
  if var6 < var22 && Equal OIsOnStage 1
    var22 -= var6
    var6 += var22
  elif Equal OCurrAction 70 || Equal OCurrAction 74 || Equal OCurrAction 84 || Equal OCurrAction 85
    var22 -= var6
    var6 += var22
  elif Equal OAirGroundState 1
    // var17 -= var8
  endif
  if Equal AirGroundState 1
    var17 = TopNY
  endif
  // if !(CalledAs ComboHub)
  //   // self
  //   DrawDebugRectOutline var7 var17 5 5 255 0 0 136
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
        var7 = var7 - (var9 * OPos)
      else 
        var7 = var7 + (var11 * OPos)
        var7 = var7 + (var9 * OPos)
      endif 
    else
      var7 = var7 + (var11 * Direction)
      var7 = var7 + (var9 * Direction)
    endif
  else
    var7 = var7 + (var11 * Direction)
    var7 = var7 + (var9 * Direction)
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
  //     DrawDebugRectOutline var7 var17 var11 var12 255 187 0 136
  //   endif
  // endif
  // calculate difference between the two
  
  var5 = var7 - var5
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
  var7 = var6 * -1
  if var7 >= OHurtboxSize
    // self is above
    var7 = OHurtboxSize
  elif var7 <= 0 
    // self is below
    var7 = 0 // OHurtboxSize * -1
  else 
    // self is between
    var17 = var7 - OHurtboxSize
    // var7 -= var17
    // var7 = var22
  endif
  
  // if Equal AirGroundState 2
    
  //   if Equal OAirGroundState 1
  //     // var7 = var7 + OHurtboxSize * 0.5
  //     var7 += OHurtboxSize
  //   endif
  // endif
  var6 += var7
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
  //   var17 += var7
    
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
  //   var17 = var14 - var4 - index
  //   var5 = var5 + OXSpeed * var17 * -2
  // endif
Return

label checks
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
  if Equal var4 -2
  elif var4 < 0 || var4 > var15
    var4 = -1
  endif
  Cmd30
  if Equal var4 -2
  else
    var4 += 1
  endif
  if Equal HitboxConnected 1 && OKBSpeed > var16 && OFramesHitstun > 0
    var16 = OKBSpeed
  endif
  if Equal var4 1
    if OCurrAction >= 26 && OCurrAction <= 33 && Rnd < 0.8
      trackOAction 11 2
    elif OCurrAction >= 52 && OCurrAction <= 56 && Rnd < 0.8
      trackOAction 11 3
    elif OAttacking && Rnd < 0.8
      trackOAction 11 1
    elif Rnd < 0.3
      trackOAction 11 0
    endif
  endif
  if Equal var4 10
  if OCurrAction >= 52 && OCurrAction <= 56 && Rnd < 0.7
    trackOAction 7 3
  elif OCurrAction >= 26 && OCurrAction <= 33 && Rnd < 0.7
    trackOAction 7 2
  elif OAttacking && Rnd < 0.7
    trackOAction 7 1
  elif Rnd < 0.2
    trackOAction 7 0
  endif
  endif
  if Equal var4 var13 && !(Equal var16 4) && Equal var21 32769
    predictOOption var17 13 LevelValue
    var22 = OTopNX - TopNX
    if var22 < -15 && Equal HitboxConnected 0
      if Equal AirGroundState 2
        if XSpeed < -0.2
          if Equal var17 3
            trackOAction 13 2
          else
            trackOAction 13 1
          endif
        elif XSpeed > 0.2
          if Equal var17 1
            trackOAction 13 2
          else
            trackOAction 13 3
            trackOAction 13 3
          endif
        endif
      elif True
        if Equal OPos Direction
          if Equal var17 3
            trackOAction 13 2
          else
            trackOAction 13 1
          endif
        elif True
          if Equal var17 1
            trackOAction 13 2
          else
            trackOAction 13 3
            trackOAction 13 3
          endif
        endif
      endif
    elif var22 > 15 && Equal HitboxConnected 0
      if Equal AirGroundState 2
        if XSpeed < -0.2
          if Equal var17 1
            trackOAction 13 2
          else
            trackOAction 13 3
            trackOAction 13 3
          endif
        elif XSpeed > 0.2
          if Equal var17 3
            trackOAction 13 2
          else
            trackOAction 13 1
          endif
        endif
      elif True
        if Equal OPos Direction
          if Equal var17 3
            trackOAction 13 2
          else
            trackOAction 13 1
          endif
        elif True
          if Equal var17 1
            trackOAction 13 2
          else
            trackOAction 13 3
            trackOAction 13 3
          endif
        endif
      endif
    else
      trackOAction 13 var17
    endif
    var22 = Rnd * 7
    if var22 < 1
      trackOAction 13 1
    elif var22 < 2
      trackOAction 13 2
    elif var22 < 4
      trackOAction 13 3
    endif
    // HIGHLIGHT_GUESSES(13, LevelValue)
  endif
  if Equal CanCancelAttack 1 || CurrAction <= 9
    var18 = 0
    Call AIHub
  endif
if var20 <= 24631 || var20 >= 24636
if !(Equal AirGroundState 1)
  Call AIHub
endif
endif
Return

label _Jab123
var20 = 24625
var15 = 18
var9 = 4
var10 = -6
var11 = 6
var12 = 4
var13 = 8
var14 = 9
Return

label _FTilt
var20 = 24626
var15 = 29
var9 = 5
var10 = -3
var11 = 10
var12 = 4
var13 = 6
var14 = 8
Return

label _UTilt
var20 = 24627
var15 = 28
var9 = -6
var10 = 2
var11 = 10
var12 = 16
var13 = 6
var14 = 13
Return

label _DTilt
var20 = 24628
var15 = 20
var9 = 2
var10 = 0
var11 = 11
var12 = 4
var13 = 5
var14 = 7
Return

label _FSmash
var20 = 24629
var15 = 39
var9 = 20
var10 = -4
var11 = 5
var12 = 5
var13 = 19
var14 = 22
Return

label _USmash
var20 = 24630
var15 = 61
var9 = -10
var10 = -6
var11 = 10
var12 = 9
var13 = 8
var14 = 35
Return

label _DSmash
var20 = 24631
var15 = 27
var9 = 8
var10 = 3
var11 = 6
var12 = 6
var13 = 21
var14 = 23
Return

label _NSpecial
var20 = 24632
var15 = 26
var9 = 8
var10 = -3
var11 = 69 // nice
var12 = 5
var13 = 8
var14 = 8
Return

label _SSpecial
var20 = 24633
var15 = 49
var9 = 0
var10 = 0
var11 = 20
var12 = 10
var13 = 20
var14 = 20
Return

label _USpecial

Return

label _DSpecial

Return

label _Grab
var20 = 24636
var15 = 32
var9 = 3
var10 = -3
var11 = 5
var12 = 6
var13 = 7
var14 = 8
if Equal var19 2
endif
if Equal var19 3
endif
if Equal var19 4
endif
if Equal var19 5
endif
Return

label _DashAttack

Return
Return
