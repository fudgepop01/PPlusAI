#include <Definition_AIMain.h>
//TrueID=0x6030
id 0x6030

//Set Unknown
unk 0x0

//Strings



// sets up offsets to get to target position
if Equal movePart 0
  if CalledAs FTilt
    // LOGSTR str("ftilt")
    lastAttack = hex(0x6032)
    move_xOffset = ftilt_xOffset
    move_yOffset = ftilt_yOffset
    move_xRange = ftilt_xRange
    move_yRange = ftilt_yRange
    move_hitFrame = ftilt_hitFrame
  elif CalledAs UTilt
    // LOGSTR str("utilt")
    lastAttack = hex(0x6033)
    move_xOffset = utilt_xOffset
    move_yOffset = utilt_yOffset
    move_xRange = utilt_xRange
    move_yRange = utilt_yRange
    move_hitFrame = utilt_hitFrame
  elif CalledAs DTilt
    // LOGSTR str("dtilt")
    lastAttack = hex(0x6034)
    move_xOffset = dtilt_xOffset
    move_yOffset = dtilt_yOffset
    move_xRange = dtilt_xRange
    move_yRange = dtilt_yRange
    move_hitFrame = dtilt_hitFrame
  elif CalledAs FSmash
    // LOGSTR str("fsmash")
    lastAttack = hex(0x6035)
    move_xOffset = fsmash_xOffset
    move_yOffset = fsmash_yOffset
    move_xRange = fsmash_xRange
    move_yRange = fsmash_yRange
    move_hitFrame = fsmash_hitFrame
  elif CalledAs USmash
    // LOGSTR str("usmash")
    lastAttack = hex(0x6036)
    move_xOffset = usmash_xOffset
    move_yOffset = usmash_yOffset
    move_xRange = usmash_xRange
    move_yRange = usmash_yRange
    move_hitFrame = usmash_hitFrame
  else
    Call AIHub
  endif
  if Equal approachType at_defend && OFramesHitstun < 1
    Call DefendHub
  else
    Call ApproachHub
  endif
else
  ClearStick
  // move_IASA = nair_IASA
  if CalledAs FTilt
    move_IASA = ftilt_IASA
    Stick (0.5) 0
  elif CalledAs UTilt
    move_IASA = utilt_IASA
    Stick 0 0.7
  elif CalledAs DTilt
    move_IASA = dtilt_IASA
    Stick 0 (-0.7)
  elif CalledAs FSmash
    move_IASA = fsmash_IASA
    Stick 1 0
  elif CalledAs USmash
    move_IASA = usmash_IASA
    Stick 0 1
  endif
  Button A
  SetFrame 0
  Seek ExecuteAttack
endif
Return

label ExecuteAttack
if FrameGE 1
  RECORD_MOVE_CONNECTFRAME

  if FrameGE move_IASA || CurrAction <= hex(0x09) || !(Equal AirGroundState 1)
    Call AIHub
  endif
endif
Return
Return