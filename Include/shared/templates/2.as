// COMBO HUB
// a place for determining the next best attack when an opponent is in hitstun
#include <Definition_AIMain.h>
id 0x8002

unk 0x0

// each lastAttack corresponds to a move routine... so like 6031 means jab
// was the last move used...
$clearMovesUsed()

lastScript = hex(0x8002)

if Equal CurrAction hex(0x04) || Equal CurrAction hex(0x03)
  Stick 1
endif

#let ODmgXWeight = var4
// #let comboLeniency = var7

ODmgXWeight = OWeight

ODmgXWeight = ODmgXWeight - 200
ODmgXWeight *= -1
ODmgXWeight /= 100
ODmgXWeight *= ODamage

if Equal movePart mp_ATK || Equal approachType at_reroll
  Seek contCombo
  Jump
endif
movePart = 0
approachType = 0

#let OYDistSelf = var1
OYDistSelf = OTopNY - TopNY

{DEBUG_START}

LOGSTR str("START")

#let phase = var7
#let moveType = var21
#const mt_combo = 0
#const mt_juggle = 1
#const mt_kill = 2

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
TECHCHASE_SITUATION(var0, var1, var2, var3, var4, var5, Rnd * 50, _AIHub, contCombo)

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
#let phase = var7
#let moveType = var21
#const mt_combo = 0
#const mt_juggle = 1
#const mt_kill = 2
moveType = -1

globTempVar = OTopNX - (TopNX + nearCliffX) 
Abs nearCliffX
Abs globTempVar

phase = 1
Goto clear
if globTempVar < nearCliffX && OYDistSelf < 70 && globTempVar < 20 && Equal OXDistBackEdge OXDistFrontEdge
  testLimit = 10
  label edgeguard
  LOGSTR str("edgeguard")
  approachType = at_edgeguard
  {EDGEGUARD_OPTIONS}
  Seek edgeguard
elif Equal OIsOnStage 1 && OYDistSelf < 65 && Rnd < 0.8
  if Equal LevelValue LV9 
    testLimit = 15
  else
    testLimit = 10
  endif
  label combo
  if phase <= 3
    moveType = mt_kill
    Goto killOptions
  else 
    moveType = mt_combo
    Goto comboOptions
  endif
  Seek combo
elif True
  if Equal LevelValue LV9 
    testLimit = 15
  else
    testLimit = 10
  endif
  label juggle
  if phase <= 3
    moveType = mt_kill
    Goto killOptions
  else 
    moveType = mt_juggle
    Goto juggleOptions
  endif
  Seek juggle
endif
Goto analyze
testLimit -= 1
if testLimit <= 0
  if phase < 6
    phase += 1
    // LOGSTR str("=======")
    // LOGSTR str("PHASE UP:")
    // LOGVAL phase
    // LOGSTR str("=======")
    testLimit = 10
    Jump
    Return
  else
    Seek NCombo
  endif
endif
// comboLeniency = 8
// if Equal movePart mp_ATK
//   comboLeniency = 15
// endif
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
{COMBO_OPTIONS}
Return

label juggleOptions
{JUGGLE_OPTIONS}
Return

label killOptions
{KILL_OPTIONS}
Return

{MOVE_GENERATION}

label clear
move_xRange = 0
move_yRange = 0
move_hitFrame = -1
Return

label TBD
LOAD_MOVE_DATA(valGeneral, gen)
Return

label analyze

if Equal lastAttack valGeneral
  Return
elif valJab123 <= lastAttack && lastAttack <= valDashAttack && OYDistBackEdge < -40 && OTotalYSpeed > -0.2
  Return
endif

// globTempVar = OFramesHitstun + comboLeniency
// if globTempVar < move_hitFrame || Equal move_hitFrame -1
//   comboLeniency = 0
//   Return
// endif

if lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F)
  if !(InAir)
    move_hitFrame += jumpSquatFrames
    move_lastHitFrame += jumpSquatFrames
  endif
elif lastAttack <= valDSmash || Equal lastAttack valGrab || Equal lastAttack valDashAttack
  if OYDistSelf > 20
    // comboLeniency = 0
    Return
  endif
endif

#let slowest = var0
#let mid = var1
#let fastest = var2
#let temp = var0
temp = OFramesHitstun + 5
if temp < move_hitFrame
  fastest = temp
  mid = move_hitFrame
  slowest = move_lastHitFrame
elif temp < move_lastHitFrame
  fastest = move_hitFrame
  mid = temp
  slowest = move_lastHitFrame
else
  fastest = move_hitFrame
  mid = move_lastHitFrame
endif

#let frameToCalc = var5
if Equal phase 1 || Equal phase 4
  frameToCalc = fastest
elif Equal phase 2 || Equal phase 5
  frameToCalc = mid
elif Equal phase 3 || Equal phase 6
  frameToCalc = slowest
endif

frameToCalc += 3

#let targetXDistance = var0
#let targetYDistance = var1

Goto CTD

{EXTRA_ANALYSIS}

// comboLeniency = 0
Return

label CTD
{CTD}
Return

label callMove

lastScript = hex(0x8002)

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
elif Equal lastAttack valDashAttack
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