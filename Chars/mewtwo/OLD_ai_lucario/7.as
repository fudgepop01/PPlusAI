#snippet OFFENSIVE_OPTIONS
  if XDistLE 25
    Call DAir
  elif !(Equal OPos Direction) && XDistLE 50
    Call BAir
  elif XDistLE 50
    Call NAir
  endif
#endsnippet

#snippet SHIELDDROP_OPTIONS
  movePart = 0
  approachType = at_hover
  $pickRandMove(nair|bair|uair|fair, Call)
#endsnippet