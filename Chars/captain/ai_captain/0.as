#snippet PRE_HOOKS
#endsnippet

#snippet TECH_CHASE_OPTIONS
#endsnippet

#snippet O_ON_PLAT_ABOVE
  Call UAir
#endsnippet

#snippet WHIFF_PUNISH_OPTIONS
  #let tries = var0
  tries = 10
  label whiffPunish
  $refreshMoves()
  $output(Goto)

  if move_hitFrame < OCurrEndlag && lastAttack >= valJab123 && lastAttack <= valDSpecialAir
    LOGSTR str("PUNISHING WHIFF")
    if Equal OAirGroundState 2
      if lastAttack >= valNAir && lastAttack <= valDSpecialAir
        Seek callMove
        Jump
      endif
    else 
      Seek callMove
      Jump
    endif
  endif
  if tries <= 0
    Seek
  else
    Seek whiffPunish
  endif
  tries -= 1
  Jump
  label
#endsnippet

#snippet DEFENSE_OPTIONS
  if OYDistBackEdge < -20
    Call UAir
  endif
  if Rnd < 0.8 && !(Equal Direction OPos)
    Call BAir
  elif Rnd < 0.3
    moveVariant = mv_nairHit2
    Call NAir
  elif Rnd < 0.3
    Call FTilt
  elif Rnd < 0.3
    Call DTilt
  else
    Call FSmash
  endif
#endsnippet

#snippet PUNISH_KNOCKDOWN_OPTIONS
  if Equal AirGroundState 1 && Rnd < 0.3
    Call DTilt
  elif Equal AirGroundState 1 && Rnd < 0.3
    Call SSpecial
  else
    Call DAir
  endif
#endsnippet

#snippet ADDITIONAL_PREMAIN_OPTIONS
  if LevelValue >= LV7 && Rnd < 0.2
    approachType = at_undershoot
    if XDistLE 10
      Call Jab123
    else
      Call NAir
    endif
  endif
#endsnippet

#snippet MAIN_OPTIONS
  if OYDistBackEdge > -45
    {DECISION_TREE}
  endif
  if OYDistBackEdge <= -45
    globTempVar = TopNY - OTopNY
    Abs globTempVar
    if TopNY < OTopNY && globTempVar < 30
      Call UAir
    else
      globTempVar = TopNX - OTopNX
      Abs globTempVar
      if globTempVar > 20
        if Equal Direction OPos
          Call NAir
        else
          Call BAir
        endif
      endif
      Call DAir
    endif
  endif
#endsnippet

#snippet COMBO_STARTERS
$refreshMoves()
$excludeMovesNotOrigin(nair|uair|fair|dair|dtilt|bair|grab|jab123)
$output(Goto)
#let result = var2
MOVE_KB_WITHIN(result, move_currKnockback, move_angle, 45, 0, 90, 0, 90)
if Equal result 0
  Return
endif
#endsnippet

#snippet KILL_MOVES
$refreshMoves()
$filterMoveHitFrame(20)
// $filterMoveEndlag(20)
$excludeMovesOrigin(sspecial|utilt)
$output(Goto)
#let result = var2
KILL_CHECK(result, move_currKnockback, move_angle, 0, 0)
if Equal result 0
  Return
endif
#endsnippet

#snippet NEUTRAL_MOVES
$refreshMoves()
$excludeMovesNotOrigin(fair|dair|nair|jab123|grab)
$output(Goto)
#endsnippet

#snippet HIGHUP_OPTIONS
  globTempVar = TopNY - OTopNY
  immediateTempVar = TopNX - OTopNX
  if globTempVar > 20
    Call UAir
  elif globTempVar < -20
    Call DAir
  elif immediateTempVar > 20
    $pickRandMove(fair|dair, Call)
  elif immediateTempVar < -20
    Call BAir
  else
    Call DAir
  endif
#endsnippet