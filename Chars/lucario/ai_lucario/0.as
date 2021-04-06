#snippet PRE_HOOKS
#endsnippet

#snippet HITSTUN_ENDS
  if Equal AirGroundState 1
    if Equal LevelValue LV9 && Damage < 50
      movePart = 1
      Call DTilt
    endif
    Stick -1
  elif Rnd < 0.3 && CanJump
    if Rnd < 0.6
      movePart = 0
      Call DAir
    else
      Button X
      Call FAir
    endif
  else
    Seek Hitstun_End
    Return
  endif
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
  if Rnd < 0.8 && !(Equal Direction OPos)
    Call BAir
  else
    Call FAir
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
$pickRandMove(dair|fair|dashattack|dtilt|jab123|utilt, Call)
#endsnippet

#snippet KILL_MOVES
$refreshMoves()
// $filterMoveHitFrame()
// $filterMoveEndlag(20)
// $excludeMovesOrigin()
$outputWithKnockbackThresholds(190, 400, Call)
#endsnippet

#snippet NEUTRAL_MOVES
if ODistLE 20
  movePart = 1
endif

$pickRandMove(dair|fair|dashattack|bair|dtilt|utilt, Call)
#endsnippet

#snippet HIGHUP_OPTIONS
  Call DAir
#endsnippet