#snippet CTD
  CALC_TARGET_DISTANCES(var0, var1, var2, var3, frameToCalc)
  #let calcMoveXRange = var2
  #let calcMoveYRange = var3

  calcMoveXRange = move_xRange * (1 + hitboxSizeMultiplier)
  calcMoveYRange = move_yRange * (1 + hitboxSizeMultiplier)
  calcMoveXRange *= 2
  calcMoveYRange *= 2

  if Equal AirGroundState 1
    calcMoveXRange = calcMoveXRange + frameToCalc * dashRunTermVel
  else
    immediateTempVar = XSpeed
    Abs immediateTempVar
    calcMoveXRange = calcMoveXRange + frameToCalc * immediateTempVar
  endif

  if NumJumps > 0
    if lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F) || Equal lastAttack valGeneral 
      globTempVar = GetJumpHeight
      calcMoveYRange += globTempVar 
    endif
  endif

  // targetXDistance += TopNX
  // targetYDistance += TopNY
  // DrawDebugRectOutline targetXDistance targetYDistance move_xRange move_yRange color(0x00FF0088)
  // targetXDistance -= TopNX
  // targetYDistance -= TopNY

  Abs targetXDistance
  Abs targetYDistance

  if targetXDistance <= calcMoveXRange && targetYDistance <= calcMoveYRange
      Norm immediateTempVar TopNX TopNY
      Norm globTempVar OTopNX OTopNY
      #let comboToleranceOffset = var2
      if globTempVar > immediateTempVar
        comboToleranceOffset = 50
      else
        comboToleranceOffset = 0
      endif

      #let result = var2
      EstOXCoord targetXDistance frameToCalc
      EstOYCoord targetYDistance frameToCalc
      KILL_CHECK(result, move_currKnockback, move_angle, targetXDistance, targetYDistance)
      if Equal result 1
        Seek callMove
        Jump
      endif

      if Equal moveType mt_combo
        #let result = var2
        MOVE_KB_WITHIN(result, move_currKnockback, move_angle, 50, 0, 70 + comboToleranceOffset, 0, 120)
        if Equal result 1
          LOGSTR str("cCalling")
          Seek callMove
          Jump
        endif
      elif Equal moveType mt_juggle
        #let result = var2
        MOVE_KB_WITHIN(result, move_currKnockback, move_angle, 50, 0, 30 + comboToleranceOffset, 0, 80)
        if Equal result 1
          LOGSTR str("jCalling")
          Seek callMove
          Jump
        endif
      endif
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
  $generateMovesUsedKB()
#endsnippet