#snippet PRE_HOOKS
  if Equal CurrAction hex(0x120)
    Button X
    Call ChrSpecific1 // mewtwo hover handler
  endif
#endsnippet

#snippet TECH_CHASE_OPTIONS
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

  if !(ODistLE 25) && Rnd < 0.3
    Call NSpecial
  endif
#endsnippet

#snippet MAIN_OPTIONS
  if OYDistBackEdge > -15
    moveSelection = Rnd * 105
    if moveSelection >= 100
      if moveSelection < 101
        Call DTilt
      elif moveSelection < 102
        Call FSmash
      elif moveSelection < 103
        approachType = at_hover
        moveVariant = mv_hc
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

      if ODmgXWeight >= 112
        if moveSelection < 20
          Call Grab
        elif moveSelection < 30
          Call FTilt
        elif moveSelection < 45 && !(XDistLE 20)
          Call NSpecial
        elif moveSelection < 60
          Call DTilt
        elif moveSelection < 85
          approachType = at_hover
          if !(ODistLE 40) && ODistLE 70
            approachType = 0
          endif
          Call FAir
        else
          approachType = at_hover
          moveVariant = mv_hc
          approachType = at_hover
          if !(ODistLE 40) && ODistLE 70
            approachType = 0
            moveVariant = 0
          endif
          Call NAir
        endif
      elif ODmgXWeight >= 50
        if moveSelection < 20
          Call Grab
        elif moveSelection < 30
          Call FTilt
        elif moveSelection < 50
          Call DTilt
        elif moveSelection < 65 && !(XDistLE 20)
          Call NSpecial
        elif moveSelection < 80
          approachType = at_hover
          if !(ODistLE 40) && ODistLE 70
            approachType = 0
          endif
          Call NAir
        else
          Call UTilt
        endif
      elif True
        if moveSelection < 30
          Call Grab
        elif moveSelection < 45 && !(XDistLE 20)
          Call NSpecial
        elif moveSelection < 75
          Call DTilt
        elif moveSelection < 90 && !(ODistLE 40) && ODistLE 70
          Call NAir              
        else
          approachType = at_hover
          Call NAir
        endif
      endif
      // LOGSTR str("none")
    endif
  endif
  if OYDistBackEdge <= -15
    if TopNY < OTopNY
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

#snippet HIGHUP_OPTIONS
  if Rnd < 0.4
    Call DAir
  elif Rnd < 0.2
    Call UAir
  elif Rnd < 0.3
    Call FAir
  else
    Call NAir
  endif
#endsnippet