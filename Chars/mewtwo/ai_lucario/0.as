#snippet PRE_HOOKS
  if Equal CurrAction hex(0x120)
    Button X
    Call ChrSpecific1 // mewtwo hover handler
  endif
#endsnippet

#snippet HITSTUN_ENDS
  if Equal AirGroundState 1
    if Equal LevelValue LV9
      movePart = 1
      Call DTilt
    else
      Stick -1
    endif
  elif Rnd < 0.5
    movePart = 0
    if Rnd < 0.4 && CanJump
      Button X
      Stick 0 (-1)
      Call NAir
    else
      Call NAir
    endif    
  else
    Seek Hitstun_End
    Return  
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
if Rnd < 0.8
  moveVariant = mv_hc
  approachType = at_hover
endif
$refreshMoves()
$filterMoveHitFrame(20)
$filterMoveEndlag(25)
$excludeMovesOrigin(uair|dair)
$outputWithKnockbackThresholds(150, 290, Call)
#endsnippet

#snippet KILL_MOVES
if Rnd < 0.8
  moveVariant = mv_hc
  approachType = at_hover
endif
$refreshMoves()
$filterMoveHitFrame(20)
// $filterMoveEndlag(20)
$excludeMovesOrigin(dair)
$outputWithKnockbackThresholds(250, 400, Call)
#endsnippet

#snippet NEUTRAL_MOVES
if Rnd < 0.8
  moveVariant = mv_hc
  approachType = at_hover
endif
$refreshMoves()
$filterMoveHitFrame(20)
$filterMoveEndlag(20)
// $filterMoveXMinMax(4, 20)
$excludeMovesOrigin(sspecial|uair|dair)
$output(Call)
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