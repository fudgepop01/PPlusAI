// macros are extremely important and can be used as building blocks
// or abstractions to keep routines clean.
// by having a line that consists solely of one of these names
// such as "CALC_TARGET_DISTANCES", the preprocessor will replace it
// with everything in here.
//
// This also means that any variables that are defined here can also be
// used outside of the script -- so after plonking down "CALC_TARGET_DISTANCES"
// I can use targetXDistance. you'll see this in 1.as

#macro CALC_TARGET_DISTANCES(out1, out2, index, calcVar, gravVar, frameCount, lab1, lab2)
  // this prevents it from auto-attacking.
  // this issue persisted for... 9 months
  Cmd30
  #let gv = {gravVar}
  if lastAttack >= valJab123 && lastAttack <= valDSmash
    if Equal AirGroundState 1 && Equal CurrAction hex(0x03) && !(Equal lastAttack hex(0x603C)) && !(Equal lastAttack hex(0x6036))
      gv = 0
    elif Equal AirGroundState 2
      gv = 0
    else
      gv = 0
    endif
  elif lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F)
    gv = 0
    if Equal AirGroundState 1
      gv = jumpSquatFrames
    endif
  elif Equal lastAttack valGeneral
    gv = OFramesHitstun 
  endif
  
  #let index = {index}

  if index < 1
    index = 1
  endif

  SAFE_WRITE_4 move_xOffset
  SAFE_WRITE_5 move_yOffset
  SAFE_WRITE_6 move_xRange
  SAFE_WRITE_7 move_yRange  
  SAFE_INJECT_4 move_xOffset
  SAFE_INJECT_5 move_yOffset
  SAFE_INJECT_6 move_xRange
  SAFE_INJECT_7 move_yRange

  #let tempTargetX = {out1}
  #let tempTargetY = {out2}
  #let localTemp = {calcVar}
  // calculate own estimated position
  globTempVar = {frameCount} + gv
  // if using a grounded attack then own offset will be very small
  if lastAttack >= valJab123 && lastAttack <= valDSmash
    globTempVar = 0
  endif
  globTempVar += 1
  EstOXCoord tempTargetX globTempVar
  EstOYCoord tempTargetY globTempVar

  globTempVar -= 1
  globTempVar /= 60
  EstOPosVecR localTemp globTempVar globTempVar

  immediateTempVar = ExactOXCoord - ExactXCoord
  immediateTempVar = immediateTempVar - (OTopNX - TopNX)
  localTemp -= immediateTempVar

  immediateTempVar = ExactOYCoord - ExactYCoord
  immediateTempVar = immediateTempVar - (OSCDBottom - TopNY)
  globTempVar -= immediateTempVar

  localTemp += TopNX
  globTempVar += TopNY

  localTemp -= OTopNX
  localTemp *= -2
  immediateTempVar = tempTargetX - OTopNX
  localTemp += immediateTempVar
  localTemp += TopNX

  // estimate target position separately  

  #let targetX = {out1}
  #let targetY = {out2}
  immediateTempVar = {frameCount} + gv

  gv = 0
  if CalledAs ApproachHub // because this involves a label
    LOG_MOVE

    // calculate own Y coord because I can't figure out the !@$% EstOPosVecR thing
    CALC_SELF_Y_CHANGE_GRAVITY(targetY, gv, {frameCount}, _MID_CALC_GRAV)
    globTempVar = TopNY - targetY

    // calculate Opponent change in gravity (used later)
    GET_WEIGHT_TABLE(gv, gv) // at this point gv is useless and can be overwritten

    O_CALC_SELF_Y_CHANGE_GRAVITY(targetX, targetY, gv, {frameCount} + gv, _MID_CALC_O_GRAV)

    gv = targetX
  endif

  // it's awful, I know, but i'm all out of variables and this was the only way lol
  immediateTempVar = {frameCount} 
  if lastAttack >= valJab123 && lastAttack <= valDSmash
    if Equal AirGroundState 1 && Equal CurrAction hex(0x03) && !(Equal lastAttack hex(0x603C)) && !(Equal lastAttack hex(0x6036))
      immediateTempVar += 0
    endif
  elif lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F)
    if Equal AirGroundState 1
      immediateTempVar += jumpSquatFrames
    endif
  elif Equal lastAttack valGeneral
    immediateTempVar += OFramesHitstun 
  endif

  EstOYCoord targetY immediateTempVar
  // if the opponent is in an actionable state, lower the estimate of
  // their x offset to prevent dashdancing from setting it off when very far away
  if OCurrAction <= hex(0x9) && lastAttack < valNAir
    immediateTempVar *= 0.3
  endif
  EstOXCoord targetX immediateTempVar
  targetY = targetY - (OSCDBottom - OTopNY)

  if LevelValue >= LV8 && !(Equal approachType at_combo) && OCurrAction <= hex(0xF) && Equal OIsOnStage 1
    predictOOption immediateTempVar man_aim LevelValue

    immediateTempVar = 30 * OPos
    if Equal immediateTempVar op_overshoot
      targetX += immediateTempVar
    elif Equal immediateTempVar op_undershoot
      targetX -= immediateTempVar
    endif
  endif

  if LevelValue >= LV6
    if lastAttack >= valNAir && lastAttack <= valDSpecialAir
      immediateTempVar = move_hitFrame + jumpSquatFrames + 3
    else
      immediateTempVar = move_hitFrame
    endif
    EstOYCoord immediateTempVar immediateTempVar
    gv = TopNY + YDistBackEdge
    if SamePlane && immediateTempVar <= gv 
      immediateTempVar = 1
    else
      immediateTempVar = 0
    endif
    if Equal OCurrAction hex(0x61) || Equal OCurrAction hex(0x60)
      Seek
      Jump
    elif OCurrAction >= hex(0x44) && OCurrAction <= hex(0x49) && Equal immediateTempVar 1
      label
      if Equal OCurrAction hex(0x61) && OAnimFrame > 18
      elif Equal OCurrAction hex(0x60)
      else
        gv = -9999.9999
      endif 
      predictOOption immediateTempVar man_techchase LevelValue
      if Equal immediateTempVar op_towards
        LOGSTR str("TOWARDS")
        immediateTempVar = 21
        if Equal OCurrAction hex(0x61)
          immediateTempVar -= OAnimFrame
        endif
        immediateTempVar *= 2 * OPos
        targetX -= immediateTempVar
      elif Equal immediateTempVar op_away
        LOGSTR str("AWAY")
        immediateTempVar = 21
        if Equal OCurrAction hex(0x61)
          immediateTempVar -= OAnimFrame
        endif
        immediateTempVar *= 2 * OPos
        targetX += immediateTempVar
      endif
    endif
  endif

  // targetX = estimated target x position
  // targetY = estimated target y position
  // localTemp = estimated own x position
  // globTempVar = estimated own y position
  // immediateTempVar = temporary variable
  // gv = by some miracle, another temporary variable

  POSITION_CALC_OVERRIDES

  // correct if estimated y positions go beyond ground level
  // target
  // globTempVar += immediateTempVar
  // globTempVar -= gv
  // if gv > 0 && Equal OAirGroundState 2
  //   globTempVar -= gv
  // endif
  // immediateTempVar = OTopNY - gv
  // DrawDebugLine OTopNX OTopNY OTopNX immediateTempVar color(0xFF0000DD)

  immediateTempVar = OYDistBackEdge + OTopNY
  if targetY < immediateTempVar && Equal OIsOnStage 1
    immediateTempVar -= targetY
    targetY += immediateTempVar
  elif Equal OCurrAction hex(0x46) || Equal OCurrAction hex(0x4A) || Equal OCurrAction hex(0x54) || Equal OCurrAction hex(0x55)
    immediateTempVar -= targetY
    targetY += immediateTempVar
  elif Equal OAirGroundState 1
    // globTempVar -= gv
  endif

  // self (dependent on target)
  immediateTempVar = YDistBackEdge + TopNY
  if globTempVar < immediateTempVar && Equal IsOnStage 1 && Equal AirGroundState 1
    // if CalledAs ApproachHub && Equal index 1 && lastAttack >= valNAir && lastAttack <= valDAir && InAir
    //   Call AIHub
    // endif 
    immediateTempVar -= globTempVar
    globTempVar += immediateTempVar
  endif

  // if !(CalledAs ComboHub)
  //   if Equal index 1 || movePart >= 1
  //     // self
  //     DrawDebugRectOutline localTemp globTempVar 5 5 color(0xFF000088)
  //     // target
  //     DrawDebugRectOutline targetX targetY 5 5 color(0x0000FF88)
  //   endif
  // endif

  // adjust for move parameters
  if lastAttack >= valNAir && lastAttack <= valDAir
    if Equal AirGroundState 2
      globTempVar -= move_yOffset
      globTempVar += move_yRange
    endif
  else
    globTempVar -= move_yOffset
    globTempVar += move_yRange
  endif
  // globTempVar = globTempVar - OHurtboxSize * 0.5
  
  // adjust for the move parameters
  if !(InAir)
    immediateTempVar = move_xOffset + (move_xRange * 2)
    immediateTempVar /= 2
    if immediateTempVar <= 2
      localTemp = localTemp - (move_xOffset * OPos)
    else 
      localTemp = localTemp + (move_xRange * OPos)
      localTemp = localTemp + (move_xOffset * OPos)
    endif 
  else
    localTemp = localTemp + (move_xRange * Direction)
    localTemp = localTemp + (move_xOffset * Direction)
  endif

  // if !(Equal SCDBottom TopNY) && lastAttack >= hex(0x6040)
  //   immediateTempVar = SCDBottom - TopNY
  //   globTempVar -= immediateTempVar
  // endif

  // if Equal AirGroundState 2
  //   globTempVar -= OHurtboxSize
  // endif
  
  // if !(CalledAs ComboHub)
  //   if Equal index 1 || movePart >= 1
  //     // self
  //     DrawDebugRectOutline localTemp globTempVar move_xRange move_yRange color(0xFFBB0088)
  //   endif
  // endif

  // calculate difference between the two
  #let targetXDistance = {out1}
  #let targetYDistance = {out2}
  
  targetXDistance = localTemp - targetX
  targetYDistance = targetY - globTempVar

  // adjust for opponent position (aim towards nearest blastzone)
  if !(Equal lastAttack hex(0x8008)) && !(Equal lastAttack valGeneral)
    immediateTempVar = 0
    globTempVar = LBoundary - (TopNX + targetXDistance) 
    if globTempVar < 90 && Equal Direction (-1)
      globTempVar = hitboxSizeMultiplier + 1
      globTempVar = move_xRange * (1/globTempVar)
      globTempVar /= 2
      immediateTempVar += globTempVar
    endif
    globTempVar = RBoundary - (TopNX + targetXDistance)
    if globTempVar > -90 && Equal Direction 1
      globTempVar = hitboxSizeMultiplier + 1
      globTempVar = move_xRange * (1/globTempVar)
      globTempVar /= 2
      immediateTempVar -= globTempVar
    endif
    targetXDistance += immediateTempVar

    if Equal immediateTempVar 0
      immediateTempVar = Direction
      globTempVar = hitboxSizeMultiplier + 1
      globTempVar = move_xRange * (1/globTempVar)
      immediateTempVar *= globTempVar
      immediateTempVar /= 2
      targetXDistance -= immediateTempVar
    endif
  endif

  // account for target height
  immediateTempVar = 0
  SAFE_INJECT_D immediateTempVar
  globTempVar = OSCDBottom + OHurtboxSize // top of target
  localTemp = targetYDistance * -1
  if localTemp >= OHurtboxSize
    // self is above
    localTemp = OHurtboxSize
  elif localTemp <= 0 
    // self is below
    localTemp = 0 // OHurtboxSize * -1
  else 
    // self is between
    globTempVar = localTemp - OHurtboxSize
    // localTemp -= globTempVar
    // localTemp = immediateTempVar
  endif
  
  // if Equal AirGroundState 2
    
  //   if Equal OAirGroundState 1
  //     // localTemp = localTemp + OHurtboxSize * 0.5
  //     localTemp += OHurtboxSize
  //   endif
  // endif
  targetYDistance += localTemp
  if Equal AirGroundState 1 && Equal OAirGroundState 1 && lastAttack >= valNAir && lastAttack <= valDAir && SamePlane
    targetYDistance = 0
  endif

  // if !(CalledAs ComboHub)
  //   if Equal index 1 || movePart >= 1
  //     targetXDistance += TopNX
  //     targetYDistance += TopNY
  //     DrawDebugRectOutline targetXDistance targetYDistance move_xRange move_yRange color(0x00FF0088)
  //     targetXDistance -= TopNX
  //     targetYDistance -= TopNY

  //     globTempVar = hitboxSizeMultiplier + 1
  //     globTempVar = move_xRange * (1/globTempVar)
  //     move_xRange = globTempVar
  //     move_xOffset = move_xOffset + globTempVar * hitboxSizeMultiplier

  //     globTempVar = hitboxSizeMultiplier + 1
  //     globTempVar = move_yRange * (1/globTempVar)
  //     move_yRange = globTempVar
  //     move_yOffset = move_yOffset - globTempVar * hitboxSizeMultiplier

  //     // globTempVar = TopNY - move_yOffset + move_yRange + immediateTempVar
  //     // DrawDebugRectOutline TopNX globTempVar 10 0 color(0x00FFFF88)

  //     if CalledAs ApproachHub
  //       move_xRange -= 2.5
  //       move_xOffset += 5
  //     endif

  //     immediateTempVar = (move_xOffset + move_xRange)
  //     immediateTempVar *= Direction
  //     immediateTempVar += TopNX
  //     globTempVar = TopNY - move_yOffset + move_yRange
  //     DrawDebugRectOutline immediateTempVar globTempVar move_xRange move_yRange color(0x88888888)
  //     globTempVar += localTemp
      
  //     // if OTopNX > 0
  //     //   immediateTempVar += move_xRange
  //     // else
  //     //   immediateTempVar -= move_xRange
  //     // endif 
  //     DrawDebugRectOutline immediateTempVar globTempVar move_xRange move_yRange color(0xFFFFFF88)

  //     immediateTempVar = OHurtboxSize / 2
  //     globTempVar = immediateTempVar + OSCDBottom
  //     DrawDebugRectOutline OTopNX globTempVar 5 immediateTempVar color(0xFFFF00DD)
      
  //     if CalledAs ApproachHub
  //       move_xRange += 2.5
  //       move_xOffset -= 5
  //     endif

  //     globTempVar = move_xRange * hitboxSizeMultiplier
  //     move_xOffset -= globTempVar
  //     move_xRange = move_xRange + globTempVar
  //     globTempVar = move_yRange * hitboxSizeMultiplier
  //     move_yOffset += globTempVar
  //     move_yRange = move_yRange + globTempVar

  //   endif
  // endif

  // if !(CalledAs ComboHub) && LevelValue >= LV7 && !(Equal approachType at_combo) 
  //   globTempVar = {frameCount} - index
  //   targetXDistance = targetXDistance + OXSpeed * globTempVar * -2
  // endif
