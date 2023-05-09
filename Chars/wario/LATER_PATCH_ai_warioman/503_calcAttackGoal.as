#include <Definition_AIMain.h>
id 0x8503
unk 0x0

//= XReciever
NoRepeat

// yep, move choice is COOOOOMPLICATED lmao
#let result = var0
#let move_angle = var1
#let move_hitFrame = var2
#let move_xRange = var3
#let move_baseKnockback = var4
#let move_xOffset = var5
#let move_knockbackGrowth = var6
#let move_hitFrame = var7
#let move_duration = var8
#let move_IASA = var9
#let move_damage = var10
#let move_isWeightDependent = var13
#let rollWeight = var15
#let aerialChecks = var12
#let loopCounter = var18

// #let priority = var11
// if !(Equal lastAttack -1)
//   PAUSE
// endif

predictOOption immediateTempVar man_OBaitDirection LevelValue 
anotherTempVar = 0
if OCurrAction >= hex(0x42) && OCurrAction <= hex(0x64) && !(Equal OCurrAction hex(0x49))
  anotherTempVar = 1
endif
if !(Equal immediateTempVar op_baitdir_overshoot) && currGoal < cg_edgeguard && Equal currGoal cg_attack && !(Equal scriptVariant sv_campAttack) && OFramesHitstun <= 0 && Equal anotherTempVar 0
  predictOOption anotherTempVar man_ODefendOption LevelValue 
  GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
  predictionConfidence globTempVar man_ODefendOption LevelValue
  globTempVar *= 2
  if Equal immediateTempVar 1
  elif !(Equal anotherTempVar op_defend_shield) && Rnd < globTempVar && CHANCE_MUL_LE PT_WALL_CHANCE 1.2 && SamePlane
    currGoal = cg_attack_wall
  endif
endif

if currGoal >= cg_attack && currGoal <= calc(cg_attack + 1)
elif Equal scriptVariant sv_campAttack || Equal currGoal cg_bait_attack || Equal currGoal cg_bait_shield
else
  currGoal = cg_attack
endif

DynamicDiceClear dslot0

// ///////////////////////////////////////////////////////////////
// attack rolls
// ///////////////////////////////////////////////////////////////

EstOYCoord immediateTempVar OFramesHitstun
anotherTempVar = OHurtboxSize * 2
immediateTempVar -= TopNY 
immediateTempVar -= anotherTempVar

aerialChecks = 1
PredictOMov anotherTempVar mov_jump LevelValue
anotherTempVar *= 0.2
if CurrAction >= hex(0x1A) && CurrAction <= hex(0x1D)
elif Equal CurrSubaction JumpSquat || CalledFrom Shield
elif YDistFloor > 20 || OYDistFloor > 45
elif immediateTempVar > 15
elif YDistFloor > 8 && XDistLE 15
elif OCurrAction >= hex(0x42) && OCurrAction <= hex(0x64) && immediateTempVar > 20
else
  aerialChecks = 0
endif

// if currGoal >= cg_edgeguard && OXDistBackEdge < calc(cs_recoveryDistX + 10) && OYDistBackEdge < 20
//   aerialChecks = 1
// el
if Equal YDistFloor -1
  aerialChecks = 1
endif

DynamicDiceClear dslot0
if CurrAction >= hex(0x34) && CurrAction <= hex(0x3A) 
  $addOriginToDice(1, grab, 1)
else
  $generateInitialAttackDiceRolls()
endif
// ///////////////////////////////////////////////////////////////
// hardcoded situations
// ///////////////////////////////////////////////////////////////
{COMBO_ROUTINES}

