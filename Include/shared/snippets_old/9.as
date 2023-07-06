#snippet AERIAL_THREATS
  if Rnd < 0.5
    ClearStick
    Button A
  else
    Button A
    Stick 1
  endif
#endsnippet

#snippet GROUND_ATTACKS
  if Rnd < 0.2
    Button A
    Stick 0 (-1)
  elif Rnd < 0.2
    Button A
    Stick 0.7 0
  else
    ClearStick
    Button A
  endif
#endsnippet

#snippet AERIAL_ATTACKS
  if Rnd < 0.5
    ClearStick
    Button A
  else
    Button A
    Stick 1
  endif
#endsnippet