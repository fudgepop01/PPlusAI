#macro ACTIONABLE_ON_GROUND(lbName)
  chr_trait_select = chr_chk_actionableOnGround
  XGoto GetChrSpecific
  Seek {lbName}
  if Equal chr_trait_return 0 
    Return
  endif
#endmacro

#macro NOSEEK_ACTIONABLE_ON_GROUND()
  chr_trait_select = chr_chk_actionableOnGround
  XGoto GetChrSpecific
  if Equal chr_trait_return 0 
    Return
  endif
#endmacro

#macro GET_CHAR_TRAIT_SEEK(targetVar, targetTrait, seeker)
  chr_trait_select = {targetTrait}
  XGoto GetChrSpecific
  //= XReciever
  $ifNEQThen({targetVar}, chr_trait_return, {targetVar} = chr_trait_return)
  Seek {seeker}
#endmacro

#macro GET_CHAR_TRAIT(targetVar, targetTrait)
  chr_trait_select = {targetTrait}
  XGoto GetChrSpecific
  //= XReciever
  $ifNEQThen({targetVar}, chr_trait_return, {targetVar} = chr_trait_return)
#endmacro

#macro GET_O_TRAIT(targetVar, targetTrait, default)
  chr_trait_select = {targetTrait}
  OXGoto GetChrSpecific
  //= XReciever
  if Equal chr_trait_return chr_trait_NOT_IMPLEMENTED
    chr_trait_return = default
  endif
  $ifNEQThen({targetVar}, chr_trait_return, {targetVar} = chr_trait_return)
#endmacro

#macro IF_AERIAL_ATTACK(targetVar)
  #let isAerialAttack = {targetVar}
  STACK_PUSH immediateTempVar st_function
  GET_CHAR_TRAIT(isAerialAttack, chr_chk_isAerialAttack)
  immediateTempVar = STACK_POP
  if Equal isAerialAttack 1
#endmacro

#macro O_RECOVERY_POSITION(targetXVar, targetYVar, framesAhead)
  STACK_PUSH var0 0
  STACK_PUSH var1 0
  STACK_PUSH var2 0
  STACK_PUSH var3 0
  STACK_PUSH var4 0
  STACK_PUSH var5 0
  STACK_PUSH var6 0

  $pushVarAsValue({targetYVar})
  $pushVarAsValue({targetXVar})
  STACK_PUSH {framesAhead} 0
  chr_trait_select = chr_calc_ORecoverPos
  OXGoto GetChrSpecific
  if Equal chr_trait_return chr_trait_NOT_IMPLEMENTED
    STACK_TOSS 3
    EstOXCoord {targetXVar} {framesAhead}
    EstOYCoord {targetYVar} {framesAhead}
  endif

  var6 = STACK_POP
  var5 = STACK_POP
  var4 = STACK_POP
  var3 = STACK_POP
  var2 = STACK_POP
  var1 = STACK_POP
  var0 = STACK_POP
#endmacro

#macro DIST_TO_CLIFF(xVar, yVar)
  // X = direction to cliff
  // Y = vertical height if cliff height = 0
  //
  // if char is above ledge, yVar is positive
  // if below, yVar is negative
  // <= means "lower than" and >= means "higher than"
  //
  // AbsStick X = to ledge
  // AbsStick X * -1 = away from ledge
  // 
  // if left of ledge, xVar is positive
  // if right, xVar is negative
  GetNearestCliff {xVar}
  {xVar} = CenterX - {xVar}
  {yVar} *= -1
  {yVar} += CenterY
#endmacro

#macro NEAREST_CLIFF(xVar, yVar)
  GetNearestCliff {xVar}
  {xVar} = CenterX - {xVar}
  {xVar} *= -1
  {yVar} *= -1
  {yVar} += TopNY
#endmacro

#macro GET_MOVE_DATA(angle, xOffset, yOffset, xRange, yRange, hitFrame, duration, IASA, damage, isWeightDependent, baseKnockback, knockbackGrowth)
  chr_trait_select = chr_cs_moveData
  $pushVarAsValue({angle})
  $pushVarAsValue({knockbackGrowth})
  $pushVarAsValue({baseKnockback})
  $pushVarAsValue({isWeightDependent})
  $pushVarAsValue({damage})
  $pushVarAsValue({IASA})
  $pushVarAsValue({duration})
  $pushVarAsValue({hitFrame})
  $pushVarAsValue({yRange})
  $pushVarAsValue({xRange})
  $pushVarAsValue({yOffset})
  $pushVarAsValue({xOffset})
  XGoto GetChrSpecific
  //= XReciever
#endmacro


#macro CALL_EVENT(targetEvent)
  chr_trait_select = {targetEvent}
  XGoto GetChrSpecific
  //= XReciever
#endmacro

#macro CALC_ENDLAG(targetVar)
  {targetVar} = -1
  RetrieveFullATKD immediateTempVar globTempVar anotherTempVar anotherTempVar anotherTempVar anotherTempVar anotherTempVar OCurrSubaction 1
  if Equal immediateTempVar 0
    immediateTempVar = OEndFrame
  endif 
  if Equal OCurrAction hex(0x33) && OYDistFloor < 25
    if Equal OCurrSubaction AttackAirN
      GetAttribute globTempVar attr_nairLandingLag 1
    elif Equal OCurrSubaction AttackAirF
      GetAttribute globTempVar attr_fairLandingLag 1
    elif Equal OCurrSubaction AttackAirB
      GetAttribute globTempVar attr_bairLandingLag 1
    elif Equal OCurrSubaction AttackAirHi
      GetAttribute globTempVar attr_uairLandingLag 1
    elif Equal OCurrSubaction AttackAirLw
      GetAttribute globTempVar attr_dairLandingLag 1
    endif
    anotherTempVar = OYDistFloor * 0.7
    {targetVar} = immediateTempVar - OEndFrame
    {targetVar} *= 1.25
    {targetVar} += globTempVar + anotherTempVar
  elif Equal OCurrAction hex(0x18)
    {targetVar} = OEndFrame - OAnimFrame
    {targetVar} *= 0.65
  elif OCurrAction >= hex(0x1E) && OCurrAction <= hex(0x20)
    {targetVar} = OEndFrame - OAnimFrame
  elif Equal OCurrAction hex(0x21) && OYDistFloor > 15
    {targetVar} = 35
  elif Equal OCurrAction hex(0x10)
    if OYDistFloor > 0
      {targetVar} = OYDistFloor * 0.8
    else
      immediateTempVar = OYDistBackEdge * 0.9
      Abs immediateTempVar
      {targetVar} = immediateTempVar + OXDistBackEdge
    endif
  elif Equal OCurrAction hex(0x1A) || Equal OCurrAction hex(0x1B) || Equal OCurrAction hex(0x1C)
    GetAttribute immediateTempVar attr_jumpSquatFrames 1
    {targetVar} = 10 + immediateTempVar
  elif Equal OCurrAction hex(0x1D)
    GetRaBasic globTempVar hex(0x5) 1
    {targetVar} = globTempVar + 15
  elif OAttackCond
    if Equal immediateTempVar 0
      immediateTempVar = OEndFrame
    endif 
    {targetVar} = immediateTempVar - OAnimFrame
  elif OCurrAction >= hex(0x4A) && OCurrAction <= hex(0x65)
    {targetVar} = OEndFrame - OAnimFrame
    if OCurrAction >= hex(0x5A) && OCurrAction <= hex(0x5F)
      {targetVar} = 80
    endif
  elif OCurrAction >= hex(0x77) && OCurrAction <= hex(0x78)
    {targetVar} = OEndFrame - OAnimFrame
  elif OFramesHitstun > 0
    if Equal OAirGroundState 1
      {targetVar} = 8
    else
      {targetVar} = OFramesHitstun + OFramesHitlag
    endif
  endif
