#snippet PRE_HOOKS

GetCommitPredictChance var0
LOGVAL var0
if var0 >= 0.85
  Button R 
endif
Return
#endsnippet

#snippet TECH_CHASE_OPTIONS
#endsnippet

#snippet O_ON_PLAT_ABOVE
  CallI UAir
#endsnippet

#snippet DEFENSE_OPTIONS
  if OYDistBackEdge < -20
    CallI UAir
  endif
  if Rnd < 0.8 && !(Equal Direction OPos)
    CallI BAir
  elif Rnd < 0.3
    moveVariant = mv_nairHit2
    CallI NAir
  elif Rnd < 0.3
    CallI FTilt
  elif Rnd < 0.3
    CallI DTilt
  else
    CallI FSmash
  endif
#endsnippet

#snippet PUNISH_KNOCKDOWN_OPTIONS
  if Equal AirGroundState 1 && Rnd < 0.3
    CallI DTilt
  elif Equal AirGroundState 1 && Rnd < 0.3
    CallI SSpecial
  else
    CallI DAir
  endif
#endsnippet

#snippet ADDITIONAL_PREMAIN_OPTIONS
  if LevelValue >= LV7 && Rnd < 0.2
    approachType = at_undershoot
    if XDistLE 10
      CallI Jab123
    else
      CallI NAir
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
      CallI UAir
    else
      globTempVar = TopNX - OTopNX
      Abs globTempVar
      if globTempVar > 20
        if Equal Direction OPos
          CallI NAir
        else
          CallI BAir
        endif
      endif
      CallI DAir
    endif
  endif
#endsnippet

#snippet COMBO_STARTERS
LOGSTR str("COMBO")
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
LOGSTR str("KILL")
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
LOGSTR str("NEUTRAL")
$refreshMoves()
$excludeMovesNotOrigin(dair|nair)
$output(Goto)
#endsnippet

#snippet HIGHUP_OPTIONS
  globTempVar = TopNY - OTopNY
  immediateTempVar = TopNX - OTopNX
  if globTempVar > 20
    CallI UAir
  elif globTempVar < -20
    CallI DAir
  elif immediateTempVar > 20
    $pickRandMove(fair|dair, CallI)
  elif immediateTempVar < -20
    CallI BAir
  else
    CallI DAir
  endif
#endsnippet