#snippet SSPECIAL
  #let distEst = var8
  distEst = 0
  label _SSPECIAL_EXEC
  Seek _SSPECIAL_EXEC
  if Equal CurrSubaction hex(0x1d7)
    immediateTempVar = OTopNX - TopNX

    if Equal AnimFrame 8
      distEst += 5
    endif
    globTempVar = 40 + distEst
    if !(Equal Direction OPos)
    elif immediateTempVar <= globTempVar
    else
      Button B
    endif
    Return
  elif Equal CurrSubaction hex(0x1dd)
    if AnimFrame >= 13
      Button X
      Seek finish
    endif
    Return
  elif Equal CurrSubaction hex(0x1d8)
    immediateTempVar = OTopNX - TopNX
    Abs immediateTempVar
    if !(Equal Direction OPos)
      if immediateTempVar <= 25
        scriptVariant = sv_wavedash_goal
        Button X
        CallI Wavedash
      else
        Button X
      endif
    elif immediateTempVar <= 25
      Button A
    elif AnimFrame >= 13
      Button X
    elif True
      if immediateTempVar <= 25
        Button X
        Seek _sspecial_part
        Return
        label _sspecial_part
        XGoto CalcAttackGoal
        Seek finish
        Jump
      endif
      if YDistFloor < 0
        Button X
        Seek finish
        Jump
      endif
      immediateTempVar = 25 * Direction
      GetYDistFloorOffset immediateTempVar immediateTempVar 10 0
      if Equal immediateTempVar -1
        scriptVariant = sv_wavedash_awayFromLedge
        Button X
        CallI Wavedash
      endif
    endif
    Return
  endif
#endsnippet

#snippet DSMASH_HIT2
  if Rnd < 0.5
    Button A
  endif
#endsnippet