#include <Definition_AIMain.h>
//TrueID=0x603A
id 0x603A

//Set Unknown
unk 0x0


lastAttack = hex(0x603A)
move_xOffset = uspecial_xOffset
move_yOffset = uspecial_yOffset
move_xRange = uspecial_xRange
move_yRange = uspecial_yRange
move_hitFrame = uspecial_hitFrame
move_lastHitFrame = uspecial_lastHitFrame
move_IASA = uspecial_IASA

Button B
Stick 0 0.7
SetFrame 0
hit_knockback = -1
Seek ExecuteAttack
Return

label ExecuteAttack
var1 = 0
#let targetXDistance = var5
#let targetYDistance = var6
#let targetOverallDist = var7
CALC_TARGET_DISTANCES(targetXDistance, targetYDistance, var0, var1, 4, _oCalc, _sCalc)

Norm targetOverallDist targetXDistance targetYDistance
targetXDistance /= targetOverallDist
targetYDistance /= targetOverallDist
AbsStick targetXDistance targetYDistance

RECORD_HIT_KNOCKBACK

if Equal HitboxConnected 1 || Equal NumFrames 38
  label
  Button A
  if Equal CurrSubaction hex(0x1E)
    SetFrame 0
    Seek CancelAttack
  endif
  Return
endif

if CurrAction <= hex(0x09) || Equal HitboxConnected 1
  Call AIHub
endif
Return

label CancelAttack
  if FrameGE 10
    isImmediateCombo = immediate
    Call ComboHub
  endif
Return
Return