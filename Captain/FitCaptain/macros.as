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
#macro CALC_TARGET_DISTANCES
  DrawDebugPoint TopNX TopNY color(0xFF000055)

  #let targetX = var5
  #let targetY = var6

  if Equal CurrAction hex(0x07)
    targetX = OTopNX + (move_xOffset * Direction)
  else
    targetX = OTopNX + (move_xOffset * Direction * -1)
  endif
  targetY = OTopNY + move_yOffset
  // account for target's & own velocity
  targetX = targetX + (OXSpeed * 10) - (XSpeed * move_hitFrame / 2)
  if YSpeed < 0.20 && YDistFloor > 10 && TopNY > OTopNY
    targetY = targetY + (OYSpeed * (move_hitFrame + 3) / 2) - ((YSpeed - 1) * (move_hitFrame + 3) / 2) + OHurtboxSize + 3
  elif YDistFloor > 10
    targetY = targetY + (OYSpeed * move_hitFrame / 2) - ((YSpeed - 0.5) * move_hitFrame / 2)
  else
    targetY = targetY + (OYSpeed * move_hitFrame / 2) - (YSpeed * move_hitFrame / 2)
  endif
  if Equal PlayerNum 0
    DrawDebugRectOutline targetX targetY move_xRange move_yRange color(0xFF000055)
  elif Equal PlayerNum 1
    DrawDebugRectOutline targetX targetY move_xRange move_yRange color(0x0000FF55)
  elif Equal PlayerNum 2
    DrawDebugRectOutline targetX targetY move_xRange move_yRange color(0xFFFF0055)
  elif Equal PlayerNum 3
    DrawDebugRectOutline targetX targetY move_xRange move_yRange color(0x00FF0055)
  else
    DrawDebugRectOutline targetX targetY move_xRange move_yRange color(0x00000055)
  endif
  DrawDebugPoint targetX targetY color(0xFF000055)

  #let targetXDistance = var5
  #let targetYDistance = var6
  targetXDistance = targetX - TopNX
  targetYDistance = targetY - TopNY
#endmacro

// to make AIs less accurate with their moves the lower their level gets
#macro MESS_MOVE_PARAMS
  #let adjustment = var5

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

#macro DEFENSIVE_REACTION_TIME
  #let delay = var0
  #let tActionFreq = var1
  tActionFreq = OCurrActionFreq
  if tActionFreq >= 5
      delay = 0
  elif tActionFreq >= 4
      delay = 5
  elif tActionFreq >= 3
      delay = 10
  elif tActionFreq >= 2
      delay = 15
  else
      delay = 25
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
#macro JUMP_IF_IN_RANGES
  #let targetYDistance = var6
  LOGVAL targetYDistance
  if MeteoChance && targetYDistance > 10 && targetYDistance < 45 && Equal IsOnStage 0 && YSpeed < 0.01
    Button X
  endif

  if targetYDistance > 10 && Equal AirGroundState 1 && CurrAction <= 9
    Button X
  endif

  if targetYDistance > 22 && Equal CurrSubaction JumpSquat
    Button X
  endif

  if targetYDistance > 35 && targetYDistance < 55 && Equal AirGroundState 2 && YDistFloor > 20 && CanJump
    Button X
  endif
#endmacro

#macro RECORD_MOVE_CONNECTFRAME
if Equal HitboxConnected 1 && OFramesHitstun > 0
  move_connectFrame = AnimFrame
endif
#endmacro

// dashdances between 0 and 5 times if the opponent is far away and
// the character isn't too close to the edge
#macro DASHDANCE
  #let amount = var0
  #let frameCount = var1
  amount = (Rnd * 15) - 10
  frameCount = (Rnd * 15) + 3
  label _dashdance
  if Equal AirGroundState 1 && amount > 0 && Equal OFramesHitstun 0 && DistFrontEdge > 7 && !(ODistLE 4)
    if AnimFrame >= frameCount && Equal CurrAction hex(0x03)
      amount = amount - 1
      Stick (-1)
    else
      Stick 1
      if !(CurrAction <= hex(0x01)) && !(Equal CurrAction hex(0x07))
        ClearStick
      endif
    endif
    Return
  endif
  label _dashdanceEnd
#endmacro

// checks to see if the target is performing or is in a state that can perform a roll
// if they're early into this state, the isEarlyRoll flag will be set
#macro IS_EARLY_ROLL
  #let isEarlyRoll = var5
  isEarlyRoll = 0
  if Equal var6 hex(0x60) || Equal var6 hex(0x51)
    if OAnimFrame < 15
      isEarlyRoll = 1
    endif
  endif
  if Equal var6 hex(0x1E) || Equal var6 hex(0x1F) || Equal var6 hex(0x20) || Equal var6 hex(0x4E) || Equal var6 hex(0x50) || Equal var6 hex(0x52) || Equal var6 hex(0x53) || Equal var6 hex(0x61)
    if OAnimFrame < techRollVulFrame
      isEarlyRoll = 1
    endif
  endif
