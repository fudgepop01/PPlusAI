// APPROACH HUB
// controls which approach to use when pursuing a target location
#include <Definition_AIMain.h>
id 0x8001

unk 0x0

SetTimeout 400

movePart = 0

{DEBUG_SKIP}
SetDisabledMd 6

if Equal approachType at_immediate
  Seek CallAttacks
  Jump
endif

if Equal lastScript hex(0x1120)
  Call ComboHub
elif FramesHitstun > 0 || Equal move_xRange 0
  approachType = 0
  Call AIHub
endif

if NoOpponent
  Return
endif

if !(Equal lastScript hex(0x8F01)) && !(Equal lastScript hex(0x8F00)) && !(Equal lastScript hex(0x8001)) && !(Equal lastScript valOffensiveShield) && !(Equal lastScript valJumpOver) && !(Equal lastScript valGeneral)
  #let shouldRepick = var0
  shouldRepick = 0
  
  globTempVar = TopNY - OTopNY
  immediateTempVar = move_yOffset * -1
  if immediateTempVar > OHurtboxSize && globTempVar > 50
    shouldRepick = 1
  elif immediateTempVar < -8 && globTempVar < -90
    shouldRepick = 1
  endif

  globTempVar = move_xOffset + (move_xRange * 2)
  if Equal AirGroundState 2
    if globTempVar <= -1 && Equal Direction OPos
      shouldRepick = 1
    elif globTempVar >= 1 && !(Equal Direction OPos)
      shouldRepick = 1
    endif
  endif

  if Equal shouldRepick 1 && YDistBackEdge < 0
    LOGSTR str("repick 1")
    if Equal lastScript hex(0x8002)
      approachType = at_reroll
      Call ComboHub
    else
      approachType = at_reroll
      Call AIHub
    endif
  endif 

  MESS_MOVE_PARAMS

  // if Equal approachType at_edgeguard && lastAttack < hex(0x6040)
  //   move_xRange *= 1.5
  //   move_yRange *= 1.3
  //   move_yOffset = move_yOffset + (move_yRange * -1.5)
  //   move_yOffset -= 10
  // endif 
endif

// this is used to detect when the target x position has passed through falcon, such as when changing direction or something
#let prevTargetXDistance = var7

prevTargetXDistance = hex(0xFFFF)

label

if Equal CurrAction hex(0x04) || Equal CurrAction hex(0x03)
  Stick 1
endif

if lastScript > hex(0x10000)
  Seek forceDD
  Jump
endif

// these work together to only dashdance if not in a tech-chase or combo situation
IF_O_IS_TECHING
{SKIP_DASHDANCE_CONDITIONS}
// elif OAttacking && Rnd < 0.6 && XDistLE 20
elif CurrAction >= hex(0x7C) && CurrAction <= hex(0x7D)
elif XDistLE 10
elif OCurrAction >= hex(0x42) && OCurrAction <= hex(0x52)
elif Equal lastScript hex(0x8F00) || Equal lastScript hex(0x2060) || Equal lastScript hex(0x8002) || MeteoChance
elif Equal approachType at_undershoot && Rnd < 0.3
elif Equal approachType at_fakeout && Rnd < 0.2
elif Equal lastAttack valOffensiveShield && Rnd < 0.6
elif Equal lastAttack valJumpOver && Rnd < 0.4
elif Equal approachType at_combo
else
  label forceDD
  DASHDANCE(var0, var1)
  lastScript = hex(0x8001)
endif

if !(XDistLE 80) && Rnd < 0.35 && !(Equal approachType at_fakeout)
  Call FakeOutHub
endif

// prevTargetXDistance
var7 = hex(0xFFFF)
label BEGIN_MAIN
Cmd30

Goto checkHitstun
// globTempVar = move_xOffset + (move_xRange * 2)
// if Equal AirGroundState 2 && YDistBackEdge < 30 && !(Equal approachType at_edgeguard)
//   if globTempVar <= -1 && Equal Direction OPos
//     approachType = at_reroll
//     Call AIHub
//   elif globTempVar >= 1 && !(Equal Direction OPos)
//     approachType = at_reroll
//     Call AIHub
//   endif
// endif
if OFramesHitstun > 10
  EstOYCoord immediateTempVar OFramesHitstun
else
  EstOYCoord immediateTempVar 10
endif
immediateTempVar = immediateTempVar - TopNY
if SamePlane && immediateTempVar >= 60 && lastAttack <= valDashAttack
  approachType = at_reroll
  Call AIHub
endif

if Equal OIsOnStage 1 && Equal approachType at_edgeguard
  Call AIHub
endif

{BEGINNING_CHECKS}

// if Equal OCurrAction hex(0x3) && Equal OAnimFrame 1 
//   #let currODashDanceCount = var0
//   incrementPrediction man_oDashFrequency
//   predictAverage immediateTempVar man_oDashFrequency LevelValue
//   getCurrentPredictValue currODashDanceCount man_oDashFrequency
  