// perform these expensive calculations once for efficiency
if LevelValue >= LV7
  // EstOYDistFloor
  EstOYCoord globTempVar 10 
  globTempVar -= OTopNY
  globTempVar += OYDistFloor
  if globTempVar < 0
    globTempVar = 0
  endif
  STACK_PUSH globTempVar 1 

  GetAttribute immediateTempVar attr_dashInitVel 0
  GetAttribute globTempVar attr_airXTermVel 0
  // XTerminalVelocity
  if globTempVar > immediateTempVar
    STACK_PUSH globTempVar 1
  else
    STACK_PUSH immediateTempVar 1
  endif

  // jumpVelocity
  GetAttribute immediateTempVar attr_jumpYInitVel 0
  STACK_PUSH immediateTempVar 1

  // OEndLag
  Goto getOEndlag
  STACK_PUSH immediateTempVar 1
  
  immediateTempVar = OTopNX
  anotherTempVar = OTopNY
  // OTopNY
  STACK_PUSH anotherTempVar 1 
  // OTopNX
  STACK_PUSH immediateTempVar 1 
  // ESTOYDISTFLOOR AT START
  // TopNX
  STACK_PUSH TopNX 1
  // TopBZ
  STACK_PUSH TBoundary 1
  // nearXBZ
  if immediateTempVar > 0
    STACK_PUSH RBoundary 1
  else
    STACK_PUSH LBoundary 1
  endif
  // stageWidth
  Goto approxStageWidth
  STACK_PUSH globTempVar 1 // stageWidth
endif

loopCounter = 60 * ((6 - PlayerCount) * 0.25)
SeekNoCommit __DICE_LOOP__
if !(True)
  label __DICE_LOOP__
  DynamicDiceRoll dslot0 lastAttack 1
  if Equal lastAttack -1 
    loopCounter -= 1
    if loopCounter <= 0
      SeekNoCommit __DICE_LOOP_END__
    elif Equal lastAttack -1 
      SeekNoCommit __DICE_LOOP__
    endif
  endif 
  GET_MOVE_DATA(move_angle, move_xOffset, result, move_xRange, result, move_hitFrame, move_duration, move_IASA, move_damage, move_isWeightDependent, move_baseKnockback, move_knockbackGrowth)

  Goto __ADDITIONAL_FILTERS__
  if Equal lastAttack -1 
    SeekNoCommit __DICE_LOOP__
  endif
  if LevelValue >= LV8
    Goto __DI_ANGLE__
  endif

  Goto check_hub
  loopCounter -= 1
  if loopCounter <= 0
    SeekNoCommit __DICE_LOOP_END__
  endif
  SeekNoCommit __DICE_LOOP__
  Return
  label __DICE_LOOP_END__
endif

if !(True)
  label __ADDITIONAL_FILTERS__
  $ifLastOrigin(grab,false)
    if CurrAction >= hex(0x34) && CurrAction <= hex(0x3A)
      Return
    endif
    if Equal scriptVariant sv_campAttack || Equal currGoal cg_bait_attack || Equal currGoal cg_attack_wall 
      lastAttack = -1
      Return
    endif
  elif CurrAction >= hex(0x34) && CurrAction <= hex(0x3A)
    lastAttack = -1
    Return
  endif
  if Equal aerialChecks 1
    if Equal CurrSubaction JumpSquat || Equal CurrAction hex(0x1B) || Equal CurrAction hex(0x1C) || Equal CurrAction hex(0x1D)
      $ifLastOrigin(usmash,false)
        Return
      $ifLastOrigin(uspecial,true)
        Return
      endif
    endif
    IF_AERIAL_ATTACK(var11)
    else
      lastAttack = -1
      Return
    endif
  endif
  if Equal scriptVariant sv_campAttack
    if move_damage > 0
      lastAttack = -1
    endif
  elif Equal move_damage 0
    if Equal currGoal cg_bait_attack || Equal currGoal cg_attack_wall
    else
      lastAttack = -1
      Return
    endif
  endif
  {ADDITIONAL_FILTERS}
  Return
endif

