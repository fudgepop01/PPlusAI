// macros are extremely important and can be used as building blocks
// or abstractions to keep routines clean.
// by having a line that consists solely of one of these names
// such as "CALC_TARGET_DISTANCES", the preprocessor will replace it
// with everything in here.
//
// This also means that any variables that are defined here can also be
// used outside of the script -- so after plonking down "CALC_TARGET_DISTANCES"
// I can use targetXDistance. you'll see this in 1.as

#macro CALC_TARGET_DISTANCES(out1, out2, calcVar, gravVar, frameCount, lab1, lab2)
  #let targetXDistance = {out1}
  #let targetYDistance = {out2}
  #let heightOffset = {calcVar}

  globTempVar = OTopNY + OHurtboxSize
  heightOffset = move_yRange / 2
  heightOffset = TopNY - move_yOffset + heightOffset
  if heightOffset > globTempVar
    heightOffset = OHurtboxSize * -1
  elif heightOffset < OTopNY
    heightOffset = 0
  else
    globTempVar = (globTempVar - heightOffset)
    globTempVar = globTempVar * -1
    heightOffset = OHurtboxSize / globTempVar
  endif

  // if Equal var8 0 || Equal var8 1 || Equal movePart 1
  //   targetXDistance = TopNX + (move_xOffset * Direction)
  //   targetXDistance = targetXDistance + (move_xRange * Direction)
  //   targetYDistance = TopNY - move_yOffset + move_yRange
  //   DrawDebugRectOutline targetXDistance targetYDistance move_xRange move_yRange color(0xFF444499)
  //   targetYDistance += heightOffset
  //   if move_yOffset > -2 && lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F)
  //     targetYDistance = targetYDistance + move_yOffset + 2 - heightOffset
  //   endif
  //   if Equal PlayerNum 0
  //     DrawDebugRectOutline targetXDistance targetYDistance move_xRange move_yRange color(0xFF444499)
  //   elif Equal PlayerNum 1
  //     DrawDebugRectOutline targetXDistance targetYDistance move_xRange move_yRange color(0x4444FF99)
  //   elif Equal PlayerNum 2
  //     DrawDebugRectOutline targetXDistance targetYDistance move_xRange move_yRange color(0xFFFF4499)
  //   elif Equal PlayerNum 3
  //     DrawDebugRectOutline targetXDistance targetYDistance move_xRange move_yRange color(0x44FF4499)
  //   else
  //     DrawDebugRectOutline targetXDistance targetYDistance move_xRange move_yRange color(0x44444499)
  //   endif

  //   {gravVar} = OHurtboxSize / 2
  //   globTempVar = OTopNY + {gravVar}
  //   DrawDebugRectOutline OTopNX globTempVar move_xRange {gravVar} color(0x44FF4499)
  // endif


  globTempVar = 0
 // SAFE_INJECT_1 globTempVar
  globTempVar = {frameCount} + {gravVar} + globTempVar
  globTempVar /= 60
  EstOPosVecR targetXDistance targetYDistance globTempVar

  // convert the values to use TopN X and Y instead of character's coordinates
  globTempVar = ExactOXCoord - ExactXCoord
  globTempVar = globTempVar - (OTopNX - TopNX)
  targetXDistance = targetXDistance - globTempVar

  globTempVar = ExactOYCoord - ExactYCoord
  globTempVar = globTempVar - (OTopNY - TopNY)
  targetYDistance = targetYDistance - globTempVar

  targetXDistance += TopNX
  targetXDistance = targetXDistance - (move_xRange * Direction)
  targetYDistance += TopNY

  // globTempVar = YDistBackEdge

  // if move_yOffset > -2 && lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F)
  //   targetYDistance = targetYDistance + move_yOffset + 2 - heightOffset - OHurtboxSize
  // endif

  // targetYDistance -= TopNY

  globTempVar = heightOffset * 2
  targetYDistance -= globTempVar
  targetYDistance = targetYDistance - move_yRange
  targetYDistance += move_yOffset
  targetXDistance = targetXDistance - (move_xOffset * Direction)
  // if Equal var8 0 || Equal var8 1 || Equal movePart 1
  //   DrawDebugRectOutline targetXDistance targetYDistance move_xRange move_yRange color(0xFF000088)
  // endif

  targetXDistance -= TopNX
  targetYDistance -= TopNY
#endmacro

#macro COULD_HIT_WITH_FASTFALL(outVar, throwAway1, throwAway2, targetYDistance, frameCount, lName)
  #let canHit = {outVar}
  #let estimate = {throwAway1}

  CALC_FASTFALL_DIST({outVar}, {throwAway1}, {throwAway2}, {frameCount}, {lName})

  estimate = {frameCount}
  estimate /= 60
  EstOYCoord estimate estimate
  estimate -= ExactOYCoord
  estimate += OTopNY

  if estimate < OYDistBackEdge
    estimate = OYDistBackEdge
  endif

  globTempVar = TopNY + canHit
  globTempVar -= estimate

  if globTempVar <= move_yRange && globTempVar > 0 && !(canHit < YDistBackEdge)
    canHit = 1
  else
    canHit = 0
  endif
