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
  if OCurrAction >= hex(0x42) && OCurrAction <= hex(0x59)
  elif Equal HitboxConnected 1 || Equal PrevAction hex(0x3C)
  elif !(Equal immediateTempVar op_defend_shield) && Rnd < globTempVar && Rnd < calc(pt_wall_chance * 1.2) && SamePlane
    currGoal = cg_attack_wall
  endif
endif

if currGoal >= cg_attack && currGoal <= calc(cg_attack + 1)
elif Equal currGoal cg_camp_attack || Equal currGoal cg_bait_attack || Equal currGoal cg_bait_shield || Equal currGoal cg_defend
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
#const priority_power = 13

DynamicDiceClear

if ODamage >= 40
  DynamicDiceAdd priority_power
  if ODamage >= 70
    DynamicDiceAdd priority_power
    DynamicDiceAdd priority_kill
    DynamicDiceAdd priority_kill
  endif
endif
immediateTempVar = OTopNY - TopNY
if Equal currGoal cg_attack_reversal
  DynamicDiceAdd priority_combo
  DynamicDiceAdd priority_combo
  DynamicDiceAdd priority_combo
  DynamicDiceAdd priority_power
  DynamicDiceAdd priority_launch
elif OCurrAction >= hex(0x1A) && OCurrAction <= hex(0x1D)
  DynamicDiceAdd priority_pressure
  DynamicDiceAdd priority_pressure
elif OFramesHitstun <= 0 && immediateTempVar < 30 && Equal HitboxConnected 0
  predictAverage immediateTempVar man_OXHitDist LevelValue
  if !(ODistLE immediateTempVar) && OYDistBackEdge > -35 
    DynamicDiceAdd priority_spacing
    DynamicDiceAdd priority_bait
  endif

  if hex(0x11) <= OCurrAction && OCurrAction <= hex(0x15)
    DynamicDiceAdd priority_breakCC
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
    DynamicDiceAdd priority_combo
  endif
  if Rnd < pt_aggression
    DynamicDiceAdd priority_pressure
    DynamicDiceAdd priority_launch
  else
    DynamicDiceAdd priority_spacing
  endif
  if Rnd < pt_baitChance
    DynamicDiceAdd priority_bait
  else
    DynamicDiceAdd priority_pressure
  endif
  if Rnd < pt_wall_chance
    DynamicDiceAdd priority_spacing
  else
    DynamicDiceAdd priority_pressure
  endif
  DynamicDiceAdd priority_combo
  DynamicDiceAdd priority_combo
  DynamicDiceAdd priority_combo
  DynamicDiceAdd priority_launch
  DynamicDiceAdd priority_pressure
  DynamicDiceAdd priority_power
elif True
  if ODamage >= 60
    DynamicDiceAdd priority_kill
    DynamicDiceAdd priority_kill
    DynamicDiceAdd priority_power
    DynamicDiceAdd priority_power
    if ODamage >= 100
      DynamicDiceAdd priority_kill
      DynamicDiceAdd priority_kill
      DynamicDiceAdd priority_kill
      DynamicDiceAdd priority_power
      DynamicDiceAdd priority_power
      DynamicDiceAdd priority_power
    endif
  endif
  DynamicDiceAdd priority_combo
  DynamicDiceAdd priority_combo
  DynamicDiceAdd priority_combo
  DynamicDiceAdd priority_combo
  DynamicDiceAdd priority_juggle
  DynamicDiceAdd priority_launch
  DynamicDiceAdd priority_pressure
  GetYDistFloorOffset immediateTempVar 40 5 1
  GetYDistFloorOffset globTempVar (-40) 5 1
  if Equal immediateTempVar -1 || Equal globTempVar -1
    DynamicDiceAdd priority_launch
    DynamicDiceAdd priority_kill
    DynamicDiceAdd priority_power
    DynamicDiceAdd priority_power
  endif

  if OKBAngle >= 70 && OKBAngle <= 110
    DynamicDiceAdd priority_juggle
    DynamicDiceAdd priority_launch
    DynamicDiceAdd priority_launch
  elif OKBAngle >= 180 
    DynamicDiceAdd priority_juggle
    DynamicDiceAdd priority_launch
    DynamicDiceAdd priority_combo
  endif

  if OYDistBackEdge > -calc(pt_shortHopHeight + pt_djumpHeight / 2)
    DynamicDiceAdd priority_combo
    DynamicDiceAdd priority_combo
    DynamicDiceAdd priority_combo
    DynamicDiceAdd priority_juggle
    DynamicDiceAdd priority_launch
  elif Equal OIsOnStage 1 && ODamage >= 70
    GetAttribute globTempVar attr_fastFallSpeed 0
    if globTempVar > 2
      DynamicDiceAdd priority_combo
    endif
  endif
