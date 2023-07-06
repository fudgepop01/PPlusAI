#include <Definition_AIMain.h>
id 0x8503
unk 0x0

//= XReciever
NoRepeat

// FIXME debug thing maybe
// SetDebugMode false
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

predictOOption immediateTempVar man_OBaitDirection 
anotherTempVar = 0
if OCurrAction >= hex(0x42) && OCurrAction <= hex(0x64) && !(Equal OCurrAction hex(0x49))
  anotherTempVar = 1
endif
if !(Equal immediateTempVar op_baitdir_overshoot) && currGoal < cg_edgeguard && Equal currGoal cg_attack && !(Equal scriptVariant sv_campAttack) && OFramesHitstun <= 0 && Equal anotherTempVar 0 && YDistFloor < 25
  predictOOption anotherTempVar man_ODefendOption 
  GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
  predictionConfidence globTempVar man_ODefendOption
  globTempVar *= 2
  if Equal immediateTempVar 1
  elif !(Equal anotherTempVar op_defend_shield) && Rnd < globTempVar && CHANCE_MUL_LE PT_WALL_CHANCE 1.2 && SamePlane
    lastAttack = -1
    currGoal = cg_attack_wall
  endif
endif

if Equal currGoal cg_attack_wall && YDistFloor > 25
  currGoal = cg_attack
elif Equal currGoal cg_attack_wall && YDistFloor < 0
  currGoal = cg_attack
elif currGoal >= cg_attack && currGoal <= calc(cg_attack + 1)
elif Equal scriptVariant sv_campAttack || Equal currGoal cg_bait_attack || Equal currGoal cg_bait_shield
else
  currGoal = cg_attack
endif
// if OFramesHitstun >= 1 && currGoal < cg_edgeguard
//   currGoal = cg_attack
// endif

// // ///////////////////////////////////////////////////////////////
// // prioritization
// // ///////////////////////////////////////////////////////////////

// #const priority_kill = 0
// #const priority_combo = 1
// #const priority_techchase = 2
// // https://fightinggameglossary.net/index/pressure
// #const priority_pressure = 3 
// #const priority_breakCC = 4
// #const priority_escapeCorner = 5
// #const priority_launch = 6
// // https://fightinggameglossary.net/index/poke
// #const priority_poke = 7 
// // I might not implement this idk
// #const priority_camp = 8 
// #const priority_edgeguard = 9
// // https://fightinggameglossary.net/index/anti-air
// #const priority_antiAir = 10 
// // https://fightinggameglossary.net/index/conversion
// #const priority_conversion = 11 
// // https://fightinggameglossary.net/index/frame-trap
// #const priority_frameTrap = 12 
// // https://fightinggameglossary.net/index/cross-up
// #const priority_crossUp = 13 
// // https://fightinggameglossary.net/index/otg
// #const priority_jabReset = 14 

// DynamicDiceClear dslot0
// DynamicDiceClear dslot1

// // universal:
// // - breakCC
// // - antiAir
//   if OCurrAction >= hex(0x11) && OCurrAction <= hex(0x15)
//     immediateTempVar += 1.5
//   endif
//   DynamicDiceAdd dslot0 priority_breakCC immediateTempVar

//   // if they're in the air and are likely to attack then an anti-air is a good option
//   immediateTempVar = OTopNY - TopNY - HurtboxSize
//   if XDistLE globTempVar && immediateTempVar > 10
//     PredictOMov immediateTempVar mov_attack
//     if immediateTempVar > 0.4 && CHANCE_MUL_LE PT_AGGRESSION 1.3 && OFramesHitstun < 15
//       anotherTempVar = PT_AGGRESSION * 0.5
//       DynamicDiceAdd dslot0 priority_antiAir anotherTempVar
//     endif
//   endif
// // neutral:
// // - kill
// // - poke
// // - breakCC
// // - crossUp
// // - antiAir
// // - launch

// // getting approximate width of the main stage platform
// Goto approxStageWidth

