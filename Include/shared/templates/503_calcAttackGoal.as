#include <Definition_AIMain.h>
id 0x8503
unk 0x0

str "*"
str "SELECT MOVE"
str "move"
str "priority"

predictOOption immediateTempVar man_OBaitDirection LevelValue 
anotherTempVar = 0
if OCurrAction >= hex(0x42) && OCurrAction <= hex(0x64)
  anotherTempVar = 1
endif
if !(Equal immediateTempVar op_baitdir_overshoot) && !(CalledAs FastAerial) && Equal currGoal cg_attack && OFramesHitstun <= 0 && Equal anotherTempVar 0
  predictOOption immediateTempVar man_ODefendOption LevelValue 
  predictionConfidence globTempVar man_ODefendOption LevelValue
  globTempVar *= 2
  if !(Equal immediateTempVar op_defend_shield) && Rnd < globTempVar && Rnd < calc(pt_wall_chance * 2)
    currGoal = cg_attack_wall
  endif
endif

if currGoal >= cg_attack && currGoal <= calc(cg_attack + 1)
elif Equal currGoal cg_camp_attack || Equal currGoal cg_bait_attack || Equal currGoal cg_bait_shield
elif !(Equal currGoal cg_attack_wall)
  currGoal = cg_attack
endif
if OFramesHitstun >= 1
  currGoal = cg_attack
endif

#const priority_kill = 1
#const priority_combo = 2
#const priority_juggle = 3
#const priority_techchase = 4
#const priority_pressure = 5
#const priority_breakCC = 6
#const priority_escapeCorner = 7
#const priority_launch = 8
#const priority_spacing = 9
#const priority_panic = 10
#const priority_bait = 11
#const priority_camp = 12

DynamicDiceClear

DynamicDiceAdd priority_kill
if ODamage >= 40
  DynamicDiceAdd priority_kill
  if ODamage >= 70
    DynamicDiceAdd priority_kill
    if ODamage >= 100
      DynamicDiceAdd priority_kill
      if ODamage >= 130
        DynamicDiceAdd priority_kill
      endif
    endif
  endif
endif
immediateTempVar = OTopNY - TopNY
if OCurrAction >= hex(0x1A) && OCurrAction <= hex(0x1D)
  DynamicDiceAdd priority_pressure
  DynamicDiceAdd priority_pressure
elif OFramesHitstun <= 0 && immediateTempVar < 30 && Equal HitboxConnected 0
  predictAverage immediateTempVar man_OXHitDist LevelValue
  immediateTempVar += 15
  if !(ODistLE immediateTempVar) && OYDistBackEdge > -35 
    DynamicDiceAdd priority_spacing
    DynamicDiceAdd priority_pressure
  endif

  if hex(0x11) <= OCurrAction && OCurrAction <= hex(0x15)
    DynamicDiceAdd priority_breakCC
    DynamicDiceAdd priority_breakCC
  endif
  GetYDistFloorOffset immediateTempVar 13 5 1
  GetYDistFloorOffset globTempVar (-13) 5 1
  if Equal immediateTempVar -1 || Equal globTempVar -1
    globTempVar = TopNX
    immediateTempVar = OTopNX
    Abs globTempVar
    Abs immediateTempVar
    if globTempVar > immediateTempVar
      DynamicDiceAdd priority_escapeCorner
    endif
  else 
    DynamicDiceAdd priority_launch
    DynamicDiceAdd priority_kill
    DynamicDiceAdd priority_combo
  endif
  DynamicDiceAdd priority_pressure
  DynamicDiceAdd priority_pressure
  DynamicDiceAdd priority_pressure
  DynamicDiceAdd priority_combo
  DynamicDiceAdd priority_juggle
