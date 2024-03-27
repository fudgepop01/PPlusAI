#snippet UNAFFECTED_Y_MOVES
  $ifLastList(dspecialair;uspecialair;sspecialair,false)
  else
    {UNAFFECTED_Y_MOVES_INNER}
  endif
#endsnippet

#snippet UNAFFECTED_X_MOVES
  $ifLastList(uspecialair;sspecialair,false)
  else
    {UNAFFECTED_X_MOVES_INNER}
  endif
#endsnippet