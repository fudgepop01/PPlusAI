#snippet PRE_HOOKS
#endsnippet

#snippet HITSTUN_ENDS
  if Equal AirGroundState 1
    if Rnd < 0.5 || LevelValue < LV6
      Stick -1
    else
      movePart = 1
      Call DTilt
    endif
  elif Rnd < 0.2 && CanJump
    Button X
    movePart = 0
    Call DAir
  else
    Seek Hitstun_End
    Return
  endif
#endsnippet

#snippet TECH_CHASE_OPTIONS
#endsnippet

#snippet O_ON_PLAT_ABOVE
  Call UAir
#endsnippet

#snippet WHIFF_PUNISH_OPTIONS
  if Rnd < 0.8
    Call FSmash
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
    Call NAir
  endif
#endsnippet

#snippet PUNISH_KNOCKDOWN_OPTIONS
  if Equal AirGroundState 1 && Rnd < 0.3
    Call DTilt
  elif Equal AirGroundState 1 && Rnd < 0.3
    Call FSmash
  else
    Call NAir
  endif
#endsnippet

#snippet ADDITIONAL_PREMAIN_OPTIONS
  if LevelValue >= LV7 && Rnd < 0.2
    approachType = at_throwOut
    if XDistLE 10
      Call UTilt
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
// $excludeMovesNotOrigin(nair|uair|fair|dair|dtilt|bair|grab|jab123)
$outputWithKnockbackThresholds(120, 290, Call)
#endsnippet

#snippet KILL_MOVES
$refreshMoves()
$filterMoveHitFrame(20)
// $filterMoveEndlag(20)
// $excludeMovesOrigin(sspecial|utilt)
$outputWithKnockbackThresholds(200, 400, Call)
#endsnippet

#snippet NEUTRAL_MOVES
$refreshMoves()
// $excludeMovesNotOrigin(fair|dair|nair|jab123|grab)
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