#endmacro

#macro EST_O_COORDS(out1, out2, frameCount)
  #let targetX = {out1}
  #let targetY = {out2}
  targetX = 0
  targetY = 0
  immediateTempVar = {frameCount}
  EstOYCoord targetY immediateTempVar
  // if the opponent is in an actionable state, lower the estimate of
  // their x offset to prevent dashdancing from setting it off when very far away
  if OCurrAction <= hex(0x9) && lastAttack < valNAir
    immediateTempVar /= 3
  endif
  EstOXCoord targetX immediateTempVar
  targetY = targetY - (OSCDBottom - OTopNY)

  // correct if estimated y positions go beyond ground level
  // target
  immediateTempVar = OYDistBackEdge + OTopNY
  if targetY < immediateTempVar && Equal OIsOnStage 1
    immediateTempVar -= targetY
    targetY += immediateTempVar
  elif Equal OCurrAction hex(0x46) || Equal OCurrAction hex(0x4A) || Equal OCurrAction hex(0x54) || Equal OCurrAction hex(0x55)
    targetY += immediateTempVar
  endif

  // DrawDebugRectOutline targetX targetY 5 5 color(0x88FF88DD)

#endmacro

#macro POSITION_CALC_OVERRIDES()
#endmacro

// to make AIs less accurate with their moves the lower their level gets
#macro MESS_MOVE_PARAMS()
  if LevelValue <= LV7
    globTempVar = (100 - LevelValue) / 3
    move_xOffset = move_xOffset + (Rnd * globTempVar * 2) - (globTempVar)
    move_yOffset = move_yOffset + (Rnd * globTempVar * 2) - (globTempVar)

    globTempVar = (100 - LevelValue) / 5
    move_xRange = move_xRange + (Rnd * globTempVar)
    move_yRange = move_yRange + (Rnd * globTempVar)

    globTempVar = (100 - LevelValue) / 15
    move_hitFrame = move_hitFrame + (Rnd * globTempVar) - (globTempVar / 2)

    globTempVar = (100 - LevelValue) / 25
    move_IASA = move_IASA + (Rnd * globTempVar)
  else
    // globTempVar = move_hitFrame * 0.5
    // move_xOffset = move_xOffset - globTempVar
    // move_xRange = move_xRange + globTempVar * 2
    // move_yOffset = move_yOffset - globTempVar
    // move_yRange = move_yRange + globTempVar * 2
  endif
  // if !(Equal lastScript hex(0x8002)) 
    globTempVar = move_xRange * hitboxSizeMultiplier
    move_xOffset -= globTempVar
    move_xRange = move_xRange + globTempVar
    globTempVar = move_yRange * hitboxSizeMultiplier
    move_yOffset += globTempVar
    move_yRange = move_yRange + globTempVar

    // attempts to say each character has a "width" of 4
    if !(Equal lastAttack valGrab)
      move_xRange += 2.5
      move_xOffset -= 5

      // if lastAttack <= valDashAttack && !(Equal lastAttack valUSmash)
      //   immediateTempVar = groundFric * 50
      //   move_xRange += immediateTempVar
      //   immediateTempVar *= 2
      //   move_xOffset -= immediateTempVar
      // endif
    else
      move_xRange -= 1
    endif
  // endif
