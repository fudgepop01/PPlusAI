// COMBO HUB
// a place for determining the next best attack when an opponent is in hitstun
#include <Definition_AIMain.h>
id 0x8002

unk 0x0

// each lastAttack corresponds to a move routine... so like 6031 means jab
// was the last move used...
$clearMovesUsed()

ClearStick
lastScript = hex(0x8002)

#let ODmgXWeight = var8
#let comboLeniency = var7

GET_WEIGHT_TABLE(var8, var0)

ODmgXWeight = ODmgXWeight - 200
ODmgXWeight *= -1
ODmgXWeight /= 100
ODmgXWeight *= ODamage

if Equal movePart mp_ATK
  Seek contCombo
  Jump
endif
movePart = 0
approachType = 0

#let OYDistSelf = var1
OYDistSelf = OTopNY - TopNY

{DEBUG_START}

if Equal hit_knockback -1
  hit_knockback = hex(0xFFFF)
endif

LOGSTR str("START")

{MOVE_SPECIFIC_COMBOS}

LOGSTR str("AFT_MSC")

if OYDistBackEdge > -5 && Equal OCurrAction hex(0x49) && Rnd < 0.3 && !(Equal OXDistFrontEdge OXDistBackEdge) && Equal OIsOnStage 1
  LOGSTR str("TCW")
  Seek techChase_wait
  Jump
endif
LOGSTR str("CONT.")
Seek contCombo
Jump
Return

label techChase_wait
TECHCHASE_SITUATION(var0, var1, var2, var3, var4, var5, Rnd * 60, _AIHub, contCombo)

label _AIHub
Call AIHub

label contCombo

#let OYDistSelf = var3
OYDistSelf = OTopNY - TopNY

#let testLimit = var6
#let nearCliffX = var0
GetNearestCliff nearCliffX
nearCliffX = TopNX - nearCliffX
nearCliffX *= -1
#let action = var1
action = 0

globTempVar = OTopNX - (TopNX + nearCliffX) 
Abs nearCliffX
Abs globTempVar

Goto clear
if globTempVar < nearCliffX && OYDistSelf < 70 && globTempVar < 20
  testLimit = 10
  LOGSTR str("edgeguard")
  label edgeguard
  approachType = at_edgeguard
  {EDGEGUARD_OPTIONS}
  Seek edgeguard
elif Equal OIsOnStage 1 && OYDistSelf < 80
  if Equal LevelValue LV9 
    testLimit = 50
  else
    testLimit = 40
  endif
  LOGSTR str("combo")
  label combo
  action = 1
  Seek killOptions
  Jump 
  label kill_end
  if testLimit < 20
    Goto analyze
    Goto clear
    Seek comboOptions
    Jump
    label combo_end
  endif
  Seek combo
elif True
  if Equal LevelValue LV9 
    testLimit = 50
  else
    testLimit = 40
  endif
  LOGSTR str("juggle")
  label juggle
  action = 2
  Seek killOptions
  Jump 
  label kill_high_end
  if testLimit < 25
    Goto analyze
    Goto clear
    Seek juggleOptions
    Jump
    label juggle_end
  endif
  Seek juggle
endif
Goto analyze
testLimit -= 1
if testLimit <= 0
  Seek NCombo
endif
comboLeniency = 2
LOGSTR str("=====")
Goto clear
Jump
Return

label NCombo
if Equal movePart mp_ATK 
  noCombo = noComboVal
  LOGSTR str("no combo")
  Call AIHub
else
  Goto TBD
  LOGSTR str("TBD")
  Call ApproachHub
endif
Return

label comboOptions
LOGVAL var8
{COMBO_OPTIONS}
Seek combo_end
Jump
Return

label juggleOptions
LOGVAL var8
{JUGGLE_OPTIONS}
Seek juggle_end
Jump
Return

label killOptions
{KILL_OPTIONS}
if Equal action 1 
  Seek kill_end
elif Equal action 2
  Seek kill_high_end
else
  Seek NCombo
endif
Jump
Return

$generateMovesUsed()

label clear
move_xRange = 0
move_yRange = 0
move_hitFrame = -1
Return

label TBD
LOAD_MOVE_DATA(valGeneral, gen)
Return

label analyze

globTempVar = OFramesHitstun + comboLeniency
if globTempVar < move_hitFrame || Equal move_hitFrame -1
  comboLeniency = 0
  Return
endif

if lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F)
  if !(InAir)
    move_hitFrame += jumpSquatFrames
  endif
elif lastAttack <= valDSmash || Equal lastAttack valGrab || Equal lastAttack valDA
  if OYDistSelf > 20
    comboLeniency = 0
    Return
  endif
endif

#let targetXDistance = var0
#let targetYDistance = var1
var4 = 0

#let frameToCalc = var5
frameToCalc = move_hitFrame
{CTD}

frameToCalc = move_lastHitFrame
{CTD}

if !(Equal movePart mp_ATK)
  comboLeniency = 0
  Return
endif

frameToCalc = OFramesHitstun
{CTD}

comboLeniency = 0
Return

label callMove

if Equal CurrAction hex(0x18)
  Return
endif

if Equal movePart mp_ATK
  movePart = 0
endif
if Equal approachType 0 
  approachType = at_combo
endif
if Equal lastAttack valJab123
  Call Jab123
elif Equal lastAttack valDA
  Call DashAttack
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
elif Equal lastAttack valNSpecial
  Call NSpecial
elif Equal lastAttack valSSpecial
  Call SSpecial
elif Equal lastAttack valUSpecial
  Call USpecial
elif Equal lastAttack valDSpecial
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
elif Equal lastAttack valNSpecialAir
  Call NSpecialAir
elif Equal lastAttack valSSpecialAir
  Call SSpecialAir
elif Equal lastAttack valUSpecialAir
  Call USpecialAir
elif Equal lastAttack valDSpecialAir
  Call DSpecialAir
endif

Return
Return