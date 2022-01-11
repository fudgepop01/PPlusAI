#snippet SELF_Y_ADJUST
  {SELF_Y_ADJUST_INNER}
#endsnippet

#snippet SELF_Y_ADJUST_INNER
  if AnimFrame < 2
    if TotalYSpeed > 0
      anotherTempVar = TopNY + TotalYSpeed * globTempVar - Gravity * globTempVar * Gravity
    else
      anotherTempVar = TopNY + TotalYSpeed * globTempVar
    endif
  else
    EstYCoord anotherTempVar globTempVar
  endif
  goalY -= anotherTempVar
#endsnippet