#endmacro

#macro LOAD_MOVE_DATA(value, name)
  // LOGSTR str("{name}")
  lastAttack = {value}
  move_xOffset = {name}_xOffset
  move_yOffset = {name}_yOffset
  move_xRange = {name}_xRange
  move_yRange = {name}_yRange
  move_hitFrame = {name}_hitFrame
  move_lastHitFrame = {name}_lastHitFrame
  move_IASA = {name}_IASA
#endmacro

#macro COULD_HIT_WITH_FASTFALL(outVar, throwAway1, throwAway2, targetYDistance, frameCount, lName)
  #let canHit = {outVar}
  #let estimate = {throwAway1}

  CALC_FASTFALL_DIST({outVar}, {throwAway1}, {throwAway2}, {frameCount}, {lName})

  estimate = {frameCount}
  estimate /= 60
  estimate /= 2
  EstOYCoord estimate estimate
  // estimate = estimate + ExactOYCoord - OTopNY

  // LOGSTR str("~~~~~~~")
  // LOGVAL OTopNY
  // LOGVAL estimate
  // LOGVAL OYDistBackEdge
  // LOGVAL move_yRange

  globTempVar = OYDistBackEdge + OTopNY

  // if estimate < globTempVar
  //   globTempVar = estimate - globTempVar
  //   estimate -= globTempVar
  // endif

  // if Equal var8 1 || Equal movePart 1
  //   targetXDistance += TopNX
  //   globTempVar = TopNY + canHit
  //   DrawDebugRectOutline targetXDistance globTempVar move_xRange move_yRange color(0x00FFFF88)

  //   globTempVar = estimate
  //   DrawDebugRectOutline targetXDistance globTempVar move_xRange move_yRange color(0xFF00FF88)
  //   targetXDistance -= TopNX
  // endif

  globTempVar = TopNY - estimate
  globTempVar += canHit
  globTempVar -= move_yOffset
  // immediateTempVar = OHurtboxSize / 2
  // globTempVar += immediateTempVar
  // LOGSTR str("~~ ~~ ~~")
  // LOGVAL TopNY
  // LOGVAL OTopNY
  // LOGVAL OHurtboxSize
  // LOGVAL estimate
  // LOGVAL canHit
  // LOGVAL globTempVar
  
  immediateTempVar = YDistBackEdge - 10
  // LOGSTR str("~~~~~~~~~~")
  // LOGVAL immediateTempVar
  // LOGVAL globTempVar

  estimate = move_yRange / 2
  globTempVar -= estimate
  if globTempVar <= estimate 
    estimate *= -1
    canHit *= -1
    if globTempVar > estimate && !(canHit < immediateTempVar)
      canHit = 1
    else
      canHit = 0
    endif
  else
    canHit = 0
  endif
