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
  #let gv = {gravVar}
  if lastAttack >= valJab123 && lastAttack <= valDSmash
    if Equal AirGroundState 1 && Equal CurrAction hex(0x03) && !(Equal lastAttack hex(0x603C)) && !(Equal lastAttack hex(0x6036))
      gv = jumpSquatFrames
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
    globTempVar -= move_hitFrame 
    globTempVar -= index
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

  globTempVar -= OSCDBottom
  globTempVar *= -2
  immediateTempVar = tempTargetY - OSCDBottom
  globTempVar += immediateTempVar
  globTempVar += TopNY

  // estimate target position separately  

  #let targetX = {out1}
  #let targetY = {out2}
  immediateTempVar = {frameCount} + gv

  gv = 0
  if !(CalledAs ComboHub) // because this involves a label
    // calculate Opponent change in gravity (used later)
    GET_WEIGHT_TABLE(gv, gv) // at this point gv is useless and can be overwritten

    O_CALC_SELF_Y_CHANGE_GRAVITY(targetX, targetY, gv, {frameCount}, _MID_CALC_O_GRAV)
    gv = targetX
  endif

  EstOYCoord targetY immediateTempVar
  // if the opponent is in an actionable state, lower the estimate of
  // their x offset to prevent dashdancing from setting it off when very far away
  // if OCurrAction <= hex(0x15)
  //   immediateTempVar /= 3
  // endif
  EstOXCoord targetX immediateTempVar
  targetY = targetY - (OSCDBottom - OTopNY)

  // targetX = estimated target x position
  // targetY = estimated target y position
  // localTemp = estimated own x position
  // globTempVar = estimated own y position
  // immediateTempVar = temporary variable

  // correct if estimated y positions go beyond ground level
  // target
  immediateTempVar = OYDistBackEdge + OTopNY
  if targetY < immediateTempVar && Equal OIsOnStage 1
    immediateTempVar -= targetY
    targetY += immediateTempVar
    globTempVar -= immediateTempVar
  elif Equal OCurrAction hex(0x46) || Equal OCurrAction hex(0x4A) || Equal OCurrAction hex(0x54) || Equal OCurrAction hex(0x55)
    immediateTempVar -= targetY
    targetY += immediateTempVar
  elif Equal OAirGroundState 1
    globTempVar -= gv
  endif

  // self (dependent on target)
  immediateTempVar = YDistBackEdge + TopNY
  if globTempVar < immediateTempVar && Equal IsOnStage 1
    // if CalledAs ApproachHub && Equal index 1 && lastAttack >= valNAir && lastAttack <= valDAir && InAir
    //   Call AIHub
    // endif 
    immediateTempVar -= globTempVar
    globTempVar += immediateTempVar
  endif

  // if !(CalledAs ComboHub)
  //   if Equal index 1 || Equal movePart 1
  //     // self
  //     DrawDebugRectOutline localTemp globTempVar 5 5 color(0xFF000088)
  //     // target
  //     DrawDebugRectOutline targetX targetY 5 5 color(0x0000FF88)
  //   endif
  // endif

  // calculate difference between the two
  #let targetXDistance = {out1}
  #let targetYDistance = {out2}
  
  targetXDistance = localTemp - targetX
  targetYDistance = globTempVar - targetY

  // adjust for the move parameters
  if !(InAir)
    globTempVar = move_xOffset + (move_xRange * 2)
    globTempVar /= 2
    if globTempVar <= 0
      targetXDistance = targetXDistance + (move_xOffset * OPos)
    else 
      targetXDistance = targetXDistance - (move_xRange * OPos)
      targetXDistance = targetXDistance - (move_xOffset * OPos)
    endif 
  else
    targetXDistance = targetXDistance - (move_xRange * Direction)
    targetXDistance = targetXDistance - (move_xOffset * Direction)
  endif
  targetYDistance += move_yOffset
  targetYDistance -= move_yRange

  immediateTempVar = AirTime + {frameCount}

  if immediateTempVar > 10 && lastAttack >= hex(0x6040)
    targetYDistance += 5
  endif

  // // adjust for opponent position (aim towards nearest blastzone)
  // if OTopNX > 0
  //   targetXDistance += move_xRange
  // else
  //   targetXDistance -= move_xRange
  // endif

  // account for target height
  immediateTempVar = 0
  SAFE_INJECT_D immediateTempVar
  globTempVar = OSCDBottom + OHurtboxSize // top of target
  localTemp = TopNY - move_yOffset + move_yRange + immediateTempVar // center of move detection
  if localTemp >= globTempVar 
    // self is above
    localTemp = OHurtboxSize
  elif localTemp <= OSCDBottom 
    // self is below
    localTemp = 0 // OHurtboxSize * -1
  else 
    // self is between
    globTempVar -= localTemp
    localTemp = OHurtboxSize - globTempVar
    // localTemp = immediateTempVar
  endif
  // localTemp *= -1
  targetYDistance += localTemp

  // if !(CalledAs ComboHub)
  //   if Equal index 1 || Equal movePart 1
  //     targetXDistance += TopNX
  //     targetYDistance += TopNY
  //     DrawDebugRectOutline targetXDistance targetYDistance move_xRange move_yRange color(0x00FF0088)
  //     targetXDistance -= TopNX
  //     targetYDistance -= TopNY

  //     globTempVar = TopNY - move_yOffset + move_yRange + immediateTempVar
  //     DrawDebugRectOutline TopNX globTempVar 10 0 color(0x00FFFF88)

  //     immediateTempVar = (move_xOffset + move_xRange)
  //     immediateTempVar *= Direction
  //     immediateTempVar += TopNX
  //     globTempVar = TopNY - move_yOffset + move_yRange
  //     DrawDebugRectOutline immediateTempVar globTempVar move_xRange move_yRange color(0x88888888)
  //     globTempVar += localTemp
  //     if OTopNX > 0
  //       immediateTempVar += move_xRange
  //     else
  //       immediateTempVar -= move_xRange
  //     endif 
  //     DrawDebugRectOutline immediateTempVar globTempVar move_xRange move_yRange color(0xFFFFFF88)

  //     immediateTempVar = OHurtboxSize / 2
  //     globTempVar = immediateTempVar + OSCDBottom
  //     DrawDebugRectOutline OTopNX globTempVar 5 immediateTempVar color(0xFFFF00DD)
  //   endif
  // endif

  // if !(CalledAs ComboHub) && LevelValue >= LV7 && !(Equal approachType at_combo) 
  //   globTempVar = {frameCount} - index
  //   targetXDistance = targetXDistance + OXSpeed * globTempVar * -2
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
  estimate = estimate + ExactOYCoord - OTopNY

  // LOGSTR str("~~~~~~~")
  // LOGVAL OTopNY
  // LOGVAL estimate
  // LOGVAL OYDistBackEdge
  // LOGVAL move_yRange

  globTempVar = OYDistBackEdge + OTopNY
  globTempVar *= -1

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

  globTempVar = estimate - TopNY - canHit
  // LOGSTR str("~~ var8 ~~")
  // LOGVAL var8
  // LOGVAL TopNY
  // LOGVAL OTopNY
  // LOGVAL estimate
  // LOGVAL canHit
  // LOGVAL globTempVar
  immediateTempVar = YDistBackEdge + 10
  if globTempVar <= move_yRange && globTempVar > 0 && !(canHit < immediateTempVar)
    canHit = 1
    // canHit = 0
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
  tracker = YSpeed * -1
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

  if YSpeed > 0
    calculator = YSpeed

    label {lName}

    calculator -= gravity
    distTracker += calculator
    globTempVar -= 1

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
  xPosOffs += TopNX
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