#endmacro

#macro CALC_TARGET_DISTANCES(out1, out2, calcVar, gravVar, frameCount)
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
      gv = 0
    endif
  elif Equal lastAttack valGeneral
    gv = OFramesHitstun 
  endif

  // SAFE_WRITE_C move_xOffset
  // SAFE_WRITE_D move_yOffset
  // SAFE_WRITE_E move_xRange
  // SAFE_WRITE_F move_yRange  
  SAFE_INJECT_C move_xOffset
  SAFE_INJECT_D move_yOffset
  SAFE_INJECT_E move_xRange
  SAFE_INJECT_F move_yRange

  #let tempTargetX = {out1}
  #let tempTargetY = {out2}
  #let localTemp = {calcVar}
  localTemp = 0
  // calculate own estimated position
  globTempVar = {frameCount} + gv
  // if using a grounded attack then own offset will be very small
  if lastAttack >= valJab123 && lastAttack <= valDSmash
    globTempVar = 0
  endif

  globTempVar += 1
  if OAnimFrame <= 2
    tempTargetX = OTopNX + OXSpeed * globTempVar
    O_CALC_SELF_Y_CHANGE_GRAVITY(tempTargetY, {frameCount})
    tempTargetY = OTopNY - tempTargetY
    // DrawDebugRectOutline OTopNX OTopNY 5 5 color(0x00FFFFDD)
  else 
    EstOXCoord tempTargetX globTempVar
    EstOYCoord tempTargetY globTempVar
  endif

  globTempVar -= 1
  globTempVar /= 60
  EstOPosVecR localTemp globTempVar globTempVar

  if OAnimFrame > 2
    immediateTempVar = ExactOXCoord - ExactXCoord
    immediateTempVar = immediateTempVar - (OTopNX - TopNX)
    localTemp -= immediateTempVar

    immediateTempVar = ExactOYCoord - ExactYCoord
    immediateTempVar = immediateTempVar - (OSCDBottom - TopNY)
    globTempVar -= immediateTempVar
  endif

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

  // calculate own Y coord because I can't figure out the !@$% EstOPosVecR thing
  CALC_SELF_Y_CHANGE_GRAVITY(targetY, {frameCount})
  globTempVar = TopNY - targetY

  // calculate Opponent change in gravity (used later)
  // if !(Equal OYSpeed 0) 
  //   O_CALC_SELF_Y_CHANGE_GRAVITY(targetX, {frameCount})
  // endif

  // it's awful, I know, but i'm all out of variables and this was the only way lol
  immediateTempVar = {frameCount} 
  if lastAttack >= valJab123 && lastAttack <= valDSmash
    if Equal AirGroundState 1 && Equal CurrAction hex(0x03) && !(Equal lastAttack hex(0x603C)) && !(Equal lastAttack hex(0x6036))
      immediateTempVar += 0
    endif
  elif lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F)
    if Equal AirGroundState 1
      immediateTempVar += 0
    endif
  elif Equal lastAttack valGeneral
    immediateTempVar += OFramesHitstun 
  endif

  if OAnimFrame <= 2
    O_CALC_SELF_Y_CHANGE_GRAVITY(targetY, immediateTempVar)
    targetY = OTopNY - targetY
    targetY *= -1
    if OCurrAction <= hex(0x9) && lastAttack < valNAir
      immediateTempVar *= 0.0
    endif
    targetX = OTopNX + OXSpeed * immediateTempVar
    // DrawDebugRectOutline OTopNX OTopNY 5 5 color(0x00FFFFDD)
    // DrawDebugRectOutline targetX targetY 5 5 color(0xFFFF0088)
  else 
    EstOYCoord targetY immediateTempVar
    // if the opponent is in an actionable state, lower the estimate of
    // their x offset to prevent dashdancing from setting it off when very far away
    if OCurrAction <= hex(0x9) && lastAttack < valNAir
      immediateTempVar *= 0.0
    endif
    EstOXCoord targetX immediateTempVar
    targetY = targetY + (OSCDBottom - OTopNY)
  endif

  gv = TopNY + YDistBackEdge
  if SamePlane && targetY <= gv && !(MeteoChance)
    targetY = gv
  endif

  if !(CalledAs ComboHub)
    // if Equal approachType at_undershoot
    //   immediateTempVar = 20 * OPos
    //   targetX -= immediateTempVar
    // elif Equal approachType at_overshoot
    //   immediateTempVar = 20 * OPos
    //   targetX += immediateTempVar
    // el
    if Equal approachType at_threaten
      // LOGSTR str("THREATENING")
      predictAverage immediateTempVar man_oXHitDist
      immediateTempVar += 30
      immediateTempVar *= OPos
      anotherTempVar = OXSpeed
      Abs anotherTempVar
      anotherTempVar *= 0.5
      immediateTempVar *= anotherTempVar
      targetX -= immediateTempVar
    endif
    if Equal approachType at_poke
      predictAverage immediateTempVar man_oXHitDist
      immediateTempVar += 15
      immediateTempVar *= OPos
      anotherTempVar = OXSpeed
      Abs anotherTempVar
      anotherTempVar *= 0.5
      immediateTempVar *= anotherTempVar
      targetX -= immediateTempVar
    endif
    if LevelValue >= LV8 && !(Equal approachType at_combo) && OCurrAction <= hex(0xF) && Equal OIsOnStage 1
      predictOOption immediateTempVar man_aim

      immediateTempVar = 30 * OPos
      if Equal immediateTempVar op_overshoot
        targetX += immediateTempVar
      elif Equal immediateTempVar op_undershoot
        targetX -= immediateTempVar
      endif
    endif

    if Equal lastAttack valGrab || Equal lastAttack valUSmash
      if CurrAction >= hex(0x3) && CurrAction <= hex(0x4)
        immediateTempVar = 10 * OPos
        targetX += immediateTempVar
      endif
    endif

    if LevelValue >= LV6 && CalledAs ApproachHub
      predictOOption immediateTempVar man_willTech
      predictionConfidence gv man_willTech
      if Equal immediateTempVar op_tech && Rnd < gv
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
          predictOOption immediateTempVar man_techchase
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
    endif
  endif

  // correct to be sure it's not senslessly offstage
  if Equal OIsOnStage 1 && Equal OFramesHitstun 0
    immediateTempVar = targetX - TopNX
    GetYDistFloorOffset immediateTempVar immediateTempVar 0 0
    if Equal immediateTempVar -1
      immediateTempVar = OXDistBackEdge
      Abs immediateTempVar
      if immediateTempVar > OXDistFrontEdge
        immediateTempVar = OXDistFrontEdge
      endif
      targetX = OTopNX + immediateTempVar 
      // targetX *= OPos
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

  if Equal AirGroundState 1
    globTempVar = TopNY
  endif

  // if !(CalledAs ComboHub)
  //   // self
  //   DrawDebugRectOutline localTemp globTempVar 5 5 color(0xFF000088)
  //   // target
  //   DrawDebugRectOutline targetX targetY 5 5 color(0x0000FF88)
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
  if lastAttack > valDashAttack || lastAttack >= valNSpecial && lastAttack <= valDSpecial
    if !(InAir) && lastAttack <= valDSpecialAir
      immediateTempVar = move_xOffset + (move_xRange * 2)
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
  // if !(Equal lastAttack hex(0x8008)) && !(Equal lastAttack valGeneral) && !(CalledAs ComboHub)
  //   immediateTempVar = 0
  //   globTempVar = LBoundary - (TopNX + targetXDistance) 
  //   if globTempVar < 90 && Equal Direction (-1)
  //     globTempVar = hitboxSizeMultiplier + 1
  //     globTempVar = move_xRange * (1/globTempVar)
  //     globTempVar /= 2
  //     immediateTempVar += globTempVar
  //   endif
  //   globTempVar = RBoundary - (TopNX + targetXDistance)
  //   if globTempVar > -90 && Equal Direction 1
  //     globTempVar = hitboxSizeMultiplier + 1
  //     globTempVar = move_xRange * (1/globTempVar)
  //     globTempVar /= 2
  //     immediateTempVar -= globTempVar
  //   endif
  //   targetXDistance += immediateTempVar

  //   if Equal immediateTempVar 0
  //     immediateTempVar = Direction
  //     globTempVar = hitboxSizeMultiplier + 1
  //     globTempVar = move_xRange * (1/globTempVar)
  //     immediateTempVar *= globTempVar
  //     immediateTempVar /= 2
  //     targetXDistance -= immediateTempVar
  //   endif
  // endif

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

  CTD_DEBUG_DISPLAY

  // if !(CalledAs ComboHub) && LevelValue >= LV7 && !(Equal approachType at_combo) 
  //   globTempVar = {frameCount} - index
  //   targetXDistance = targetXDistance + OXSpeed * globTempVar * -2
  // endif
