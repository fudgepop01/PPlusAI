#snippet PRE_HOOKS
#endsnippet

#snippet TECH_CHASE_OPTIONS
#endsnippet

#snippet O_ON_PLAT_ABOVE
  if Rnd < 0.2
    Call UAir
  elif Rnd < 0.3
    Call FAir
  else
    Call UTilt
  endif
#endsnippet

#snippet DEFENSE_OPTIONS
  immediateTempVar = Rnd * 8
  if immediateTempVar < 3
    Call NAir
  elif immediateTempVar < 4
    Call BAir
  elif immediateTempVar < 5
    Call FSmash
  elif immediateTempVar < 6
    Call FAir
  else
    Call DSmash
  endif
#endsnippet

#snippet PUNISH_KNOCKDOWN_OPTIONS
  if Rnd < 0.6
    Call FSmash
  elif Rnd < 0.3
    Call DAir
  elif Equal AirGroundState 1 && Rnd < 0.3
    Call DSmash
  else
    Call Grab
  endif
#endsnippet

#snippet ADDITIONAL_PREMAIN_OPTIONS
  if LevelValue >= LV6 && Rnd <= 0.2 && !(XDistLE 20)
    // approachType = at_laser
    Call FAir
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
          Call FAir
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
$excludeMovesNotOrigin(nair|fair|dtilt|dashattack|utilt|grab)
$output(Goto)
#let result = var2
MOVE_KB_WITHIN(result, move_currKnockback, move_angle, 45, 0, 90, 0, 90)
if Equal result 0
  Return
endif
#endsnippet

#snippet KILL_MOVES
$refreshMoves()
// $filterMoveHitFrame(20)
// $filterMoveEndlag(20)
$excludeMovesOrigin(USpecial)
$output(Call)
#let result = var2
KILL_CHECK(result, move_currKnockback, move_angle, 0, 0)
if Equal result 0
  Return
endif
#endsnippet

#snippet NEUTRAL_MOVES
$refreshMoves()
$excludeMovesNotOrigin(fair|nair)
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

#snippet TRAINING_OPTIONS
#endsnippet