//   globTempVar = immediateTempVar - 2
//   immediateTempVar += 2
//   if currODashDanceCount < globTempVar
//     if Rnd <= 0.3
//       approachType = at_overshoot
//     endif
//   elif globTempVar < currODashDanceCount && currODashDanceCount < immediateTempVar
//     if ODistLE 50
//       predictOOption globTempVar man_approach LevelValue
//       predictionConfidence immediateTempVar man_approach LevelValue
//       if !(Equal ODirection OPos) && Equal globTempVar op_attack && Rnd < immediateTempVar
//         if Equal AirGroundState 2 && NumJumps > 0
//           Button X
//           Seek BEGIN_MAIN
//         elif Rnd < 0.7
//           Call Unk3020
//         else
//           ClearStick
//           Button R
//           Stick 0 (-1)
//           Seek BEGIN_MAIN
//           Return
//         endif
//       elif Equal globTempVar op_defend && Rnd < immediateTempVar
//         if Rnd < 0.4
//           lastScript = hex(0x8002)
//           Call Grab
//         else
//           movePart = 0
//           Call FakeOutHub
//         endif
//       endif 
//     endif
//   endif
// endif
// if !(Equal OCurrAction hex(0x7)) && !(Equal OCurrAction hex(0x3))
//   if Equal OPrevAction hex(0x7) || Equal OPrevAction hex(0x3)
//     if Equal OAnimFrame 1      
//       trackOAction man_oDashFrequency 0
//     endif
//   endif
// endif

if OCurrAction > hex(0x45) && Equal lastAttack hex(0x603C) && !(Equal moveVariant mv_techChase)
  if Rnd < 0.4
    Call AIHub
  else
    movePart = 0
    moveVariant = mv_techChase
    approachType = 0
    Call Grab
  endif
endif

if CurrAction >= hex(0x7C) && CurrAction <= hex(0x7D)
  Stick -1
  Return
endif

if FramesHitstun > 0
  Call AIHub
endif

lastScript = hex(0x8001)

// literally an edge case
if Equal OAirGroundState 3 && TopNY > OTopNY && !(Equal approachType at_edgeguard)
  Call EdgeguardHub
endif

globTempVar = OXDistBackEdge
Abs globTempVar
if MeteoChance
  #let localTempVar = var2
  if globTempVar > 70 && Equal IsOnStage 1
    Goto approachEdge
    Return
  elif OYDistBackEdge < -50 && Equal IsOnStage 1
    Goto approachEdge
    Return
  elif Equal approachType at_edgeguard && lastAttack < hex(0x6040) && Equal IsOnStage 1
    Goto approachEdge
    Return
  elif Equal AirGroundState 1 && globTempVar > 40 && OYDistBackEdge < -1 && OYDistBackEdge > -50 && !(Equal XSpeed 0) && lastAttack >= hex(0x6040) && CurrAction <= hex(0x05)
    Button X
  elif !(Equal CurrSubaction JumpSquat) && Equal AirGroundState 1 && OYDistBackEdge < 10 && OYDistBackEdge > -50 && lastAttack >= hex(0x6040) && CurrAction <= hex(0x05)
    Button X
  elif OYDistBackEdge > -10 && !(Equal approachType at_edgeguard) && !(Equal OAirGroundState 1)
    localTempVar = 0
    label
    // "are you sure?" check
    if !(MeteoChance)
      Seek
      Jump
    else 
    if localTempVar > 5
      Call EdgeguardHub
    endif
    localTempVar += 1
    Return
  endif
  label

  // if CanJump && YDistBackEdge > maxYEdgeDistWithJump
  //   approachType = 0
  //   Call RecoveryHub
  // elif !(CanJump) && YDistBackEdge > maxYEdgeDist
  //   approachType = 0
  //   Call RecoveryHub
  // endif
endif
if !(True)
  #let localTempVar = var2
  label approachEdge
  GetNearestCliff localTempVar
  localTempVar -= TopNX
  Abs localTempVar
  if localTempVar < 5
    if Equal CurrAction hex(0x4)
      ClearStick
      Stick 0 (-1)
      Return
    endif 
    localTempVar = OPos * -0.5
    AbsStick localTempVar
    Return
  elif localTempVar < 10
    globTempVar = move_xOffset + (move_xRange * 2)
    if globTempVar >= 1 && !(Equal Direction OPos)
      Stick -1
      Return
    elif globTempVar <= -1 && Equal Direction OPos
      Stick -1
      Return
    endif
    if OYDistBackEdge > -50
      if OYDistBackEdge < 40 && lastAttack >= hex(0x6040) && CurrAction <= hex(0x05)
        Button X
      endif
      Seek edgeguardMovementComplete
      Jump
      ClearStick
    endif
    Return
  else
    AbsStick OPos
    if Equal CurrAction hex(0x01)
      ClearStick
    endif
  endif
  Return
endif