else
  DynamicDiceAdd priority_combo
  DynamicDiceAdd priority_combo
  DynamicDiceAdd priority_juggle
  GetYDistFloorOffset immediateTempVar 40 5 1
  GetYDistFloorOffset globTempVar (-40) 5 1
  if Equal immediateTempVar -1 || Equal globTempVar -1
    DynamicDiceAdd priority_launch
    DynamicDiceAdd priority_kill
  endif
  if OYDistBackEdge < -calc(pt_djumpHeight * 1.5)
    DynamicDiceAdd priority_juggle
    DynamicDiceAdd priority_juggle
    DynamicDiceAdd priority_combo
    if OYDistBackEdge < -calc(pt_djumpHeight * 2)
      DynamicDiceAdd priority_juggle
    endif
  endif
  if OYDistBackEdge > -calc(pt_shortHopHeight + pt_djumpHeight / 2)
    DynamicDiceAdd priority_combo
    DynamicDiceAdd priority_juggle
    DynamicDiceAdd priority_juggle
    DynamicDiceAdd priority_launch
  elif Equal OIsOnStage 1 && ODamage >= 70
    GetAttribute globTempVar attr_fastFallSpeed 0
    if globTempVar > 2
      DynamicDiceAdd priority_combo
    endif
  endif
endif

if FramesHitstun > 0 || Equal CurrAction hex(0x49)
  predictAverage immediateTempVar man_OXHitDist LevelValue
  immediateTempVar += 10
  if Equal AirGroundState 2 && ODistLE immediateTempVar
    DynamicDiceClear
    DynamicDiceAdd priority_panic
  endif
elif CalledAs FastAerial
  DynamicDiceClear
  DynamicDiceAdd priority_panic
endif

#let priority = var7
DynamicDiceRoll priority

if Equal currGoal cg_attack_wall
  priority = priority_spacing 
elif Equal currGoal cg_bait_attack
  if Rnd < pt_braveChance && Rnd < pt_aggression && Rnd < 0.5
    priority = priority_pressure
  else
    priority = priority_bait
  endif
elif Equal currGoal cg_camp_attack
  priority = priority_camp
endif
DynamicDiceClear

#let move_currKnockback = var0
#let result = var1
#let hitFrame = var2
#let dirX = var3
#let dirY = var4
#let targetX = var5
#let targetY = var6
#let duration = var8

if YDistBackEdge < -45
  Goto gen_aerial_checks
elif OYDistBackEdge < -35 && OCurrAction >= hex(0x42) && OCurrAction <= hex(0x64)
  Goto gen_aerial_checks
else
  Goto gen_checks
endif

if !(True)
  label gen_checks
  $generateChecks(check_hub)
  Return
endif

if !(True)
  label gen_aerial_checks
  $generateAerialChecks(check_hub)
  Return
endif

if Equal priority priority_kill
  {KILL_MOVES}
elif Equal priority priority_combo
  {COMBO_MOVES}
elif Equal priority priority_juggle
  {JUGGLE_MOVES}
elif Equal priority priority_techchase
  {TECHCHASE_MOVES}
elif Equal priority priority_pressure
  {PRESSURE_MOVES}
elif Equal priority priority_breakCC
  {BREAKCC_MOVES}
elif Equal priority priority_escapeCorner
  {ESCAPE_MOVES}
elif Equal priority priority_launch
  {LAUNCH_MOVES}
elif Equal priority priority_spacing
  {SPACING_MOVES}

  if Rnd < calc(pt_wall_chance * 1.5) && OYDistBackEdge > -30 && OFramesHitstun <= 0 && Equal HitboxConnected 0
    currGoal = cg_attack_wall
  endif
elif Equal priority priority_panic
  $generateAerialChecks(fastCheck)
  {PANIC_MOVES}
  LOGSTR str("PANIC")
elif Equal priority priority_bait
  {BAIT_MOVES}
  LOGSTR str("BAIT")
elif Equal priority priority_camp
  {CAMP_MOVES}
  LOGSTR str("CAMP")
endif

DynamicDiceRoll lastAttack

if Equal priority priority_camp && !(Equal lastAttack -1)
  Return
elif Equal priority priority_bait && !(Equal lastAttack -1)
  Return
elif Equal priority priority_panic && !(Equal lastAttack -1)
  skipMainInit = mainInitSkip
  currGoal = cg_attack_reversal
  CallI MainHub
endif

{ADDITIONAL_FILTERS}

predictionConfidence immediateTempVar man_OBaitOption LevelValue
predictOOption globTempVar man_OBaitOption LevelValue
anotherTempVar = 0
if OCurrAction >= hex(0x42) && OCurrAction <= hex(0x64)
  anotherTempVar = 1