// Norm immediateTempVar TopNX TopNY 
// Norm anotherTempVar OTopNX OTopNY
// Abs immediateTempVar
// Abs anotherTempVar

// // if the distance between the players is less than about 7/20ths of the stage width
// globTempVar *= 0.35
// if immediateTempVar < globTempVar
//   // ...and neither player is 7/20th stage lengths away from the ledge
//   globTempVar *= OPos
//   GetYDistFloorOffset immediateTempVar globTempVar 5 1
//   globTempVar *= -1
//   GetYDistFloorOffset anotherTempVar globTempVar 5 0
//   if !(Equal immediateTempVar -1) && !(Equal anotherTempVar -1) 
//     Goto neutral_priorities
//   endif
// endif

// if !(True)
//   label neutral_priorities
//     // the greater the damage, the more incentive there is to go for a kill
//     // however, approaching can be unsafe, and so is determined by aggression
//     globTempVar = PT_AGGRESSION + 0.15
//     immediateTempVar = ODamage * (100 + OWeight - 100) / 2000
//     immediateTempVar *= globTempVar
//     DynamicDiceAdd dslot0 priority_kill immediateTempVar

//     // pokes are used in neutral often to try and get at the target from a safe distance
//     anotherTempVar = (PT_AGGRESSION + 1) * (PT_BAITCHANCE + 1)
//     DynamicDiceAdd dslot0 priority_poke anotherTempVar

//     if Equal AirGroundState 1
//       // if the opponent is unlikely to attack or grab
//       PredictOMov immediateTempVar mov_attack
//       PredictOMov globTempVar mov_grab
//       anotherTempVar = (PT_AGGRESSION + 1) * (PT_BAITCHANCE + 1) * (1.5 - immediateTempVar) * (1.5 - globTempVar)
//       if immediateTempVar < 0.2 && globTempVar < 0.2
//         // then consider crossing them up
//         DynamicDiceAdd dslot0 priority_crossUp anotherTempVar
//       endif
//       // otherwise if they're high in the air and nearby
//       $tempVar(OYDist, immediateTempVar)
//       OYDist = OTopNY - TopNY - HurtboxSize
//       predictAverage globTempVar man_OXHitDist
//       globTempVar += 10
//       if XDistLE globTempVar && OYDist > 25
//         // then maybe crossing up is still a good option
//         anotherTempVar *= 0.85 * PT_AGGRESSION
//         DynamicDiceAdd dslot0 priority_crossUp anotherTempVar
//       endif
//     endif

//     // if they're close then a launcher (as-in combo starter) is an idea
//     predictAverage globTempVar man_OXHitDist
//     globTempVar += Width + OWidth
//     if ODistLE globTempVar
//       anotherTempVar = 2 * (0.4 + PT_AGGRESSION) * (0.4 + PT_BRAVECHANCE)
//       DynamicDiceAdd dslot0 priority_launch anotherTempVar
//     endif
//   Return
// endif

// // advantage options
// $tempVar(OYDist, immediateTempVar)
// OYDist = OTopNY - TopNY - HurtboxSize
// if OYDist > 40
//   Goto advantage_priorities
// elif True
//   // otherwise if the opponent is 4/10ths of the way to the ledge relative to their direction from you
//   Goto approxStageWidth
//   globTempVar *= 0.4 * OPos
//   // take aggression and bravery into account
//   anotherTempVar = (0.5 + PT_AGGRESSION) * (0.5 + PT_BRAVECHANCE)
//   globTempVar *= anotherTempVar
//   GetYDistFloorOffset immediateTempVar globTempVar 5 1
//   if Equal immediateTempVar -1
//     Goto advantage_priorities
//   elif True
//     // then if the target is stuck in their shield...
//     if OCurrAction >= hex(0x1A) && OCurrAction <= hex(0x1D) && XDistLE 35
//       Goto advantage_priorities
//     endif
//   endif
// endif

