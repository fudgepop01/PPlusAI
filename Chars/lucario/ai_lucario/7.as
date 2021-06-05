#snippet OFFENSIVE_OPTIONS
  if XDistLE 20
    Call DAir
  elif !(Equal OPos Direction) && XDistLE 40
    Call BAir
  elif XDistLE 40
    Call NAir
  endif
#endsnippet

#snippet SHIELDDROP_OPTIONS
  movePart = 1
  if Rnd < 0.5 || !(Equal OPos Direction)
    Call UAir
  else
    Call FAir
  endif
#endsnippet