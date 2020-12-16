// HOVER APPROACH HUB
// controls how mewtwo approaches to attack during hover

id 0x8102

unk 0x00000

SetTimeout 400

var21 = 33026

label

if !(Equal CurrAction 288)
  if Equal AirGroundState 1
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

Seek LOOP_DIST_CHECK
Jump
label LOOP_DIST_EXIT
if !(True)
  label LOOP_DIST_CHECK
  SAFE_INJECT_4 var9
  SAFE_INJECT_5 var10
  SAFE_INJECT_6 var11
  SAFE_INJECT_7 var12
  var17 = OTopNY + OHurtboxSize
  var2 = var12 / 2
  var2 = TopNY - var10 + var2
  if var2 > var17
    var2 = OHurtboxSize * -1
  elif var2 < OTopNY
    var2 = 0
  else
    var17 = (var17 - var2)
    var17 = var17 * -1
    var2 = OHurtboxSize / var17
  endif
  // if Equal var8 0 || Equal var8 1 || Equal var18 1
  //   var0 = TopNX + (var9 * Direction)
  //   var0 = var0 + (var11 * Direction)
  //   var1 = TopNY - var10 + var12
  //   DrawDebugRectOutline var0 var1 var11 var12 255 68 68 153
  //   var1 += var2
  //   if var10 > -2 && var20 >= 24641 && var20 <= 24655
  //     var1 = var1 + var10 + 2 - var2
  //   endif
  //   if Equal PlayerNum 0
  //     DrawDebugRectOutline var0 var1 var11 var12 255 68 68 153
  //   elif Equal PlayerNum 1
  //     DrawDebugRectOutline var0 var1 var11 var12 68 68 255 153
  //   elif Equal PlayerNum 2
  //     DrawDebugRectOutline var0 var1 var11 var12 255 255 68 153
  //   elif Equal PlayerNum 3
  //     DrawDebugRectOutline var0 var1 var11 var12 68 255 68 153
  //   else
  //     DrawDebugRectOutline var0 var1 var11 var12 68 68 68 153
  //   endif
  //   var3 = OHurtboxSize / 2
  //   var17 = OTopNY + var3
  //   DrawDebugRectOutline OTopNX var17 var11 var3 68 255 68 153
  // endif
  var17 = 0
 // SAFE_INJECT_1 var17
  var17 = var13 + var8 + var3 + var17
  var17 /= 60
  EstOPosVecR var0 var1 var17
  // convert the values to use TopN X and Y instead of character's coordinates
  var17 = ExactOXCoord - ExactXCoord
  var17 = var17 - (OTopNX - TopNX)
  var0 = var0 - var17
  var17 = ExactOYCoord - ExactYCoord
  var17 = var17 - (OTopNY - TopNY)
  var1 = var1 - var17
  var0 += TopNX
  var0 = var0 - (var11 * Direction)
  var1 += TopNY
  // var17 = YDistBackEdge
  // if var10 > -2 && var20 >= 24641 && var20 <= 24655
  //   var1 = var1 + var10 + 2 - var2 - OHurtboxSize
  // endif
  // var1 -= TopNY
  var17 = var2 * 2
  var1 -= var17
  var1 = var1 - var12
  var1 += var10
  var0 = var0 - (var9 * Direction)
  // if Equal var8 0 || Equal var8 1 || Equal var18 1
  //   DrawDebugRectOutline var0 var1 var11 var12 255 0 0 136
  // endif
  var0 -= TopNX
  var1 -= TopNY

  // var0 and var1 come from the macro
  var2 = var0
  var3 = var1
  Abs var2
  Abs var3

  if var2 <= var11
    var17 = var12 + (OHurtboxSize / 2)
    if var3 <= var17
  var17 = var15
  var4 = 0
  var3 = YSpeed * -1
  Seek l_test
  Jump
  if !(True)
    label l_test
    var4 += var3
    var17 -= 1
    var3 += 0.082 // 0.082
    if var3 > 2.3
      var3 = 2.3
    elif var3 > MaxFallSpeed
      var3 = MaxFallSpeed
    endif
    if var17 < 1
      Seek
    else
      Seek l_test
    endif
    Jump
  endif
  label
      var4 = (YDistFrontEdge * -1) - var4

  GetNearestCliff var2
  var17 = var15 + 3
  var3 = XSpeed * var17
  var3 += TopNX
  if var2 < 0
    if Equal IsOnStage 1 && !(Equal DistBackEdge DistFrontEdge)
      var2 -= var3
      if var2 >= 0
        var2 = 1
      endif
    endif
  elif var2 > 0
    if Equal IsOnStage 1 && !(Equal DistBackEdge DistFrontEdge)
      var2 -= var3
      if var2 <= 0
        var2 = -1
      endif
    endif
  endif
  if !(Equal var2 1) && !(Equal var2 -1)
    if Equal DistBackEdge DistFrontEdge || Equal IsOnStage 0
      var2 = 2
    else
      var2 = 0
    endif
  endif
      
      if !(Equal var2 0)
        if !(CanJump) && NumJumps > 0 && var4 < -40
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
elif !(CanJump) && YDistBackEdge > 60
  Call RecoveryHub
elif !(CanJump) && NumJumps > 0 && YDistBackEdge > 40
  Call RecoveryHub
endif

AbsStick var0 var1

if YDistBackEdge > -5 && Equal IsOnStage 1 && var1 < 0
  ClearStick 1
endif

Seek Begin
Return
label CallAttacks

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
endif

Return
Return
