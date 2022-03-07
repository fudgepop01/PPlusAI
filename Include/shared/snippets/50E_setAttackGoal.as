#snippet SELF_Y_ADJUST
  {SELF_Y_ADJUST_INNER}
#endsnippet

#snippet SELF_Y_ADJUST_INNER
  if AnimFrame < 2
    if TotalYSpeed > 0
      anotherTempVar = TopNY + TotalYSpeed * globTempVar - Gravity * globTempVar * globTempVar
    else
      anotherTempVar = TopNY + TotalYSpeed * globTempVar
    endif
  else
    EstYCoord anotherTempVar globTempVar
  endif
  if Equal CurrAction hex(0x21) || Equal AirGroundState 1
    anotherTempVar = TopNY
  endif
  LOGSTR str("GY")
  LOGVAL goalY
  LOGSTR str("ATVar")
  LOGVAL anotherTempVar
  PRINTLN
  goalY -= anotherTempVar
#endsnippet