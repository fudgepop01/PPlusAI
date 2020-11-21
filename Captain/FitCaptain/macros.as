// macros are extremely important and can be used as building blocks
// or abstractions to keep routines clean.
// by having a line that consists solely of one of these names
// such as "CALC_TARGET_DISTANCES", the preprocessor will replace it
// with everything in here.
//
// This also means that any variables that are defined here can also be
// used outside of the script -- so after plonking down "CALC_TARGET_DISTANCES"
// I can use targetXDistance. you'll see this in 1.as

// calculates the target distance to the opponent and visualizes it for
// debugging purposes. The rectangle color is based on the player number
#macro CALC_TARGET_DISTANCES(out1, out2, calcVar, gravVar, frameCount, lab1, lab2)
  // DrawDebugPoint TopNX TopNY color(0xFF000055)

  #let tempMacVar1 = {out1}
  #let tempMacVar2 = {out2}
  tempMacVar1 = TopNX + (move_xOffset * Direction)
  tempMacVar2 = TopNY - move_yOffset
  // DrawDebugPoint tempMacVar1 tempMacVar2 color(0xFF00FFFF)

  #let targetX = {out1}
  #let targetY = {out2}

  #let deltaY = {out1}
  #let oDeltaY = {out2}
  // targetY
  oDeltaY = OHurtboxSize
  deltaY = HurtboxSize

  GET_WEIGHT_TABLE({calcVar}, {gravVar})

  globTempVar = 0

  if OInAir && !(Equal OYSpeed 0) && !(Equal OCurrAction hex(0x54))
    O_CALC_SELF_Y_CHANGE_GRAVITY({out2}, {calcVar}, {gravVar}, {frameCount}, {lab1})
    globTempVar = oDeltaY * -1
    if OYDistBackEdge < globTempVar && Equal OIsOnStage 1
      oDeltaY = OYDistBackEdge * -1
    endif
  endif
  if InAir
    CALC_SELF_Y_CHANGE_GRAVITY({out1}, {calcVar}, {frameCount}, {lab2})
    globTempVar = deltaY * -1
    if YDistBackEdge < globTempVar && Equal IsOnStage 1
      deltaY = YDistBackEdge * -1
    endif
  endif

  targetY = OTopNY + move_yOffset + (OHurtboxSize) + (oDeltaY - deltaY)

  if TopNY > OTopNY
    targetY *= -1
  endif

  // targetX
  if Equal CurrAction hex(0x07)
    targetX = OTopNX + (move_xOffset * Direction)
  else
    targetX = OTopNX + (move_xOffset * Direction * -1)
  endif

  targetX = targetX + (OXSpeed * move_hitFrame) - (XSpeed * move_hitFrame)
  // if Equal PlayerNum 0
  //   DrawDebugRectOutline targetX targetY move_xRange move_yRange color(0xFF000055)
  // elif Equal PlayerNum 1
  //   DrawDebugRectOutline targetX targetY move_xRange move_yRange color(0x0000FF55)
  // elif Equal PlayerNum 2
  //   DrawDebugRectOutline targetX targetY move_xRange move_yRange color(0xFFFF0055)
  // elif Equal PlayerNum 3
  //   DrawDebugRectOutline targetX targetY move_xRange move_yRange color(0x00FF0055)
  // else
  //   DrawDebugRectOutline targetX targetY move_xRange move_yRange color(0x00000055)
  // endif
  // DrawDebugPoint targetX targetY color(0xFF000055)


  #let targetXDistance = {out1}
  #let targetYDistance = {out2}
  targetXDistance = targetX - TopNX
  targetYDistance = targetY - TopNY
#endmacro

// does what "CalcYChangeGravity" does but with more lines
#macro CALC_SELF_Y_CHANGE_GRAVITY(accumVar, calcVar, frameCount, lName)
  #let accumulator = {accumVar}
  #let tracker = {calcVar}

  globTempVar = {frameCount}

  accumulator = 0
  tracker = TotalYSpeed
  Goto {lName}
  if !(True)
    label {lName}
    accumulator += tracker
    globTempVar -= 1
    tracker += 0.13 // gravity
    if tracker > MaxFallSpeed
      tracker = MaxFallSpeed
    endif
    if globTempVar < 1
      Return
    endif
    Goto {lName}
  endif
#endmacro