#endmacro

#macro CTD_DEBUG_DISPLAY()
  // if !(CalledAs ComboHub)
  //   targetXDistance += TopNX
  //   targetYDistance += TopNY
  //   DrawDebugRectOutline targetXDistance targetYDistance move_xRange move_yRange color(0x00FF0088)
  //   targetXDistance -= TopNX
  //   targetYDistance -= TopNY

  //   globTempVar = hitboxSizeMultiplier + 1
  //   globTempVar = move_xRange * (1/globTempVar)
  //   move_xRange = globTempVar
  //   move_xOffset = move_xOffset + globTempVar * hitboxSizeMultiplier

  //   globTempVar = hitboxSizeMultiplier + 1
  //   globTempVar = move_yRange * (1/globTempVar)
  //   move_yRange = globTempVar
  //   move_yOffset = move_yOffset - globTempVar * hitboxSizeMultiplier

  //   // globTempVar = TopNY - move_yOffset + move_yRange + immediateTempVar
  //   // DrawDebugRectOutline TopNX globTempVar 10 0 color(0x00FFFF88)

  //   if CalledAs ApproachHub
  //     move_xRange -= 2.5
  //     move_xOffset += 5
  //   endif

  //   immediateTempVar = (move_xOffset + move_xRange)
  //   immediateTempVar *= Direction
  //   immediateTempVar += TopNX
  //   globTempVar = TopNY - move_yOffset + move_yRange
  //   DrawDebugRectOutline immediateTempVar globTempVar move_xRange move_yRange color(0x88888888)
  //   globTempVar += localTemp
    
  //   // if OTopNX > 0
  //   //   immediateTempVar += move_xRange
  //   // else
  //   //   immediateTempVar -= move_xRange
  //   // endif 
  //   DrawDebugRectOutline immediateTempVar globTempVar move_xRange move_yRange color(0xFFFFFF88)

  //   immediateTempVar = OHurtboxSize / 2
  //   globTempVar = immediateTempVar + OSCDBottom
  //   DrawDebugRectOutline OTopNX globTempVar 5 immediateTempVar color(0xFFFF00DD)
    
  //   if CalledAs ApproachHub
  //     move_xRange += 2.5
  //     move_xOffset -= 5
  //   endif

  //   globTempVar = move_xRange * hitboxSizeMultiplier
  //   move_xOffset -= globTempVar
  //   move_xRange = move_xRange + globTempVar
  //   globTempVar = move_yRange * hitboxSizeMultiplier
  //   move_yOffset += globTempVar
  //   move_yRange = move_yRange + globTempVar
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
      // move_xRange += 2.5
      // move_xOffset -= 5

      // if lastAttack <= valDashAttack && !(Equal lastAttack valUSmash)
      //   immediateTempVar = groundFric * 50
      //   move_xRange += immediateTempVar
      //   immediateTempVar *= 2
      //   move_xOffset -= immediateTempVar
      // endif
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

#macro COULD_HIT_WITH_FASTFALL(outVar, throwAway1, targetYDistance, frameCount)
  #let canHit = {outVar}
  #let estimate = {throwAway1}

  CALC_FASTFALL_DIST(canHit, {frameCount})

  estimate = {frameCount}
  EstOYCoord estimate estimate
  // estimate = estimate + ExactOYCoord - OTopNY


  // LOGSTR str("~~~~~~~")
  // LOGVAL OTopNY
  // LOGVAL estimate
  // LOGVAL OYDistBackEdge
  // LOGVAL move_yRange

  globTempVar = OYDistBackEdge + OTopNY

  if estimate < globTempVar
    globTempVar = estimate - globTempVar
    estimate -= globTempVar
  endif

  // if Equal var8 1 || Equal movePart 1
  //   targetXDistance += TopNX
  //   globTempVar = TopNY + canHit
  //   DrawDebugRectOutline targetXDistance globTempVar move_xRange move_yRange color(0x00FFFF88)

  //   globTempVar = estimate
  //   DrawDebugRectOutline targetXDistance globTempVar move_xRange move_yRange color(0xFF00FF88)
  //   targetXDistance -= TopNX
  // endif

  globTempVar = TopNY - estimate
  globTempVar -= canHit
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

