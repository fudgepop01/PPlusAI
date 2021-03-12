#include <Definition_AIMain.h>
//TrueID=0x6030
id 0x6030

//Set Unknown
unk 0x0

//Strings



// sets up offsets to get to target position
if Equal movePart 0
  if CalledAs FTilt
    $generateDefinedVariants(FTilt)
  elif CalledAs UTilt
    $generateDefinedVariants(UTilt)
  elif CalledAs DTilt
    $generateDefinedVariants(DTilt)
  elif CalledAs FSmash
    $generateDefinedVariants(FSmash)
  elif CalledAs USmash
    $generateDefinedVariants(USmash)
  elif CalledAs DSmash
    $generateDefinedVariants(DSmash)
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
  elif CalledAs DSmash
    move_IASA = dsmash_IASA
    Stick 0 (-1)
  endif
  Button A
  SetFrame 0
  hit_knockback = -1
  Seek ExecuteAttack
endif
Return

label ExecuteAttack
var1 = 0
CALC_TARGET_DISTANCES(var5, var6, var8, var0, var1, move_hitFrame - NumFrames, _oCalc, _sCalc)

RECORD_HIT_KNOCKBACK

if FrameGE move_IASA || CurrAction <= hex(0x09) || !(Equal AirGroundState 1)
  Call AIHub
endif
Return
Return