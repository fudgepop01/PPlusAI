#snippet OFFENSIVE_OPTIONS
  movePart = 1
  if XDistLE 40
    Call DAir
  elif !(Equal OPos Direction) && XDistLE 60
    Call BAir
  elif XDistLE 60
    Call NAir
  endif
#endsnippet