#macro CALC_SELF_Y_CHANGE_GRAVITY(outVar, frameCount)
  globTempVar = {frameCount}
  if Equal CurrSubaction JumpSquat
    immediateTempVar = -jumpYInitVelShort
  else
    immediateTempVar = YSpeed * -1
  endif
  CalcYChange {outVar} globTempVar immediateTempVar Gravity MaxFallSpeed FastFallSpeed 0
#endmacro

#macro CALC_FASTFALL_DIST(outVar, frameCount)
  globTempVar = {frameCount}
  if Equal CurrSubaction JumpSquat || Equal AirGroundState 1 || Equal CurrAction hex(0xB) && Equal AnimFrame 0
    GetAttribute immediateTempVar attr_jumpSquatFrames 0
    globTempVar -= immediateTempVar
    GetAttribute immediateTempVar attr_jumpYInitVelShort 0
  else
    immediateTempVar = TotalYSpeed
  endif
  CalcYChange {outVar} globTempVar immediateTempVar Gravity MaxFallSpeed FastFallSpeed 1
#endmacro

// does what "CalcYChangeGravity" does but with more lines
#macro O_CALC_SELF_Y_CHANGE_GRAVITY(outVar, frameCount)
  globTempVar = {frameCount}
  anotherTempVar = OYSpeed * -1
  CalcYChange {outVar} globTempVar anotherTempVar OGravity OMaxFallSpeed OFastFallSpeed 0
#endmacro

// will calculate whether or not the player will be on stage at their current X velocity after
// a given amount of frames
#macro GOING_OFFSTAGE(outVar, throwAwayVar, frameCount)
  #let goingOffstage = {outVar}

  #let xPosOffs = {throwAwayVar}
  globTempVar = {frameCount}
  xPosOffs = XSpeed * globTempVar
  GetYDistFloorOffset goingOffstage xPosOffs 5 0
  // immediateTempVar = TopNY - goingOffstage 
  // DrawDebugLine TopNX TopNY TopNX immediateTempVar color(0xFF0000DD)
  if !(Equal goingOffstage -1) 
    goingOffstage = 0
  elif Equal DistBackEdge DistFrontEdge
    goingOffstage = 2
  elif Equal goingOffstage -1
    if xPosOffs < 0
      goingOffstage = 1
    elif xPosOffs > 0
      goingOffstage = -1
    endif
  else
    goingOffstage = 0
  endif
#endmacro

#macro OFFSTAGE_OFFSET(outVar, throwAwayVar, offset)
  #let goingOffstage = {outVar}
  #let relCliffXPos = {outVar}

  immediateTempVar = {offset}
  GetYDistFloorOffset goingOffstage immediateTempVar 5 0
  if goingOffstage < 4 && !(Equal goingOffstage -1)
    goingOffstage = 0
  elif Equal DistBackEdge DistFrontEdge
    goingOffstage = 2
  elif Equal goingOffstage -1
    if XSpeed <= 0
      goingOffstage = 1
    elif XSpeed > 0
      goingOffstage = -1
    endif
  else
    goingOffstage = 0
  endif
#endmacro

#macro DEFENSIVE_REACTION_TIME(tempVar1, tempVar2)
  if !(OAttacking) || Rnd <= 0.1 || OCurrActionFreq >= 4
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
  // LOGVAL globTempVar
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

  #let frameCounter = var4
  if Equal frameCounter -2
  elif frameCounter < 0 || frameCounter > move_IASA
    frameCounter = -1
  endif
  Cmd30
  if Equal frameCounter -2
  else
    frameCounter += 1
  endif
  if Equal HitboxConnected 1 && OKBSpeed > hit_knockback && OFramesHitstun > 0
    hit_knockback = OKBSpeed
  endif

  if Equal frameCounter 1
    if OCurrAction >= hex(0x1A) && OCurrAction <= hex(0x21) && Rnd < 0.8
      trackOAction man_attacking op_defend
    elif OCurrAction >= hex(0x34) && OCurrAction <= hex(0x38) && Rnd < 0.8
      trackOAction man_attacking op_grab
    elif OAttacking && Rnd < 0.8
      trackOAction man_attacking op_attack
    elif Rnd < 0.3
      trackOAction man_attacking op_null
    endif
  endif
  if Equal frameCounter 10
    APPROACH_MAN_TRIGGER
  endif

  if Equal frameCounter move_hitFrame && !(Equal approachType at_undershoot) && Equal lastScript hex(0x8001)
    predictOOption globTempVar man_aim
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

  if Equal CanCancelAttack 1 || CurrAction <= hex(0x09)
    movePart = 0
    Call AIHub
  endif
#endmacro