#endmacro

// does what "CalcYChangeGravity" does but with more lines
#macro CALC_SELF_Y_CHANGE_GRAVITY(accumVar, calcVar, frameCount, lName)
  #let accumulator = {accumVar}
  #let tracker = {calcVar}

  immediateTempVar = {frameCount}

  accumulator = 0
  if Equal CurrSubaction JumpSquat
    tracker = -jumpYInitVelShort
  else
    tracker = YSpeed * -1
  endif
  Seek {lName}
  Jump
  if !(True)
    label {lName}
    accumulator += tracker
    immediateTempVar -= 1
    tracker += gravity // gravity
    if tracker > fastFallSpeed
      tracker = fastFallSpeed
    elif tracker > MaxFallSpeed
      tracker = MaxFallSpeed
    endif
    if immediateTempVar < 1
      Seek
    else
      Seek {lName}
    endif
    Jump
  endif
  label
#endmacro

#macro CALC_FASTFALL_DIST(outVar, throwAwayVar1, throwAwayVar2, frameCount, lName)
  #let accumulator = {outVar}
  #let calculator = {throwAwayVar1}
  #let distTracker = {throwAwayVar2}

  globTempVar = {frameCount} //+ 3
  distTracker = 0

  // LOGSTR str("=======")
  // LOGVAL globTempVar
  calculator = YSpeed
  // LOGVAL calculator

  if YSpeed > 0
    label {lName}

    distTracker += calculator
    calculator -= gravity
    globTempVar -= 1
    
    // LOGSTR str("------")
    // LOGVAL globTempVar
    // LOGVAL distTracker

    if calculator <= 0 || globTempVar <= 0
      Seek
    else
      Seek {lName}
    endif
    Jump
  endif
  label

  if Equal AirGroundState 2
    globTempVar = globTempVar * fastFallSpeed
    accumulator = distTracker - globTempVar
    // LOGSTR str("~~~~~~~")
    // LOGVAL accumulator
    // globTempVar = TopNY + accumulator
    // LOGVAL globTempVar
  else
    accumulator = 0
  endif
#endmacro

// does what "CalcYChangeGravity" does but with more lines
#macro O_CALC_SELF_Y_CHANGE_GRAVITY(accumVar, calcVar, oGrav, frameCount, lName)
  #let accumulator = {accumVar}
  #let tracker = {calcVar}

  immediateTempVar = {frameCount}

  accumulator = 0
  tracker = OCharYSpeed + OKBYSpeed
  tracker *= -1
  Seek {lName}
  Jump
  if !(True)
    label {lName}
    accumulator += tracker
    immediateTempVar -= 1
    tracker += {oGrav} // gravity
    if tracker > OMaxFallSpeed
      tracker = OMaxFallSpeed
    endif
    if immediateTempVar < 1
      Seek
    else
      Seek {lName}
    endif
    Jump
  endif
  label
#endmacro

// will calculate whether or not the player will be on stage at their current X velocity after
// a given amount of frames
#macro GOING_OFFSTAGE(outVar, throwAwayVar, frameCount)
  #let goingOffstage = {outVar}
  #let relCliffXPos = {outVar}
  GetNearestCliff relCliffXPos

  #let xPosOffs = {throwAwayVar}
  globTempVar = {frameCount}
  xPosOffs = XSpeed * globTempVar
  relCliffXPos -= TopNX
  if relCliffXPos < 0
    if Equal IsOnStage 1 && !(Equal DistBackEdge DistFrontEdge)
      relCliffXPos -= xPosOffs
      if relCliffXPos >= 0
        goingOffstage = 1
      endif
    endif
  elif relCliffXPos > 0
    if Equal IsOnStage 1 && !(Equal DistBackEdge DistFrontEdge)
      relCliffXPos -= xPosOffs
      if relCliffXPos <= 0
        goingOffstage = -1
      endif
    endif
  endif
  if !(Equal goingOffstage 1) && !(Equal goingOffstage -1)
    if Equal XDistBackEdge XDistFrontEdge || Equal IsOnStage 0
      goingOffstage = 2
    else
      goingOffstage = 0
    endif
  endif
#endmacro

#macro OFFSTAGE_OFFSET(outVar, throwAwayVar, offset)
  #let goingOffstage = {outVar}
  #let relCliffXPos = {outVar}
  GetNearestCliff relCliffXPos

  #let xPosOffs = {throwAwayVar}
  xPosOffs = {offset}
  relCliffXPos -= TopNX
  if relCliffXPos < 0
    if Equal IsOnStage 1 && !(Equal DistBackEdge DistFrontEdge)
      relCliffXPos -= xPosOffs
      if relCliffXPos >= 0
        goingOffstage = 1
      endif
    endif
  elif relCliffXPos > 0
    if Equal IsOnStage 1 && !(Equal DistBackEdge DistFrontEdge)
      relCliffXPos -= xPosOffs
      if relCliffXPos <= 0
        goingOffstage = -1
      endif
    endif
  endif
  if !(Equal goingOffstage 1) && !(Equal goingOffstage -1)
    if Equal DistBackEdge DistFrontEdge || Equal IsOnStage 0
      goingOffstage = 2
    else
      goingOffstage = 0
    endif
  endif
#endmacro

