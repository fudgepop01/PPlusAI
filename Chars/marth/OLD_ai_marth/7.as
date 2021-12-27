#snippet OFFENSIVE_OPTIONS
  movePart = 1
  globTempVar = OTopNY - TopNY
  if XDistLE 20 && Rnd < 0.7 && globTempVar < 10
    Call DAir
  elif XDistLE 20 && globTempVar > 40
    Call UAir
  elif XDistLE 40
    Call NAir
  elif !(Equal OPos Direction) && XDistLE 60
    Call BAir
  else
    Call FAir
  endif
#endsnippet