#include <Definition_AIMain.h>
id 0x8101
unk 0x0

str "*"
str "LASER APPROACH"
str "Min Count"
str ":3"
str "Max Count"
str ":8"
str "Min Wait"
str ":10"
str "Max Wait"
str ":50"
str "Dashdance"
str ":1"

SetTimeout 6000
var7 = 0
var5 = 0
label begin
Cmd30

SAFE_INJECT_4 var0

if var0 > 0
  var0 = (105 - LevelValue) / 100
  var0 = (Rnd * 10) - 30 * var0
  OR var0 var0 var0
  var1 = (Rnd * 20) + 2

  label _dashdance
  Cmd30

  if OCurrAction >= 59 && OCurrAction <= 82 && Rnd <= 0.5
    var0 = 0
  elif OCurrAction >= 24 && OCurrAction <= 25 && Rnd <= 0.5
    var0 = 0
  elif OCurrAction >= 96 && OCurrAction <= 113 && Rnd <= 0.5
    var0 = 0
  elif OYDistBackEdge < -40 && Rnd <= 0.1
    var0 = 0
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
  elif Equal AirGroundState 1 && var0 > 0 && Equal OFramesHitstun 0
    if Equal CurrAction 1 && !(Equal CurrAction 7)
      ClearStick
    elif !(XDistLE 150) && !(Equal OPos Direction) && CurrAction <= 3 && NumFrames > 3
      SetFrame 0
      Stick (-1)
    elif NumFrames >= var1 && Equal CurrAction 3
      Goto _ddSubr
    elif AnimFrame >= 9 && Equal CurrAction 3
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
      if Rnd <= 0.2
        Seek _dashdanceEnd
        Jump
      endif

      if Equal Direction OPos && Rnd < 0.3 && XDistFrontEdge > 25
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
  if Equal Direction OPos && Rnd < 0.5 && XDistFrontEdge > 10 && XDistBackEdge < -10
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
  var1 = (Rnd * 20) + 2
  Return
endif
label _dashdanceEnd
Goto checks

SAFE_INJECT_0 var0
SAFE_INJECT_1 var1
SAFE_INJECT_2 var2
SAFE_INJECT_3 var3

var9 = 11
var10 = -3
var11 = 42
var12 = 4
var13 = 15

ClearStick
if Equal CurrAction 22 && AnimFrame >= 3
  Goto groundActs
elif CurrAction <= 9
  Goto groundActs
elif Equal AirGroundState 2
  var12 = 4
  label CNS
    Goto checks

    var17 = YSpeed * -1
    if YDistBackEdge > -20
      CalcYChange var17 14 var17 Gravity MaxFallSpeed FastFallSpeed 1
    else
      CalcYChange var17 14 var17 Gravity MaxFallSpeed FastFallSpeed 0
    endif
    var10 = -3 + var17 - OHurtboxSize

    if Equal AirGroundState 1
      Call AIHub
    endif
    var11 = 15
    var9 = 100
    var14 = 20
    var13 = 20
    label CNSIteration
      Goto CTD

      Abs var2
      Abs var3
      if var2 <= 15 && var3 <= var12
        Button B
        Seek CNS_end
        Jump
      endif
      if var9 <= 0 
        Seek CNS
        Return
      endif
      var9 -= 25
      var13 -= 5
      var14 -= 5
      Seek CNSIteration
      Jump
      Return
  Return
  label CNS_end
    if AnimFrame >= 14 && Rnd < 0.8 && YDistBackEdge > -3 && !(Equal XDistBackEdge XDistFrontEdge)
      Button R
      if XDistBackEdge > -25 && XDistBackEdge < -10
        Stick 1 (-0.5)
      elif XDistFrontEdge < 25 && XDistFrontEdge > 10
        Stick (-1) (-0.5)
      else
        var22 = (Rnd - 0.5) * 10
        Stick var22 (-0.5)
      endif
    endif
    if Equal AirGroundState 1
      Seek
      Jump
    endif
  Return
  label
  var5 += 1
  if var5 >= var0 && var5 < var1 && Rnd < 0.2 || var5 >= var1
    if Rnd < 0.2
      Call DashAttack
    elif Rnd < 0.5
      Call NAir
    else
      Call DSpecial
    endif
  endif
  Seek begin
  Return
