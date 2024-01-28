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

if Equal currGoal cg_attack_wall && YDistFloor > 25
  currGoal = cg_attack
elif Equal currGoal cg_attack_wall && YDistFloor < 0
  currGoal = cg_attack
elif currGoal >= cg_attack && currGoal <= calc(cg_attack + 1)
elif Equal scriptVariant sv_campAttack || Equal currGoal cg_bait_attack || Equal currGoal cg_bait_shield
else
  currGoal = cg_attack
endif

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

// EstOTopNY
immediateTempVar = OTotalYSpeed / OGravity
if OTotalYSpeed < 0
  immediateTempVar = 10
endif
EstOYCoord globTempVar immediateTempVar
STACK_PUSH globTempVar 1

// EstOYDistFloor
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

// EstOTopNX
GetAttribute immediateTempVar attr_airFrictionX 1
anotherTempVar = OTotalXSpeed
Abs anotherTempVar
anotherTempVar /= immediateTempVar
anotherTempVar *= OTotalXSpeed
if Equal OAirGroundState 1
  anotherTempVar = OTotalXSpeed * 4
endif
anotherTempVar += OTopNX
STACK_PUSH anotherTempVar 1 
// stageWidth
GetColDistPosAbs immediateTempVar anotherTempVar 0 -5 -10000 -5 0
GetColDistPosAbs globTempVar anotherTempVar immediateTempVar -5 10000 -5 0
globTempVar -= immediateTempVar
STACK_PUSH globTempVar 1 // stageWidth


loopCounter = 20
SeekNoCommit __DICE_LOOP__
// LOGSTR_NL str("dice loop")
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
    if Equal scriptVariant sv_campAttack || Equal currGoal cg_bait_attack || Equal currGoal cg_attack_wall || OIsCharOf GigaBowser
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

  if Equal currGoal cg_attack_wall && move_IASA > 120
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
  // predictOOption immediateTempVar man_ODIAngle
  // predictionConfidence anotherTempVar man_ODIAngle
  // anotherTempVar *= 3
  // if Rnd < anotherTempVar
  //   if Equal immediateTempVar op_DI_in
  //     if move_angle > 90 && move_angle < 180
  //       move_angle += 8
  //     elif move_angle > 270
  //       move_angle += 8
  //     else
  //       move_angle -= 8
  //     endif
  //   elif Equal immediateTempVar op_DI_out
  //     if move_angle > 90 && move_angle < 180
  //       move_angle -= 8
  //     elif move_angle > 270
  //       move_angle -= 8
  //     else
  //       move_angle += 8
  //     endif
  //   endif
  // endif
  Return
endif

DynamicDiceRoll dslot1 lastAttack 0

