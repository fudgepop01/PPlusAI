#include <Definition_AIMain.h>
//TrueID=0x6039
id 0x6039

//Set Unknown
unk 0x0

if Equal movePart 0
  $generateDefinedVariants(SSpecial)
  Call ApproachHub
else
  lastAttack = valSSpecial
  Button B
  Stick 1 0
  SetFrame 0
  hit_knockback = -1
  Seek ExecuteAttack
endif
Return

label ExecuteAttack
var1 = 0
CALC_TARGET_DISTANCES(var5, var6, var8, var0, var1, move_hitFrame - NumFrames, _oCalc, _sCalc)

RECORD_HIT_KNOCKBACK

if Equal moveVariant mv_sspecial_spike && Equal XDistBackEdge XDistFrontEdge && Equal NumFrames 20
  Button A
elif Equal moveVariant mv_sspecial_power && Equal NumFrames 20 
  Button A
endif

if NumFrames < 8
  AbsStick OPos
endif

if FrameGE move_IASA || CurrAction <= hex(0x09) || Equal HitboxConnected 1
  Call AIHub
endif
Seek ExecuteAttack
Return
Return