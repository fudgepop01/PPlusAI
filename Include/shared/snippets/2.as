#snippet CTD
  EST_O_COORDS(var0, var1, frameToCalc)

  var0 -= TopNX
  var1 = TopNY - var1

  #let calcMoveXRange = var2
  #let calcMoveYRange = var3

  calcMoveXRange = move_xRange * (1 + hitboxSizeMultiplier)
  calcMoveYRange = move_yRange * (1 + hitboxSizeMultiplier)
  calcMoveXRange *= 2
  calcMoveYRange *= 2
  Abs targetXDistance
  Abs targetYDistance

  if Equal AirGroundState 1
    calcMoveXRange = calcMoveXRange + frameToCalc * dashRunTermVel
  else
    calcMoveXRange = calcMoveXRange + frameToCalc * XSpeed
  endif

  if NumJumps > 0
    if lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F) || Equal lastAttack valGeneral 
      globTempVar = GetJumpHeight * 2
      calcMoveYRange += globTempVar 
    endif
  endif

  if targetXDistance <= calcMoveXRange && targetYDistance <= calcMoveYRange
    // targetXDistance += OTopNX
    // targetYDistance += OTopNY
    // DrawDebugRectOutline targetXDistance targetYDistance calcMoveXRange calcMoveYRange color(0xFF000088)

    // targetXDistance -= OTopNX 
    // targetXDistance += TopNX
    // targetYDistance -= OTopNY
    // targetYDistance += TopNY
    // DrawDebugRectOutline targetXDistance targetYDistance calcMoveXRange calcMoveYRange color(0x0000FF88)

    Seek callMove
    Jump
  endif
#endsnippet

#snippet COMBO_OPTIONS
  $refreshMoves()
  $filterMoveEndlag(30)
  $outputWithKnockbackThresholds(90, 290, Goto)
#endsnippet

#snippet JUGGLE_OPTIONS
  $refreshMoves()
  $filterMoveAngle(60, 120)
  $output(Goto)
#endsnippet

#snippet KILL_OPTIONS
  $refreshMoves()
  $filterMoveAngle(0, 180)
  $outputWithKnockbackThresholds(180, 400, Goto)
#endsnippet

#snippet MOVE_GENERATION
  $generateMovesUsed()
#endsnippet