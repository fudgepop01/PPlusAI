#snippet OFFENSIVE_OPTIONS
  movePart = 1
  if XDistLE 20 && Rnd < 0.7
    if Rnd < 0.7
      Call DSpecial
    else
      Call NAir
    endif
  elif XDistLE 40
    Call DAir
  elif !(Equal OPos Direction) && XDistLE 60
    Call BAir
  elif XDistLE 60
    Call NAir
  endif
#endsnippet