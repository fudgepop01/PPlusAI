#snippet OFFENSIVE_OPTIONS
  if XDistLE 20
    Call DAir
  elif !(Equal OPos Direction) && XDistLE 40
    Call BAir
  elif XDistLE 40
    Call NAir
  endif
#endsnippet