if !(True)
  label __DI_ANGLE__
  predictOOption immediateTempVar man_ODIAngle LevelValue
  predictionConfidence anotherTempVar man_ODIAngle LevelValue
  anotherTempVar *= 3
  if Rnd < anotherTempVar
    if Equal immediateTempVar op_DI_in
      if move_angle > 90 && move_angle < 180
        move_angle += 8
      elif move_angle > 270
        move_angle += 8
      else
        move_angle -= 8
      endif
    elif Equal immediateTempVar op_DI_out
      if move_angle > 90 && move_angle < 180
        move_angle -= 8
      elif move_angle > 270
        move_angle -= 8
      else
        move_angle += 8
      endif
    endif
  endif
  Return
endif

DynamicDiceRoll dslot1 lastAttack 0

{POST_CHOICE_FILTER}

// LOGVAL lastAttack
// LOGSTR str("CHOSEN ATTACK")
// CALL_EVENT(chr_cs_moveName)
// PRINTLN

DynamicDiceClear dslot0
DynamicDiceClear dslot1
// Seek _ENDCALC_
// ///////////////////////////////////////////////////////////////
// attack post-processing
// ///////////////////////////////////////////////////////////////

XGoto SetAttackGoal
Return

// ///////////////////////////////////////////////////////////////
// check hub/types/adder
// ///////////////////////////////////////////////////////////////

label check_hub

  rollWeight = 0

  if YDistFloor < 20 && !(Equal YDistFloor -1) 
    immediateTempVar = 0
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
    if !(Equal immediateTempVar 0) 
      if Equal AirGroundState 2
        immediateTempVar *= 0.5
      else
        GetAttribute anotherTempVar attr_jumpSquatFrames 0
        move_hitFrame += anotherTempVar + 1
        GetAttribute anotherTempVar attr_gravity 0
        if anotherTempVar > 0.06
          immediateTempVar *= 0.5
        endif
      endif

      if immediateTempVar <= move_IASA
        move_IASA = immediateTempVar
      endif
    endif
  endif

  {FILTER_CHECKS}

  // CALL_EVENT(chr_cs_moveName)
  // PRINTLN

  // if Equal priority priority_jabReset
  //   Goto jabreset_check
  if Equal move_damage 0 && move_baseKnockback >= 0
    rollWeight = 350
  elif True
    $ifLastOrigin(grab,false)
      if move_angle > 180
        rollWeight = ODamage * 0.5 * Rnd
        Goto dirCheck
        PRINTLN
        Return
      endif
    endif    
    if !(Equal currGoal cg_attack_wall) && !(Equal currGoal cg_attack_inCombo)
      // "lol" said the programmer, "lmao"
      RESET_LTF_STACK_PTR
      
      immediateTempVar = LTF_STACK_READ
      IF_AERIAL_ATTACK(var11)
      elif OYDistFloor < 0
        immediateTempVar = TopNY - YDistFloor
      else 
        immediateTempVar = OTopNY - OYDistFloor
      endif
      // rollWeightVariable ODamage OWeight moveAngle moveBaseKnockback moveKnockbackGrowth moveHitFrame moveDuration moveIASA moveDamage moveIsWeightDependent XTerminalVelocity jumpVelocity OEndLag OTopNY OTopNX EstOYDistFloor TopNX TopBZ NearXBZ stageWidth
      CalcMoveWeight rollWeight ODamage OWeight move_angle move_baseKnockback move_knockbackGrowth move_hitFrame move_duration move_IASA move_damage move_isWeightDependent LTF_STACK_READ LTF_STACK_READ LTF_STACK_READ LTF_STACK_READ LTF_STACK_READ immediateTempVar LTF_STACK_READ LTF_STACK_READ LTF_STACK_READ LTF_STACK_READ
    $ifLastOrigin(grab,true)
      Return
    else
      rollWeight = 20
    endif
  endif

  Goto dirCheck

  PRINTLN
Return
label jabreset_check
  // I know, it's supposed to be moves that deal < 7% but at this
  // point i'm out of variables lmao
  if move_damage <= 7
    rollWeight += 1000
  endif