// if !(True)
//   label advantage_priorities
//     // the greater the damage, the more incentive there is to go for a kill
//     immediateTempVar = ODamage * (100 + OWeight - 100) / 2000
//     DynamicDiceAdd dslot0 priority_kill immediateTempVar

//     immediateTempVar = 2 * PT_AGGRESSION
//     DynamicDiceAdd dslot0 priority_pressure immediateTempVar
//     if OCurrAction >= hex(0x1A) && OCurrAction <= hex(0x1D)
//       DynamicDiceAdd dslot0 priority_pressure 2.5
//     endif
//     immediateTempVar *= 0.65
//     DynamicDiceAdd dslot0 priority_combo immediateTempVar
//     anotherTempVar = 1 + PT_BRAVECHANCE
//     immediateTempVar *= anotherTempVar
//     DynamicDiceAdd dslot0 priority_launch immediateTempVar

//     immediateTempVar = PT_BAITCHANCE * 5
//     DynamicDiceAdd dslot0 priority_frameTrap immediateTempVar
//   Return
// endif

// // if the target is caught in a combo of some sort
// // exclude if they can act freely
// GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
// if Equal immediateTempVar 1
//   Goto punish_priorities
// endif
// if !(True)
//   label punish_priorities
//     // the greater the damage, the more incentive there is to go for a kill
//     immediateTempVar = ODamage * (100 + OWeight - 100) / 900
//     DynamicDiceAdd dslot0 priority_kill immediateTempVar

//     // calculate if we can arrive to the target's position as their hitstun ends
//     if OFramesHitstun > 0
//       // anotherTempVar = OFramesHitstun

//       // EstOXCoord immediateTempVar anotherTempVar

//       // if Equal AirGroundState 1
//       //   GetAttribute globTempVar attr_dashInitVel 0
//       // else
//       //   GetAttribute globTempVar attr_airXTermVel 0
//       // endif
//       // globTempVar = globTempVar * anotherTempVar
//       // globTempVar *= OPos
//       // globTempVar += TopNX

//       // if globTempVar < immediateTempVar && OPos < 0
//       //   DynamicDiceAdd dslot0 priority_combo 15
//       // elif globTempVar > immediateTempVar && OPos > 0
//         DynamicDiceAdd dslot0 priority_combo 15
//       // endif
//     elif OCurrAction >= hex(0x4D) && OCurrAction <= hex(0x64)
//       DynamicDiceAdd dslot0 priority_techchase 4
//     else
//       // otherwise see if we can make a conversion
//       // anotherTempVar = 20

//       // EstOXCoord immediateTempVar anotherTempVar

//       // if Equal AirGroundState 1
//       //   GetAttribute globTempVar attr_dashInitVel 0
//       // else
//       //   GetAttribute globTempVar attr_airXTermVel 0
//       // endif
//       // globTempVar = globTempVar * anotherTempVar
//       // globTempVar *= OPos
//       // globTempVar += TopNX

//       // if globTempVar < immediateTempVar && OPos < 0
//       //   DynamicDiceAdd dslot0 priority_conversion 5
//       // elif globTempVar > immediateTempVar && OPos > 0
//         DynamicDiceAdd dslot0 priority_conversion 8
//       // endif
//     endif

//     if OYDistFloor > 1 && OYDistFloor < 8
//       DynamicDiceAdd dslot0 priority_techchase 2.5
//     endif

//     immediateTempVar = PT_BAITCHANCE
//     if OCurrAction >= hex(0x1A) && OCurrAction <= hex(0x1D)
//       immediateTempVar *= 2.5
//     endif
//     DynamicDiceAdd dslot0 priority_frameTrap immediateTempVar
//   Return
// endif