#endmacro

// this really long if statement might be used in multiple places so I made it a macro
// the coder (you) are expected to write what you need and close this off yourself
#macro IF_O_IS_TECHING
  #let OCA = var5
  OCA = OCurrAction
  if Equal OCA hex(0x4E) || Equal OCA hex(0x50) || Equal OCA hex(0x52) || Equal OCA hex(0x60) || Equal OCA hex(0x61)
#endmacro

// gets the weight and gravity of each character.
// yes I hardcoded these myself.
// no I didn't have anything better to do for the hour I did this lmao
#macro GET_WEIGHT_TABLE
if OIsCharOf Bowser
  oWeight = 113
  oGravity = 0.13
elif OIsCharOf Falcon
  oWeight = 104
  oGravity = 0.13
elif OIsCharOf Lizardon // Charizard
  oWeight = 106
  oGravity = 0.105
elif OIsCharOf Diddy
  oWeight = 85
  oGravity = 0.12
elif OIsCharOf Donkey
  oWeight = 109
  oGravity = 0.1
elif OIsCharOf Falco
  oWeight = 80
  oGravity = 0.17
elif OIsCharOf Fox
  oWeight = 75
  oGravity = 0.23
elif OIsCharOf Gamewatch
  oWeight = 75
  oGravity = 0.095
elif OIsCharOf Ganondorf
  oWeight = 109
  oGravity = 0.13
// GIGA BOWSER WOULD GO HERE
// elif OIsCharOf Bowser
//   oWeight = 113
//   oGravity = 0.13
elif OIsCharOf Nana || OIsCharOf Popo
  oWeight = 88
  oGravity = 0.1
elif OIsCharOf Ike
  oWeight = 100
  oGravity = 0.103
elif OIsCharOf Fushigisou // Ivysaur
  oWeight = 85
  oGravity = 0.075
elif OIsCharOf Purin // Jigglypuff
  oWeight = 62
  oGravity = 0.064
elif OIsCharOf DDD // King Dedede
  oWeight = 107
  oGravity = 0.095
elif OIsCharOf Kirby
  oWeight = 74
  oGravity = 0.08
elif OIsCharOf Knuckles
  oWeight = 90
  oGravity = 0.14
elif OIsCharOf Link
  oWeight = 104
  oGravity = 0.11
elif OIsCharOf Lucario
  oWeight = 94
  oGravity = 0.125
elif OIsCharOf Lucas
  oWeight = 80
  oGravity = 0.125
elif OIsCharOf Luigi
  oWeight = 100
  oGravity = 0.069 // nice
elif OIsCharOf Mario
  oWeight = 100
  oGravity = 0.095
elif OIsCharOf Marth
  oWeight = 87
  oGravity = 0.085
elif OIsCharOf Metaknight
  oWeight = 79
  oGravity = 0.11
elif OIsCharOf Mewtwo
  oWeight = 90
  oGravity = 0.082
elif OIsCharOf Ness
  oWeight = 94
  oGravity = 0.09
elif OIsCharOf Pikmin // Olimar
  oWeight = 90
  oGravity = 0.09
elif OIsCharOf Peach
  oWeight = 90
  oGravity = 0.08
elif OIsCharOf Pikachu
  oWeight = 80
  oGravity = 0.11
elif OIsCharOf Pit
  oWeight = 80
  oGravity = 0.095
elif OIsCharOf Robot // ROB
  oWeight = 104
  oGravity = 0.09
elif OIsCharOf Roy
  oWeight = 85
  oGravity = 0.114
elif OIsCharOf Samus
  oWeight = 110
  oGravity = 0.66
elif OIsCharOf Sheik
  oWeight = 90
  oGravity = 0.12
elif OIsCharOf Snake
  oWeight = 105
  oGravity = 0.098
elif OIsCharOf Sonic
  oWeight = 82
  oGravity = 0.122
elif OIsCharOf Zenigame // Squirtle
  oWeight = 85
  oGravity = 0.126
elif OIsCharOf Toonlink
  oWeight = 85
  oGravity = 0.11
elif OIsCharOf Wario
  oWeight = 102
  oGravity = 0.112
// WARIO MAN GOES HERE
// elif OIsCharOf Bowser
//   oWeight = 113
//   oGravity = 0.13
elif OIsCharOf Wolf
  oWeight = 85
  oGravity = 0.16
elif OIsCharOf Yoshi
  oWeight = 108
  oGravity = 0.093
elif OIsCharOf Zelda
  oWeight = 90
  oGravity = 0.073
elif OIsCharOf ZSS // Zero Suit Samus
  oWeight = 85
  oGravity = 0.135
endif
#endmacro