Return
label dirCheck
  // LOGSTR str("BASE")
  // LOGVAL rollWeight

  {MOVE_CALC_MODIFIERS}

  // O above
  // $tempVar(dirY, globTempVar)
  // GET_CHAR_TRAIT(dirY, chr_get_moveDirY)

  // anotherTempVar = move_hitFrame + 5
  // if !(Equal dirY 0) && OFramesHitstun < anotherTempVar
  //   EstOYCoord immediateTempVar anotherTempVar
  //   anotherTempVar = immediateTempVar
  //   anotherTempVar += HurtboxSize

  //   if anotherTempVar < OTopNY
  //     if dirY > 0
  //       rollWeight *= 1.75
  //     else
  //       rollWeight *= 0.1
  //     endif
  //   endif

  //   // O below
  //   anotherTempVar = immediateTempVar
  //   if anotherTempVar >= TopNY
  //     if Equal OIsOnStage 0
  //     elif dirY < 0
  //       rollWeight *= 3.5
  //     else
  //       rollWeight *= 0.1
  //     endif
  //   endif
  //   // LOGSTR str("YDIRS")
  //   // LOGVAL rollWeight
  // endif
  
  // $tempVar(dirX, immediateTempVar)
  // GET_CHAR_TRAIT(dirX, chr_get_moveDir)
  // globTempVar = move_hitFrame * XSpeed + TopNX - OTopNX
  // Abs globTempVar
  // if OFramesHitstun < 5
  //   if globTempVar >= 20
  //     anotherTempVar = move_xRange + move_xOffset
  //     immediateTempVar = move_xOffset
  //     Abs immediateTempVar
  //     if immediateTempVar > anotherTempVar
  //       anotherTempVar = immediateTempVar
  //     endif
  //     if anotherTempVar > 30
  //       anotherTempVar = 20
  //     endif
  //     anotherTempVar *= 0.75
  //     rollWeight += anotherTempVar
  //     rollWeight += anotherTempVar
  //     rollWeight += anotherTempVar
  //     if Equal currGoal cg_attack_wall
  //       rollWeight += anotherTempVar
  //       rollWeight += anotherTempVar
  //     endif

  //     anotherTempVar *= 0.5
  //     anotherTempVar += 1
  //     rollWeight *= anotherTempVar


  //     if Equal IsOnStage 1
  //       if Equal AirGroundState 1 || YDistFloor < OFramesHitstun
  //         if Equal Direction OPos && dirX >= 0 
  //           rollWeight *= 1.75
  //         elif !(Equal Direction OPos) && dirX < 0 
  //           rollWeight *= 1.75
  //         elif !(Equal dirX 0)
  //           rollWeight *= 0.05
  //         endif
  //       endif
  //     endif
  //   elif Equal dirX 0
  //     rollWeight *= 1.4
  //   endif
  // endif
  // $ifLastOrigin(grab,false)
  //   if globTempVar < 35
  //     GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
  //     PredictOMov globTempVar mov_shield LevelValue
  //     if globTempVar > 0.2 && OYDistFloor < 20 && OYDistFloor > -1
  //       if Equal immediateTempVar 0
  //         immediateTempVar = globTempVar + 1
  //         rollWeight *= immediateTempVar
  //       endif
  //       rollWeight *= 2.25
  //     endif
  //   endif
  // endif
  //=

  // LOGSTR str("XDIR")
  // LOGVAL rollWeight
  if !(Equal currGoal cg_attack_wall) && Equal OFramesHitstun 0
    Goto addIfFastHit
    // LOGSTR str("FHIT")
    // LOGVAL rollWeight
  endif
  Goto getOEndlag
  immediateTempVar += 5
  anotherTempVar = immediateTempVar
  if move_hitFrame <= immediateTempVar 
    immediateTempVar -= move_hitFrame
    immediateTempVar *= 0.1
    immediateTempVar += 1
    rollWeight *= immediateTempVar
  endif
  // LOGSTR str("OENDL")
  // LOGVAL rollWeight
  if rollWeight < 3000
    if Equal currGoal cg_attack_wall
      if move_duration <= 3
        immediateTempVar = move_duration + 1
        immediateTempVar = rollWeight / immediateTempVar
        rollWeight *= immediateTempVar
      elif True
        immediateTempVar = move_duration - 3
        immediateTempVar *= 0.15
        rollWeight *= immediateTempVar
      endif
      // LOGSTR str("INTERM")
      // LOGVAL rollWeight
      // PAUSE
    endif

    Goto getEndlag
    immediateTempVar -= anotherTempVar
    GetAttribute anotherTempVar attr_dashInitVel 1
    anotherTempVar *= 1.2
    immediateTempVar *= anotherTempVar
    anotherTempVar *= move_duration
    if Equal scriptVariant sv_campAttack
      anotherTempVar *= 0.65
    endif
    if Equal currGoal cg_bait_attack || Equal scriptVariant sv_campAttack
      if XDistLE anotherTempVar
        Return
      endif
    endif
    if Equal move_baseKnockback -1 && XDistLE anotherTempVar
      Return
    endif
    if immediateTempVar > 25 || Equal currGoal cg_attack_wall
      if Equal currGoal cg_attack_wall
        immediateTempVar *= 0.25
        rollWeight -= immediateTempVar
        immediateTempVar *= 0.05
      else
        immediateTempVar -= 20
        immediateTempVar *= 0.025
      endif
      immediateTempVar += 1
      rollWeight /= immediateTempVar
    endif
    if !(Equal currGoal cg_attack_wall)
      $ifLastAttack(grab)
      $ifLastOrigin(grab,true)
        PredictOMov anotherTempVar mov_shield LevelValue
        if anotherTempVar > 0.08 && !(Equal scriptVariant sv_fastAttack)
          anotherTempVar = 100 * anotherTempVar
          rollWeight += anotherTempVar
          anotherTempVar *= 0.1
          rollWeight *= anotherTempVar
        endif
        if OCurrAction >= hex(0x1A) && OCurrAction <= hex(0x1D) && YDistFloor < 25
          rollWeight += 20
          rollWeight *= 3
        endif
      endif
    endif

    // LOGSTR str("S_ENDL")
    // LOGVAL rollWeight
  endif
    
  immediateTempVar = LevelValue / 100
  anotherTempVar = Rnd
  if anotherTempVar < immediateTempVar
    anotherTempVar = immediateTempVar
  endif
  rollWeight *= anotherTempVar
  // LOGSTR str("FINAL")
  // LOGVAL rollWeight
  if rollWeight > 0
    DynamicDiceAdd dslot1 lastAttack rollWeight
  endif