#macro DEFENSIVE_REACTION_TIME(tempVar1, tempVar2)
  if !(OAttacking) || Rnd <= 0.25 || OCurrActionFreq >= 4
    Seek begin
    Jump
  endif
  #let delay = {tempVar1}
  #let tActionFreq = {tempVar2}
  delay = maxBaseReactionTime - minBaseReactionTime
  delay = Rnd * delay + minBaseReactionTime
  if !(Equal delay 0)
    delay = delay + Rnd * (100 - LevelValue) / 6
  endif
  
  // delay = delay - (OCurrActionFreq * 4) 

  #let oFinished = {tempVar2}
  oFinished = 0
  label
  LOGSTR str("==== DEF ====")
  if FramesHitstun > 0
    Call AIHub
  endif
  if !(OAttacking)
    oFinished = 1
  endif
  if Equal CurrAction hex(0x3)
    Stick 0.8
  elif Equal CurrAction hex(0x4)
    Stick 0 (-1)
  endif
  if Equal oFinished 1 && OAttacking
    Seek
    Jump
  elif delay <= 0
    Seek
    Jump
  endif
  delay -= 1
  Return

  label
  SetFrame 0
  label begin
#endmacro

// will setup and perform a jump if the target position is within the given
// ranges
#macro JUMP_IF_IN_RANGES(tempVar)
  #let targetYDistance = {tempVar}
  EstOYCoord globTempVar move_hitFrame
  globTempVar -= TopNY
  LOGVAL globTempVar
  // if MeteoChance && Equal AirGroundState 1 && OYSpeed > 0.01 && OYDistBackEdge > 15
  //   globTempVar += 5
  // endif
  // globTempVar += OHurtboxSize
  // if MeteoChance && Equal IsOnStage 0 && YSpeed < 0.01 && globTempVar > DJIfOBeyond && globTempVar < DJIfOWithin
  //   Button X
  // endif

  if globTempVar > SHIfOBeyond && globTempVar < jumpIfOWithin && Equal AirGroundState 1 && CurrAction <= 9
    Button X
  endif

  if globTempVar > FHIfOBeyond && globTempVar < jumpIfOWithin && Equal CurrSubaction JumpSquat
    Button X
  elif globTempVar > SHIfOBeyond && globTempVar < jumpIfOWithin && Equal CurrSubaction JumpSquat && OAttacking
    Button X
  endif

  if Equal AirGroundState 2 && YDistBackEdge < GetJumpHeight
    // globTempVar -= gravChangeDist
    globTempVar += move_yOffset 
    globTempVar -= move_yRange 
    // immediateTempVar = TopNY + globTempVar
    // DrawDebugLine TopNX TopNY TopNX immediateTempVar color(0x00FFFFDD)
    if globTempVar > DJIfOBeyond && globTempVar < DJIfOWithin && CanJump
      globTempVar = OTopNX - TopNX
      globTempVar *= 0.3
      ClearStick
      AbsStick globTempVar
      Button X
    endif

  //   globTempVar = TopNX + 5
  //   immediateTempVar = TopNY + DJIfOBeyond
  //   DrawDebugLine globTempVar TopNY globTempVar immediateTempVar color(0xFFFF00DD)

  //   globTempVar = TopNX + 10
  //   immediateTempVar = TopNY + DJIfOWithin
  //   DrawDebugLine globTempVar TopNY globTempVar immediateTempVar color(0xFFFF00DD)
  // elif Equal AirGroundState 1
  //   globTempVar = TopNX
  //   immediateTempVar = TopNY + SHIfOBeyond
  //   DrawDebugLine globTempVar TopNY globTempVar immediateTempVar color(0xFFFF00DD)

  //   globTempVar = TopNX + 5
  //   immediateTempVar = TopNY + FHIfOBeyond
  //   DrawDebugLine globTempVar TopNY globTempVar immediateTempVar color(0xFFFF00DD)

  //   globTempVar = TopNX + 10
  //   immediateTempVar = TopNY + jumpIfOWithin
  //   DrawDebugLine globTempVar TopNY globTempVar immediateTempVar color(0xFFFF00DD)
  endif

#endmacro

#macro PUT_ME_AT_TOP()
HITSTUN_CHECK

#let frameCounter = var3
if frameCounter < 0 || frameCounter > move_IASA
  frameCounter = -1
endif
Cmd30
frameCounter += 1
if Equal HitboxConnected 1 && OKBSpeed > hit_knockback && OFramesHitstun > 0
  hit_knockback = OKBSpeed
endif

if Equal frameCounter 1
  if OAttacking && Rnd < 0.8
    trackOAction man_attacking op_attack
  elif OCurrAction >= hex(0x1A) && OCurrAction <= hex(0x21) && Rnd < 0.8
    trackOAction man_attacking op_defend
  elif OCurrAction >= hex(0x34) && OCurrAction <= hex(0x38) && Rnd < 0.8
    trackOAction man_attacking op_grab
  elif Rnd < 0.3
    trackOAction man_attacking op_null
  endif
endif
if Equal frameCounter 10
  APPROACH_MAN_TRIGGER
endif

if Equal frameCounter move_hitFrame && !(Equal approachType at_throwOut) && Equal lastScript hex(0x8001)
  predictOOption globTempVar man_aim LevelValue
  immediateTempVar = OTopNX - TopNX
  if immediateTempVar < -15 && Equal HitboxConnected 0
    if Equal AirGroundState 2
      if XSpeed < -0.2
        if Equal globTempVar op_undershoot
          trackOAction man_aim op_neutral
        else
          trackOAction man_aim op_overshoot
        endif
      elif XSpeed > 0.2
        if Equal globTempVar op_overshoot
          trackOAction man_aim op_neutral
        else
          trackOAction man_aim op_undershoot
          trackOAction man_aim op_undershoot
        endif
      endif
    elif True
      if Equal OPos Direction
        if Equal globTempVar op_undershoot
          trackOAction man_aim op_neutral
        else
          trackOAction man_aim op_overshoot
        endif
      elif True
        if Equal globTempVar op_overshoot
          trackOAction man_aim op_neutral
        else
          trackOAction man_aim op_undershoot
          trackOAction man_aim op_undershoot
        endif
      endif
    endif
  elif immediateTempVar > 15 && Equal HitboxConnected 0
    if Equal AirGroundState 2
      if XSpeed < -0.2
        if Equal globTempVar op_overshoot
          trackOAction man_aim op_neutral
        else
          trackOAction man_aim op_undershoot
          trackOAction man_aim op_undershoot
        endif
      elif XSpeed > 0.2
        if Equal globTempVar op_undershoot
          trackOAction man_aim op_neutral
        else
          trackOAction man_aim op_overshoot
        endif
      endif
    elif True
      if Equal OPos Direction
        if Equal globTempVar op_undershoot
          trackOAction man_aim op_neutral
        else
          trackOAction man_aim op_overshoot
        endif
      elif True
        if Equal globTempVar op_overshoot
          trackOAction man_aim op_neutral
        else
          trackOAction man_aim op_undershoot
          trackOAction man_aim op_undershoot
        endif
      endif
    endif
  else
    trackOAction man_aim globTempVar
  endif
  immediateTempVar = Rnd * 7
  if immediateTempVar < 1
    trackOAction man_aim op_overshoot
  elif immediateTempVar < 2
    trackOAction man_aim op_neutral
  elif immediateTempVar < 4
    trackOAction man_aim op_undershoot
  endif
  // HIGHLIGHT_GUESSES(man_aim, LevelValue)