label edgeguardMovementComplete

#let targetXDistance = var5
#let targetYDistance = var6
#let absTargetXDistance = var0
#let absTargetYDistance = var1
#let prevTargetXDistance = var7

#let loopTempVar = var8
if lastAttack > hex(0x604F)
  move_lastHitFrame = move_hitFrame
endif

loopTempVar = 0 //(move_lastHitFrame - move_hitFrame) + 1

if loopTempVar < 1
  loopTempVar = 1
endif

if Equal OCurrAction hex(0x60) || Equal OCurrAction hex(0x61)
  if Equal OAnimFrame 3
    trackOAction man_willTech op_tech

    globTempVar = OXSpeed * OPos
    if globTempVar > 0.1
      trackOAction man_techchase op_away
    elif globTempVar < -0.1
      trackOAction man_techchase op_towards
    else
      trackOAction man_techchase op_neutral
    endif
  endif 
endif

if Equal OCurrAction hex(0x45) || Equal OCurrAction hex(0x4A)
  if Equal OAnimFrame 3
    trackOAction man_willTech op_noTech
  endif
endif

Goto defendFromO

if !(Equal AirGroundState 3) 
  Seek LOOP_DIST_CHECK
  Jump
endif
label LOOP_DIST_EXIT
if !(True)
  label LOOP_DIST_CHECK
  // clacs distance to the target
  CALC_TARGET_DISTANCES(var5, var6, var3, var4, move_hitFrame + (move_lastHitFrame - move_hitFrame) / 2)

  if Equal var4 -9999.9999
    targetYDistance = var4
  endif

  if LevelValue >= LV6 && OCurrAction >= hex(0x42) && OCurrAction <= hex(0x45) && Equal OIsOnStage 1 && Equal AirGroundState 1
    EstOYCoord globTempVar OFramesHitstun
    globTempVar = OTopNY - globTempVar
    immediateTempVar = OTopNY + OYDistBackEdge
    if globTempVar < immediateTempVar
      predictOOption globTempVar man_outOfHitstun LevelValue
      predictionConfidence immediateTempVar man_outOfHitstun LevelValue
      
      // LOGSTR str("PREDICTION")
      // LOGVAL globTempVar
      // LOGVAL immediateTempVar
      // DrawDebugRectOutline TopNX TopNY 25 3 color(0xFF0000DD)

      if Equal globTempVar op_jump && Rnd < immediateTempVar
        if ONumJumps > 0
          targetYDistance -= 20
        endif
      elif Equal globTempVar op_hitstun_attack && Rnd < immediateTempVar && XDistLE 25
        if Rnd < 0.7
          Call Unk3020
        else
          ClearStick
          Button R
          Stick 0 (-1)
          Seek BEGIN_MAIN
          Return
        endif
      endif
    endif
  endif

  globTempVar = prevTargetXDistance - targetXDistance
  Abs globTempVar
  if globTempVar > 50 && !(Equal prevTargetXDistance hex(0xFFFF))
    targetXDistance = prevTargetXDistance
  endif

  // targetXDistance and targetYDistance come from the macro
  absTargetXDistance = targetXDistance
  absTargetYDistance = targetYDistance
  Abs absTargetXDistance
  Abs absTargetYDistance

  if lastAttack <= valDSmash && !(Equal lastAttack valUSmash) && !(Equal lastAttack valGrab) && Equal CurrAction hex(0x03)
    immediateTempVar = groundFric * 50
    absTargetXDistance -= immediateTempVar
  endif

  // if we're not jumping
  if !(Equal CurrSubaction JumpSquat) && !(Equal targetYDistance -9999.999)
    shouldFastFall = 0
    #let localTempVar = var2

    // if one is negative and one is positive, and it's <= move_xRange
    // then we likely passed through it at some point within the last frame
    localTempVar = prevTargetXDistance + targetXDistance
    Abs localTempVar

    {FASTFALL_CHECK}

    if !(Equal AirGroundState 2) || !(Equal YSpeed 0) 
      if CanJump && YDistBackEdge > maxYEdgeDistWithJump
        approachType = 0
        Call RecoveryHub
      elif !(CanJump) && YDistBackEdge > maxYEdgeDist
        approachType = 0
        Call RecoveryHub
      elif YDistBackEdge > 50
        approachType = 0
        Call RecoveryHub
      endif
      #let shouldAttack = var2
      if absTargetXDistance <= move_xRange
        shouldAttack = 0
        Goto XDistCheckPassed
        if Equal shouldAttack 1
          LOGSTR str("REG")
          shouldAttack = 0
          Seek CallAttacks
          Jump
        elif Equal shouldAttack 2
          Seek BEGIN_MAIN
          Return
        elif Equal shouldAttack 3
          Seek
          Return
          label
          Button X
          Seek BEGIN_MAIN
          Return
        endif
        globTempVar = TopNY - OTopNY
        Abs globTempVar
        if !(Equal approachType at_edgeguard) && Rnd < 0.2
          if ODistLE 15
            predictOOption globTempVar man_approach LevelValue
            predictionConfidence immediateTempVar man_approach LevelValue
            if !(Equal ODirection OPos) && Equal globTempVar op_attack && Rnd < immediateTempVar
              if Equal AirGroundState 2 && NumJumps > 0
                Button X
                Seek BEGIN_MAIN
              elif Rnd < 0.7
                Call Unk3020
              else
                ClearStick
                Button R
                Stick 0 (-1)
                Seek BEGIN_MAIN
                Return
              endif
            elif Equal globTempVar op_defend && Rnd < immediateTempVar && Rnd < 0.55
              if Rnd < 0.8
                lastScript = hex(0x8002)
                approachType = 0
                Call Grab
              else
                movePart = 1
                Call FakeOutHub
              endif
            endif 
          endif
          // if XDistLE 25 && globTempVar <= 40 && OAttacking && Equal AirGroundState 1 && !(Equal CurrSubaction JumpSquat)
          //   if Rnd < 0.9
          //     Call Unk3020
          //   endif

          //   DEFENSIVE_REACTION_TIME(var0, var1)

          //   label
          //   Button X
          //   globTempVar = OPos * -1
          //   AbsStick globTempVar
          //   if InAir || FramesHitstun > 0
          //     Call AIHub
          //   endif
          //   Return
          // elif XDistLE 35 && globTempVar <= 40 && OAttacking && Equal AirGroundState 2 && !(MeteoChance)

          //   DEFENSIVE_REACTION_TIME(var0, var1)
          //   Button X
          //   movePart = 0
          //   Call AIHub
          // endif
        endif
      elif localTempVar <= move_xRange
        shouldAttack = 0
        Goto XDistCheckPassed
        if Equal shouldAttack 1
          LOGSTR str("LOCAL")
          shouldAttack = 0
          Seek CallAttacks
          Jump
        elif Equal shouldAttack 2
          Seek BEGIN_MAIN
          Return
        elif Equal shouldAttack 3
          Seek
          Return
          label
          Button X
          Seek BEGIN_MAIN
          Return
        endif
      endif
    endif
  endif

  loopTempVar -= 1
  if loopTempVar < 1
    Seek LOOP_DIST_EXIT
    Jump
    Return
  endif
  Seek LOOP_DIST_CHECK
  Jump
