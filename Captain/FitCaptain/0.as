#snippet PRE_HOOKS
#endsnippet

#snippet HITSTUN_ENDS
  if Equal AirGroundState 1
    Stick -1
  elif Rnd < 0.3 && CanJump
    Button X
    if Rnd < 0.6
      movePart = 0
      Call DAir
    endif
  endif
#endsnippet

#snippet L_CANCEL
  var18 = 1
  var19 = 2
  Call Landing
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
  else
    moveVariant = mv_nairHit2
    Call NAir
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
  if !(XDistLE 20) && LevelValue >= LV7 && Rnd < 0.7
    approachType = at_throwOut
    Call NAir
  endif
#endsnippet

#snippet MAIN_OPTIONS
  if OYDistBackEdge > -15
    moveSelection = Rnd * 105
    // LOGSTR str("moveSel")
    // LOGVAL moveSelection
    // these moves are pretty much always relevant
    if moveSelection >= 100
      if moveSelection < 101
        Call FAir
      elif moveSelection < 102
        Call DAir
      elif moveSelection < 103
        if Rnd < 0.5
          moveVariant = mv_approachingNair
        endif
        Call NAir
      elif moveSelection < 104
        Call Grab
      else
        moveSelection = Rnd * 11 + 2
        Seek callers
        Jump
      endif
    else
      #let ODmgXWeight = var2

      GET_WEIGHT_TABLE(ODmgXWeight, var1)

      ODmgXWeight /= 100
      ODmgXWeight *= ODamage

      if ODmgXWeight >= 90
        // LOGSTR str(">= 90")
        if moveSelection < 30
          Call Grab
        elif moveSelection < 35
          globTempVar = OPos * XSpeed
          if !(Equal Direction OPos) && XDistLE 20 && globTempVar <= 0
            approachType = at_throwOut
            Call BAir
          endif
          Call NAir
        elif moveSelection < 50
          Call FAir
        elif moveSelection < 60
          Call Jab123
        else
          Call DAir
        endif
      elif ODmgXWeight >= 50
        // LOGSTR str(">= 50")
        if moveSelection < 30
          Call Grab
        elif moveSelection < 60
          globTempVar = OPos * XSpeed
          if !(Equal Direction OPos) && XDistLE 20 && globTempVar <= 0
            approachType = at_throwOut
            Call BAir
          endif
          moveVariant = mv_nairHit2
          Call NAir
        elif moveSelection < 80
          Call DAir
        endif
      elif True
        if moveSelection < 30
          Call Grab
        elif moveSelection < 80
          globTempVar = OPos * XSpeed
          if !(Equal Direction OPos) && XDistLE 20 && globTempVar <= 0
            approachType = at_throwOut
            Call BAir
          endif
          moveVariant = mv_nairHit2
          if Rnd < 0.5
            moveVariant = mv_approachingNair
          endif
          Call NAir
        else
          Call DAir
        endif
      endif
      // LOGSTR str("none")
    endif
  endif
  if OYDistBackEdge <= -15
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

#snippet HIGHUP_OPTIONS
  Call DAir
#endsnippet