endif

if frameCounter >= move_IASA || CurrAction <= hex(0x09)
  Call AIHub
endif
#endmacro

#macro APPROACH_MAN_TRIGGER()
  if OAttacking && Rnd < 0.7
    trackOAction man_approach op_attack
  elif OCurrAction >= hex(0x1A) && OCurrAction <= hex(0x21) && Rnd < 0.7
    trackOAction man_approach op_defend
  elif OCurrAction >= hex(0x34) && OCurrAction <= hex(0x38) && Rnd < 0.7
    trackOAction man_approach op_grab
  elif Rnd < 0.2
    trackOAction man_approach op_null
  endif
#endmacro

#macro TECHCHASE_SITUATION(v0, v1, v2, v3, v4, v5, patience, onBored, onWake)
  SetTimeout 300
  #let patience = {v0}
  #let rollFlag = {v1}
  #let distance = {v2}
  patience = {patience}
  rollFlag = 0
  if Damage < 80
    distance = techChaseCloseDist
  else
    distance = techChaseFarDist
  endif
  globTempVar = Rnd
  label
  if !(XDistLE distance)
    // walk-up
    {v3} = OPos
    AbsStick {v3} (-0.4)
    if Equal CurrAction hex(0x1)
      ClearStick
    endif
  elif Equal AirGroundState 1
    // force crouch cancel
    Stick 0 (-1)
    if patience <= 20
      if globTempVar < 0.3 && lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F)
        Button X
      elif globTempVar < 0.6 && XDistBackEdge < -25 && patience >= 19
        ClearStick
        Stick -1 0
      elif globTempVar >= 0.6
        Button R
      endif
    endif
  endif

  IS_EARLY_ROLL({v4}, {v5})

  if Equal isEarlyRoll 1
    rollFlag = 1
  endif
  patience -= 1
  if OCurrAction < hex(0x45)
    Seek {onWake}
    Jump
  elif Equal rollFlag 1 && Equal isEarlyRoll 0
    Seek {onBored}
    Jump
  elif patience <= 0
    Seek {onBored}
    Jump
  elif Equal OIsOnStage 0 && Equal OCurrAction hex(0x49)
    Seek {onWake}
    Jump
  elif OYDistBackEdge < -20 && Equal OFramesHitstun 0
    Seek {onBored}
    Jump
  endif
  Return
#endmacro

// if the opponent is far away and
// the character isn't too close to the edge
#macro DASHDANCE(tempVar1, tempVar2)
  #let amount = {tempVar1}
  #let frameCount = {tempVar2}
  amount = (105 - LevelValue) / 100
  amount = (Rnd * dashCountMax) - dashCountMax * amount
  frameCount = (Rnd * 10) + dashDanceMinFrames

  // globTempVar = OXSpeed * 3
  // Abs globTempVar
  // globTempVar += 20
  // if XDistLE globTempVar
  //   Seek _dashdanceEnd
  //   Jump
  // endif
  
  label _dashdance
  Cmd30

  if OAttacking && OAnimFrame >= 12 && Rnd <= 0.3
    amount = 0
  elif OCurrAction >= hex(0x3B) && OCurrAction <= hex(0x52) && Rnd <= 0.5
    amount = 0
  elif OCurrAction >= hex(0x18) && OCurrAction <= hex(0x19) && Rnd <= 0.5
    amount = 0
  elif OCurrAction >= hex(0x60) && OCurrAction <= hex(0x71) && Rnd <= 0.5
    amount = 0
  elif OYDistBackEdge < -40 && Rnd <= 0.1
    amount = 0
  elif XDistFrontEdge < 20 && XDistBackEdge > -20
    amount = 0
  elif Equal amount 100 && NumFrames >= 5
    SetFrame 0
    label
    AbsStick OPos
    if NumFrames >= 5
      Button X 
      amount = 0
    else
      Return
    endif
  endif
  globTempVar = OXSpeed * 3
  Abs globTempVar
  globTempVar += 30
  // predictOOption immediateTempVar man_aim LevelValue
  // if Equal immediateTempVar op_overshoot
  //   globTempVar += 10
  // elif Equal immediateTempVar op_undershoot
  //   globTempVar -= 10
  // endif
  if Equal CurrAction hex(0x0A)
    Return
  elif Equal CurrAction hex(0x16) && AnimFrame < 4
    Return
  elif InAir && YDistBackEdge > -5 && YDistBackEdge < 0 && !(Equal XDistFrontEdge XDistBackEdge)
    if XDistBackEdge < -shortEdgeRange && XDistFrontEdge > shortEdgeRange
      if ODistLE shortEdgeRange
        if Rnd < 0.2
          amount = 100
        else
          amount = 0
        endif
      endif
      Button R
      globTempVar = OPos * -1
      if ODistLE 30
        Stick globTempVar (-1)
      else
        Stick OPos (-1)
      endif
      Return
    endif
  elif Equal AirGroundState 1 && amount > 0 && Equal OFramesHitstun 0
    if Equal CurrAction hex(0x01) && !(Equal CurrAction hex(0x07))
      ClearStick
    elif !(XDistLE DDMaxRange) && !(Equal OPos Direction) && CurrAction <= hex(0x03) && NumFrames > 3
      SetFrame 0
      Stick (-1)
      amount -= 1
    elif NumFrames >= frameCount && Equal CurrAction hex(0x03)
      Goto _ddSubr
    elif AnimFrame >= dashForceTurnFrame && Equal CurrAction hex(0x03)
      Goto _ddSubr
    elif Equal CurrAction hex(0x04)
      ClearStick
      Stick 0 (-1)
      amount -= 1
    elif XDistFrontEdge <= 10
      SetFrame 0
      Stick (-1)
      amount -= 1
      if Rnd < 0.05 && !(Equal Direction OPos)
        amount = 100
      endif
    elif ODistLE globTempVar && CurrAction <= hex(0x03)
      predictOOption globTempVar man_dashdance LevelValue
      predictionConfidence immediateTempVar man_dashdance LevelValue
      if !(Equal ODirection OPos) && Equal globTempVar op_attack && Rnd < immediateTempVar
        Call Unk3020
      elif Equal globTempVar op_defend && Rnd < immediateTempVar
        lastScript = hex(0x8002)
        Call Grab
      elif Equal globTempVar op_grab && Rnd < immediateTempVar
        amount = 0
        Return
      endif 

      if Equal Direction OPos && Rnd < 0.8 && XDistFrontEdge > edgeRange
        if XDistBackEdge > -25 && Rnd < 0.55 || Rnd < 0.15
          Button R
          immediateTempVar = TopNX * -1
          AbsStick immediateTempVar 0
          Call OOSHub
        endif
        if Rnd < 0.2
          amount = 100
        endif
        Goto _ddSubr
      elif Equal Direction OPos && XDistBackEdge < -edgeRange && Rnd < 0.7
        SetFrame 0
        Stick (-1)
        amount -= 1
      elif Equal Direction OPos && Rnd < 0.2
        amount = 0
      else
        Stick 1
      endif
    elif Rnd < 0.7 && Equal CurrAction hex(0x03) && !(XDistFrontEdge <= 10)
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
  if Equal Direction OPos && Rnd < DDWaveDash && XDistFrontEdge > shortEdgeRange && XDistBackEdge < -shortEdgeRange
    Button X
  endif
  amount = amount - 1
  if amount > 0 && Rnd < 0.7
    if LevelValue <= LV7
      Stick (-1)
    elif LevelValue >= LV8 && Rnd < 0.65
      Stick (-1)
    endif
  endif
  frameCount = (Rnd * 50) + dashDanceMinFrames

  if OAttacking && Rnd < 0.4
    trackOAction man_dashdance op_attack
  elif OCurrAction >= hex(0x1A) && OCurrAction <= hex(0x21) && Rnd < 0.8
    trackOAction man_dashdance op_defend
  elif OCurrAction >= hex(0x34) && OCurrAction <= hex(0x38)
    trackOAction man_dashdance op_grab
  elif Rnd < 0.1
    trackOAction man_dashdance op_null
  endif

  Return

  label _dashdanceEnd
