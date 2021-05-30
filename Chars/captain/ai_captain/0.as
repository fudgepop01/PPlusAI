#snippet PRE_HOOKS
  // #let timer = var0
  // timer = 60

  // label
  // timer -= 1
  // if timer <= 0
  //   timer = 60
  //   if Equal OCurrAction hex(0x34)
  //     trackOAction man_approach op_grab
  //   elif OCurrAction >= hex(0x1A) && OCurrAction <= hex(0x21)
  //     trackOAction man_approach op_defend
  //   elif OAttacking
  //     trackOAction man_approach op_attack
  //   endif

  //   predictOOption var1 man_approach LevelValue
  //   if Equal var1 op_attack
  //     LOGSTR str("attack")
  //   elif Equal var1 op_defend
  //     LOGSTR str("defend")
  //   elif Equal var1 op_grab
  //     LOGSTR str("grab")
  //   else
  //     LOGSTR str("none")
  //   endif

  //   LOGSTR str("confidence")
  //   predictionConfidence var1 man_approach LevelValue
  //   LOGVAL var1
  // endif
  // Return
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
  elif Rnd < 0.3
    moveVariant = mv_nairHit2
    Call NAir
  elif Rnd < 0.3
    Call FTilt
  elif Rnd < 0.3
    Call DTilt
  else
    Call FSmash
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
  if LevelValue >= LV7 && Rnd < 0.2
    approachType = at_throwOut
    if XDistLE 10
      Call Jab123
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
$excludeMovesNotOrigin(nair|uair|fair|dair|dtilt|bair|grab|jab123)
$outputWithKnockbackThresholds(120, 290, Call)
#endsnippet

#snippet KILL_MOVES
$refreshMoves()
$filterMoveHitFrame(20)
// $filterMoveEndlag(20)
$excludeMovesOrigin(sspecial|utilt)
$outputWithKnockbackThresholds(200, 400, Call)
#endsnippet

#snippet NEUTRAL_MOVES
$refreshMoves()
$excludeMovesNotOrigin(fair|dair|nair|jab123|grab)
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