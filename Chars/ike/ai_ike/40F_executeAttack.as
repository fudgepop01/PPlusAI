#snippet SSPECIAL
  #let distEst = var8
  distEst = 0
  label _SSPECIAL_EXEC

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
  elif Equal CurrSubaction hex(0x1d8)
    immediateTempVar = OTopNX - TopNX
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
        Seek
        Return
        label
        XGoto CalcAttackGoal
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
  endif
#endsnippet