endif

if OYDistBackEdge < -pt_shortHopHeight
  DynamicDiceAdd priority_juggle
  if OFramesHitstun > 0
    DynamicDiceAdd priority_juggle
    DynamicDiceAdd priority_juggle
  endif
  DynamicDiceAdd priority_combo
  if OYDistBackEdge < -calc(pt_djumpHeight * 1.4)
    DynamicDiceAdd priority_juggle
    DynamicDiceAdd priority_kill
  endif
endif

if FramesHitstun > 0 || Equal CurrAction hex(0x49)
  predictAverage immediateTempVar man_OXHitDist LevelValue
  immediateTempVar += 10
  if Equal AirGroundState 2 && ODistLE immediateTempVar
    DynamicDiceClear
    DynamicDiceAdd priority_panic
  endif
endif

#let priority = var7
DynamicDiceRoll priority

if Equal currGoal cg_defend
  priority = -1
endif

if CalledAs FastAerial
  priority = priority_panic
elif True
  if Equal currGoal cg_attack_wall && Rnd < 0.55
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
endif
DynamicDiceClear

#let move_currKnockback = var0
#let result = var1
#let hitFrame = var2
#let dirX = var3
#let dirY = var4
#let targetX = var5
#let targetY = var6
#let duration = var9
#let disjointX = var10
// #let disjointY = var11

if Equal priority priority_pressure
  if Equal AirGroundState 2
    Goto gen_aerial_checks
  else
    Goto gen_checks
  endif
elif Equal priority priority_panic
  Goto gen_aerial_checks
elif YDistBackEdge < -15 || YSpeed > 0
  Goto gen_aerial_checks
elif OYDistBackEdge < -35 && OCurrAction >= hex(0x42) && OCurrAction <= hex(0x64) && OYSpeed > 0
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
elif Equal priority priority_power
  {POWER_MOVES}
elif Equal priority priority_spacing
  {SPACING_MOVES}

  if Rnd < calc(pt_wall_chance * 1.2) && OYDistBackEdge > -30 && OFramesHitstun <= 0 && Equal HitboxConnected 0 && SamePlane && OFramesHitstun <= 0
    currGoal = cg_attack_wall
  endif
elif Equal priority priority_panic
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

{ADDITIONAL_FILTERS}

if Equal priority priority_camp
  Return
elif Equal priority priority_bait
  Return
elif Equal priority priority_panic || Equal currGoal cg_defend
  if !(Equal lastAttack -1)
    skipMainInit = mainInitSkip
    currGoal = cg_attack_reversal
  endif
  CallI MainHub
endif

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

if OCurrAction >= hex(0x42) && OCurrAction <= hex(0x59)
elif Equal HitboxConnected 1 || Equal PrevAction hex(0x3C)
elif Rnd < pt_wall_chance && Equal currGoal cg_attack && SamePlane && OFramesHitstun <= 0
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

  if YDistBackEdge >= -20
    $ifLastOrigin(nair,false)
      GetAttribute immediateTempVar attr_nairLandingLag 0
    $ifLastOrigin(fair,true)
      GetAttribute immediateTempVar attr_fairLandingLag 0
    $ifLastOrigin(dair,true)
      GetAttribute immediateTempVar attr_dairLandingLag 0
    $ifLastOrigin(bair,true)
      GetAttribute immediateTempVar attr_bairLandingLag 0
    $ifLastOrigin(uair,true)
      GetAttribute immediateTempVar attr_uairLandingLag 0
    endif
    immediateTempVar *= 0.5

    if immediateTempVar <= move_IASA
      move_IASA = immediateTempVar
    endif
  endif

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
    $ifLastOrigin(grab,false)
      Goto combo_check
    endif
    Goto combo_check
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
  elif Equal priority priority_power
    Goto power_check
    LOGSTR str("POWER")
  elif Equal priority priority_panic || Equal currGoal cg_defend
    $ifLastOrigin(grab, false)
    else
      Goto fastCheck
    endif
  elif Equal priority priority_bait
    Goto bait_check
  endif

  PRINTLN
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
  KILL_CHECK(__KILL__, result, move_currKnockback, move_angle, targetX, targetY)
  if Equal result 1
    Goto dirCheck
    Goto dirCheck
  endif