// // disadvantage (very similar to advantage - basically just reversed)
// if OFramesHitstun <= 0
//   $tempVar(OYDist, immediateTempVar)
//   OYDist = TopNY - OTopNY - OHurtboxSize
//   if OYDist > 40
//     Goto disadvantage_priorities
//   elif True
//     // otherwise if the opponent is 4/10ths of the way to the ledge relative to their direction from you
//     Goto approxStageWidth
//     globTempVar *= -0.4 * OPos
//     // take aggression and bravery into account
//     // anotherTempVar = (0.5 + PT_AGGRESSION) * (0.5 + PT_BRAVECHANCE) + 1
//     // globTempVar /= anotherTempVar
//     GetYDistFloorOffset immediateTempVar globTempVar 5 1
//     anotherTempVar = OTopNX + globTempVar
//     DrawDebugLine OTopNX OCenterY anotherTempVar OCenterY color(0xFF0000DD)
//     if Equal immediateTempVar -1
//       Goto disadvantage_priorities
//     endif
//   endif
// endif
// if !(True)
//   label disadvantage_priorities
//     // the greater the damage, the more incentive there is to go for a kill (less so than pure advantage)
//     immediateTempVar = ODamage * (100 + OWeight - 100) / 4000
//     DynamicDiceAdd dslot0 priority_kill immediateTempVar
    
//     // perhaps try to wall them out
//     immediateTempVar = (1 - PT_AGGRESSION) * 4
//     DynamicDiceAdd dslot0 priority_poke immediateTempVar

//     immediateTempVar = PT_BRAVECHANCE * 4
//     DynamicDiceAdd dslot0 priority_crossUp immediateTempVar

//     immediateTempVar = PT_AGGRESSION * 4
//     DynamicDiceAdd dslot0 priority_escapeCorner immediateTempVar
//   Return
// endif
// // edgeguard
// if !(True)
//   label edgeguard_priorities
//     // the greater the damage, the more incentive there is to go for a kill (less so than pure advantage)
//     immediateTempVar = ODamage * (100 + OWeight - 100) / 2000
//     DynamicDiceAdd dslot0 priority_kill immediateTempVar
    
//     DynamicDiceAdd dslot0 priority_edgeguard 12
//   Return
// endif

// DynamicDiceRoll dslot0 priority 0



// ///////////////////////////////////////////////////////////////
// priority results
// ///////////////////////////////////////////////////////////////

DynamicDiceClear dslot0

// ///////////////////////////////////////////////////////////////
// attack rolls
// ///////////////////////////////////////////////////////////////
immediateTempVar = OFramesHitstun * 0.75
EstOYCoord immediateTempVar immediateTempVar
anotherTempVar = OHurtboxSize * 2
immediateTempVar -= TopNY 
immediateTempVar -= anotherTempVar

aerialChecks = 1
PredictOMov anotherTempVar mov_jump
anotherTempVar *= 0.2
if CurrAction >= hex(0x1A) && CurrAction <= hex(0x1D)
elif Equal CurrSubaction JumpSquat || CalledFrom Shield
elif YDistFloor > 20 || OYDistFloor > 45
elif immediateTempVar > 5
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

if Equal HitboxConnected 1 && HasCurry
  {TURBO_ROUTINES}
endif
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
LOGSTR_NL str("dice loop")
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
  elif Equal OAirGroundState 1
    // predict the chance that the opponent will crouch
    PredictOMov immediateTempVar mov_crouch
    if immediateTempVar > 0.10
      move_baseKnockback *= 0.67
      move_knockbackGrowth *= 0.67
    endif
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
  elif Equal currGoal cg_attack_wall && move_IASA > 120
    lastAttack = -1
    Return
  endif
  if Equal HitboxConnected 1 && HasCurry
    {TURBO_FILTERS}
  endif
  {ADDITIONAL_FILTERS}
  Return
endif

if !(True)
  label __DI_ANGLE__
  predictOOption immediateTempVar man_ODIAngle
  predictionConfidence anotherTempVar man_ODIAngle
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

SetDebugMode TEMP_DEBUG_TOGGLE