#macro APPROACH_MAN_TRIGGER()
  if OCurrAction >= hex(0x34) && OCurrAction <= hex(0x38) && Rnd < 0.7
    trackOAction man_approach op_grab
  elif OCurrAction >= hex(0x1A) && OCurrAction <= hex(0x21) && Rnd < 0.7
    trackOAction man_approach op_defend
  elif OAttacking && Rnd < 0.7
    trackOAction man_approach op_attack
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
    if globTempVar < 0.3 && lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F) && patience <= 30
      Button X
    elif globTempVar < 0.6 && XDistBackEdge < -25 && patience >= 15
      ClearStick
      Stick -1 0
      Seek {onBored}
      Jump
    elif globTempVar >= 0.6 && patience <= 80
      Button R
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
  OR amount amount amount
  frameCount = (Rnd * dashForceTurnFrame) + dashDanceMinFrames

  // globTempVar = OXSpeed * 3
  // Abs globTempVar
  // globTempVar += 20
  // if XDistLE globTempVar
  //   Seek _dashdanceEnd
  //   Jump
  // endif
  
  label _dashdance
  Cmd30

  // Goto defendFromO
  RetrieveFullATKD immediateTempVar anotherTempVar globTempVar anotherTempVar anotherTempVar anotherTempVar anotherTempVar OCurrSubaction 1

  if Equal immediateTempVar 0
    immediateTempVar = OEndFrame
  endif
  immediateTempVar = immediateTempVar - globTempVar - OAnimFrame

  // LOGSTR str("-=-=-=-=-")
  // LOGVAL globTempVar
  // LOGVAL OAnimFrame
  // LOGVAL immediateTempVar
  // LOGVAL move_hitFrame

  if OAttacking && OAnimFrame > globTempVar && immediateTempVar > move_hitFrame && XDistLE 50
    amount = 0
  elif OCurrAction >= hex(0x3B) && OCurrAction <= hex(0x52) && Rnd <= 0.5
    amount = 0
  elif OCurrAction >= hex(0x18) && OCurrAction <= hex(0x19) && Rnd <= 0.5
    amount = 0
  elif OCurrAction >= hex(0x60) && OCurrAction <= hex(0x71) && Rnd <= 0.5
    amount = 0
  elif OYDistBackEdge < -40 && Rnd <= 0.1
    amount = 0
  // elif XDistFrontEdge < 20 && XDistBackEdge > -20
  //   amount = 0
  elif amount >= 90
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
  predictAverage immediateTempVar man_oXAttackDist
  globTempVar += immediateTempVar
  globTempVar += 25
  // DrawDebugRectOutline TopNX TopNY globTempVar 20 color(0xFF880088)

  // predictOOption immediateTempVar man_aim
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
      if ODistLE globTempVar
        globTempVar = OPos * -1
        AbsStick globTempVar (-0.5)
      else
        AbsStick OPos (-0.5)
      endif
      Return
    endif
  elif Equal AirGroundState 1 && amount > 1 && Equal OFramesHitstun 0
    if Equal CurrAction hex(0x01) && !(Equal CurrAction hex(0x07))
      ClearStick
    elif !(XDistLE DDMaxRange) && !(Equal OPos Direction) && CurrAction <= hex(0x03) && NumFrames > 3
      SetFrame 0
      Stick (-1)
    elif NumFrames >= frameCount && Equal CurrAction hex(0x03)
      Goto _ddSubr
    elif AnimFrame >= dashForceTurnFrame && Equal CurrAction hex(0x03)
      Goto _ddSubr
    elif Equal CurrAction hex(0x04)
      ClearStick
      Stick 0 (-1)
    elif XDistFrontEdge <= 10
      SetFrame 0
      Stick (-1)
      amount -= 1
      if Rnd < 0.05 && !(Equal Direction OPos)
        amount = 100
      endif
    elif ODistLE globTempVar && CurrAction <= hex(0x03)
      predictOOption globTempVar man_dashdance
      predictionConfidence immediateTempVar man_dashdance
      predictAverage anotherTempVar man_oXHitDist
      anotherTempVar += 5
      if Rnd <= 0.03
        if Equal globTempVar op_attack && Rnd < immediateTempVar && XDistLE anotherTempVar
          LOGSTR str("DEFENDING DD")
          if Rnd <= 0.55
            Call DefendHub
          elif !(OAttacking) && move_hitFrame <= 16 && Rnd <= 0.4
            amount = 0
          elif Rnd <= 0.05
            Call Unk3020
          endif
        elif Equal globTempVar op_defend && Rnd < immediateTempVar && Rnd <= 0.05
          lastScript = hex(0x8002)
          Call Grab
        elif Equal globTempVar op_grab && Rnd < immediateTempVar && Rnd <= 0.7
          amount = 0
          Return
        endif
      endif

      if Equal Direction OPos && Rnd < 0.3 && XDistFrontEdge > edgeRange
        // if XDistBackEdge > -25 && Rnd < 0.25 || Rnd < 0.15
        //   Button R
        //   // immediateTempVar = TopNX * -1
        //   // AbsStick immediateTempVar 0
        //   Call OOSHub
        // endif
        if Rnd < 0.1
          amount = 100
        endif
        amount -= 1
        Goto _ddSubr
      elif Equal Direction OPos && XDistBackEdge < -edgeRange && Rnd < 0.7
        SetFrame 0
        Stick (-1)
        amount -= 1
      elif Equal Direction OPos && Rnd < 0.05
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

  if XDistLE 35 && Rnd < 0.35
    Seek _dashdanceEnd
    Jump
  elif Rnd <= 0.05
    Seek _dashdanceEnd
    Jump
  endif

  if Equal Direction OPos && Rnd < DDWaveDash && XDistFrontEdge > shortEdgeRange && XDistBackEdge < -shortEdgeRange
    amount -= 1
    Button X
  endif
  if amount > 0 && Rnd < 0.7
    if LevelValue <= LV7
      Stick (-1)
    elif LevelValue >= LV8 && Rnd < 0.65
      Stick (-1)
    endif
  endif
  frameCount = (Rnd * dashForceTurnFrame) + dashDanceMinFrames

  if OCurrAction >= hex(0x1A) && OCurrAction <= hex(0x21) && Rnd < 0.8
    trackOAction man_dashdance op_defend
  elif OCurrAction >= hex(0x34) && OCurrAction <= hex(0x38)
    trackOAction man_dashdance op_grab
  elif OAttacking && Rnd < 0.4
    trackOAction man_dashdance op_attack
  elif Rnd < 0.1
    trackOAction man_dashdance op_null
  endif
  // HIGHLIGHT_GUESSES(man_dashdance, LevelValue)

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
    if OAnimFrame < 17
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

#macro TIMED_NEAREST_CLIFF(xVar, yVar, time)
  GetNearestCliff {xVar}
  EstXCoord immediateTempVar {time}
  {xVar} = immediateTempVar - {xVar}
  {xVar} *= -1
  EstYCoord immediateTempVar {time}
  {yVar} *= -1
  {yVar} = {yVar} - (immediateTempVar * -1)
#endmacro

#macro FORCED_SWITCH_CONDITIONS()
  if OAttacking && Equal AirGroundState 1
    if Rnd < 0.3
      Call Spotdodge
    elif Rnd < 0.3
      Call RollBase
    elif True
      label defStart
      DEFENSIVE_REACTION_TIME(var0, var1)
      label def
      if Rnd < 0.3
        Call Unk3020
      elif Rnd < 0.3
        Button R
        Stick 1
        Call AIHub
      elif Rnd < 0.3
        Button R 
        Stick -1
        Call AIHub
      endif
      Return
    endif
  else
    predictOOption var0 man_dashdance
    predictionConfidence var1 man_dashdance
    if Equal var0 op_attack && Rnd < man_dashdance
      Seek def
      Jump
    endif
    if Equal lastScript hex(0x8001)
      Call ApproachHub
    endif
    Call AIHub
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

#macro TRACK_O_OPTIONS()
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
// if OAttacking && OAnimFrame > 1 && OAnimFrame <= 2 && ODistLE 70
//   if YDistBackEdge > -3 && YDistBackEdge <= 3
//     immediateTempVar = TopNX - OTopNX
//     Abs immediateTempVar
//     immediateTempVar += 10
//     if immediateTempVar > 126
//       immediateTempVar = 126
//     endif
//     trackOAction man_oXAttackDist immediateTempVar
//     immediateTempVar = TopNY - OTopNY
//     Abs immediateTempVar
//     immediateTempVar += 10
//     if immediateTempVar > 126
//       immediateTempVar = 126
//     endif
//     trackOAction man_oYAttackDist immediateTempVar
//   endif
// endif
#endmacro

