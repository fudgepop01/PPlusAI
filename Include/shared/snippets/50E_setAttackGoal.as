#snippet SELF_Y_ADJUST
  {SELF_Y_ADJUST_INNER}
#endsnippet

#snippet SELF_Y_ADJUST_INNER
  if AnimFrame < 3
    if TotalYSpeed > 0
      anotherTempVar = TotalYSpeed * globTempVar - Gravity * globTempVar * globTempVar
    else
      anotherTempVar = TotalYSpeed * globTempVar
    endif
    anotherTempVar += TopNY
  else
    EstYCoord anotherTempVar globTempVar
  endif
  if Equal CurrAction hex(0x21) || Equal AirGroundState 1
    anotherTempVar = TopNY
  endif
  goalY -= anotherTempVar
#endsnippet