endif

if !(Equal CurrSubaction JumpSquat) && SamePlane && Equal AirGroundState 1 && Equal OAirGroundState 1 && absTargetYDistance > move_yRange && !(Equal targetYDistance -9999.9999) 
  Call AIHub
endif

#let gravChangeDist = var1
CALC_SELF_Y_CHANGE_GRAVITY(gravChangeDist, move_hitFrame)

// if !(Equal CurrSubaction JumpSquat)
  #let localTempVar = var2

  // if one is negative and one is positive, and it's <= move_xRange
  // then we likely passed through it at some point within the last frame
  localTempVar = prevTargetXDistance + targetXDistance
  Abs localTempVar

  if Equal prevTargetXDistance hex(0xFFFF)
    // just makes sure this isn't affected by other variables
    localTempVar = hex(0xFFFF)
  endif
  // if we want to perform an aerial, jump with respect to the
  // move_hitFrame to attempt to get there by the time the move's hitbox is out
  globTempVar = targetXDistance //+ (TotalXSpeed * (move_hitFrame + jumpSquatFrames) * -1) + TopNX
  // globTempVar -= TopNX
  // localTempVar -= TopNX
  Abs globTempVar
  // immediateTempVar = move_xRange + jumpXInitVel * move_hitFrame
  
  if Equal targetYDistance -9999.9999 
  elif Equal AirGroundState 1 && CurrAction <= hex(0x9) && Equal IsOnStage 1
    if globTempVar <= move_xRange && lastAttack >= hex(0x6041) && lastAttack <= valGeneral || XDistLE oJumpingDist && lastAttack >= hex(0x6041) && lastAttack <= valGeneral      
      if MeteoChance
        if OYDistBackEdge < -5
          Button X
        endif
      elif targetYDistance <= jumpIfOWithin
        globTempVar = move_xOffset + (move_xRange * 2)
        label
        if globTempVar <= -1 && Equal Direction OPos
          Stick -1
          Return
        elif globTempVar >= 1 && !(Equal Direction OPos)
          Stick -1
          Return
        endif
        if !(Equal CurrSubaction JumpSquat) && targetYDistance <= jumpIfOWithin
          Button X
        elif targetYDistance <= jumpIfOWithin && OAttacking
          Button X
        endif
        Goto JumpIfInRange
      else
        ClearStick 0
      endif
    elif targetYDistance <= jumpIfOWithin && OAttacking && OCurrActionFreq >= 3
      Button X
      Goto JumpIfInRange
    // elif Rnd < 0.3 && targetYDistance <= jumpIfOWithin 
    //   Button X
    //   Goto JumpIfInRange
    endif
  {MIX_DOUBLEJUMP_SECTION}
  {ADDITIONAL_MIXUPS}
  endif

  // if Equal approachType at_undershoot && XDistLE 60
  //   if Rnd < 0.3 && lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F) && Equal AirGroundState 1 && !(Equal CurrSubaction JumpSquat)
  //     globTempVar = move_xOffset + (move_xRange * 2)
  //     label
  //     if globTempVar <= -1 && Equal Direction OPos
  //       Stick -1
  //       Return
  //     elif globTempVar >= 1 && !(Equal Direction OPos)
  //       Stick -1
  //       Return
  //     endif
  //     Button X
  //   endif
  //   if Rnd < 0.5 && lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F) && InAir
  //     Seek CallAttacks
  //     Jump
  //   elif Rnd < 0.4 && lastAttack >= valJab123 && lastAttack <= valDSmash && !(InAir)
  //     Seek CallAttacks
  //     Jump
  //   endif
  //   label
  // endif
