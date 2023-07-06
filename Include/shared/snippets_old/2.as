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
  // DrawDebugRectOutline targetXDistance targetYDistance calcMoveXRange calcMoveYRange color(0x00FF0088)
  // targetXDistance -= TopNX
  // targetYDistance -= TopNY

  Abs targetXDistance
  Abs targetYDistance
  // LOGSTR str("TXD / range")
  // LOGVAL targetXDistance
  // LOGVAL calcMoveXRange
  // LOGSTR str("TYD / range")
  // LOGVAL targetYDistance
  // LOGVAL calcMoveYRange

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
      LOGSTR str("KB")
      LOGVAL move_currKnockback
      COS globTempVar move_angle
      globTempVar *= move_currKnockback
      LOGVAL globTempVar
      SIN globTempVar move_angle
      globTempVar *= move_currKnockback
      LOGVAL globTempVar

      KILL_CHECK(result, move_currKnockback, move_angle, targetXDistance, targetYDistance)
      if Equal result 1
        LOGSTR str("k")
        Seek callMove
        Jump
      endif

      if Equal moveType mt_combo
        LOGSTR str("c")
        #let result = var2
        MOVE_KB_WITHIN(result, move_currKnockback, move_angle, 40, 0, 120 + comboToleranceOffset, 0, 120)
        if Equal result 1
          // LOGSTR str("cCalling")
          Seek callMove
          Jump
        endif
      elif Equal moveType mt_juggle
        LOGSTR str("j")
        #let result = var2
        MOVE_KB_WITHIN(result, move_currKnockback, move_angle, 30, 0, 35 + comboToleranceOffset, 0, 140)
        if Equal result 1
          // LOGSTR str("jCalling")
          Seek callMove
          Jump
        endif
      elif Equal moveType mt_downward
        LOGSTR str("d")
        if move_angle >= 180 && move_angle <= 360
          // LOGSTR str("dCalling")
          Seek callMove
          Jump
        endif
      endif
  endif
#endsnippet

#snippet COMBO_PHASES
  if phase <= 3
    moveType = mt_kill
    Goto killOptions
  elif Rnd <= 0.3 && OYDistBackEdge < -20 && !(Equal OAirGroundState 1)
    moveType = mt_downward
    Goto downwardOptions
  else
    moveType = mt_combo
    Goto comboOptions
  endif
#endsnippet

#snippet JUGGLE_PHASES
  if phase <= 3
    moveType = mt_kill
    Goto killOptions
  elif Rnd <= 0.3 && OYDistBackEdge > -30 && !(Equal OAirGroundState 1)
    moveType = mt_downward
    Goto downwardOptions
  else
    moveType = mt_juggle
    Goto juggleOptions
  endif
#endsnippet

#snippet GLOB_FILTERS
#endsnippet

#snippet COMBO_GR_FILTERS
  {GLOB_FILTERS}
#endsnippet

#snippet COMBO_AIR_FILTERS
  {GLOB_FILTERS}
#endsnippet

#snippet JUGGLE_GR_FILTERS
  {GLOB_FILTERS}
#endsnippet

#snippet JUGGLE_AIR_FILTERS
  {GLOB_FILTERS}
#endsnippet

#snippet KILL_GR_FILTERS
  {GLOB_FILTERS}
#endsnippet

#snippet KILL_AIR_FILTERS
  {GLOB_FILTERS}
#endsnippet

#snippet DOWN_GR_FILTERS
  {GLOB_FILTERS}
#endsnippet

#snippet DOWN_AIR_FILTERS
  {GLOB_FILTERS}
#endsnippet

#snippet COMBO_OPTIONS
  EstOYCoord globTempVar OFramesHitstun
  globTempVar -= OTopNY
  GetYDistFloorOffset globTempVar 0 globTempVar 1
  // LOGSTR str("ydfo")
  // LOGVAL globTempVar
  if globTempVar < 30
    $refreshMoves()
    $filterMoveEndlag(30)
    {COMBO_GR_FILTERS}
    $output(Goto)
  else
    $refreshMoves()
    $excludeMovesNotOrigin(NAir|BAir|FAir|DAir|UAir|SSpecialAir|DSpecialAir|NSpecialAir|USpecialAir)
    {COMBO_AIR_FILTERS}
    $output(Goto)
  endif
#endsnippet

#snippet JUGGLE_OPTIONS
  EstOYCoord globTempVar OFramesHitstun
  globTempVar -= OTopNY
  GetYDistFloorOffset globTempVar 0 globTempVar 1
  // LOGSTR str("ydfo")
  // LOGVAL globTempVar
  if globTempVar < 30
    $refreshMoves()
    $filterMoveAngle(0, 180)
    {JUGGLE_GR_FILTERS}
    $output(Goto)
  else
    $refreshMoves()
    $filterMoveAngle(0, 180)
    $excludeMovesNotOrigin(NAir|BAir|FAir|DAir|UAir|SSpecialAir|DSpecialAir|NSpecialAir|USpecialAir)
    {JUGGLE_AIR_FILTERS}
    $output(Goto)
  endif
#endsnippet

#snippet KILL_OPTIONS
  EstOYCoord globTempVar OFramesHitstun
  globTempVar -= OTopNY
  GetYDistFloorOffset globTempVar 0 globTempVar 1
  // LOGSTR str("ydfo")
  // LOGVAL globTempVar
  if globTempVar < 30
    $refreshMoves()
    {KILL_GR_FILTERS}
    $output(Goto)
  else
    $refreshMoves()
    $excludeMovesNotOrigin(NAir|BAir|FAir|DAir|UAir|SSpecialAir|DSpecialAir|NSpecialAir|USpecialAir)
    {KILL_AIR_FILTERS}
    $output(Goto)
  endif
#endsnippet

#snippet DOWNWARD_OPTIONS
  EstOYCoord globTempVar OFramesHitstun
  globTempVar -= OTopNY
  GetYDistFloorOffset globTempVar 0 globTempVar 1
  // LOGSTR str("ydfo")
  // LOGVAL globTempVar
  if globTempVar < 30
    $refreshMoves()
    $filterMoveAngle(180, 360)
    {DOWN_GR_FILTERS}
    $output(Goto)
  else
    $refreshMoves()
    $filterMoveAngle(180, 360)
    $excludeMovesNotOrigin(NAir|BAir|FAir|DAir|UAir|SSpecialAir|DSpecialAir|NSpecialAir|USpecialAir)
    {DOWN_AIR_FILTERS}
    $output(Goto)
  endif
#endsnippet

#snippet MOVE_GENERATION
  $generateMovesUsedKB()
#endsnippet