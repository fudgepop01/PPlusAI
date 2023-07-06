// HOVER APPROACH HUB
// controls how mewtwo approaches to attack during hover

id 0x8102

unk 0x00000

SetTimeout 400

lastScript = hex(0x8102)

label

if !(Equal CurrAction hex(0x120)) && CanJump
  if Equal AirGroundState 1
    if CurrAction <= hex(0x09)
      Button X
    endif
    AbsStick OPos
  else
    Button X
    AbsStick OPos (-1)
  endif
  Return
endif

label Begin

if !(Equal CurrAction hex(0x120))
  Call ApproachHub
endif

// keeps hover going
Button X

#let targetXDistance = var0
#let targetYDistance = var1
#let absTargetXDistance = var2
#let absTargetYDistance = var3
#let loopTempVar = var8

if lastAttack > hex(0x604F)
  move_lastHitFrame = move_hitFrame
endif

loopTempVar = (move_lastHitFrame - move_hitFrame) + 1

Seek LOOP_DIST_CHECK
Jump
label LOOP_DIST_EXIT
if !(True)
  label LOOP_DIST_CHECK
  CALC_TARGET_DISTANCES(var0, var1, var2, var3, move_hitFrame + loopTempVar, _oCalc, _sCalc)

  // targetXDistance and targetYDistance come from the macro
  absTargetXDistance = targetXDistance
  absTargetYDistance = targetYDistance
  Abs absTargetXDistance
  Abs absTargetYDistance

  if absTargetXDistance <= move_xRange
    globTempVar = move_yRange + (OHurtboxSize / 2)
    if absTargetYDistance <= globTempVar
      #let approxDist = var4
      CALC_SELF_Y_CHANGE_GRAVITY(var4, var3, move_IASA, l_test)
      approxDist = (YDistFrontEdge * -1) - approxDist

      #let isGoingOffstage = var2
      GOING_OFFSTAGE(var2, var3, move_IASA + 3)
      
      if !(Equal isGoingOffstage 0)
        if !(CanJump) && NumJumps > 0 && approxDist < -maxYEdgeDistJumpNoUpB
          moveVariant = 0
          Call AIHub
        else
          Seek CallAttacks
          Jump
        endif
      else
        Seek CallAttacks
        Jump
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

if CanJump && YDistBackEdge > maxYEdgeDistWithJump
  Call RecoveryHub
elif !(CanJump) && YDistBackEdge > maxYEdgeDist
  Call RecoveryHub
elif !(CanJump) && NumJumps > 0 && YDistBackEdge > maxYEdgeDistJumpNoUpB
  Call RecoveryHub
endif

AbsStick targetXDistance targetYDistance

if YDistBackEdge > -5 && Equal IsOnStage 1 && targetYDistance < 0
  ClearStick 1
endif

Seek Begin
Return
label CallAttacks

movePart = 1
if Equal lastAttack hex(0x6041)
  Call NAir
elif Equal lastAttack hex(0x6042)
  Call FAir
elif Equal lastAttack hex(0x6043)
  Call BAir
elif Equal lastAttack hex(0x6044)
  Call UAir
elif Equal lastAttack hex(0x6045)
  Call DAir
endif

Return
Return