endif
if Rnd < immediateTempVar && Equal globTempVar op_bait_move && Equal currGoal cg_attack && OYDistBackEdge > -20 && OFramesHitstun <= 0 && Equal HitboxConnected 0 && Equal anotherTempVar 0 
  predictOOption immediateTempVar man_OBaitDirection LevelValue 
  if Equal immediateTempVar op_baitdir_overshoot
    currGoal = cg_attack_overshoot
  elif Equal immediateTempVar op_baitdir_undershoot
    currGoal = cg_attack_undershoot
  endif
endif

immediateTempVar *= 2
$ifAerialAttack()
  // if OYDistBackEdge < calc(pt_djumpHeight * -2)
  //   lastAttack = -1
  // endif
elif YDistBackEdge < -45 || OYDistBackEdge < -20
  lastAttack = -1 
elif Rnd < immediateTempVar && Equal globTempVar op_bait_shield
  $ifLastAttack(uthrow)
  $elifLastAttack(bthrow)
  $elifLastAttack(fthrow)
  $elifLastAttack(dthrow)
  else
    lastAttack = -1
  endif
endif

if Rnd < pt_wall_chance && Equal currGoal cg_attack
  immediateTempVar = TopNX
  globTempVar = OTopNX
  Abs immediateTempVar
  Abs globTempVar

  if immediateTempVar < globTempVar && duration > 4
    currGoal = cg_attack_wall
  endif
endif

XGoto SetAttackGoal
XReciever
Return

$refreshMoves()
$generateAllMovesGotoKBONLY()
Return

label check_hub

  if Equal priority priority_kill
    Goto kill_check
    LOGSTR str("KILL")
  elif Equal priority priority_combo
    Goto combo_check
    LOGSTR str("COMBO")
  elif Equal priority priority_juggle
    Goto juggle_check
    LOGSTR str("JUGGLE")
  elif Equal priority priority_techchase
    Goto techchase_check
    LOGSTR str("TECHCHASE")
  elif Equal priority priority_pressure
    Goto pressure_check
    LOGSTR str("PRESSURE")
  elif Equal priority priority_breakCC
    Goto breakCC_check
    LOGSTR str("BREAKCC")
  elif Equal priority priority_escapeCorner
    Goto escapeCorner_check
    LOGSTR str("ESCAPE")
  elif Equal priority priority_launch
    Goto launch_check
    LOGSTR str("LAUNCH")
  elif Equal priority priority_spacing
    Goto space_check
    LOGSTR str("SPACE")
  elif Equal priority priority_panic
    Goto fastCheck
  elif Equal priority priority_bait
    Goto bait_check
  endif
Return
label kill_check
  if OFramesHitstun > 0
    anotherTempVar = hitFrame + OFramesHitstun
    EstOXCoord targetX anotherTempVar
    EstOYCoord targetY anotherTempVar
  else
    targetX = OTopNX
    targetY = OTopNY
  endif
  KILL_CHECK(result, move_currKnockback, move_angle, targetX, targetY)
  if Equal result 1
    DynamicDiceAdd lastAttack
    Goto fastCheck
    Goto dirCheck
  endif
Return
label combo_check
  if OFramesHitstun > 0
    anotherTempVar = hitFrame + OFramesHitstun
    EstOXCoord targetX anotherTempVar
    EstOYCoord targetY anotherTempVar
  else
    targetX = OTopNX
    targetY = OTopNY
  endif
  MOVE_KB_WITHIN(result, move_currKnockback, move_angle, 65, 0, 125, -185, 185)
  if Equal result 1
    DynamicDiceAdd lastAttack
    if move_angle < 180 && OYDistBackEdge > -15
      DynamicDiceAdd lastAttack
    endif
    Goto fastCheck
    Goto dirCheck
  elif move_angle > 240 && move_angle < 300 && OYDistBackEdge > -30
    DynamicDiceAdd lastAttack
    Goto dirCheck
  endif
Return
label juggle_check
  if OFramesHitstun > 0
    anotherTempVar = hitFrame + OFramesHitstun
    EstOXCoord targetX anotherTempVar
    EstOYCoord targetY anotherTempVar
  else
    targetX = OTopNX
    targetY = OTopNY
  endif
  if move_angle >= 50 && move_angle <= 130
    MOVE_KB_WITHIN(result, move_currKnockback, move_angle, 40, 0, 60, 35, 185)
    if Equal result 1
      DynamicDiceAdd lastAttack
      Goto fastCheck
      Goto dirCheck
    endif
  endif
