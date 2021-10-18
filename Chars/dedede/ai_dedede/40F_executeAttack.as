#snippet SSPECIAL
  immediateTempVar = TopNY - OTopNY 
  if immediateTempVar < -20
    AbsStick OPos 1
  elif immediateTempVar > 8
    AbsStick OPos (-1)
  endif
#endsnippet

#snippet SSPECIALAIR
  immediateTempVar = TopNY - OTopNY 
  if immediateTempVar < -20
    AbsStick OPos 1
  elif immediateTempVar > 8
    AbsStick OPos (-1)
  endif
#endsnippet