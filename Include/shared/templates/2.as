// COMBO HUB
// a place for determining the next best attack when an opponent is in hitstun
#include <Definition_AIMain.h>
id 0x8002

unk 0x0

// each lastAttack corresponds to a move routine... so like 6031 means jab
// was the last move used...

ClearStick
movePart = 0

lastScript = hex(0x8002)

#let OYDistSelf = var1
OYDistSelf = OTopNY - TopNY

{DEBUG_START}

#let ODmgXWeight = var8
#let comboLeniency = var7

GET_WEIGHT_TABLE(var8, var0)

ODmgXWeight /= 100
ODmgXWeight *= ODamage

if Equal hit_knockback -1
  hit_knockback = hex(0xFFFF)
endif

{MOVE_SPECIFIC_COMBOS}

if OYDistBackEdge > -5 && Equal OCurrAction hex(0x49) && Rnd < 0.7
  Seek techChase_wait
  Jump
endif
Seek contCombo
Jump
Return

label techChase_wait
TECHCHASE_SITUATION(var0, var1, var2, var3, var4, var5, Rnd * 100, _AIHub, contCombo)

label _AIHub
Call AIHub

label contCombo

#let testLimit = var6
#let nearCliffX = var0
GetNearestCliff nearCliffX
nearCliffX = TopNX - nearCliffX
nearCliffX *= -1

globTempVar = OTopNX - (TopNX + nearCliffX) 
Abs nearCliffX
Abs globTempVar

if globTempVar < nearCliffX && OYDistBackEdge > -60 && globTempVar < 20
  testLimit = 10
  label edgeguard
  {EDGEGUARD_OPTIONS}
  Seek edgeguard
elif Equal OIsOnStage 1 && OYDistBackEdge > -90
  if ODmgXWeight < killComboThreshold
    testLimit = 10
    label combo
    {COMBO_OPTIONS}
    Seek combo
  else
    testLimit = 10
    label kill
    {KILL_OPTIONS}
    Seek kill
  endif
else
  testLimit = 10
  label juggle
  {JUGGLE_OPTIONS}
  Seek juggle
endif
Goto analyze
testLimit -= 1
if testLimit <= 0
  Seek NCombo
  Jump
endif
Jump
Return

label NCombo

noCombo = noComboVal
Call AIHub
Return

label jab123
LOAD_MOVE_DATA(valJab123, jab123)
Return

label ftilt
LOAD_MOVE_DATA(valFTilt, ftilt)
Return

label utilt
LOAD_MOVE_DATA(valUTilt, utilt)
Return

label dtilt
LOAD_MOVE_DATA(valDTilt, dtilt)
Return

label fsmash
LOAD_MOVE_DATA(valFSmash, fsmash)
Return

label usmash
LOAD_MOVE_DATA(valUSmash, usmash)
Return

label dsmash
LOAD_MOVE_DATA(valDSmash, dsmash)
Return

label nspecial
LOAD_MOVE_DATA(valNSp, nspecial)
Return

label sspecial
LOAD_MOVE_DATA(valSSp, sspecial)
Return

label uspecial
LOAD_MOVE_DATA(valUSp, uspecial)
Return

label dspecial
LOAD_MOVE_DATA(valDSp, dspecial)
Return

label grab
LOAD_MOVE_DATA(valGrab, grab)
Return

label nair
LOAD_MOVE_DATA(valNAir, nair)
Return

label fair
LOAD_MOVE_DATA(valFAir, fair)
Return

label bair
LOAD_MOVE_DATA(valBAir, bair)
Return

label uair
LOAD_MOVE_DATA(valUAir, uair)
Return

label dair
LOAD_MOVE_DATA(valDAir, dair)
Return

label analyze

globTempVar = OFramesHitstun + comboLeniency
if globTempVar < move_hitFrame
  comboLeniency = 0
  Return
endif

if lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F)
  if !(InAir)
    move_hitFrame += jumpSquatFrames
  endif
endif

#let targetXDistance = var0
#let targetYDistance = var1
var3 = 0
CALC_TARGET_DISTANCES(var0, var1, var2, var3, move_hitFrame, _dummy, _dummy)

move_xRange *= 2
move_yRange *= 2
Abs targetXDistance
Abs targetYDistance

move_xRange = move_xRange + move_hitFrame * dashRunTermVel
if lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F)
  move_yRange += 40
endif

if targetXDistance <= move_xRange && targetYDistance <= move_yRange
  Seek callMove
  Jump
endif

CALC_TARGET_DISTANCES(var0, var1, var2, var3, OFramesHitstun, _dummy, _dummy)

move_xRange *= 2
move_yRange *= 2
Abs targetXDistance
Abs targetYDistance

move_xRange = move_xRange + move_hitFrame * dashRunTermVel / 2
if lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F)
  move_yRange += 10
endif

if targetXDistance <= move_xRange && targetYDistance <= move_yRange
  Seek callMove
  Jump
endif
comboLeniency = 0
Return

label callMove

movePart = 0
if Equal lastAttack valJab123
  Call Jab123
elif Equal lastAttack valFTilt
  Call FTilt
elif Equal lastAttack valUTilt
  Call UTilt
elif Equal lastAttack valDTilt
  Call DTilt
elif Equal lastAttack valFSmash
  Call FSmash
elif Equal lastAttack valUSmash
  Call USmash
elif Equal lastAttack valDSmash
  Call DSmash
elif Equal lastAttack valNSp
  Call NSpecial
elif Equal lastAttack valSSp
  Call SSpecial
elif Equal lastAttack valUSp
  Call USpecial
elif Equal lastAttack valDSp
  Call DSpecial
elif Equal lastAttack valGrab
  Call Grab
elif Equal lastAttack valNAir
  Call NAir
elif Equal lastAttack valFAir
  Call FAir
elif Equal lastAttack valBAir
  Call BAir
elif Equal lastAttack valUAir
  Call UAir
elif Equal lastAttack valDAir
  Call DAir
elif Equal lastAttack valNSpAir
  Call NSpecialAir
elif Equal lastAttack valSSpAir
  Call SSpecialAir
elif Equal lastAttack valUSpAir
  Call USpecialAir
elif Equal lastAttack valDSpAir
  Call DSpecialAir
endif

Return
Return