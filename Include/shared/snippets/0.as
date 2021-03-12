#snippet L_CANCEL
  if CanJump && Rnd < 0.3 && LevelValue >= LV8
    Button X
    Return
  elif True
    var18 = 1
    var19 = 2
    Call Landing
  endif
#endsnippet

#snippet DECISION_TREE
  #let tries = var3
  tries = 3
  label _startCombo
  Goto comboStarters
  tries -= 1
  if tries <= 0
    Seek
  else
    Seek _startCombo
  endif
  Jump
  label
  tries = 3
  label _kill
  Goto killMoves
  tries -= 1
  if tries <= 0
    Seek
  else
    Seek _kill
  endif
  Jump
  label
  tries = 10
  label _neutralOption
  Goto neutralMoves
  tries -= 1
  if tries <= 0
    Seek
  else
    Seek _neutralOption
  endif
  Jump
  label
#endsnippet

#snippet COMBO_STARTERS
$refreshMoves()
$filterMoveHitFrame(10)
$filterMoveEndlag(10)
$outputWithKnockbackThresholds(80, 100, Call)
#endsnippet

#snippet KILL_MOVES
$refreshMoves()
$filterMoveHitFrame(20)
$filterMoveEndlag(20)
$outputWithKnockbackThresholds(130, 300, Call)
#endsnippet

#snippet NEUTRAL_MOVES
$refreshMoves()
$filterMoveHitFrame(10)
$filterMoveEndlag(10)
$filterMoveXMinMax(4, 20)
$output(Call)
#endsnippet