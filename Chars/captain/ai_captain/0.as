#snippet PRE_HOOKS
#endsnippet

#snippet HITSTUN_ENDS
  if Equal AirGroundState 1
    Stick -1
  elif Rnd < 0.3 && CanJump
    Button X
    if Rnd < 0.6
      movePart = 0
      Call DAir
    endif
  endif
#endsnippet

#snippet TECH_CHASE_OPTIONS
#endsnippet

#snippet O_ON_PLAT_ABOVE
  Call UAir
#endsnippet

#snippet WHIFF_PUNISH_OPTIONS
  if Rnd < 0.8
    Call SSpecial
  else
    Call Grab
  endif
#endsnippet

#snippet DEFENSE_OPTIONS
  if OYDistBackEdge < -20
    Call UAir
  endif
  if Rnd < 0.8 && !(Equal Direction OPos)
    Call BAir
  else
    moveVariant = mv_nairHit2
    Call NAir
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
  if !(XDistLE 20) && LevelValue >= LV7 && Rnd < 0.7
    approachType = at_throwOut
    Call NAir
  endif
#endsnippet

#snippet MAIN_OPTIONS
  if OYDistBackEdge > -15
    {DECISION_TREE}
  endif
  if OYDistBackEdge <= -15
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
$filterMoveHitFrame(20)
$filterMoveEndlag(25)
$excludeMovesOrigin(sspecial|uair)
$outputWithKnockbackThresholds(100, 290, Call)
#endsnippet

#snippet KILL_MOVES
$refreshMoves()
$filterMoveHitFrame(20)
// $filterMoveEndlag(20)
$excludeMovesOrigin(sspecial)
$outputWithKnockbackThresholds(250, 400, Call)
#endsnippet

#snippet NEUTRAL_MOVES
$refreshMoves()
$filterMoveHitFrame(20)
$filterMoveEndlag(20)
$filterMoveXMinMax(4, 20)
$excludeMovesOrigin(sspecial|uair)
$output(Call)
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