// endif

if AnimFrame <= 5 && Equal CurrAction hex(0xB) 
elif YDistBackEdge > -3 && Equal IsOnStage 1 && LevelValue >= LV7 && InAir && XDistBackEdge < -10 && XDistFrontEdge > 10
  label
  Button R
  ClearStick

  if XDistBackEdge > -25 && XDistBackEdge < -10
    Stick 1 (-1)
  elif XDistFrontEdge < 25 && XDistFrontEdge > 10
    Stick (-1) (-1)
  else
    immediateTempVar = Rnd * 10
    Stick immediateTempVar (-1)
  endif

  if Equal approachType at_combo
    ClearStick
    AbsStick OPos (-1)
  endif

  // AbsStick OPos (-1)
  Seek BEGIN_MAIN
  Return
endif

immediateTempVar = XSpeed * 8
GetYDistFloorOffset globTempVar immediateTempVar 40 0
if !(Equal globTempVar -1) && globTempVar < 20 && Rnd < 0.15
  if !(Equal approachType at_combo) && lastAttack > valDashAttack || !(SamePlane)
    if XDistLE 25 && Rnd < 0.3 || XDistLE 25 60
      label 
      if !(CurrAction <= hex(0xB))
        ClearStick
        Return
      endif
      immediateTempVar = jumpSquatFrames + 4
      label
      Button X
      if immediateTempVar <= 0 
        Seek
      endif
      immediateTempVar -= 1
      Return
      label
      Seek BEGIN_MAIN
      Return
    endif
  endif
endif

if !(SamePlane) && Rnd < 0.8 && Equal IsOnPassableGround 1
  if Equal AirGroundState 1 && targetYDistance < 0
    globTempVar = 4
    Seek platformDrop
    Jump
  endif
endif

if !(True)
  label platformDrop
  if Equal CurrSubaction JumpSquat
    Seek 
    Jump
  endif
  if Equal LevelValue LV9
    ClearStick
    Button R
    if Equal CurrAction hex(0x1B) && !(SamePlane)
      Stick 0 (-0.715)
    elif Equal CurrAction hex(0x72)
      Call AIHub
    elif SamePlane || !(Equal IsOnPassableGround 1)
      Call OOSHub
    endif 
  else
    ClearStick
    if CurrAction <= hex(0x05) && !(Equal CurrAction hex(0x03))
      AbsStick 0 (-1)
    elif Equal CurrAction hex(0x11)
      AbsStick 0 (-1)
    elif !(InAir)
      Return
    endif

    globTempVar -= 1

    if globTempVar <= 0
      Call AIHub
    else
      Seek platformDrop
    endif
  endif
  Return
endif
label

#let isGoingOffstage = var2
GOING_OFFSTAGE(var2, var3, move_IASA)

// if InAir && YSpeed < 0 && Equal isGoingOffstage 0
//   shouldFastFall = 1
//   Stick 0 (-1)
// endif

#let nearCliffX = var3
#let nearCliffY = var4
GetNearestCliff nearCliffX
nearCliffX = TopNX - nearCliffX

if nearCliffX > maxXEdgeDist || nearCliffX < -maxXEdgeDist 
  if Equal isGoingOffstage 2 && !(Equal approachType at_edgeguard)
    movePart = 0
    approachType = 0
    Call RecoveryHub
  endif
endif

if Equal isGoingOffstage 2 && Equal approachType at_edgeguard
  globTempVar = (YDistFrontEdge * -1) - gravChangeDist
  immediateTempVar = OTopNY + 30
  if CanJump && YDistFrontEdge < -maxYEdgeDistWithJump
    moveVariant = 0
    approachType = 0
    Call AIHub
  elif !CanJump && YDistFrontEdge < -maxYEdgeDist && YSpeed < 0.1
    moveVariant = 0
    approachType = 0
    Call AIHub
  elif CanJump && YDistFrontEdge > maxYEdgeDistWithJump || YDistFrontEdge > maxYEdgeDistJumpNoUpB && TopNY < immediateTempVar
    moveVariant = 0
    approachType = 0
    Call RecoveryHub
  endif
