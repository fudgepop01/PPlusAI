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
    move_lastHitFrame = ftilt_lastHitFrame
    move_IASA = ftilt_IASA
  elif CalledAs UTilt
    // LOGSTR str("utilt")
    lastAttack = hex(0x6033)
    move_xOffset = utilt_xOffset
    move_yOffset = utilt_yOffset
    move_xRange = utilt_xRange
    move_yRange = utilt_yRange
    move_hitFrame = utilt_hitFrame
    move_lastHitFrame = utilt_lastHitFrame
    move_IASA = utilt_IASA
  elif CalledAs DTilt
    // LOGSTR str("dtilt")
    lastAttack = hex(0x6034)
    move_xOffset = dtilt_xOffset
    move_yOffset = dtilt_yOffset
    move_xRange = dtilt_xRange
    move_yRange = dtilt_yRange
    move_hitFrame = dtilt_hitFrame
    move_lastHitFrame = dtilt_lastHitFrame
    move_IASA = dtilt_IASA
  elif CalledAs FSmash
    // LOGSTR str("fsmash")
    lastAttack = hex(0x6035)
    move_xOffset = fsmash_xOffset
    move_yOffset = fsmash_yOffset
    move_xRange = fsmash_xRange
    move_yRange = fsmash_yRange
    move_hitFrame = fsmash_hitFrame
    move_lastHitFrame = fsmash_lastHitFrame
    move_IASA = fsmash_IASA
  elif CalledAs USmash
    // LOGSTR str("usmash")
    lastAttack = hex(0x6036)
    move_xOffset = usmash_xOffset
    move_yOffset = usmash_yOffset
    move_xRange = usmash_xRange
    move_yRange = usmash_yRange
    move_hitFrame = usmash_hitFrame
    move_lastHitFrame = usmash_lastHitFrame
    move_IASA = usmash_IASA
  else
    Call AIHub
  endif
 // SAFE_INJECT_4 move_xOffset
 // SAFE_INJECT_5 move_xRange
  if Equal approachType at_defend && OFramesHitstun < 1
    Call DefendHub
  else
    Call ApproachHub
  endif
else
  ClearStick
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
  hit_knockback = -1
  Seek ExecuteAttack
endif
Return

label ExecuteAttack
var1 = 0
CALC_TARGET_DISTANCES(var5, var6, var0, var1, move_hitFrame - NumFrames, _oCalc, _sCalc)

RECORD_HIT_KNOCKBACK

if FrameGE move_IASA || CurrAction <= hex(0x09) || !(Equal AirGroundState 1)
  Call AIHub
endif
Return
Return