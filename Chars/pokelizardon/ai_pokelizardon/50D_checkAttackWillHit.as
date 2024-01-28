#snippet SELF_Y_ADJUST
  $ifLastOrigin(dspecialair,false)
  $ifLastOrigin(uspecialair,true)
  $ifLastOrigin(nspecialair,true)
  elif True
    {SELF_Y_ADJUST_INNER}
  endif
#endsnippet

#snippet FASTFALL_CHECK
  $ifLastOrigin(dspecialair,false)
  $ifLastOrigin(uspecialair,true)
  $ifLastOrigin(nspecialair,true)
  elif True
    {FASTFALL_CHECK_INNER}
  endif
#endsnippet

#snippet SELF_X_ADJUST
  $ifLastOrigin(uspecialair,false)
  elif True
    {SELF_X_ADJUST_INNER}
  endif
#endsnippet

#snippet UNAFFECTED_Y_MOVES
  $ifLastOrigin(dspecialair,false)
  $ifLastOrigin(uspecialair,true)
  $ifLastOrigin(nspecialair,true)
#endsnippet