#endmacro

// checks to see if the target is performing or is in a state that can perform a roll
// if they're early into this state, the isEarlyRoll flag will be set
#macro IS_EARLY_ROLL(out, tempVar)
  #let isEarlyRoll = {out}
  isEarlyRoll = 0
  {tempVar} = OCurrAction
  if Equal {tempVar} hex(0x60) || Equal {tempVar} hex(0x51)
    if OAnimFrame < 15
      isEarlyRoll = 1
    endif
  endif
  if Equal {tempVar} hex(0x1E) || Equal {tempVar} hex(0x1F) || Equal {tempVar} hex(0x20) || Equal {tempVar} hex(0x4E) || Equal {tempVar} hex(0x50) || Equal {tempVar} hex(0x52) || Equal {tempVar} hex(0x53) || Equal {tempVar} hex(0x61)
    if OAnimFrame < techRollVulFrame
      isEarlyRoll = 1
    endif
  endif
#endmacro

// this really long if statement might be used in multiple places so I made it a macro
// the coder (you) are expected to write what you need and close this off yourself
#macro IF_O_IS_TECHING()
  if Equal OCurrAction hex(0x4E) || Equal OCurrAction hex(0x50) || Equal OCurrAction hex(0x52) || Equal OCurrAction hex(0x60) || Equal OCurrAction hex(0x61)
#endmacro

// gets the weight and gravity of each character.
// yes I hardcoded these myself.
// no I didn't have anything better to do for the hour I did this lmao
#macro GET_WEIGHT_TABLE(weight, gravity)
if OIsCharOf Bowser
  {weight} = 113
  {gravity} = 0.13
elif OIsCharOf Falcon
  {weight} = 104
  {gravity} = 0.13
elif OIsCharOf Lizardon // Charizard
  {weight} = 106
  {gravity} = 0.105
elif OIsCharOf Diddy
  {weight} = 85
  {gravity} = 0.12
elif OIsCharOf Donkey
  {weight} = 109
  {gravity} = 0.1
elif OIsCharOf Falco
  {weight} = 80
  {gravity} = 0.17
elif OIsCharOf Fox
  {weight} = 75
  {gravity} = 0.23
  // 2.8
elif OIsCharOf Gamewatch
  {weight} = 75
  {gravity} = 0.095
elif OIsCharOf Ganondorf
  {weight} = 109
  {gravity} = 0.13
// GIGA BOWSER WOULD GO HERE
// elif OIsCharOf Bowser
//   {weight} = 113
//   {gravity} = 0.13
elif OIsCharOf Nana || OIsCharOf Popo
  {weight} = 88
  {gravity} = 0.1
elif OIsCharOf Ike
  {weight} = 100
  {gravity} = 0.103
elif OIsCharOf Fushigisou // Ivysaur
  {weight} = 85
  {gravity} = 0.075
elif OIsCharOf Purin // Jigglypuff
  {weight} = 62
  {gravity} = 0.064
elif OIsCharOf DDD // King Dedede
  {weight} = 107
  {gravity} = 0.095
elif OIsCharOf Kirby
  {weight} = 74
  {gravity} = 0.08
elif OIsCharOf Knuckles
  {weight} = 90
  {gravity} = 0.14
elif OIsCharOf Link
  {weight} = 104
  {gravity} = 0.11
elif OIsCharOf Lucario
  {weight} = 94
  {gravity} = 0.125
elif OIsCharOf Lucas
  {weight} = 80
  {gravity} = 0.125
elif OIsCharOf Luigi
  {weight} = 100
  {gravity} = 0.069 // nice
  // 1.6
elif OIsCharOf Mario
  {weight} = 100
  {gravity} = 0.095 // 1.7
elif OIsCharOf Marth
  {weight} = 87
  {gravity} = 0.085
elif OIsCharOf Metaknight
  {weight} = 79
  {gravity} = 0.11
elif OIsCharOf Mewtwo
  {weight} = 90
  {gravity} = 0.082
elif OIsCharOf Ness
  {weight} = 94
  {gravity} = 0.09
elif OIsCharOf Pikmin // Olimar
  {weight} = 90
  {gravity} = 0.09
elif OIsCharOf Peach
  {weight} = 90
  {gravity} = 0.08
elif OIsCharOf Pikachu
  {weight} = 80
  {gravity} = 0.11
elif OIsCharOf Pit
  {weight} = 80
  {gravity} = 0.095
elif OIsCharOf Robot // ROB
  {weight} = 104
  {gravity} = 0.09
elif OIsCharOf Roy
  {weight} = 85
  {gravity} = 0.114