{POST_CHOICE_FILTER}

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
        immediateTempVar += move_hitFrame
        anotherTempVar = move_IASA * 0.4
        immediateTempVar += anotherTempVar
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
  // CALL_EVENT(chr_cs_moveName)
  // PRINTLN

  // if Equal priority priority_jabReset
  //   Goto jabreset_check
  if move_damage <= 0
    move_damage *= -1
    anotherTempVar = TopNX - OTopNX
    Abs anotherTempVar
    rollWeight = anotherTempVar * 2
    if Equal move_damage 0
      rollWeight *= 8
      Goto addMove
      // PRINTLN
      Return
    endif
    Goto aftDirs
    // PRINTLN
    Return 
  elif !(Equal currGoal cg_camp_attack) 
    // $ifLastOrigin(grab,false)
    //   if move_angle > 180
    //     rollWeight = ODamage * 0.5 * Rnd
    //     Goto dirCheck
    //     PRINTLN
    //     Return
    //   endif
    // endif    
    if !(Equal currGoal cg_attack_wall) && !(Equal currGoal cg_attack_inCombo)
      // "lol" said the programmer, "lmao"
      RESET_LTF_STACK_PTR
      
      // EstOTopNY
      anotherTempVar = LTF_STACK_READ
      // EstOYDistFloor
      immediateTempVar = LTF_STACK_READ
      IF_AERIAL_ATTACK(var11)
      elif OYDistFloor < 0
        anotherTempVar = TopNY - YDistFloor
        immediateTempVar = 0
      else 
        anotherTempVar = OTopNY - OYDistFloor
        immediateTempVar = 0
      endif
      // rollWeightVariable ODamage OWeight moveAngle moveBaseKnockback moveKnockbackGrowth moveHitFrame moveDuration moveIASA moveDamage moveIsWeightDependent          XTerminalVelocity jumpVelocity   OEndLag        EstOTopNX      TopNX TopBZ     xBZ       stageWidth     EstOTopNY      EstOYDistFloor
      CalcMoveWeight rollWeight ODamage OWeight move_angle move_baseKnockback move_knockbackGrowth move_hitFrame move_duration move_IASA move_damage move_isWeightDependent LTF_STACK_READ LTF_STACK_READ LTF_STACK_READ LTF_STACK_READ TopNX TBoundary RBoundary LTF_STACK_READ anotherTempVar immediateTempVar
    $ifLastOrigin(grab,true)
      Return
    else
      rollWeight = 20
    endif
  endif

  Goto dirCheck

  // PRINTLN
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
  Abs anotherTempVar
  Abs globTempVar
  if globTempVar > anotherTempVar
    if OFramesHitstun < 5
      anotherTempVar = TopNX - OTopNX
      globTempVar = move_hitFrame * XSpeed
      globTempVar -= anotherTempVar
      Abs globTempVar
      Goto getMaxXDist
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

        $tempVar(dirX, immediateTempVar)
        GET_CHAR_TRAIT(dirX, chr_get_moveDir)
        if var11 > 0 && Equal AirGroundState 2 || Equal AirGroundState 1 || YDistFloor < OFramesHitstun && YDistFloor > -1
          if Equal Direction OPos && dirX >= 0 
            rollWeight *= 1.75
          elif !(Equal Direction OPos) && dirX < 0 
            rollWeight *= 1.75
          elif !(Equal dirX 0)
            rollWeight *= 0.05
          endif
        endif
      else
        rollWeight *= 5
      endif
    else
      immediateTempVar = OTopNX + OTotalXSpeed * move_hitFrame
      anotherTempVar = TopNX + TotalXSpeed * move_hitFrame
      immediateTempVar -= anotherTempVar
      Abs immediateTempVar
      Goto getMaxXDist
      if immediateTempVar < anotherTempVar
        immediateTempVar *= 0.15
        rollWeight += immediateTempVar
        rollWeight *= 2
      endif
    endif
    if !(True)
      label getMaxXDist
      anotherTempVar = move_xOffset
      Abs anotherTempVar
      anotherTempVar += move_xRange
      anotherTempVar += move_xRange
      Return
    endif
    $ifLastOrigin(grab,false)
      PredictOMov globTempVar mov_shield
      if globTempVar > 0.2 && OYDistFloor < 20 && OYDistFloor > -1
        rollWeight *= 2
      endif
      rollWeight *= 1.5
    endif

    // LOGSTR str("XDIR")
    // LOGVAL rollWeight
  endif
  if !(True)
    label aftDirs
  endif
  GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
  if !(Equal currGoal cg_attack_wall) && Equal immediateTempVar 0
    Goto addIfFastHit
    // LOGSTR str("FHIT")
    // LOGVAL rollWeight
  endif
  Goto getOEndlag

  anotherTempVar = immediateTempVar

  // if move_hitFrame <= immediateTempVar 
    immediateTempVar -= move_hitFrame
    immediateTempVar *= 0.1
    immediateTempVar += 1
    if immediateTempVar > 1.5
      immediateTempVar = 1.5
    elif immediateTempVar < 0
      immediateTempVar = 0
    endif
    rollWeight *= immediateTempVar
  // endif

  // LOGSTR str("OENDL")
  // LOGVAL rollWeight
    
  // if Equal currGoal cg_attack_wall
  //   if move_duration <= 3
  //     immediateTempVar = move_duration + 1
  //     immediateTempVar = rollWeight / immediateTempVar
  //     rollWeight *= immediateTempVar
  //   elif True
  //     immediateTempVar = move_duration - 3
  //     immediateTempVar *= 0.15
  //     rollWeight *= immediateTempVar
  //   endif
  //   // LOGSTR str("INTERM")
  //   // LOGVAL rollWeight
  //   // PAUSE
  // endif

  if currGoal < cg_edgeguard
    Goto getEndlag
    // LOGVAL immediateTempVar
    // endlag - (OEndLag + 5)
    immediateTempVar -= anotherTempVar
    GetAttribute anotherTempVar attr_dashInitVel 1
    anotherTempVar *= 1.15
    // ... *= OInitDashVel * 1.15
    immediateTempVar *= anotherTempVar
    // OInitDashVel * 1.15 * move_IASA
    anotherTempVar *= move_IASA

    if Equal scriptVariant sv_campAttack || Equal currGoal cg_bait_attack || Equal scriptVariant sv_campAttack
      if XDistLE anotherTempVar
        Return
      endif
    endif
    if Equal move_baseKnockback -1 && XDistLE anotherTempVar
      Return
    endif


    // if the distance covered by the opponent post-endlag 
    // results in a distance below 25...
    globTempVar = immediateTempVar
    GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
    anotherTempVar = OTopNX - TopNX
    Abs anotherTempVar
    if Equal currGoal cg_attack_wall
      anotherTempVar -= 10
    endif
    if anotherTempVar < globTempVar && Equal immediateTempVar 0
      globTempVar -= anotherTempVar
      globTempVar *= 0.005
      globTempVar += 1
      rollWeight /= globTempVar
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

    // LOGSTR str("S_ENDL")
    // LOGVAL rollWeight
  endif
  
  if !(True)
    label addMove
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
Return