LOGVAL lastAttack
LOGSTR str("CHOSEN ATTACK")
CALL_EVENT(chr_cs_moveName)
PRINTLN

// SETTER
// $setLastAttack(fsmash)

DynamicDiceClear dslot0
DynamicDiceClear dslot1

if Equal HitboxConnected 1 && HasCurry
  {TURBO_ACTIONS}
endif

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

  // ENABLE DEBUG THING
  // if Equal currGoal cg_bait_attack
  //   SetDebugMode true
  // endif
  CALL_EVENT(chr_cs_moveName)
  // PRINTLN

  // if Equal priority priority_jabReset
  //   Goto jabreset_check
  if move_damage <= 0
    move_damage *= -1
    anotherTempVar = TopNX - OTopNX
    Abs anotherTempVar
    rollWeight = anotherTempVar * 2
    if Equal move_damage 0
      rollWeight *= 2.25
      Goto addMove
      PRINTLN
      Return
    endif
    Goto aftDirs
    PRINTLN
    Return 
  elif !(Equal currGoal cg_camp_attack) 
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
  LOGSTR str("BASE")
  LOGVAL rollWeight

  {MOVE_CALC_MODIFIERS}

  // O above
  $tempVar(dirY, globTempVar)
  GET_CHAR_TRAIT(dirY, chr_get_moveDirY)

  if !(Equal dirY 0)
    immediateTempVar = 0
    if CurrAction >= hex(0x24)
      immediateTempVar = AnimFrame - EndFrame
      if immediateTempVar > 30
        immediateTempVar = 30
      endif
    endif
    anotherTempVar = immediateTempVar
    EstOYCoord immediateTempVar anotherTempVar

    #let distDiff = var11
    distDiff = OYCoord - immediateTempVar
    if OYDistFloor > 0 && OYDistFloor < 5
      immediateTempVar = OYCoord
    elif distDiff > OYDistFloor && OYDistFloor > 0
      immediateTempVar = OYCoord - OYDistFloor
    endif

    EstYCoord anotherTempVar anotherTempVar
    distDiff = YCoord - anotherTempVar
    if distDiff > YDistFloor && YDistFloor > 0
      anotherTempVar = YCoord - YDistFloor
    endif
    // OEstPos - EstPos
    // pos = above
    // neg = below
    immediateTempVar -= anotherTempVar
    anotherTempVar = immediateTempVar
    anotherTempVar -= HurtboxSize

    if anotherTempVar > 0
      if dirY > 0
        rollWeight *= 2.5
      else
        rollWeight *= 0.1
      endif
    elif dirY > 0
      rollWeight *= 0.1
    endif

    // O below
    anotherTempVar = immediateTempVar
    anotherTempVar += OHurtboxSize

    if anotherTempVar <= 0
      if Equal OIsOnStage 0
      elif dirY < 0
        rollWeight *= 1.85
      else
        rollWeight *= 0.1
      endif
    endif
    LOGSTR str("YDIRS")
    LOGVAL rollWeight
  endif

  // O mid
  // globTempVar = TopNY - OTopNY
  // Abs globTempVar
  // anotherTempVar = HurtboxSize + OHurtboxSize
  // anotherTempVar *= 0.5
  // if globTempVar <= anotherTempVar
  //   if Equal dirY 0 
  //     rollWeight *= 1.35
  //   else
  //     rollWeight *= 0.25
  //   endif
  // endif

  anotherTempVar = TopNY - OTopNY
  globTempVar = TopNX - OTopNX
  Abs globTempVar
  if globTempVar > anotherTempVar
    $tempVar(dirX, immediateTempVar)
    GET_CHAR_TRAIT(dirX, chr_get_moveDir)
    anotherTempVar = TopNX - OTopNX
    globTempVar = move_hitFrame * XSpeed
    globTempVar -= anotherTempVar
    Abs globTempVar
    if OFramesHitstun < 5
      anotherTempVar = move_xOffset
      Abs anotherTempVar
      anotherTempVar += move_xRange
      anotherTempVar += move_xRange
      if globTempVar >= anotherTempVar
        anotherTempVar = move_xRange + move_xOffset
        immediateTempVar = move_xOffset
        Abs immediateTempVar
        if immediateTempVar > anotherTempVar
          anotherTempVar = immediateTempVar
        endif
        if anotherTempVar > 30
          anotherTempVar = 20
        endif
        anotherTempVar *= 0.75
        rollWeight += anotherTempVar
        rollWeight += anotherTempVar
        rollWeight += anotherTempVar
        if Equal currGoal cg_attack_wall
          rollWeight += anotherTempVar
          rollWeight += anotherTempVar
        endif

        anotherTempVar *= 0.35
        anotherTempVar += 1
        rollWeight *= anotherTempVar


        if Equal IsOnStage 1
          if Equal AirGroundState 1 || YDistFloor < OFramesHitstun
            if Equal Direction OPos && dirX >= 0 
              rollWeight *= 1.75
            elif !(Equal Direction OPos) && dirX < 0 
              rollWeight *= 1.75
            elif !(Equal dirX 0)
              rollWeight *= 0.05
            endif
          endif
        endif
      else
        rollWeight *= 5
      endif
    endif
    $ifLastOrigin(grab,false)
      if globTempVar < 35
        GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
        PredictOMov globTempVar mov_shield
        if globTempVar > 0.3 && OYDistFloor < 20 && OYDistFloor > -1
          if Equal immediateTempVar 0
            immediateTempVar = globTempVar + 1
            rollWeight *= immediateTempVar
          endif
          rollWeight *= 2.25
        endif
      endif
    endif

    LOGSTR str("XDIR")
    LOGVAL rollWeight
  endif
  if !(True)
    label aftDirs
  endif
  GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
  if !(Equal currGoal cg_attack_wall) && Equal immediateTempVar 0
    Goto addIfFastHit
    LOGSTR str("FHIT")
    LOGVAL rollWeight
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
  LOGSTR str("OENDL")
  LOGVAL rollWeight
    
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
  // LOGSTR str("[[ O dashInitVel")
  // LOGVAL anotherTempVar
  anotherTempVar *= 1.15
  immediateTempVar *= anotherTempVar
  anotherTempVar *= move_IASA
  // LOGSTR str("no-range val")
  // LOGVAL anotherTempVar
  // STACK_PUSH anotherTempVar st_function
  // anotherTempVar = TopNX - OTopNX
  // Abs anotherTempVar
  // LOGSTR str("distance ]]")
  // LOGVAL anotherTempVar
  // anotherTempVar = STACK_POP
  // if Equal scriptVariant sv_campAttack
  //   anotherTempVar *= 0.75
  // endif
  if Equal scriptVariant sv_campAttack || Equal currGoal cg_bait_attack || Equal scriptVariant sv_campAttack
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
      PredictOMov anotherTempVar mov_shield
      if anotherTempVar > 0.2 && !(Equal scriptVariant sv_fastAttack)
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

  LOGSTR str("S_ENDL")
  LOGVAL rollWeight
  
  if !(True)
    label addMove
  endif
  immediateTempVar = LevelValue / 100
  anotherTempVar = Rnd
  if anotherTempVar < immediateTempVar
    anotherTempVar = immediateTempVar
  endif
  rollWeight *= anotherTempVar
  LOGSTR str("FINAL")
  LOGVAL rollWeight
  if rollWeight > 0
    DynamicDiceAdd dslot1 lastAttack rollWeight
  endif
Return
label getEndlag
  globTempVar = move_hitFrame + move_duration
  immediateTempVar = move_IASA
  immediateTempVar -= globTempVar
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
      immediateTempVar *= 0.65
    else
      GetCommitPredictChance anotherTempVar
      if anotherTempVar > 0.25
        immediateTempVar *= 0.8
      else 
        immediateTempVar *= 0.4
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