endif

// now that the calculations using these are over with, we'll store them
// for the next frame
if Equal prevTargetXDistance targetXDistance
  prevTargetXDistance = hex(0xFFFF)
else
  prevTargetXDistance = targetXDistance
endif

// if we're not in jumpsquat, we want to dash to the location
if Equal approachType at_edgeguard && lastAttack < hex(0x6040)
elif XDistLE oWalkingDist && lastAttack < hex(0x6040) && Equal AirGroundState 2
  Goto makeIdle
  shouldFastFall = 1
elif Equal AirGroundState 1 && !(Equal CurrSubaction JumpSquat)
  predictAverage immediateTempVar man_oXHitDist LevelValue
  immediateTempVar += 5
  predictOOption globTempVar man_approach LevelValue
  predictionConfidence anotherTempVar man_approach LevelValue
  anotherTempVar *= 2
  if OCurrAction <= hex(0x17) && XDistLE immediateTempVar && Rnd < anotherTempVar && Equal globTempVar op_attack 
    Button R
    Call Unk3020
  endif

  globTempVar = targetXDistance
  if absTargetXDistance <= 1 && lastAttack <= valDSmash
    Goto makeIdle
  // elif XDistLE oWalkingDist && lastAttack <= valDSmash && !(Equal lastAttack valUSmash)
  //   if CurrAction < hex(0x03)
  //     ClearStick
  //     if targetXDistance > 0
  //       AbsStick 0.7
  //     else
  //       AbsStick -0.7
  //     endif
  //   else
  //     Goto makeIdle
  //   endif
  else
    AbsStick targetXDistance
  endif
  // to ensure we dash, we clear the stick if we're walking for whatever reason
  if Equal CurrAction hex(0x01) && LevelValue > LV3 && !(XDistLE oWalkingDist)
    ClearStick
  endif

  if XDistLE oWalkingDist || absTargetXDistance <= move_xRange 
    EstOYCoord globTempVar move_lastHitFrame
    globTempVar -= TopNY
    if globTempVar > jumpIfOWithin || MeteoChance
      ClearStick
    elif lastAttack < valNAir && XDistFrontEdge < shortEdgeRange
    endif
  endif

  if XDistLE oWalkingDist && !(Equal CurrSubaction JumpSquat) && lastAttack >= valNAir
    Goto JumpIfInRange
  endif
elif Equal CurrSubaction JumpSquat
  #let shouldFullHop = var0
  shouldFullHop = Rnd
  label jsquat
  immediateTempVar = move_hitFrame * XSpeed + TopNX
  immediateTempVar -= OTopNX
  Abs immediateTempVar
  globTempVar = (move_xOffset + move_xRange) * Direction
  immediateTempVar += globTempVar
  globTempVar = immediateTempVar
  if globTempVar < 0
    Abs globTempVar
    if globTempVar <= 5
      ClearStick
    elif globTempVar <= 10 
      immediateTempVar = OPos * -0.4
      AbsStick immediateTempVar
    elif globTempVar <= 15
      immediateTempVar = OPos * -0.6
      AbsStick immediateTempVar
    elif globTempVar <= 20
      immediateTempVar = OPos * -0.85
      AbsStick immediateTempVar
    else
      immediateTempVar = OPos * -1
      AbsStick immediateTempVar
    endif
  elif True
    if globTempVar <= 5
      ClearStick
    elif globTempVar <= 10 
      immediateTempVar = OPos * 0.4
      AbsStick immediateTempVar
    elif globTempVar <= 15
      immediateTempVar = OPos * 0.6
      AbsStick immediateTempVar
    elif globTempVar <= 20
      immediateTempVar = OPos * 0.85
      AbsStick immediateTempVar
    else
      AbsStick OPos
    endif
  endif

  // adjusts the trajectory of the jump if the
  // target is moving
  globTempVar = OTotalXSpeed * 2
  if OTotalXSpeed > calloutSpeed && XDistLE 50
    ClearStick 0
    immediateTempVar += globTempVar
    AbsStick immediateTempVar 0
  elif OTotalXSpeed < -calloutSpeed && XDistLE 50
    ClearStick 0
    immediateTempVar += globTempVar
    AbsStick immediateTempVar 0
  endif

  // if nearCliffX >= -edgeRange && nearCliffX <= edgeRange
  //   if nearCliffX > 0
  //     ClearStick 0
  //     if XSpeed > 0.1
  //       AbsStick -1
  //     endif
  //   elif nearCliffX < 0
  //     ClearStick 0
  //     if XSpeed < -0.1
  //       AbsStick 1
  //     endif
  //   endif
  // endif
  Goto JumpIfInRange

  if Equal CurrSubaction JumpSquat && !(Equal approachType at_combo) && OFramesHitstun < 1
    if shouldFullHop <= 0.2
      Button X
    endif 
    Seek jsquat
    Return
  elif OAttacking && Equal CurrSubaction JumpSquat && OCurrActionFreq >= 3
    Button X
    Seek jsquat 
    Return
  endif