Return
label combo_check
  Goto kill_check

  immediateTempVar = move_IASA - (hitFrame + duration)
  globTempVar = move_currKnockback * 0.4
  if OYDistBackEdge > -4 && move_currKnockback <= 110
    immediateTempVar += 10 // leeway room (CC)
  else
    immediateTempVar += 0 // leeway room
  endif
  LOGSTR str("HITSTUN")
  LOGVAL globTempVar
  LOGSTR str("LEEWAY")
  LOGVAL immediateTempVar
  PRINTLN
  if immediateTempVar < globTempVar
    anotherTempVar = move_currKnockback * 0.4
    GetAttribute immediateTempVar attr_fastFallSpeed 0
    immediateTempVar *= anotherTempVar
    GetAttribute globTempVar attr_jumpYInitVel 0
    globTempVar *= anotherTempVar

    anotherTempVar = (move_currKnockback * 0.03)
    if move_angle > 230 && move_angle < 310
      if immediateTempVar > anotherTempVar || globTempVar > anotherTempVar
        Goto dirCheck
      endif
    elif move_angle > 55 && move_angle < 105 && globTempVar > anotherTempVar
      Goto dirCheck
    endif

    // globTempVar = move_IASA - (hitFrame + duration)
    GetAttribute immediateTempVar attr_dashRunTermVel 0
    immediateTempVar *= move_currKnockback * 0.4
    anotherTempVar = (move_currKnockback * 0.03)
    if move_angle > 230 && move_angle < 310
    elif move_angle > 55 && move_angle < 105
    elif immediateTempVar > anotherTempVar
      Goto dirCheck
    endif
  endif
Return
label juggle_check
  anotherTempVar = OYDistBackEdge * -2
  if move_angle > 230 && move_angle < 310 && anotherTempVar < move_currKnockback
    Goto dirCheck
  elif move_angle > 55 && move_angle < 105
    Goto dirCheck
  endif
Return
label techchase_check
  Goto dirCheck
Return
label pressure_check
  $ifLastOrigin(grab, false)
    Goto combo_check
  elif move_currKnockback >= 35
    if hitFrame <= 12
      Goto fastCheck
    elif move_angle > 180 && OYDistBackEdge > -60
      Goto fastCheck
    endif
  endif
Return
label breakCC_check
  if move_currKnockback >= 90
    Goto dirCheck
  endif
Return
label space_check
  immediateTempVar = move_IASA - (hitFrame + duration)
  if move_currKnockback < 55 || immediateTempVar >= 20
  $ifLastOrigin(grab, true)
  else
    Goto dirCheck
  endif
Return
label power_check
  Goto kill_check
  if move_angle <= 55 && move_currKnockback >= 200
    Goto dirCheck
  endif
Return
label escapeCorner_check
  if hitFrame <= 15
    Goto fastCheck
  endif
Return
label launch_check
  if move_currKnockback >= 250
    Goto dirCheck
  endif
Return
label bait_check
  immediateTempVar = move_IASA - (hitFrame + duration)
  if immediateTempVar < 25 && hitFrame < 35
    Goto fastCheck
  endif 
Return
label fastCheck
  $ifAerialAttack()
    immediateTempVar = move_IASA
  else
    immediateTempVar = move_IASA - (hitFrame + duration)
  endif

  if hitFrame <= 7 && immediateTempVar <= 10
    Goto dirCheck
  elif hitFrame <= 14 && immediateTempVar <= 10 && duration >= 10
    Goto dirCheck
  elif hitFrame <= 11 && immediateTempVar <= 16
    if Rnd < pt_braveChance
      Goto dirCheck
    endif
  endif
