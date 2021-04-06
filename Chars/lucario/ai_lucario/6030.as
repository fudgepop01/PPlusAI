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
  elif CalledAs DashAttack
    $generateDefinedVariants(DashAttack)
  elif CalledAs FTilt
    // LOGSTR str("ftilt")
    $generateDefinedVariants(FTilt)
  elif CalledAs UTilt
    // LOGSTR str("utilt")
    $generateDefinedVariants(UTilt)
  elif CalledAs DTilt
    // LOGSTR str("dtilt")
    $generateDefinedVariants(DTilt)
  elif CalledAs FSmash
    // LOGSTR str("fsmash")
    $generateDefinedVariants(FSmash)
  elif CalledAs USmash
    // LOGSTR str("usmash")
    $generateDefinedVariants(USmash)
  elif CalledAs DSmash
    // LOGSTR str("usmash")
    $generateDefinedVariants(DSmash)
  elif CalledAs NSpecial
    // LOGSTR str("usmash")
    $generateDefinedVariants(NSpecial)
  elif CalledAs SSpecial
    // LOGSTR str("usmash")
    $generateDefinedVariants(SSpecial)
  elif CalledAs USpecial
    // LOGSTR str("usmash")
    $generateDefinedVariants(USpecial)
  elif CalledAs DSpecial
    // LOGSTR str("usmash")
    $generateDefinedVariants(DSpecial)
  elif CalledAs Grab
    // LOGSTR str("usmash")
    $generateDefinedVariants(Grab)
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
    lastAttack = valJab123
    Button A
  elif CalledAs FTilt
    move_IASA = ftilt_IASA
    lastAttack = valFTilt
    Stick (0.5) 0
    Button A
  elif CalledAs UTilt
    move_IASA = utilt_IASA
    lastAttack = valUTilt
    Stick 0 0.7
    Button A
  elif CalledAs DTilt
    move_IASA = dtilt_IASA
    lastAttack = valDTilt
    Stick 0 (-0.7)
    Button A
  elif CalledAs FSmash
    move_IASA = fsmash_IASA
    lastAttack = valFSmash
    Stick 1 0
    Button A
  elif CalledAs USmash
    move_IASA = usmash_IASA
    lastAttack = valUSmash
    Stick 0 1
    Button A
  elif CalledAs DSmash
    move_IASA = dsmash_IASA
    lastAttack = valDSmash
    Stick 0 (-1)
    Button A
  elif CalledAs NSpecial
    move_IASA = nspecial_IASA
    lastAttack = valNSpecial
    Button B
  elif CalledAs SSpecial
    move_IASA = sspecial_IASA
    lastAttack = valSSpecial
    Stick 1 0
    Button B
  elif CalledAs USpecial
    move_IASA = uspecial_IASA
    lastAttack = valUSpecial
    Stick 0 1
    Button B
  elif CalledAs DSpecial
    move_IASA = dspecial_IASA
    lastAttack = valDSpecial
    Stick 0 (-1)
    Button B
  elif CalledAs Grab
    move_IASA = grab_IASA
    lastAttack = valGrab
    Button R|A
  elif CalledAs DashAttack
    move_IASA = dashattack_IASA
    lastAttack = valDashAttack
    Button A
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

if CalledAs USmash
  AbsStick OPos
  if Equal NumFrames 4 && Equal moveVariant mv_usmash_cancel
    movePart = 1
    moveVariant = mv_ASC
    Button B
    Call NSpecial
  endif 
endif

if Equal HitboxConnected 1
  Call ComboHub
elif FrameGE move_IASA || CurrAction <= hex(0x09) || !(Equal AirGroundState 1)
  Call AIHub
endif
Return
Return