else
  // otherwise...
  globTempVar = targetXDistance
  // if globTempVar > 0.1 && globTempVar < 0.3
  //   globTempVar = 0.3
  // elif globTempVar < -0.1 && globTempVar > -0.3
  //   globTempVar = -0.3
  // endif
  
  // if XDistFrontEdge < edgeRange && Equal OPos Direction
  //   globTempVar /= 2
  // elif XDistBackEdge > -edgeRange && !(Equal OPos Direction)
  //   globTempVar /= 2
  // endif

  // 

  AbsStick globTempVar
  if !(Equal isGoingOffstage 0) && !(Equal approachType at_edgeguard)
    ClearStick 0
    var0 = XSpeed * -10
    AbsStick var0 0
  endif 

  if lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F)
    Goto JumpIfInRange
  elif Equal lastAttack valGeneral
    Goto JumpIfInRange
  elif !(SamePlane)
    Goto JumpIfInRange
  endif
endif

Seek BEGIN_MAIN
// if Equal approachType at_undershoot
//   LOGSTR str("throwout")
//   LOGSTR str("canceled")
//   approachType = 0
// endif
if shouldFastFall > 0
  Return
endif
ClearStick 1
// without this it may fastfall automatically, which we don't want

Stick 0 0.5
Return

label JumpIfInRange
if !(Equal targetYDistance -9999.9999)
  JUMP_IF_IN_RANGES(var6)
endif
Return

label XDistCheckPassed
#let shouldAttack = var2
#let forceJump = var3
#let loopTempVar = var8

shouldAttack = 0
globTempVar = move_yRange
if absTargetYDistance <= globTempVar
  #let approxDist = var4
  CALC_SELF_Y_CHANGE_GRAVITY(var4, move_IASA)
  approxDist = (YDistFrontEdge * -1) - approxDist

  #let isGoingOffstage = var2
  GOING_OFFSTAGE(var2, var3, move_IASA + 3)

  forceJump = 0
  if lastAttack >= hex(0x6038) && lastAttack <= hex(0x603B) && InAir && YDistBackEdge < -0.5
    forceJump = 1
  endif

  if lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F) || Equal forceJump 1
    ClearStick
    Stick 0 0.5
    globTempVar = -maxYEdgeDistWithJump 
    if Equal AirGroundState 1 && CurrAction <= hex(0x17)
      predictOOption globTempVar man_approach LevelValue
      predictionConfidence immediateTempVar man_approach LevelValue
      immediateTempVar *= 0.5
      predictAverage globTempVar man_oXHitDist LevelValue
      globTempVar += 10
      if Equal globTempVar op_attack && Rnd < immediateTempVar && !(Equal approachType at_combo) && XDistLE globTempVar
        if Rnd < 0.5
          Button Unk3020
        else
          movePart = 1
          Call FakeOutHub
        endif
      endif

      globTempVar = move_xOffset + (move_xRange * 2)
      if globTempVar >= 1 && !(Equal Direction OPos)
        Stick (-1)
        shouldAttack = 3
        Return
      elif globTempVar <= -1 && Equal Direction OPos
        Stick (-1)
        shouldAttack = 3
        Return
      endif
      Button X
      Return
    elif Equal AirGroundState 1
      shouldAttack = 0
      Return
    elif CanJump && Equal isGoingOffstage 2 && approxDist < globTempVar
      moveVariant = 0
      approachType = 0
      Call AIHub
    elif !CanJump && Equal isGoingOffstage 2 && approxDist < -maxYEdgeDist
      moveVariant = 0
      approachType = 0
      Call AIHub
    {ADDITIONAL_YDIST_CHECKS}
    else
      LOGSTR str("attacking")
      shouldAttack = 1
      Return
    endif
  elif Equal AirGroundState 1 || Equal lastAttack valGeneral
    shouldAttack = 1
  endif
endif
Return

label CallAttacks
Cmd30
if !(Equal approachType at_combo)
  predictOOption globTempVar man_attacking LevelValue
  predictionConfidence immediateTempVar man_attacking LevelValue

  if Equal AirGroundState 1 && Rnd < 0.5 && Rnd < immediateTempVar
    predictAverage immediateTempVar man_oXHitDist LevelValue
    if Equal globTempVar op_attack && XDistLE immediateTempVar 
      Stick 1
      Call Unk3020
    elif Equal globTempVar op_defend
      movePart = 1
      Call FakeOutHub
    elif Equal globTempVar op_grab
      Call DefendHub
    endif 
  elif Equal AirGroundState 2 && TopNY > OTopNY && Rnd < 0.2 && lastAttack >= valNAir && lastAttack <= valDSpecialAir && NumJumps > 0 && !(Equal approachType at_edgeguard)
    if Rnd < immediateTempVar
      SetFrame 0
      label
      Button X
      if NumFrames > 2
        Seek BEGIN_MAIN
      endif
      Return
    endif 
  endif
