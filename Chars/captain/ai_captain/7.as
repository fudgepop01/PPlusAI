#snippet OFFENSIVE_OPTIONS
  movePart = 1
  if XDistLE 25 && Rnd < 0.5
    Call DAir
  elif !(Equal OPos Direction) && XDistLE 50
    Call BAir
  elif XDistLE 50
    Call NAir
  endif
#endsnippet

#snippet SHIELDDROP_OPTIONS
  movePart = 1
  if Equal OPos Direction
    Call UAir
  else
    Call BAir
  endif
#endsnippet