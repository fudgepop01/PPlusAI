#snippet PRE_HOOKS
#endsnippet

#snippet L_CANCEL
  if !(Equal noCombo noComboVal) && YDistBackEdge < -5 && Equal HitboxConnected 1 && LevelValue >= LV5
    Call ComboHub
  elif CanJump && Rnd < 0.3 && LevelValue >= LV8
    Button X
    Return
  else
    var18 = 1
    var19 = 2
    Call Landing
  endif
#endsnippet

#snippet TECH_CHASE_OPTIONS
#endsnippet

#snippet O_ON_PLAT_ABOVE
  Call UAir
#endsnippet

#snippet WHIFF_PUNISH_OPTIONS
  if Rnd < 0.5
    if ODamage > 80
      moveVariant = mv_sspecial_power
    endif
    Call SSpecial
  elif Rnd < 0.5
    Call Grab
  else
    Call DashAttack
  endif
#endsnippet

#snippet DEFENSE_OPTIONS
  if Rnd < 0.65 && !(Equal Direction OPos)
    Call BAir
  elif Rnd < 0.3
    lastAttack = valShield
    Call DefendHub
  elif Rnd < 0.3
    Call FAir
  elif Rnd < 0.2
    Call DSmash
  elif Rnd < 0.2
    Call FSmash
  else
    Call DTilt
  endif
#endsnippet

#snippet PUNISH_KNOCKDOWN_OPTIONS
  if Equal AirGroundState 1 && Rnd < 0.3
    Call DTilt
  else
    Call DAir
  endif
#endsnippet

#snippet ADDITIONAL_PREMAIN_OPTIONS
  if !(XDistLE 20) && LevelValue >= LV7 && Rnd < 0.35
    approachType = at_throwOut
    if Equal Direction OPos
      Call FAir
    else
      Call BAir
    endif
  endif

  if !(ODistLE 25) && Rnd < 0.6
    Call NSpecial
  endif
#endsnippet

#snippet MAIN_OPTIONS
  if OYDistBackEdge > -20
    {DECISION_TREE}
  endif
  if OYDistBackEdge <= -20
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
      if Rnd < 0.05
        Call SSpecial
      elif Rnd < 0.5
        Call UAir
      else
        Call UTilt
      endif
    endif
  endif
#endsnippet

#snippet COMBO_STARTERS
// $refreshMoves()
// $filterMoveHitFrame()
// $filterMoveEndlag(20)
// $excludeMovesOrigin()
// $outputWithKnockbackThresholds(80, 170, Call)
if Rnd < 0.4 || ODmgXWeight > 100 && Rnd < 0.75
  Return
endif
$pickRandMove(dair|fair|dashattack|dtilt|utilt|sspecial|uthrow|dthrow, Call)
#endsnippet

#snippet KILL_MOVES
// $refreshMoves()
// $filterMoveHitFrame()
// $filterMoveEndlag(20)
// $excludeMovesOrigin()
// $outputWithKnockbackThresholds(150, 400, Call)
if Rnd < 0.5 || ODmgXWeight < 60
  Return
endif
$pickRandMove(usmash|dsmash|fsmash|uair|nair|bair|sspecial_power, Call)
#endsnippet

#snippet NEUTRAL_MOVES
if ODistLE 20
  movePart = 1
endif

$pickRandMove(fair|dashattack|dtilt|grab, Call)
#endsnippet

#snippet HIGHUP_OPTIONS
  Call DAir
#endsnippet