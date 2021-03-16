#include <Definition_AIMain.h>
//TrueID=0x6030
id 0x6030

//Set Unknown
unk 0x0

//Strings



// sets up offsets to get to target position
if Equal movePart 0
  if CalledAs Jab123
    $generateDefinedVariants(Jab123)
  elif CalledAs FTilt
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
elif True
  if !(Equal AirGroundState 1)
    Call AIHub
  endif
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
CALC_TARGET_DISTANCES(var5, var6, var8, var0, var1, move_hitFrame - NumFrames, _oCalc, _sCalc)

RECORD_HIT_KNOCKBACK

if FrameGE move_IASA || CurrAction <= hex(0x09) || !(Equal AirGroundState 1)
  Call AIHub
endif
Return
Return