// does what "CalcYChangeGravity" does but with more lines
#macro O_CALC_SELF_Y_CHANGE_GRAVITY(accumVar, calcVar, oGrav, frameCount, lName)
  #let accumulator = {accumVar}
  #let tracker = {calcVar}

  globTempVar = {frameCount}

  accumulator = 0
  tracker = OTotalYSpeed
  Goto {lName}
  if !(True)
    label {lName}
    accumulator += tracker
    globTempVar -= 1
    tracker += {oGrav} // gravity
    if tracker > OMaxFallSpeed
      tracker = OMaxFallSpeed
    endif
    if globTempVar < 1
      Return
    endif
    Goto {lName}
  endif
#endmacro

// will calculate whether or not the player will be on stage at their current X velocity after
// a given amount of frames
#macro GOING_OFFSTAGE(outVar, throwAwayVar, frameCount)
  #let goingOffstage = {outVar}
  #let relCliffXPos = {outVar}
  GetNearestCliffR relCliffXPos

  #let xPosOffs = {throwAwayVar}
  xPosOffs = XSpeed * {frameCount}
  xPosOffs += TopNX
  if Equal IsOnStage 1 && relCliffXPos < 0
    relCliffXPos += xPosOffs
    if relCliffXPos >= 0
      goingOffstage = 1
    endif
  elif Equal IsOnStage 1 && relCliffXPos > 0
    relCliffXPos += xPosOffs
    if relCliffXPos <= 0
      goingOffstage = -1
    endif
  endif
  if !(Equal goingOffstage 1) || !(Equal goingOffstage -1)
    if Equal IsOnStage 0
      goingOffstage = 2
    else
      goingOffstage = 0
    endif
  endif
#endmacro

// to make AIs less accurate with their moves the lower their level gets
#macro MESS_MOVE_PARAMS(adjustVar)
  #let adjustment = {adjustVar}

  move_yRange = move_yRange + OHurtboxSize

  adjustment = (100 - LevelValue) / 3
  move_xOffset = move_xOffset + (Rnd * adjustment * 2) - (adjustment)
  move_yOffset = move_yOffset + (Rnd * adjustment * 2) - (adjustment)

  adjustment = (100 - LevelValue) / 5
  move_xRange = move_xRange + (Rnd * adjustment)
  move_yRange = move_yRange + (Rnd * adjustment)

  adjustment = (100 - LevelValue) / 15
  move_hitFrame = move_hitFrame + (Rnd * adjustment) - (adjustment / 2)

  adjustment = (100 - LevelValue) / 25
  move_IASA = move_IASA + (Rnd * adjustment)
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

  label
  if delay <= 0
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
  if MeteoChance && targetYDistance > 10 && targetYDistance < 45 && Equal IsOnStage 0 && YSpeed < 0.01
    Button X
  endif

  if targetYDistance > 15 && Equal AirGroundState 1 && CurrAction <= 9
    Button X
  endif

  if targetYDistance > 26 && Equal CurrSubaction JumpSquat
    Button X
  endif

  if targetYDistance > 35 && targetYDistance < 55 && Equal AirGroundState 2 && YDistBackEdge > 20 && CanJump
    Button X
  endif
#endmacro

#macro RECORD_MOVE_CONNECTFRAME()
if Equal HitboxConnected 1 && OFramesHitstun > 0
  move_connectFrame = AnimFrame
endif
#endmacro

// dashdances between 0 and 5 times if the opponent is far away and
// the character isn't too close to the edge
#macro DASHDANCE(tempVar1, tempVar2)
  #let amount = {tempVar1}
  #let frameCount = {tempVar2}
  amount = (120 - LevelValue) / 100
  amount = (Rnd * 10) - 10 * amount
  frameCount = (Rnd * 15) + 3
  label _dashdance
  if Equal AirGroundState 1 && amount > 0 && Equal OFramesHitstun 0 && DistFrontEdge > 7 && !(ODistLE 4)
    if NumFrames >= frameCount && Equal CurrAction hex(0x03)
      SetFrame 0
      amount = amount - 1
      Stick (-1)
      frameCount = (Rnd * 15) + 3
    else
      Stick 1
      if !(CurrAction < hex(0x01)) && !(Equal CurrAction hex(0x07))
        ClearStick
      endif
    endif
  endif
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