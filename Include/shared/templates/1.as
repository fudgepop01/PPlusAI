// APPROACH HUB
// controls which approach to use when pursuing a target location
#include <Definition_AIMain.h>
id 0x8001

unk 0x0

SetTimeout 400

movePart = 0

{DEBUG_SKIP}

if Equal approachType at_immediate
  Seek CallAttacks
  Jump
endif

if Equal lastScript hex(0x1120)
  Call ComboHub
elif FramesHitstun > 0 || Equal move_xRange 0
  Call AIHub
endif

if NoOpponent
  Return
endif

if !(Equal lastScript hex(0x8F01)) && !(Equal lastScript hex(0x8F00)) && !(Equal lastScript hex(0x8001))
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

// these work together to only dashdance if not in a tech-chase or combo situation
IF_O_IS_TECHING
{SKIP_DASHDANCE_CONDITIONS}
// elif OAttacking && Rnd < 0.6 && XDistLE 20
// elif Rnd < 0.05 && XDistLE 60
elif move_xRange > 30
elif Equal lastScript hex(0x8F00) || Equal lastScript hex(0x2060) || Equal lastScript hex(0x8002) || MeteoChance
elif Equal approachType at_throwOut && Rnd < 0.3
else
  lastScript = hex(0x8001)
  DASHDANCE(var0, var1)
endif

label BEGIN_MAIN
Cmd30

globTempVar = move_xOffset + (move_xRange * 2)
if Equal AirGroundState 2 && YDistBackEdge < 30 && !(Equal approachType at_edgeguard)
  if globTempVar <= -1 && Equal Direction OPos
    approachType = at_reroll
    Call AIHub
  elif globTempVar >= 1 && !(Equal Direction OPos)
    approachType = at_reroll
    Call AIHub
  endif
endif

if Equal OIsOnStage 1 && Equal approachType at_edgeguard
  Call AIHub
endif

{BEGINNING_CHECKS}
if OCurrAction > hex(0x45) && Equal lastAttack hex(0x603C) && !(Equal moveVariant mv_techChase)
  if Rnd < 0.4
    Call AIHub
  else
    movePart = 0
    moveVariant = mv_techChase
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

#let tempVar = var17

tempVar = OXDistBackEdge
Abs tempVar
if MeteoChance
  #let localTempVar = var2
  if tempVar > 70 && Equal IsOnStage 1
    Goto approachEdge
    Return
  elif OYDistBackEdge < -50 && Equal IsOnStage 1
    Goto approachEdge
    Return
  elif Equal approachType at_edgeguard && lastAttack < hex(0x6040) && Equal IsOnStage 1
    Goto approachEdge
    Return
  elif Equal AirGroundState 1 && tempVar > 40 && OYDistBackEdge < -1 && OYDistBackEdge > -50 && !(Equal XSpeed 0) && lastAttack >= hex(0x6040) && CurrAction <= hex(0x05)
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

if Equal AirGroundState 2
  Seek LOOP_DIST_CHECK
  Jump
elif Equal AirGroundState 1
  Seek LOOP_DIST_CHECK
  Jump
endif
label LOOP_DIST_EXIT
if !(True)
  label LOOP_DIST_CHECK
  // clacs distance to the target
  CALC_TARGET_DISTANCES(var5, var6, loopTempVar, var3, var4, move_hitFrame + (move_lastHitFrame - move_hitFrame) / 2, _oCalc, _sCalc)

  // targetXDistance and targetYDistance come from the macro
  absTargetXDistance = targetXDistance
  absTargetYDistance = targetYDistance
  Abs absTargetXDistance
  Abs absTargetYDistance
  // if we're not jumping

  if !(Equal CurrSubaction JumpSquat)
    shouldFastFall = 0
    #let localTempVar = var2

    // if one is negative and one is positive, and it's <= move_xRange
    // then we likely passed through it at some point within the last frame
    localTempVar = prevTargetXDistance + targetXDistance
    Abs localTempVar

    {FASTFALL_CHECK}

    if !(Equal AirGroundState 2) || !(Equal YSpeed 0) 
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
        tempVar = TopNY - OTopNY
        Abs tempVar
        if !(Equal approachType at_edgeguard) && Rnd < 0.4
          if XDistLE 25 && tempVar <= 40 && OAttacking && Equal AirGroundState 1 && !(Equal CurrSubaction JumpSquat)
            if Rnd < 0.9
              Call Unk3020
            endif

            DEFENSIVE_REACTION_TIME(var0, var1)

            label
            Button X
            globTempVar = OPos * -1
            AbsStick globTempVar
            if InAir || FramesHitstun > 0
              Call AIHub
            endif
            Return
          elif XDistLE 35 && tempVar <= 40 && OAttacking && Equal AirGroundState 2 && !(MeteoChance)

            DEFENSIVE_REACTION_TIME(var0, var1)
            Button X
            movePart = 0
            Call AIHub
          endif
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
      if CanJump && YDistBackEdge > maxYEdgeDistWithJump
        approachType = 0
        Call RecoveryHub
      elif !(CanJump) && YDistBackEdge > maxYEdgeDist
        approachType = 0
        Call RecoveryHub
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

