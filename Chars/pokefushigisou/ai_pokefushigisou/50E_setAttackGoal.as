#snippet UNAFFECTED_Y_MOVES
  $ifLastOrigin(uspecialair,false)
  $ifLastOrigin(dspecialair,true)
  $ifLastOrigin(sspecialair,true)
  $ifLastOrigin(dair,true)
  $ifLastOrigin(uair,true)
  else
    {UNAFFECTED_Y_MOVES_INNER}
  endif
#endsnippet

#snippet UNAFFECTED_X_MOVES
  $ifLastOrigin(uspecialair,false)
  $ifLastOrigin(sspecialair,true)
  else
    {UNAFFECTED_X_MOVES_INNER}
  endif
#endsnippet