#macro DEFEND_FROM_O()
  predictAverage immediateTempVar man_oXAttackDist
  predictAverage globTempVar man_oYAttackDist
  // DrawDebugRectOutline TopNX TopNY immediateTempVar globTempVar color(0xFF000088)
  if Equal AirGroundState 1 && OFramesHitstun < 1 && !(Equal approachType at_combo)
    predictAverage immediateTempVar man_oXAttackDist
    globTempVar = OXSpeed * 5 * OPos * -1
    immediateTempVar += globTempVar
    // LOGSTR str("oXAttackDist")
    // LOGVAL immediateTempVar
    if XDistLE immediateTempVar
      predictAverage immediateTempVar man_oYAttackDist
      globTempVar = OYSpeed * 5
      immediateTempVar += globTempVar
      globTempVar = TopNY - OTopNY
      Abs globTempVar
      // LOGSTR str("oYAttackDist")
      // LOGVAL immediateTempVar
      if globTempVar <= immediateTempVar
        if CalledAs DefendHub
          immediateTempVar = man_defend
        else
          immediateTempVar = man_approach
        endif
        
        if !(OAttacking) && Rnd <= 0.04
          trackOAction immediateTempVar 0
          predictAverage globTempVar man_oXAttackDist
          globTempVar *= 0.5
          trackOAction man_oXAttackDist globTempVar
        endif

        predictOOption globTempVar immediateTempVar
        predictionConfidence immediateTempVar immediateTempVar
        
        immediateTempVar *= 0.1
        if Equal globTempVar op_attack && Rnd <= immediateTempVar
          immediateTempVar = OPos * OXSpeed
          if immediateTempVar < 0 
            if Rnd < 0.3
              globTempVar = OPos * -1
              AbsStick globTempVar
            elif Rnd < 0.3
              AbsStick OPos
              Button R
            elif Rnd < 0.5
              Call Unk3020
            endif
          endif
        elif Equal globTempVar op_attack && Rnd <= immediateTempVar && Rnd < 0.2
          movePart = 1
          Call FakeOutHub
        endif

        if Equal globTempVar op_attack && Rnd <= immediateTempVar && OAttacking && OAnimFrame > 10 && OAnimFrame < 20
          immediateTempVar = OPos * OXSpeed
          if immediateTempVar < 0 
            if Rnd < 0.3
              globTempVar = OPos * -1
              AbsStick globTempVar
            elif Rnd < 0.3
              AbsStick OPos
              Button R
            elif Rnd < 0.5
              Call Unk3020
            endif
          endif
        endif
      endif
    endif
  endif
  if OAttacking && OAnimFrame < 2 && ODistLE 90
    immediateTempVar = TopNX - OTopNX
    Abs immediateTempVar
    immediateTempVar += 10
    if immediateTempVar > 126
      immediateTempVar = 126
    endif
    trackOAction man_oXAttackDist immediateTempVar
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
      if Damage < 80 || Equal FramesHitlag 1
        ClearStick
        Stick 0 (-1)
      elif Rnd < 0.4
        ClearStick
        Stick 0 (-1)
        if LevelValue >= LV8 && Rnd <= immediateTempVar
          Button R
        endif
      endif
    endif
    Call OnGotDamaged
  endif
#endmacro

#macro DIAMOND_DIST(out, nearCliffX, nearCliffY)
  immediateTempVar = {nearCliffX} 
  globTempVar = {nearCliffY}
  Norm immediateTempVar immediateTempVar globTempVar
  {out} = immediateTempVar - maxXEdgeDist
#endmacro

#macro KILL_CHECK(LABEL, out, kb, hitstun, angle, xCoord, yCoord)
  Goto {LABEL}
  if !(True)
    label {LABEL}
    // LOGSTR str("KChkData")
    COS immediateTempVar {angle}
    immediateTempVar *= {kb}
    immediateTempVar *= OPos
    immediateTempVar *= 0.03
    immediateTempVar *= {hitstun} * 8
    globTempVar = RBoundary - ({xCoord})
    // LOGSTR str("RB")
    // LOGVAL immediateTempVar
    // LOGVAL globTempVar
    if immediateTempVar > globTempVar
      {out} = 1
      Return
    endif
    globTempVar = LBoundary - ({xCoord})
    // LOGSTR str("LB")
    // LOGVAL immediateTempVar
    // LOGVAL globTempVar
    if immediateTempVar < globTempVar
      {out} = 1
      Return
    endif
    globTempVar = TBoundary - ({yCoord})
    SIN immediateTempVar {angle}
    immediateTempVar *= {kb}
    immediateTempVar *= 0.03
    immediateTempVar *= {hitstun} * 8

    // LOGSTR str("TB")
    // LOGVAL immediateTempVar
    // LOGVAL globTempVar
    if immediateTempVar > globTempVar
      {out} = 1
      Return
    endif
    {out} = 0
    Return
  endif
#endmacro

#macro MOVE_KB_WITHIN(LABEL, out, kb, angle, min, minX, maxX, minY, maxY)
  Goto {LABEL}
  if !(True)
    label {LABEL}
    #let out = {out}
    if {kb} < {min}
      out = 0
      Return
    endif
    COS immediateTempVar {angle}
    immediateTempVar *= {kb}
    Abs immediateTempVar
    globTempVar = {minX}
    anotherTempVar = {maxX}
    LOGSTR str("X KB")
    LOGVAL immediateTempVar
    if immediateTempVar < globTempVar || anotherTempVar < immediateTempVar
      out = 0
      Return
    endif

    SIN immediateTempVar {angle}
    immediateTempVar *= {kb}
    LOGSTR str("Y KB")
    LOGVAL immediateTempVar
    globTempVar = {minY}
    anotherTempVar = {maxY}
    if immediateTempVar < globTempVar || anotherTempVar < immediateTempVar
      out = 0
      Return
    endif

    out = 1
    Return
  endif
#endmacro

#macro TO_NEAREST_BLASTZONE(out, angle)
  Goto nearBZ
  if !(True)
    label nearBZ
    globTempVar = {angle}
    immediateTempVar = LBoundary - TopNX
    anotherTempVar = TopNX - RBoundary
    Abs immediateTempVar
    Abs anotherTempVar
    if globTempVar > 90 && globTempVar < 270
      if Equal Direction 1 && immediateTempVar < anotherTempVar
        {out} = 1
        Return
      elif anotherTempVar < immediateTempVar
        {out} = 1
        Return
      endif
    else
      if Equal Direction -1 && immediateTempVar < anotherTempVar
        {out} = 1
        Return
      elif anotherTempVar < immediateTempVar
        {out} = 1
        Return
      endif
    endif
    {out} = 0
    Return
  endif