#macro OFFSTAGE_OFFSET(outVar, throwAwayVar, offset)
  #let goingOffstage = {outVar}
  #let relCliffXPos = {outVar}
  GetNearestCliff relCliffXPos

  #let xPosOffs = {throwAwayVar}
  xPosOffs = {offset}
  xPosOffs += TopNX
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
  globTempVar = move_xRange * 0.75
  move_xOffset -= globTempVar
  move_xRange = move_xRange + globTempVar
  globTempVar = move_yRange * 0.75
  move_yOffset += globTempVar
  move_yRange = move_yRange + globTempVar
#endmacro

#macro DEFENSIVE_REACTION_TIME(tempVar1, tempVar2)
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
  if !(OAttacking)
    oFinished = 1
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
  globTempVar = targetYDistance
  if MeteoChance && Equal IsOnStage 0 && YSpeed < 0.01 && globTempVar > DJIfOBeyond && globTempVar < DJIfOWithin
    Button X
  endif

  if globTempVar > SHIfOBeyond && globTempVar < jumpIfOWithin && Equal AirGroundState 1 && CurrAction <= 9
    Button X
  endif

  if globTempVar > FHIfOBeyond && globTempVar < jumpIfOWithin && Equal CurrSubaction JumpSquat
    Button X
  endif

  if globTempVar > DJIfOBeyond && globTempVar < DJIfOWithin && Equal AirGroundState 2 && CanJump && Equal IsOnStage 1 && YSpeed < 0.1
    Button X
  endif
#endmacro

#macro RECORD_HIT_KNOCKBACK()
if Equal HitboxConnected 1 && OKBSpeed > hit_knockback && OFramesHitstun > 0
  hit_knockback = OKBSpeed
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
  amount = (120 - LevelValue) / 100
  amount = (Rnd * dashCountMax) - dashCountMax * amount
  frameCount = (Rnd * 10) + dashDanceMinFrames
  label _dashdance
  if Equal CurrAction hex(0x0A) || Equal CurrAction hex(0x16)
    Return
  elif InAir && YDistBackEdge > -5 && YDistBackEdge < 0 && !(Equal XDistFrontEdge XDistBackEdge)
    if XDistBackEdge < -shortEdgeRange && XDistFrontEdge > shortEdgeRange
      Button R
      if ODistLE 30
        Stick -1 (-1)
      else
        Stick 1 (-1)
      endif
      Return
    endif
  elif Equal AirGroundState 1 && amount > 0 && Equal OFramesHitstun 0
    if Equal CurrAction hex(0x01) && !(Equal CurrAction hex(0x07))
      ClearStick
    elif NumFrames >= frameCount && Equal CurrAction hex(0x03)
      Goto _ddSubr
    elif AnimFrame >= dashForceTurnFrame && Equal CurrAction hex(0x03)
      Goto _ddSubr
    elif Equal CurrAction hex(0x04)
      ClearStick
    elif Rnd < 0.7 && Equal CurrAction hex(0x03) && !(XDistFrontEdge <= 10)
      Return
    elif XDistFrontEdge <= 10 || ODistLE 15
      SetFrame 0
      Stick (-1)
      amount -= 1
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
  if (amount > 0)
    Stick (-1)
  endif
  frameCount = (Rnd * 10) + dashDanceMinFrames
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
  if Equal lastScript hex(0x8001)
    Call ApproachHub
  endif
#endmacro