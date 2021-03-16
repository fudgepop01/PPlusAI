#snippet CTD
  CALC_TARGET_DISTANCES(var0, var1, var4, var2, var4, frameToCalc, _dummy, _dummy)

  #let calcMoveXRange = var2
  #let calcMoveYRange = var3

  calcMoveXRange = move_xRange
  calcMoveYRange = move_yRange
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
  $filterMoveEndlag(20)
  $outputWithKnockbackThresholds(90, 290, Goto)
#endsnippet

#snippet JUGGLE_OPTIONS
  $refreshMoves()
  $filterMoveAngle(60, 120)
  $output(Goto)
#endsnippet

#snippet KILL_OPTIONS
  $refreshMoves()
  $outputWithKnockbackThresholds(180, 400, Goto)
#endsnippet