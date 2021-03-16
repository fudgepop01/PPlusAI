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
  if Rnd < 0.8
    if ODamage > 80
      moveVariant = mv_sspecial_power
    endif
    Call SSpecial
  else
    Call Grab
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
        elif moveSelection < 40
          if Rnd < 0.3
            Call BAir
          endif
          Call FAir
        elif moveSelection < 65
          Call DashAttack
        elif moveSelection < 85
          Call Jab123
        else
          Call DTilt
        endif
      elif ODmgXWeight >= 50
        // LOGSTR str(">= 50")
        if moveSelection < 20
          Call Grab
        elif moveSelection < 45
          Call DashAttack
        elif moveSelection < 55
          Call Jab123
        elif moveSelection < 75
          Call FAir
        elif moveSelection < 80
          Call DTilt
        else
          Call UTilt
        endif
      elif True
        if moveSelection < 30
          Call Grab
        elif moveSelection < 50
          Call DashAttack
        elif moveSelection < 70
          Call Jab123
        elif moveSelection < 80
          if Rnd < 0.3
            Call BAir
          endif
          Call FAir
        else
          Call DTilt
        endif
      endif
    endif
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

#snippet HIGHUP_OPTIONS
  Call DAir
#endsnippet