endif

var7 += 1
Seek _dashdanceEnd
Return
label groundActs
if !(Equal CurrAction 10)
  if !(Equal OPos Direction)
    Goto faceTarget
    var7 = 0
  elif var7 > var2 && var7 < var3 && Rnd < 0.05
    Button X
    var7 = 0
  elif var7 >= var3
    Button X
    var7 = 0
  endif
else
  var7 = 0
endif
Return
label faceTarget

var17 = OPos * 0.8
AbsStick var17

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

  var17 = 15
  var16 = XSpeed * var17
  GetYDistFloorOffset var15 var16 5 0
  // var22 = TopNY - var15 
  // DrawDebugLine TopNX TopNY TopNX var22 255 0 0 221
  if !(Equal var15 -1) 
    var15 = 0
  elif Equal DistBackEdge DistFrontEdge
    var15 = 2
  elif Equal var15 -1
    if var16 < 0
      var15 = 1
    elif var16 > 0
      var15 = -1
    endif
  else
    var15 = 0
  endif
if Equal var15 2 && !(Equal AirGroundState 1)
  var18 = 0
  Call RecoveryHub
endif
Return
label CTD
  // this prevents it from auto-attacking.
  // this issue persisted for... 9 months
  Cmd30
  if var20 >= 24625 && var20 <= 24631
    if Equal AirGroundState 1 && Equal CurrAction 3 && !(Equal var20 24636) && !(Equal var20 24630)
      var16 = 0
    elif Equal AirGroundState 2
      var16 = 0
    else
      var16 = 0
    endif
  elif var20 >= 24641 && var20 <= 24655
    var16 = 0
    if Equal AirGroundState 1
      var16 = 0
    endif
  elif Equal var20 25000
    var16 = OFramesHitstun 
  endif
  // SAFE_WRITE_C var9
  // SAFE_WRITE_D var10
  // SAFE_WRITE_E var11
  // SAFE_WRITE_F var12  
  SAFE_INJECT_C var9
  SAFE_INJECT_D var10
  SAFE_INJECT_E var11
  SAFE_INJECT_F var12
  var15 = 0
  // calculate own estimated position
  var17 = var13 + var16
  // if using a grounded attack then own offset will be very small
  if var20 >= 24625 && var20 <= 24631
    var17 = 0
  endif
  var17 += 1
  if OAnimFrame <= 2
    var2 = OTopNX + OXSpeed * var17
  var17 = var13
  var23 = OYSpeed * -1
  CalcYChange var3 var17 var23 OGravity OMaxFallSpeed OFastFallSpeed 0
    var3 = OTopNY - var3
    // DrawDebugRectOutline OTopNX OTopNY 5 5 0 255 255 221
  else 
    EstOXCoord var2 var17
    EstOYCoord var3 var17
  endif
  var17 -= 1
  var17 /= 60
  EstOPosVecR var15 var17 var17
  if OAnimFrame > 2
    var22 = ExactOXCoord - ExactXCoord
    var22 = var22 - (OTopNX - TopNX)
    var15 -= var22
    var22 = ExactOYCoord - ExactYCoord
    var22 = var22 - (OSCDBottom - TopNY)
    var17 -= var22
  endif
    var15 += TopNX
    var17 += TopNY
    var15 -= OTopNX
    var15 *= -2
    var22 = var2 - OTopNX
    var15 += var22
    var15 += TopNX
  // estimate target position separately  
  var22 = var13 + var16
  // calculate own Y coord because I can't figure out the !@$% EstOPosVecR thing
  var17 = var13
  if Equal CurrSubaction JumpSquat
    var22 = -2
  else
    var22 = YSpeed * -1
  endif
  CalcYChange var3 var17 var22 Gravity MaxFallSpeed FastFallSpeed 0
  var17 = TopNY - var3
  // calculate Opponent change in 0.16 (used later)
  // if !(Equal OYSpeed 0) 
  //   O_CALC_SELF_Y_CHANGE_GRAVITY(var2, var13)
  // endif
  // it's awful, I know, but i'm all out of variables and this was the only way lol
  var22 = var13 
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
  CalcYChange var3 var17 var23 OGravity OMaxFallSpeed OFastFallSpeed 0
    var3 = OTopNY - var3
    var3 *= -1
    if OCurrAction <= 9 && var20 < 24641
      var22 *= 0.0
    endif
    var2 = OTopNX + OXSpeed * var22
    // DrawDebugRectOutline OTopNX OTopNY 5 5 0 255 255 221
    // DrawDebugRectOutline var2 var3 5 5 255 255 0 136
  else 
    EstOYCoord var3 var22
    // if the opponent is in an actionable state, lower the estimate of
    // their x offset to prevent dashdancing from setting it off when very far away
    if OCurrAction <= 9 && var20 < 24641
      var22 *= 0.0
    endif
    EstOXCoord var2 var22
    var3 = var3 + (OSCDBottom - OTopNY)
  endif
  var16 = TopNY + YDistBackEdge
  if SamePlane && var3 <= var16 && !(MeteoChance)
    var3 = var16
  endif
  if !(CalledAs ComboHub)
    // if Equal var16 4
    //   var22 = 20 * OPos
    //   var2 -= var22
    // elif Equal var16 5
    //   var22 = 20 * OPos
    //   var2 += var22
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
      var2 -= var22
    endif
    if Equal var16 12
      predictAverage var22 3 LevelValue
      var22 += 15
      var22 *= OPos
      var23 = OXSpeed
      Abs var23
      var23 *= 0.5
      var22 *= var23
      var2 -= var22
    endif
    if LevelValue >= 75 && !(Equal var16 7) && OCurrAction <= 15 && Equal OIsOnStage 1
      predictOOption var22 13 LevelValue
      var22 = 30 * OPos
      if Equal var22 1
        var2 += var22
      elif Equal var22 3
        var2 -= var22
      endif
    endif
    if Equal var20 24636 || Equal var20 24630
      if CurrAction >= 3 && CurrAction <= 4
        var22 = 10 * OPos
        var2 += var22
      endif
    endif
    if LevelValue >= 48 && CalledAs ApproachHub
      predictOOption var22 15 LevelValue
      predictionConfidence var16 15 LevelValue
      if Equal var22 1 && Rnd < var16
        if var20 >= 24641 && var20 <= 24649
          var22 = var13 + 4 + 3
        else
          var22 = var13
        endif
        EstOYCoord var22 var22
        var16 = TopNY + YDistBackEdge
        if SamePlane && var22 <= var16 
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
            var16 = -9999.9999
          endif 
          predictOOption var22 9 LevelValue
          if Equal var22 1
            LOGSTR 1414485760 1095910400 1392508928 0 0
            var22 = 21
            if Equal OCurrAction 97
              var22 -= OAnimFrame
            endif
            var22 *= 2 * OPos
            var2 -= var22
          elif Equal var22 3
            LOGSTR 1096237312 1493172224 0 0 0
            var22 = 21
            if Equal OCurrAction 97
              var22 -= OAnimFrame
            endif
            var22 *= 2 * OPos
            var2 += var22
          endif
        endif
      endif
    endif
  endif
  // correct to be sure it's not senslessly offstage
  if Equal OIsOnStage 1 && Equal OFramesHitstun 0
    var22 = var2 - TopNX
    GetYDistFloorOffset var22 var22 0 0
    if Equal var22 -1
      var22 = OXDistBackEdge
      Abs var22
      if var22 > OXDistFrontEdge
        var22 = OXDistFrontEdge
      endif
      var2 = OTopNX + var22 
      // var2 *= OPos
    endif
  endif 
  // var2 = estimated target x position
  // var3 = estimated target y position
  // var15 = estimated own x position
  // var17 = estimated own y position
  // var22 = temporary variable
  // var16 = by some miracle, another temporary variable
  if Equal var20 24647 || Equal var20 24649
    var17 = TopNY
  endif
  // correct if estimated y positions go beyond ground level
  // target
  // var17 += var22
  // var17 -= var16
  // if var16 > 0 && Equal OAirGroundState 2
  //   var17 -= var16
  // endif
  // var22 = OTopNY - var16
  // DrawDebugLine OTopNX OTopNY OTopNX var22 255 0 0 221
  var22 = OYDistBackEdge + OTopNY
  if var3 < var22 && Equal OIsOnStage 1
    var22 -= var3
    var3 += var22
  elif Equal OCurrAction 70 || Equal OCurrAction 74 || Equal OCurrAction 84 || Equal OCurrAction 85
    var22 -= var3
    var3 += var22
  elif Equal OAirGroundState 1
    // var17 -= var16
  endif
  if Equal AirGroundState 1
    var17 = TopNY
  endif
  // if !(CalledAs ComboHub)
  //   // self
  //   DrawDebugRectOutline var15 var17 5 5 255 0 0 136
  //   // target
  //   DrawDebugRectOutline var2 var3 5 5 0 0 255 136
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
      var15 = var15 - (var9 * OPos)
    else 
      var15 = var15 + (var11 * OPos)
      var15 = var15 + (var9 * OPos)
    endif 
  else
    var15 = var15 + (var11 * Direction)
    var15 = var15 + (var9 * Direction)
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
  //     DrawDebugRectOutline var15 var17 var11 var12 255 187 0 136
  //   endif
  // endif
  // calculate difference between the two
  
  var2 = var15 - var2
  var3 = var3 - var17
  // adjust for opponent position (aim towards nearest blastzone)
  // if !(Equal var20 32776) && !(Equal var20 25000) && !(CalledAs ComboHub)
  //   var22 = 0
  //   var17 = LBoundary - (TopNX + var2) 
  //   if var17 < 90 && Equal Direction (-1)
  //     var17 = 0.0 + 1
  //     var17 = var11 * (1/var17)
  //     var17 /= 2
  //     var22 += var17
  //   endif
  //   var17 = RBoundary - (TopNX + var2)
  //   if var17 > -90 && Equal Direction 1
  //     var17 = 0.0 + 1
  //     var17 = var11 * (1/var17)
  //     var17 /= 2
  //     var22 -= var17
  //   endif
  //   var2 += var22
  //   if Equal var22 0
  //     var22 = Direction
  //     var17 = 0.0 + 1
  //     var17 = var11 * (1/var17)
  //     var22 *= var17
  //     var22 /= 2
  //     var2 -= var22
  //   endif
  // endif
  // account for target height
  var22 = 0
  SAFE_INJECT_D var22
  var17 = OSCDBottom + OHurtboxSize // top of target
  var15 = var3 * -1
  if var15 >= OHurtboxSize
    // self is above
    var15 = OHurtboxSize
  elif var15 <= 0 
    // self is below
    var15 = 0 // OHurtboxSize * -1
  else 
    // self is between
    var17 = var15 - OHurtboxSize
    // var15 -= var17
    // var15 = var22
  endif
  
  // if Equal AirGroundState 2
    
  //   if Equal OAirGroundState 1
  //     // var15 = var15 + OHurtboxSize * 0.5
  //     var15 += OHurtboxSize
  //   endif
  // endif
  var3 += var15
  if Equal AirGroundState 1 && Equal OAirGroundState 1 && var20 >= 24641 && var20 <= 24645 && SamePlane
    var3 = 0
  endif
  // if !(CalledAs ComboHub)
  //   var2 += TopNX
  //   var3 += TopNY
  //   DrawDebugRectOutline var2 var3 var11 var12 0 255 0 136
  //   var2 -= TopNX
  //   var3 -= TopNY
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
  //   var17 += var15
    
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
  //   var2 = var2 + OXSpeed * var17 * -2
  // endif
Return 
Return