#endmacro

#macro DIST_TO_TRUE_EDGE(out)
  #let out = {out}
  Goto nearestTrueEdgeCheck
  if !(True)
    label nearestTrueEdgeCheck
    globTempVar = OTopNY + 5
    immediateTempVar = OTopNY - 150
    GetColDistPosRel globTempVar immediateTempVar OTopNX globTempVar 0 -150 0
    if Equal globTempVar -1 && Equal immediateTempVar -1
      out = 0
      Return
    endif
    DrawDebugRectOutline globTempVar immediateTempVar 5 5 color(0xFF0000DD)
    immediateTempVar -= 1

    GetColDistPosRel globTempVar anotherTempVar OTopNX immediateTempVar 150 0 1
    if Equal anotherTempVar -1 && Equal globTempVar -1
      out = 0
    else
      out = globTempVar - OTopNX
    endif
    
    GetColDistPosRel globTempVar anotherTempVar OTopNX immediateTempVar -150 0 1
    if Equal anotherTempVar -1 && Equal globTempVar -1
      Return
    else
      anotherTempVar = globTempVar - OTopNX
      Abs anotherTempVar
      if anotherTempVar < out || Equal out 0
        out = globTempVar - OTopNX
      endif
    endif
    Return
  endif
#endmacro

#macro JUMP_HEIGHT_TEST()
  var0 = 0
  var1 = 0
  var2 = 0

  label start

  label shorthop
  Button X
  label
  if Equal AirGroundState 2
    Seek
    Jump
  endif
  Return
  label 
  if YDistBackEdge < var0
    var0 = YDistBackEdge
  endif
  if Equal AirGroundState 1
    Seek
    Jump
  endif
  Return
  label fullhop
  if CurrAction <= hex(0xA)
    Button X
  endif
  if Equal AirGroundState 2
    Seek
    Jump
  endif
  Return
  label
  if YDistBackEdge < var1
    var1 = YDistBackEdge
  endif
  if YSpeed < 0
    Button X
    Seek
    Jump
  endif
  Return
  label djump
  if YDistBackEdge < var2
    var2 = YDistBackEdge
  endif
  if Equal AirGroundState 1
    Seek
    Jump
  endif
  Return
  label output

  LOGSTR str("sh dist")
  LOGVAL var0
  LOGSTR str("fh dist")
  LOGVAL var1
  LOGSTR str("dj dist")
  LOGVAL var2

  Seek start
  Return
#endmacro

#macro DETECT_O_SITUATION(out, above, left, right, below, currPos)
  #let out = {out}
  #let abovePos = {above}
  #let leftPos = {left}
  #let rightPos = {right}
  #let belowPos = {below}
  GetYDistFloorOffset abovePos 0 70 1
  GetYDistFloorOffset leftPos (-35) 35 1
  GetYDistFloorOffset rightPos 35 35 1
  globTempVar = OYDistBackEdge - 3
  GetYDistFloorOffset belowPos 0 globTempVar 1

  if Equal abovePos -1
    abovePos = BBoundary
  else 
    abovePos = OTopNY + 70 - abovePos
  endif
  if Equal leftPos -1
    leftPos = BBoundary
  else 
    leftPos = OTopNY + 35 - leftPos
  endif
  if Equal rightPos -1
    rightPos = BBoundary
  else 
    rightPos = OTopNY + 35 - rightPos
  endif
  if Equal belowPos -1
    belowPos = BBoundary
  else
    belowPos = OTopNY - belowPos
  endif

  #let currPos = {currPos}
  currPos = OTopNY + OYDistBackEdge  

  globTempVar = leftPos - rightPos
  immediateTempVar = leftPos - abovePos
  Abs globTempVar
  Abs immediateTempVar
  if globTempVar < 1 && immediateTempVar < 1 && !(Equal leftPos BBoundary) && leftPos < 1
    // flat ground
    // LOGSTR str("flat ground")
    out = st_floor
  elif Equal abovePos BBoundary && Equal belowPos BBoundary
    // offstage
    // LOGSTR str("offstage")
    out = st_offstage
  elif Equal leftPos BBoundary
    // disadvantage L
    // LOGSTR str("disad L")
    if rightPos < OTopNY || abovePos < OTopNY && !(Equal belowPos BBoundary) 
      // above platform
      // LOGSTR str("> above plat")
      out = st_disadv_above_plat
    elif abovePos > OTopNY
      // below platform
      // LOGSTR str("> below plat")
      out = st_disadv_below_plat
    else
      // no platform
      // LOGSTR str("> no plat")
      out = st_disadv_no_plat
    endif
  elif Equal rightPos BBoundary
    // disadvantage R
    // LOGSTR str("disad R")
    if leftPos < OTopNY || abovePos < OTopNY && !(Equal belowPos BBoundary) 
      // above platform
      // LOGSTR str("> above plat")
      out = st_disadv_above_plat
    elif abovePos > OTopNY
      // below platform
      // LOGSTR str("> below plat")
      out = st_disadv_below_plat
    else
      // no platform
      // LOGSTR str("> no plat")
      out = st_disadv_no_plat
    endif
  elif !(Equal belowPos BBoundary) 
    // platform
    // LOGSTR str("plat")
    globTempVar = currPos - belowPos
    if globTempVar > 40
      // high platform
      // LOGSTR str("> high")
      globTempVar = OTopNY - currPos
      if globTempVar > 30
        // camping?
        // LOGSTR str(">> camp")
        out = st_plat_high_camp
      else
        // regular
        // LOGSTR str(">> reg")
        out = st_plat_high_reg
      endif
    else
      // regular platform
      LOGSTR str("> regular")
      globTempVar = OTopNY - currPos
      if globTempVar > 30
        // camping?
        // LOGSTR str(">> camp")
        out = st_reg_camp
      else
        // regular
        // LOGSTR str(">> reg")
        out = st_reg_reg
      endif
    endif
  elif abovePos > OTopNY
    // below platform
    // LOGSTR str("below plat")
    out = st_below_plat
  else
    // awkward spot, likely between/near platforms or something
    // LOGSTR str("between plat")
    out = st_between_plat
  endif

  // var5 = OTopNX - 25
  // DrawDebugRectOutline var5 leftPos 5 5 color(0xFF0000DD)
  // DrawDebugRectOutline OTopNX belowPos 5 5 color(0xFF0000DD)
  // DrawDebugRectOutline OTopNX abovePos 5 5 color(0xFF0000DD)
  // DrawDebugRectOutline OTopNX currPos 5 5 color(0x0000FFDD)
  // var5 = OTopNX + 25
  // DrawDebugRectOutline var5 rightPos 5 5 color(0xFF0000DD)