if !(Equal CurrSubaction JumpSquat) && SamePlane && Equal AirGroundState 1 && Equal OAirGroundState 1 && absTargetYDistance > move_yRange
  Call AIHub
endif

#let gravChangeDist = var1
CALC_SELF_Y_CHANGE_GRAVITY(gravChangeDist, globTempVar, move_hitFrame, _gravChangeDistCalc)

if !(Equal CurrSubaction JumpSquat)
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
  tempVar = targetXDistance //+ (TotalXSpeed * (move_hitFrame + jumpSquatFrames) * -1) + TopNX
  // tempVar -= TopNX
  // localTempVar -= TopNX
  Abs tempVar

  if Equal AirGroundState 1 && CurrAction <= 9 && Equal IsOnStage 1 && !(Equal approachType at_throwOut)
    if tempVar <= move_xRange && lastAttack >= hex(0x6041) && lastAttack <= valGeneral
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
    elif XDistLE oJumpingDist && lastAttack >= hex(0x6041) && lastAttack <= valGeneral
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
    // elif Rnd <= 0.02 && lastAttack >= valJab123 && lastAttack <= valDSmash && XDistLE 80 100 && !(Equal approachType at_combo) && !(Equal approachType at_edgeguard)
    //   // randomly perform tomhawk stuff if using a grounded move and not comboing
    //   Call mix_tomhawkJump
    // elif Rnd <= 0.02 && Equal lastAttack hex(0x8008) && !(Equal approachType at_combo) && !(Equal approachType at_edgeguard)
    //   Call mix_tomhawkJump
    endif
  {MIX_DOUBLEJUMP_SECTION}
  {ADDITIONAL_MIXUPS}
  endif

  if Equal approachType at_throwOut && XDistLE 60
    if Rnd < 0.3 && lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F) && Equal AirGroundState 1 && !(Equal CurrSubaction JumpSquat)
      globTempVar = move_xOffset + (move_xRange * 2)
      label
      if globTempVar <= -1 && Equal Direction OPos
        Stick -1
        Return
      elif globTempVar >= 1 && !(Equal Direction OPos)
        Stick -1
        Return
      endif
      Button X
    endif
    if Rnd < 0.5 && lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F) && InAir
      Seek CallAttacks
      Jump
    elif Rnd < 0.4 && lastAttack >= valJab123 && lastAttack <= valDSmash && !(InAir)
      Seek CallAttacks
      Jump
    endif
    label
  endif
endif

if !(SamePlane) && Rnd < 0.8
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
  ClearStick
  if CurrAction <= hex(0x05) && !(Equal CurrAction hex(0x03))
    AbsStick 0 (-1)
  elif Equal CurrAction hex(0x11)
    AbsStick 0 (-1)
  else
    Return
  endif

  globTempVar -= 1

  if globTempVar <= 0
    Call AIHub
  else
    Seek platformDrop
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
    Call RecoveryHub
  endif
endif

if Equal isGoingOffstage 2 && Equal approachType at_edgeguard
  globTempVar = (YDistFrontEdge * -1) - gravChangeDist
  if CanJump && YDistFrontEdge < -maxYEdgeDistWithJump
    moveVariant = 0
    approachType = 0
    Call AIHub
  elif !CanJump && YDistFrontEdge < -maxYEdgeDist && YSpeed < 0.1
    moveVariant = 0
    approachType = 0
    Call AIHub
  elif CanJump && YDistFrontEdge > maxYEdgeDistWithJump
    moveVariant = 0
    approachType = 0
    Call RecoveryHub
  endif
endif

// now that the calculations using these are over with, we'll store them
// for the next frame
prevTargetXDistance = targetXDistance

