#snippet SELF_Y_ADJUST
  $ifLastAttack(hover)
  $ifLastOrigin(uspecialair,true)
  $ifLastOrigin(sspecialair,true)
  elif True
    {SELF_Y_ADJUST_INNER}
  endif
#endsnippet

#snippet FASTFALL_CHECK
  $ifLastAttack(hover)
  $ifLastOrigin(uspecialair,true)
  $ifLastOrigin(sspecialair,true)
  elif True
    {FASTFALL_CHECK_INNER}
  endif
#endsnippet

#snippet SELF_X_ADJUST
  $ifLastAttack(hover)
  $ifLastOrigin(uspecialair,true)
  $ifLastOrigin(sspecialair,true)
  elif True
    {SELF_X_ADJUST_INNER}
  endif
#endsnippet

#snippet UNAFFECTED_Y_MOVES
  $ifLastAttack(hover)
  $ifLastOrigin(uspecialair,true)
  $ifLastOrigin(sspecialair,true)
#endsnippet