#endmacro

#macro ADJUST_RANGES()
  #let unkVar = var0
  #let start = var1
  #let end = var2
  #let xmin = var3
  #let xmax = var4
  #let ymin = var5
  #let ymax = var6
  #let xStart = var7
  #let yStart = var8
  RetrieveFullATKD unkVar start end xmin xmax ymin ymax OCurrSubaction 1

  SAFE_WRITE_0 xmin
  SAFE_WRITE_1 xmax
  SAFE_WRITE_2 ymin
  SAFE_WRITE_3 ymax

  SAFE_INJECT_0 xmin
  SAFE_INJECT_1 xmax
  SAFE_INJECT_2 ymin
  SAFE_INJECT_3 ymax

  if Equal OAnimFrame 1
    xStart = OTopNX
    yStart = OTopNY
  endif

  LOGVAL unkVar

  if !(Equal unkVar (-1))
    #let cx = var9
    #let cy = var10
    globTempVar = xmax - xmin
    globTempVar *= 0.5
    cx = globTempVar + xmin
    cx *= ODirection
    cx += xStart
    immediateTempVar = ymax - ymin
    immediateTempVar *= 0.5
    cy = immediateTempVar + yStart + ymin
    
    if OAnimFrame >= start && OAnimFrame <= end
      DrawDebugRectOutline cx cy globTempVar immediateTempVar color(0xFF0000DD)
    elif OAnimFrame < unkVar
      DrawDebugRectOutline cx cy globTempVar immediateTempVar color(0x880000DD)
    else 
      DrawDebugRectOutline cx cy globTempVar immediateTempVar color(0x00FF00DD)
    endif
  endif
#endmacro

#macro RAYCAST_DEMO()
  #let angle = var7
  #let shouldDetectPlats = var8
  if angle < 0 || angle >= 360
    angle = 0
    shouldDetectPlats = 0
  endif
  label 
  #let dist = var0
  #let colX = var1
  #let colY = var2
  angle += 1
  if angle >= 360
    angle = 0
    shouldDetectPlats += 1
    if shouldDetectPlats > 1
      shouldDetectPlats = 0
    endif
  endif

  OR immediateTempVar angle angle
  COS globTempVar immediateTempVar
  SIN immediateTempVar immediateTempVar
  LOGSTR str("======")
  LOGVAL angle
  LOGVAL globTempVar
  LOGVAL immediateTempVar
  globTempVar *= 100
  globTempVar += OTopNX
  immediateTempVar *= 100
  immediateTempVar += OTopNY
  GetColDistPos colX colY OTopNX OTopNY globTempVar immediateTempVar shouldDetectPlats
  DrawDebugLine OTopNX OTopNY globTempVar immediateTempVar color(0x00000033)
  if Equal colX -1 && Equal colY -1
    Return
  endif
  globTempVar = OTopNX - colX
  immediateTempVar = OTopNY - colY 
  Norm dist globTempVar immediateTempVar
  Abs dist
  #let intensity = var3
  if dist > 100
    intensity = 255
  elif dist < 10
    intensity = 10
  else
    intensity = dist / 100
    intensity *= 245
    intensity += 10
  endif
  intensity = intensity - 255

  if Equal shouldDetectPlats 0
    DrawDebugLine OTopNX OTopNY colX colY intensity 0 0 254
  else
    DrawDebugLine OTopNX OTopNY colX colY 0 intensity intensity 254
  endif
  Return
#endmacro

#macro LUC_SHIELD_PRESSURE()
  #const shieldAct = hex(0x1B)
  #const shieldStunAct = hex(0x1D)

  #let hasHitShield = var0

  #const LUC_SFALL_ACTIONS = Equal OCurrAction hex(0x10) || Equal OCurrAction hex(0x11c)
  #const LUC_NSPECIAL_ACTIONS = Equal OCurrAction hex(0x112) || Equal OCurrAction hex(0x117) || Equal OCurrAction hex(0x118) || Equal OCurrAction hex(0x119)
  #const LUC_SSPECIAL_ACTIONS = Equal OCurrAction hex(0x113) || Equal OCurrSubaction hex(0x66)
  #const LUC_USPECIAL_ACTIONS = Equal OCurrAction hex(0x114) || Equal OCurrAction hex(0x11b)
  #const LUC_DSPECIAL_ACTIONS = Equal OCurrAction hex(0x115)

  label shieldLoop
  if Equal AirGroundState 1
    Button R
    if Equal CurrAction shieldStunAct && ShieldStunRemaining <= 1
      if Equal OCurrSubaction Attack12 // jab
        AbsStick OPos
        hasHitShield = 0
      elif Equal OCurrSubaction AttackDash // DA
        AbsStick OPos
        hasHitShield = 0
      elif Equal OCurrAction hex(0x27) // ftilt
        AbsStick OPos
        hasHitShield = 0
      elif Equal OCurrSubaction AttackHi3 // utilt
        AbsStick OPos
        hasHitShield = 0
      elif Equal OCurrSubaction AttackLw3 // dtilt
        AbsStick OPos
        hasHitShield = 0
      elif Equal OCurrSubaction AttackS4S || Equal OCurrSubaction AttackS4Start
        AbsStick OPos
        hasHitShield = 0
      elif Equal OCurrSubaction AttackHi4 || Equal OCurrSubaction AttackHi4Start
        AbsStick OPos
        hasHitShield = 0
      elif Equal OCurrSubaction AttackLw4 || Equal OCurrSubaction AttackLw4Start
        AbsStick OPos
        hasHitShield = 0
      elif Equal OCurrSubaction AttackAirN
        AbsStick OPos
        hasHitShield = 0
      elif Equal OCurrSubaction AttackAirHi
        AbsStick OPos
        hasHitShield = 0
      elif Equal OCurrSubaction AttackAirLw
        AbsStick OPos
        hasHitShield = 0
      elif Equal OCurrSubaction AttackAirF
        AbsStick OPos
        hasHitShield = 0
      elif Equal OCurrSubaction AttackAirB
        AbsStick OPos
        hasHitShield = 0
      elif LUC_NSPECIAL_ACTIONS
        AbsStick OPos
        hasHitShield = 0
      elif LUC_SSPECIAL_ACTIONS
        AbsStick OPos
        hasHitShield = 0
      elif LUC_USPECIAL_ACTIONS
        AbsStick OPos
        hasHitShield = 0
      elif LUC_DSPECIAL_ACTIONS
        AbsStick OPos
        hasHitShield = 0
      endif
    endif
  endif
  if Equal YDistFloor -1
    CallI RecoveryHub
  endif
  Return

#endmacro