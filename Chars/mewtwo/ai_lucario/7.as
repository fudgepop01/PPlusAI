#snippet OFFENSIVE_OPTIONS
  if XDistLE 25
    Call DAir
  elif !(Equal OPos Direction) && XDistLE 50
    Call BAir
  elif XDistLE 50
    Call NAir
  endif
#endsnippet