// if we're not in jumpsquat, we want to dash to the location
if Equal approachType at_edgeguard && lastAttack < hex(0x6040)
elif Equal AirGroundState 1 && !(Equal CurrSubaction JumpSquat)
  LOGVAL absTargetXDistance
  tempVar = targetXDistance
  if absTargetXDistance <= 1
    ClearStick
  elif XDistLE oWalkingDist
    if CurrAction < hex(0x03) || CurrAction > hex(0x04)
      ClearStick
      if targetXDistance > 0
        AbsStick 0.8
      else
        AbsStick -0.8
      endif
    else
      AbsStick targetXDistance
    endif
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
  immediateTempVar = OTopNX - TopNX
  tempVar = OXSpeed - XSpeed
  tempVar *= 5
  immediateTempVar += tempVar
  tempVar = immediateTempVar
  Abs tempVar
  if tempVar <= 20
    ClearStick
  elif tempVar <= 35
    immediateTempVar = OPos * 0.4
    AbsStick immediateTempVar
  elif tempVar <= 50
    immediateTempVar = OPos * 0.6
    AbsStick immediateTempVar
  elif tempVar <= 60
    immediateTempVar = OPos * 0.85
    AbsStick immediateTempVar
  else
    AbsStick OPos
  endif

  // adjusts the trajectory of the jump if the
  // target is moving
  tempVar = OTotalXSpeed * 2
  if OTotalXSpeed > calloutSpeed && XDistLE 50
    ClearStick 0
    immediateTempVar += tempVar
    AbsStick immediateTempVar 0
  elif OTotalXSpeed < -calloutSpeed && XDistLE 50
    ClearStick 0
    immediateTempVar += tempVar
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
  if Equal CurrSubaction JumpSquat && !(Equal approachType at_throwOut) && !(Equal lastScript hex(0x8002)) && OFramesHitstun < 1
    if shouldFullHop <= 0.2
      Button X
    endif 
    Seek jsquat
    Return
  endif
  

  Goto JumpIfInRange
else
  // otherwise...
  tempVar = targetXDistance
  // if tempVar > 0.1 && tempVar < 0.3
  //   tempVar = 0.3
  // elif tempVar < -0.1 && tempVar > -0.3
  //   tempVar = -0.3
  // endif
  
  if XDistFrontEdge < edgeRange && Equal OPos Direction
    tempVar /= 2
  elif XDistBackEdge > -edgeRange && !(Equal OPos Direction)
    tempVar /= 2
  endif

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
if shouldFastFall > 0
  Return
endif
ClearStick 1
// without this it may fastfall automatically, which we don't want
Stick 0 0.5
Return

label JumpIfInRange
JUMP_IF_IN_RANGES(var6)
Return

label XDistCheckPassed
#let shouldAttack = var2
#let forceJump = var3
#let loopTempVar = var8

shouldAttack = 0

// tempVar = HurtboxSize
// if targetYDistance < tempVar && Equal AirGroundState 1 && Equal YSpeed 0 && !(Equal CurrAction hex(0x0A))
//   tempVar = hex(0xFFFF)
// else
  tempVar = move_yRange
// endif
if absTargetYDistance <= tempVar
  #let approxDist = var4
  CALC_SELF_Y_CHANGE_GRAVITY(var4, var3, move_IASA, l_test)
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
      shouldAttack = 1
      Seek LOOP_DIST_CHECK
    endif
  elif Equal AirGroundState 1
    shouldAttack = 1
  endif
endif
Return

label CallAttacks

// if Equal OAirGroundState 1 && OCurrAction <= hex(0x09) && Rnd < 0.3 && Equal AirGroundState 1 && lastAttack < valNAir
//   lastAttack = hex(0x8008)
// endif

if Equal lastAttack valGeneral || Equal lastAttack hex(0x8008)
  Seek skipPreparation
  Jump
endif

#let framesOnGround = var0
framesOnGround = 0

{ADDITIONAL_IDLE_HOOK}

// if the action requires us to be stopped,
if lastAttack >= valJab123 && lastAttack <= valDSmash
  label makeIdle
  Seek CallAttacks
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
    globTempVar = targetXDistance * -0.1
    if XDistBackEdge < -5
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
      if Rnd < 0.25
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
    Stick (-1)
  elif globTempVar <= -1 && Equal Direction OPos
    ClearStick
    Stick (-1)
  else
    ClearStick
    AbsStick OPos
  endif
endif
// DashAttack
if Equal lastAttack valDashAttack && !(Equal CurrAction hex(0x03))
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
elif Equal lastAttack hex(0x8008)
  Call FakeOutHub
elif Equal lastAttack valGeneral
  movePart = mp_ATK
  Call ComboHub
endif
Return
Return