Return
label getEndlag
  immediateTempVar = move_hitFrame + move_duration
  immediateTempVar = move_IASA - immediateTempVar
  IF_AERIAL_ATTACK(var11)
    if Equal IsOnStage 1
      immediateTempVar = move_IASA
    endif
  endif
Return
label getOEndlag
  GET_CHAR_TRAIT(immediateTempVar, chr_get_OEndlag)
Return
label addIfFastHit
  immediateTempVar = move_hitFrame
  immediateTempVar -= 15
  IF_AERIAL_ATTACK(var11)
    if Equal AirGroundState 1
      immediateTempVar += 6
    endif
  endif
  if immediateTempVar < 0
    immediateTempVar = 15 - move_hitFrame
    if Equal scriptVariant sv_fastAttack
      immediateTempVar *= 0.4
    else
      GetCommitPredictChance anotherTempVar LevelValue
      if anotherTempVar > 0.2
        immediateTempVar *= 0.6
      else 
        immediateTempVar *= 0.25
      endif
    endif
    immediateTempVar += 1
    rollWeight *= immediateTempVar
  endif
Return
label approxStageWidth
  GetColDistPosAbs immediateTempVar anotherTempVar 0 -5 -10000 -5 0
  GetColDistPosAbs globTempVar anotherTempVar immediateTempVar -5 10000 -5 0
  globTempVar -= immediateTempVar
Return
Return