Return
label dirCheck
  immediateTempVar = OTopNY - TopNY
  if OFramesHitstun <= 0 && immediateTempVar < 30 && Equal HitboxConnected 0 && !(Equal priority priority_panic)
    disjointX *= globTempVar
    immediateTempVar = OTopNX - TopNX
    Abs immediateTempVar
    immediateTempVar *= 2
    if OYDistBackEdge > -35
      if disjointX >= immediateTempVar
        DynamicDiceAdd lastAttack
        DynamicDiceAdd lastAttack
      endif
      immediateTempVar *= -1
      if disjointX <= immediateTempVar
        DynamicDiceAdd lastAttack
        DynamicDiceAdd lastAttack
      endif
      if !(Equal priority priority_pressure)
        if disjointX > 1 && Equal Direction OPos
          DynamicDiceAdd lastAttack
          if disjointX > 3
            DynamicDiceAdd lastAttack
            if disjointX > 5
              DynamicDiceAdd lastAttack
              if disjointX > 7
                DynamicDiceAdd lastAttack
                if disjointX > 9
                  DynamicDiceAdd lastAttack
                  if disjointX > 11
                    DynamicDiceAdd lastAttack
                  endif
                endif
              endif
            endif
          endif
        elif disjointX < -1 && !(Equal Direction OPos)
          DynamicDiceAdd lastAttack
          if disjointX < -3
            DynamicDiceAdd lastAttack
            if disjointX < -5
              DynamicDiceAdd lastAttack
              if disjointX < -7
                DynamicDiceAdd lastAttack
                if disjointX < -9
                  DynamicDiceAdd lastAttack
                  if disjointX < -11
                    DynamicDiceAdd lastAttack
                  endif
                endif
              endif
            endif
          endif
        endif
      endif
    endif
    if dirX >= 0 && move_angle > 230 && move_angle < 310
      DynamicDiceAdd lastAttack
      DynamicDiceAdd lastAttack
      if move_hitFrame <= 15
        DynamicDiceAdd lastAttack
        if move_hitFrame <= 10
          DynamicDiceAdd lastAttack
          if move_hitFrame <= 5
            DynamicDiceAdd lastAttack
          endif
        endif
      endif
    elif move_angle > 55 && move_angle < 105 && Equal dirY 1 && TopNY < OTopNY && Equal priority priority_juggle
      DynamicDiceAdd lastAttack
      if move_hitFrame <= 15
        DynamicDiceAdd lastAttack
        if move_hitFrame <= 10
          DynamicDiceAdd lastAttack
          if move_hitFrame <= 5
            DynamicDiceAdd lastAttack
          endif
        endif
      endif
    endif
  else
    immediateTempVar = Direction * OPos
    if Equal dirX 0 && Equal dirY 0
      DynamicDiceAdd lastAttack
      DynamicDiceAdd lastAttack
    elif Equal dirX immediateTempVar
      if Equal dirY 0 
        DynamicDiceAdd lastAttack
        DynamicDiceAdd lastAttack
      elif Equal dirY 1 && OTopNY > TopNY
        DynamicDiceAdd lastAttack
        DynamicDiceAdd lastAttack
      elif Equal dirY -1 && OTopNY <= TopNY
        DynamicDiceAdd lastAttack
        DynamicDiceAdd lastAttack
      endif
    elif Equal dirY 1 && OTopNY > TopNY
      if Equal dirX 0
        DynamicDiceAdd lastAttack
        DynamicDiceAdd lastAttack
      elif Equal dirX immediateTempVar
        DynamicDiceAdd lastAttack
        DynamicDiceAdd lastAttack
      endif
    elif Equal dirY -1 && OTopNY <= TopNY
      if Equal dirX 0
        DynamicDiceAdd lastAttack
        DynamicDiceAdd lastAttack
      elif Equal dirX immediateTempVar
        DynamicDiceAdd lastAttack
        DynamicDiceAdd lastAttack
      endif
    endif
    if dirX >= 0 && move_angle > 230 && move_angle < 310
      DynamicDiceAdd lastAttack
      DynamicDiceAdd lastAttack
      if move_hitFrame <= 15
        DynamicDiceAdd lastAttack
        if move_hitFrame <= 10
          DynamicDiceAdd lastAttack
          if move_hitFrame <= 5
            DynamicDiceAdd lastAttack
          endif
        endif
      endif
    elif move_angle > 55 && move_angle < 105 && Equal dirY 1 && TopNY < OTopNY && Equal priority priority_juggle
      DynamicDiceAdd lastAttack
      if move_hitFrame <= 15
        DynamicDiceAdd lastAttack
        if move_hitFrame <= 10
          DynamicDiceAdd lastAttack
          if move_hitFrame <= 5
            DynamicDiceAdd lastAttack
          endif
        endif
      endif
    endif
  endif
Return
Return