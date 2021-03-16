#include <Definition_AIMain.h>
//TrueID=0x6030
id 0x6030

//Set Unknown
unk 0x0

//Strings



// sets up offsets to get to target position
if Equal movePart 0
  if CalledAs Jab123
    lastAttack = hex(0x6031)
    move_xOffset = jab123_xOffset
    move_yOffset = jab123_yOffset
    move_xRange = jab123_xRange
    move_yRange = jab123_yRange
    move_hitFrame = jab123_hitFrame
    move_lastHitFrame = jab123_lastHitFrame
    move_IASA = jab123_IASA
  elif CalledAs FTilt
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
  elif CalledAs DSmash
    // LOGSTR str("usmash")
    lastAttack = hex(0x6037)
    move_xOffset = dsmash_xOffset
    move_yOffset = dsmash_yOffset
    move_xRange = dsmash_xRange
    move_yRange = dsmash_yRange
    move_hitFrame = dsmash_hitFrame
    move_lastHitFrame = dsmash_lastHitFrame
    move_IASA = dsmash_IASA
  elif CalledAs NSpecial
    // LOGSTR str("usmash")
    lastAttack = hex(0x6038)
    move_xOffset = nspecial_xOffset
    move_yOffset = nspecial_yOffset
    move_xRange = nspecial_xRange
    move_yRange = nspecial_yRange
    move_hitFrame = nspecial_hitFrame
    move_lastHitFrame = nspecial_lastHitFrame
    move_IASA = nspecial_IASA
  elif CalledAs SSpecial
    // LOGSTR str("usmash")
    lastAttack = hex(0x6039)
    move_xOffset = sspecial_xOffset
    move_yOffset = sspecial_yOffset
    move_xRange = sspecial_xRange
    move_yRange = sspecial_yRange
    move_hitFrame = sspecial_hitFrame
    move_lastHitFrame = sspecial_lastHitFrame
    move_IASA = sspecial_IASA
  elif CalledAs USpecial
    // LOGSTR str("usmash")
    lastAttack = hex(0x603A)
    move_xOffset = uspecial_xOffset
    move_yOffset = uspecial_yOffset
    move_xRange = uspecial_xRange
    move_yRange = uspecial_yRange
    move_hitFrame = uspecial_hitFrame
    move_lastHitFrame = uspecial_lastHitFrame
    move_IASA = uspecial_IASA
  elif CalledAs DSpecial
    // LOGSTR str("usmash")
    lastAttack = hex(0x603B)
    move_xOffset = dspecial_xOffset
    move_yOffset = dspecial_yOffset
    move_xRange = dspecial_xRange
    move_yRange = dspecial_yRange
    move_hitFrame = dspecial_hitFrame
    move_lastHitFrame = dspecial_lastHitFrame
    move_IASA = dspecial_IASA
  elif CalledAs Grab
    // LOGSTR str("usmash")
    lastAttack = hex(0x603C)
    move_xOffset = grab_xOffset
    move_yOffset = grab_yOffset
    move_xRange = grab_xRange
    move_yRange = grab_yRange
    move_hitFrame = grab_hitFrame
    move_lastHitFrame = grab_lastHitFrame
    move_IASA = grab_IASA
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
  if CalledAs Jab123
    move_IASA = jab123_IASA
    Button A
  elif CalledAs FTilt
    move_IASA = ftilt_IASA
    Stick (0.5) 0
    Button A
  elif CalledAs UTilt
    move_IASA = utilt_IASA
    Stick 0 0.7
    Button A
  elif CalledAs DTilt
    move_IASA = dtilt_IASA
    Stick 0 (-0.7)
    Button A
  elif CalledAs FSmash
    move_IASA = fsmash_IASA
    Stick 1 0
    Button A
  elif CalledAs USmash
    move_IASA = usmash_IASA
    Stick 0 1
    Button A
  elif CalledAs DSmash
    move_IASA = dsmash_IASA
    Stick 0 (-1)
    Button A
  elif CalledAs NSpecial
    move_IASA = nspecial_IASA
    Button B
  elif CalledAs SSpecial
    move_IASA = sspecial_IASA
    Stick 1 0
    Button B
  elif CalledAs USpecial
    move_IASA = uspecial_IASA
    Stick 0 1
    Button B
  elif CalledAs DSpecial
    move_IASA = dspecial_IASA
    Stick 0 (-1)
    Button B
  elif CalledAs Grab
    move_IASA = grab_IASA
    Button R|A
  endif
  SetFrame 0
  hit_knockback = -1
  Seek ExecuteAttack
endif
Return

label ExecuteAttack
var1 = 0
CALC_TARGET_DISTANCES(var5, var6, var0, var1, move_hitFrame - NumFrames, _oCalc, _sCalc)

RECORD_HIT_KNOCKBACK

if CalledAs USmash
  AbsStick OPos
  if Equal NumFrames 5 && Equal moveVariant mv_usmash_cancel
    movePart = 1
    moveVariant = mv_ASC
    Button B
    Call NSpecial
  endif 
endif

if FrameGE move_IASA || CurrAction <= hex(0x09) || !(Equal AirGroundState 1) || Equal HitboxConnected 1
  Call AIHub
endif
Return
Return