Return
label techchase_check
  if move_angle >= 180 && move_angle <= 360
    Goto dirCheck
  endif
Return
label pressure_check
  $ifLastAttack(uthrow) && Equal OCurrAction hex(0x1B)
    DynamicDiceAdd lastAttack
  $elifLastAttack(bthrow) && Equal OCurrAction hex(0x1B)
    DynamicDiceAdd lastAttack
  $elifLastAttack(dthrow) && Equal OCurrAction hex(0x1B)
    DynamicDiceAdd lastAttack
  $elifLastAttack(fthrow) && Equal OCurrAction hex(0x1B)
    DynamicDiceAdd lastAttack
  elif hitFrame <= 12
    Goto dirCheck
  elif hitFrame <= 18 && duration >= 10
    Goto dirCheck
  elif move_angle > 180 && OYDistBackEdge > -30
    DynamicDiceAdd lastAttack
  endif
Return
label breakCC_check
  if move_currKnockback >= 90
    Goto fastCheck
    Goto dirCheck
  endif
Return
label space_check
  if hitFrame > 15 || move_currKnockback < 60
  elif move_IASA > 30
  elif duration < 6
  $elifLastAttack(uthrow)
  $elifLastAttack(fthrow)
  $elifLastAttack(bthrow)
  $elifLastAttack(dthrow)
  else
    Goto dirCheck
  endif
Return
label escapeCorner_check
  if hitFrame <= 10
    DynamicDiceAdd lastAttack
    Goto dirCheck
  endif
Return
label launch_check
  if OFramesHitstun > 0
    anotherTempVar = hitFrame + OFramesHitstun
    EstOXCoord targetX anotherTempVar
    EstOYCoord targetY anotherTempVar
  else
    targetX = OTopNX
    targetY = OTopNY
  endif
  if move_angle > 40 && move_angle < 140
    MOVE_KB_WITHIN(result, move_currKnockback, move_angle, 100, -150, 150, 50, 250)
    if Equal result 1
      DynamicDiceAdd lastAttack
      Goto fastCheck
      Goto dirCheck
    endif
  else
    MOVE_KB_WITHIN(result, move_currKnockback, move_angle, 100, -150, 150, -250, 10)
    if Equal result 1
      DynamicDiceAdd lastAttack
      Goto fastCheck
      Goto dirCheck
    endif
  endif
Return
label bait_check
  immediateTempVar = move_IASA - (hitFrame + duration)
  if immediateTempVar < 25 && hitFrame < 35
    DynamicDiceAdd lastAttack
    Goto dirCheck
  endif 
Return
label fastCheck
  if hitFrame <= 11
    DynamicDiceAdd lastAttack
  endif
  if hitFrame <= 18 && move_IASA <= 40
    if Rnd < 0.3
      DynamicDiceAdd lastAttack
    endif
  endif
Return
label dirCheck
  if Equal dirX 0 && Equal dirY 0
    DynamicDiceAdd lastAttack
  elif Equal dirX OPos && Equal Direction OPos
    if Equal dirY 0 
      DynamicDiceAdd lastAttack
    elif Equal dirY 1 && TopNY > OTopNX
      DynamicDiceAdd lastAttack
      DynamicDiceAdd lastAttack
    elif Equal dirY -1 && TopNY <= OTopNX
      DynamicDiceAdd lastAttack
      DynamicDiceAdd lastAttack
    endif 
  elif Equal dirY 1 && TopNY > OTopNX
    if Equal dirX 0
      DynamicDiceAdd lastAttack
    elif Equal dirX OPos && Equal Direction OPos
      DynamicDiceAdd lastAttack
    endif
  elif Equal dirY -1 && TopNY <= OTopNX
    if Equal dirX 0
      DynamicDiceAdd lastAttack
      DynamicDiceAdd lastAttack
    elif Equal dirX OPos && Equal Direction OPos
      DynamicDiceAdd lastAttack
      DynamicDiceAdd lastAttack
    endif
  endif
Return
Return