#endmacro

// does what "CalcYChangeGravity" does but with more lines
#macro CALC_SELF_Y_CHANGE_GRAVITY(accumVar, calcVar, frameCount, lName)
  #let accumulator = {accumVar}
  #let tracker = {calcVar}

  globTempVar = {frameCount}

  accumulator = 0
  tracker = YSpeed * -1
  Seek {lName}
  Jump
  if !(True)
    label {lName}
    accumulator += tracker
    globTempVar -= 1
    tracker += gravity // gravity
    if tracker > fastFallSpeed
      tracker = fastFallSpeed
    elif tracker > MaxFallSpeed
      tracker = MaxFallSpeed
    endif
    if globTempVar < 1
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

  globTempVar = {frameCount}

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

  globTempVar = {frameCount}

  accumulator = 0
  tracker = OCharYSpeed + OKBYSpeed
  tracker *= -1
  Seek {lName}
  Jump
  if !(True)
    label {lName}
    accumulator += tracker
    globTempVar -= 1
    tracker += {oGrav} // gravity
    if tracker > OMaxFallSpeed
      tracker = OMaxFallSpeed
    endif
    if globTempVar < 1
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
  endif
#endmacro

#macro DEFENSIVE_REACTION_TIME(tempVar1, tempVar2)
  #let delay = {tempVar1}
  #let tActionFreq = {tempVar2}
  tActionFreq = Rnd * 5
  if tActionFreq >= 5
      delay = 0
  elif tActionFreq >= 4
      delay = 5
      if Equal LevelValue LV9
        delay = 0
      endif
  elif tActionFreq >= 3
      delay = 10
  elif tActionFreq >= 2
      delay = 15
  else
      delay = 21
  endif
  if !(Equal delay 0)
    delay = delay + Rnd * 5
    delay = delay + Rnd * (100 - LevelValue) / 6
  endif

  #let oFinished = {tempVar2}
  oFinished = 0
  label
  if !(OAttacking)
    oFinished = 1
  endif
  if Equal oFinished 1 && OAttacking
    Seek
  elif delay <= 0
    Seek
  endif
  delay -= 1
  Return

  label begin
#endmacro

// will setup and perform a jump if the target position is within the given
// ranges
#macro JUMP_IF_IN_RANGES(tempVar)
  #let targetYDistance = {tempVar}
  globTempVar = targetYDistance + (OTotalYSpeed + TotalYSpeed) * 3
  if MeteoChance && Equal IsOnStage 0 && YSpeed < 0.01 && globTempVar > 30 && globTempVar < 60
    Button X
  endif

  if globTempVar > 15 && globTempVar < 70 && Equal AirGroundState 1 && CurrAction <= 9
    Button X
  endif

  if globTempVar > 20 && globTempVar < 70 && Equal CurrSubaction JumpSquat
    Button X
  endif

  if globTempVar > 35 && globTempVar < 55 && Equal AirGroundState 2 && CanJump && Equal IsOnStage 1
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
    distance = 10
  else
    distance = 25
  endif
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
    if Rnd < 0.1 || Equal CurrAction hex(0x0A)
      Button X
    elif Rnd < 0.05 && YDistBackEdge < -25
      ClearStick
      Stick -1 0
    elif Rnd < 0.1
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

// dashdances between 0 and 5 times if the opponent is far away and
// the character isn't too close to the edge
#macro DASHDANCE(tempVar1, tempVar2)
  #let amount = {tempVar1}
  #let frameCount = {tempVar2}
  amount = (120 - LevelValue) / 100
  amount = (Rnd * 10) - 10 * amount
  frameCount = (Rnd * 10) + 3
  label _dashdance
  if Equal AirGroundState 1 && amount > 0 && Equal OFramesHitstun 0 && !(ODistLE 15)
    if Equal CurrAction hex(0x01) && !(Equal CurrAction hex(0x07))
        ClearStick
    elif NumFrames >= frameCount && Equal CurrAction hex(0x03)
      Goto _ddSubr
    elif AnimFrame >= 27 && Equal CurrAction hex(0x03)
      Goto _ddSubr
    elif Equal CurrAction hex(0x04)
      ClearStick
    elif Rnd < 0.7 && Equal CurrAction hex(0x03) && !(XDistFrontEdge <= 10)
      Return
    elif XDistFrontEdge <= 10
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
  amount = amount - 1
  if (amount > 0)
    Stick (-1)
  endif
  frameCount = (Rnd * 10) + 3
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
elif OIsCharOf Mario
  {weight} = 100
  {gravity} = 0.095
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