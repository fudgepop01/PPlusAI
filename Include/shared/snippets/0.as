#snippet L_CANCEL
  if CanJump && Rnd < 0.3 && LevelValue >= LV8
    Button X
    Return
  elif True
    var18 = 1 // shouldFastFall
    var19 = 2 // moveMode
    Call Landing
  endif
#endsnippet

#snippet DECISION_TREE
  #let tries = var3
  if Rnd <= 0.05
    Call Grab
  endif
  
  tries = 10
  Norm immediateTempVar TopNX TopNY
  Norm globTempVar OTopNX OTopNY
  immediateTempVar -= globTempVar
  Abs immediateTempVar
  if immediateTempVar < 40 && !(XDistLE 30)
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
  endif
  tries = 5
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
  tries = 5
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
#endsnippet

#snippet GROUND_HITSTUN_MOVES
  if LevelValue >= LV7
    movePart = 1
    $refreshMoves()
    $filterMoveHitFrame(9)
    $excludeMovesOrigin(fair|dair|nair|bair|uair)
    $excludeMovesNamed(fthrow|bthrow|dthrow|uthrow)
    $output(Call)
  endif
#endsnippet

#snippet COMBO_STARTERS
$refreshMoves()
$filterMoveHitFrame(10)
$filterMoveEndlag(10)
$output(Goto)
#let result = var2
MOVE_KB_WITHIN(result, move_currKnockback, move_angle, 45, 0, 60, 0, 60)
if Equal result 1
  Seek callMove
  Jump
endif
#endsnippet

#snippet KILL_MOVES
$refreshMoves()
$filterMoveHitFrame(20)
$filterMoveEndlag(20)
$output(Goto)
#let result = var2
KILL_CHECK(result, move_currKnockback, move_angle, OTopNX, OTopNY)
if Equal result 1
  Seek callMove
  Jump
endif
#endsnippet

#snippet NEUTRAL_MOVES
$refreshMoves()
$filterMoveHitFrame(10)
$filterMoveEndlag(10)
$filterMoveXMinMax(4, 20)
$output(Call)
#endsnippet