endif
label
Goto defendFromO
Goto checkHitstun
// if Equal OAirGroundState 1 && OCurrAction <= hex(0x09) && Rnd < 0.3 && Equal AirGroundState 1 && lastAttack < valNAir
//   lastAttack = hex(0x8008)
// endif

if Equal lastAttack valGeneral || Equal approachType at_fakeout
  Seek skipPreparation
  Jump
endif

#let framesOnGround = var0
framesOnGround = 0

{ADDITIONAL_IDLE_HOOK}

// if the action requires us to be stopped,
if lastAttack >= valJab123 && lastAttack <= valDSpecial && !(Equal lastAttack valUSmash) && !(Equal lastAttack valSSpecial) && CurrAction > hex(0x2)
  if CurrAction >= hex(0x6) || CurrAction <= hex(0x7)
  else
    Goto makeIdle
  endif
  Return
elif Equal CurrSubaction JumpSquat
  Return
elif lastAttack >= hex(0x6040) && lastAttack <= hex(0x604F) && Equal AirGroundState 1
  globTempVar = move_xOffset + (move_xRange * 2)
  if globTempVar >= 1 && !(Equal Direction OPos)
    ClearStick
    Stick (-0.7)
    Return
  elif globTempVar <= -1 && Equal Direction OPos
    ClearStick
    Stick (-0.7)
    Return
  endif
  if AnimFrame >= move_IASA || CurrAction <= hex(0x17)
    Button X
    Seek BEGIN_MAIN
  endif
  Return
endif
// BReversing
if lastAttack >= valNSpecial && lastAttack <= valDSpecial
  globTempVar = move_xOffset + (move_xRange * 2)
  if globTempVar >= 1 && !(Equal Direction OPos)
    ClearStick
    Stick (-0.7)
  elif globTempVar <= -1 && Equal Direction OPos
    ClearStick
    Stick (-0.7)
  else
    ClearStick
    globTempVar = OPos * 0.7
    AbsStick globTempVar
  endif
endif
// DashAttack
if Equal lastAttack valDashAttack && !(Equal CurrAction hex(0x03)) && !(Equal CurrAction hex(0x04))
  if Equal CurrAction hex(0x01)
    ClearStick
  else
    AbsStick OPos
  endif
  Return
endif

label skipPreparation
// sets movePart to 1 so we know to actually perform the move instead
// of loading the move data and getting within the move's range -- we
// just did that in this script!
movePart = 1
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
elif Equal approachType at_fakeout
  Call FakeOutHub
elif Equal lastAttack valGeneral
  movePart = mp_ATK
  Call ComboHub
endif
Return

label makeIdle
if Equal CurrAction hex(0x03)
  // stops the dash
  ClearStick
  Button X
  Return
endif
if Equal CurrAction hex(0x04)
  // interrupts run with crouch for one frame
  ClearStick
  Stick 0 (-1)
  Return
endif
if Equal CurrAction hex(0x0A) || Equal CurrSubaction JumpSquat
  Return
endif

#let isGoingOffstage = var2
GOING_OFFSTAGE(var2, var3, 4)

if InAir && YDistBackEdge > -10 && YDistBackEdge <= 2 && Equal isGoingOffstage 0
  ClearStick
  globTempVar = targetXDistance * 0.4
  if XDistBackEdge > -5
    globTempVar = 0.4
  elif XDistFrontEdge < 5
    globTempVar = -0.4
  endif
  if LevelValue <= LV7
    if Rnd < 0.5
      Button R
      AbsStick globTempVar (-1)
    endif
  elif True
    if Rnd <= 0.1
      globTempVar *= -1
    elif Rnd < 0.7 && XDistFrontEdge < 30
      globTempVar *= -1
    endif
    Button R
    AbsStick globTempVar (-1)
  endif
  if XDistBackEdge > -shortEdgeRange || XDistFrontEdge < shortEdgeRange
    ClearStick
    AbsStick 0 (-1)
  endif
  Return
elif !(Equal AirGroundState 1)
  Call AIHub
endif
globTempVar = move_xOffset + (move_xRange * 2)
if globTempVar >= 1 && !(Equal Direction OPos)
  ClearStick
  Stick (-0.7)
  Return
elif globTempVar <= -1 && Equal Direction OPos
  ClearStick
  Stick (-0.7)
  Return
endif
if CurrAction >= hex(0x16) && framesOnGround < 4
  framesOnGround += 1
  Return
elif CurrAction >= hex(0x18)
  Return
endif
Return

label defendFromO

DEFEND_FROM_O
TRACK_O_OPTIONS

Return
label checkHitstun

HITSTUN_CHECK

Return
Return