elif OIsCharOf Samus
  {weight} = 110
  {gravity} = 0.66
elif OIsCharOf Shiek
  {weight} = 90
  {gravity} = 0.12
elif OIsCharOf Snake
  {weight} = 105
  {gravity} = 0.098
elif OIsCharOf Sonic
  {weight} = 82
  {gravity} = 0.122
elif OIsCharOf Zenigame // Squirtle
  {weight} = 85
  {gravity} = 0.126
elif OIsCharOf Toonlink
  {weight} = 85
  {gravity} = 0.11
elif OIsCharOf Wario
  {weight} = 102
  {gravity} = 0.112
// WARIO MAN GOES HERE
// elif OIsCharOf Bowser
//   {weight} = 113
//   {gravity} = 0.13
elif OIsCharOf Wolf
  {weight} = 85
  {gravity} = 0.16
elif OIsCharOf Yoshi
  {weight} = 108
  {gravity} = 0.093
elif OIsCharOf Zelda
  {weight} = 90
  {gravity} = 0.073
elif OIsCharOf ZSS // Zero Suit Samus
  {weight} = 85
  {gravity} = 0.135
endif
#endmacro

#macro DRAW_DEBUG_RANGE_RECTS()
  globTempVar = 15
  DrawDebugRectOutline TopNX TopNY globTempVar globTempVar color(0xFFFFFF99)
  globTempVar += 15
  DrawDebugRectOutline TopNX TopNY globTempVar globTempVar color(0xFFAAAA99)
  globTempVar += 15
  DrawDebugRectOutline TopNX TopNY globTempVar globTempVar color(0xFF777799)
  globTempVar += 15
  DrawDebugRectOutline TopNX TopNY globTempVar globTempVar color(0xFF444499)
  globTempVar += 15
  DrawDebugRectOutline TopNX TopNY globTempVar globTempVar color(0xFF000099)
#endmacro

#macro NEAREST_CLIFF(xVar, yVar)
  GetNearestCliff {xVar}
  {xVar} = TopNX - {xVar}
  {xVar} *= -1
  {yVar} *= -1
  {yVar} = {yVar} - (TopNY * -1)
#endmacro

#macro FORCED_SWITCH_CONDITIONS()
  if OAttacking && Equal AirGroundState 1
    Call Unk3020
  elif Equal lastScript hex(0x8001)
    Call ApproachHub
  endif
#endmacro

#macro LOG_MOVE()
  if Equal lastAttack valJab123
    LOGSTR str("Jab123")
  elif Equal lastAttack valDashAttack
    LOGSTR str("DashAttack")
  elif Equal lastAttack valFTilt
    LOGSTR str("FTilt")
  elif Equal lastAttack valUTilt
    LOGSTR str("UTilt")
  elif Equal lastAttack valDTilt
    LOGSTR str("DTilt")
  elif Equal lastAttack valFSmash
    LOGSTR str("FSmash")
  elif Equal lastAttack valUSmash
    LOGSTR str("USmash")
  elif Equal lastAttack valDSmash
    LOGSTR str("DSmash")
  elif Equal lastAttack valNSpecial
    LOGSTR str("NSpecial")
  elif Equal lastAttack valSSpecial
    LOGSTR str("SSpecial")
  elif Equal lastAttack valUSpecial
    LOGSTR str("USpecial")
  elif Equal lastAttack valDSpecial
    LOGSTR str("DSpecial")
  elif Equal lastAttack valGrab
    LOGSTR str("Grab")
  elif Equal lastAttack valNAir
    LOGSTR str("NAir")
  elif Equal lastAttack valFAir
    LOGSTR str("FAir")
  elif Equal lastAttack valBAir
    LOGSTR str("BAir")
  elif Equal lastAttack valUAir
    LOGSTR str("UAir")
  elif Equal lastAttack valDAir
    LOGSTR str("DAir")
  elif Equal lastAttack valNSpecialAir
    LOGSTR str("NSpecialAir")
  elif Equal lastAttack valSSpecialAir
    LOGSTR str("SSpecialAir")
  elif Equal lastAttack valUSpecialAir
    LOGSTR str("USpecialAir")
  elif Equal lastAttack valDSpecialAir
    LOGSTR str("DSpecialAir")
  elif Equal lastAttack hex(0x8008)
    LOGSTR str("FakeOutHub")
  elif Equal lastAttack valGeneral
    LOGSTR str("ComboHub")
  endif
#endmacro

#macro TRACK_O_HITSTUN_OPTION()
if OAnimFrame > 1 && OAnimFrame <= 2 && ODistLE 80
  if OPrevAction >= hex(0x42) && OPrevAction <= hex(0x45) || Equal OPrevAction hex(0x49) || Equal approachType at_combo
    if Equal OCurrAction hex(0xC) || Equal OCurrAction hex(0xD)
      trackOAction man_outOfHitstun op_jump
    elif OAttacking && Rnd < 0.6
      trackOAction man_outOfHitstun op_attack
    elif Equal OCurrAction hex(0xE) || Equal OCurrAction hex(0x46) || Equal OCurrAction hex(0x4A) || Equal OCurrAction hex(0x60) || Equal OCurrAction hex(0x61)
      if OFramesHitstun <= 0 && Rnd < 0.5
        trackOAction man_outOfHitstun op_neutral
      endif
    endif
  endif
endif
#endmacro

#macro HIGHLIGHT_GUESSES(type, level)
  predictOOption globTempVar {type} {level}
  predictionConfidence immediateTempVar {type} {level}

  LOGSTR str("CONFIDENCE")
  LOGVAL immediateTempVar
  LOGVAL globTempVar

  EnableDebugOverlay
  var0 = immediateTempVar * 255
  if Equal globTempVar 1
    SetDebugOverlayColor 255 0 0 var0
  elif Equal globTempVar 2
    SetDebugOverlayColor 0 255 0 var0
  elif Equal globTempVar 3
    SetDebugOverlayColor 0 0 255 var0
  endif
#endmacro

#macro HITSTUN_CHECK()
  if FramesHitstun > 0
    immediateTempVar = LevelValue * 0.01 - 0.1
    if LevelValue >= LV7 && Rnd <= immediateTempVar
      ClearStick
      Stick 0 (-1)
    endif
    Call OnGotDamaged
  endif
#endmacro

#macro DIAMOND_DIST(out, nearCliffX, nearCliffY)
  immediateTempVar = {nearCliffX} 
  Abs immediateTempVar
  globTempVar = {nearCliffY}
  Abs globTempVar
  immediateTempVar = globTempVar - immediateTempVar
  Abs immediateTempVar
  {out} = immediateTempVar - maxXEdgeDist
#endmacro