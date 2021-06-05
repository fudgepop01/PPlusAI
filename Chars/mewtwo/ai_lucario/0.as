#snippet PRE_HOOKS
  if Equal CurrAction hex(0x120)
    Button X
    Call ChrSpecific1 // mewtwo hover handler
  endif
#endsnippet

#snippet TECH_CHASE_OPTIONS
#endsnippet

#snippet O_ON_PLAT_ABOVE
  globTempVar = OTopNY - TopNY
  if globTempVar < 30 && Rnd < 0.3
    Call UTilt
  else
    approachType = at_hover
    Call UAir
  endif
#endsnippet

#snippet WHIFF_PUNISH_OPTIONS
  if Rnd < 0.8
    Call Grab
  else
    approachType = at_hover
    Call FAir
  endif
#endsnippet

#snippet DEFENSE_OPTIONS
  if OYDistBackEdge < -20
    Call UAir
  endif
  immediateTempVar = Rnd * 8
  if immediateTempVar < 1
    Call FTilt
  elif immediateTempVar < 2
    Call DTilt
  elif immediateTempVar < 3
    Call UTilt
  elif immediateTempVar < 4
    Call DSmash
  elif immediateTempVar < 5
    Call FSmash
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
    Call DSmash
  else
    approachType = at_hover
    moveVariant = mv_hc
    Call NAir
  endif
#endsnippet

#snippet ADDITIONAL_PREMAIN_OPTIONS
  if !(XDistLE 40) && LevelValue >= LV7 && Rnd < 0.3
    approachType = at_hover
    Call NAir
  endif

  if !(ODistLE 25) && Rnd < 0.7
    Call NSpecial
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
      Call UTilt
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
      approachType = at_hover
      Call NAir
    endif
  endif
#endsnippet

#snippet GROUND_HITSTUN_MOVES
  if LevelValue >= LV7
    movePart = 1
    $pickRandMove(jab123|dtilt|utilt|grab, Call)
  endif
#endsnippet

#snippet COMBO_STARTERS
if Rnd < 0.3
  moveVariant = mv_hc
  approachType = at_hover
endif
$refreshMoves()
$filterMoveHitFrame(20)
$filterMoveEndlag(25)
// $excludeMovesOrigin(uair|dair)
$output(Goto)
#let result = var2
MOVE_KB_WITHIN(result, move_currKnockback, move_angle, 45, 0, 90, 0, 90)
if Equal result 0
  Return
endif
#endsnippet

#snippet KILL_MOVES
if Rnd < 0.3
  moveVariant = mv_hc
  approachType = at_hover
endif
$refreshMoves()
$filterMoveHitFrame(20)
// $filterMoveEndlag(20)
$excludeMovesOrigin(dair)
$output(Goto)
#let result = var2
KILL_CHECK(result, move_currKnockback, move_angle, 0, 0)
if Equal result 0
  Return
endif
#endsnippet

#snippet NEUTRAL_MOVES
if Rnd < 0.4
  moveVariant = mv_hc
  approachType = at_hover
endif
$refreshMoves()
$excludeMovesNotOrigin(nair|bair|ftilt|dtilt)
$output(Goto)
#endsnippet

#snippet HIGHUP_OPTIONS
  if Rnd < 0.4
    Call NAir
  elif Rnd < 0.2
    Call DAir
  elif Rnd < 0.3
    Call FAir
  elif Rnd < 0.3
    Call BAir
  else
    Call NAir
  endif
#endsnippet